"""Count successfully purchased mount pills in the native upgrade operation.

Wrap only ClientUpgradeRide's ChangeMoney call. Preserve all nine arguments
and its original result, then convert the successful debit at the configured
mount-pill price. Real pills are counted by the preceding consumption patch.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from patch_jingji_mount_consumption import BASE, ROOT, SERVER, aligned, package

SOURCE_HASH = '4e17c5083c62f36cf739ecd72aa4ba168558b53e73b10b80e99ad3dfe0b08d40'
SECTION = b'.jjbuy'
CALL = 0x1dac66
CHANGE_MONEY = 0x22eda0


def helper(address):
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    # 0x40..0x1c7 is CScriptValueList. Windows x64 ABI, nonvolatile
    # registers unchanged; stack arguments retain flags and log description.
    asm = '''
    sub rsp, 0x218
    mov [rsp+0x1d0], rcx
    mov [rsp+0x1d8], rdx
    mov [rsp+0x1e0], r8
    mov [rsp+0x1e8], r9
    mov rax, [rsp+0x240]
    mov [rsp+0x20], rax
    mov rax, [rsp+0x248]
    mov [rsp+0x28], rax
    mov rax, [rsp+0x250]
    mov [rsp+0x30], rax
    mov rax, [rsp+0x258]
    mov [rsp+0x38], rax
    mov rax, [rsp+0x260]
    mov [rsp+0x40], rax
    call 0x14022eda0
    mov [rsp+0x1f8], rax
    test al, al
    jz done
    cmp qword ptr [rsp+0x1d8], 3
    jne done
    cmp qword ptr [rsp+0x1e0], 0
    jge done
    call 0x14000e7b0
    mov rcx, rax
    call 0x140014a90
    mov rcx, rax
    call 0x1401de400
    movsxd rcx, dword ptr [rax+0x118]
    test rcx, rcx
    jle done
    mov rax, [rsp+0x1e0]
    neg rax
    xor edx, edx
    div rcx
    test rdx, rdx
    jnz done
    test rax, rax
    jz done
    mov [rsp+0x1f0], rax
    lea rcx, [rsp+0x40]
    call 0x14002e4a0
    mov rdx, [rsp+0x1d0]
    lea rcx, [rsp+0x40]
    call 0x140270110
    mov edx, 8
    lea rcx, [rsp+0x40]
    call 0x14002d370
    mov edx, [rsp+0x1f0]
    lea rcx, [rsp+0x40]
    call 0x14002d370
    call 0x14000dec0
    mov rcx, rax
    call 0x14002ed90
    mov rcx, rax
    call 0x14002e740
    mov qword ptr [rsp+0x20], -1
    lea r9, [rsp+0x40]
    lea r8, [rsp+0x40]
    lea rdx, [rip+handler_name]
    mov rcx, rax
    call 0x14033b440
    lea rcx, [rsp+0x40]
    call 0x14002e530
    done:
    mov rax, [rsp+0x1f8]
    add rsp, 0x218
    ret
    handler_name:
    '''
    code = bytes(Ks(KS_ARCH_X86, KS_MODE_64).asm(asm, address)[0])
    return code, code + b'HandleAddNewRankCount\0'


def patch(source):
    import pefile
    pe = pefile.PE(data=source)
    existing = [s for s in pe.sections if s.Name.rstrip(b'\0') == SECTION]
    if existing:
        section = existing[0]
        _, payload = helper(BASE + section.VirtualAddress)
        if pe.get_data(section.VirtualAddress, len(payload)) != payload:
            raise ValueError('Unexpected mount-yuanbao helper')
        if pe.get_data(CALL, 5) != b'\xe8' + struct.pack('<i', section.VirtualAddress - CALL - 5):
            raise ValueError('Mount-yuanbao hook missing')
        return source
    if hashlib.sha256(source).hexdigest() != SOURCE_HASH:
        raise ValueError('Unsupported server version; no bytes written')
    if pe.get_data(CALL, 5) != b'\xe8' + struct.pack('<i', CHANGE_MONEY - CALL - 5):
        raise ValueError('Unexpected mount-upgrade yuanbao call')
    rva = aligned(pe.sections[-1].VirtualAddress + pe.sections[-1].Misc_VirtualSize,
                  pe.OPTIONAL_HEADER.SectionAlignment)
    raw = aligned(len(source), pe.OPTIONAL_HEADER.FileAlignment)
    code, payload = helper(BASE + rva)
    unwind_offset = aligned(len(payload), 4)
    payload += b'\0' * (unwind_offset - len(payload)) + bytes.fromhex('01 07 02 00 07 01 43 00')
    size = aligned(len(payload), pe.OPTIONAL_HEADER.FileAlignment)
    directory = pe.OPTIONAL_HEADER.DATA_DIRECTORY[3]
    pdata = pe.get_data(directory.VirtualAddress, directory.Size)
    pdata_section = pe.get_section_by_rva(directory.VirtualAddress)
    pdata_end = pe.get_offset_from_rva(directory.VirtualAddress) + directory.Size
    if len(pdata) % 12 or pdata_end + 12 > pdata_section.PointerToRawData + pdata_section.SizeOfRawData or any(source[pdata_end:pdata_end + 12]):
        raise ValueError('No padding for mount-yuanbao unwind record')
    header = pe.sections[-1].get_file_offset() + 40
    if header + 40 > pe.sections[0].PointerToRawData or any(source[header:header + 40]):
        raise ValueError('No spare PE section header')
    output = bytearray(source + b'\0' * (raw - len(source)) + payload + b'\0' * (size - len(payload)))
    output[header:header + 40] = struct.pack('<8sIIIIIIHHI', SECTION, len(payload), rva,
                                          size, raw, 0, 0, 0, 0, 0x60000020)
    struct.pack_into('<H', output, pe.FILE_HEADER.get_field_absolute_offset('NumberOfSections'), pe.FILE_HEADER.NumberOfSections + 1)
    struct.pack_into('<I', output, pe.OPTIONAL_HEADER.get_field_absolute_offset('SizeOfImage'), aligned(rva + len(payload), pe.OPTIONAL_HEADER.SectionAlignment))
    struct.pack_into('<I', output, pe.OPTIONAL_HEADER.get_field_absolute_offset('SizeOfCode'), pe.OPTIONAL_HEADER.SizeOfCode + size)
    struct.pack_into('<II', output, directory.get_file_offset(), directory.VirtualAddress, len(pdata) + 12)
    struct.pack_into('<III', output, pdata_end, rva, rva + len(code), rva + unwind_offset)
    offset = pe.get_offset_from_rva(CALL)
    output[offset:offset + 5] = b'\xe8' + struct.pack('<i', rva - CALL - 5)
    result = bytes(output)
    if patch(result) != result:
        raise ValueError('Mount-yuanbao patch is not idempotent')
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--deps', type=Path)
    parser.add_argument('--source', type=Path, default=SERVER)
    parser.add_argument('--output', type=Path)
    parser.add_argument('--write-install-patch', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    if args.deps:
        sys.path.insert(0, str(args.deps))
    source = args.source.read_bytes()
    result = patch(source)
    if args.write_install_patch:
        if hashlib.sha256(source).hexdigest() != SOURCE_HASH:
            raise ValueError('Generate package from the supported source')
        args.write_install_patch.write_bytes((json.dumps(package(source, result), indent=2) + '\n').encode('utf-8'))
    elif args.check:
        if result != source:
            raise ValueError('Mount-yuanbao patch missing')
    else:
        target = args.output or args.source
        if result != source or target != args.source:
            target.write_bytes(result)
    print('竞技大赛元宝代购坐骑丹记录补丁核对通过')


if __name__ == '__main__':
    main()
