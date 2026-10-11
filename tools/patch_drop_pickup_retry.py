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

For item-ID categories with a single option, always use range zero, matching the
settings page. Reject saved indexes equal to the range count before accessing
idRange[index], so a stale category cannot throw and abort later material checks.

Patch five request assignments, two category-cache writes and two range-selection
instructions, preserving constant pools, other method bodies, SWF tags and
pickup categories.
In the coordinate selector, continue scanning when an overlapping drop is
excluded, protected, pending retry or unable to fit in the backpack. Returning
null at that point used to hide every eligible drop underneath it.
Recheck the player's current tile every 500 ms during normal player updates.
Movement used to be the only automatic trigger outside auto-fighting, so a
protected drop or an unconfirmed request could remain uncollected indefinitely
while the player stood still. Reuse the existing update tick and request gates.
While auto-fighting, also collect eligible drops within two tiles when the
current tile is empty. Continuous attacks otherwise skip the original drop
scan. Use the existing pickup path that resumes auto-fight, with the same filters.
During movement, let every eligible tile issue its own pickup request. The old
player-wide 500 ms interval skipped a second drop when running across adjacent
tiles; the stationary scan cannot recover a drop more than two tiles behind.
Keep each drop's retry delay and MsgSender's same-drop throttle authoritative.
If a nearby pickup path fails, resume auto-fight immediately. The pickup helper
stops auto-fight before walking; ignoring a rejected path used to leave it off
until the player manually enabled it again. Retry only on a later update tick.
Also recover when an accepted pickup path fails during a later movement update.
Capture its arrival action before aborting, and resume only fight-and-pickup
paths. Ordinary paths and explicit cancellation retain their original behavior.
Reset the nearest selector's category result for each drop. Position corrections
can re-enable a ground-image model with type -2; it must not inherit an earlier
material's enabled category and displace the actual pickup model.
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
IDLE_NAMES = {
    "AutoPick": 32910, "m_dwUpdateTick": 2835, "currentX": 2011,
    "currentY": 2012, "moving": 2194, "jumping": 2365,
    "isDivineSwording": 2994, "died": 2334, "stalling": 2626,
    "practice": 2628, "fastBattling": 2627, "GameMap": 2084,
    "defaultMap": 32840, "loadingMap": 2106, "LogicManager": 5710,
    "defaultManager": 34265, "getDropPacketByXY": 5855,
    "MapDropItemPacket": 236, "MsgSender": 11023,
    "sendPickupDropItem": 37283, "m_nRecog": 2203,
    "m_autoPickLastTime": 2927, "getTimer": 43278,
    "autoFighting": 2977, "m_boUnderPath": 2852,
    "getNearestDropPacket": 5763, "leaveForNearestItemForAutoFight": 3009,
    "Math": 43301, "abs": 43413,
}


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
    names, lookup, bodies = inspect_abc(source, "SystemConfigDataMgr")
    expected_names = {10213: "options", 3237: "length", 10212: "idRange"}
    if lookup is None or any(names[index] != name for index, name in expected_names.items()):
        raise ValueError("Unexpected item-ID pickup range properties")
    start, length, _ = bodies[lookup["getPickUpStatusByItemId"][0]]
    code = source[start:start + length]
    # options.length > 1: single-option categories have no selectable index.
    options = b"\x66" + encode_u30(10213) + b"\x66" + encode_u30(3237) + b"\x24\x00\x0e"
    # Valid range condition: length > index, rather than length >= index.
    ranges = b"\x66" + encode_u30(10212) + b"\x66" + encode_u30(3237) + b"\x62\x09\x0c"
    for old, offset, value in ((options, len(options) - 2, b"\x01"),
                               (ranges, len(ranges) - 1, b"\x0d")):
        new = old[:offset] + value + old[offset + 1:]
        positions = [op.start for op in instructions(code)
                     if code[op.start:op.start + len(old)] == old]
        patched = [op.start for op in instructions(code)
                   if code[op.start:op.start + len(new)] == new]
        if not positions and len(patched) == 1:
            continue
        if len(positions) != 1 or patched:
            raise ValueError("Unexpected item-ID pickup range selection")
        position = start + positions[0] + offset
        # Same-length operand/opcode changes retain all branch destinations.
        edits.append((position, position + 1, value))
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
    for class_name in (*TARGETS, "LogicManager", "SystemConfigDataMgr"):
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


def patch_stacked_drops(source):
    names, traits, bodies = inspect_abc(source, "LogicManager")
    method = traits["getDropPacketByXY"][0]
    start, length, limits = bodies[method]
    code = source[start:start + length]
    ops = instructions(code)
    # Local 7 is the reverse scan index; always advance it after skipping a drop.
    tail = b"\x62\x07\xc1\x63\x07"
    tails = [op.start for op in ops if code[op.start:op.start + len(tail)] == tail]
    if len(tails) != 1 or limits != (4, 8, 4, 5):
        raise ValueError("Unexpected overlapping-drop scan loop")
    next_drop = tails[0]
    # Keep the terminal null return after the loop and the eligible-drop return.
    skips = [op.start for op in ops if op.start < next_drop
             and code[op.start:op.start + 2] == b"\x20\x48"]
    if not skips:
        jumps = [op for op in ops if op.opcode == 0x10
                 and op.branches[0][1] == next_drop]
        if len(jumps) != 5:
            raise ValueError("Unexpected patched overlapping-drop guards")
        return source
    if len(skips) != 5:
        raise ValueError("Unexpected overlapping-drop early returns")
    # Relocate the original control flow first; install new jumps afterward.
    changed, moved = relocate(code, [(p, p + 2, b"\x02" * 4) for p in skips])
    changed = bytearray(changed)
    for p in skips:
        changed[moved(p)] = 0x10
        field = moved(p) + 1
        changed[field:field + 3] = encode_s24(moved(next_drop) - field - 3)
    instructions(changed)
    reader = ABCReader(source)
    reader.pos = start + length
    count = reader.u30()
    exceptions = []
    for _ in range(count):
        a, b, target, kind, var = (reader.u30() for _ in range(5))
        exceptions.append((moved(a), moved(b), moved(target), kind, var))
    if reader.u30() != 0:
        raise ValueError("Unexpected overlapping-drop method traits")
    suffix = encode_u30(count) + b"".join(encode_u30(x) for row in exceptions for x in row) + b"\x00"
    length_start = start - len(encode_u30(length))
    marker = encode_u30(method) + b"".join(encode_u30(x) for x in limits)
    if source[length_start - len(marker):length_start] != marker:
        raise ValueError("Unexpected overlapping-drop method header")
    replacement = encode_u30(len(changed)) + changed + suffix
    result = source[:length_start] + replacement + source[reader.pos:]
    inspect_abc(result, "LogicManager")
    # Reversing this single method edit must recover the entire original ABC.
    if (result[:length_start] + source[length_start:reader.pos]
            + result[length_start + len(replacement):]) != source:
        raise ValueError("Unrelated overlapping-drop client bytes changed")
    return result


def patch_movement_pickup(source):
    """Remove only the cross-drop throttle from the existing tile pickup path."""
    names, traits, bodies = inspect_abc(source, "LocalPlayer")
    if names[32906] != "AUTO_PICK_TIME_INTERVAL" or names[13670] != "LogicEventDispatcher":
        raise ValueError("Unexpected movement pickup throttle properties")
    start, length, limits = bodies[traits["setCurrentXY"][0]]
    code = source[start:start + length]
    ops = instructions(code)
    marker = b"\x60" + encode_u30(32906) + b"\xaf"
    gates = [op for op in ops if code[op.start:op.start + len(marker)] == marker]
    if len(gates) != 1:
        raise ValueError("Unexpected movement pickup interval expression")
    gate = gates[0].start + len(marker)
    neutral = b"\x29\x02\x02\x02"  # consume the Boolean without skipping this tile
    if code[gate:gate + 4] == neutral:
        return source
    branch = next((op for op in ops if op.start == gate), None)
    if branch is None or branch.opcode != 0x12 or branch.end != gate + 4:
        raise ValueError("Unexpected movement pickup interval branch")
    destination = branch.branches[0][1]
    dispatch = b"\x60" + encode_u30(13670)
    if code[destination:destination + len(dispatch)] != dispatch:
        raise ValueError("Movement interval does not skip only the pickup block")
    # pop has the same stack effect as iffalse. Its three padding bytes preserve
    # every original offset, including the other Boolean branch into this gate.
    changed = bytearray(source)
    changed[start + gate:start + gate + 4] = neutral
    instructions(changed[start:start + length])
    _, _, updated_bodies = inspect_abc(changed, "LocalPlayer")
    if updated_bodies != bodies or changed[:start + gate] != source[:start + gate] or changed[
            start + gate + 4:] != source[start + gate + 4:]:
        raise ValueError("Unrelated movement pickup client bytes changed")
    return bytes(changed)


def patch_failed_pickup_path(source):
    """Resume auto-fight when walking to the nearest eligible drop is rejected."""
    names, traits, bodies = inspect_abc(source, "LocalPlayer")
    method = traits["leaveForNearestItemForAutoFight"][0]
    start, length, limits = bodies[method]
    code = source[start:start + length]
    if limits != (6, 2, 13, 14) or names[3008] != "leaveFor" or names[2995] != "startAutoFight":
        raise ValueError("Unexpected automatic pickup path helper")
    ops = instructions(code)
    calls = [op for op in ops if op.opcode in (0x46, 0x4F)
             and op.operands == (3008, 3)]
    resumes = [op for op in ops if op.opcode == 0x4F and op.operands == (2995, 0)]
    if len(calls) != 1 or len(resumes) != 1:
        raise ValueError("Unexpected automatic pickup path calls")
    call = calls[0]
    resume = resumes[0].start - 1
    if code[resume] != 0xD0:
        raise ValueError("Unexpected automatic pickup resume receiver")
    following = next(op for op in ops if op.start == call.end)
    if call.opcode == 0x46:
        if following.opcode != 0x12 or following.branches[0][1] != resume:
            raise ValueError("Unexpected patched automatic pickup failure branch")
        return source
    if following.opcode != 0x10:
        raise ValueError("Unexpected automatic pickup success exit")
    # Keep the original success jump. The Boolean result goes to the existing
    # no-drop resume block only when leaveFor returns false. No recursive retry.
    neutral = bytearray(code)
    neutral[call.start] = 0x46
    changed, moved = relocate(bytes(neutral), [(call.end, call.end, b"\x02" * 4)])
    changed = bytearray(changed)
    branch = moved(call.end) - 4
    changed[branch] = 0x12
    changed[branch + 1:branch + 4] = encode_s24(moved(resume) - branch - 4)
    instructions(changed)
    reader = ABCReader(source)
    reader.pos = start + length
    if reader.u30() != 0 or reader.u30() != 0:
        raise ValueError("Unexpected automatic pickup helper exceptions or traits")
    length_start = start - len(encode_u30(length))
    replacement = encode_u30(len(changed)) + changed + b"\0\0"
    result = source[:length_start] + replacement + source[reader.pos:]
    inspect_abc(result, "LocalPlayer")
    if result[:length_start] + source[length_start:reader.pos] + result[
            length_start + len(replacement):] != source:
        raise ValueError("Unrelated automatic pickup path client bytes changed")
    return result


def patch_nearest_category_state(source):
    """Do not reuse the preceding drop's category result for an image model."""
    names, traits, bodies = inspect_abc(source, "LogicManager")
    method = traits["getNearestDropPacket"][0]
    start, length, limits = bodies[method]
    code = source[start:start + length]
    if limits != (5, 11, 4, 5) or names[5717] != "m_DropPacketList":
        raise ValueError("Unexpected nearest-drop selector")
    ops = instructions(code)
    reads = [op for op in ops if op.opcode == 0x66 and op.operands == (5717,)]
    if len(reads) != 2:
        raise ValueError("Unexpected nearest-drop iteration")
    receiver = reads[1].start - 1
    if code[receiver] != 0xD0:
        raise ValueError("Unexpected nearest-drop receiver")
    reset = b"\x27\x63\x09"  # pickable = false for this iteration
    if code[receiver - len(reset):receiver] == reset:
        return source
    if code[receiver - 1] != 0x09 or code.count(reset) != 1:
        raise ValueError("Unexpected nearest-drop category state")
    # Insert after the loop label, so every iteration executes the reset.
    changed, _ = relocate(code, [(receiver, receiver, reset)])
    reader = ABCReader(source)
    reader.pos = start + length
    if reader.u30() != 0 or reader.u30() != 0:
        raise ValueError("Unexpected nearest-drop exceptions or traits")
    length_start = start - len(encode_u30(length))
    replacement = encode_u30(len(changed)) + changed + b"\0\0"
    result = source[:length_start] + replacement + source[reader.pos:]
    inspect_abc(result, "LogicManager")
    return result


def patch_failed_pickup_movement(source):
    """Restore the paused fight after a later failure of its pickup path."""
    names, traits, bodies = inspect_abc(source, "LocalPlayer")
    method = traits["moveOnPath"][0]
    start, length, limits = bodies[method]
    code = source[start:start + length]
    expected = {2855: "m_PathLocation", 13946: "ArrivedAction", 6158: "action",
                11024: "PathEndActionType", 37297: "PE_ACT_FIGHT_AND_PICKUP",
                3074: "moveToNextPathPoint", 3011: "abortPath", 2995: "startAutoFight"}
    if limits != (5, 5, 13, 14) or any(names[q] != name for q, name in expected.items()):
        raise ValueError("Unexpected pickup movement properties or limits")
    ops = instructions(code)
    calls = [op for op in ops if op.opcode == 0x46 and op.operands == (3074, 0)]
    if len(calls) != 1:
        raise ValueError("Unexpected movement continuation")
    call = calls[0]
    following = next(op for op in ops if op.start == call.end)
    if following.opcode != 0x11:
        raise ValueError("Unexpected movement-success branch")
    failure = following.end
    finish = following.branches[0][1]
    if code[finish:] != b"\x47":
        raise ValueError("Unexpected movement exit")

    def q(op, name, *args):
        index = next(i for i, value in expected.items() if value == name)
        return bytes([op]) + encode_u30(index) + b"".join(encode_u30(a) for a in args)

    block = bytearray(b"\xd0" + q(0x66, "m_PathLocation")
                      + q(0x66, "ArrivedAction") + b"\x63\x04\x62\x04")
    no_action = len(block)
    block.extend(b"\x12\0\0\0")
    block.extend(b"\x62\x04" + q(0x66, "action") + q(0x60, "PathEndActionType")
                 + q(0x66, "PE_ACT_FIGHT_AND_PICKUP") + b"\xab\x63\x04")
    to_abort = len(block)
    block.extend(b"\x10\0\0\0")
    empty = len(block)
    block.extend(b"\x27\x63\x04")
    abort = len(block)
    block.extend(b"\xd0" + q(0x4F, "abortPath", 0) + b"\x62\x04")
    no_resume = len(block)
    block.extend(b"\x12\0\0\0\xd0" + q(0x4F, "startAutoFight", 0))
    for branch, target in ((no_action, empty), (to_abort, abort), (no_resume, len(block))):
        block[branch + 1:branch + 4] = encode_s24(target - branch - 4)
    if code[failure:finish] == block:
        return source
    if code[failure:finish] != b"\xd0" + q(0x4F, "abortPath", 0):
        raise ValueError("Unexpected movement failure handler")
    # No original branch may enter the replacement's interior. Relocate the
    # success/guard branches first, then install the self-contained failure block.
    neutral = bytearray(code)
    neutral[failure:finish] = b"\x02" * (finish - failure)
    changed, moved = relocate(bytes(neutral),
                              [(failure, finish, b"\x02" * len(block))])
    changed = bytearray(changed)
    changed[failure:failure + len(block)] = block
    instructions(changed)
    if moved(finish) != failure + len(block):
        raise ValueError("Unexpected pickup movement relocation")
    reader = ABCReader(source)
    reader.pos = start + length
    if reader.u30() != 0 or reader.u30() != 0:
        raise ValueError("Unexpected movement exceptions or traits")
    length_start = start - len(encode_u30(length))
    replacement = encode_u30(len(changed)) + changed + b"\0\0"
    result = source[:length_start] + replacement + source[reader.pos:]
    inspect_abc(result, "LocalPlayer")
    return result


def idle_pickup_code(nearby=True):
    """Check the current tile and nearby combat drops with existing filters."""
    def q(opcode, name, *args):
        return (bytes([opcode]) + encode_u30(IDLE_NAMES[name])
                + b"".join(encode_u30(x) for x in args))

    # Save whether we crossed a 500 ms boundary before m_dwUpdateTick is updated.
    half_second = b"\x25\xf4\x03\xa3\x73"
    cadence = (b"\xd1" + half_second + b"\xd0" + q(0x66, "m_dwUpdateTick")
               + half_second + b"\xab\x96\xd6")
    block = bytearray()
    exits = []

    def guard(value, opcode=0x12):
        block.extend(value)
        block.append(opcode)
        exits.append(len(block))
        block.extend(b"\0\0\0")

    guard(b"\xd2")
    guard(q(0x60, "AutoPick"))
    for name in ("died", "moving", "jumping", "isDivineSwording",
                 "stalling", "practice", "fastBattling"):
        guard(b"\xd0" + q(0x66, name), 0x11)
    block.extend(q(0x60, "GameMap") + q(0x66, "defaultMap") + b"\xd7")
    guard(b"\xd3")
    guard(b"\xd3" + q(0x66, "loadingMap"), 0x11)
    block.extend(q(0x60, "LogicManager") + q(0x66, "defaultManager") + b"\xd7")
    guard(b"\xd3")
    block.extend(q(0x5D, "getTimer") + q(0x46, "getTimer", 0) + b"\x73\xd6")
    # Preserve the 500 ms player-wide gate shared with movement and auto-fight.
    guard(b"\xd2\xd0" + q(0x66, "m_autoPickLastTime")
          + b"\xa1\x25\xf4\x03\xaf")  # elapsed > 500
    block.extend(b"\xd3\xd0" + q(0x66, "currentX")
                 + b"\xd0" + q(0x66, "currentY") + b"\x26"
                 + q(0x46, "getDropPacketByXY", 3)
                 + q(0x80, "MapDropItemPacket") + b"\xd7")
    if nearby:
        # Prefer the current tile. Only walk for drops during auto-fight, without
        # replacing an already active path or walking farther than two tiles.
        block.extend(b"\xd3\x11\0\0\0")
        on_tile = len(block) - 3
        guard(b"\xd0" + q(0x66, "autoFighting"))
        guard(b"\xd0" + q(0x66, "m_boUnderPath"), 0x11)
        block.extend(q(0x60, "LogicManager") + q(0x66, "defaultManager")
                     + b"\x26" + q(0x46, "getNearestDropPacket", 1)
                     + q(0x80, "MapDropItemPacket") + b"\xd7")
        guard(b"\xd3")
        for name in ("currentX", "currentY"):
            guard(q(0x60, "Math") + b"\xd3" + q(0x66, name)
                  + b"\xd0" + q(0x66, name) + b"\xa1"
                  + q(0x46, "abs", 1) + b"\x24\x02", 0x17)
        block.extend(b"\xd0\xd2" + q(0x68, "m_autoPickLastTime"))
        block.extend(b"\xd0" + q(0x4F, "leaveForNearestItemForAutoFight", 0))
        guard(b"\x26", 0x11)
        block[on_tile:on_tile + 3] = encode_s24(len(block) - on_tile - 3)
    guard(b"\xd3")
    # Install the retry delay before dispatch, matching the path-arrival flow.
    block.extend(b"\xd3" + retry_assignment())
    block.extend(b"\xd0\xd2" + q(0x68, "m_autoPickLastTime"))
    block.extend(q(0x60, "MsgSender") + b"\xd3" + q(0x66, "m_nRecog")
                 + q(0x4F, "sendPickupDropItem", 1))
    for field in exits:
        block[field:field + 3] = encode_s24(len(block) - field - 3)
    instructions(block)
    return cadence, bytes(block)


def patch_idle_pickup(source):
    names, traits, bodies = inspect_abc(source, "LocalPlayer")
    if any(names[index] != name for name, index in IDLE_NAMES.items()):
        raise ValueError("Unexpected stationary pickup properties")
    method = traits["update"][0]
    start, length, limits = bodies[method]
    code = source[start:start + length]
    cadence, block = idle_pickup_code()
    if code[2:2 + len(cadence)] == cadence and code.count(block) == 1:
        if limits != (4, 4, 13, 14):
            raise ValueError("Unexpected stationary pickup method limits")
        return source
    _, legacy = idle_pickup_code(nearby=False)
    if code[2:2 + len(cadence)] == cadence and code.count(legacy) == 1:
        if limits != (4, 4, 13, 14):
            raise ValueError("Unexpected legacy stationary pickup limits")
        hook = code.index(legacy)
        # Neutralize old hook branches before replacing it. Original branches
        # may skip the hook but must never enter its interior.
        neutral = bytearray(code)
        for op in instructions(code):
            if hook <= op.start < hook + len(legacy):
                neutral[op.start:op.end] = b"\x02" * (op.end - op.start)
            elif any(hook < target < hook + len(legacy)
                     for _, target, _ in op.branches):
                raise ValueError("Original branch enters stationary pickup hook")
        changed, moved = relocate(bytes(neutral),
                                  [(hook, hook + len(legacy), b"\x02" * len(block))])
        changed = bytearray(changed)
        destination = moved(hook)
        changed[destination:destination + len(block)] = block
        instructions(changed)
        reader = ABCReader(source)
        reader.pos = start + length
        if reader.u30() != 0 or reader.u30() != 0:
            raise ValueError("Unexpected stationary pickup exceptions or traits")
        length_start = start - len(encode_u30(length))
        replacement = encode_u30(len(changed)) + changed + b"\0\0"
        result = source[:length_start] + replacement + source[reader.pos:]
        inspect_abc(result, "LocalPlayer")
        if (result[:length_start] + source[length_start:reader.pos]
                + result[length_start + len(replacement):]) != source:
            raise ValueError("Unrelated nearby pickup client bytes changed")
        return result
    if limits != (3, 2, 13, 14) or code[:2] != b"\xd0\x30":
        raise ValueError("Unexpected player update method")
    supers = [op for op in instructions(code) if op.opcode == 0x4E
              and names[op.operands[0]] == "update" and op.operands[1] == 1]
    if len(supers) != 1:
        raise ValueError("Missing superclass player update")
    hook = supers[0].end
    changed, moved = relocate(code, [(2, 2, b"\x02" * len(cadence)),
                                     (hook, hook, b"\x02" * len(block))])
    changed = bytearray(changed)
    changed[moved(2) - len(cadence):moved(2)] = cadence
    changed[moved(hook) - len(block):moved(hook)] = block
    instructions(changed)
    reader = ABCReader(source)
    reader.pos = start + length
    if reader.u30() != 0 or reader.u30() != 0:
        raise ValueError("Unexpected player update exception table or traits")
    length_start = start - len(encode_u30(length))
    marker = encode_u30(method) + b"".join(encode_u30(x) for x in limits)
    header_start = length_start - len(marker)
    if source[header_start:length_start] != marker:
        raise ValueError("Unexpected player update header")
    replacement = (encode_u30(method)
                   + b"".join(encode_u30(x) for x in (4, 4, 13, 14))
                   + encode_u30(len(changed)) + changed + b"\0\0")
    result = source[:header_start] + replacement + source[reader.pos:]
    inspect_abc(result, "LocalPlayer")
    if (result[:header_start] + source[header_start:reader.pos]
            + result[header_start + len(replacement):]) != source:
        raise ValueError("Unrelated stationary pickup client bytes changed")
    return result


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
    abc = patch_stacked_drops(abc)
    abc = patch_movement_pickup(abc)
    abc = patch_failed_pickup_path(abc)
    abc = patch_nearest_category_state(abc)
    abc = patch_failed_pickup_movement(abc)
    abc = patch_idle_pickup(abc)
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
    print("Verified pickup selection, path-failure recovery, movement, combat and stationary retries; unrelated client bytes preserved")


if __name__ == "__main__":
    main()
