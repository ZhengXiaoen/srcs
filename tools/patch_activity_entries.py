"""Remove retired activity tabs and their page/resource initialization.

The QingDian window eagerly constructs every page on each opening. Remove its
retired button definitions and pages from all five variants, with matching button
order and legacy navigation mapping. The other windows use protocol indices
for red dots and day filters: retain those indices, leave a null page slot,
and omit the retired entry before building the visible list or requesting it.

Only related method bodies change in the existing SWF. No shared graphics, config
records, constant pools, server rewards, or unrelated client code are removed.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import struct
import zlib

from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, encode_s24, instructions
from patch_god_equip_state import inspect_abc

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
CONSTRUCTORS = {"QingDianActiveWin": 6021, "DaJiDaLiWin": 22106, "YearActiveWin": 22158}
QD_BUTTONS = {"_loaderbasebutton_4": 7627, "_loaderbasebutton_5": 7628,
              "_loaderbasebutton_7": 7629, "_loaderbasebutton_12": 7634,
              "_loaderbasebutton_15": 7637}
QD_PAGES = {18710: "QDSwingBuyPage", 18734: "QDSwingBuyPageD",
            18813: "QDTreasurePage", 18739: "QDTreasurePageB",
            18748: "QDTreasurePageC", 18756: "QDTreasurePageD",
            18767: "QDTreasurePageE", 18611: "QDBossPage", 18565: "QDMoonCakePage"}
QD_ARRAYS = {7646: "PAGE_CLASS", 7647: "PAGE_CLASSB", 7648: "PAGE_CLASSC",
             7649: "PAGE_CLASSD", 7650: "PAGE_CLASSE"}
PUSH = 43315
LATE_PAGES = {
    # Keep zero-based slots for server messages and item-render red dots.
    "DaJiDaLiWin": (29654, "DaJiDaLiBuyPage", 23740, 4, 11),
    "YearActiveWin": (29726, "YearActiveBuyShuiJingPage", 23805, 6, 12),
}
YEAR_TREASURE = (29781, "YearActiveTreasurePage", 23805, 5, 12)


def q(opcode, name, *operands):
    return bytes([opcode]) + encode_u30(name) + b"".join(encode_u30(x) for x in operands)


def relocate(code, edits):
    """Preserve existing branch destinations while allowing new tab guards."""
    ops = instructions(code)
    edits = sorted(edits)
    boundaries = {op.start for op in ops} | {len(code)}
    if any(a not in boundaries or b not in boundaries for a, b, _ in edits):
        raise ValueError("Activity edit splits an instruction")
    if any(b > next_a for (_, b, _), (next_a, _, _) in zip(edits, edits[1:])):
        raise ValueError("Activity edits overlap")

    def moved(offset):
        shift = 0
        for start, end, value in edits:
            if start < offset < end:
                raise ValueError("Activity branch targets a replaced instruction")
            if end <= offset:
                shift += len(value) - (end - start)
        return offset + shift

    result = bytearray(code)
    for start, end, value in reversed(edits):
        result[start:end] = value
    preserved = [op for op in ops if not any(a <= op.start < b for a, b, _ in edits)]
    for op in preserved:
        for field, target, base in op.branches:
            result[moved(field):moved(field) + 3] = encode_s24(moved(target) - moved(base))
    actual = {op.start: tuple(t for _, t, _ in op.branches)
              for op in instructions(result) if op.branches}
    for op in preserved:
        if op.branches and actual.get(moved(op.start)) != tuple(moved(t) for _, t, _ in op.branches):
            raise ValueError("An original activity branch changed destination")
    return bytes(result), moved


def occurrences(code, value):
    return [op.start for op in instructions(code) if code[op.start:op.start + len(value)] == value]


def replace_once(code, old, new):
    found = occurrences(code, old)
    if not found and len(occurrences(code, new)) == 1:
        return code
    if len(found) != 1:
        raise ValueError("Unexpected activity method pattern")
    start = found[0]
    return relocate(code, [(start, start + len(old), new)])[0]


def qd_constructor(code, strings):
    ops = instructions(code)
    edits = []
    for button in QD_BUTTONS:
        markers = [i for i, op in enumerate(ops)
                   if op.opcode == 0x2C and strings[op.operands[0]] == button]
        if not markers:
            continue
        if len(markers) != 1:
            raise ValueError("Duplicate celebration button definition")
        i = markers[0]
        previous = max(j for j in range(i) if ops[j].opcode == 0x55)
        end = next(j for j in range(i, len(ops)) if ops[j].opcode == 0x55)
        if ops[end].operands != (10,):
            raise ValueError("Unexpected celebration button properties")
        edits.append((ops[previous].end, ops[end].end, b""))
    editor_end = next(op.start for op in ops if op.opcode == 0x68 and op.operands == (7621,))
    button_arrays = [op for op in ops if op.opcode == 0x56 and op.start < editor_end
                     and op.operands in ((15,), (13,), (10,), (9,))]
    if len(button_arrays) != 1:
        raise ValueError("Missing celebration navigation definition array")
    op = button_arrays[0]
    target_count = 9 if op.operands == (9,) else 10
    if edits:
        if len(edits) != op.operands[0] - 10:
            raise ValueError("Partly removed celebration button definitions")
        edits.append((op.start, op.end, b"\x56\x0a"))
    elif op.operands != (target_count,):
        raise ValueError("Retired celebration button definition remains")

    for array in QD_ARRAYS:
        ends = [i for i, op in enumerate(ops) if op.opcode == 0x68 and op.operands == (array,)]
        if len(ends) != 1:
            raise ValueError("Missing celebration page variant")
        end = ends[0]
        build = ops[end - 1]
        if build.opcode != 0x56 or build.operands not in ((15,), (13,), (10,), (9,)):
            raise ValueError("Unexpected celebration page count")
        count = build.operands[0]
        pages = ops[end - count - 1:end - 1]
        if len(pages) != count or any(op.opcode != 0x60 for op in pages):
            raise ValueError("Unexpected celebration page definitions")
        removed = [op for op in pages if op.operands[0] in QD_PAGES]
        if count > 10 and len(removed) == count - 10:
            edits.extend((op.start, op.end, b"") for op in removed)
            edits.append((build.start, build.end, b"\x56\x0a"))
        elif count not in (9, 10) or removed:
            raise ValueError("Partly removed celebration page variants")
    return relocate(code, edits)[0] if edits else code


def qd_init_view(code, strings):
    ops = instructions(code)
    edits = []
    for button, name in QD_BUTTONS.items():
        found = [i for i, op in enumerate(ops) if op.opcode == 0x68 and op.operands == (name,)]
        if not found:
            continue
        if len(found) != 1:
            raise ValueError("Duplicate retired button binding")
        i = found[0]
        block = ops[i - 4:i + 1]
        if ([op.opcode for op in block] != [0xD0, 0xD1, 0x2C, 0x66, 0x68]
                or strings[block[2].operands[0]] != button):
            raise ValueError("Unexpected retired button binding")
        edits.append((block[0].start, block[-1].end, b""))
    return relocate(code, edits)[0] if edits else code


def qd_children(code):
    ops = instructions(code)
    edits = []
    for button, name in QD_BUTTONS.items():
        if button == "_loaderbasebutton_15":
            continue  # Removed together with its entire seasonal condition below.
        found = [i for i, op in enumerate(ops) if op.opcode == 0x66 and op.operands == (name,)]
        if not found:
            continue
        if len(found) != 1:
            raise ValueError("Duplicate retired navigation button")
        i = found[0]
        block = ops[i - 3:i + 2]
        if ([op.opcode for op in block] != [0xD0, 0x66, 0xD0, 0x66, 0x4F]
                or block[1].operands != (7642,) or block[-1].operands != (PUSH, 1)):
            raise ValueError("Unexpected celebration button push")
        edits.append((block[0].start, block[-1].end, b""))
    # Align the retained hunt-gift mark after removing two earlier tabs.
    for mark, old, new in ((7657, 14, 9),):
        prefix = b"\xd0" + q(0x66, mark) + b"\x25\xbc\x01"
        old_value = prefix + bytes([0x24, old, 0x24, 45])
        new_value = prefix + bytes([0x24, new, 0x24, 45])
        intermediate = prefix + bytes([0x24, 11, 0x24, 45])
        found = occurrences(code, old_value) or occurrences(code, intermediate)
        if found:
            if len(found) != 1:
                raise ValueError("Unexpected celebration red-dot position")
            start = found[0] + len(prefix)
            edits.append((start, start + 2, bytes([0x24, new])))
        elif len(occurrences(code, new_value)) != 1 and len(occurrences(code, prefix + bytes([0x24, 8, 0x24, 45]))) != 1:
            raise ValueError("Missing celebration red-dot position")
    # Collect-word mark moves from original slot 6 to slot 4.
    prefix = b"\xd0" + q(0x66, 7654)
    old = prefix + b"\x25\x92\x02\x25\xbc\x01\xa0"
    new = prefix + b"\x25\xbc\x01\x24\x04\x24\x2d\xa2\xa0"
    found = occurrences(code, old)
    if found:
        edits.append((found[0], found[0] + len(old), new))
    # The mooncake mark and its date-dependent button are no longer created.
    mark = [i for i, op in enumerate(ops) if op.opcode == 0x68 and op.operands == (7658,)]
    if mark:
        i = mark[0]
        end = next(op.end for op in ops[i + 1:] if op.opcode == 0x4F and op.operands == (1868, 1))
        edits.append((ops[i - 3].start, end, b""))
    dates = [i for i, op in enumerate(ops) if op.opcode == 0x46 and op.operands == (31830, 0)]
    if dates:
        i = dates[0]
        end = next(j for j in range(i + 1, len(ops))
                   if ops[j].opcode == 0x63 and ops[j].operands == (5,)
                   and ops[j - 1].opcode == 0x24 and ops[j - 1].operands == (0,))
        edits.append((ops[i - 1].start, ops[end - 1].start, b""))
    return relocate(code, edits)[0] if edits else code


def previous_navigation():
    # External links still pass original indices. Removed destinations do nothing.
    # Original 8..10 become 7..9; original 12..14 become 10..12.
    code = bytearray(b"\xd0\x30")
    labels = {}
    branches = []

    def branch(opcode, label):
        code.append(opcode)
        branches.append((len(code), label))
        code.extend(b"\0\0\0")

    code.extend(b"\xd1\x24\x07")
    branch(0x13, "return")
    code.extend(b"\xd1\x24\x0b")
    branch(0x13, "return")
    code.extend(b"\xd1\x24\x0c")
    branch(0x15, "one")
    code.extend(b"\xd1\x24\x02\xa1\x73\xd5")
    branch(0x10, "apply")
    labels["one"] = len(code)
    code.extend(b"\xd1\x24\x08")
    branch(0x15, "apply")
    code.extend(b"\xc3\x01")
    labels["apply"] = len(code)
    code.extend(b"\xd0\xd1" + q(0x4E, 1856, 1) + b"\xd0\xd1" + q(0x68, 7677))
    labels["return"] = len(code)
    code.append(0x47)
    for field, label in branches:
        code[field:field + 3] = encode_s24(labels[label] - field - 3)
    instructions(code)
    return bytes(code)


def legacy_navigation():
    removed = (4, 5, 7, 11, 14)
    code = bytearray(b"\xd0\x30")
    labels = {}
    branches = []

    def branch(opcode, label):
        code.append(opcode)
        branches.append((len(code), label))
        code.extend(b"\0\0\0")

    for old in removed:
        code.extend(bytes([0xD1, 0x24, old]))
        branch(0x13, "return")
    for count in range(len(removed), 0, -1):
        code.extend(bytes([0xD1, 0x24, removed[count - 1] + 1]))
        branch(0x15, str(count))
        code.extend(bytes([0xD1, 0x24, count, 0xA1, 0x73, 0xD5]))
        branch(0x10, "apply")
        labels[str(count)] = len(code)
    labels["apply"] = len(code)
    code.extend(b"\xd0\xd1" + q(0x4E, 1856, 1) + b"\xd0\xd1" + q(0x68, 7677))
    labels["return"] = len(code)
    code.append(0x47)
    for field, label in branches:
        code[field:field + 3] = encode_s24(labels[label] - field - 3)
    return bytes(code)


def patch_navigation(code):
    original = b"\xd0\x30\xd0\xd1" + q(0x4E, 1856, 1) + b"\xd0\xd1" + q(0x68, 7677) + b"\x47"
    from patch_unique_activity_rankings import navigate
    if code == navigate(): return code
    if code not in (original, previous_navigation(), legacy_navigation()):
        raise ValueError("Unexpected celebration legacy navigation")
    return legacy_navigation()


def qd_seasonal_attachment(code):
    ops = instructions(code)
    dates = [i for i, op in enumerate(ops) if op.opcode == 0x46 and op.operands == (31830, 0)]
    if not dates:
        return code
    start = ops[dates[0] - 1].start
    end = next(op.start for op in ops[dates[0] + 1:] if op.opcode == 0x47)
    return relocate(code, [(start, end, b"")])[0]


def qd_moon_events(code):
    ops = instructions(code)
    edits = []
    for i, op in enumerate(ops):
        if op.opcode == 0x66 and op.operands in ((7674,), (7666,)):
            block = ops[i - 4:i + 2]
            if [x.opcode for x in block] != [0x60, 0x60, 0x66, 0xD0, 0x66, 0x4F]:
                raise ValueError("Unexpected mooncake event subscription")
            edits.append((block[0].start, block[-1].end, b""))
    return relocate(code, edits)[0] if edits else code


def late_constructor(code, class_name):
    ops = instructions(code)
    rows = [LATE_PAGES[class_name]] + ([YEAR_TREASURE] if class_name == "YearActiveWin" else [])
    edits = []
    for name, _, array, slot, count in rows:
        end = next(i for i, op in enumerate(ops) if op.opcode == 0x68 and op.operands == (array,))
        if ops[end - 1].opcode != 0x56 or ops[end - 1].operands != (count,):
            raise ValueError("Unexpected protocol page array")
        pages = ops[end - count - 1:end - 1]
        page = pages[slot]
        if page.opcode == 0x20:
            continue
        if page.opcode != 0x60 or page.operands != (name,):
            raise ValueError("Wrong retired protocol page slot")
        edits.append((page.start, page.end, b"\x20"))
    return relocate(code, edits)[0] if edits else code


def day_filter(code, class_name):
    ops = instructions(code)
    if class_name == "DaJiDaLiWin":
        # Skip slot 4 before checkActivityOpen, list.push and the status request.
        start = next(op.start for op in ops if op.opcode == 0x60 and op.operands == (1740,))
        target = next(op.start for op in ops if op.opcode == 0xC2 and op.operands == (3,))
        value = b"\xd3\x24\x04\x13" + encode_s24(target - start)
    else:
        # The year window increments its protocol slot before applying day limits.
        # Skip original slot 6 (counter 7); retain the existing 9/10 day filters.
        increment = next(op for op in ops if op.opcode == 0xC2 and op.operands == (3,))
        start = increment.end
        target = next(op.start for op in ops if op.opcode == 0x32 and op.operands == (10, 9))
        guards = []
        for counter in (6, 7):
            if not any(op.opcode == 0x13 and code[op.start - 3:op.start] == bytes([0xD3, 0x24, counter])
                       and op.branches[0][1] == target for op in ops):
                guards.append(counter)
        if not guards:
            return code
        value = b"".join(bytes([0xD3, 0x24, counter, 0x13])
                         + encode_s24(target - start + (len(guards) - i - 1) * 7)
                         for i, counter in enumerate(guards))
        return relocate(code, [(start, start, value)])[0]
    # In the patched dajidali method, GameData lies immediately after the guard.
    check_start = start - len(value) if class_name == "DaJiDaLiWin" else start
    if code[check_start:check_start + 4] == value[:4]:
        guard = next(op for op in ops if op.start == check_start + 3)
        if guard.branches[0][1] != target:
            raise ValueError("Retired activity guard targets the wrong loop edge")
        return code
    return relocate(code, [(start, start, value)])[0]


def year_requests(code):
    # 幻形限购 uses request 7; 稀世珍宝 uses request 8 and remains available here.
    old = q(0x60, 11028) + b"\x24\x00\x24\x07" + q(0x4F, 37584, 2)
    found = occurrences(code, old)
    if not found:
        return code
    if len(found) != 1:
        raise ValueError("Duplicate year phantom-form status request")
    start = found[0]
    return relocate(code, [(start, start + len(old), b"")])[0]


def strings_of(data):
    reader = ABCReader(data)
    reader.skip(4)
    for _ in range(2):
        for _ in range(reader.u30() - 1):
            reader.u30()
    reader.skip(8 * (reader.u30() - 1))
    result = [""]
    for _ in range(reader.u30() - 1):
        length = reader.u30()
        result.append(data[reader.pos:reader.pos + length].decode("utf-8"))
        reader.skip(length)
    return result


def patch_abc(source):
    strings = strings_of(source)
    edits = []
    for class_name, constructor in CONSTRUCTORS.items():
        names, traits, bodies = inspect_abc(source, class_name)
        expected = {**QD_BUTTONS, **{v: k for k, v in QD_PAGES.items()},
                    **{v: k for k, v in QD_ARRAYS.items()}, "push": PUSH}
        expected.update({row[1]: row[0] for row in LATE_PAGES.values()})
        expected[YEAR_TREASURE[1]] = YEAR_TREASURE[0]
        for name, index in expected.items():
            if names[index] != name:
                raise ValueError(f"Unexpected activity QName {index}: {name}")
        targets = {constructor: lambda code: qd_constructor(code, strings)} if class_name == "QingDianActiveWin" else {
            constructor: lambda code, c=class_name: late_constructor(code, c)}
        if class_name == "QingDianActiveWin":
            targets.update({traits["initView"][0]: lambda code: qd_init_view(code, strings),
                            traits["createChildren"][0]: qd_children,
                            traits["setNavIndex"][0]: patch_navigation,
                            traits["resetInit"][0]: qd_seasonal_attachment,
                            traits["onAddedToStage"][0]: qd_moon_events,
                            traits["onRemovedFromStage"][0]: qd_moon_events})
        else:
            targets[traits["onDayChange"][0]] = lambda code, c=class_name: day_filter(code, c)
            if class_name == "YearActiveWin":
                targets[traits["onAddedToStage"][0]] = year_requests
        for method, patch in targets.items():
            start, length, limits = bodies[method]
            code = source[start:start + length]
            changed = patch(code)
            if changed == code:
                continue
            instructions(changed)
            reader = ABCReader(source)
            reader.pos = start + length
            if reader.u30() != 0 or reader.u30() != 0:
                raise ValueError("Unexpected activity exceptions or body traits")
            length_start = start - len(encode_u30(length))
            marker = encode_u30(method) + b"".join(encode_u30(x) for x in limits)
            if source[length_start - len(marker):length_start] != marker:
                raise ValueError("Unexpected activity method header")
            edits.append((length_start, reader.pos, encode_u30(len(changed)) + changed + b"\0\0"))
    result = bytearray(source)
    for start, end, value in sorted(edits, reverse=True):
        result[start:end] = value
    for class_name in CONSTRUCTORS:
        inspect_abc(result, class_name)
    # Undo only the allowed bodies and require every other ABC byte to match.
    undo = []
    shift = 0
    for start, end, value in sorted(edits):
        undo.append((start + shift, start + shift + len(value), source[start:end]))
        shift += len(value) - (end - start)
    restored = bytearray(result)
    for start, end, value in reversed(undo):
        restored[start:end] = value
    if restored != source:
        raise ValueError("Unrelated activity ABC bytes changed")
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
        raise ValueError("Unrelated activity SWF tags changed")
    return result[:8] + zlib.compress(result[8:], 9)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    result = patch_swf(source)
    if patch_swf(result) != result:
        raise ValueError("Activity entry patch is not idempotent")
    if args.check:
        if source != result:
            raise ValueError("Retired activity entry patch is missing")
    elif source != result:
        CLIENT.write_bytes(result)
    print("Removed retired activity entries and page loading; related client bytes updated")


if __name__ == "__main__":
    main()
