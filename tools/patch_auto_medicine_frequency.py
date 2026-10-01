"""Poll automatic HP/MP medicine every 100 ms without an extra protection delay.

Keep TimerControl's existing action deadlines and repeat intervals in seconds.
Its 100 ms timer checks medicine on each tick, while all original scheduled
actions still run on whole-second ticks. Only medicine protection types 0..3
use the fast path; teleport items, repair and defensive skills retain their
original cadence and configured delay. Check the item's shared cooldown group
before using it, so a failed cooldown check never starts another delay or emits
the normal manual-use cooldown warning.

Patch the current GameFrame.swf locally, retaining its other client changes.
No constant pool entries, graphics, server cooldowns or protection settings change.
"""
from __future__ import annotations

from pathlib import Path
import struct
import zlib

from patch_activity_entries import relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, encode_s24, instructions
from patch_god_equip_state import inspect_abc

CLIENT = Path(__file__).resolve().parents[1] / "web/GameFrame.swf"
TIMER_CONSTRUCTOR = 4836
TIMER_ADD_ACTION = 4834
NAMES = {
    "Boolean": 3, "currentCount": 4996, "updateProtectConfig": 5080,
    "LocalPlayer": 2834, "denyUseItemStateCount": 2964, "itemState": 6438,
    "type": 6015, "stdItem": 6407, "colGroup": 14340,
    "canDoit": 15063, "setNextDoTime": 15064, "ItemCooling": 23523,
    "GlobalData": 1507, "systemConfigDataMgr": 31199,
    "mainActor": 32899,
    "CHECK_INTERVAL": 34316, "_timer": 34319,
    "getItemResumeTime": 42674, "getTimer": 43278,
}


def q(opcode, name, *args):
    return bytes([opcode]) + encode_u30(NAMES[name]) + b"".join(encode_u30(x) for x in args)


def locate(code, pattern):
    found = [op.start for op in instructions(code)
             if code[op.start:op.start + len(pattern)] == pattern]
    if len(found) != 1:
        raise ValueError("Unexpected automatic medicine instruction pattern")
    return found[0]


class Block:
    """Build local branches and retain references to original method labels."""

    def __init__(self):
        self.code = bytearray()
        self.labels = {}
        self.branches = []

    def emit(self, value):
        self.code.extend(value)

    def label(self, name):
        self.labels[name] = len(self.code)

    def branch(self, opcode, target):
        self.code.append(opcode)
        self.branches.append((len(self.code), target))
        self.code.extend(b"\0\0\0")

    def finish(self):
        external = []
        for field, target in self.branches:
            if isinstance(target, str):
                self.code[field:field + 3] = encode_s24(self.labels[target] - field - 3)
            else:
                # A zero offset is valid until the original label is relocated.
                external.append((field, target))
        return bytes(self.code), external


def edit_method(code, edits):
    changed, moved = relocate(code, [(a, b, value) for a, b, value, _ in edits])
    result = bytearray(changed)
    for start, _, _, external in edits:
        for field, target in external:
            new_field = moved(start) + field
            result[new_field:new_field + 3] = encode_s24(moved(target) - new_field - 3)
    instructions(result)
    return bytes(result)


def normalize_timer_count(code):
    old = q(0x60, "_timer") + q(0x66, "currentCount")
    start = locate(code, old)
    # Preserve the previous second-based deadlines despite 10 timer ticks/sec.
    value = old + b"\x24\x0a\xa3\x73"
    return edit_method(code, [(start, start + len(old), value, [])])


def patch_timer_handler(code):
    code = normalize_timer_count(code)
    ops = instructions(code)
    compare = b"\xd3\x66\x80\x2f\xd2"  # info.exeTime <= current second
    start = locate(code, compare)
    check = next(op for op in ops if op.start == start + len(compare))
    if check.opcode != 0x0D:
        raise ValueError("Unexpected timer deadline comparison")
    next_action = check.branches[0][1]
    block = Block()
    block.emit(b"\xd3" + q(0x66, "type") + b"\x24\x02")
    block.branch(0x14, "cadence")
    block.emit(q(0x60, "GlobalData") + q(0x66, "systemConfigDataMgr")
               + b"\x26" + q(0x4F, "updateProtectConfig", 1))
    block.label("cadence")
    block.emit(q(0x60, "_timer") + q(0x66, "currentCount") + b"\x24\x0a\xa4\x24\x00")
    block.branch(0x14, next_action)
    block.emit(b"\xd3")
    value, external = block.finish()
    return edit_method(code, [(start, start + 1, value, external)])


def patch_protection(code):
    ops = instructions(code)
    loop = next(op.start for op in ops if op.opcode == 0x32 and op.operands == (10, 9))
    if code[:5] != b"\xd0\x30\x24\x00\xd5":
        raise ValueError("Unexpected protection method initialization")
    # Copy the new Boolean argument before the original local 1 is initialized.
    edits = [(2, 4, b"\xd1\x63\x0d\x24\x00", [])]
    entry = locate(code, b"\x23\x80\x8d\x02\xd6\x24\x00\xd5") + 5
    block = Block()
    block.emit(b"\x62\x0d\xd2" + q(0x66, "type") + b"\x24\x04\xad")
    block.branch(0x14, loop)  # fast != (type < 4): process on the other cadence
    block.emit(b"\x24\x00\xd5")
    value, external = block.finish()
    edits.append((entry, entry + 3, value, external))

    gate = b"\xd2" + q(0x46, "canDoit", 0)
    start = locate(code, gate)
    branch = next(op for op in ops if op.start == start + len(gate))
    if branch.opcode != 0x11:
        raise ValueError("Unexpected protection delay gate")
    block = Block()
    block.emit(b"\x62\x0d")
    block.branch(0x11, branch.branches[0][1])  # medicine ignores the configured delay
    block.emit(gate)
    value, external = block.finish()
    edits.append((start, start + len(gate), value, external))

    delay = b"\xd2" + q(0x4F, "setNextDoTime", 0)
    start = locate(code, delay)
    block = Block()
    block.emit(b"\x62\x0d")
    block.branch(0x12, "delay")
    block.emit(q(0x60, "ItemCooling") + b"\x62\x06" + q(0x66, "stdItem")
               + q(0x66, "colGroup") + q(0x46, "getItemResumeTime", 1)
               + q(0x5D, "getTimer") + q(0x46, "getTimer", 0))
    block.branch(0x17, loop)  # resume time > now: quietly wait for the next tick
    block.emit(b"\x62\x06" + q(0x66, "itemState") + b"\x24\x00")
    block.branch(0x14, loop)
    block.emit(q(0x60, "LocalPlayer") + q(0x66, "mainActor"))
    block.branch(0x12, "use")
    block.emit(q(0x60, "LocalPlayer") + q(0x66, "mainActor")
               + q(0x66, "denyUseItemStateCount") + b"\x24\x00")
    block.branch(0x17, loop)  # a temporary use prohibition must not flood chat
    block.branch(0x10, "use")
    block.label("delay")
    block.emit(delay)
    block.label("use")
    value, external = block.finish()
    edits.append((start, start + len(delay), value, external))

    tail = next(op.end for op in ops if op.start == loop)
    tail = next(op.end for op in ops if op.start == tail)
    if code[tail:tail + 4] != b"\x08\x0a\x08\x09":
        raise ValueError("Unexpected protection loop cleanup")
    tail += 4
    if code[tail:tail + 3] != b"\x24\x00\xd7":
        raise ValueError("Unexpected mage protection initialization")
    value = b"\x62\x0d\x12\x01\0\0\x47\x24\x00\xd7"
    edits.append((tail, tail + 3, value, []))  # mage protection remains once/sec
    return edit_method(code, edits)


def method_signature(data, target):
    reader = ABCReader(data)
    reader.skip(4)
    for _ in range(2):
        for _ in range(reader.u30() - 1):
            reader.u30()
    reader.skip(8 * (reader.u30() - 1))
    for _ in range(reader.u30() - 1):
        reader.skip(reader.u30())
    for _ in range(reader.u30() - 1):
        reader.byte()
        reader.u30()
    for _ in range(reader.u30() - 1):
        for _ in range(reader.u30()):
            reader.u30()
    for _ in range(reader.u30() - 1):
        kind = reader.byte()
        if kind in (7, 13, 9, 14):
            reader.u30()
            reader.u30()
        elif kind in (15, 16, 27, 28):
            reader.u30()
        elif kind == 29:
            reader.u30()
            for _ in range(reader.u30()):
                reader.u30()
        elif kind not in (17, 18):
            raise ValueError("Unexpected ABC multiname")
    for method in range(reader.u30()):
        start = reader.pos
        count = reader.u30()
        returns = reader.u30()
        params = [reader.u30() for _ in range(count)]
        name = reader.u30()
        flags = reader.byte()
        optional = [(reader.u30(), reader.byte()) for _ in range(reader.u30())] if flags & 8 else []
        if flags & 128:
            for _ in range(count):
                reader.u30()
        if method == target:
            return start, reader.pos, returns, params, name, flags, optional
    raise ValueError("Missing protection method signature")


def patch_abc(source):
    names, protection, bodies = inspect_abc(source, "SystemConfigDataMgr")
    _, timer, _ = inspect_abc(source, "TimerControl")
    for name, index in NAMES.items():
        if names[index] != name:
            raise ValueError(f"Unexpected medicine QName: {name}")
    method = protection["updateProtectConfig"][0]
    a, b, returns, params, name, flags, optional = method_signature(source, method)
    signature = encode_u30(1) + encode_u30(returns) + encode_u30(NAMES["Boolean"])
    signature += encode_u30(name) + b"\x08\x01\x00\x0a"  # optional fast:Boolean = false
    if params == [NAMES["Boolean"]] and flags == 8 and optional == [(0, 10)]:
        start, length, _ = bodies[method]
        code = source[start:start + length]
        if not code.startswith(b"\xd0\x30\xd1\x63\x0d") or q(0x60, "ItemCooling") not in code:
            raise ValueError("Incomplete automatic medicine patch")
        return source
    if params or flags or optional:
        raise ValueError("Unexpected original protection signature")
    edits = [(a, b, signature)]

    constructor = lambda code: edit_method(code, [
        (locate(code, q(0x60, "CHECK_INTERVAL")),
         locate(code, q(0x60, "CHECK_INTERVAL")) + len(q(0x60, "CHECK_INTERVAL")),
         b"\x24\x64", [])])
    normal = q(0x4F, "updateProtectConfig", 0)

    def slow_call(code):
        start = locate(code, normal)
        return edit_method(code, [(start, start + len(normal),
                                  b"\x27" + q(0x4F, "updateProtectConfig", 1), [])])

    targets = {
        method: (patch_protection, (4, 13, 4, 5), 14),
        TIMER_CONSTRUCTOR: (constructor, (3, 1, 4, 5), 1),
        TIMER_ADD_ACTION: (normalize_timer_count, (5, 7, 3, 4), 7),
        timer["onTimer"][0]: (patch_timer_handler, (3, 5, 4, 5), 5),
        timer["doActionByType"][0]: (slow_call, (3, 3, 4, 5), 3),
    }
    for method, (patch, expected, locals_count) in targets.items():
        start, length, limits = bodies[method]
        if limits != expected:
            raise ValueError("Unexpected automatic medicine method limits")
        code = patch(source[start:start + length])
        marker = encode_u30(method) + b"".join(encode_u30(x) for x in limits)
        header = start - len(encode_u30(length)) - len(marker)
        if source[header:header + len(marker)] != marker:
            raise ValueError("Unexpected automatic medicine method header")
        reader = ABCReader(source)
        reader.pos = start + length
        if reader.u30() != 0 or reader.u30() != 0:
            raise ValueError("Unexpected automatic medicine exception table")
        limits = (limits[0], locals_count, limits[2], limits[3])
        marker = encode_u30(method) + b"".join(encode_u30(x) for x in limits)
        edits.append((header, reader.pos, marker + encode_u30(len(code)) + code + b"\0\0"))
    result = bytearray(source)
    for a, b, value in sorted(edits, reverse=True):
        result[a:b] = value
    inspect_abc(result, "SystemConfigDataMgr")
    # Restoring only the permitted method bodies/signature must recover the ABC.
    undo = []
    shift = 0
    for a, b, value in sorted(edits):
        undo.append((a + shift, a + shift + len(value), source[a:b]))
        shift += len(value) - (b - a)
    restored = bytearray(result)
    for a, b, value in reversed(undo):
        restored[a:b] = value
    if restored != source:
        raise ValueError("Unrelated automatic medicine ABC data changed")
    return bytes(result)


def patch_swf(source):
    data, (tag, payload, start, end) = abc_section(source)
    abc = patch_abc(data[start:end])
    if abc == data[start:end]:
        return source
    result = (data[:tag + 2] + struct.pack("<I", start - payload + len(abc))
              + data[payload:start] + abc + data[end:])
    result = result[:4] + struct.pack("<I", len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(abc):] != data[end:]:
        raise ValueError("Unrelated automatic medicine SWF tags changed")
    return result[:8] + zlib.compress(result[8:], 9)


if __name__ == "__main__":
    source = CLIENT.read_bytes()
    result = patch_swf(source)
    if result != source:
        CLIENT.write_bytes(result)
    print("Automatic medicine now checks cooldowns every 100 ms; other actions retain their cadence")
