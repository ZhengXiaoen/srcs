"""Disable purchase-only Jingji hints and repair HongLi event refreshes."""
from __future__ import annotations

import argparse
from pathlib import Path
import struct
import zlib

from patch_activity_entries import q
from patch_activity_reminders import call, get, normalize, prop, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
MODULE = ROOT / "web/v2/modules/hongli/HongLi.swf"
BASELINE = "b822430"
MAIN_METHODS = {5580, 6353, 6437}
MODULE_METHODS = {7, 8, 29, 30, 69, 70}
EVENT_METHODS = {11, 33}
ADDED_NAMES = ("GameCurPayGoldChange", "PropertyEvent", "MAIN_MONEY_CHANGE")


def pool_layout(source):
    reader = ABCReader(source)
    reader.skip(4)
    for kind in range(3):
        count = reader.u30()
        if kind < 2:
            for _ in range(count - 1):
                reader.u30()
        else:
            reader.skip(8 * (count - 1))
    strings_start = reader.pos
    strings_count = reader.u30()
    strings = [""]
    for _ in range(strings_count - 1):
        size = reader.u30()
        strings.append(source[reader.pos:reader.pos + size].decode("utf-8"))
        reader.skip(size)
    strings_end = reader.pos
    for _ in range(reader.u30() - 1):
        reader.byte()
        reader.u30()
    for _ in range(reader.u30() - 1):
        for _ in range(reader.u30()):
            reader.u30()
    names_start = reader.pos
    names_count = reader.u30()
    for _ in range(names_count - 1):
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
            raise ValueError(f"Unsupported multiname {kind}")
    return strings_start, strings_end, strings, names_start, reader.pos, names_count


def module_symbols(source):
    start, end, strings, names_start, names_end, count = pool_layout(source)
    names, _, _ = inspect_abc(source, "HongLiActiveWin")
    if tuple(names[-3:]) == ADDED_NAMES:
        return source, tuple(range(count - 3, count))
    if any(name in names for name in ADDED_NAMES):
        raise ValueError("Unexpected partial HongLi event symbols")
    string_records = b"".join(encode_u30(len(name.encode())) + name.encode() for name in ADDED_NAMES)
    qnames = b"".join(b"\x07" + encode_u30(namespace) + encode_u30(len(strings) + index)
                      for index, namespace in enumerate((2, 4, 2)))
    strings_header = start + len(encode_u30(len(strings)))
    names_header = names_start + len(encode_u30(count))
    updated = (source[:start] + encode_u30(len(strings) + 3) + source[strings_header:end]
               + string_records + source[end:names_start] + encode_u30(count + 3)
               + source[names_header:names_end] + qnames + source[names_end:])
    return updated, tuple(range(count, count + 3))


def parameter_positions(source):
    reader = ABCReader(source)
    reader.pos = pool_layout(source)[4]
    positions = {}
    for method in range(reader.u30()):
        count = reader.u30()
        reader.u30()
        parameters = []
        for _ in range(count):
            position = reader.pos
            parameters.append((position, reader.u30()))
        positions[method] = parameters
        reader.u30()
        flags = reader.byte()
        if flags & 8:
            for _ in range(reader.u30()):
                reader.u30()
                reader.byte()
        if flags & 128:
            for _ in range(count):
                reader.u30()
    return positions


def patch_abc(source, module=False):
    original, positions = normalize(source)
    abc = original
    symbols = None
    if module:
        abc, symbols = module_symbols(abc)
    names, _, bodies = inspect_abc(abc, "HongLiActiveWin" if module else "NavTopRightArea")
    changes = []

    def edit(method, transform):
        start, size, limits = bodies[method]
        updated, moved = transform(abc[start:start + size])
        if updated == abc[start:start + size]:
            return
        instructions(updated)
        reader = ABCReader(abc)
        reader.pos = start + size
        exceptions = []
        for _ in range(reader.u30()):
            row = [reader.u30() for _ in range(5)]
            exceptions.append([moved(value) for value in row[:3]] + row[3:])
        header = b"".join(encode_u30(value) for value in (method, *limits, size))
        if abc[start - len(header):start] != header:
            raise ValueError("Unexpected reminder method header")
        replacement = b"".join(encode_u30(value) for value in (method, *limits, len(updated))) + updated
        replacement += encode_u30(len(exceptions))
        replacement += b"".join(encode_u30(value) for row in exceptions for value in row)
        changes.append((start - len(header), reader.pos, replacement))

    def insert(code, value):
        if value in code:
            return code, lambda position: position
        return relocate(code, [(2, 2, value)])

    if module:
        pay_event, property_event, money_event = symbols
        for method in EVENT_METHODS:
            parameters = parameter_positions(abc)[method]
            if len(parameters) != 1 or parameters[0][1] not in (3, 4):
                raise ValueError("Unexpected HongLi callback signature")
            position, kind = parameters[0]
            if kind != 3:
                changes.append((position, position + len(encode_u30(kind)), encode_u30(3)))
        for added, removed, handler, events in (
                (7, 8, 48, ((9, pay_event), (property_event, money_event))),
                (29, 30, 113, ((9, 244), (9, pay_event))),
                (69, 70, 159, ((9, pay_event),))):
            for method, listener in ((added, 241), (removed, 243)):
                value = b"".join(call(q(0x60, 239), listener, prop(q(0x60, cls), event),
                                      prop(get(0), handler), void=True) for cls, event in events)
                edit(method, lambda code, value=value: insert(code, value))
    else:
        for index, name in ((6755, "_icon"), (44339, "visible"), (8122, "hongLiActiveOpen")):
            if names[index] != name:
                raise ValueError(f"Unexpected reminder QName {index}")
        disabled = b"\xd0\x30" + prop(get(0), 6755) + b"\x24\x03" + q(0x66, 44338)
        disabled += b"\x27" + q(0x61, 44339) + b"\x47"
        edit(5580, lambda code: (disabled, lambda position: position))
        refresh = call(get(0), 8122, b"\x20", void=True)
        for method in (6353, 6437):
            def move_refresh(code):
                if code[2:2 + len(refresh)] == refresh:
                    return code, lambda position: position
                found = [op.start for op in instructions(code)
                         if code[op.start:op.start + len(refresh)] == refresh]
                if len(found) != 1:
                    raise ValueError("Unexpected HongLi payment refresh")
                position = found[0]
                return relocate(code, [(2, 2, refresh), (position, position + len(refresh), b"")])
            edit(method, move_refresh)

    result = bytearray(abc)
    for start, end, value in sorted(changes, reverse=True):
        result[start:end] = value
    restored = bytearray(result)
    shift = 0
    undo = []
    for start, end, value in sorted(changes):
        undo.append((start + shift, start + shift + len(value), abc[start:end]))
        shift += len(value) - (end - start)
    for start, end, value in reversed(undo):
        restored[start:end] = value
    if restored != abc:
        raise ValueError("Unrelated reminder resources changed")
    for position in positions:
        result[position] = 0
    return bytes(result)


def patch_swf(source, module=False):
    data, (tag, payload, start, end) = abc_section(source)
    abc = patch_abc(data[start:end], module)
    if abc == data[start:end]:
        return source
    updated = data[:tag + 2] + struct.pack("<I", start - payload + len(abc))
    updated += data[payload:start] + abc + data[end:]
    updated = updated[:4] + struct.pack("<I", len(updated)) + updated[8:]
    return updated[:8] + zlib.compress(updated[8:], 9)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    for path, module in ((CLIENT, False), (MODULE, True)):
        source = path.read_bytes()
        updated = patch_swf(source, module)
        if args.check:
            if updated != source:
                raise ValueError(f"Missing reminder patch: {path}")
        else:
            path.write_bytes(updated)
    print("Verified Jingji purchase hints and HongLi payment/currency refreshes.")


if __name__ == "__main__":
    main()
