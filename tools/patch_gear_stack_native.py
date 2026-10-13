"""Wear one mount equipment unit while retaining the remaining stack.

Fingerprint the current uint16 server. Wrap only the mount equipment removal
call, keeping validation, replacement rollback, logging and responses intact.
The wrapper clones the complete 129-byte item payload with a fresh GUID before
removing one unit. An allocator/removal failure never consumes the source.
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
SOURCE_HASH = '4899aeaa9ed6db281cd6b2069811c61416fc26b05e55852020f688a2972c3904'
BASE = 0x140000000
MARKER = b'GEARSTACK1\0\0\0\0\0\0'
VALIDATE = 0x1db2a3
POINTER = 0x1db378
CALL = 0x1db385
REMOVE = 0x2a7f30


def helper(address):
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    # Preserve Windows x64 nonvolatile registers; align every API call.
    assembly = '''
    sub rsp, 0x78
    mov [rsp+0x40], rcx
    mov [rsp+0x48], rdx
    mov [rsp+0x50], r9
    mov rax, [rsp+0xa0]
    mov [rsp+0x70], rax
    mov rax, [rdx]
    mov [rsp+0x60], rax
    mov qword ptr [rsp+0x58], 0
    movzx edx, byte ptr [rax+0x80]
    shl edx, 8
    mov dl, [rax+0x2d]
    cmp edx, 1
    jb fail
    je remove
    call 0x14000e7b0
    mov rcx, rax
    call 0x14002ef70
    mov rcx, rax
    mov edx, 1
    mov r8, [rsp+0x50]
    xor r9d, r9d
    call 0x1400a1060
    test rax, rax
    jz fail
    mov [rsp+0x58], rax
    mov r10, [rsp+0x60]
    '''
    # Keep the allocator's new GUID and metadata outside CUserItem intact.
    for offset in range(8, 0x80, 8):
        assembly += f'mov rdx, [r10+{offset}]\nmov [rax+{offset}], rdx\n'
    assembly += '''
    mov byte ptr [rax+0x2d], 1
    mov byte ptr [rax+0x80], 0
    remove:
    mov rcx, [rsp+0x40]
    mov rdx, [rsp+0x60]
    mov r8d, 1
    mov r9, [rsp+0x50]
    mov rax, [rsp+0x70]
    mov [rsp+0x20], rax
    mov byte ptr [rsp+0x28], 0
    call 0x1402a7f30
    mov [rsp+0x68], rax
    cmp rax, 1
    jne cleanup
    mov rax, [rsp+0x58]
    test rax, rax
    jz done
    mov rdx, [rsp+0x48]
    mov [rdx], rax
    jmp done
    cleanup:
    cmp qword ptr [rsp+0x58], 0
    je done
    call 0x14000dec0
    mov rcx, rax
    mov rdx, [rsp+0x58]
    mov r8, [rsp+0x50]
    xor r9d, r9d
    call 0x1400a1460
    done:
    mov rax, [rsp+0x68]
    add rsp, 0x78
    ret
    fail:
    xor eax, eax
    add rsp, 0x78
    ret
    '''
    return bytes(Ks(KS_ARCH_X86, KS_MODE_64).asm(assembly, address)[0])


def aligned(value, alignment):
    return (value + alignment - 1) // alignment * alignment


def patch(source):
    import pefile
    pe = pefile.PE(data=source)
    directory = pe.OPTIONAL_HEADER.DATA_DIRECTORY[3]
    record = pe.get_data(directory.VirtualAddress+directory.Size-12, 12)
    start, end, unwind_rva = struct.unpack('<III', record)
    if pe.get_data(start-len(MARKER), len(MARKER)) == MARKER:
        code = helper(BASE + start)
        if (pe.get_data(start, len(code)) != code or end != start+len(code)
                or pe.get_data(unwind_rva, 8) != bytes.fromhex('01 04 01 00 04 e2 00 00')):
            raise ValueError('Mount equipment helper no longer matches')
        expected = {VALIDATE: b'\x73', POINTER: bytes.fromhex('48 8d 54 24 70'),
                    CALL: b'\xe8' + struct.pack('<i', start-CALL-5)}
        if any(pe.get_data(rva, len(value)) != value for rva, value in expected.items()):
            raise ValueError('Mount equipment hook missing')
        return source
    if hashlib.sha256(source).hexdigest() != SOURCE_HASH:
        raise ValueError('Unsupported server fingerprint; no bytes written')
    # All PE header slots are occupied. Extend the last executable section and
    # relocate a copy of its runtime-function table; prior code/data stay put.
    section = pe.sections[-1]
    if (not section.Characteristics & 0x20000000 or
            section.PointerToRawData+section.SizeOfRawData != len(source)):
        raise ValueError('Expected a final executable section without overlay')
    offset = aligned(section.Misc_VirtualSize, 16)
    rva = section.VirtualAddress+offset+len(MARKER)
    raw = section.PointerToRawData+offset+len(MARKER)
    code = helper(BASE+rva)
    unwind_offset = aligned(len(code), 4)
    unwind = bytes.fromhex('01 04 01 00 04 e2 00 00')
    pdata = pe.get_data(directory.VirtualAddress, directory.Size)
    if len(pdata) % 12 or struct.unpack('<I', pdata[-12:-8])[0] >= rva:
        raise ValueError('Unexpected runtime-function table order')
    payload = code+b'\0'*(unwind_offset-len(code))+unwind
    table_offset = aligned(len(payload), 4)
    payload += b'\0'*(table_offset-len(payload))+pdata+struct.pack('<III', rva, rva+len(code), rva+unwind_offset)
    virtual_size = offset+len(MARKER)+len(payload)
    size = aligned(virtual_size, pe.OPTIONAL_HEADER.FileAlignment)
    output = bytearray(source+b'\0'*(section.PointerToRawData+size-len(source)))
    output[raw-len(MARKER):raw] = MARKER
    output[raw:raw+len(payload)] = payload
    struct.pack_into('<I', output, section.get_field_absolute_offset('Misc_VirtualSize'), virtual_size)
    struct.pack_into('<I', output, section.get_field_absolute_offset('SizeOfRawData'), size)
    for field, value in [('SizeOfImage', aligned(rva+len(payload), pe.OPTIONAL_HEADER.SectionAlignment)),
                         ('SizeOfCode', pe.OPTIONAL_HEADER.SizeOfCode+size-section.SizeOfRawData)]:
        struct.pack_into('<I', output, pe.OPTIONAL_HEADER.get_field_absolute_offset(field), value)
    struct.pack_into('<II', output, directory.get_file_offset(), rva+table_offset, directory.Size+12)
    edits = {VALIDATE: (b'\x74', b'\x73'),
             POINTER: (bytes.fromhex('48 8b 54 24 70'), bytes.fromhex('48 8d 54 24 70')),
             CALL: (b'\xe8'+struct.pack('<i', REMOVE-CALL-5),
                    b'\xe8'+struct.pack('<i', rva-CALL-5))}
    for target, (before, after) in edits.items():
        offset = pe.get_offset_from_rva(target)
        if source[offset:offset+len(before)] != before:
            raise ValueError('Unexpected mount equipment instruction')
        output[offset:offset+len(after)] = after
    result = bytes(output)
    if patch(result) != result:
        raise ValueError('Equipment patch is not idempotent')
    return result


def install_package(source, result):
    edits = []
    index = 0
    while index < len(source):
        if source[index] == result[index]:
            index += 1
            continue
        begin = index
        while index < len(source) and source[index] != result[index]:
            index += 1
        edits.append(dict(offset=begin, before=base64.b64encode(source[begin:index]).decode(),
                          after=base64.b64encode(result[begin:index]).decode()))
    edits.append(dict(offset=len(source), before='', after=base64.b64encode(result[len(source):]).decode()))
    return dict(sourceSha256=hashlib.sha256(source).hexdigest(), targetSha256=hashlib.sha256(result).hexdigest(),
                sourceLength=len(source), targetLength=len(result), edits=edits)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--deps', type=Path)
    parser.add_argument('--source', type=Path, default=SERVER)
    parser.add_argument('--output', type=Path)
    parser.add_argument('--package', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    if args.deps:
        sys.path.insert(0, str(args.deps))
    source = args.source.read_bytes()
    result = patch(source)
    if args.check and result != source:
        raise ValueError('Equipment stack patch is missing')
    if args.package:
        if hashlib.sha256(source).hexdigest() != SOURCE_HASH:
            raise ValueError('Generate package from the supported source')
        args.package.write_text(json.dumps(install_package(source, result), indent=2)+'\n', encoding='utf-8')
    if args.output:
        args.output.write_bytes(result)
    if not args.check and not args.output and not args.package:
        raise ValueError('Select an explicit output or installation package')
    print('坐骑装备堆叠穿戴补丁核对通过')


if __name__ == '__main__':
    main()
