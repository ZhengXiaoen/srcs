"""Update the guild quest reward text embedded in GameFrame.swf.

The Flash client stores this UI text in its ABC string pool. This patch keeps
all string indexes and bytecode intact, then updates the SWF length fields.
"""

from __future__ import annotations

import hashlib
import struct
import zlib
from pathlib import Path

from patch_bag_client import ABCReader, encode_u30


EXPECTED_SHA256 = "4d721cb2de13d31d4c6570d537b068ff7ae5cb2db968d59fcc32de043c4912ef"
REPLACEMENTS = {
    "1000        300": "25万/40万  5000/8000",
    "每日额外增加3次行会除魔任务": "每日行会除魔奖励按8次合并领取",
}


def patch_abc(abc: bytes) -> bytes:
    reader = ABCReader(abc)
    reader.skip(4)  # ABC version
    for _ in range(reader.u30() - 1):
        reader.u30()  # signed integers
    for _ in range(reader.u30() - 1):
        reader.u30()  # unsigned integers
    reader.skip(8 * (reader.u30() - 1))  # doubles

    replacements = []
    seen = set()
    for _ in range(reader.u30() - 1):
        length_offset = reader.pos
        length = reader.u30()
        string_offset = reader.pos
        value = abc[string_offset : string_offset + length].decode("utf-8")
        reader.skip(length)
        if value in REPLACEMENTS:
            if value in seen:
                raise ValueError(f"Duplicate target string: {value}")
            seen.add(value)
            new_value = REPLACEMENTS[value].encode("utf-8")
            replacements.append(
                (length_offset, reader.pos, encode_u30(len(new_value)) + new_value)
            )
    if seen != REPLACEMENTS.keys():
        raise ValueError(f"Missing UI strings: {REPLACEMENTS.keys() - seen}")

    result = bytearray(abc)
    for start, end, value in reversed(replacements):
        result[start:end] = value
    return bytes(result)


def patch_swf(source: bytes) -> bytes:
    if source[:3] != b"CWS":
        raise ValueError("Expected zlib-compressed SWF")
    uncompressed = source[:8] + zlib.decompress(source[8:])
    if len(uncompressed) != struct.unpack_from("<I", source, 4)[0]:
        raise ValueError("Invalid SWF length")
    rect_size = (5 + (uncompressed[8] >> 3) * 4 + 7) // 8
    offset = 8 + rect_size + 4
    while offset < len(uncompressed):
        tag_start = offset
        header = struct.unpack_from("<H", uncompressed, offset)[0]
        offset += 2
        tag_length = header & 0x3F
        if tag_length == 0x3F:
            tag_length = struct.unpack_from("<I", uncompressed, offset)[0]
            offset += 4
        tag_end = offset + tag_length
        if header >> 6 == 82:
            if header & 0x3F != 0x3F:
                raise ValueError("Expected long DoABC tag")
            abc_start = uncompressed.index(b"\0", offset + 4, tag_end) + 1
            patched = patch_abc(uncompressed[abc_start:tag_end])
            new_length = abc_start - offset + len(patched)
            uncompressed = (
                uncompressed[: tag_start + 2]
                + struct.pack("<I", new_length)
                + uncompressed[tag_start + 6 : abc_start]
                + patched
                + uncompressed[tag_end:]
            )
            uncompressed = (
                uncompressed[:4] + struct.pack("<I", len(uncompressed)) + uncompressed[8:]
            )
            return uncompressed[:8] + zlib.compress(uncompressed[8:], level=9)
        offset = tag_end
    raise ValueError("DoABC tag not found")


def main() -> None:
    path = Path(__file__).resolve().parents[1] / "web" / "GameFrame.swf"
    source = path.read_bytes()
    if hashlib.sha256(source).hexdigest() != EXPECTED_SHA256:
        raise ValueError("GameFrame.swf differs from the expected version")
    path.write_bytes(patch_swf(source))
    print(f"Updated {path}")


if __name__ == "__main__":
    main()
