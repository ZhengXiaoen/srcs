"""Refresh Jingji/QingDian main entries from existing, claimable rewards.

Patch method bodies only; keep reward configuration, entry artwork, navigation,
constant pools, traits and unrelated SWF resources byte-identical.
"""
from __future__ import annotations

import argparse
import hashlib
import struct
import zlib

from patch_activity_reminders import (CLIENT, Code, GD, GAME, PAY, call,
                                      days_available, event_is, get, normalize,
                                      number, prop, put, relocate)
from patch_activity_entries import q
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section
from patch_god_equip_state import inspect_abc

BASELINE = '22bfbc8'
JJ = prop(GD, 31270)
JJ_CFG = call(prop(GAME, 32246), 11394)
QD = prop(GD, 31272)
QD_CFG = prop(GAME, 32205, 11369)
QD_WIN = q(0x60, 7620)
DYNAMIC = 43950
METHODS = {2720, 6333, 6334, 6357, 6377, 6379, 6403, 6408, 6437}
ORIGINAL_HASHES = {
    2720: '9a63ed900b33ab0c93ec2e3379e11a1ea7c1969f7a82ff2b43484597fc82da8f',
    6333: '9631c72b7b349de27d953bb952b0a702fbcac1104231657cc5405b578fe0f954',
    6334: '42bd00ff7cc37c7a453841719b9b5de7de4bd5e33e497b7813ab48a42ccb0aef',
    6357: '9b92944384092732354d6c80dbbb86e1d8dd65b60d958945905dc88e940ad5d2',
    6377: '05df7bd056cc0d5840733c34780b36bf471b791a6999b294e47507832104ba96',
    6379: '3118655f3179b2fc2783103b9af597ca866887f11441596427e9a629617559ec',
    6403: 'ba0108cd7d873106796ee3ef6662658fca6595afaf2a6f4d5a725d4ab85f4cd1',
    6408: 'c495a986931204472884174c7856c34fbb4ade1d301c51af6d80facdfae190ff',
    6437: 'f1cde67acb06ef73fa591adfc1122130f9565556dc35843d374cd196df71fe8f',
}


def jingji_entry(original):
    c = Code(); c.add(b'\xd0\x30')
    for field in (3491, 3490, 3492):
        c.add(prop(JJ, field) + number(0)); c.branch(0x0e, 'closed')
    c.add(prop(JJ, 3492) + prop(JJ, 3491)); c.branch(0x17, 'closed')
    # Preserve the shared Christmas entry's existing behavior and resources.
    c.add(prop(JJ, 3490) + number(1)); c.branch(0x14, 'jingji')
    c.add(original[105:207]); c.branch(0x10, 'ready')
    c.label('jingji')
    c.add(prop(JJ, 3490) + number(2)); c.branch(0x14, 'return')
    c.add(call(q(0x60, 8096), 38383, prop(q(0x60, 13052), 38331)) + put(2))
    c.add(get(2)); c.branch(0x12, 'request')
    event_is(c, 331, 36047, 'request')
    c.branch(0x10, 'refresh')
    c.label('request')
    for msg, page in ((0, 1), (0, 3), (6, 1), (7, 1), (8, 1), (9, 1)):
        c.add(call(q(0x60, 11028), 37543, number(msg), number(page), void=True))
    c.add(call(q(0x60, 11028), 37541, number(1), void=True))
    c.add(get(2)); c.branch(0x11, 'refresh')
    c.add(original[227:329])  # Original title, art and window callback.
    c.label('refresh')
    c.add(get(2)); c.branch(0x12, 'return')
    c.add(prop(JJ, 3493) + number(0)); c.branch(0x1a, 'recharge')
    c.add(prop(GD, 11237, 2339) + number(80)); c.branch(0x18, 'ready')
    c.label('recharge')
    days_available(c, prop(JJ_CFG, 24388, 14277), prop(JJ, 3494),
                   prop(JJ, 3495), DYNAMIC, day_field=None)
    c.add(get(5)); c.branch(0x11, 'ready')
    c.add(prop(JJ, 3497) + number(0)); c.branch(0x17, 'ready')
    # Only material rebates contribute; sale goods and weapons require buying.
    c.add(b''.join(prop(JJ_CFG, name) for name in (24596, 24599, 24597, 24598))
          + q(0x56, 4) + put(4) + number(0) + put(6))
    c.label('rank_outer')
    c.add(get(6) + prop(get(4), 3237)); c.branch(0x18, 'effect')
    c.add(prop(JJ, 3505) + get(6) + q(0x66, DYNAMIC) + put(8))
    c.add(get(8)); c.branch(0x12, 'rank_next')
    c.add(get(4) + get(6) + q(0x66, DYNAMIC) + put(9) + number(0) + put(7))
    c.label('rank_inner')
    for row in (8, 9):
        c.add(get(7) + prop(get(row), 3237)); c.branch(0x18, 'rank_next')
    c.add(get(8) + get(7) + q(0x66, DYNAMIC) + number(0)); c.branch(0x1a, 'rank_advance')
    c.add(prop(JJ, 3504) + get(6) + q(0x66, DYNAMIC)
          + prop(get(9) + get(7) + q(0x66, DYNAMIC), 3754))
    c.branch(0x18, 'ready')
    c.label('rank_advance'); c.add(q(0xc2, 7)); c.branch(0x10, 'rank_inner')
    c.label('rank_next'); c.add(q(0xc2, 6)); c.branch(0x10, 'rank_outer')
    c.label('ready'); c.add(b'\x26' + put(5))
    c.label('effect'); c.add(call(get(2), 12784, get(5), void=True)); c.branch(0x10, 'return')
    c.label('closed'); c.add(original[344:408])
    c.label('return'); c.add(b'\x47')
    return c.finish()


def scan(c, config, statuses, flag, threshold, field, prefix, login=False):
    """Jump to ready for a received flag whose configured threshold is met."""
    c.add(config + put(4) + statuses + put(8))
    c.add(get(8)); c.branch(0x12, prefix + '_done')
    c.add(number(0) + put(6))
    c.label(prefix + '_loop')
    for row in (4, 8):
        c.add(get(6) + prop(get(row), 3237)); c.branch(0x18, prefix + '_done')
    c.add(get(8) + get(6) + q(0x66, DYNAMIC) + number(flag)); c.branch(0x1a, prefix + '_next')
    if login:
        for available in (prop(QD, 3547), prop(QD_WIN, 3346)):
            c.add(get(6) + available); c.branch(0x0c, prefix + '_next')
    else:
        c.add(threshold + prop(get(4) + get(6) + q(0x66, DYNAMIC), field))
        c.branch(0x0f, prefix + '_next')
    c.branch(0x10, 'ready')
    c.label(prefix + '_next'); c.add(q(0xc2, 6)); c.branch(0x10, prefix + '_loop')
    c.label(prefix + '_done')


def qingdian_effect():
    c = Code(); c.add(b'\xd0\x30')
    c.add(call(q(0x60, 8096), 38383, prop(q(0x60, 13052), 38294)) + put(1))
    c.add(get(1)); c.branch(0x12, 'return')
    c.add(b'\x27' + put(5))
    c.add(prop(QD_WIN, 3346) + number(1)); c.branch(0x15, 'effect')
    c.add(prop(QD_WIN, 3346) + prop(QD_WIN, 35309)); c.branch(0x17, 'effect')
    c.add(prop(GD, 11237, 2339) + number(80)); c.branch(0x15, 'login_done')
    scan(c, prop(QD_CFG, 23966), prop(QD, 3844), 0, None, None, 'login', login=True)
    # This protocol uses 1 for unclaimed recharge gifts, unlike other pages.
    scan(c, prop(QD_CFG, 23967), prop(QD, 3837), 1, PAY, 18571, 'gift')
    days_available(c, prop(QD_CFG, 14703), prop(QD, 3371), prop(QD, 3845), DYNAMIC)
    c.add(get(5)); c.branch(0x11, 'ready')
    c.add(prop(QD_CFG, 14704) + number(0) + q(0x66, DYNAMIC) + put(4)
          + prop(QD, 3847) + put(6))
    c.add(get(6) + number(0)); c.branch(0x15, 'spin_done')
    c.add(get(6) + prop(get(4), 3237)); c.branch(0x18, 'spin_done')
    need = prop(get(4) + get(6) + q(0x66, DYNAMIC), 14710)
    scaled = call(q(0x60, 43301), 43575, need + prop(QD_WIN, 35309) + b'\xa2' + number(3) + b'\xa3')
    c.add(prop(QD, 3846) + scaled); c.branch(0x18, 'ready')
    c.label('spin_done')
    # Collect-word rewards are repeatable; every item must satisfy its quantity.
    c.add(prop(QD_CFG, 23977, 23953) + put(4) + number(0) + put(6))
    c.label('word_outer')
    c.add(get(6) + prop(get(4), 3237)); c.branch(0x18, 'word_done')
    c.add(get(4) + get(6) + q(0x66, DYNAMIC) + put(8))
    c.add(prop(get(8), 3237) + number(0)); c.branch(0x16, 'word_next')
    c.add(number(0) + put(7))
    c.label('word_inner')
    c.add(get(7) + prop(get(8), 3237)); c.branch(0x18, 'ready')
    c.add(get(8) + get(7) + q(0x66, DYNAMIC) + put(9))
    c.add(call(prop(GD, 31170), 4554, prop(get(9), 2337)) + prop(get(9), 3754))
    c.branch(0x0f, 'word_next')
    c.add(q(0xc2, 7)); c.branch(0x10, 'word_inner')
    c.label('word_next'); c.add(q(0xc2, 6)); c.branch(0x10, 'word_outer')
    c.label('word_done')
    scan(c, prop(GAME, 32329, 11369, 14702), prop(QD, 3850), 0,
         prop(QD, 3851), 14266, 'hunt')
    c.branch(0x10, 'effect')
    c.label('ready'); c.add(b'\x26' + put(5))
    c.label('effect'); c.add(call(get(1), 12784, get(5), void=True))
    c.label('return'); c.add(b'\x47')
    return c.finish()


def patch_abc(source):
    abc, positions = normalize(source)
    names, _, bodies = inspect_abc(abc, 'NavTopRightArea')
    for index, name in {8121: 'jingjiOpen', 8200: 'checkQDShowEffect', 3837: 'isGet2',
                        23966: 'TotalLoginAward', 3505: 'jingJiFanliGet'}.items():
        if names[index] != name: raise ValueError(f'Unexpected QName {index}')
    a, size, _ = bodies[6403]
    if abc[a:a + size] == qingdian_effect(): return source
    for method, expected in ORIGINAL_HASHES.items():
        a, size, _ = bodies[method]
        if hashlib.sha256(abc[a:a + size]).hexdigest() != expected:
            raise ValueError(f'Unexpected original method {method}; refusing offset-based edits')
    changes = []

    def edit(method, transform, stack=None, locals_=None):
        start, size, limits = bodies[method]; code = abc[start:start + size]
        value = transform(code)
        updated, moved = value if isinstance(value, tuple) else (value, lambda p: p)
        new_limits = (stack or limits[0], locals_ or limits[1], *limits[2:])
        r = ABCReader(abc); r.pos = start + size; exceptions = []
        for _ in range(r.u30()):
            row = [r.u30() for _ in range(5)]
            exceptions.append([moved(p) for p in row[:3]] + row[3:])
        header = b''.join(encode_u30(v) for v in (method, *limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected method header')
        replacement = b''.join(encode_u30(v) for v in (method, *new_limits, len(updated))) + updated
        replacement += encode_u30(len(exceptions)) + b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start - len(header), r.pos, replacement, method))

    def insert(code, at, value): return relocate(code, [(at, at, value)])

    edit(6334, jingji_entry, stack=13, locals_=10)
    edit(6403, lambda _: qingdian_effect(), stack=5, locals_=10)
    edit(2720, lambda code: insert(code, len(code) - 4, get(0) + number(-1) + q(0x68, 3493)))
    # Reuse the existing Event-typed callback. checkQDShowEffect takes no args.
    edit(6379, lambda code: insert(code, 2, call(get(0), 8200, void=True)))
    events = [(331, e, 8121) for e in (36044, 36045, 36049, 36051)]
    events += [(331, e, 8171) for e in (36017, 36018, 36012, 36027)]
    events += [(329, 40723, 8171)]
    for method, listener in ((6333, 13671), (6377, 13672)):
        value = b''.join(call(q(0x60, 1563), listener, prop(q(0x60, cls), event),
                              prop(get(0), handler), void=True) for cls, event, handler in events)
        # Register before any activity-specific branch can skip the listeners.
        edit(method, lambda code, value=value: insert(code, 2, value))
    refresh = call(get(0), 8121, b'\x20', void=True) + call(get(0), 8200, void=True)
    # Payment and level callbacks must refresh regardless of other activities.
    for method in (6437, 6357): edit(method, lambda code: insert(code, 2, refresh))
    def opening(code):
        # Drop requests for removed pages, query the current word/hunt pages.
        requests = b''.join(call(q(0x60, 11028), 37707, number(0), number(slot), void=True)
                            for slot in (2, 3, 8, 11, 12, 13, 14, 17))
        return relocate(code, [(237, 345, requests)])
    edit(6408, opening)

    result = bytearray(abc)
    for start, end, value, _ in sorted(changes, reverse=True): result[start:end] = value
    result = bytes(result)
    _, _, after = inspect_abc(result, 'NavTopRightArea')
    if {m for _, _, _, m in changes} != METHODS: raise ValueError('Unexpected target methods')
    for method, (a, size, limits) in bodies.items():
        b, length, new_limits = after[method]
        if method not in METHODS and (limits != new_limits or abc[a:a + size] != result[b:b + length]):
            raise ValueError('Unrelated method changed')
    # Restoring targeted bodies must restore all ABC metadata and other bytes.
    restored = bytearray(result); shift = 0; undo = []
    for a, b, value, _ in sorted(changes):
        undo.append((a + shift, a + shift + len(value), abc[a:b])); shift += len(value) - (b - a)
    for a, b, value in reversed(undo): restored[a:b] = value
    if restored != abc: raise ValueError('Unrelated ABC resources changed')
    result = bytearray(result)
    for pos in positions: result[pos] = 0
    return bytes(result)


def patch_swf(source):
    data, (tag, payload, start, end) = abc_section(source)
    abc = patch_abc(data[start:end])
    if abc == data[start:end]: return source
    result = data[:tag + 2] + struct.pack('<I', start - payload + len(abc)) + data[payload:start] + abc + data[end:]
    result = result[:4] + struct.pack('<I', len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(abc):] != data[end:]:
        raise ValueError('Unrelated SWF resources changed')
    return result[:8] + zlib.compress(result[8:], 9)


def main():
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--check', action='store_true')
    args = parser.parse_args(); source = CLIENT.read_bytes(); updated = patch_swf(source)
    if patch_swf(updated) != updated: raise ValueError('Patch is not idempotent')
    if args.check:
        if source != updated: raise ValueError('GameFrame.swf needs patching')
    elif updated != source: CLIENT.write_bytes(updated)
    print('Verified main activity claim conditions and unchanged unrelated resources.')


if __name__ == '__main__': main()
