"""Make the equipped artifact authoritative and refresh the upgrade page on replies.

Only two existing method bodies in GameFrame.swf change, without moving any
instructions, branches, constants, exception tables, or unrelated SWF tags.
"""

from __future__ import annotations

import argparse
import struct
import zlib
from pathlib import Path

from patch_bag_client import ABCReader, encode_u30


ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
CLASS_NAME = "GodEquipUpgradePage"


def inspect_abc(data: bytes):
    reader = ABCReader(data)
    reader.skip(4)
    for _ in range(2):
        for _ in range(reader.u30() - 1):
            reader.u30()
    reader.skip(8 * (reader.u30() - 1))
    strings = [""]
    for _ in range(reader.u30() - 1):
        length = reader.u30()
        strings.append(data[reader.pos:reader.pos + length].decode("utf-8"))
        reader.skip(length)
    for _ in range(reader.u30() - 1):
        reader.byte()
        reader.u30()
    for _ in range(reader.u30() - 1):
        for _ in range(reader.u30()):
            reader.u30()
    names = [""]
    for _ in range(reader.u30() - 1):
        kind = reader.byte()
        if kind in (7, 13):
            reader.u30()
            name = reader.u30()
        elif kind in (15, 16, 9, 14):
            name = reader.u30()
            if kind in (9, 14):
                reader.u30()
        elif kind in (17, 18):
            name = 0
        elif kind in (27, 28):
            reader.u30()
            name = 0
        elif kind == 29:
            base = reader.u30()
            for _ in range(reader.u30()):
                reader.u30()
            names.append(names[base])
            continue
        else:
            raise ValueError(f"Unsupported multiname: {kind}")
        names.append(strings[name])
    for _ in range(reader.u30()):
        count = reader.u30()
        reader.u30()
        for _ in range(count):
            reader.u30()
        reader.u30()
        flags = reader.byte()
        if flags & 8:
            for _ in range(reader.u30()):
                reader.u30()
                reader.byte()
        if flags & 128:
            for _ in range(count):
                reader.u30()
    for _ in range(reader.u30()):
        reader.u30()
        for _ in range(reader.u30()):
            reader.u30()
            reader.u30()

    def traits():
        methods = {}
        for _ in range(reader.u30()):
            name = reader.u30()
            attributes = reader.byte()
            kind = attributes & 15
            reader.u30()
            value = reader.u30()
            if kind in (0, 6):
                if reader.u30():
                    reader.byte()
            elif kind in (1, 2, 3):
                methods[names[name]] = (value, name)
            elif kind not in (4, 5):
                raise ValueError(f"Unsupported trait: {kind}")
            if attributes & 64:
                for _ in range(reader.u30()):
                    reader.u30()
        return methods

    count = reader.u30()
    targets = None
    for _ in range(count):
        name = reader.u30()
        reader.u30()
        flags = reader.byte()
        if flags & 8:
            reader.u30()
        for _ in range(reader.u30()):
            reader.u30()
        reader.u30()
        methods = traits()
        if names[name] == CLASS_NAME:
            if targets is not None:
                raise ValueError("Duplicate upgrade page class")
            targets = methods
    for _ in range(count):
        reader.u30()
        traits()
    for _ in range(reader.u30()):
        reader.u30()
        traits()
    bodies = {}
    for _ in range(reader.u30()):
        method = reader.u30()
        limits = tuple(reader.u30() for _ in range(4))
        length = reader.u30()
        start = reader.pos
        reader.skip(length)
        bodies[method] = (start, length, limits)
        for _ in range(reader.u30()):
            for _ in range(5):
                reader.u30()
        traits()
    if reader.pos != len(data):
        raise ValueError("ABC did not parse completely")
    return names, targets, bodies


def patch_abc(data: bytes) -> bytes:
    names, targets, bodies = inspect_abc(data)
    if targets is None:
        return data

    def unique(name):
        # These are the inspected public QNames; later duplicates are parameters.
        index = {"UserItem": 137, "GlobalData": 1507, "role": 11237, "activatGodEquip": 4258}[name]
        if names[index] != name:
            raise ValueError(f"Unexpected public QName: {name}")
        return encode_u30(index)

    start, length, limits = bodies[targets["updateWeapon"][0]]
    code = data[start:start + length]
    # The equipped UserItem is already in local 2 before the purchase-flag gate.
    prefix = b"\x80" + unique("UserItem") + b"\xd6"
    gate = b"\x60" + unique("GlobalData") + b"\x66" + unique("role") + b"\x66" + unique("activatGodEquip")
    equipped = b"\xd2" + b"\x02" * (len(gate) - 1)
    old = prefix + gate + b"\x12"
    new = prefix + equipped + b"\x12"
    if code.count(old) + code.count(new) != 1 or limits != (12, 8, 13, 14):
        raise ValueError("Unexpected artifact ownership gate")
    patched_weapon = code.replace(old, new, 1)

    event_start, event_length, event_limits = bodies[targets["onChangeShenHun"][0]]
    event = data[event_start:event_start + event_length]
    before = b"\x4f" + encode_u30(targets["updateShenHun"][1]) + b"\x00"
    after = b"\x4f" + encode_u30(targets["updateView"][1]) + b"\x00"
    if len(before) != len(after) or event.count(before) + event.count(after) != 1 or event_limits != (1, 2, 13, 14):
        raise ValueError("Unexpected upgrade-page refresh callback")
    patched_event = event.replace(before, after, 1)
    output = bytearray(data)
    output[start:start + length] = patched_weapon
    output[event_start:event_start + event_length] = patched_event
    allowed = set(range(start, start + length)) | set(range(event_start, event_start + event_length))
    if len(output) != len(data) or any(a != b and index not in allowed for index, (a, b) in enumerate(zip(data, output))):
        raise ValueError("Unrelated ABC data changed")
    return bytes(output)


def patch_swf(source: bytes) -> bytes:
    if source[:3] != b"CWS":
        raise ValueError("Expected compressed GameFrame.swf")
    swf = source[:8] + zlib.decompress(source[8:])
    if len(swf) != struct.unpack_from("<I", source, 4)[0]:
        raise ValueError("Invalid SWF length")
    output = bytearray(swf)
    offset = 8 + (5 + (swf[8] >> 3) * 4 + 7) // 8 + 4
    found = 0
    while offset < len(swf):
        header = struct.unpack_from("<H", swf, offset)[0]
        offset += 2
        size = header & 63
        if size == 63:
            size = struct.unpack_from("<I", swf, offset)[0]
            offset += 4
        end = offset + size
        if header >> 6 == 82:
            start = swf.index(b"\0", offset + 4, end) + 1
            abc = swf[start:end]
            if inspect_abc(abc)[1] is not None:
                found += 1
                output[start:end] = patch_abc(abc)
        offset = end
    if found != 1 or offset != len(swf):
        raise ValueError("Missing upgrade page or invalid SWF tags")
    if output == swf:
        return source
    return source[:8] + zlib.compress(bytes(output[8:]), 9)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    output = patch_swf(source)
    if args.check:
        if output != source:
            raise ValueError("Artifact client patch has not been applied")
    elif output != source:
        CLIENT.write_bytes(output)
    print("Verified equipped-artifact ownership and upgrade-page refresh; other client code is unchanged.")


if __name__ == "__main__":
    main()
