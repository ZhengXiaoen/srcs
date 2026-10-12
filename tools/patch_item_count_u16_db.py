"""Read-only DB item-count patch candidate generation and machine-code tests.

Import has no side effects and requires only the Python standard library.
Generation requires pefile, keystone-engine, and capstone; tests also require
unicorn. No function writes an executable, connects to MySQL, or starts a server.
Addresses and expected bytes apply only to the fingerprint documented below.
"""
from copy import deepcopy
from pathlib import Path
import hashlib
import struct

EXPECTED_SHA256 = "65b3af8ffd7eec48f3e2f97d29d9212f383d2c42ac09923007bec7cab60bfaff"
SPECS=[
 dict(name='SaveItemsByCount',site=0x42a11,resume=0x42a33,low=0x47c,high=0x4f0,value=0x460,kind='save',old='480fbe84247c0400004825ff0000000fb6c04825ffff00000fb7c089842460040000'),
 dict(name='QueryItems',site=0x43b25,resume=0x43b4a,low=0x9c,high=0x110,value=0x80,wordtemp=0x70,kind='load',old='48638424800000004825ffff000066894424700fb74424704825ff0000008884249c000000'),
 dict(name='InsertItemsToGuildDepotDb',site=0x2b5bc,resume=0x2b5de,low=0x49c,high=0x510,value=0x468,kind='save',old='480fbe84249c0400004825ff0000000fb6c04825ffff00000fb7c089842468040000'),
 dict(name='LoadGuildDepoyFromDb',site=0x2c788,resume=0x2c7a7,low=0x7c,high=0xf0,value=0x68,wordtemp=0x54,kind='load',old='48634424684825ffff000066894424540fb74424544825ff0000008844247c'),
 dict(name='SaveConsignmentItem',site=0x39cc5,resume=0x39cce,low=0x4bc,high=0x530,kind='consign_save',old='440fbe8424bc040000'),
 dict(name='LoadConsignmentItem',site=0x3a834,resume=0x3a855,low=0xcc,high=0x140,value=0x70,row=0x68,sqlcol=0x88,scanf_iat=0x7c498,fmt=0x7ccb8,kind='consign_load',old='4c8d8424cc000000488d1575240400488b442468488b8888000000ff15431c0400'),
]


def candidate_specs():
    """Return independent dictionaries; callers may assign their own cave RVAs."""
    return deepcopy(SPECS)


def _assembler():
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    ks = Ks(KS_ARCH_X86, KS_MODE_64)
    return lambda source, address: bytes(ks.asm(source, address)[0])


def build_trampoline(spec, cave_va, image_base, assemble=None):
    """Return code for caller-selected cave VA without changing any file.

    Code contains relative branches and must be regenerated if its cave moves.
    The assembly callback accepts (source, virtual_address) and returns bytes.
    """
    assemble = assemble or _assembler()
    s = spec
    resume = image_base + s['resume']
    low, high = s['low'], s['high']
    if s['kind'] == 'save':
        body = (f"movzx eax, byte ptr [rsp+{high}]; shl eax,8; "
                f"mov al,byte ptr [rsp+{low}]; "
                f"mov dword ptr [rsp+{s['value']}],eax; "
                "and eax,255")
    elif s['kind'] == 'load':
        body = (f"movzx eax,word ptr [rsp+{s['value']}]; "
                f"mov word ptr [rsp+{s['wordtemp']}],ax; "
                f"mov byte ptr [rsp+{low}],al; shr eax,8; "
                f"mov byte ptr [rsp+{high}],al; "
                f"movzx eax,byte ptr [rsp+{low}]; and eax,255")
    elif s['kind'] == 'consign_save':
        body = (f"movzx r8d,byte ptr [rsp+{high}]; "
                "lea r8d,[r8d*8]; lea r8d,[r8d*8]; lea r8d,[r8d*4]; "
                f"mov r8b,byte ptr [rsp+{low}]")
    elif s['kind'] == 'consign_load':
        parts, address = [], cave_va
        for source in [f"lea r8,[rsp+{s['value']}]"]:
            code = assemble(source, address); parts.append(code); address += len(code)
        code = assemble(f"lea rdx,[rip+{image_base+s['fmt']-(address+7)}]", address)
        if len(code) != 7:
            raise ValueError("RIP-relative LEA has unexpected width")
        parts.append(code); address += len(code)
        code = assemble(f"mov rax,qword ptr [rsp+{s['row']}]; "
                        f"mov rcx,qword ptr [rax+{s['sqlcol']}]", address)
        parts.append(code); address += len(code)
        code = assemble(f"call qword ptr [rip+{image_base+s['scanf_iat']-(address+6)}]", address)
        if len(code) != 6:
            raise ValueError("RIP-relative CALL has unexpected width")
        parts.append(code); address += len(code)
        # sscanf receives a four-byte scratch slot. Original durability at
        # CUserItem+0x0d..0x0f is not used as the numeric output buffer.
        suffix = (f"movzx r8d,byte ptr [rsp+{s['value']}]; "
                  f"mov byte ptr [rsp+{low}],r8b; "
                  f"movzx r8d,byte ptr [rsp+{s['value']+1}]; "
                  f"mov byte ptr [rsp+{high}],r8b; jmp {resume}")
        return b''.join(parts) + assemble(suffix, address)
    else:
        raise ValueError("Unknown candidate kind")
    return assemble(body + f"; jmp {resume}", cave_va)


def generate_candidates(binary_path, cave_rva, cave_stride=0x100):
    """Read and fingerprint an EXE, returning candidate code in a dictionary."""
    import pefile
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    data = Path(binary_path).read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    if digest != EXPECTED_SHA256:
        raise ValueError("DB binary fingerprint mismatch")
    pe = pefile.PE(data=data)
    base = pe.OPTIONAL_HEADER.ImageBase
    assemble, disasm = _assembler(), Cs(CS_ARCH_X86, CS_MODE_64)
    specs = candidate_specs()
    if cave_rva < pe.OPTIONAL_HEADER.SizeOfImage:
        raise ValueError("Candidates require caller-owned future executable space")
    for index, s in enumerate(specs):
        if pe.get_data(s['site'], s['resume']-s['site']).hex() != s['old']:
            raise ValueError("Expected original instruction bytes do not match")
        cave_va = base+cave_rva+index*cave_stride
        code = build_trampoline(s, cave_va, base, assemble)
        if len(code) > cave_stride:
            raise ValueError("Cave stride does not fit generated trampoline")
        jump = assemble(f"jmp {cave_va}", base+s['site'])
        if len(jump) != 5:
            raise ValueError("Patch jump must be rel32")
        s['cave_rva'] = cave_va-base
        s['patch'] = (jump+b'\x90'*(s['resume']-s['site']-5)).hex()
        s['trampoline'] = code.hex()
        s['assembly'] = [f"{i.address-base:x}: {i.mnemonic} {i.op_str}" for i in disasm.disasm(code,cave_va)]
    return dict(status='OFFLINE_CANDIDATE_ONLY', sha256=digest,
                image_base=base, specs=specs,
                storage='count high8 at CUserItem+0x80; persisted in initsmith bit8..15; original low8 unchanged')


def test_candidates(binary_path, cave_rva=0xe0000):
    """Emulate original/modified fragments; return results, never write files."""
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as r
    report = generate_candidates(binary_path, cave_rva)
    pe = pefile.PE(data=Path(binary_path).read_bytes())
    base = pe.OPTIONAL_HEADER.ImageBase
    mapped = pe.get_memory_mapped_image()
    regs = [getattr(r,'UC_X86_REG_'+name) for name in
            ('RAX','RBX','RCX','RDX','RSI','RDI','RBP','R8','R9','R10','R11','R12','R13','R14','R15')]
    stack, sp = 0x70000000, 0x70004000
    row, sqltext = stack+0xa000, stack+0xb000
    mock = base+cave_rva+0x10000
    memory_size = ((mock-base+0x1000+0xfff)//0x1000)*0x1000
    flags_mask = 0x8c5

    def emulate(s, old_low, high, patched):
        uc = Uc(UC_ARCH_X86, UC_MODE_64)
        uc.mem_map(base,memory_size); uc.mem_write(base,mapped)
        uc.mem_map(stack,0x10000)
        for idx,reg in enumerate(regs): uc.reg_write(reg,0x33330000+idx*0x1111)
        uc.reg_write(r.UC_X86_REG_RSP,sp); uc.reg_write(r.UC_X86_REG_EFLAGS,0x202|flags_mask)
        uc.mem_write(sp,bytes((i*37+19)%256 for i in range(0x1000)))
        packed = old_low|(high<<8)
        uc.mem_write(sp+s['low'],bytes([old_low])); uc.mem_write(sp+s['high'],bytes([high]))
        if s['kind'] in ('load','consign_load'): uc.mem_write(sp+s['value'],struct.pack('<I',packed))
        if s['kind']=='consign_load':
            uc.mem_write(sp+s['row'],struct.pack('<Q',row))
            uc.mem_write(row+s['sqlcol'],struct.pack('<Q',sqltext))
            uc.mem_write(sqltext,str(packed).encode()+b'\0')
            uc.mem_write(base+s['scanf_iat'],struct.pack('<Q',mock)); uc.mem_write(mock,b'\xc3')
            def hook(machine,address,size,user):
                if address==mock:
                    assert machine.reg_read(r.UC_X86_REG_RCX)==sqltext
                    assert machine.reg_read(r.UC_X86_REG_RDX)==base+s['fmt']
                    machine.mem_write(machine.reg_read(r.UC_X86_REG_R8),struct.pack('<I',packed))
                    machine.reg_write(r.UC_X86_REG_RAX,1)
            uc.hook_add(UC_HOOK_CODE,hook)
        if patched:
            uc.mem_write(base+s['site'],bytes.fromhex(s['patch']))
            uc.mem_write(base+s['cave_rva'],bytes.fromhex(s['trampoline']))
        before = bytes(uc.mem_read(sp,0x1000))
        uc.emu_start(base+s['site'],base+s['resume'],count=150)
        after = bytes(uc.mem_read(sp,0x1000))
        state = {reg:uc.reg_read(reg) for reg in regs}
        state['flags'] = uc.reg_read(r.UC_X86_REG_EFLAGS)
        state['rsp'] = uc.reg_read(r.UC_X86_REG_RSP)
        return before,after,state

    results, vectors = [], 0
    for s in report['specs']:
        for count in (0,1,255,256,9999,65535):
            for old_low in (0,1,127,128,200,255):
                high = count>>8
                original_before,original_after,original = emulate(s,old_low,high,False)
                before,after,patched = emulate(s,old_low,high,True)
                assert before==original_before and patched['rsp']==sp
                allowed, allowed_regs = [], set()
                if s['kind']=='save':
                    value = int.from_bytes(after[s['value']:s['value']+4],'little')
                    assert value==old_low|(high<<8)
                    allowed.extend(range(s['value'],s['value']+4)); allowed_regs.add(r.UC_X86_REG_RAX)
                    assert patched[r.UC_X86_REG_RAX]==old_low
                elif s['kind']=='load':
                    assert after[s['low']]==old_low and after[s['high']]==high
                    allowed.append(s['high']); assert patched[r.UC_X86_REG_RAX]==old_low
                elif s['kind']=='consign_save':
                    assert patched[r.UC_X86_REG_R8]==old_low|(high<<8); allowed_regs.add(r.UC_X86_REG_R8)
                else:
                    assert after[s['low']]==old_low and after[s['high']]==high
                    assert after[s['low']+1:s['low']+4]==before[s['low']+1:s['low']+4]
                    assert patched[r.UC_X86_REG_RAX]==1
                    allowed.extend(range(s['value'],s['value']+4)); allowed.extend(range(s['low'],s['low']+4)); allowed.append(s['high'])
                    allowed_regs.add(r.UC_X86_REG_R8)
                assert all(a==b or i in allowed for i,(a,b) in enumerate(zip(original_after,after))),s['name']
                for reg in regs:
                    if reg not in allowed_regs: assert patched[reg]==original[reg],(s['name'],reg)
                if s['kind']!='consign_load': assert patched['flags']&flags_mask==original['flags']&flags_mask
                vectors += 1
        results.append(dict(name=s['name'],tests=36,status='passed'))
    return dict(test_vectors=vectors, results=results,
                coverage='local instruction fragments, mocked sscanf, preserved adjacent durability; no DB or server executed')


def schema_preflight_sql(schema='cq_actor'):
    """Return read-only preflight queries; caller decides how to execute them."""
    if not schema.replace('_','').isalnum(): raise ValueError('Invalid schema name')
    tables = ('actorbagitem','actorequipitem','actordepotitem','actorconsignment','useritem',
              'actorpetitem','actordmkjitem','actormagicitem','guildstore')
    queries = [f"SELECT TABLE_NAME,COLUMN_TYPE,DATA_TYPE,IS_NULLABLE FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='{schema}' AND COLUMN_NAME='initsmith' ORDER BY TABLE_NAME;"]
    for table in tables:
        queries.append(f"SELECT '{table}' AS table_name,COUNT(*) AS total,MIN(initsmith) AS lo,MAX(initsmith) AS hi,SUM(COALESCE(initsmith,0)<>(COALESCE(initsmith,0)&255)) AS unexpected_high_or_negative FROM `{schema}`.`{table}`;")
    for name in ('loadcharitems','loadguildstoredata','loadconsignmentext'):
        queries.append(f"SHOW CREATE PROCEDURE `{schema}`.`{name}`;")
    return queries
