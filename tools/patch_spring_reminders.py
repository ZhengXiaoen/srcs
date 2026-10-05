"""Use the shipped Spring claim states for entry effects and native tab marks.

Only Spring methods, its listeners and requests change. Keep all reward tables,
constant pools, artwork and unrelated SWF resources byte-identical.
"""
from __future__ import annotations

import struct
import zlib

from patch_activity_entries import q
from patch_activity_reminders import (CLIENT, Code, GD, call, days_available,
                                      event_is, get, normalize, number, prop,
                                      put, relocate)
from patch_bag_client import ABCReader, encode_u30
from patch_competition_hongli_reminders import parameter_positions
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc

BASELINE = '61a1f20'
SPRING = prop(GD, 31242)
DYNAMIC = 43950
METHODS = {3324, 3325, 3327, 3329, 5903, 6333, 6365, 6377, 6440,
           17342, 17343, 17345, 17347, 17373, 17374, 17375}
PARAMETER_METHODS = {17345, 17375}


def gate(c, done='done'):
    c.add(prop(get(0), 3346) + number(1)); c.branch(0x15, done)
    c.add(prop(get(0), 3346) + prop(get(0), 4410, 14688, 24367, 3237))
    c.branch(0x0d, done)


def login_ready():
    c = Code(); c.add(b'\xd0\x30'); gate(c)
    # -1 means that the server's login flags have not arrived yet.
    c.add(prop(get(0), 4399) + number(0)); c.branch(0x0f, 'done')
    bit = prop(get(0), 4399) + prop(get(0), 3346) + number(1) + b'\xa1\xa6' + number(1) + b'\xa8'
    c.add(bit + number(0)); c.branch(0x19, 'ready')
    c.add(prop(get(0), 4410, 14688, 24368) + put(2) + number(0) + put(3))
    c.label('loop')
    c.add(get(3) + prop(get(2), 3237)); c.branch(0x18, 'done')
    c.add(prop(get(0), 3347) + prop(get(2) + get(3) + q(0x66, DYNAMIC), 14684))
    c.branch(0x0f, 'next')
    c.add(prop(get(0), 4399) + number(24) + get(3) + b'\xa0\xa6' + number(1) + b'\xa8' + number(0))
    c.branch(0x19, 'ready')
    c.label('next'); c.add(q(0xc2, 3)); c.branch(0x10, 'loop')
    c.label('done'); c.add(b'\x27\x48')
    c.label('ready'); c.add(b'\x26\x48')
    return c.finish()


def recharge_ready():
    c = Code(); c.add(b'\xd0\x30\x27' + put(5)); gate(c)
    # Message 12 contains achieved days and per-day claim flags. Message 8 is retired.
    days_available(c, prop(get(0), 4410, 14703), prop(get(0), 3371),
                   prop(get(0), 3845), DYNAMIC)
    c.label('done'); c.add(get(5) + b'\x48')
    return c.finish()


def entry_ready(code):
    # Retain the server-date calculation and activity-window guard.
    start = code.index(call(get(0), 4412))
    c = Code(); c.add(call(get(0), 4413)); c.branch(0x11, 'ready')
    c.add(call(get(0), 4415) + b'\x48')
    c.label('ready'); c.add(b'\x26\x48')
    return relocate(code, [(start, len(code), c.finish())])


def refresh():
    c = Code(); c.add(b'\xd0\x30')
    # canGet recalculates the day from the current server date, even at midnight.
    c.add(call(SPRING, 4411) + put(2))
    event_is(c, 331, 35987, 'day')
    event_is(c, 141, 31479, 'pay')
    c.branch(0x10, 'effect')
    c.label('day')
    c.add(SPRING + number(-1) + q(0x68, 4399))
    for field in (3371, 3845): c.add(SPRING + q(0x56, 0) + q(0x68, field))
    c.add(b'\x27' + put(2))
    c.add(prop(SPRING, 3346) + number(1)); c.branch(0x15, 'effect')
    c.add(call(q(0x60, 1787), 32657, number(2), number(1), void=True))
    c.branch(0x10, 'query')
    c.label('pay')
    c.add(prop(SPRING, 3346) + number(1)); c.branch(0x15, 'effect')
    c.label('query')
    c.add(call(q(0x60, 1787), 32657, number(12), number(0), void=True))
    c.label('effect')
    c.add(call(get(0), 8153, prop(q(0x60, 13052), 38258), get(2), void=True))
    c.add(b'\x47'); return c.finish()


def patch_swf(source):
    data, (tag, payload, a, b) = abc_section(source)
    abc, positions = normalize(data[a:b]); names, _, bodies = inspect_abc(abc)
    for index, name in ((4413, 'checkLoginCanGet'), (4415, 'checkNewYearCharge'),
                        (24367, 'loginAwards'), (39371, 'RECHARGE')):
        if names[index] != name: raise ValueError('Unexpected Spring symbols')
    changes = []

    def edit(mid, transform, stack=0, locals_=0):
        start, size, limits = bodies[mid]; code = abc[start:start + size]
        updated, moved = transform(code); instructions(updated)
        new_limits = (max(limits[0], stack), max(limits[1], locals_), *limits[2:])
        if updated == code and new_limits == limits: return
        reader = ABCReader(abc); reader.pos = start + size; exceptions = []
        for _ in range(reader.u30()):
            row = [reader.u30() for _ in range(5)]
            exceptions.append([moved(p) for p in row[:3]] + row[3:])
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected method header')
        value = b''.join(encode_u30(v) for v in (mid, *new_limits, len(updated))) + updated
        value += encode_u30(len(exceptions)) + b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start - len(header), reader.pos, value))

    def insert(code, at, value):
        return (code, lambda p: p) if value in code else relocate(code, [(at, at, value)])

    def replace(code, old, new):
        if old not in code:
            if new in code: return code, lambda p: p
            raise ValueError('Expected Spring expression missing')
        if code.count(old) != 1: raise ValueError('Ambiguous Spring expression')
        at = code.index(old); return relocate(code, [(at, at + len(old), new)])

    edit(3324, lambda code: insert(code, len(code) - 1, get(0) + number(-1) + q(0x68, 4399)))
    edit(3327, lambda _: (login_ready(), lambda p: p), stack=5)
    edit(3329, lambda _: (recharge_ready(), lambda p: p), stack=5, locals_=10)
    edit(3325, lambda code: entry_ready(code) if call(get(0), 4412) in code else (code, lambda p: p))
    # Both existing native PlaintMark instances start hidden until a reply is known.
    value = b''.join(prop(get(0), mark) + b'\x27' + q(0x61, 1832) for mark in (7463, 7464))
    edit(5903, lambda code: insert(code, len(code) - 1, value))
    tail = Code(); tail.add(prop(get(0), 4015)); tail.branch(0x12, 'done')
    tail.add(prop(get(0), 4015) + call(SPRING, 4415) + q(0x61, 1832))
    tail.label('done'); tail.add(b'\x47'); tail = tail.finish()
    edit(17347, lambda code: (code, lambda p: p) if code.endswith(tail) else relocate(code, [(118, len(code), tail)]))
    # Refresh open tabs at midnight as well, including after the final day.
    for added, removed, handler in ((17342, 17343, 18181), (17373, 17374, 18221)):
        for mid, listener in ((added, 13671), (removed, 13672)):
            value = call(q(0x60, 1563), listener, prop(q(0x60, 331), 35987),
                         prop(get(0), handler), void=True)
            def tab_listener(code, value=value, mid=mid):
                if mid == 17374 and q(0x4f, 13671, 2) in code:
                    code = replace(code, q(0x4f, 13671, 2), q(0x4f, 13672, 2))[0]
                return insert(code, 2, value)
            edit(mid, tab_listener)
    # These callbacks now receive both NewYearEvent and CliffordEvent.
    for mid in PARAMETER_METHODS:
        pos, kind = parameter_positions(abc)[mid][0]
        if kind != 2: changes.append((pos, pos + len(encode_u30(kind)), encode_u30(2)))
    edit(6365, lambda _: (refresh(), lambda p: p), stack=4)
    for mid, listener in ((6333, 13671), (6377, 13672)):
        value = b''.join(call(q(0x60, 1563), listener, prop(q(0x60, cls), event),
                              prop(get(0), 8157), void=True)
                         for cls, event in ((827, 39371), (141, 31479), (331, 35987)))
        edit(mid, lambda code, value=value: insert(code, 2, value))
    edit(6440, lambda code: replace(code,
         call(q(0x60, 1787), 32657, number(8), number(1), void=True),
         call(q(0x60, 1787), 32657, number(12), number(0), void=True)))
    if not changes: return source
    ordered = sorted(changes)
    if any(end > next_start for (_, end, _), (next_start, _, _) in zip(ordered, ordered[1:])):
        raise ValueError('Overlapping Spring edits')
    result = bytearray(abc)
    for start, end, value in reversed(ordered): result[start:end] = value
    _, _, after = inspect_abc(result)
    for mid, (start, size, limits) in bodies.items():
        new_start, new_size, new_limits = after[mid]
        if mid not in METHODS and (abc[start:start + size] != result[new_start:new_start + new_size] or limits != new_limits):
            raise ValueError('Unrelated client method changed')
    # Restoring every edited record must recover the whole original ABC exactly.
    restored = bytearray(result); shift = 0; undo = []
    for start, end, value in ordered:
        undo.append((start + shift, start + shift + len(value), abc[start:end]))
        shift += len(value) - (end - start)
    for start, end, value in reversed(undo): restored[start:end] = value
    if restored != abc: raise ValueError('Unrelated ABC metadata changed')
    for pos in positions: result[pos] = 0
    swf = data[:tag + 2] + struct.pack('<I', a - payload + len(result)) + data[payload:a] + result + data[b:]
    swf = swf[:4] + struct.pack('<I', len(swf)) + swf[8:]
    if swf[8:tag] != data[8:tag] or swf[a + len(result):] != data[b:]:
        raise ValueError('Unrelated SWF resources changed')
    return swf[:8] + zlib.compress(swf[8:], 9)


if __name__ == '__main__':
    source = CLIENT.read_bytes(); updated = patch_swf(source)
    if patch_swf(updated) != updated: raise ValueError('Non-idempotent Spring patch')
    if updated != source: CLIENT.write_bytes(updated)
    print('Spring entry and native tab marks now use currently claimable rewards.')
