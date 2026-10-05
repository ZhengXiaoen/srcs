"""Use server-announced Spring dates without changing rewards or prices."""
from __future__ import annotations

import argparse
from pathlib import Path
import struct
import zlib

from patch_activity_entries import q
from patch_activity_reminders import Code, call, get, number, prop, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
BASELINE = "27f915a"
METHODS = {1272, 3325, 5903, 5904}
CONFIG = prop(q(0x60, 1740), 32115, 11369)
Q_NAMES = {"Date": 42, "GlobalData": 1507, "GlobalFunc": 1561,
     "GameData": 1740, "NewYearWin": 7439, "openDay": 3346,
     "time": 3456, "newYearActivityDataMgr": 31242,
     "getCurrentServerDate": 31830, "Math": 43301, "floor": 43302,
     "Right_Top_NewYear": 38258}


def elapsed_day(start_date):
    today = prop(call(q(0x60, Q_NAMES["GlobalFunc"]), Q_NAMES["getCurrentServerDate"]), Q_NAMES["time"])
    duration = number(24) + number(60) + b"\xa2" + number(60) + b"\xa2" + number(1000) + b"\xa2"
    return call(q(0x60, Q_NAMES["Math"]), Q_NAMES["floor"],
                today + prop(start_date, Q_NAMES["time"]) + b"\xa1" + duration + b"\xa3") + number(1) + b"\xa0"


def config_start(config):
    def part(index):
        return prop(config, Q_NAMES["time"]) + number(index) + q(0x66, 44423)
    return q(0x5d, Q_NAMES["Date"]) + part(0) + part(1) + b"\x93" + part(2) + q(0x4a, Q_NAMES["Date"], 3)


def date_update():
    code = Code()
    scope = lambda slot: b"\x65\x01" + q(0x6c, slot)
    code.add(scope(2) + prop(q(0x60, 13052), Q_NAMES["Right_Top_NewYear"]))
    code.branch(0x14, "done")
    code.add(CONFIG)
    for slot in (8, 9):
        code.add(prop(scope(slot), 43406))
        code.add(prop(scope(slot), 43405) + number(1) + b"\xa0")
        code.add(prop(scope(slot), 14925))
    code.add(q(0x56, 6) + q(0x61, Q_NAMES["time"]))
    code.add(q(0x60, Q_NAMES["NewYearWin"]) + elapsed_day(scope(8)) + q(0x61, Q_NAMES["openDay"]))
    code.add(prop(q(0x60, Q_NAMES["GlobalData"]), Q_NAMES["newYearActivityDataMgr"]) +
             prop(q(0x60, Q_NAMES["NewYearWin"]), Q_NAMES["openDay"]) + q(0x61, Q_NAMES["openDay"]))
    code.label("done")
    return code.finish()


def patch_method(method, code):
    if method == 1272:
        original = b"\x65\x01" + q(0x6c, 2) + prop(q(0x60, 13052), Q_NAMES["Right_Top_NewYear"]) + b"\x14\0\0\0"
        updated = date_update()
        if code.count(updated) == 1:
            return code, lambda position: position
        if code.count(original) != 1:
            raise ValueError("Unexpected empty Spring activity-date receiver")
        start = code.index(original)
        return relocate(code, [(start, start + len(original), updated)])
    if method in (5903, 5904):
        updated = q(0x5e, Q_NAMES["openDay"]) + elapsed_day(config_start(CONFIG)) + q(0x61, Q_NAMES["openDay"])
        if code.count(updated) == 1:
            return code, lambda position: position
        ops = instructions(code)
        start = next(op.start for op in ops if op.opcode == 0x60 and op.operands == (Q_NAMES["GlobalFunc"],))
        end = next(op.end for op in ops if op.opcode == 0x61 and op.operands == (Q_NAMES["openDay"],))
        if not any(op.opcode == 0x46 and op.operands == (Q_NAMES["getCurrentServerDate"], 0)
                   for op in ops if start <= op.start < end):
            raise ValueError("Unexpected Spring window day calculation")
        return relocate(code, [(start, end, updated)])
    if method == 3325:
        updated = Code()
        updated.add(get(0) + elapsed_day(config_start(prop(get(0), 4410))) + q(0x68, Q_NAMES["openDay"]))
        updated.add(prop(get(0), Q_NAMES["openDay"]) + number(1))
        updated.branch(0x15, "closed")
        updated.add(prop(get(0), Q_NAMES["openDay"]) + prop(get(0), 4410, 14696, 3237))
        updated.branch(0x0e, "open")
        updated.label("closed")
        updated.add(get(0) + number(-1) + q(0x68, Q_NAMES["openDay"]) + b"\x27\x48")
        updated.label("open")
        prefix = updated.finish()
        if code[2:2 + len(prefix)] == prefix:
            return code, lambda position: position
        if code[100:102] != b"\x27\x48" or code[102:107] != get(0) + q(0x46, 4412, 0):
            raise ValueError("Unexpected Spring reminder date gate")
        return relocate(code, [(2, 102, prefix)])
    raise ValueError("Unexpected Spring method")


def patch_abc(source):
    names, _, bodies = inspect_abc(source, "NewYearWin")
    for name, index in Q_NAMES.items():
        if names[index] != name:
            raise ValueError(f"Unexpected Spring QName: {name}")
    changes = []
    for method in sorted(METHODS):
        start, size, limits = bodies[method]
        code = source[start:start + size]
        updated, moved = patch_method(method, code)
        if updated == code:
            continue
        instructions(updated)
        reader = ABCReader(source)
        reader.pos = start + size
        exceptions = []
        for _ in range(reader.u30()):
            row = [reader.u30() for _ in range(5)]
            exceptions.append([moved(position) for position in row[:3]] + row[3:])
        header = b"".join(encode_u30(value) for value in (method, *limits, size))
        if source[start - len(header):start] != header:
            raise ValueError("Unexpected Spring method header")
        new_limits = (max(limits[0], 9), *limits[1:])
        replacement = b"".join(encode_u30(value) for value in (method, *new_limits, len(updated))) + updated
        replacement += encode_u30(len(exceptions))
        replacement += b"".join(encode_u30(value) for row in exceptions for value in row)
        changes.append((start - len(header), reader.pos, replacement))
    result = bytearray(source)
    for start, end, value in reversed(sorted(changes)):
        result[start:end] = value
    result = bytes(result)
    restored = bytearray(result)
    shift = 0
    undo = []
    for start, end, value in sorted(changes):
        undo.append((start + shift, start + shift + len(value), source[start:end]))
        shift += len(value) - (end - start)
    for start, end, value in reversed(undo):
        restored[start:end] = value
    if restored != source:
        raise ValueError("Unrelated ABC data changed")
    inspect_abc(result, "NewYearWin")
    return result


def patch_swf(source):
    data, (tag, payload, start, end) = abc_section(source)
    updated = patch_abc(data[start:end])
    if updated == data[start:end]:
        return source
    result = data[:tag + 2] + struct.pack("<I", start - payload + len(updated)) + data[payload:start] + updated + data[end:]
    result = result[:4] + struct.pack("<I", len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(updated):] != data[end:]:
        raise ValueError("Unrelated SWF resources changed")
    return result[:8] + zlib.compress(result[8:], 9)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    updated = patch_swf(source)
    if patch_swf(updated) != updated:
        raise ValueError("Spring date patch is not idempotent")
    if args.check:
        if updated != source:
            raise ValueError("Spring client activity dates need synchronization")
    elif source != updated:
        CLIENT.write_bytes(updated)
    print("Verified server-announced Spring dates and unchanged rewards, prices and other resources.")


if __name__ == "__main__":
    main()
