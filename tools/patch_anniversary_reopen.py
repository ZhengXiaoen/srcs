"""Retire anniversary recharge/flash sale and restore cached pages on reopen."""
from __future__ import annotations

import argparse

from patch_activity_entries import q
from patch_activity_reminders import Code, call, get, number, prop, put, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_super_anniversary import (CLIENT, abc_section, assemble, normalize,
                                    inspect_abc, instructions, bytecode_requirements)

SLOTS = (1, 4, 7, 10, 11, 12, 13, 14, 15)
DISPLAY_SLOTS = (1, 12, 13, 14, 15, 4, 10, 7, 11)
DISPLAY_IDS = (1118, 20012, 20013, 20014, 20015, 1300, 1102, 591, 600)
METHODS = {4080, 6379, 6380, 22158, 22159, 22160, 22163, 22164}


def page_events(add):
    # Keep display objects on close, but stop all page listeners and timers.
    c = Code()
    c.add(number(0) + put(3) + prop(get(0), 23810) + put(4))
    c.add(get(4)); c.branch(0x12, 'done')
    c.label('loop')
    c.add(get(3) + prop(get(4), 3237)); c.branch(0x18, 'done')
    c.add(get(4) + get(3) + q(0x66, 48308) + put(2))
    c.add(get(2)); c.branch(0x12, 'next')
    c.add(call(get(2), 3112 if add else 3113, void=True))
    c.label('next'); c.add(q(0xc2, 3)); c.branch(0x10, 'loop')
    c.label('done'); c.add(b'\x09')
    return c.finish()


def remove_call(code, value):
    if code.count(value) != 1:
        raise ValueError('Unexpected retired activity query')
    start = code.index(value)
    return relocate(code, [(start, start + len(value), b'')])[0]


def patch_swf(source):
    raw, (_, _, a, b) = abc_section(source)
    abc, positions = normalize(raw[a:b]); names, _, bodies = inspect_abc(abc)
    code = lambda mid: abc[bodies[mid][0]:sum(bodies[mid][:2])]
    if q(0x60, 18630) not in code(22158):
        if q(0x60, 29738) in code(22158):
            raise ValueError('Only part of anniversary retirement applied')
        return source
    changes = {}
    ctor = code(22158)
    edits = []
    for page in (29738, 18630):
        op = next(o for o in instructions(ctor) if o.opcode == 0x60 and o.operands == (page,))
        edits.append((op.start, op.end, b'\x20'))
    edits.append((len(ctor) - 1, len(ctor) - 1,
                  get(0) + q(0x56, 0) + q(0x68, 23810)
                  + get(0) + number(-1) + q(0x68, 23811)))
    changes[22158] = relocate(ctor, edits)[0]

    # Ignore saved progress for retired pages, including the old daily recharge.
    c = Code(); c.add(b'\xd0\x30')
    for slot in (8, 16):
        c.add(get(1) + number(slot)); c.branch(0x13, 'retired')
    c.branch(0x10, 'original'); c.label('retired'); c.add(b'\x27\x48')
    c.label('original'); c.add(code(4080)[2:]); changes[4080] = c.finish()

    recharge = call(q(0x60, 11028), 37707, number(0), number(12), void=True)
    changes[6380] = remove_call(code(6380), recharge)
    # Drop slot 16 from the top icon's short-circuit award scan.
    old = code(6379)
    award = call(prop(q(0x60, 1507), 31288), 3373, number(16)) + b'\x76'
    if old.count(award) != 1: raise ValueError('Unexpected anniversary award scan')
    at = old.index(award); ops = instructions(old)
    previous = [o for o in ops if o.end <= at][-3:]
    if [o.opcode for o in previous] != [0x2a, 0x11, 0x29]:
        raise ValueError('Unexpected anniversary short circuit')
    changes[6379] = relocate(old, [(previous[0].start, at + len(award), b'')])[0]

    added = remove_call(code(22159), call(q(0x60, 11028), 37584, number(0), number(9), void=True))
    added = remove_call(added, recharge)
    # Cached pages have no active listeners while closed. A real day change
    # rebuilds them instead, so never initialize pages about to be discarded.
    c = Code(); c.add(q(0x60, 42708)); c.branch(0x11, 'done')
    c.add(page_events(True)); c.label('done'); c.add(b'\x09')
    changes[22159] = relocate(added, [(13, 13, c.finish())])[0]

    removed = code(22160)
    end = next(o.start for o in instructions(removed) if o.start > 33 and o.opcode == 0x60)
    changes[22160] = relocate(removed, [(33, end, page_events(False))])[0]

    day = code(22163); ops = instructions(day)
    setter = next(i for i, o in enumerate(ops) if o.opcode == 0x61 and o.operands == (6138,))
    array = ops[setter - 1]; first = ops[setter - 1 - array.operands[0]].start
    day = relocate(day, [(first, array.end, b''.join(number(i) for i in DISPLAY_IDS) + q(0x56, len(DISPLAY_IDS)))])[0]
    # On ordinary reopen reuse the selected content. Rebuild on a day change
    # or the first open, including a fresh instance with DAY_CHANGE=false.
    c = Code(); c.add(b'\xd0\x30' + q(0x60, 42708)); c.branch(0x11, 'rebuild')
    c.add(prop(get(0), 23810)); c.branch(0x12, 'rebuild')
    c.add(prop(get(0), 23810, 3237) + number(0)); c.branch(0x16, 'rebuild')
    c.add(call(get(0), 23815, b'\x20', void=True) + b'\x47')
    c.label('rebuild'); c.add(q(0x5e, 42708) + b'\x27' + q(0x61, 42708) + day[2:])
    changes[22163] = c.finish()

    # Install the page in the cache/display tree before initEvent can request
    # data and cause synchronous events. Cached pages are already attached.
    create = code(22164)
    init = call(get(2), 3112, void=True)
    create = remove_call(create, init)
    add = call(get(0), 1868, get(2), void=True)
    at = create.index(add) + len(add)
    changes[22164] = relocate(create, [(at, at, init)])[0]

    replacements = []
    for mid, updated in changes.items():
        start, size, limits = bodies[mid]
        stack, registers, scopes = bytecode_requirements(updated, names, limits[2])
        new_limits = (max(limits[0], stack), max(limits[1], registers), limits[2], max(limits[3], scopes))
        r = ABCReader(abc); r.pos = start + size
        if r.u30(): raise ValueError('Unexpected anniversary exception handlers')
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected method header')
        value = b''.join(encode_u30(v) for v in (mid, *new_limits, len(updated))) + updated + b'\0'
        replacements.append((start - len(header), r.pos, value))
    result = bytearray(abc)
    for start, end, value in sorted(replacements, reverse=True): result[start:end] = value
    _, _, after = inspect_abc(result)
    for mid, (start, size, limits) in bodies.items():
        now, length, current = after[mid]
        if mid not in METHODS and (limits != current or abc[start:start + size] != result[now:now + length]):
            raise ValueError(f'Unrelated method {mid} changed')
    for pos in positions: result[pos] = 0
    return assemble(source, bytes(result))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--check', action='store_true')
    args = parser.parse_args(); before = CLIENT.read_bytes(); after = patch_swf(before)
    if patch_swf(after) != after: raise ValueError('Non-idempotent anniversary patch')
    if args.check:
        if before != after: raise ValueError('Anniversary patch missing')
    elif before != after:
        CLIENT.write_bytes(after)
    print('Anniversary retired pages and cached reopen verified.')
