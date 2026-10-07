"""Hide National Day's claimed daily gift and LongTeng's claimed final prize."""
from __future__ import annotations

import argparse
import struct
import zlib

from patch_activity_entries import q
from patch_activity_reminders import CLIENT, Code, call, get, normalize, number, prop, put, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_wanfu_dragon_reminders import dragon_effect

METHODS = {6333, 6336, 6377, 6381, 6496, 6497, 8635}
GD = q(0x60, 1507)
NATIONAL = prop(GD, 31270)
DRAGON = prop(GD, 31294)
PANEL = q(0x60, 8094)
TYPES = q(0x60, 13052)
EVENT = prop(q(0x60, 331), 36022)


def remove(kind):
    key = prop(TYPES, kind)
    return call(PANEL, 38381, key, key, void=True)


def national_hidden(c, label):
    c.add(prop(NATIONAL, 3465) + number(1)); c.branch(0x15, label)
    c.add(prop(NATIONAL, 3465) + number(7)); c.branch(0x17, label)
    c.add(prop(NATIONAL, 3466)); c.branch(0x12, 'national_visible')
    c.add(prop(NATIONAL, 3466) + prop(NATIONAL, 3465) + number(6) + b'\xa0' + q(0x66, 44555) + number(1))
    c.branch(0x13, label)
    c.label('national_visible')


def national_day():
    c = Code(); c.add(get(0) + b'\x30')
    national_hidden(c, 'hidden')
    c.add(call(get(0), 8311, prop(GD, 11237, 2339), prop(TYPES, 38327), void=True))
    c.branch(0x10, 'done')
    c.label('hidden'); c.add(remove(38327))
    c.label('done'); c.add(b'\x47')
    return c.finish()


def dragon_handler(add):
    c = Code(); c.add(get(0) + b'\x30')
    c.add(get(1)); c.branch(0x12, 'done')
    c.add(prop(get(1), 6015) + EVENT); c.branch(0x1a, 'done')
    c.add(prop(GD, 11237, 4168) + number(3)); c.branch(0x15, 'hidden')
    c.add(prop(DRAGON, 3382) + number(49)); c.branch(0x15, 'visible')
    c.add(prop(DRAGON, 3384) + number(0)); c.branch(0x14, 'visible')
    c.label('hidden'); c.add(remove(38325)); c.branch(0x10, 'done')
    c.label('visible')
    # Use the same button/callback as checkAddBtn, without issuing a new query.
    c.add(add.replace(get(4), prop(TYPES, 38325)))
    c.add(dragon_effect(2))
    c.label('done'); c.add(b'\x47')
    return c.finish()


def icon_reply():
    c = Code()
    c.add(get(2) + number(4)); c.branch(0x14, 'done')
    c.add(DRAGON + call(get(1), 43492) + number(1) + b'\xa1' + q(0x61, 3382))
    c.add(DRAGON + call(get(1), 43492) + q(0x61, 3384))
    c.add(call(q(0x60, 1563), 13673, q(0x5d, 331) + EVENT + q(0x4a, 331, 1), void=True))
    c.label('done'); c.add(b'\x09')
    return c.finish()


def patch_swf(source):
    data, (tag, payload, a, b) = abc_section(source)
    abc, positions = normalize(data[a:b]); names, traits, bodies = inspect_abc(abc, 'NavTopRightArea')
    if traits['onServiceWarCan'] != (6496, 8308) or names[36022] != 'LONGTENG_REMAIN_TIME':
        raise ValueError('Unexpected icon handlers')
    code = lambda mid: abc[bodies[mid][0]:sum(bodies[mid][:2])]
    if code(6381) == national_day(): return source
    if code(6496) != b'\xd0\x30\x47': raise ValueError('Service-war callback is no longer unused')
    transforms = {6381: (national_day(), lambda p: p)}
    transforms[6336] = relocate(code(6336), [(2, 2, call(get(0), 8173, b'\x20', void=True))])
    for mid, listener in ((6333, 13671), (6377, 13672)):
        value = call(q(0x60, 1563), listener, EVENT, prop(get(0), 8308), void=True)
        transforms[mid] = relocate(code(mid), [(2, 2, value)])
    transforms[6496] = (dragon_handler(code(6497)[331:398]), lambda p: p)
    # Build guards together with the complete case to resolve local branches.
    c = Code(); national_hidden(c, 'national_done'); c.add(code(6497)[190:257])
    c.label('national_done'); c.add(b'\x09')
    national_case = c.finish()
    c = Code()
    c.add(prop(DRAGON, 3382) + number(49)); c.branch(0x15, 'dragon_visible')
    c.add(prop(DRAGON, 3384) + number(0)); c.branch(0x14, 'dragon_visible')
    # Always query the server even when cached completion hides the icon.
    c.branch(0x10, 'dragon_query')
    c.label('dragon_visible'); c.add(code(6497)[331:455])
    c.label('dragon_query'); c.add(code(6497)[455:481])
    dragon_case = c.finish()
    transforms[6497] = relocate(code(6497), [(190, 257, national_case), (331, 481, dragon_case)])
    transforms[8635] = relocate(code(8635), [(428, 485, icon_reply() + code(8635)[428:485])])
    changes = []
    for mid, (updated, moved) in transforms.items():
        instructions(updated)
        start, size, limits = bodies[mid]
        new_limits = (13, 3, *limits[2:]) if mid == 6496 else (max(limits[0], 4), *limits[1:])
        r = ABCReader(abc); r.pos = start + size; exceptions = []
        for _ in range(r.u30()):
            row = [r.u30() for _ in range(5)]; exceptions.append([moved(v) for v in row[:3]] + row[3:])
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected method header')
        value = b''.join(encode_u30(v) for v in (mid, *new_limits, len(updated))) + updated
        value += encode_u30(len(exceptions)) + b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start - len(header), r.pos, value))
    result = bytearray(abc)
    for start, end, value in sorted(changes, reverse=True): result[start:end] = value
    _, _, after = inspect_abc(result)
    for mid, (start, size, limits) in bodies.items():
        new_start, new_size, new_limits = after[mid]
        if mid not in METHODS and (limits != new_limits or abc[start:start + size] != result[new_start:new_start + new_size]):
            raise ValueError('Unrelated method changed')
    restored = bytearray(result); shift = 0; undo = []
    for start, end, value in sorted(changes):
        undo.append((start + shift, start + shift + len(value), abc[start:end])); shift += len(value) - (end - start)
    for start, end, value in reversed(undo): restored[start:end] = value
    if restored != abc: raise ValueError('Unrelated ABC metadata changed')
    for pos in positions: result[pos] = 0
    swf = data[:tag + 2] + struct.pack('<I', a - payload + len(result)) + data[payload:a] + result + data[b:]
    swf = swf[:4] + struct.pack('<I', len(swf)) + swf[8:]
    if swf[8:tag] != data[8:tag] or swf[a + len(result):] != data[b:]: raise ValueError('Unrelated artwork changed')
    return swf[:8] + zlib.compress(swf[8:], 9)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--check', action='store_true')
    args = parser.parse_args(); source = CLIENT.read_bytes(); updated = patch_swf(source)
    if patch_swf(updated) != updated: raise ValueError('Non-idempotent patch')
    if args.check:
        if updated != source: raise ValueError('Daily icon patch missing')
    elif updated != source: CLIENT.write_bytes(updated)
    print('Daily gift and final-prize icon visibility verified.')
