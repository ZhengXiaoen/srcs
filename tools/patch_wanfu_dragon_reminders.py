"""Clear Wanfu's first-open marks and highlight LongTeng's remaining spins."""
from __future__ import annotations

import argparse
import struct
import zlib

from patch_activity_entries import q
from patch_activity_reminders import CLIENT, ROOT, Code, GD, GAME, PAY, call, days_available, get, normalize, number, prop, put, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc

BASELINE = '264dc77'
METHODS = {6023, 6025, 6033, 6034, 6035, 6355, 6437, 6497, 8635}
WANFU = prop(GD, 31272)
CFG = prop(GAME, 32205, 11369)
WIN = q(0x60, 7620)
DYNAMIC = 44442


def badge(kind):
    c = Code(); c.add(get(0) + b'\x30\x27' + put(5))
    c.add(prop(WIN, 3346) + number(1)); c.branch(0x15, 'done')
    c.add(prop(WIN, 3346) + prop(WIN, 35309)); c.branch(0x17, 'done')
    if kind == 'acc':
        days_available(c, prop(CFG, 14703), prop(WANFU, 3371), prop(WANFU, 3845), 43950)
    else:
        c.add(prop(CFG, 23966 if kind == 'login' else 23967) + put(4))
        c.add(prop(WANFU, 3844 if kind == 'login' else 3837) + put(6))
        c.add(get(6)); c.branch(0x12, 'done')
        if kind == 'login':
            c.add(prop(GD, 11237, 2339) + number(80)); c.branch(0x15, 'done')
        c.add(number(0) + put(3)); c.label('loop')
        for value in (get(4), get(6)):
            c.add(get(3) + prop(value, 3237)); c.branch(0x18, 'done')
        c.add(get(6) + get(3) + q(0x66, DYNAMIC) + number(0 if kind == 'login' else 1))
        c.branch(0x1a, 'next')
        if kind == 'login':
            for value in (prop(WANFU, 3547), prop(WIN, 3346)):
                c.add(get(3) + value); c.branch(0x0c, 'next')
        else:
            c.add(PAY + prop(get(4) + get(3) + q(0x66, DYNAMIC), 18571)); c.branch(0x0f, 'next')
        c.add(b'\x26' + put(5)); c.branch(0x10, 'done')
        c.label('next'); c.add(q(0xc2, 3)); c.branch(0x10, 'loop')
    c.label('done')
    field = {'login': 7651, 'gift': 7652, 'acc': 7653}[kind]
    c.add(prop(get(0), field) + get(5) + q(0x61, 1832) + b'\x47')
    return c.finish()


def dragon_effect(local):
    c = Code()
    c.add(prop(q(0x60, 8094), 32792) + put(local))
    c.add(get(local)); c.branch(0x12, 'done')
    c.add(call(get(local), 20248, prop(q(0x60, 13052), 38325)) + put(local))
    c.add(get(local)); c.branch(0x12, 'done')
    c.add(call(get(local), 12784, prop(GD, 31294, 3381) + number(0) + b'\xaf', void=True))
    c.label('done'); c.add(b'\x09')
    return c.finish()


def query(operation):
    c = Code(); c.add(prop(GD, 11237, 4168) + number(3)); c.branch(0x15, 'done')
    c.add(call(q(0x60, 11028), 37567, number(operation), void=True))
    c.label('done'); c.add(b'\x09'); return c.finish()


def patch_swf(source):
    data, (tag, payload, a, b) = abc_section(source)
    abc, positions = normalize(data[a:b]); names, _, bodies = inspect_abc(abc)
    start, size, _ = bodies[6034]
    if abc[start:start + size] == badge('gift'): return source
    transforms = {}
    code = lambda mid: abc[bodies[mid][0]:sum(bodies[mid][:2])]
    # Hide each original native mark before addChild can expose it on stage.
    ops = instructions(code(6023)); edits = []
    for op in ops:
        if op.opcode == 0x68 and op.operands[0] in (7651, 7652, 7653):
            edits.append((op.end, op.end, prop(get(0), op.operands[0]) + b'\x27' + q(0x61, 1832)))
    if len(edits) != 3: raise ValueError('Unexpected Wanfu marks')
    transforms[6023] = relocate(code(6023), edits)
    retired = prop(get(0), 7638) + prop(get(0), 7657) + q(0x4f, 1868, 1)
    old = code(6025)
    if old.count(retired) != 1: raise ValueError('Unexpected retired Wanfu attachment')
    start = old.index(retired); transforms[6025] = relocate(old, [(start, start + len(retired), b'')])
    for mid, kind in ((6033, 'acc'), (6034, 'gift'), (6035, 'login')):
        transforms[mid] = (badge(kind), lambda p: p)
    # Replies update the top button even when the dynamically loaded window is closed.
    transforms[8635] = relocate(code(8635), [(len(code(8635)) - 1, len(code(8635)), dragon_effect(13) + b'\x47')])
    # Creating the entry requests the board once, including its real remaining count.
    transforms[6497] = relocate(code(6497), [(398, 398, dragon_effect(14) + query(1))])
    transforms[6437] = relocate(code(6437), [(2, 2, query(4))])
    transforms[6355] = relocate(code(6355), [(2, 2, query(1))])
    changes = []
    for mid, (updated, moved) in transforms.items():
        instructions(updated)
        start, size, limits = bodies[mid]; new_limits = limits
        if mid in (6033, 6034, 6035): new_limits = (max(limits[0], 4), max(limits[1], 10), *limits[2:])
        if mid == 8635: new_limits = (limits[0], 14, *limits[2:])
        if mid == 6497: new_limits = (limits[0], 15, *limits[2:])
        r = ABCReader(abc); r.pos = start + size; exceptions = []
        for _ in range(r.u30()):
            row = [r.u30() for _ in range(5)]; exceptions.append([moved(v) for v in row[:3]] + row[3:])
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected method header')
        value = b''.join(encode_u30(v) for v in (mid, *new_limits, len(updated))) + updated
        value += encode_u30(len(exceptions)) + b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start - len(header), r.pos, value))
    ordered = sorted(changes); result = bytearray(abc)
    for start, end, value in reversed(ordered): result[start:end] = value
    _, _, after = inspect_abc(result)
    for mid, (start, size, limits) in bodies.items():
        new_start, new_size, new_limits = after[mid]
        if mid not in METHODS and (limits != new_limits or abc[start:start + size] != result[new_start:new_start + new_size]):
            raise ValueError('Unrelated method changed')
    restored = bytearray(result); shift = 0; undo = []
    for start, end, value in ordered:
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
        if source != updated: raise ValueError('Reminder patch missing')
    elif source != updated: CLIENT.write_bytes(updated)
    print('Wanfu first-open marks and LongTeng remaining-spin highlight repaired.')
