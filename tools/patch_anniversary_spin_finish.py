"""Bound anniversary lucky-spin waits and finish on the server's result angle."""
from __future__ import annotations

import argparse

from patch_activity_entries import q
from patch_activity_reminders import Code, call, get, prop, put, number, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_super_anniversary import (CLIENT, abc_section, normalize, inspect_abc,
                                    bytecode_requirements, instructions, assemble)

METHODS = {29900, 29901, 29904, 29905}
BTN, TIMER, ELAPSED, CONTAINER, RECEIVED, CFG = 50905, 50906, 50907, 50908, 50910, 50911
POSITION = prop(q(0x60, 1507), 31270, 3477)


def assign(name, value):
    return get(0) + value + q(0x68, name)


def finish():
    return (call(prop(get(0), TIMER), 6259, void=True)
            + prop(get(0), BTN) + b'\x26' + q(0x61, 1621)
            + assign(ELAPSED, number(0)) + assign(RECEIVED, b'\x27'))


def query():
    # Refresh counts only; never retry a draw that may already have charged.
    return call(q(0x60, 11028), 37557, number(0), number(4), void=True)


def result_callback():
    c = Code(); c.add(b'\xd0\x30' + prop(get(0), BTN, 1621)); c.branch(0x11, 'done')
    c.add(POSITION + number(0)); c.branch(0x16, 'failed')
    c.add(assign(RECEIVED, b'\x26')); c.branch(0x10, 'done')
    c.label('failed'); c.add(finish() + query())
    c.label('done'); c.add(b'\x47'); return c.finish()


def timer_callback():
    c = Code(); c.add(b'\xd0\x30' + prop(get(0), BTN, 1621)); c.branch(0x11, 'done')
    c.add(assign(ELAPSED, prop(get(0), ELAPSED) + number(50) + b'\xa0'))
    c.add(prop(get(0), ELAPSED) + number(2500)); c.branch(0x15, 'spin')
    c.add(prop(get(0), RECEIVED)); c.branch(0x11, 'result')
    c.add(prop(get(0), ELAPSED) + number(10000)); c.branch(0x18, 'failed')
    c.branch(0x10, 'spin')
    c.label('result'); c.add(POSITION + b'\x73' + put(2))
    c.add(get(2) + number(0)); c.branch(0x16, 'failed')
    c.add(get(2) + prop(get(0), CFG, 14503, 3237)); c.branch(0x17, 'failed')
    c.add(prop(get(0), CFG, 14503) + get(2) + number(1) + b'\xa1'
          + q(0x66, 51003) + put(3))
    c.add(get(3)); c.branch(0x12, 'failed')
    c.add(get(3) + number(3) + q(0x66, 51003) + b'\x73' + put(4))
    c.add(get(4) + number(0)); c.branch(0x15, 'failed')
    c.add(get(4) + number(9)); c.branch(0x17, 'failed')
    c.add(get(4) + number(36) + b'\xa2' + put(4))
    c.add(get(4) + number(180)); c.branch(0x16, 'angle')
    c.add(get(4) + number(360) + b'\xa1' + put(4))
    c.label('angle')
    # Compare circular distance with a full animation step. Flash rotations
    # are floating-point values, so exact equality can miss every revolution.
    delta = (prop(get(0), CONTAINER, 6076) + get(4) + b'\xa1'
             + number(540) + b'\xa0' + number(360) + b'\xa4' + number(180) + b'\xa1')
    c.add(call(q(0x60, 43301), 43413, delta) + number(18)); c.branch(0x17, 'spin')
    c.add(prop(get(0), CONTAINER) + get(4) + q(0x61, 6076) + finish()); c.branch(0x10, 'done')
    c.label('spin'); c.add(number(18) + put(5))
    c.add(prop(get(0), ELAPSED) + number(500)); c.branch(0x15, 'rotate')
    c.add(prop(get(0), ELAPSED) + number(2000)); c.branch(0x18, 'rotate')
    c.add(number(36) + put(5))
    c.label('rotate'); c.add(prop(get(0), CONTAINER) + prop(get(0), CONTAINER, 6076)
                           + get(5) + b'\xa0' + q(0x61, 6076)); c.branch(0x10, 'done')
    c.label('failed'); c.add(finish() + query())
    c.label('done'); c.add(b'\x47'); return c.finish()


def patch_swf(source):
    raw, (_, _, a, b) = abc_section(source)
    abc, positions = normalize(raw[a:b]); names, classes, bodies = inspect_abc(abc)
    if classes['AnniversaryHongLiTurnPage']['instance']['turuingHandle'][0] != 29904:
        raise ValueError('Unexpected anniversary spin methods')
    code = lambda mid: abc[bodies[mid][0]:sum(bodies[mid][:2])]
    changes = {29904: timer_callback(), 29901: result_callback()}
    if code(29904) == changes[29904] and code(29901) == changes[29901]: return source
    removed = code(29900)
    stop_name = next(op.operands[0] for op in reversed(instructions(removed))
                     if op.opcode == 0x4f and names[op.operands[0]] == 'stop')
    stop = call(prop(get(0), TIMER), stop_name, void=True)
    at = removed.rindex(stop)
    changes[29900] = relocate(removed, [(at, at + len(stop), finish())])[0]
    clicked = code(29905); c = Code()
    c.add(prop(get(0), BTN, 1621)); c.branch(0x11, 'ready'); c.add(b'\x47'); c.label('ready')
    changes[29905] = relocate(clicked, [(2, 2, c.finish())])[0]
    start = call(prop(get(0), TIMER), 5936, void=True)
    at = changes[29905].index(start)
    reset = assign(ELAPSED, number(0)) + assign(RECEIVED, b'\x27')
    changes[29905] = relocate(changes[29905], [(at, at, reset)])[0]
    edits = []
    for mid, updated in changes.items():
        start, size, limits = bodies[mid]
        required = bytecode_requirements(updated, names, limits[2])
        current = (max(limits[0], required[0]), max(limits[1], required[1]),
                   limits[2], max(limits[3], required[2]))
        r = ABCReader(abc); r.pos = start + size
        if r.u30(): raise ValueError('Unexpected spin exception handler')
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected spin method header')
        value = b''.join(encode_u30(v) for v in (mid, *current, len(updated))) + updated + b'\0'
        edits.append((start - len(header), r.pos, value))
    result = bytearray(abc)
    for lo, hi, value in sorted(edits, reverse=True): result[lo:hi] = value
    _, _, after = inspect_abc(result)
    for mid, (start, size, limits) in bodies.items():
        now, length, current = after[mid]
        if mid not in METHODS and (limits != current or abc[start:start + size] != result[now:now + length]):
            raise ValueError(f'Unrelated method {mid} changed')
    restored = bytearray(result); shift = 0; undo = []
    for lo, hi, value in sorted(edits):
        undo.append((lo + shift, lo + shift + len(value), abc[lo:hi])); shift += len(value) - (hi - lo)
    for lo, hi, value in reversed(undo): restored[lo:hi] = value
    if restored != abc: raise ValueError('Unrelated spin metadata changed')
    for pos in positions: result[pos] = 0
    return assemble(source, bytes(result))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--check', action='store_true')
    args = parser.parse_args(); before = CLIENT.read_bytes(); after = patch_swf(before)
    if patch_swf(after) != after: raise ValueError('Non-idempotent spin fix')
    if args.check:
        if before != after: raise ValueError('Spin finish fix missing')
    elif before != after: CLIENT.write_bytes(after)
    print('Anniversary spin result, timeout and close recovery verified.')
