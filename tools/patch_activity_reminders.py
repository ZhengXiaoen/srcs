"""Use actual claim conditions for HongLi, DaJiDaLi and anniversary reminders.

Only existing method bodies in the two shipped SWFs change. Reward tables,
constant pools, traits, graphics and every unrelated method remain unchanged.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import struct
import zlib

from patch_activity_entries import q
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, encode_s24, instructions
from patch_god_equip_state import inspect_abc

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / 'web/GameFrame.swf'
MODULE = ROOT / 'web/v2/modules/hongli/HongLi.swf'
BASELINE = 'f919d2a'


def mark_loop_targets(code):
    """Place AVM2 labels at back edges and relocate branches/exceptions.

    Flash rejects a backward branch unless its target has an OP_label or was
    already visited as a forward target (Verifier::checkTarget, error #1021).
    Label every back edge so generated loops do not depend on verifier order.
    """
    ops = instructions(code)
    targets = sorted({target for op in ops for _, target, _ in op.branches
                      if target <= op.start and code[target] != 0x09})
    if not targets: return code, lambda p: p

    def moved(p):
        # Branches and exception boundaries land before the inserted label.
        return p + sum(target < p for target in targets)

    def instruction_pos(p):
        return p + sum(target <= p for target in targets)

    result = bytearray()
    for op in ops:
        if op.start in targets: result.append(0x09)
        result.extend(code[op.start:op.end])
    for op in ops:
        for field, target, base in op.branches:
            new_base = instruction_pos(op.start) + base - op.start
            pos = instruction_pos(field)
            result[pos:pos + 3] = encode_s24(moved(target) - new_base)
    instructions(result)
    return bytes(result), moved


def relocate(code, edits):
    """Move existing branches, including a branch whose end abuts an insertion."""
    ops = instructions(code); edits = sorted(edits)
    boundaries = {o.start for o in ops} | {len(code)}
    if any(a not in boundaries or b not in boundaries for a, b, _ in edits):
        raise ValueError('Edit splits an instruction')
    if any(b > c for (_, b, _), (c, _, _) in zip(edits, edits[1:])):
        raise ValueError('Overlapping edits')

    def moved(p):
        shift = 0
        for a, b, value in edits:
            if a < p < b: raise ValueError('Branch enters replaced instructions')
            if b <= p: shift += len(value) - (b - a)
        return p + shift

    result = bytearray(code)
    for a, b, value in reversed(edits): result[a:b] = value
    for op in ops:
        if any(a <= op.start < b for a, b, _ in edits): continue
        for field, target, base in op.branches:
            # The base belongs to this instruction; an insertion immediately
            # after it does not move the base along with the next instruction.
            new_base = moved(op.start) + base - op.start
            result[moved(field):moved(field) + 3] = encode_s24(moved(target) - new_base)
    instructions(result)
    return bytes(result), moved


class Code:
    def __init__(self):
        self.code = bytearray()
        self.labels = {}
        self.branches = []

    def add(self, value):
        self.code.extend(value)
        return self

    def label(self, name):
        self.labels[name] = len(self.code)

    def branch(self, opcode, name):
        self.code.append(opcode)
        self.branches.append((len(self.code), name))
        self.code.extend(b'\0\0\0')

    def finish(self):
        for pos, name in self.branches:
            self.code[pos:pos + 3] = encode_s24(self.labels[name] - pos - 3)
        return mark_loop_targets(bytes(self.code))[0]


def get(n):
    return bytes((0xd0 + n,)) if n < 4 else q(0x62, n)


def put(n):
    return bytes((0xd4 + n,)) if n < 4 else q(0x63, n)


def number(n):
    return bytes((0x24, n & 255)) if -128 <= n <= 127 else q(0x25, n)


def prop(obj, *names):
    return obj + b''.join(q(0x66, n) for n in names)


def call(obj, name, *args, void=False):
    return obj + b''.join(args) + q(0x4f if void else 0x46, name, len(args))


def event_is(c, cls, event, label, type_name=6015):
    end = f'{label}_{cls}_{event}_end'
    c.add(get(1)); c.branch(0x12, end)
    c.add(prop(get(1), type_name) + prop(q(0x60, cls), event))
    c.branch(0x13, label)
    c.label(end)


def days_available(c, cfg, days, statuses, dynamic, prefix='days', day_field=18810):
    """Leave a boolean in local 5; bound by config and received state lengths."""
    c.add(cfg + put(4) + b'\x27' + put(5) + number(0) + put(6))
    c.label(prefix + '_outer')
    c.add(get(6) + prop(get(4), 3237 if dynamic == 43950 else 225))
    c.branch(0x18, prefix + '_done')  # ifge
    c.add(statuses + get(6) + q(0x66, dynamic) + put(8))
    c.add(get(8)); c.branch(0x12, prefix + '_next')
    reward_days = get(4) + get(6) + q(0x66, dynamic)
    if day_field is not None: reward_days += q(0x66, day_field)
    c.add(reward_days + put(9) + number(0) + put(7))
    c.label(prefix + '_inner')
    c.add(get(7) + prop(get(9), 3237 if dynamic == 43950 else 225))
    c.branch(0x18, prefix + '_next')
    c.add(get(7) + prop(get(8), 3237 if dynamic == 43950 else 225))
    c.branch(0x18, prefix + '_next')
    c.add(days + get(6) + q(0x66, dynamic) + get(7) + number(1) + b'\xa0')
    c.branch(0x0f, prefix + '_advance')  # ifn ge
    c.add(get(8) + get(7) + q(0x66, dynamic) + number(0))
    c.branch(0x1a, prefix + '_advance')  # ifstrictne: undefined is not zero
    c.add(b'\x26' + put(5)); c.branch(0x10, prefix + '_done')
    c.label(prefix + '_advance')
    c.add(q(0xc2, 7)); c.branch(0x10, prefix + '_inner')
    c.label(prefix + '_next')
    c.add(q(0xc2, 6)); c.branch(0x10, prefix + '_outer')
    c.label(prefix + '_done')


def spin_available(c, mgr, cfg, pay, money, fields, prefix='spin'):
    turn, need_pay, need_yb, dynamic, length = fields
    c.add(b'\x27' + put(5) + prop(mgr, turn) + put(6) + cfg + put(4))
    c.add(get(6) + number(0)); c.branch(0x15, prefix + '_done')
    for field in (need_pay, need_yb):
        c.add(get(6) + prop(get(4), field, length)); c.branch(0x18, prefix + '_done')
    c.add(pay + prop(get(4), need_pay) + get(6) + q(0x66, dynamic))
    c.branch(0x0f, prefix + '_done')
    c.add(money + prop(get(4), need_yb) + get(6) + q(0x66, dynamic))
    c.branch(0x0f, prefix + '_done')
    c.add(b'\x26' + put(5))
    c.label(prefix + '_done')


GD = q(0x60, 1507)
GAME = q(0x60, 1740)
HONG = prop(GD, 31270)
DJ = prop(GD, 31285)
YEAR = prop(GD, 31288)
PAY = prop(GD, 31170, 4511)
HONG_CFG = call(prop(GAME, 32252), 11394)
MONEY = call(prop(GD, 11237), 4266, prop(q(0x60, 10954), 36115))


def hong_entry(original):
    c = Code(); c.add(b'\xd0\x30')
    c.add(prop(HONG, 3471) + number(1)); c.branch(0x15, 'closed')
    c.add(prop(HONG, 3471) + number(3)); c.branch(0x17, 'closed')
    c.add(call(q(0x60, 8096), 38383, prop(q(0x60, 13052), 38328)) + put(2))
    c.add(get(2)); c.branch(0x12, 'request')
    c.add(get(1)); c.branch(0x12, 'request')
    event_is(c, 331, 36039, 'request')
    event_is(c, 141, 31502, 'request')
    c.branch(0x10, 'refresh')
    c.label('request')
    for i in (1, 2, 3, 4):
        c.add(call(q(0x60, 11028), 37557, number(0), number(i), void=True))
    c.add(get(2)); c.branch(0x11, 'refresh')
    c.add(original[69:152])  # Existing title, icon, navigation and callback.
    c.add(call(q(0x60, 8096), 38383, prop(q(0x60, 13052), 38328)) + put(2))
    c.label('refresh')
    c.add(get(2)); c.branch(0x12, 'return')
    c.add(prop(HONG, 3474) + number(0)); c.branch(0x19, 'ready')
    c.add(prop(HONG, 3475) + number(0)); c.branch(0x1a, 'acc')
    c.add(PAY + number(0)); c.branch(0x17, 'ready')
    c.label('acc')
    days_available(c, prop(HONG_CFG, 14703), prop(HONG, 3472), prop(HONG, 3473), 43950)
    c.add(get(5)); c.branch(0x11, 'ready')
    spin_available(c, HONG, prop(HONG_CFG, 24578), PAY, MONEY,
                   (3476, 14710, 24092, 43950, 3237))
    c.branch(0x10, 'effect')
    c.label('ready'); c.add(b'\x26' + put(5))
    c.label('effect'); c.add(call(get(2), 12784, get(5), void=True))
    c.branch(0x10, 'return')
    c.label('closed')
    c.add(call(q(0x60, 8096), 38381, prop(q(0x60, 13052), 38328),
               prop(q(0x60, 13052), 38328), void=True))
    c.label('return'); c.add(b'\x47')
    return c.finish()


def dj_entry():
    c = Code(); c.add(b'\xd0\x30')
    c.add(prop(DJ, 3346) + number(1)); c.branch(0x15, 'closed')
    c.add(prop(DJ, 3346) + number(3)); c.branch(0x17, 'closed')
    c.add(call(q(0x60, 8096), 38383, prop(q(0x60, 13052), 38315)) + put(2))
    c.add(get(2)); c.branch(0x12, 'create')
    c.add(get(1)); c.branch(0x12, 'request')
    event_is(c, 359, 42519, 'request')
    event_is(c, 141, 31502, 'request')
    c.branch(0x10, 'refresh')
    c.label('create')
    c.add(call(get(0), 8311, prop(GD, 11237, 2339), prop(q(0x60, 13052), 38315), void=True))
    # checkAddBtn refreshes the newly created button after addBtn2 returns.
    c.branch(0x10, 'return')
    c.label('request')
    for slot in (0, 11, 2, 3, 5, 6, 7, 8, 9, 10):
        c.add(call(prop(GAME, 32309), 12063, number(slot), prop(DJ, 3346)))
        c.branch(0x12, f'skip{slot}')
        c.add(call(q(0x60, 11028), 37594, number(0), number(slot + 1), void=True))
        c.label(f'skip{slot}')
    c.label('refresh')
    c.add(get(2)); c.branch(0x12, 'return')
    c.add(b'\x27' + put(3))
    for slot in (1, 2, 3, 4, 6, 7, 8, 9, 10, 11):
        c.add(call(DJ, 3373, number(slot))); c.branch(0x11, 'ready')
    c.branch(0x10, 'effect')
    c.label('ready'); c.add(b'\x26' + put(3))
    c.label('effect'); c.add(call(get(2), 12784, get(3), void=True)); c.branch(0x10, 'return')
    c.label('closed')
    c.add(call(q(0x60, 8096), 38381, prop(q(0x60, 13052), 38315),
               prop(q(0x60, 13052), 38315), void=True))
    c.label('return'); c.add(b'\x47')
    return c.finish()


def dj_awards(code):
    # Handle the new recharge protocol before the original per-page switch.
    c = Code(); c.add(get(1) + number(2)); c.branch(0x1a, 'old')
    c.add(call(prop(GAME, 32309), 12063, number(11), prop(get(0), 3346)))
    c.branch(0x12, 'false')
    days_available(c, prop(call(prop(GAME, 32309), 3909, number(11)), 14277),
                   prop(get(0), 3371), prop(get(0), 3372), 43950, day_field=None)
    c.add(get(5) + b'\x48')
    c.label('false'); c.add(b'\x27\x48')
    c.label('old')
    # Cross-server rewards are three separate config fields, not an Info array.
    c.add(get(1) + number(8)); c.branch(0x1a, 'other')
    c.add(call(prop(GAME, 32309), 12063, number(7), prop(get(0), 3346)))
    c.branch(0x12, 'false')
    c.add(call(prop(GAME, 32309), 3909, number(7)) + put(4))
    c.add(prop(get(4), 24374) + put(7))
    c.add(prop(get(0), 3364) + number(0) + q(0x66, 43950) + number(0))
    c.branch(0x1a, 'cross_consume')
    c.add(prop(get(0), 3361) + prop(get(7), 14281)); c.branch(0x0f, 'cross_consume')
    c.add(b'\x26\x48')
    c.label('cross_consume')
    c.add(prop(get(4), 24375) + put(7) + number(0) + put(6))
    c.label('cross_loop')
    c.add(get(6) + prop(get(7), 3237)); c.branch(0x18, 'cross_escort')
    c.add(prop(get(0), 3364) + get(6) + number(1) + b'\xa0' + q(0x66, 43950) + number(0))
    c.branch(0x1a, 'cross_next')
    c.add(prop(get(0), 3362) + prop(get(7) + get(6) + q(0x66, 43950), 14282))
    c.branch(0x0f, 'cross_next'); c.add(b'\x26\x48')
    c.label('cross_next'); c.add(q(0xc2, 6)); c.branch(0x10, 'cross_loop')
    c.label('cross_escort')
    c.add(prop(get(0), 3364) + prop(get(7), 3237) + number(1) + b'\xa0'
          + q(0x66, 43950) + number(0)); c.branch(0x1a, 'false')
    c.add(prop(get(0), 3363) + prop(get(4), 24376, 14281)); c.branch(0x0f, 'false')
    c.add(b'\x26\x48')
    c.label('other')
    # Removed purchase page cannot contribute a red dot.
    c.add(get(1) + number(5)); c.branch(0x19, 'false')
    c.add(call(prop(GAME, 32309), 12063, get(1) + b'\x93', prop(get(0), 3346)))
    c.branch(0x12, 'false')
    prefix = c.finish()
    # Undefined state must never convert to int zero and appear claimable.
    edits = []
    for op in instructions(code):
        if op.opcode == 0x73 and 118 <= op.start <= 1192 and code[op.end:op.end + 2] == put(5):
            edits.append((op.start, op.end, b''))
    # Restrict login rewards to the current activity day as the server does.
    guard = Code(); guard.add(prop(get(0), 3346) + get(4) + number(1) + b'\xa0')
    guard.branch(0x0f, 'unready'); guard.add(get(2)); guard.branch(0x10, 'done')
    guard.label('unready'); guard.add(b'\x27'); guard.label('done'); guard.add(put(2))
    edits.append((164, 164, guard.finish()))
    changed, moved = relocate(code, edits)
    return changed[:2] + prefix + changed[2:], lambda p: moved(p) + (len(prefix) if p >= 2 else 0)


def year_awards(code):
    c = Code(); c.add(prop(get(0), 3394) + number(1)); c.branch(0x15, 'false')
    c.add(prop(get(0), 3394) + prop(get(0), 4811)); c.branch(0x17, 'false')
    c.branch(0x10, 'done'); c.label('false'); c.add(b'\x27\x48'); c.label('done')
    prefix = c.finish()
    login = Code(); login.add(b'\x09')
    login.add(call(prop(get(0), 3348), 43280, number(0)) + put(2))
    login.add(get(2) + number(0)); login.branch(0x15, 'false')
    login.add(get(2) + prop(get(0), 3394)); login.branch(0x18, 'false')
    login.add(get(2) + prop(get(0), 3547)); login.branch(0x18, 'false')
    login.add(prop(GD, 11237, 2339) + number(80)); login.branch(0x15, 'false')
    login.add(b'\x26\x48'); login.label('false'); login.add(b'\x27\x48')
    total = Code(); total.add(b'\x09\x24\x00' + put(2))
    total.add(prop(GAME, 32212, 1513, 24777) + put(3))
    total.label('loop')
    total.add(get(2) + prop(get(3), 3237)); total.branch(0x18, 'false')
    total.add(get(2) + prop(get(0), 5251, 3237)); total.branch(0x18, 'false')
    total.add(prop(get(0), 5251) + get(2) + q(0x66, 43950) + number(0))
    total.branch(0x1a, 'next')
    total.add(PAY + prop(get(3) + get(2) + q(0x66, 43950), 14710))
    total.branch(0x0f, 'next'); total.add(b'\x26\x48')
    total.label('next'); total.add(q(0xc2, 2)); total.branch(0x10, 'loop')
    total.label('false'); total.add(b'\x27\x48')
    edits = [(2, 2, prefix), (47, 71, login.finish()), (99, 133, total.finish()),
             (95, 98, number(1000) + b'\xb0')]
    # For collect-word rewards, honor the configured quantity.
    edits.append((366, 372, prop(get(6), 3754) + b'\x0f\x02\x00\x00'))
    return relocate(code, edits)


def year_entry():
    c = Code(); c.add(b'\xd0\x30')
    c.add(call(q(0x60, 8094), 42485, prop(q(0x60, 13052), 38323)) + put(2))
    c.add(prop(YEAR, 3394) + number(1)); c.branch(0x15, 'closed')
    c.add(prop(YEAR, 3394) + prop(YEAR, 4811)); c.branch(0x17, 'closed')
    c.add(get(2)); c.branch(0x12, 'create')
    c.add(get(1)); c.branch(0x12, 'request')
    event_is(c, 358, 42512, 'request')
    c.branch(0x10, 'refresh')
    c.label('create')
    c.add(call(get(0), 8311, prop(GD, 11237, 2339), prop(q(0x60, 13052), 38323), void=True))
    c.branch(0x10, 'return')
    c.label('request')
    for i in (2, 3, 4, 11, 12):
        c.add(call(q(0x60, 11028), 37584, number(0), number(i), void=True))
    c.label('refresh'); c.add(call(get(0), 8171, b'\x20', void=True)); c.branch(0x10, 'return')
    c.label('closed'); c.add(get(2)); c.branch(0x12, 'return')
    c.add(call(q(0x60, 8094), 38381, prop(q(0x60, 13052), 38323), void=True))
    c.label('return'); c.add(b'\x47')
    return c.finish()


def normalize(source):
    result = bytearray(source); r = ABCReader(source); r.skip(4); positions = []
    for kind in range(3):
        pos = r.pos; count = r.u30()
        if count == 0:
            positions.append(pos); result[pos] = 1
        if kind < 2:
            for _ in range(max(0, count - 1)): r.u30()
        else: r.skip(8 * max(0, count - 1))
    return bytes(result), positions


def patch_abc(source, module=False):
    normalized, positions = normalize(source)
    names, traits, bodies = inspect_abc(normalized, 'HongLiActiveWin' if module else 'NavTopRightArea')
    changes = []

    def edit(method, transform, stack=None, locals_=None):
        start, size, limits = bodies[method]; code = normalized[start:start + size]
        result = transform(code)
        updated, moved = result if isinstance(result, tuple) else (result, lambda p: p)
        new_limits = (stack or limits[0], locals_ or limits[1], *limits[2:])
        if updated == code and new_limits == limits: return
        r = ABCReader(normalized); r.pos = start + size; exceptions = []
        for _ in range(r.u30()):
            a, b, target, kind, var = (r.u30() for _ in range(5))
            exceptions.append((moved(a), moved(b), moved(target), kind, var))
        header = b''.join(encode_u30(v) for v in (method, *limits, size))
        if normalized[start - len(header):start] != header: raise ValueError('Unexpected method header')
        replacement = b''.join(encode_u30(v) for v in (method, *new_limits, len(updated))) + updated
        replacement += encode_u30(len(exceptions)) + b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start - len(header), r.pos, replacement, method))

    def insert(code, at, value):
        if value in code: return code
        return relocate(code, [(at, at, value)])

    if module:
        mgr = prop(q(0x60, 233), 256)
        cfg = call(prop(q(0x60, 251), 252), 253)
        pay = prop(q(0x60, 233), 249, 250)
        money = call(prop(q(0x60, 233), 318), 321, prop(q(0x60, 319), 320))
        # Generated total-recharge body also serves as the idempotence marker.
        a, b, _ = bodies[10]
        if normalized[a:a + b].startswith(b'\xd0\x30' + prop(cfg, 259)):
            # Upgrade the previously shipped body without reapplying edits.
            return patch_loop_labels(source, (10,))
        refresh = b''.join(call(get(0), m, b'\x20', void=True) for m in (50, 49, 47, 46))
        for mid, listener in ((7, 241), (8, 243)):
            def listeners(code, listener=listener):
                edits = [(o.start, o.end, q(0x4f, listener, 2)) for o in instructions(code)
                         if o.opcode == 0x4f and o.operands in ((241, 2), (243, 2)) and o.start < 95]
                if listener == 241: edits.append((len(code) - 1, len(code) - 1, refresh))
                return relocate(code, edits)
            edit(mid, listeners)
        def total(_):
            c = Code(); c.add(b'\xd0\x30')
            days_available(c, prop(cfg, 259), prop(mgr, 261), prop(mgr, 260), 220, day_field=341)
            c.add(get(0) + q(0x66, 39) + get(5) + q(0x61, 232) + b'\x47')
            return c.finish()
        edit(10, total, stack=4, locals_=14)
        def spin(_):
            c = Code(); c.add(b'\xd0\x30')
            spin_available(c, mgr, prop(cfg, 254), pay, money, (257, 255, 312, 220, 225))
            c.add(get(0) + q(0x66, 42) + get(5) + q(0x61, 232) + b'\x47')
            return c.finish()
        edit(9, spin, stack=4, locals_=7)
        edit(11, lambda code: insert(code, len(code) - 1, call(get(0), 46, b'\x20', void=True)))
        edit(41, lambda code: insert(code, len(code) - 1,
             call(q(0x60, 239), 243, prop(q(0x60, 4), 240), prop(get(0), 126), void=True)))
    else:
        expected = {24578: 'LuckeyZhuanPan', 24777: 'EveryDayTotalPay', 18810: 'days', 3754: 'count'}
        for i, name in expected.items():
            if names[i] != name: raise ValueError(f'Unexpected QName {i}: {names[i]}')
        # A recognizable generated method makes the patch idempotent.
        generated = dj_entry()
        a, b, _ = bodies[6382]
        if normalized[a:a + b] == generated:
            return patch_loop_labels(source, (2648, 4080, 6335))
        edit(6335, hong_entry, stack=13, locals_=10)
        edit(6382, lambda _: generated, stack=3, locals_=4)
        edit(2648, dj_awards, stack=4, locals_=18)
        edit(4080, year_awards, stack=5, locals_=15)
        edit(6380, lambda _: year_entry(), stack=3, locals_=3)
        # Button creation must immediately apply the reward predicate.
        def add_buttons(code):
            refresh = call(get(0), 8172, b'\x20', void=True)
            djrefresh = call(get(0), 8174, b'\x20', void=True)
            return relocate(code, [(475, 475, refresh), (1100, 1101, b'\x27'), (1105, 1105, djrefresh)])
        edit(6497, add_buttons)
        # State replies refresh dots; only opening/day/payment events request data.
        events = [(331, e, 8122) for e in (36032, 36033, 36034, 36035)]
        events += [(359, 42513, 8174), (329, 38597, 8171), (206, 40567, 8171)]
        for mid, listener in ((6333, 13671), (6377, 13672)):
            listeners = b''.join(call(q(0x60, 1563), listener, prop(q(0x60, cls), event),
                                     prop(get(0), handler), void=True) for cls, event, handler in events)
            edit(mid, lambda code, value=listeners: insert(code, len(code) - 1, value), stack=6 if mid == 6333 else 3)
        payment_refresh = b''.join(call(get(0), handler, b'\x20', void=True) for handler in (8171,))
        # These handlers retain their CliffordEvent/DaJiDaLiEvent parameter
        # types. A null call refreshes state without coercing an OtherEvent.
        payment_refresh += b''.join(call(get(0), handler, b'\x20', void=True) for handler in (8122, 8174))
        edit(6437, lambda code: insert(code, len(code) - 1, payment_refresh))
        edit(6353, lambda code: insert(code, len(code) - 1, call(get(0), 8122, b'\x20', void=True)))
        # Unknown scalar statuses must not look like unclaimed server replies.
        edit(2720, lambda code: insert(code, 132, b''.join(get(0) + number(-1) + q(0x68, n) for n in (3474, 3475, 3476))))
        edit(4078, lambda code: insert(code, 38, get(0) + number(-1) + q(0x68, 3845)))
        # Keep the claim button's threshold synchronized with the server's 1000.
        edit(28528, lambda code: relocate(code, [(28, 34, number(1000) + b'\x0f\x16\x00\x00')]))

    result = bytearray(normalized)
    for start, end, value, _ in sorted(changes, reverse=True): result[start:end] = value
    result = bytes(result)
    _, _, after = inspect_abc(result, 'HongLiActiveWin' if module else 'NavTopRightArea')
    changed = {m for _, _, _, m in changes}
    for mid, (a, size, limits) in bodies.items():
        b, new_size, new_limits = after[mid]
        if mid not in changed and (limits != new_limits or normalized[a:a + size] != result[b:b + new_size]):
            raise ValueError('Unrelated method changed')
    # Undo every intended edit and require byte identity, including exception data.
    restored = bytearray(result); shift = 0; undo = []
    for a, b, value, _ in sorted(changes):
        undo.append((a + shift, a + shift + len(value), normalized[a:b])); shift += len(value) - (b - a)
    for a, b, value in reversed(undo): restored[a:b] = value
    if restored != normalized: raise ValueError('Unrelated ABC resource changed')
    result = bytearray(result)
    for pos in positions: result[pos] = 0
    return bytes(result)


def patch_loop_labels(source, methods):
    """Repair installed activity bodies without changing any other ABC bytes."""
    abc, positions = normalize(source)
    _, _, bodies = inspect_abc(abc, 'NavTopRightArea')
    edits = []
    for method in methods:
        start, size, limits = bodies[method]
        code, moved = mark_loop_targets(abc[start:start + size])
        if code == abc[start:start + size]: continue
        r = ABCReader(abc); r.pos = start + size; exceptions = []
        for _ in range(r.u30()):
            a, b, target, kind, var = (r.u30() for _ in range(5))
            exceptions.append((moved(a), moved(b), moved(target), kind, var))
        header = b''.join(encode_u30(v) for v in (method, *limits, size))
        if abc[start - len(header):start] != header:
            raise ValueError('Unexpected method header')
        value = b''.join(encode_u30(v) for v in (method, *limits, len(code))) + code
        value += encode_u30(len(exceptions)) + b''.join(encode_u30(v) for row in exceptions for v in row)
        edits.append((start - len(header), r.pos, value))
    if not edits: return source
    result = bytearray(abc)
    for start, end, value in sorted(edits, reverse=True): result[start:end] = value
    for pos in positions: result[pos] = 0
    return bytes(result)


def patch_swf(source, module=False):
    data, (tag, payload, start, end) = abc_section(source)
    abc = patch_abc(data[start:end], module)
    if abc == data[start:end]: return source
    result = data[:tag + 2] + struct.pack('<I', start - payload + len(abc)) + data[payload:start] + abc + data[end:]
    result = result[:4] + struct.pack('<I', len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(abc):] != data[end:]:
        raise ValueError('Unrelated SWF resources changed')
    return result[:8] + zlib.compress(result[8:], 9)


def main():
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    for path, module in ((CLIENT, False), (MODULE, True)):
        source = path.read_bytes(); updated = patch_swf(source, module)
        if patch_swf(updated, module) != updated: raise ValueError('Patch is not idempotent')
        if args.check:
            if source != updated: raise ValueError(f'{path.name} needs patching')
        elif updated != source: path.write_bytes(updated)
    print('Verified activity claim conditions and unchanged unrelated resources.')


if __name__ == '__main__': main()
