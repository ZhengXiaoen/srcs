"""Remove the Lucky Star and micro-client download buttons from GameFrame.swf.

The two top-row icons are created by ActionScript even when their server-side
features are disabled. Guard each top-button panel's public addBtn2 method so
these button types are never created, while keeping the surrounding bytecode.
"""

from __future__ import annotations

import hashlib
import struct
import zlib
from pathlib import Path

from patch_bag_client import ABCReader, encode_u30


EXPECTED_SHA256 = "cf4d5c1f883a426ff6ef79a4dc4a66e2325ba5083d986ef7246a7651f9428c43"

# Static addBtn2 methods of NavTopBtnPanel, NavTopBtnPanel3 and NavTopBtnPanel2.
PANEL_METHODS = {11117: 53, 18942: 54, 18976: 54}

# getlocal1; compare with the button type; return when it matches.
# 27 = Rigth_Top_Clien_Btn, 136 = RIGHT_TOP_SUPERLUCK.
GUARD = bytes.fromhex(
    "d1 24 1b ac 12 01 00 00 47 "
    "d1 25 88 01 ac 12 01 00 00 47"
)


def patch_abc(abc: bytes) -> bytes:
    reader = ABCReader(abc)
    reader.skip(4)  # ABC version
    for _ in range(reader.u30() - 1):
        reader.u30()  # signed integer pool
    for _ in range(reader.u30() - 1):
        reader.u30()  # unsigned integer pool
    reader.skip(8 * (reader.u30() - 1))  # double pool
    for _ in range(reader.u30() - 1):
        reader.skip(reader.u30())  # strings
    for _ in range(reader.u30() - 1):
        reader.byte()
        reader.u30()  # namespaces
    for _ in range(reader.u30() - 1):
        for _ in range(reader.u30()):
            reader.u30()  # namespace sets
    for _ in range(reader.u30() - 1):
        kind = reader.byte()
        if kind in (0x07, 0x0D):
            reader.u30()
            reader.u30()
        elif kind in (0x0F, 0x10, 0x09, 0x0E):
            reader.u30()
            if kind in (0x09, 0x0E):
                reader.u30()
        elif kind in (0x11, 0x12):
            pass
        elif kind in (0x1B, 0x1C):
            reader.u30()
        elif kind == 0x1D:
            reader.u30()
            for _ in range(reader.u30()):
                reader.u30()
        else:
            raise ValueError(f"Unsupported multiname kind: {kind:#x}")

    for _ in range(reader.u30()):  # methods
        param_count = reader.u30()
        reader.u30()
        for _ in range(param_count):
            reader.u30()
        reader.u30()
        flags = reader.byte()
        if flags & 0x08:
            for _ in range(reader.u30()):
                reader.u30()
                reader.byte()
        if flags & 0x80:
            for _ in range(param_count):
                reader.u30()
    for _ in range(reader.u30()):  # metadata
        reader.u30()
        for _ in range(reader.u30()):
            reader.u30()
            reader.u30()

    def traits() -> None:
        for _ in range(reader.u30()):
            reader.u30()
            kind_attributes = reader.byte()
            kind = kind_attributes & 0x0F
            if kind in (0, 6):
                reader.u30()
                reader.u30()
                if reader.u30():
                    reader.byte()
            elif kind in (1, 2, 3, 4, 5):
                reader.u30()
                reader.u30()
            else:
                raise ValueError(f"Unsupported trait kind: {kind}")
            if kind_attributes & 0x40:
                for _ in range(reader.u30()):
                    reader.u30()

    class_count = reader.u30()
    for _ in range(class_count):  # instances
        reader.u30()
        reader.u30()
        flags = reader.byte()
        if flags & 0x08:
            reader.u30()
        for _ in range(reader.u30()):
            reader.u30()
        reader.u30()
        traits()
    for _ in range(class_count):  # classes
        reader.u30()
        traits()
    for _ in range(reader.u30()):  # scripts
        reader.u30()
        traits()

    replacements = []
    found = set()
    for _ in range(reader.u30()):  # method bodies
        method = reader.u30()
        for _ in range(4):
            reader.u30()  # max stack, locals and scope depths
        length_pos = reader.pos
        code_length = reader.u30()
        code_start = reader.pos
        code_end = code_start + code_length
        code = abc[code_start:code_end]
        reader.skip(code_length)
        exception_count = reader.u30()
        if method in PANEL_METHODS:
            if method in found:
                raise ValueError(f"Duplicate target method: {method}")
            if code_length != PANEL_METHODS[method] or not code.startswith(b"\xd0\x30\x60"):
                raise ValueError(f"Unexpected bytecode in method {method}")
            if exception_count:
                raise ValueError(f"Unexpected exception table in method {method}")
            patched_code = code[:2] + GUARD + code[2:]
            replacements.append(
                (length_pos, code_end, encode_u30(len(patched_code)) + patched_code)
            )
            found.add(method)
        for _ in range(exception_count):
            for _ in range(5):
                reader.u30()
        traits()
    if found != PANEL_METHODS.keys() or reader.pos != len(abc):
        raise ValueError("ABC layout or target methods did not match")

    patched = bytearray(abc)
    for start, end, value in sorted(replacements, reverse=True):
        patched[start:end] = value
    return bytes(patched)


def patch_swf(source: bytes) -> bytes:
    if source[:3] != b"CWS":
        raise ValueError("Expected a zlib-compressed SWF")
    swf = source[:8] + zlib.decompress(source[8:])
    if len(swf) != struct.unpack_from("<I", source, 4)[0]:
        raise ValueError("Invalid SWF length")
    offset = 8 + (5 + (swf[8] >> 3) * 4 + 7) // 8 + 4
    while offset < len(swf):
        tag_start = offset
        header = struct.unpack_from("<H", swf, offset)[0]
        offset += 2
        tag_length = header & 0x3F
        if tag_length == 0x3F:
            tag_length = struct.unpack_from("<I", swf, offset)[0]
            offset += 4
        tag_end = offset + tag_length
        if header >> 6 == 82:
            if header & 0x3F != 0x3F:
                raise ValueError("Expected long DoABC tag")
            abc_start = swf.index(b"\0", offset + 4, tag_end) + 1
            patched_abc = patch_abc(swf[abc_start:tag_end])
            new_tag_length = abc_start - offset + len(patched_abc)
            swf = (
                swf[: tag_start + 2]
                + struct.pack("<I", new_tag_length)
                + swf[tag_start + 6 : abc_start]
                + patched_abc
                + swf[tag_end:]
            )
            swf = swf[:4] + struct.pack("<I", len(swf)) + swf[8:]
            return swf[:8] + zlib.compress(swf[8:], level=9)
        offset = tag_end
    raise ValueError("DoABC tag not found")


def main() -> None:
    path = Path(__file__).resolve().parents[1] / "web" / "GameFrame.swf"
    source = path.read_bytes()
    if hashlib.sha256(source).hexdigest() != EXPECTED_SHA256:
        raise ValueError("GameFrame.swf differs from the expected version")
    path.write_bytes(patch_swf(source))
    print(f"Removed Lucky Star and micro-client icons from {path}")


if __name__ == "__main__":
    main()
