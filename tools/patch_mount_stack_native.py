"""Consume one illusion mount without destroying the remaining stack.

The supported server validates the mount, removes it, takes off the old mount,
then destroys/returns the removed item pointer. For stacks, hand that existing
flow an independently allocated single item only after removing one unit.
Keep all original validation, logging, bag notifications and mount responses.
Use --source/--output for an isolated build; --check audits the installed file.
Dependencies: pefile, keystone-engine (optional --deps directory).
"""
from __future__ import annotations

import argparse
import hashlib
import base64
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / "Server/S1001/x64/LogicServerCQ64_R.exe"
ORIGINAL = "6c3dc87475d4e04bb7dcc5301ec47689480fab987298dffbb09943a214ee63cf"
SECTION = b".mtstack"
BASE = 0x140000000


def helper(address):
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    # Windows x64 ABI: 0x78-byte frame, no nonvolatile registers touched.
    asm = """
    sub rsp, 0x78
    mov [rsp+0x40], rcx
    mov [rsp+0x48], rdx
    mov [rsp+0x50], r9
    mov rax, [rsp+0xa0]
    mov [rsp+0x70], rax
    mov rax, [rdx]
    mov [rsp+0x60], rax
    mov qword ptr [rsp+0x58], 0
    cmp byte ptr [rax+0x2d], 1
    jbe remove
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
    """
    # Copy item attributes, retaining the fresh GUID and allocator metadata.
    for offset in range(8, 0x80, 8):
        asm += f"mov rdx, [r10+{offset}]\nmov [rax+{offset}], rdx\n"
    asm += """
    mov dl, [r10+0x80]
    mov [rax+0x80], dl
    mov byte ptr [rax+0x2d], 1
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
    """
    return bytes(Ks(KS_ARCH_X86, KS_MODE_64).asm(asm, address)[0])


def aligned(n, alignment):
    return (n + alignment - 1) // alignment * alignment


def patch(source):
    import pefile
    pe = pefile.PE(data=source)
    existing = [s for s in pe.sections if s.Name == SECTION]
    if existing:
        section = existing[0]
        code = helper(BASE + section.VirtualAddress)
        if pe.get_data(section.VirtualAddress, len(code)) != code:
            raise ValueError("Mount helper differs from reviewed implementation")
        if pe.get_data(0x1dc75c, 1) != b"\x73":
            raise ValueError("Mount stack validation patch missing")
        if pe.get_data(0x1dc801, 5) != bytes.fromhex("48 8d 54 24 60"):
            raise ValueError("Mount ownership patch missing")
        if pe.get_data(0x1dc80e, 5) != b"\xe8" + struct.pack("<i", section.VirtualAddress - 0x1dc813):
            raise ValueError("Mount helper call missing")
        return source
    if hashlib.sha256(source).hexdigest() != ORIGINAL:
        raise ValueError("Unsupported logic server version; no bytes written")
    rva = aligned(pe.sections[-1].VirtualAddress + pe.sections[-1].Misc_VirtualSize,
                  pe.OPTIONAL_HEADER.SectionAlignment)
    raw = aligned(len(source), pe.OPTIONAL_HEADER.FileAlignment)
    code = helper(BASE + rva)
    unwind_offset = aligned(len(code), 4)
    # UWOP_ALLOC_SMALL: 0x78 bytes, prolog sub rsp has four bytes.
    unwind = bytes.fromhex("01 04 01 00 04 e2 00 00")
    directory = pe.OPTIONAL_HEADER.DATA_DIRECTORY[3]
    pdata = pe.get_data(directory.VirtualAddress, directory.Size)
    if len(pdata) % 12:
        raise ValueError("Unexpected runtime-function table")
    pdata_section = pe.get_section_by_rva(directory.VirtualAddress)
    pdata_end = pe.get_offset_from_rva(directory.VirtualAddress) + directory.Size
    if (pdata_end + 12 > pdata_section.PointerToRawData + pdata_section.SizeOfRawData
            or any(source[pdata_end:pdata_end+12])):
        raise ValueError("No padding for mount runtime-function record")
    payload = code + b"\0" * (unwind_offset - len(code)) + unwind
    size = aligned(len(payload), pe.OPTIONAL_HEADER.FileAlignment)
    output = bytearray(source + b"\0" * (raw - len(source)) + payload + b"\0" * (size - len(payload)))
    header = pe.sections[-1].get_file_offset() + 40
    if header + 40 > pe.sections[0].PointerToRawData or any(source[header:header+40]):
        raise ValueError("No spare PE section header")
    output[header:header+40] = struct.pack("<8sIIIIIIHHI", SECTION, len(payload), rva,
                                        size, raw, 0, 0, 0, 0, 0x60000020)
    struct.pack_into("<H", output, pe.FILE_HEADER.get_field_absolute_offset("NumberOfSections"),
                     pe.FILE_HEADER.NumberOfSections + 1)
    struct.pack_into("<I", output, pe.OPTIONAL_HEADER.get_field_absolute_offset("SizeOfImage"),
                     aligned(rva+len(payload), pe.OPTIONAL_HEADER.SectionAlignment))
    struct.pack_into("<I", output, pe.OPTIONAL_HEADER.get_field_absolute_offset("SizeOfCode"),
                     pe.OPTIONAL_HEADER.SizeOfCode + size)
    struct.pack_into("<II", output, directory.get_file_offset(), directory.VirtualAddress, len(pdata)+12)
    struct.pack_into("<III", output, pdata_end, rva, rva+len(code), rva+unwind_offset)
    edits = {0x1dc75c: (b"\x74", b"\x73"),
             0x1dc801: (bytes.fromhex("48 8b 54 24 60"), bytes.fromhex("48 8d 54 24 60")),
             0x1dc80e: (b"\xe8" + struct.pack("<i", 0x2a7f30 - 0x1dc813),
                        b"\xe8" + struct.pack("<i", rva - 0x1dc813))}
    for target, (before, after) in edits.items():
        offset = pe.get_offset_from_rva(target)
        if source[offset:offset+len(before)] != before:
            raise ValueError("Unexpected mount instruction")
        output[offset:offset+len(after)] = after
    result = bytes(output)
    if patch(result) != result:
        raise ValueError("Mount patch not idempotent")
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--deps", type=Path)
    parser.add_argument("--source", type=Path, default=SERVER)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--write-install-patch", type=Path)
    args = parser.parse_args()
    if args.deps:
        sys.path.insert(0, str(args.deps))
    source = args.source.read_bytes()
    result = patch(source)
    if args.write_install_patch:
        if hashlib.sha256(source).hexdigest() != ORIGINAL:
            raise ValueError("Generate installation patch from the supported original")
        # Equal-size overwrite ranges plus the appended PE section. Keep the
        # package small, deterministic and independent of Python at game start.
        edits=[]
        index=0
        while index<len(source):
            if source[index]==result[index]:
                index+=1;continue
            begin=index
            while index<len(source) and source[index]!=result[index]:index+=1
            edits.append({"offset":begin,"before":base64.b64encode(source[begin:index]).decode(),
                          "after":base64.b64encode(result[begin:index]).decode()})
        edits.append({"offset":len(source),"before":"","after":base64.b64encode(result[len(source):]).decode()})
        package={"sourceSha256":ORIGINAL,"targetSha256":hashlib.sha256(result).hexdigest(),
                 "sourceLength":len(source),"targetLength":len(result),"edits":edits}
        args.write_install_patch.write_text(json.dumps(package,indent=2)+'\n',encoding='utf-8')
    elif args.check:
        if result != source:
            raise ValueError("Mount stack patch is missing")
    else:
        target = args.output or args.source
        if result != source or target != args.source:
            target.write_bytes(result)
    print("坐骑堆叠穿戴补丁核对通过")


if __name__ == "__main__":
    main()
