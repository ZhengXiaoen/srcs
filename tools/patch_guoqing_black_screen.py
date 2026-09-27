"""Repair the National Day module's malformed ABC strings and cycle label."""

from __future__ import annotations

import argparse
import hashlib
import struct
import zlib
from pathlib import Path

from patch_bag_client import ABCReader, encode_u30


ROOT = Path(__file__).resolve().parents[1]
MODULE = ROOT / "web/v2/modules/guoqing/GuoQing.swf"
BROKEN_SHA256 = "06511317e192d39f619976f54d7435e791fd0a8eb1650509f4d2ade0ed6e378b"
CYCLE_LABEL = "<font color='#8b714c'>活动时间：</font><font color='#00c513'>每七天一轮                  </font>"
STRING_TAIL = b"\x0bguoQingSign"
OLD_DAY_CODE = bytes.fromhex(
    "d0 30 24 00 d7 24 00 63 04 60 52 66 77 66 78 73 d5 "
    "60 79 46 7a 00 80 7b d6 d2 66 7c d1 a1 24 00 0f 34 00 00 "
    "d2 66 7c 60 52 66 7d 66 7e a1 24 01 a0 73 d7 "
    "d2 66 7c 24 07 a0 60 52 66 7d 66 7e a1 73 63 04 "
    "d0 66 0f 2c 90 02 d3 a0 2c 91 02 a0 62 04 a0 2c 92 02 a0 61 76 47"
)
DAY_CODE_PREFIX = bytes.fromhex("d0 30 d0 66 0f 2c 7e 61 76")
NEW_DAY_CODE = DAY_CODE_PREFIX + b"\x02" * (len(OLD_DAY_CODE) - len(DAY_CODE_PREFIX) - 1) + b"\x47"
DAY_METHOD_HEADER = encode_u30(10) + bytes((3, 5, 15, 16)) + encode_u30(len(OLD_DAY_CODE))


def read_strings(abc: bytes) -> tuple[list[str], ABCReader]:
    reader = ABCReader(abc)
    if abc[:4] != bytes((16, 0, 46, 0)):
        raise ValueError("Unexpected ABC version")
    reader.skip(4)
    for _ in range(2):
        for _ in range(max(0, reader.u30() - 1)):
            reader.u30()
    reader.skip(8 * max(0, reader.u30() - 1))
    strings = [""]
    for _ in range(max(0, reader.u30() - 1)):
        length = reader.u30()
        value = abc[reader.pos:reader.pos + length]
        reader.skip(length)
        strings.append(value.decode("utf-8"))
    return strings, reader


def verify_abc(abc: bytes) -> None:
    strings, reader = read_strings(abc)
    if len(strings) != 296 or strings[126] != CYCLE_LABEL or strings[272] != CYCLE_LABEL:
        raise ValueError("Unexpected National Day string table")
    if strings[273:281] != ["", "", "guoQingSign", "percent", "currentTarget", "indexOf", "x", "getTextLabel"]:
        raise ValueError("National Day string indexes have not been restored")
    namespaces = [(0, 0)]
    for _ in range(max(0, reader.u30() - 1)):
        kind, name = reader.byte(), reader.u30()
        if name >= len(strings):
            raise ValueError("Invalid ABC namespace string")
        namespaces.append((kind, name))
    namespace_sets = [[]]
    for _ in range(max(0, reader.u30() - 1)):
        values = [reader.u30() for _ in range(reader.u30())]
        if any(value >= len(namespaces) for value in values):
            raise ValueError("Invalid ABC namespace set")
        namespace_sets.append(values)
    names = [(0, 0, 0)]
    for _ in range(max(0, reader.u30() - 1)):
        kind = reader.byte()
        if kind in (7, 13):
            namespace, name = reader.u30(), reader.u30()
            if namespace >= len(namespaces):
                raise ValueError("Invalid ABC qualified namespace")
        elif kind in (9, 14):
            name, namespace = reader.u30(), reader.u30()
            if namespace >= len(namespace_sets):
                raise ValueError("Invalid ABC multiname namespace")
        elif kind in (27, 28):
            name, namespace = 0, reader.u30()
            if namespace >= len(namespace_sets):
                raise ValueError("Invalid ABC late-bound namespace")
        else:
            raise ValueError(f"Unexpected National Day multiname kind: {kind}")
        if name >= len(strings):
            raise ValueError("Invalid ABC property string")
        names.append((kind, namespace, name))
    expected_names = {15: "_label_7", 118: "caption", 127: "guoQingSign", 128: "percent",
                      134: "GuoQingNewStdCfg", 135: "needYB", 136: "jiazhi",
                      142: "BaseSprite", 145: "CustomWindow", 146: "CustomCloseWindow"}
    for index, expected in expected_names.items():
        if strings[names[index][2]] != expected:
            raise ValueError(f"Unexpected National Day property index: {index}")
    if abc.count(DAY_METHOD_HEADER + NEW_DAY_CODE) != 1:
        raise ValueError("National Day cycle label method has not been repaired")
    if DAY_METHOD_HEADER + OLD_DAY_CODE in abc:
        raise ValueError("Obsolete month-day cycle rendering remains")


def patch_abc(abc: bytes) -> bytes:
    label = CYCLE_LABEL.encode("utf-8")
    broken = encode_u30(78) + label + STRING_TAIL
    restored = encode_u30(len(label)) + label + b"\x00\x00" + STRING_TAIL
    if abc.count(broken) != 1 or abc.count(DAY_METHOD_HEADER + OLD_DAY_CODE) != 1:
        raise ValueError("National Day module differs from the inspected malformed version")
    patched = abc.replace(broken, restored, 1)
    patched = patched.replace(DAY_METHOD_HEADER + OLD_DAY_CODE, DAY_METHOD_HEADER + NEW_DAY_CODE, 1)
    verify_abc(patched)
    return patched


def process_swf(source: bytes, repair: bool) -> bytes:
    if source[:3] != b"CWS":
        raise ValueError("Expected zlib-compressed SWF")
    data = source[:8] + zlib.decompress(source[8:])
    if len(data) != struct.unpack_from("<I", source, 4)[0]:
        raise ValueError("Invalid SWF length")
    offset = 8 + (5 + (data[8] >> 3) * 4 + 7) // 8 + 4
    changes = []
    while offset < len(data):
        tag_start = offset
        tag = struct.unpack_from("<H", data, offset)[0]
        offset += 2
        length = tag & 63
        if length == 63:
            length = struct.unpack_from("<I", data, offset)[0]
            offset += 4
        tag_end = offset + length
        if tag_end > len(data):
            raise ValueError("SWF tag extends past the module")
        if tag >> 6 == 82:
            if tag & 63 != 63:
                raise ValueError("Expected long DoABC tag")
            abc_start = data.index(b"\x00", offset + 4, tag_end) + 1
            abc = data[abc_start:tag_end]
            if repair:
                patched = patch_abc(abc)
                payload = data[offset:abc_start] + patched
                replacement = data[tag_start:tag_start + 2] + struct.pack("<I", len(payload)) + payload
                changes.append((tag_start, tag_end, replacement))
            else:
                verify_abc(abc)
                changes.append((tag_start, tag_end, data[tag_start:tag_end]))
        offset = tag_end
    if offset != len(data) or len(changes) != 1:
        raise ValueError("Unexpected National Day SWF tag structure")
    if not repair:
        return source
    start, end, replacement = changes[0]
    data = data[:start] + replacement + data[end:]
    data = data[:4] + struct.pack("<I", len(data)) + data[8:]
    output = data[:8] + zlib.compress(data[8:], level=9)
    process_swf(output, False)
    return output


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="Verify the repaired module without writing")
    args = parser.parse_args()
    source = MODULE.read_bytes()
    if args.check or hashlib.sha256(source).hexdigest() != BROKEN_SHA256:
        process_swf(source, False)
    else:
        MODULE.write_bytes(process_swf(source, True))
    print("Verified National Day module string lengths, property indexes, and seven-day cycle label.")


if __name__ == "__main__":
    main()
