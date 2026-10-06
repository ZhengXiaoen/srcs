"""Restrict both warrior equipment rate passes to health and physical/magic defense.

The first pass scales a temporary base-attribute copy, so clear every field other
than 5,21,23,25,27 in that copy. The second pass selects the matching array indexes
0,8,9,10,11. Equipment's fixed attributes and generic actor rates stay intact.
Install after the previous defense correction to support existing installations.
"""

import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from patch_jingji_mount_consumption import aligned, package
from patch_warrior_defense_rate import CONDITION_RVA, NEW as PREVIOUS_GATE

ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / 'Server/S1001/x64/LogicServerCQ64_R.exe'
PACKAGE = SERVER.with_name('warrior-survival-rate.patch.json')
SOURCE_HASH = 'e488082232483a670aeae0e5944432131ac080f00dd3da50cd80b19ae3b7e08f'
BASE = 0x140000000
SECTION = b'.wjsurv'
CALL = 0x1D3205
SCALAR = 0x1F4C0
GATE = bytes.fromhex('83 bc 24 b8 0c 00 00 00 74 16 '
                     '83 bc 24 b8 0c 00 00 08 72 77') + b'\x90' * 12


def helper(address):
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    asm = '''
    sub rsp, 0x28
    mov [rsp+0x20], rcx
    call 0x14001f4c0
    mov r10, [rsp+0x20]
    xor ecx, ecx
    next_field:
    cmp ecx, 5
    je keep_field
    cmp ecx, 21
    je keep_field
    cmp ecx, 23
    je keep_field
    cmp ecx, 25
    je keep_field
    cmp ecx, 27
    je keep_field
    mov dword ptr [r10+rcx*4], 0
    keep_field:
    inc ecx
    cmp ecx, 0xbf
    jb next_field
    mov rax, r10
    add rsp, 0x28
    ret
    '''
    return bytes(Ks(KS_ARCH_X86, KS_MODE_64).asm(asm, address)[0])


def patch(source):
    import pefile
    pe = pefile.PE(data=source)
    existing = [s for s in pe.sections if s.Name.rstrip(b'\0') == SECTION]
    if existing:
        rva = existing[0].VirtualAddress
        if (pe.get_data(rva, len(helper(BASE+rva))) != helper(BASE+rva) or
            pe.get_data(CONDITION_RVA, len(GATE)) != GATE or
            pe.get_data(CALL, 5) != b'\xe8'+struct.pack('<i', rva-CALL-5)):
            raise ValueError('Unexpected warrior survival rate patch')
        return source
    if hashlib.sha256(source).hexdigest() != SOURCE_HASH:
        raise ValueError('Unsupported server version; no bytes written')
    if (pe.get_data(CONDITION_RVA, len(GATE)) != PREVIOUS_GATE or
        pe.get_data(CALL, 5) != b'\xe8'+struct.pack('<i', SCALAR-CALL-5)):
        raise ValueError('Unexpected warrior rate calculation')
    rva = aligned(pe.sections[-1].VirtualAddress+pe.sections[-1].Misc_VirtualSize,
                  pe.OPTIONAL_HEADER.SectionAlignment)
    raw = aligned(len(source), pe.OPTIONAL_HEADER.FileAlignment)
    code = helper(BASE+rva)
    unwind_offset = aligned(len(code), 4)
    payload = code+b'\0'*(unwind_offset-len(code))+bytes.fromhex('01 04 01 00 04 42 00 00')
    size = aligned(len(payload), pe.OPTIONAL_HEADER.FileAlignment)
    directory = pe.OPTIONAL_HEADER.DATA_DIRECTORY[3]
    pdata = pe.get_data(directory.VirtualAddress, directory.Size)
    pdata_section = pe.get_section_by_rva(directory.VirtualAddress)
    pdata_end = pe.get_offset_from_rva(directory.VirtualAddress)+directory.Size
    header = pe.sections[-1].get_file_offset()+40
    if (len(pdata)%12 or pdata_end+12 > pdata_section.PointerToRawData+pdata_section.SizeOfRawData or
        any(source[pdata_end:pdata_end+12]) or header+40 > pe.sections[0].PointerToRawData or
        any(source[header:header+40])):
        raise ValueError('No room for warrior helper metadata')
    result = bytearray(source+b'\0'*(raw-len(source))+payload+b'\0'*(size-len(payload)))
    result[header:header+40] = struct.pack('<8sIIIIIIHHI', SECTION,len(payload),rva,size,raw,0,0,0,0,0x60000020)
    struct.pack_into('<H',result,pe.FILE_HEADER.get_field_absolute_offset('NumberOfSections'),pe.FILE_HEADER.NumberOfSections+1)
    struct.pack_into('<I',result,pe.OPTIONAL_HEADER.get_field_absolute_offset('SizeOfImage'),aligned(rva+len(payload),pe.OPTIONAL_HEADER.SectionAlignment))
    struct.pack_into('<I',result,pe.OPTIONAL_HEADER.get_field_absolute_offset('SizeOfCode'),pe.OPTIONAL_HEADER.SizeOfCode+size)
    struct.pack_into('<II',result,directory.get_file_offset(),directory.VirtualAddress,len(pdata)+12)
    struct.pack_into('<III',result,pdata_end,rva,rva+len(code),rva+unwind_offset)
    offset=pe.get_offset_from_rva(CONDITION_RVA)
    result[offset:offset+len(GATE)]=GATE
    offset=pe.get_offset_from_rva(CALL)
    result[offset:offset+5]=b'\xe8'+struct.pack('<i',rva-CALL-5)
    result=bytes(result)
    if patch(result)!=result:
        raise ValueError('Survival rate patch is not idempotent')
    return result


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--deps',type=Path)
    parser.add_argument('--source',type=Path,default=SERVER)
    args=parser.parse_args()
    if args.deps:sys.path.insert(0,str(args.deps))
    source=args.source.read_bytes()
    if hashlib.sha256(source).hexdigest()!=SOURCE_HASH:
        raise ValueError('Generate package from the previous supported version')
    result=patch(source)
    PACKAGE.write_text(json.dumps(package(source,result),indent=2)+'\n',encoding='utf-8')
    print('Warrior health and defense rate package generated')


if __name__=='__main__':main()
