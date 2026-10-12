"""Keep claimed daily rows, ignore the hidden tier and align Jingji reward dots.

Patch only three existing client method bodies. Daily rewards keep their six
visible tiers, including claimed rows after day seven; all server/config rewards
and unrelated packaged resources stay byte-identical. The Jingji day check uses
the reward index, as its claim button and the server already do.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import struct
import zlib

from patch_activity_entries import q, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
DAILY_TIERS = 6
TARGETS = (
    ("NavTopRightArea", "updateEverydayRechargeBtn"),
    ("EverydayRechargeWin2", "updateList"),
    ("JingJiWin", "chongzhitehuiIcon"),
)
Q = {"Math": 43301, "min": 14586, "GlobalData": 1507,
     "everydayRechargeStatus": 31219, "length": 3237, "GameData": 1740,
     "everydayRechargeCfgProvider": 32118, "total": 11766}


def bounded(value):
    return q(0x60, Q["Math"]) + value + bytes((0x24, DAILY_TIERS)) + q(0x46, Q["min"], 2)


def replace_expression(code, old, new):
    positions = [op.start for op in instructions(code)
                 if code[op.start:op.start + len(old)] == old]
    patched = [op.start for op in instructions(code)
               if code[op.start:op.start + len(new)] == new]
    if len(patched) == 1:
        return code, lambda p: p
    if len(positions) != 1 or patched:
        raise ValueError("Unexpected recharge expression")
    start = positions[0]
    return relocate(code, [(start, start + len(old), new)])


def keep_claimed_daily_rows(code):
    # The legacy day-eight filter skips the first claimed reward encountered.
    # Retain the list-size guard and the config/index assignment around it.
    skip = bytes.fromhex(
        "60e30b66f3f301620966b6dc022402141c00006205c02a7363052401ab"
        "2a1205000029d12408b01204000010350000")
    after = bytes.fromhex("d3620966b6dc0212110000d3620966b6dc02620961b7dc021004000010150000")
    ops = instructions(code)
    matches = [op.start for op in ops if code[op.start:op.start + len(skip)] == skip]
    guard = bytes.fromhex("09d066c74266aa1d62040f040000")
    guards = [i for i, op in enumerate(ops)
              if code[op.start:op.start + len(guard)] == guard]
    if len(guards) != 1:
        raise ValueError("Unexpected daily list-size guard")
    jump = ops[guards[0] + 6]
    if jump.opcode != 0x10 or jump.branches[0][1] != len(code) - 1:
        raise ValueError("Unexpected daily list break target")
    start = jump.end
    if not matches and code[start:start + len(after)] == after:
        return code, lambda p: p
    if matches != [start] or code[start + len(skip):start + len(skip) + len(after)] != after:
        raise ValueError("Unexpected claimed daily row filter")
    return relocate(code, [(start, start + len(skip), b"")])


def patch_abc(source):
    names, _, original_bodies = inspect_abc(source, TARGETS[0][0])
    for name, index in Q.items():
        if names[index] != name:
            raise ValueError(f"Unexpected recharge QName: {name}")
    changes = []
    for cls, method_name in TARGETS:
        _, traits, _ = inspect_abc(source, cls)
        method = traits[method_name][0]
        start, size, limits = original_bodies[method]
        code = source[start:start + size]
        updated = code
        moved = lambda p: p
        if cls == "NavTopRightArea":
            values = (
                q(0x60, Q["GlobalData"]) + q(0x66, Q["everydayRechargeStatus"]) + q(0x66, Q["length"]),
                q(0x60, Q["GameData"]) + q(0x66, Q["everydayRechargeCfgProvider"]) + q(0x66, Q["total"]),
            )
        elif cls == "EverydayRechargeWin2":
            # Keep six rows and their protocol indexes in every claim state.
            values = (b"\xd3" + q(0x66, Q["length"]),)
        else:
            values = ()
            # local 2 = recharge bracket; local 3 = zero-based reward day.
            updated, moved = replace_expression(code, b"\xd2\x24\x01\xa0\x62\x04",
                                                 b"\xd3\x24\x01\xa0\x62\x04")
        for value in values:
            updated, next_moved = replace_expression(updated, value, bounded(value))
            previous = moved
            moved = lambda p, a=previous, b=next_moved: b(a(p))
        if cls == "EverydayRechargeWin2":
            updated, next_moved = keep_claimed_daily_rows(updated)
            previous = moved
            moved = lambda p, a=previous, b=next_moved: b(a(p))
        if updated == code:
            continue
        reader = ABCReader(source)
        reader.pos = start + size
        exceptions = []
        for _ in range(reader.u30()):
            a, b, target, kind, variable = (reader.u30() for _ in range(5))
            exceptions.append((moved(a), moved(b), moved(target), kind, variable))
        header = b"".join(encode_u30(v) for v in (method, *limits, size))
        if source[start - len(header):start] != header:
            raise ValueError("Unexpected recharge method header")
        replacement = b"".join(encode_u30(v) for v in (method, *limits, len(updated))) + updated
        replacement += encode_u30(len(exceptions))
        replacement += b"".join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start - len(header), reader.pos, replacement, method))
    result = bytearray(source)
    for start, end, value, _ in sorted(changes, reverse=True):
        result[start:end] = value
    result = bytes(result)
    _, _, after = inspect_abc(result, TARGETS[0][0])
    changed = {m for _, _, _, m in changes}
    for method, (start, size, limits) in original_bodies.items():
        new_start, new_size, new_limits = after[method]
        if method not in changed and (limits != new_limits or source[start:start + size] != result[new_start:new_start + new_size]):
            raise ValueError("Unrelated client method changed")
    first = min(start for start, _, _, _ in changes) if changes else len(source)
    if source[:first] != result[:first]:
        raise ValueError("Client constants or traits changed")
    return result


def patch_swf(source):
    data, (tag, payload, start, end) = abc_section(source)
    abc = patch_abc(data[start:end])
    if abc == data[start:end]:
        return source
    result = (data[:tag + 2] + struct.pack("<I", start - payload + len(abc))
              + data[payload:start] + abc + data[end:])
    result = result[:4] + struct.pack("<I", len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(abc):] != data[end:]:
        raise ValueError("Unrelated SWF resources changed")
    return result[:8] + zlib.compress(result[8:], 9)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    updated = patch_swf(source)
    if patch_swf(updated) != updated:
        raise ValueError("Recharge patch is not idempotent")
    if args.check:
        if updated != source:
            raise ValueError("Client recharge reminders need updating")
    elif updated != source:
        CLIENT.write_bytes(updated)
    print("Verified six persistent daily rows, Jingji reward-day dots and unchanged unrelated client resources.")


if __name__ == "__main__":
    main()
