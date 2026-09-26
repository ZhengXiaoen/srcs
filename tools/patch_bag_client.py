"""Patch the original GameFrame.swf backpack grid from 72 to 256 slots.

This edits only the relevant bytes in the existing ActionScript ABC. It does
not disassemble and reassemble the game's other classes. Run against the
original client, never an already patched copy.
"""

from __future__ import annotations

import argparse
import hashlib
import struct
import zlib
from pathlib import Path


ORIGINAL_SHA256 = "c1854dbecda5e3f290ef0f958ec36644501a05be1b286bebc3ec95dcb35c1965"


class ABCReader:
    def __init__(self, data: bytes):
        self.data = data
        self.pos = 0

    def byte(self) -> int:
        value = self.data[self.pos]
        self.pos += 1
        return value

    def u30(self) -> int:
        value = 0
        for shift in range(0, 35, 7):
            byte = self.byte()
            value |= (byte & 0x7F) << shift
            if not byte & 0x80:
                return value
        raise ValueError("Invalid ABC variable integer")

    def skip(self, count: int) -> None:
        self.pos += count
        if self.pos > len(self.data):
            raise ValueError("Truncated ABC")


def encode_u30(value: int) -> bytes:
    output = bytearray()
    while True:
        byte = value & 0x7F
        value >>= 7
        output.append(byte | 0x80 if value else byte)
        if not value:
            return bytes(output)


def patch_abc(abc: bytes) -> bytes:
    reader = ABCReader(abc)
    reader.skip(4)  # minor and major version
    integers = [0]
    for _ in range(reader.u30() - 1):
        value = reader.u30()
        if value >= 0x80000000:
            value -= 0x100000000
        integers.append(value)
    index_256 = integers.index(256)
    index_32 = integers.index(32)
    for _ in range(reader.u30() - 1):
        reader.u30()  # unsigned pool
    reader.skip(8 * (reader.u30() - 1))  # double pool
    strings = [""]
    for _ in range(reader.u30() - 1):
        length = reader.u30()
        strings.append(abc[reader.pos : reader.pos + length].decode("utf-8"))
        reader.skip(length)

    namespaces = [(0, 0)]
    for _ in range(reader.u30() - 1):
        namespaces.append((reader.byte(), reader.u30()))
    for _ in range(reader.u30() - 1):
        for _ in range(reader.u30()):
            reader.u30()  # namespace set
    multinames = [(0, 0, 0)]
    for _ in range(reader.u30() - 1):
        kind = reader.byte()
        if kind in (0x07, 0x0D):
            multinames.append((kind, reader.u30(), reader.u30()))
        elif kind in (0x0F, 0x10, 0x09, 0x0E):
            name = reader.u30()
            if kind in (0x09, 0x0E):
                reader.u30()
            multinames.append((kind, 0, name))
        elif kind in (0x11, 0x12):
            multinames.append((kind, 0, 0))
        elif kind in (0x1B, 0x1C):
            reader.u30()
            multinames.append((kind, 0, 0))
        elif kind == 0x1D:
            reader.u30()
            for _ in range(reader.u30()):
                reader.u30()
            multinames.append((kind, 0, 0))
        else:
            raise ValueError(f"Unsupported multiname kind 0x{kind:02x}")

    def name(index: int) -> str:
        return strings[multinames[index][2]]

    for _ in range(reader.u30()):
        param_count = reader.u30()
        reader.u30()  # return type
        for _ in range(param_count):
            reader.u30()
        reader.u30()  # method name
        flags = reader.byte()
        if flags & 0x08:
            for _ in range(reader.u30()):
                reader.u30()
                reader.byte()
        if flags & 0x80:
            for _ in range(param_count):
                reader.u30()
    for _ in range(reader.u30()):
        reader.u30()
        count = reader.u30()
        for _ in range(count * 2):
            reader.u30()

    replacements: list[tuple[int, int, bytes]] = []

    def trait() -> tuple[str, int | None]:
        trait_name = name(reader.u30())
        kind_attributes = reader.byte()
        kind = kind_attributes & 0x0F
        method = None
        if kind in (0, 6):  # slot or const
            reader.u30()  # slot id
            reader.u30()  # type
            value_pos = reader.pos
            value_index = reader.u30()
            if value_index:
                if target_class and trait_name in ("MAX_VOLUME", "ROW_COUNT"):
                    expected = 72 if trait_name == "MAX_VOLUME" else 9
                    replacement_index = index_256 if expected == 72 else index_32
                    if integers[value_index] != expected:
                        raise ValueError(f"Unexpected {trait_name} trait value")
                    replacements.append(
                        (value_pos, reader.pos, encode_u30(replacement_index))
                    )
                reader.byte()  # value kind
        elif kind in (1, 2, 3):  # method, getter, setter
            reader.u30()  # disp id
            method = reader.u30()
        elif kind in (4, 5):  # class or function
            reader.u30()
            reader.u30()
        else:
            raise ValueError(f"Unsupported trait kind {kind}")
        if kind_attributes & 0x40:
            for _ in range(reader.u30()):
                reader.u30()
        return trait_name, method

    class_count = reader.u30()
    target_index = None
    set_bag_data = None
    target_class = False
    for class_index in range(class_count):
        class_name = reader.u30()
        reader.u30()  # super class
        flags = reader.byte()
        if flags & 0x08:
            reader.u30()
        for _ in range(reader.u30()):
            reader.u30()
        reader.u30()  # instance initializer
        target_class = name(class_name) == "BackPackWin"
        if target_class:
            namespace = namespaces[multinames[class_name][1]]
            if strings[namespace[1]] != "view.game.backpack":
                target_class = False
            else:
                target_index = class_index
        for _ in range(reader.u30()):
            trait_name, method = trait()
            if target_class and trait_name == "setBagData":
                set_bag_data = method
    if target_index is None or set_bag_data is None:
        raise ValueError("BackPackWin or setBagData was not found")

    target_cinit = None
    for class_index in range(class_count):
        cinit = reader.u30()
        target_class = class_index == target_index
        if target_class:
            target_cinit = cinit
        for _ in range(reader.u30()):
            trait()
    for _ in range(reader.u30()):
        reader.u30()  # script initializer
        for _ in range(reader.u30()):
            target_class = False
            trait()

    found_cinit = found_data = False
    for _ in range(reader.u30()):
        method_index = reader.u30()
        for _ in range(4):
            reader.u30()  # stack, locals and scope depths
        length_pos = reader.pos
        code_length = reader.u30()
        code_start = reader.pos
        code_end = code_start + code_length
        code = bytearray(abc[code_start:code_end])
        reader.skip(code_length)
        if method_index == target_cinit:
            if code.count(b"\x24\x48") != 1 or code.count(b"\x24\x09") != 1:
                raise ValueError("BackPackWin initializer does not match original")
            code = code.replace(b"\x24\x48", b"\x25\x80\x02", 1)
            code = code.replace(b"\x24\x09", b"\x24\x20", 1)
            replacements.append((code_start, code_end, bytes(code)))
            replacements.append((length_pos, code_start, encode_u30(len(code))))
            found_cinit = True
        elif method_index == set_bag_data:
            for old in (b"\x24\x08\x63\x0b", b"\x24\x10\x63\x0b"):
                if code.count(old) != 1:
                    raise ValueError("VIP tail lock code does not match original")
                code = code.replace(old, b"\x24\x00\x63\x0b", 1)
            replacements.append((code_start, code_end, bytes(code)))
            found_data = True
        for _ in range(reader.u30()):
            for _ in range(5):  # from, to, target, type and variable name
                reader.u30()
        for _ in range(reader.u30()):
            target_class = False
            trait()
    if not found_cinit or not found_data or reader.pos != len(abc):
        raise ValueError("ABC body layout did not match expected structure")
    if len([r for r in replacements if r[2] == encode_u30(index_256)]) != 1:
        raise ValueError("MAX_VOLUME trait was not patched")
    if len([r for r in replacements if r[2] == encode_u30(index_32)]) != 1:
        raise ValueError("ROW_COUNT trait was not patched")

    patched = bytearray(abc)
    for start, end, content in sorted(replacements, reverse=True):
        patched[start:end] = content
    return bytes(patched)


def patch_swf(source: bytes) -> bytes:
    if source[:3] != b"CWS":
        raise ValueError("Expected the original zlib-compressed GameFrame.swf")
    uncompressed = source[:8] + zlib.decompress(source[8:])
    if struct.unpack_from("<I", source, 4)[0] != len(uncompressed):
        raise ValueError("Invalid SWF uncompressed length")
    rect_bytes = (5 + (uncompressed[8] >> 3) * 4 + 7) // 8
    offset = 8 + rect_bytes + 4
    found = False
    while offset < len(uncompressed):
        header_offset = offset
        header = struct.unpack_from("<H", uncompressed, offset)[0]
        offset += 2
        tag_code = header >> 6
        tag_length = header & 0x3F
        if tag_length == 0x3F:
            tag_length = struct.unpack_from("<I", uncompressed, offset)[0]
            offset += 4
        tag_end = offset + tag_length
        if tag_code == 82:
            if found or header & 0x3F != 0x3F:
                raise ValueError("Expected one long DoABC tag")
            abc_offset = uncompressed.index(b"\x00", offset + 4, tag_end) + 1
            original_abc = uncompressed[abc_offset:tag_end]
            patched_abc = patch_abc(original_abc)
            new_length = abc_offset - offset + len(patched_abc)
            uncompressed = (
                uncompressed[: header_offset + 2]
                + struct.pack("<I", new_length)
                + uncompressed[header_offset + 6 : abc_offset]
                + patched_abc
                + uncompressed[tag_end:]
            )
            found = True
            break
        if tag_code == 0:
            break
        offset = tag_end
    if not found:
        raise ValueError("GameFrame DoABC tag was not found")
    uncompressed = uncompressed[:4] + struct.pack("<I", len(uncompressed)) + uncompressed[8:]
    return uncompressed[:8] + zlib.compress(uncompressed[8:], level=9)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("original_swf", type=Path)
    parser.add_argument("output_swf", type=Path)
    args = parser.parse_args()
    if args.original_swf.resolve() == args.output_swf.resolve():
        parser.error("Source and output paths must differ")
    original = args.original_swf.read_bytes()
    if hashlib.sha256(original).hexdigest() != ORIGINAL_SHA256:
        parser.error("Input is not the original GameFrame.swf recorded in Git")
    patched = patch_swf(original)
    args.output_swf.parent.mkdir(parents=True, exist_ok=True)
    args.output_swf.write_bytes(patched)
    print(f"Wrote {args.output_swf} ({len(patched)} bytes)")


if __name__ == "__main__":
    main()
