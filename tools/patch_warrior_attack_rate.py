"""Restore all six warrior attacks with one rate pass over the accumulated value.

The survival patch excludes attacks from the initial base-rate pass. Keep that
behavior, then select both ends of each attack in the later pass and remove its
extra config-base addition. Health and defense retain their existing behavior.
Use spare bytes in .wjsurv for a leaf call; generic actor operators stay intact.
"""

import argparse
import base64
import hashlib
import json
from pathlib import Path
import struct
import sys

from patch_jingji_mount_consumption import aligned, package
from patch_warrior_survival_rate import BASE, GATE as OLD_GATE, SECTION, SERVER
from patch_warrior_defense_rate import CONDITION_RVA

PACKAGE = SERVER.with_name('warrior-attack-rate.patch.json')
SOURCE_HASH = '955d9f074891cdb132f48e5fc6a4498b3d18295b3b3de9d15850bd5f2759348a'


def helper(address):
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    # The call pushes a return address: all original frame offsets are +8.
    asm = '''
    mov eax, [rsp+0xcc0]
    cmp eax, 1
    je skip_mana
    cmp eax, 2
    jb apply_rate
    cmp eax, 7
    ja apply_rate
    movsxd rax, dword ptr [rsp+rax*4+0xc70]
    mov rcx, [rsp+0xce0]
    mov eax, [rcx+rax*4+0x44]
    mov [rsp+0xca4], eax
    apply_rate:
    xor eax, eax
    ret
    skip_mana:
    mov eax, 1
    ret
    '''
    return bytes(Ks(KS_ARCH_X86, KS_MODE_64).asm(asm, address)[0])


def restore_package(result, description):
    data = bytearray(result)
    for edit in reversed(description['edits']):
        before = base64.b64decode(edit['before'])
        data[edit['offset']:edit['offset']+len(before)] = before
    data = bytes(data[:description['sourceLength']])
    if hashlib.sha256(data).hexdigest() != description['sourceSha256']:
        raise ValueError('Restored patch source does not match')
    return data


def patch(source):
    import pefile
    if hashlib.sha256(source).hexdigest() != SOURCE_HASH:
        if PACKAGE.exists():
            description = json.loads(PACKAGE.read_text(encoding='utf-8'))
            if hashlib.sha256(source).hexdigest() == description['targetSha256']:
                return source
        raise ValueError('Unsupported server version; no bytes written')
    pe = pefile.PE(data=source)
    section = next(s for s in pe.sections if s.Name.rstrip(b'\0') == SECTION)
    if pe.get_data(CONDITION_RVA, len(OLD_GATE)) != OLD_GATE:
        raise ValueError('Unexpected warrior survival gate')
    relative = aligned(section.Misc_VirtualSize, 4)
    rva = section.VirtualAddress + relative
    code = helper(BASE+rva)
    unwind = relative + aligned(len(code), 4)
    payload = code + b'\0'*(unwind-relative-len(code)) + bytes.fromhex('01 00 00 00')
    offset = section.PointerToRawData + relative
    directory = pe.OPTIONAL_HEADER.DATA_DIRECTORY[3]
    pdata_end = pe.get_offset_from_rva(directory.VirtualAddress) + directory.Size
    pdata_section = pe.get_section_by_rva(directory.VirtualAddress)
    if (relative+len(payload) > section.SizeOfRawData or any(source[offset:offset+len(payload)]) or
        directory.Size%12 or pdata_end+12 > pdata_section.PointerToRawData+pdata_section.SizeOfRawData or
        any(source[pdata_end:pdata_end+12])):
        raise ValueError('No spare space for warrior attack helper')
    result = bytearray(source)
    result[offset:offset+len(payload)] = payload
    struct.pack_into('<I', result, section.get_file_offset()+8, relative+len(payload))
    struct.pack_into('<II', result, directory.get_file_offset(), directory.VirtualAddress, directory.Size+12)
    struct.pack_into('<III', result, pdata_end, rva, rva+len(code), section.VirtualAddress+unwind)
    # Apply every array field except mana. Helper removes the extra base only
    # for attacks. test/jnz retains the original apply and skip destinations.
    # Skip is 0x1d361c, from the end of jnz at CONDITION_RVA+9: +130.
    # Use a near conditional jump because +130 exceeds the short range.
    gate = b'\xe8'+struct.pack('<i', rva-CONDITION_RVA-5)+bytes.fromhex('85 c0 0f 85')
    gate += struct.pack('<i', 0x1D361C-(CONDITION_RVA+13))
    gate += b'\x90'*(len(OLD_GATE)-len(gate))
    offset = pe.get_offset_from_rva(CONDITION_RVA)
    result[offset:offset+len(gate)] = gate
    return bytes(result)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--deps', type=Path)
    args = parser.parse_args()
    if args.deps: sys.path.insert(0, str(args.deps))
    source = SERVER.read_bytes()
    if PACKAGE.exists():
        description = json.loads(PACKAGE.read_text(encoding='utf-8'))
        if hashlib.sha256(source).hexdigest() == description['targetSha256']:
            source = restore_package(source, description)
    result = patch(source)
    PACKAGE.write_text(json.dumps(package(source, result), indent=2)+'\n', encoding='utf-8')
    print('Warrior attack minimum/maximum single-rate package generated')


if __name__ == '__main__': main()
