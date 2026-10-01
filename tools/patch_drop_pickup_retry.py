"""Keep unconfirmed ground drops eligible for pickup after a short retry delay.

The client used to set isAlreadyPickup immediately on sending a request, even
when MsgSender suppressed it or the server had not accepted it. A remaining
stack was then skipped indefinitely. Use the existing canPickTime gate instead:
wait at least one second (the sender's duplicate-request interval), then retry.
Only the server's DROP_ITEM_DEL packet removes a successfully collected stack.

Also stop caching a failed category check as isCheck=true in the two automatic
selectors. A disabled or temporarily unavailable category must be checked again
on the next selection, rather than ignored until settings are manually saved.
Keep the existing isCheck reads for server-originated exclusions and preserve
pickup protection, backpack capacity and the player's enabled categories.

Patch five request assignments in four methods and two category-cache writes,
preserving all constants, other method bodies, SWF tags and pickup categories.
Relocate existing branches, switches and exception offsets rather than
recompiling the Flash application.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path
import struct
import zlib

from patch_bag_client import ABCReader, encode_u30
from patch_god_equip_state import inspect_abc

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
TARGETS = {
    "LocalPlayer": {"setCurrentXY": 1},
    "GameLogic": {"onPathTargetArrived": 2, "onMouseDown": 1, "onMouseClick": 1},
}
Q_NAMES = {"isAlreadyPickup": 7569, "canPickTime": 7597, "getTimer": 43278}
SELECTOR_TARGETS = ("getNearestDropPacket", "getDropPacketByXY")
IS_CHECK = 7570


@dataclass(frozen=True)
class Instruction:
    start: int
    end: int
    opcode: int
    operands: tuple[int, ...] = ()
    # (relative-field offset, target instruction offset, relative-base offset)
    branches: tuple[tuple[int, int, int], ...] = ()


def signed24(data, pos):
    value = int.from_bytes(data[pos:pos + 3], "little")
    return value - (1 << 24) if value & (1 << 23) else value


def encode_s24(value):
    if not -(1 << 23) <= value < (1 << 23):
        raise ValueError("Branch offset exceeds AVM2 s24")
    return (value & 0xFFFFFF).to_bytes(3, "little")


def instructions(code):
    """Decode the AVM2 instructions used by these inspected pickup methods."""
    reader = ABCReader(code)
    one_u30 = {0x08, 0x25, 0x2C, 0x2D, 0x2E, 0x2F, 0x40, 0x41, 0x42,
               0x49, 0x53, 0x55, 0x56, 0x58, 0x59, 0x5A, 0x5D, 0x5E,
               0x5F, 0x60, 0x61, 0x62, 0x63, 0x66, 0x68, 0x6A, 0x6C,
               0x6D, 0x6E, 0x6F, 0x80, 0x86, 0x92, 0x94, 0xB2, 0xC2,
               0xC3, 0xF0, 0xF1}
    two_u30 = {0x32, 0x43, 0x44, 0x45, 0x46, 0x4A, 0x4C, 0x4E, 0x4F}
    no_args = {0x02, 0x03, 0x09, 0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x21,
               0x23, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B, 0x30, 0x47,
               0x48, 0x50, 0x51, 0x52, 0x57, 0x64, 0x69, 0x70, 0x71,
               0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x81, 0x82,
               0x83, 0x84, 0x85, 0x87, 0x88, 0x89, 0x90, 0x91, 0x93,
               0x95, 0x96, 0x97, 0xB3, 0xC0, 0xC1, 0xC4, 0xC5, 0xC6,
               0xC7, *range(0xA0, 0xB2), *range(0xD0, 0xD8)}
    result = []
    while reader.pos < len(code):
        start = reader.pos
        opcode = reader.byte()
        operands = ()
        branches = []
        if 0x0C <= opcode <= 0x1A:
            field = reader.pos
            offset = signed24(code, field)
            reader.skip(3)
            branches.append((field, reader.pos + offset, reader.pos))
        elif opcode == 0x1B:
            field = reader.pos
            branches.append((field, start + signed24(code, field), start))
            reader.skip(3)
            count = reader.u30()
            operands = (count,)
            for _ in range(count + 1):
                field = reader.pos
                branches.append((field, start + signed24(code, field), start))
                reader.skip(3)
        elif opcode in one_u30:
            operands = (reader.u30(),)
        elif opcode in two_u30:
            operands = (reader.u30(), reader.u30())
        elif opcode in (0x24, 0x65):
            value = reader.byte()
            operands = (value - 256 if opcode == 0x24 and value > 127 else value,)
        elif opcode not in no_args:
            raise ValueError(f"Uninspected AVM2 opcode {opcode:#x} at {start}")
        result.append(Instruction(start, reader.pos, opcode, operands, tuple(branches)))
    boundaries = {op.start for op in result} | {len(code)}
    if any(target not in boundaries for op in result for _, target, _ in op.branches):
        raise ValueError("Branch does not target an instruction boundary")
    return result


def retry_assignment():
    # The canPickTime setter converts to int: +2 yields a delay of 1..2 seconds.
    # This is always >= MsgSender's 1000 ms same-drop request throttle.
    timer = encode_u30(Q_NAMES["getTimer"])
    return (b"\x5d" + timer + b"\x46" + timer + b"\x00\x25\xe8\x07\xa3\x24\x02\xa0\x61"
            + encode_u30(Q_NAMES["canPickTime"]))


def relocate(code, edits):
    ops = instructions(code)
    edits = sorted(edits)
    boundaries = {op.start for op in ops} | {len(code)}
    if any(a not in boundaries or b not in boundaries for a, b, _ in edits):
        raise ValueError("Edit splits an AVM2 instruction")

    def moved(offset):
        shift = 0
        for start, end, value in edits:
            if start < offset < end:
                raise ValueError("Branch or exception targets a replaced instruction")
            if end <= offset:
                shift += len(value) - (end - start)
        return offset + shift

    result = bytearray(code)
    for start, end, value in reversed(edits):
        result[start:end] = value
    for op in ops:
        for field, target, base in op.branches:
            result[moved(field):moved(field) + 3] = encode_s24(moved(target) - moved(base))
    decoded = instructions(result)
    expected = [(moved(op.start), tuple(moved(t) for _, t, _ in op.branches))
                for op in ops if op.branches]
    actual = [(op.start, tuple(t for _, t, _ in op.branches))
              for op in decoded if op.branches]
    if actual != expected:
        raise ValueError("An original branch or switch changed destination")
    return bytes(result), moved


def patch_abc(source):
    edits = []
    names, selectors, bodies = inspect_abc(source, "LogicManager")
    if selectors is None or names[IS_CHECK] != "isCheck":
        raise ValueError("Missing automatic pickup selector or isCheck property")
    for method_name in SELECTOR_TARGETS:
        start, length, _ = bodies[selectors[method_name][0]]
        code = source[start:start + length]
        old = b"\x26\x61" + encode_u30(IS_CHECK)
        new = b"\x27\x61" + encode_u30(IS_CHECK)
        positions = [op.start for op in instructions(code)
                     if code[op.start:op.start + len(old)] == old]
        patched = [op.start for op in instructions(code)
                   if code[op.start:op.start + len(new)] == new]
        if not positions and len(patched) == 1:
            continue
        if len(positions) != 1 or patched:
            raise ValueError(f"Unexpected category cache in {method_name}")
        # Same-length Boolean substitution retains every branch and method limit.
        position = start + positions[0]
        edits.append((position, position + 1, b"\x27"))
    for class_name, methods in TARGETS.items():
        names, traits, bodies = inspect_abc(source, class_name)
        if traits is None:
            raise ValueError(f"Missing pickup class {class_name}")
        for name, index in Q_NAMES.items():
            if names[index] != name:
                raise ValueError(f"Unexpected pickup QName {index}")
        for method_name, expected in methods.items():
            method = traits[method_name][0]
            start, length, limits = bodies[method]
            code = source[start:start + length]
            decoded = instructions(code)
            old = b"\x26\x61" + encode_u30(Q_NAMES["isAlreadyPickup"])
            new = retry_assignment()
            positions = [op.start for op in decoded
                         if op.opcode == 0x26 and code[op.start:op.start + len(old)] == old]
            new_positions = [op.start for op in decoded
                             if code[op.start:op.start + len(new)] == new]
            if len(positions) == 0 and len(new_positions) == expected:
                continue
            if len(positions) != expected or new_positions:
                raise ValueError(f"Unexpected pickup assignments in {class_name}.{method_name}")
            changed, moved = relocate(code, [(p, p + len(old), new) for p in positions])
            reader = ABCReader(source)
            reader.pos = start + length
            count = reader.u30()
            exceptions = []
            for _ in range(count):
                a, b, target, kind, var = (reader.u30() for _ in range(5))
                exceptions.append((moved(a), moved(b), moved(target), kind, var))
            if reader.u30() != 0:
                raise ValueError("Unexpected pickup method body traits")
            suffix = encode_u30(count) + b"".join(encode_u30(x) for row in exceptions for x in row) + b"\x00"
            length_start = start - len(encode_u30(length))
            marker = encode_u30(method) + b"".join(encode_u30(x) for x in limits)
            if source[length_start - len(marker):length_start] != marker:
                raise ValueError("Unexpected pickup method header")
            edits.append((length_start, reader.pos, encode_u30(len(changed)) + changed + suffix))
    result = bytearray(source)
    for a, b, value in sorted(edits, reverse=True):
        result[a:b] = value
    # Reparse the entire ABC, and verify it contains only the intended edits.
    for class_name in (*TARGETS, "LogicManager"):
        inspect_abc(result, class_name)
    restored = bytearray(result)
    shift = 0
    undo = []
    for a, b, value in sorted(edits):
        undo.append((a + shift, a + shift + len(value), source[a:b]))
        shift += len(value) - (b - a)
    for a, b, value in reversed(undo):
        restored[a:b] = value
    if restored != source:
        raise ValueError("Unrelated ABC bytes changed")
    return bytes(result)


def swf_data(source):
    if source[:3] != b"CWS":
        raise ValueError("Expected compressed GameFrame.swf")
    data = source[:8] + zlib.decompress(source[8:])
    if len(data) != struct.unpack_from("<I", source, 4)[0]:
        raise ValueError("Invalid SWF length")
    return data


def abc_section(source):
    data = swf_data(source)
    pos = 8 + (5 + (data[8] >> 3) * 4 + 7) // 8 + 4
    found = []
    while pos < len(data):
        tag_start = pos
        tag = struct.unpack_from("<H", data, pos)[0]
        pos += 2
        size = tag & 63
        if size == 63:
            size = struct.unpack_from("<I", data, pos)[0]
            pos += 4
        end = pos + size
        if tag >> 6 == 82:
            if tag & 63 != 63:
                raise ValueError("Expected long DoABC tag")
            start = data.index(b"\0", pos + 4, end) + 1
            found.append((tag_start, pos, start, end))
        pos = end
    if pos != len(data) or len(found) != 1:
        raise ValueError("Expected one complete client ABC")
    return data, found[0]


def patch_swf(source):
    data, (tag, payload, start, end) = abc_section(source)
    abc = patch_abc(data[start:end])
    if abc == data[start:end]:
        return source
    result = (data[:tag + 2] + struct.pack("<I", start - payload + len(abc))
              + data[payload:start] + abc + data[end:])
    result = result[:4] + struct.pack("<I", len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(abc):] != data[end:]:
        raise ValueError("Unrelated SWF tags changed")
    return result[:8] + zlib.compress(result[8:], 9)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    result = patch_swf(source)
    if patch_swf(result) != result:
        raise ValueError("Pickup retry patch is not idempotent")
    if args.check:
        if source != result:
            raise ValueError("Pickup retry patch is missing")
    elif source != result:
        CLIENT.write_bytes(result)
    print("Verified pickup retries and uncached category checks; unrelated client bytes preserved")


if __name__ == "__main__":
    main()
