"""Record actual mount-pill removal at the native mount-upgrade call site.

Only ClientUpgradeRide's DeleteItem call is wrapped. Its original parameters,
return value and failure handling are retained. The existing Lua material
handler gates the activity period and sends the updated count to the client.
The shipped installer applies this package after the mount-stack package.
"""
from __future__ import annotations

import argparse
import base64
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / 'Server/S1001/x64/LogicServerCQ64_R.exe'
SOURCE_HASH = '175c95cd1113c16de69d66455355cbfdd38286226a4b9a24c9f5e415af5608a6'
SECTION = b'.jjmount'
BASE = 0x140000000
CALL = 0x1dabf7
REMOVE = 0x2a79b0


def helper(address):
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    # Windows x64 ABI; CScriptValueList is 0x188 bytes. Preserve the original
    # removal result across Lua calls and keep every nonvolatile register intact.
    asm = '''
    sub rsp, 0x218
    mov [rsp+0x1d0], rcx
    mov [rsp+0x1d8], rdx
    mov [rsp+0x1e0], r8
    mov [rsp+0x1e8], r9
    mov rax, [rsp+0x240]
    mov [rsp+0x20], rax
    call 0x1402a79b0
    mov [rsp+0x1f8], rax
    test rax, rax
    jle done
    lea rcx, [rsp+0x40]
    call 0x14002e4a0
    mov rax, [rsp+0x1d0]
    mov rdx, [rax+0x48]
    lea rcx, [rsp+0x40]
    call 0x140270110
    mov edx, 8
    lea rcx, [rsp+0x40]
    call 0x14002d370
    mov edx, [rsp+0x1f8]
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


def aligned(value, alignment):
    return (value + alignment - 1) // alignment * alignment


def patch(source):
    import pefile
    pe = pefile.PE(data=source)
    original_call = b'\xe8' + struct.pack('<i', REMOVE - CALL - 5)
    existing = [s for s in pe.sections if s.Name.rstrip(b'\0') == SECTION]
    if existing:
        section = existing[0]
        _, payload = helper(BASE + section.VirtualAddress)
        if pe.get_data(section.VirtualAddress, len(payload)) != payload:
            raise ValueError('Unexpected mount-consumption helper')
        expected = b'\xe8' + struct.pack('<i', section.VirtualAddress - CALL - 5)
        if pe.get_data(CALL, 5) != expected:
            raise ValueError('Mount-upgrade consumption hook missing')
        return source
    if hashlib.sha256(source).hexdigest() != SOURCE_HASH:
        raise ValueError('Unsupported server version; no bytes written')
    if pe.get_data(CALL, 5) != original_call:
        raise ValueError('Unexpected mount-upgrade removal call')

    rva = aligned(pe.sections[-1].VirtualAddress + pe.sections[-1].Misc_VirtualSize,
                  pe.OPTIONAL_HEADER.SectionAlignment)
    raw = aligned(len(source), pe.OPTIONAL_HEADER.FileAlignment)
    code, payload = helper(BASE + rva)
    unwind_offset = aligned(len(payload), 4)
    # UWOP_ALLOC_LARGE, 0x218-byte allocation, seven-byte prologue.
    unwind = bytes.fromhex('01 07 02 00 07 01 43 00')
    payload += b'\0' * (unwind_offset - len(payload)) + unwind
    size = aligned(len(payload), pe.OPTIONAL_HEADER.FileAlignment)
    directory = pe.OPTIONAL_HEADER.DATA_DIRECTORY[3]
    pdata = pe.get_data(directory.VirtualAddress, directory.Size)
    pdata_section = pe.get_section_by_rva(directory.VirtualAddress)
    pdata_end = pe.get_offset_from_rva(directory.VirtualAddress) + directory.Size
    if len(pdata) % 12 or pdata_end + 12 > pdata_section.PointerToRawData + pdata_section.SizeOfRawData or any(source[pdata_end:pdata_end + 12]):
        raise ValueError('No padding for mount-consumption unwind record')
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
        raise ValueError('Mount-consumption patch is not idempotent')
    return result


def package(source, result):
    edits = []
    index = 0
    while index < len(source):
        if source[index] == result[index]:
            index += 1
            continue
        begin = index
        while index < len(source) and source[index] != result[index]:
            index += 1
        edits.append({'offset': begin, 'before': base64.b64encode(source[begin:index]).decode(),
                      'after': base64.b64encode(result[begin:index]).decode()})
    edits.append({'offset': len(source), 'before': '', 'after': base64.b64encode(result[len(source):]).decode()})
    return dict(sourceSha256=hashlib.sha256(source).hexdigest(), targetSha256=hashlib.sha256(result).hexdigest(),
                sourceLength=len(source), targetLength=len(result), edits=edits)


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
        args.write_install_patch.write_text(json.dumps(package(source, result), indent=2) + '\n', encoding='utf-8')
    elif args.check:
        if result != source:
            raise ValueError('Mount-consumption patch is missing')
    else:
        target = args.output or args.source
        if result != source or target != args.source:
            target.write_bytes(result)
    print('竞技大赛坐骑丹消耗记录补丁核对通过')


if __name__ == '__main__':
    main()
