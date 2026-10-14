"""Expose GM map pickup through the existing loot path, retaining loot rules.

Only GM pickup skips the final tile-position test. Ordinary pickup bytes stay
unchanged. Copied functions retain their original Win64 unwind records; every
relative code/data reference is relocated. --check audits the complete build.
Dependencies: pefile, capstone, keystone-engine (--deps may supply them).
"""
from __future__ import annotations

import argparse
import hashlib
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / 'Server/S1001/x64/LogicServerCQ64_R.exe'
BASE = 0x140000000
ORIGINAL = 'db25163cbeb87623cd075f85189a5a0a2bdea6c71e20d57fa73f948f437b5456'
LENGTH = 5524992
SECTION = b'.gmpick\0'
HOOK = 0x340f9e
LOOT, LOOT_END = 0x1e1710, 0x1e1e85
RULES, RULES_END = 0x25bf00, 0x25c247
# Original metadata, used only to verify/replay an already installed build.
RESTORE = {270: struct.pack('<H', 11), 344: struct.pack('<I', 5812224),
           292: struct.pack('<I', 4582912), 424: struct.pack('<II', 5605872, 203724),
           968: bytes(40)}


def aligned(value, size):
    return (value + size - 1) // size * size


def assemble(text, address):
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    return bytes(Ks(KS_ARCH_X86, KS_MODE_64).asm(text, address)[0])


def decoder():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    md.detail = True
    return md


def clone(pe, start, end, target, calls=None):
    from capstone import CS_GRP_CALL, CS_GRP_JUMP
    from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_REG_RIP
    raw = pe.get_data(start, end-start)
    result = bytearray(raw)
    ops = list(decoder().disasm(raw, BASE+start))
    if sum(i.size for i in ops) != len(raw):
        raise ValueError('Incomplete native function decode')
    for i in ops:
        pos = i.address - BASE - start
        references = []
        if i.group(CS_GRP_CALL) or i.group(CS_GRP_JUMP):
            for op in i.operands:
                if op.type == X86_OP_IMM:
                    dest = op.imm - BASE
                    dest = (calls or {}).get(dest, dest)
                    if start <= dest < end:
                        dest = target + dest - start
                    references.append((i.imm_offset, i.imm_size, dest))
        for op in i.operands:
            if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
                dest = i.address + i.size + op.mem.disp - BASE
                if start <= dest < end:
                    dest = target + dest - start
                references.append((i.disp_offset, i.disp_size, dest))
        for offset, size, dest in references:
            delta = dest - (target + pos + i.size)
            result[pos+offset:pos+offset+size] = delta.to_bytes(size, 'little', signed=True)
    return bytes(result)


def callback(address, loot, rules):
    # No nonvolatile registers. Query mode returns itemID,moneyType,recog;
    # pickup mode resolves the saved recog BEFORE touching the drop pointer.
    return assemble(f'''
    sub rsp, 0x98
    mov [rsp+0x40], rcx
    mov qword ptr [rsp+0x58], 0
    mov edx, 1
    xor r8d, r8d
    call 0x1403c03c0
    test rax, rax
    jz invalid
    mov [rsp+0x48], rax
    cmp dword ptr [rax+0x114], 0
    jne invalid
    mov rcx, rax
    call 0x14000e2e0
    test al, al
    jz invalid
    mov rcx, [rsp+0x48]
    call 0x1400eb7e0
    test eax, eax
    jle invalid
    mov rcx, [rsp+0x40]
    mov edx, 2
    xor r8d, r8d
    call 0x1403c03c0
    test rax, rax
    jz invalid
    mov [rsp+0x50], rax
    mov rcx, [rsp+0x40]
    mov edx, 3
    xorpd xmm2, xmm2
    call 0x1403c0210
    cvttsd2si rax, xmm0
    cvtsi2sd xmm1, rax
    ucomisd xmm0, xmm1
    jp invalid
    jne invalid
    test rax, rax
    js invalid
    mov edx, 0xffffffff
    cmp rax, rdx
    ja invalid
    mov [rsp+0x58], rax
    test eax, eax
    jz query_handle
    mov edx, 3
    shl rdx, 32
    or rax, rdx
    jmp resolve
    query_handle:
    mov rax, [rsp+0x50]
    mov rax, [rax+0x110]
    mov rdx, rax
    shr rdx, 32
    cmp edx, 3
    jne invalid
    resolve:
    mov [rsp+0x60], rax
    call 0x14000dec0
    mov rcx, rax
    call 0x14000df00
    mov rcx, rax
    lea rdx, [rsp+0x60]
    call 0x14004c340
    test rax, rax
    jz invalid
    cmp rax, [rsp+0x50]
    jne invalid
    mov rcx, rax
    call 0x14000e2e0
    test al, al
    jz invalid
    mov rax, [rsp+0x48]
    mov rax, [rax+0x100]
    test rax, rax
    jz invalid
    mov rdx, [rsp+0x50]
    cmp rax, [rdx+0x100]
    jne invalid
    cmp qword ptr [rsp+0x58], 0
    jne pickup
    mov rcx, rdx
    call 0x1401e4d80
    cmp eax, 255
    jne checked_type
    mov eax, -1
    checked_type:
    cmp eax, -1
    jl invalid
    cmp eax, 9
    jge invalid
    mov [rsp+0x78], eax
    mov rcx, [rsp+0x50]
    call 0x1401e4d60
    test rax, rax
    jz money
    movzx eax, word ptr [rax+8]
    jmp metadata
    money:
    cmp dword ptr [rsp+0x78], 0
    jl invalid
    xor eax, eax
    metadata:
    cvtsi2sd xmm1, eax
    mov rcx, [rsp+0x40]
    call 0x1403ab760
    mov eax, [rsp+0x78]
    cvtsi2sd xmm1, eax
    mov rcx, [rsp+0x40]
    call 0x1403ab760
    mov eax, [rsp+0x60]
    cvtsi2sd xmm1, rax
    mov rcx, [rsp+0x40]
    call 0x1403ab760
    mov eax, 3
    jmp done
    pickup:
    mov rcx, [rsp+0x50]
    mov rdx, [rsp+0x48]
    call {BASE+rules:#x}
    test eax, eax
    jnz invalid
    mov rcx, [rsp+0x48]
    call 0x1401e4cd0
    mov rcx, rax
    mov edx, [rsp+0x58]
    call {BASE+loot:#x}
    call 0x14000dec0
    mov rcx, rax
    call 0x14000df00
    mov rcx, rax
    lea rdx, [rsp+0x60]
    call 0x14004c340
    test rax, rax
    jz success
    mov rcx, rax
    call 0x14000e2e0
    test al, al
    jnz invalid
    success:
    mov edx, 1
    jmp boolean
    invalid:
    xor edx, edx
    boolean:
    mov rcx, [rsp+0x40]
    call 0x1403ab9c0
    mov eax, 1
    done:
    add rsp, 0x98
    ret
    ''', address)


def registration(address, api, name):
    from capstone.x86 import X86_OP_MEM, X86_REG_RIP
    raw = bytearray(assemble('''
    sub rsp, 0x38
    mov [rsp+0x28], rcx
    call 0x1403c1250
    mov rcx, [rsp+0x28]
    lea r8, [rip]
    lea rdx, [rip]
    call 0x1403c1250
    add rsp, 0x38
    ret
    ''', address))
    targets = iter([api, name])
    for i in decoder().disasm(raw, address):
        if any(o.type == X86_OP_MEM and o.mem.base == X86_REG_RIP for o in i.operands):
            pos = i.address-address+i.disp_offset
            raw[pos:pos+4] = struct.pack('<i', BASE+next(targets)-i.address-i.size)
    return bytes(raw)


def patch(source):
    import pefile
    pe = pefile.PE(data=source)
    if any(s.Name == SECTION for s in pe.sections):
        old = bytearray(source[:LENGTH])
        for offset, raw in RESTORE.items():
            old[offset:offset+len(raw)] = raw
        off = pe.get_offset_from_rva(HOOK)
        old[off:off+5] = b'\xe8'+struct.pack('<i', 0x3c1250-HOOK-5)
        if hashlib.sha256(old).hexdigest() != ORIGINAL or build(bytes(old)) != source:
            raise ValueError('Installed GM pickup differs from the supported build')
        return source
    if hashlib.sha256(source).hexdigest() != ORIGINAL:
        raise ValueError('Unsupported logic server; no bytes written')
    result = build(source)
    if patch(result) != result:
        raise ValueError('GM pickup patch is not idempotent')
    return result


def build(source):
    import pefile
    pe = pefile.PE(data=source)
    rva = aligned(pe.sections[-1].VirtualAddress+pe.sections[-1].Misc_VirtualSize,
                  pe.OPTIONAL_HEADER.SectionAlignment)
    raw = aligned(len(source), pe.OPTIONAL_HEADER.FileAlignment)
    # Fixed offsets keep the supported build deterministic and easy to audit.
    reg, api, rules, loot, name = rva, rva+0x100, rva+0x500, rva+0x900, rva+0x1100
    reg_code = registration(BASE+reg, api, name)
    api_code = callback(BASE+api, loot, rules)
    if len(reg_code)>0x100 or len(api_code)>0x400:
        raise ValueError('GM helper exceeds reserved space')
    rules_code = bytearray(clone(pe, RULES, RULES_END, rules))
    # Return success only after expiration, wait, owner and camp checks.
    pos = 0x25c0a0-RULES
    rules_code[pos:pos+10] = b'\x31\xc0\xe9'+struct.pack('<i', 0x25c23f-0x25c0a7)+b'\x90'*3
    loot_code = clone(pe, LOOT, LOOT_END, loot, {RULES:rules})
    payload = bytearray(0x1110)
    for start, code in [(reg,reg_code),(api,api_code),(rules,rules_code),
                        (loot,loot_code),(name,b'gmDropPickup\0')]:
        payload[start-rva:start-rva+len(code)] = code
    directory = pe.OPTIONAL_HEADER.DATA_DIRECTORY[3]
    pdata = pe.get_data(directory.VirtualAddress, directory.Size)
    records = list(struct.iter_unpack('<III', pdata))
    originals = {b:(e,u) for b,e,u in records}
    def unwind(code):
        offset = aligned(len(payload), 4)
        payload.extend(bytes(offset-len(payload))+code)
        return rva+offset
    for start,end,target in [(RULES,RULES_END,rules),(LOOT,LOOT_END,loot)]:
        e,u = originals[start]
        header = pe.get_data(u,4)
        if e!=end or header[0]!=1:
            raise ValueError('Unexpected original unwind flags/function span')
        size = 4+aligned(header[2],2)*2
        records.append((target,target+end-start,unwind(pe.get_data(u,size))))
    records.append((reg,reg+len(reg_code),unwind(bytes.fromhex('01 04 01 00 04 62 00 00'))))
    records.append((api,api+len(api_code),unwind(bytes.fromhex('01 07 02 00 07 01 13 00'))))
    pdata_offset = aligned(len(payload),4)
    payload.extend(bytes(pdata_offset-len(payload)))
    for record in sorted(records):payload.extend(struct.pack('<III',*record))
    size = aligned(len(payload),pe.OPTIONAL_HEADER.FileAlignment)
    output = bytearray(source+bytes(raw-len(source))+payload+bytes(size-len(payload)))
    header = pe.sections[-1].get_file_offset()+40
    if header!=968 or header+40>pe.sections[0].PointerToRawData or any(source[header:header+40]):
        raise ValueError('No spare section header')
    output[header:header+40] = struct.pack('<8sIIIIIIHHI',SECTION,len(payload),rva,size,raw,0,0,0,0,0x60000020)
    struct.pack_into('<H',output,270,pe.FILE_HEADER.NumberOfSections+1)
    struct.pack_into('<I',output,344,aligned(rva+len(payload),pe.OPTIONAL_HEADER.SectionAlignment))
    struct.pack_into('<I',output,292,pe.OPTIONAL_HEADER.SizeOfCode+size)
    struct.pack_into('<II',output,424,rva+pdata_offset,len(records)*12)
    off = pe.get_offset_from_rva(HOOK)
    if source[off:off+5]!=b'\xe8'+struct.pack('<i',0x3c1250-HOOK-5):
        raise ValueError('Actor API registration call changed')
    output[off:off+5] = b'\xe8'+struct.pack('<i',reg-HOOK-5)
    return bytes(output)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--deps',type=Path)
    parser.add_argument('--source',type=Path,default=SERVER)
    parser.add_argument('--output',type=Path)
    parser.add_argument('--check',action='store_true')
    args=parser.parse_args()
    if args.deps:sys.path.insert(0,str(args.deps))
    source=args.source.read_bytes(); result=patch(source)
    if args.check:
        if result!=source:raise ValueError('GM pickup is not installed')
    elif result!=source or args.output:
        (args.output or args.source).write_bytes(result)
    print('GM原生拾取入口核对通过')


if __name__=='__main__':main()
