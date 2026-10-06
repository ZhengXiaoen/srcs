"""Repair the native material-rebate mark without changing purchase reminders."""
from __future__ import annotations

import argparse
import struct
import zlib

from patch_activity_entries import q
from patch_activity_reminders import CLIENT, Code, GD, GAME, call, get, normalize, number, prop, put
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc

BASELINE = 'f5cd104'
METHODS = {5579}
JJ = prop(GD, 31270)
DYNAMIC = 44338


def material_mark():
    c = Code(); c.add(b'\xd0\x30')
    c.add(prop(get(0), 6755) + number(4) + q(0x66, DYNAMIC) + put(2))
    c.add(get(2)); c.branch(0x12, 'return')
    c.add(b'\x27' + put(5))
    for field in (3491, 3492):
        c.add(prop(JJ, field) + number(0)); c.branch(0x0e, 'effect')
    c.add(prop(JJ, 3492) + prop(JJ, 3491)); c.branch(0x17, 'effect')
    c.add(prop(JJ, 3490) + number(2)); c.branch(0x1a, 'effect')
    cfg = call(prop(GAME, 32246), 11394)
    c.add(b''.join(prop(cfg, field) for field in (24596, 24599, 24597, 24598))
          + q(0x56, 4) + put(4) + number(0) + put(6))
    for field in (3504, 3505):
        c.add(prop(JJ, field)); c.branch(0x12, 'effect')
    c.label('outer')
    c.add(get(6) + prop(get(4), 3237)); c.branch(0x18, 'effect')
    c.add(prop(JJ, 3505) + get(6) + q(0x66, DYNAMIC) + put(8))
    c.add(get(8)); c.branch(0x12, 'next')
    c.add(get(4) + get(6) + q(0x66, DYNAMIC) + put(9))
    c.add(get(9)); c.branch(0x12, 'next')
    c.add(prop(JJ, 3504) + get(6) + q(0x66, DYNAMIC) + put(3))
    c.add(number(0) + put(7))
    c.label('inner')
    for row in (8, 9):
        c.add(get(7) + prop(get(row), 3237)); c.branch(0x18, 'next')
    c.add(get(8) + get(7) + q(0x66, DYNAMIC) + number(0)); c.branch(0x1a, 'advance')
    # Read the typed reward row, not the outer array's nonexistent count property.
    c.add(get(9) + get(7) + q(0x66, DYNAMIC) + put(1))
    c.add(get(1)); c.branch(0x12, 'advance')
    c.add(get(3) + prop(get(1), 3754)); c.branch(0x0f, 'advance')
    c.add(b'\x26' + put(5)); c.branch(0x10, 'effect')
    c.label('advance'); c.add(q(0xc2, 7)); c.branch(0x10, 'inner')
    c.label('next'); c.add(q(0xc2, 6)); c.branch(0x10, 'outer')
    c.label('effect'); c.add(get(2) + get(5) + q(0x61, 1832))
    c.label('return'); c.add(b'\x47')
    return c.finish()


def patch_swf(source):
    data, (tag, payload, a, b) = abc_section(source)
    abc, positions = normalize(data[a:b]); names, traits, bodies = inspect_abc(abc, 'JingJiWin')
    if traits['fanliicon'] != (5579, 6766): raise ValueError('Unexpected material reminder method')
    for index, name in ((3504, 'jingjiFanliUseNum'), (3505, 'jingJiFanliGet'),
                        (3754, 'count'), (6755, '_icon')):
        if names[index] != name: raise ValueError('Unexpected material reminder symbols')
    start, size, limits = bodies[5579]; code = abc[start:start + size]; updated = material_mark()
    if code == updated: return source
    if size != 272 or code[207:214] != get(6) + get(3) + q(0x66, 44342):
        raise ValueError('Unexpected original material reminder')
    reader = ABCReader(abc); reader.pos = start + size
    if reader.u30() != 0: raise ValueError('Unexpected material reminder exception table')
    header = b''.join(encode_u30(v) for v in (5579, *limits, size))
    if abc[start - len(header):start] != header: raise ValueError('Unexpected method header')
    new_limits = (max(limits[0], 4), max(limits[1], 10), *limits[2:])
    value = b''.join(encode_u30(v) for v in (5579, *new_limits, len(updated))) + updated + b'\0'
    lo, hi = start - len(header), reader.pos
    result = bytearray(abc[:lo] + value + abc[hi:]); instructions(updated)
    _, _, after = inspect_abc(result)
    for mid, (old_start, old_size, old_limits) in bodies.items():
        new_start, new_size, actual_limits = after[mid]
        if mid not in METHODS and (old_limits != actual_limits or
                abc[old_start:old_start + old_size] != result[new_start:new_start + new_size]):
            raise ValueError('Unrelated client method changed')
    if result[:lo] + abc[lo:hi] + result[lo + len(value):] != abc:
        raise ValueError('Unrelated ABC metadata changed')
    for pos in positions: result[pos] = 0
    swf = data[:tag + 2] + struct.pack('<I', a - payload + len(result)) + data[payload:a] + result + data[b:]
    swf = swf[:4] + struct.pack('<I', len(swf)) + swf[8:]
    if swf[8:tag] != data[8:tag] or swf[a + len(result):] != data[b:]:
        raise ValueError('Unrelated SWF resources changed')
    return swf[:8] + zlib.compress(swf[8:], 9)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--check', action='store_true')
    args = parser.parse_args(); source = CLIENT.read_bytes(); updated = patch_swf(source)
    if patch_swf(updated) != updated: raise ValueError('Non-idempotent material reminder patch')
    if args.check:
        if updated != source: raise ValueError('Material reminder patch missing')
    elif updated != source: CLIENT.write_bytes(updated)
    print('Verified Jingji native material reminder; other client methods and resources are unchanged.')
