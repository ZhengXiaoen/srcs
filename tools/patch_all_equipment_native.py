"""Preserve equipment instance attributes and wear one unit with the same GUID.

The input includes the tested mount/wing patch. Both overlap variants share
the extra instance checks; the template variant builds the engine's default
item on its stack. Ordinary/hero wear keeps the selected GUID, allocates the
remainder before validation, changes the count only at the commit point and
returns the remainder after the original ownership and notification path.
Magic-item wear uses the same allocation/rollback rule. No live service runs.
REA addresses are tied to SOURCE_HASH; --check rebuilds the entire patch.
"""
from __future__ import annotations

import argparse
import hashlib
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / 'Server/S1001/x64/LogicServerCQ64_R.exe'
SOURCE_HASH = '75056b342d771238fd95a66f01c2181c3e56a2b89e17c2cc99dd6ccd73a53935'
LEGACY_HASHES = {'8b9c988a2691ceee1b7d9eda714050d30aec7bcb6aded8b849460e45cfa6db76',
                 '57697100cc107f9c8d275fbeaed3be480010c8eb24aafd7fb7c98d6957f82954'}
MARKER = b'ALLEQUIPSTACK1\0\0\0'
BASE = 0x140000000
HOOKS = {0x2a8bd4: bytes.fromhex('e8f7010000'),
         0x2a8d22: bytes.fromhex('e8a9000000'),
         0x283a30: bytes.fromhex('4c894c2420'),
         0x28435b: bytes.fromhex('488954c808'),
         0x1e7370: bytes.fromhex('4889542410'),
         0x2849d0: bytes.fromhex('44884c2420'),
         0x1e77b0: bytes.fromhex('4889542410'),
         0x2a905e: bytes.fromhex('e8ddfbffff')}


def asm(source, rva):
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    return bytes(Ks(KS_ARCH_X86, KS_MODE_64).asm(source, BASE+rva)[0])


def equipment_test(register, yes, no):
    return f'''
        cmp {register},1
        jb {no}
        cmp {register},92
        jbe {yes}
        cmp {register},115
        je {yes}
        cmp {register},120
        jb {no}
        cmp {register},130
        jbe {yes}
        cmp {register},201
        jb {no}
        cmp {register},205
        jbe {yes}
        jmp {no}
    '''


def attributes(rva):
    # RCX/RDX: actual item pointers; R8: their common standard definition.
    code = '''
        sub rsp,0x78
        mov [rsp+0x40],rcx
        mov [rsp+0x48],rdx
        mov [rsp+0x50],r8
        movzx eax,byte ptr [r8+0x30]
    ''' + equipment_test('eax', 'equipment', 'equal') + '''
        equipment:
        cmp eax,4
        jbe soul
        cmp eax,6
        jb properties
        cmp eax,9
        ja properties
        soul:
        cmp dword ptr [rcx+0x25],0
        jne different
        cmp dword ptr [rdx+0x25],0
        jne different
        properties:
        mov eax,[rcx+0x25]
        cmp eax,[rdx+0x25]
        jne different
        mov dword ptr [rsp+0x58],2
        next_property:
        xor ecx,ecx
        mov rdx,[rsp+0x40]
        mov r8d,[rsp+0x58]
        lea r9,[rsp+0x60]
        call 0x140328660
        mov [rsp+0x68],eax
        xor ecx,ecx
        mov rdx,[rsp+0x48]
        mov r8d,[rsp+0x58]
        lea r9,[rsp+0x64]
        call 0x140328660
        cmp dword ptr [rsp+0x58],4
        jne compare
        and eax,7
        and dword ptr [rsp+0x68],7
        compare:
        cmp eax,[rsp+0x68]
        jne different
        mov eax,[rsp+0x60]
        cmp eax,[rsp+0x64]
        jne different
        inc dword ptr [rsp+0x58]
        cmp dword ptr [rsp+0x58],44
        jb next_property
        mov r8,[rsp+0x50]
        cmp byte ptr [r8+0x30],120
        jne equal
        mov r10,[rsp+0x40]
        mov r11,[rsp+0x48]
        xor ecx,ecx
        rune:
        mov al,[r10+rcx+0x67]
        cmp al,[r11+rcx+0x67]
        jne different
        test al,al
        jz next_rune
        movss xmm0,[r10+rcx+0x68]
        ucomiss xmm0,[r11+rcx+0x68]
        jp different
        jne different
        next_rune:
        add ecx,5
        cmp ecx,25
        jb rune
        equal:
        xor eax,eax
        add rsp,0x78
        ret
        different:
        mov eax,1
        add rsp,0x78
        ret
    '''
    return asm(code, rva)


def overlap(rva, shared, template=False):
    frame = 0x138 if template else 0x78
    code = f'''
        sub rsp,{frame}
        mov [rsp+0x40],rcx
        mov [rsp+0x48],r8
        mov rax,[rsp+{frame+0x60 if template else frame+0x68}]
        mov [rsp+0x50],rax
        call 0x1402a8dd0
        test eax,eax
        jnz done
    '''
    if template:
        # The type loaded into EAX is not a comparison result. Non-equipment
        # templates must return the equality already established above.
        code += '''
            mov r8,[rsp+0x48]
            movzx eax,byte ptr [r8+0x30]
        ''' + equipment_test('eax', 'prepare', 'equal') + '''
            equal:
            xor eax,eax
            jmp done
            prepare:
            lea r10,[rsp+0x80]
            xor eax,eax
        '''
        for offset in range(0, 0x80, 8):
            code += f'mov [r10+{offset}],rax\n'
        code += '''
            mov byte ptr [r10+0x80],0
            mov r11,[rsp+0x50]
            mov ax,[r11+2]
            mov [r10+8],ax
            mov ax,[r11]
            mov [r10+0xa],ax
            mov al,[r11+4]
            mov [r10+0x2e],al
            mov al,[r11+0x1c]
            mov [r10+0xc],al
            mov al,[r11+0x1d]
            mov [r10+0x35],al
            mov al,[r11+0x1e]
            mov [r10+0x34],al
            movzx eax,byte ptr [r11+0x1f]
            mov [r10+0x38],eax
            mov al,[r11+0x20]
            mov [r10+0x3c],al
            mov al,[r11+0x22]
            mov [r10+0x62],al
            mov rcx,r10
            mov rdx,[rsp+0x48]
            call 0x1402aa9b0
            mov r11,[rsp+0x50]
            mov eax,[r11+8]
            test eax,eax
            jle attack
            mov [rsp+0x9d],eax
            attack:
            mov eax,[r11+0xc]
            test eax,eax
            jle generated
            mov [rsp+0xa1],eax
            generated:
            mov r8,[rsp+0x48]
            cmp byte ptr [r8+0x44],0
            je properties_ready
            mov eax,[r11+0x14]
            test eax,eax
            jle properties_ready
            mov [rsp+0xa9],eax
            properties_ready:
            mov r10,[rsp+0x40]
            mov eax,[r10+0x19]
            mov [rsp+0x99],eax
            lea rdx,[rsp+0x80]
        '''
    else:
        code += 'mov rdx,[rsp+0x50]\n'
    code += f'''
        mov rcx,[rsp+0x40]
        mov r8,[rsp+0x48]
        call {BASE+shared}
        done:
        add rsp,{frame}
        ret
    '''
    return asm(code, rva)


def wear(rva, original, magic=False):
    # Allocate first; no failed validation or allocation consumes any unit.
    code = '''
        sub rsp,0xf8
        mov [rsp+0x40],rcx
        mov [rsp+0x48],rdx
        mov [rsp+0x50],r8
        mov [rsp+0x58],r9
        mov rax,[rsp+0x120]
        mov [rsp+0x60],rax
        mov qword ptr [rsp+0x78],0
    '''
    if magic:
        code += 'mov rcx,[rcx+8]\n'
    else:
        code += 'mov rcx,rdx\n'
    code += '''
        call 0x14002e670
        mov [rsp+0x70],rax
    '''
    code += ('mov rdx,[rsp+0x48]\n' if magic else 'mov rdx,[rsp+0x50]\n')
    code += '''
        test rdx,rdx
        jz invoke
        mov rdx,[rdx]
        mov rcx,[rsp+0x70]
        call 0x1402a85c0
        test rax,rax
        jz invoke
        mov [rsp+0x68],rax
        movzx edx,byte ptr [rax+0x80]
        shl edx,8
        mov dl,[rax+0x2d]
        mov [rsp+0x80],rdx
        test edx,edx
        jz fail
        cmp edx,1
        je invoke
        call 0x14000e7b0
        mov rcx,rax
        call 0x140014a90
        mov rcx,rax
        call 0x140021970
        mov rdx,[rsp+0x68]
        movzx edx,word ptr [rdx+8]
        mov rcx,rax
        call 0x140021920
        test rax,rax
        jz invoke
        mov [rsp+0x88],rax
        mov rcx,[rsp+0x70]
        call 0x1400b9730
        test rax,rax
        jg allocate
    '''
    if magic:
        code += '''
            mov rax,[rsp+0x40]
            cmp qword ptr [rax+0x60],0
            jne full
        '''
    else:
        code += '''
            mov rcx,[rsp+0x88]
            movzx ecx,byte ptr [rcx+0x30]
            xor edx,edx
            call 0x140285c80
            test rax,rax
            js invoke
            mov [rsp+0x90],rax
            mov rcx,[rsp+0x88]
            movzx ecx,byte ptr [rcx+0x30]
            mov edx,1
            call 0x140285c80
            mov rdx,[rsp+0x90]
            mov rcx,[rsp+0x40]
            cmp rax,rdx
            je first
            cmp qword ptr [rsp+0x60],0
            je first
            cmp qword ptr [rsp+0x60],1
            je second
            cmp qword ptr [rcx+rdx*8+8],0
            je allocate
            second:
            mov rdx,rax
            first:
            cmp qword ptr [rcx+rdx*8+8],0
            jne full
        '''
    code += '''
        allocate:
        call 0x14000e7b0
        mov rcx,rax
        call 0x14002ef70
        mov rcx,rax
        mov edx,1
        xor r8d,r8d
        xor r9d,r9d
        call 0x1400a1060
        test rax,rax
        jz fail
        mov [rsp+0x78],rax
        mov r10,[rsp+0x68]
    '''
    for offset in range(8, 0x80, 8):
        code += f'mov rdx,[r10+{offset}]\nmov [rax+{offset}],rdx\n'
    code += '''
        mov rdx,[rsp+0x80]
        dec edx
        mov [rax+0x2d],dl
        shr edx,8
        mov [rax+0x80],dl
    '''
    if magic:
        code += 'mov byte ptr [r10+0x2d],1\nmov byte ptr [r10+0x80],0\n'
    code += f'''
        invoke:
        mov rcx,[rsp+0x40]
        mov rdx,[rsp+0x48]
        mov r8,[rsp+0x50]
        mov r9,[rsp+0x58]
        mov rax,[rsp+0x60]
        mov [rsp+0x20],rax
        call {BASE+original}
        mov [rsp+0x98],rax
        cmp qword ptr [rsp+0x78],0
        je done
        test al,al
        jz cleanup
        mov rcx,[rsp+0x70]
        mov rdx,[rsp+0x78]
        xor r8d,r8d
        mov r9d,3
        mov qword ptr [rsp+0x20],1
        mov qword ptr [rsp+0x28],0
        mov qword ptr [rsp+0x30],0
        mov qword ptr [rsp+0x38],1
        call 0x1402a71e0
        mov rdx,[rsp+0x80]
        dec rdx
        cmp rax,rdx
        je done
        mov rcx,[rsp+0x70]
        lea rdx,[rsp+0x78]
        call 0x140293130
        mov rcx,[rsp+0x70]
        mov rax,[rcx]
        mov rdx,[rsp+0x88]
        mov r10,[rsp+0x78]
        movzx r8d,byte ptr [r10+0x80]
        shl r8d,8
        mov r8b,[r10+0x2d]
        mov r9d,3
        mov [rsp+0x20],r10
        call qword ptr [rax+0x40]
        jmp done
        cleanup:
    '''
    if magic:
        code += '''
            mov r10,[rsp+0x68]
            mov edx,[rsp+0x80]
            mov [r10+0x2d],dl
            shr edx,8
            mov [r10+0x80],dl
        '''
    code += '''
        call 0x14000dec0
        mov rcx,rax
        mov rdx,[rsp+0x78]
        xor r8d,r8d
        xor r9d,r9d
        call 0x1400a1460
        done:
        mov rax,[rsp+0x98]
        add rsp,0xf8
        ret
        full:
    '''
    code += ('mov rcx,[rsp+0x40]\nmov rcx,[rcx+8]\n' if magic else 'mov rcx,[rsp+0x48]\n')
    code += '''
        mov edx,0x56
        mov r8d,1
        call 0x1402300e0
        fail:
        xor eax,eax
        add rsp,0xf8
        ret
    '''
    return asm(code, rva)


def align(value, boundary):
    return (value+boundary-1)//boundary*boundary


def actual_add_overlap(rva):
    # AddUserItem constructs a reduced ItemOPParam before merging. Its known
    # AddOverlapItem call frame still owns the complete source pointer. Compare
    # that instance while retaining the original quantity and notification path.
    # Other callers are template rewards and continue through the template check.
    return asm('''
        mov rax,[rsp+0x80]
        mov r10,0x1402a7681
        cmp rax,r10
        jne template
        mov rdx,[rsp+0x220]
        jmp 0x1402a8ae0
        template:
        jmp 0x1402a8c40
    ''',rva)


def takeoff(rva, magic=False):
    # The original unequip path reads the item after AddUserItem can free it.
    # Add a separate carrier, keep the equipped item alive through its callbacks,
    # then release it. A rejected add leaves the equipped instance untouched.
    code='''
        sub rsp,0xf8
        mov [rsp+0x40],rcx
        mov [rsp+0x48],rdx
        mov [rsp+0x50],r8
        mov [rsp+0x58],r9
        mov rax,[rsp+0x120]
        mov [rsp+0x60],rax
        mov qword ptr [rsp+0x78],0
    '''
    if magic:
        code+='mov r8,rdx\nmov [rsp+0x50],r8\nmov rdx,[rcx+8]\nmov [rsp+0x48],rdx\n'
    code+='''
        test rdx,rdx
        jz fail
        test r8,r8
        jz fail
        movzx edx,word ptr [r8+8]
        mov [rsp+0x68],rdx
        call 0x14000e7b0
        mov rcx,rax
        call 0x140014a90
        mov rcx,rax
        call 0x140021970
        mov rcx,rax
        mov rdx,[rsp+0x68]
        call 0x140021920
        test rax,rax
        jz fail
        mov [rsp+0x88],rax
        movzx ecx,byte ptr [rax+0x30]
    '''
    if magic:
        code+='cmp ecx,115\njne fail\nmov qword ptr [rsp+0x58],1\nmov qword ptr [rsp+0x90],0x35a\n'
    else:
        code+='''
            cmp byte ptr [rsp+0x60],0
            jne hero
            cmp ecx,1
            jb fail
            cmp ecx,92
            ja fail
            cmp ecx,13
            je fail
            mov qword ptr [rsp+0x90],4
            jmp valid
            hero:
            cmp ecx,200
            jb fail
            cmp ecx,206
            ja fail
            mov qword ptr [rsp+0x90],0x2a2
            valid:
            cmp byte ptr [rsp+0x58],0
            je notify
        '''
    code+='''
        mov r10,[rsp+0x50]
        movzx edx,byte ptr [r10+0x80]
        shl edx,8
        mov dl,[r10+0x2d]
        test edx,edx
        jz fail
        mov [rsp+0x80],rdx
        cmp edx,9999
        ja fail
        cmp edx,1
        je reserve
        mov rcx,[rsp+0x48]
        call 0x14002e670
        mov rcx,rax
        call 0x1400b9730
        test rax,rax
        jle fail
        reserve:
        call 0x14000e7b0
        mov rcx,rax
        call 0x14002ef70
        mov rcx,rax
        mov edx,1
        xor r8d,r8d
        xor r9d,r9d
        call 0x1400a1060
        test rax,rax
        jz fail
        mov [rsp+0x78],rax
        mov r10,[rsp+0x50]
    '''
    for offset in range(8,0x80,8):
        code+=f'mov rdx,[r10+{offset}]\nmov [rax+{offset}],rdx\n'
    code+='''
        mov dl,[r10+0x80]
        mov [rax+0x80],dl
        mov byte ptr [rax+0x33],0
        mov rcx,[rsp+0x48]
        call 0x1402528e0
        mov [rsp+0x98],rax
        mov rcx,[rsp+0x48]
        call 0x14002e670
        mov rcx,rax
        mov rdx,[rsp+0x78]
        mov r8,[rsp+0x98]
        mov r9,[rsp+0x90]
        mov qword ptr [rsp+0x20],1
        mov qword ptr [rsp+0x28],0
        mov qword ptr [rsp+0x30],0
        mov qword ptr [rsp+0x38],1
        call 0x1402a71e0
        cmp rax,[rsp+0x80]
        jne cleanup
        notify:
    '''
    if magic:
        code+='''
            mov rcx,[rsp+0x40]
            mov rdx,[rsp+0x50]
            xor r8d,r8d
            call 0x1401e8090
            mov rcx,[rsp+0x40]
            mov edx,1
            call 0x14016d9f0
            mov rcx,[rsp+0x48]
            xor edx,edx
            call 0x140080900
            mov rcx,[rsp+0x48]
            mov edx,1
            call 0x140080900
        '''
    else:
        code+='''
            mov r8,[rsp+0x50]
            mov byte ptr [r8+0x33],0
            mov rcx,[rsp+0x40]
            mov rdx,[rsp+0x48]
            mov rax,[rcx]
            call qword ptr [rax+8]
        '''
    code+='''
        cmp qword ptr [rsp+0x78],0
        je success
        call 0x14000dec0
        mov rcx,rax
        mov rdx,[rsp+0x50]
        xor r8d,r8d
        xor r9d,r9d
        call 0x1400a1460
        success:
        mov eax,1
        add rsp,0xf8
        ret
        cleanup:
        call 0x14000dec0
        mov rcx,rax
        mov rdx,[rsp+0x78]
        xor r8d,r8d
        xor r9d,r9d
        call 0x1400a1460
        fail:
        xor eax,eax
        add rsp,0xf8
        ret
    '''
    return asm(code,rva)


def restore(source):
    import pefile
    pos = source.find(MARKER)
    if pos < 0 or source.find(MARKER, pos+1) >= 0:
        raise ValueError('Unsupported equipment engine fingerprint')
    length = struct.unpack_from('<Q', source, pos+len(MARKER))[0]
    result = bytearray(source[:length])
    result[:1024] = source[pos+len(MARKER)+8:pos+len(MARKER)+8+1024]
    pe = pefile.PE(data=result)
    tail = pe.sections[-1]
    padding = tail.PointerToRawData+align(tail.Misc_VirtualSize,16)
    result[padding:] = b'\0'*(length-padding)
    for rva, before in HOOKS.items():
        off = pe.get_offset_from_rva(rva)
        result[off:off+len(before)] = before
    if hashlib.sha256(result).hexdigest() != SOURCE_HASH:
        raise ValueError('Equipment patch source or unrelated code changed')
    return bytes(result)


def patch(source):
    import pefile
    if hashlib.sha256(source).hexdigest() != SOURCE_HASH:
        original = restore(source)
        result = patch(original)
        if result != source and hashlib.sha256(source).hexdigest() not in LEGACY_HASHES:
            raise ValueError('Installed equipment patch differs from its complete rebuild')
        return result
    pe = pefile.PE(data=source)
    section = pe.sections[-1]
    if not section.Characteristics & 0x20000000 or section.PointerToRawData+section.SizeOfRawData != len(source):
        raise ValueError('Expected final executable section without overlay')
    offset = align(section.Misc_VirtualSize, 16)
    if any(source[section.PointerToRawData+offset:]):
        raise ValueError('Expected zero final-section padding')
    header = MARKER+struct.pack('<Q', len(source))+source[:1024]
    begin = align(offset+len(header),16)
    addresses = [section.VirtualAddress+begin+i*0x1000 for i in range(11)]
    shared, explicit, template, standard, magic, standard_inner, magic_inner, commit,off,magic_off,actual_add = addresses
    chunks = [attributes(shared), overlap(explicit,shared), overlap(template,shared,True),
              wear(standard,standard_inner), wear(magic,magic_inner,True),
              HOOKS[0x283a30]+asm(f'jmp {BASE+0x283a35}',standard_inner+5),
              HOOKS[0x1e7370]+asm(f'jmp {BASE+0x1e7375}',magic_inner+5),
              asm(f'mov byte ptr [rdx+0x2d],1\nmov byte ptr [rdx+0x80],0\n'
                  f'mov [rax+rcx*8+8],rdx\njmp {BASE+0x284360}',commit),takeoff(off),takeoff(magic_off,True),actual_add_overlap(actual_add)]
    if any(len(code)>=0x1000 for code in chunks):
        raise ValueError('Helper exceeded its reserved space')
    directory = pe.OPTIONAL_HEADER.DATA_DIRECTORY[3]
    pdata = pe.get_data(directory.VirtualAddress,directory.Size)
    std_record = next(pdata[i:i+12] for i in range(0,len(pdata),12)
                      if struct.unpack_from('<I',pdata,i)[0]==0x283a30)
    unwinds = [bytes.fromhex('0104010004e20000')]*2 + [bytes.fromhex('0107020007012700')]
    unwinds += [bytes.fromhex('0107020007011f00')]*2
    unwinds += [bytes.fromhex('01000000')]*2+[bytes.fromhex('21000000')+std_record]
    unwinds += [bytes.fromhex('0107020007011f00')]*2
    unwinds += [bytes.fromhex('01000000')]
    payload = bytearray(header+b'\0'*(begin-offset-len(header))+b'\0'*0xb000)
    records = []
    for rva,code,unwind in zip(addresses,chunks,unwinds):
        local = rva-section.VirtualAddress-offset
        payload[local:local+len(code)] = code
        unwind_rva = section.VirtualAddress+offset+len(payload)
        payload.extend(unwind)
        records.append(struct.pack('<III',rva,rva+len(code),unwind_rva))
    table_rva = section.VirtualAddress+offset+len(payload)
    payload.extend(pdata+b''.join(records))
    virtual_size = offset+len(payload)
    size = align(virtual_size,pe.OPTIONAL_HEADER.FileAlignment)
    result = bytearray(source+b'\0'*(section.PointerToRawData+size-len(source)))
    result[section.PointerToRawData+offset:section.PointerToRawData+offset+len(payload)] = payload
    struct.pack_into('<I',result,section.get_field_absolute_offset('Misc_VirtualSize'),virtual_size)
    struct.pack_into('<I',result,section.get_field_absolute_offset('SizeOfRawData'),size)
    for field,value in [('SizeOfImage',align(section.VirtualAddress+virtual_size,pe.OPTIONAL_HEADER.SectionAlignment)),
                        ('SizeOfCode',pe.OPTIONAL_HEADER.SizeOfCode+size-section.SizeOfRawData)]:
        struct.pack_into('<I',result,pe.OPTIONAL_HEADER.get_field_absolute_offset(field),value)
    struct.pack_into('<II',result,directory.get_file_offset(),table_rva,len(pdata)+12*len(records))
    targets = {0x2a8bd4:explicit,0x2a8d22:template,0x283a30:standard,0x1e7370:magic,
               0x28435b:commit,0x2849d0:off,0x1e77b0:magic_off,0x2a905e:actual_add}
    for rva,target in targets.items():
        off = pe.get_offset_from_rva(rva)
        if source[off:off+5] != HOOKS[rva]:
            raise ValueError(f'Unexpected native equipment instruction at {rva:x}')
        op = b'\xe8' if rva in (0x2a8bd4,0x2a8d22,0x2a905e) else b'\xe9'
        result[off:off+5] = op+struct.pack('<i',target-rva-5)
    result = bytes(result)
    if restore(result) != source:
        raise ValueError('Patch restoration changed unrelated bytes')
    return result


def equipment_package(source, result, previous=None):
    import base64
    from patch_gear_stack_native import install_package
    original = source if hashlib.sha256(source).hexdigest()==SOURCE_HASH else restore(source)
    package = install_package(original,result)
    versions = {}
    if previous:
        if previous['sourceSha256'] != SOURCE_HASH:
            raise ValueError('Equipment package has a different base')
        prior = bytearray(original+b'\0'*(previous['targetLength']-len(original)))
        for edit in previous['edits']:
            after = base64.b64decode(edit['after'])
            prior[edit['offset']:edit['offset']+len(after)] = after
        prior_hash = hashlib.sha256(prior).hexdigest()
        if prior_hash != previous['targetSha256'] or restore(bytes(prior)) != original:
            raise ValueError('Equipment package failed complete reconstruction')
        if prior_hash in LEGACY_HASHES:
            versions[prior_hash] = bytes(prior)
        for candidate in previous.get('upgrades', []):
            if candidate['sourceSha256'] not in LEGACY_HASHES or candidate['targetSha256'] != prior_hash:
                continue
            replay = bytearray(prior[:candidate['sourceLength']])
            for edit in candidate['edits']:
                before = base64.b64decode(edit['before'])
                replay[edit['offset']:edit['offset']+len(before)] = before
            if hashlib.sha256(replay).hexdigest() != candidate['sourceSha256'] or restore(bytes(replay)) != original:
                raise ValueError('Legacy equipment upgrade failed complete reconstruction')
            versions[candidate['sourceSha256']] = bytes(replay)
    if hashlib.sha256(source).hexdigest() in LEGACY_HASHES:
        versions[hashlib.sha256(source).hexdigest()] = source
    if versions:
        package['upgrades'] = [install_package(version,result) for version in versions.values()]
    return package


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--deps',type=Path)
    parser.add_argument('--source',type=Path,default=SERVER)
    parser.add_argument('--output',type=Path)
    parser.add_argument('--package',type=Path)
    parser.add_argument('--check',action='store_true')
    args = parser.parse_args()
    if args.deps: sys.path.insert(0,str(args.deps))
    source = args.source.read_bytes()
    result = patch(source)
    if args.check and result != source: raise ValueError('Equipment patch is missing')
    if args.output: args.output.write_bytes(result)
    if args.package:
        import json
        previous = json.loads(args.package.read_text(encoding='utf-8')) if args.package.exists() else None
        package = equipment_package(source,result,previous)
        args.package.write_text(json.dumps(package,indent=2)+'\n',encoding='utf-8')
    if not args.check and not args.output and not args.package:
        raise ValueError('Select --check, --output or --package')
    print('全部装备堆叠补丁核对通过：',hashlib.sha256(result).hexdigest())
