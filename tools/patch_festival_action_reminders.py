"""Keep festival hints limited to received, currently actionable reward states.

Patch selected AVM2 methods in the shipped client. Restore every edited record
to verify that unrelated ABC metadata and SWF artwork are byte-identical.
"""
from __future__ import annotations

import argparse
import struct
import subprocess
import zlib

from patch_activity_entries import q
from patch_activity_reminders import (CLIENT, ROOT, Code, GD, GAME, PAY, call,
                                      days_available, event_is, get, normalize,
                                      number, prop, put, relocate)
from patch_bag_client import ABCReader, encode_u30
from patch_competition_hongli_reminders import parameter_positions
from patch_competition_hongli_reminders import pool_layout
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_main_activity_reminders import JJ, JJ_CFG, QD, QD_CFG, QD_WIN, scan

BASELINE = 'f772556'
SPRING = prop(GD, 31242)
SPRING_CFG = prop(GAME, 32115, 11369)
DRAGON = prop(GD, 31294)
OPEN = prop(GD, 31245)
DYNAMIC = 43950
METHODS = {3324, 3327, 3329, 17347, 17374, 5576, 5577, 5578, 5579, 5581,
           5570, 5571, 6033, 6034, 6035, 6026, 6027, 22159, 22160, 6336, 6381,
           6397, 6497, 6440, 6365, 6333, 6377, 6433, 19561, 4141, 4142,
           4143, 4144, 4146}
NATIONAL = ROOT / 'web/v2/modules/guoqing/GuoQing.swf'
NATIONAL_METHODS = {6, 7, 8, 11, 13}


def baseline_abc(path):
    source = subprocess.check_output(['git', 'show', BASELINE + ':' + path.relative_to(ROOT).as_posix()], cwd=ROOT)
    raw, (_, _, a, b) = abc_section(source)
    return normalize(raw[a:b])[0]


def spring_gate(c, mgr=get(0), cfg=prop(get(0), 4410)):
    c.add(prop(mgr, 3346) + number(1)); c.branch(0x15, 'done')
    c.add(prop(mgr, 3346) + prop(cfg, 14696, 3237)); c.branch(0x17, 'done')


def spring_login():
    c = Code(); c.add(b'\xd0\x30')
    spring_gate(c)
    c.add(prop(get(0), 4399) + number(0)); c.branch(0x15, 'done')
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


def spring_recharge():
    c = Code(); c.add(b'\xd0\x30\x27' + put(5)); spring_gate(c)
    days_available(c, prop(SPRING_CFG, 14703), prop(get(0), 3371), prop(get(0), 3845), DYNAMIC)
    c.label('done'); c.add(get(5) + b'\x48'); return c.finish()


def jj_gate(c):
    for field in (3490, 3491, 3492):
        c.add(prop(JJ, field) + number(0)); c.branch(0x0e, 'effect')
    c.add(prop(JJ, 3492) + prop(JJ, 3491)); c.branch(0x17, 'effect')


def jj_mark(kind):
    c = Code(); c.add(b'\xd0\x30\x27' + put(5))
    index = {'login': 1, 'spin': 0, 'material': 4, 'recharge': 2}[kind]
    if kind in ('login', 'spin'):
        c.add(prop(JJ, 3490) + number(1)); c.branch(0x14, 'jingji')
        index1 = 0 if kind == 'login' else 1
        c.add(prop(get(0), 6755) + number(index1) + q(0x66, 44338) + put(2))
        c.branch(0x10, 'predicate')
        c.label('jingji')
    c.add(prop(get(0), 6755) + number(index) + q(0x66, 44338) + put(2))
    c.label('predicate'); jj_gate(c)
    if kind == 'login':
        c.add(prop(GD, 11237, 2339) + number(80)); c.branch(0x15, 'effect')
        c.add(prop(JJ, 3493) + number(0)); c.branch(0x19, 'ready')
    elif kind == 'spin':
        c.add(prop(JJ, 3497) + number(0)); c.branch(0x17, 'ready')
    elif kind == 'recharge':
        days_available(c, prop(JJ_CFG, 24388, 14277), prop(JJ, 3494), prop(JJ, 3495), DYNAMIC, day_field=None)
    else:
        c.add(b''.join(prop(JJ_CFG, n) for n in (24596, 24599, 24597, 24598)) + q(0x56, 4) + put(4) + number(0) + put(6))
        c.label('outer'); c.add(get(6) + prop(get(4), 3237)); c.branch(0x18, 'effect')
        c.add(prop(JJ, 3505) + get(6) + q(0x66, DYNAMIC) + put(8))
        c.add(get(8)); c.branch(0x12, 'next')
        c.add(get(4) + get(6) + q(0x66, DYNAMIC) + put(9) + number(0) + put(7))
        c.label('inner')
        for row in (8, 9):
            c.add(get(7) + prop(get(row), 3237)); c.branch(0x18, 'next')
        c.add(get(8) + get(7) + q(0x66, DYNAMIC) + number(0)); c.branch(0x1a, 'advance')
        c.add(prop(JJ, 3504) + get(6) + q(0x66, DYNAMIC) + prop(get(9) + get(7) + q(0x66, DYNAMIC), 3754))
        c.branch(0x18, 'ready')
        c.label('advance'); c.add(q(0xc2, 7)); c.branch(0x10, 'inner')
        c.label('next'); c.add(q(0xc2, 6)); c.branch(0x10, 'outer')
    c.branch(0x10, 'effect'); c.label('ready'); c.add(b'\x26' + put(5))
    c.label('effect'); c.add(get(2)); c.branch(0x12, 'return')
    c.add(get(2) + get(5) + q(0x61, 1832)); c.label('return'); c.add(b'\x47')
    return c.finish()


def qd_mark(kind):
    c = Code(); c.add(b'\xd0\x30\x27' + put(5))
    c.add(prop(QD_WIN, 3346) + number(1)); c.branch(0x15, 'effect')
    c.add(prop(QD_WIN, 3346) + prop(QD_WIN, 35309)); c.branch(0x17, 'effect')
    if kind == 'login':
        c.add(prop(GD, 11237, 2339) + number(80)); c.branch(0x15, 'effect')
        scan(c, prop(QD_CFG, 23966), prop(QD, 3844), 0, None, None, 'login', login=True)
    elif kind == 'gift':
        scan(c, prop(QD_CFG, 23967), prop(QD, 3837), 1, PAY, 18571, 'gift')
    else:
        days_available(c, prop(QD_CFG, 14703), prop(QD, 3371), prop(QD, 3845), DYNAMIC)
    c.branch(0x10, 'effect'); c.label('ready'); c.add(b'\x26' + put(5))
    c.label('effect'); icon = {'login': 7651, 'gift': 7652, 'recharge': 7653}[kind]
    c.add(prop(get(0), icon)); c.branch(0x12, 'return')
    c.add(prop(get(0), icon) + get(5) + q(0x61, 1832))
    c.label('return'); c.add(b'\x47'); return c.finish()


def national_entry():
    c = Code(); c.add(b'\xd0\x30\x27' + put(2))
    for op, day in ((0x15, 1), (0x17, 7)):
        c.add(prop(JJ, 3465) + number(day)); c.branch(op, 'effect')
    c.add(number(0) + put(3)); c.label('loop')
    c.add(get(3) + number(7)); c.branch(0x18, 'effect')
    c.add(prop(JJ, 3466) + get(3) + q(0x66, DYNAMIC) + number(1)); c.branch(0x1a, 'next')
    c.add(prop(JJ, 3466) + get(3) + number(7) + b'\xa0' + q(0x66, DYNAMIC) + number(0)); c.branch(0x19, 'ready')
    c.label('next'); c.add(q(0xc2, 3)); c.branch(0x10, 'loop')
    c.label('ready'); c.add(b'\x26' + put(2))
    c.label('effect'); c.add(call(get(0), 8153, prop(q(0x60, 13052), 38327), get(2), void=True) + b'\x47')
    return c.finish()


def dragon_entry():
    c = Code(); c.add(b'\xd0\x30\x27' + put(2))
    c.add(prop(GD, 11237, 4168) + number(3)); c.branch(0x15, 'effect')
    # Query only after payment or day change. Replies refresh without querying.
    event_is(c, 331, 35987, 'day'); event_is(c, 141, 31479, 'payment')
    c.branch(0x10, 'predicate'); c.label('day')
    # A new day has no wheel data yet; request the full initializing reply.
    c.add(call(q(0x60, 11028), 37567, number(1), void=True)); c.branch(0x10, 'predicate')
    c.label('payment')
    c.add(call(q(0x60, 11028), 37567, number(4), void=True))
    c.label('predicate')
    c.add(prop(DRAGON, 3381) + number(0)); c.branch(0x0e, 'effect')
    c.label('ready'); c.add(b'\x26' + put(2))
    c.label('effect'); c.add(call(get(0), 8153, prop(q(0x60, 13052), 38325), get(2), void=True) + b'\x47')
    return c.finish()


def patch_abc(source):
    abc, positions = normalize(source)
    names, _, bodies = inspect_abc(abc, 'NavTopRightArea')
    for idx, name in ((4415, 'checkNewYearCharge'), (5335, 'isCanBuyShop')):
        if names[idx] != name: raise ValueError('Unexpected client symbols')
    changes = []

    def edit(mid, transform, stack=None, locals_=None):
        METHODS.add(mid)
        a, size, limits = bodies[mid]; old = abc[a:a + size]
        value = transform(old); code, moved = value if isinstance(value, tuple) else (value, lambda p: p)
        new_limits = (stack or limits[0], locals_ or limits[1], *limits[2:])
        if code == old and new_limits == limits: return
        instructions(code)
        r = ABCReader(abc); r.pos = a + size; exceptions = []
        for _ in range(r.u30()):
            row = [r.u30() for _ in range(5)]
            exceptions.append([moved(p) for p in row[:3]] + row[3:])
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        if abc[a - len(header):a] != header: raise ValueError('Unexpected method header')
        record = b''.join(encode_u30(v) for v in (mid, *new_limits, len(code))) + code
        record += encode_u30(len(exceptions)) + b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((a - len(header), r.pos, record))

    def insert(code, at, value):
        if value in code: return code, lambda p: p
        return relocate(code, [(at, at, value)])

    def replace_expr(code, old, new):
        if old not in code:
            if new in code: return code, lambda p: p
            raise ValueError('Expected reminder expression missing')
        if code.count(old) != 1: raise ValueError('Ambiguous reminder expression')
        at = code.index(old); return relocate(code, [(at, at + len(old), new)])

    def listeners(added, removed, events):
        for mid, listener in ((added, 13671), (removed, 13672)):
            value = b''.join(call(q(0x60, 1563), listener, prop(q(0x60, cls), event), prop(get(0), handler), void=True)
                             for cls, event, handler in events)
            edit(mid, lambda code, value=value: insert(code, 2, value), stack=max(bodies[mid][2][0], 3))

    def event_parameter(mid):
        at, kind = parameter_positions(abc)[mid][0]
        if kind != 2: changes.append((at, at + len(encode_u30(kind)), encode_u30(2)))

    edit(3324, lambda code: insert(code, len(code) - 1, get(0) + number(-1) + q(0x68, 4399)))
    edit(3327, lambda _: spring_login(), stack=5, locals_=4)
    edit(3329, lambda _: spring_recharge(), stack=5, locals_=10)
    event_parameter(17345)
    def spring_page(code):
        tail = prop(get(0), 4015) + call(SPRING, 4415) + q(0x61, 1832) + b'\x47'
        if code.endswith(tail): return code
        return relocate(code, [(118, len(code), tail)])
    edit(17347, spring_page)
    edit(17374, lambda code: replace_expr(code, q(0x4f, 13671, 2), q(0x4f, 13672, 2)))
    for mid, kind in ((5576, 'spin'), (5577, 'login'), (5579, 'material'), (5581, 'recharge')):
        edit(mid, lambda _, kind=kind: jj_mark(kind), stack=5, locals_=10)
    # Both Christmas and competition weapon goods are purchase pages.
    c = Code(); c.add(b'\xd0\x30' + prop(JJ, 3490) + number(1)); c.branch(0x14, 'competition')
    c.add(prop(get(0), 6755) + number(4) + q(0x66, 44338)); c.branch(0x10, 'hide')
    c.label('competition'); c.add(prop(get(0), 6755) + number(5) + q(0x66, 44338))
    c.label('hide'); c.add(b'\x27' + q(0x61, 1832) + b'\x47')
    edit(5578, lambda _: c.finish(), stack=2)
    event_parameter(5577)
    listeners(5570, 5571, [(329, 40567, 6764), (331, 36047, 6764)])
    for mid, kind in ((6033, 'recharge'), (6034, 'gift'), (6035, 'login')):
        edit(mid, lambda _, kind=kind: qd_mark(kind), stack=5, locals_=10)
    event_parameter(6034)
    listeners(6026, 6027, [(141, 31479, 7671), (329, 40567, 7672)])
    listeners(22159, 22160, [(331, e, 23814) for e in (36010, 36011, 36012)] +
              [(141, 31479, 23814), (329, 40567, 23814), (329, 40723, 23814)])
    edit(6336, lambda _: national_entry(), stack=4, locals_=4)
    event_parameter(6336)
    edit(6381, lambda code: insert(code, len(code) - 1, call(get(0), 8123, b'\x20', void=True)))
    edit(6397, lambda _: dragon_entry(), stack=4, locals_=3)
    def create_button(code):
        value = call(q(0x60, 11028), 37567, number(1), void=True) + call(get(0), 8189, b'\x20', void=True)
        return insert(code, 398, value)
    edit(6497, create_button)
    old_request = call(q(0x60, 1787), 32657, number(8), number(1), void=True)
    new_request = call(q(0x60, 1787), 32657, number(12), number(0), void=True)
    edit(6440, lambda code: replace_expr(code, old_request, new_request))
    def spring_refresh(code):
        c = Code(); c.add(b'\xd0\x30'); event_is(c, 141, 31479, 'query')
        c.branch(0x10, 'refresh'); c.label('query')
        c.add(call(q(0x60, 1787), 32657, number(12), number(0), void=True))
        c.label('refresh'); c.add(code[2:]); return c.finish()
    refresh = spring_refresh(b'\xd0\x30' + call(get(0), 8153, prop(q(0x60, 13052), 38258), call(SPRING, 4411), void=True) + b'\x47')
    edit(6365, lambda _: refresh, stack=4)
    listeners(6333, 6377, [(827, 39371, 8157), (141, 31479, 8157)] +
              [(331, e, 8189) for e in (36020, 36021, 36022, 35987)] + [(141, 31479, 8189)] +
              [(331, e, 8243) for e in (35999, 36014)])
    for mid in (6433, 19561):
        edit(mid, lambda code: replace_expr(code, call(OPEN, 5335) + (b'\x76' if mid == 6433 else b''), b'\x27'))
    # Do not report ordinary open-server rewards until claim flags arrive.
    def received_gate(code):
        c = Code(); c.add(b'\xd0\x30' + prop(get(0), 5313, 3237) + number(0)); c.branch(0x17, 'received')
        c.add(b'\x27\x48'); c.label('received'); c.add(code[2:]); return c.finish()
    # Idempotently use the baseline body for this wrapper.
    baseline = baseline_abc(CLIENT); _, _, base_bodies = inspect_abc(baseline)
    a, size, _ = base_bodies[4141]
    edit(4141, lambda _: received_gate(baseline[a:a + size]))
    # Server reward periods include the final configured day.
    old_compare = prop(q(0x60, 1561), 31840) + get(3) + number(1) + q(0x66, 43957) + b'\xad'
    edit(4146, lambda code: replace_expr(code, old_compare, old_compare[:-1] + b'\xae'))
    def within_week(code, icon=False, nav=False):
        c = Code(); c.add(b'\xd0\x30')
        for op, day in ((0x15, 1), (0x17, 7)):
            c.add(prop(q(0x60, 1561), 31840) + number(day)); c.branch(op, 'closed')
        c.branch(0x10, 'open'); c.label('closed')
        if icon: c.add(prop(get(0), 20808) + b'\x27' + q(0x61, 1832) + b'\x47')
        elif nav: c.add(call(get(0), 8153, prop(q(0x60, 13052), 38239), b'\x27', void=True) + b'\x47')
        else: c.add(b'\x27\x48')
        c.label('open'); prefix = c.finish()
        # Preserve and relocate every existing branch after the new guard.
        return relocate(code, [(0, 2, prefix)])
    for mid in (4142, 4143, 4144):
        a, size, _ = base_bodies[mid]
        edit(mid, lambda _, code=baseline[a:a + size]: within_week(code))
    for mid in (6433, 19561):
        a, size, _ = base_bodies[mid]; code = baseline[a:a + size]
        code = replace_expr(code, call(OPEN, 5335) + (b'\x76' if mid == 6433 else b''), b'\x27')[0]
        # Replace the earlier edit with its guarded final form.
        a_now, n_now, lim = bodies[mid]
        header = b''.join(encode_u30(v) for v in (mid, *lim, n_now))
        changes[:] = [row for row in changes if row[0] != a_now - len(header)]
        edit(mid, lambda _, code=code, mid=mid: within_week(code, icon=mid == 19561, nav=mid == 6433))

    result = bytearray(abc)
    for a, b, value in sorted(changes, reverse=True): result[a:b] = value
    restored = bytearray(result); shift = 0; undo = []
    for a, b, value in sorted(changes):
        undo.append((a + shift, a + shift + len(value), abc[a:b])); shift += len(value) - (b - a)
    for a, b, value in reversed(undo): restored[a:b] = value
    if restored != abc: raise ValueError('Unrelated ABC bytes changed')
    for pos in positions: result[pos] = 0
    return bytes(result)


def patch_swf(source, module=False):
    if module: return source  # HongLi module is already fixed by earlier patches.
    data, (tag, payload, a, b) = abc_section(source); abc = patch_abc(data[a:b])
    if abc == data[a:b]: return source
    result = data[:tag + 2] + struct.pack('<I', a - payload + len(abc)) + data[payload:a] + abc + data[b:]
    result = result[:4] + struct.pack('<I', len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[a + len(abc):] != data[b:]: raise ValueError('Unrelated SWF resources changed')
    return result[:8] + zlib.compress(result[8:], 9)


def national_symbols(abc):
    """Reuse the main client's native PlaintMark without adding display traits."""
    added = ('PlaintMark', 'getChildByName', 'name', 'y', 'GUO_QING_DAY_INFO', 'festivalClaimMark', 'ui.tip')
    a, b, strings, c, d, count = pool_layout(abc)
    names, _, _ = inspect_abc(abc, 'GuoQin2Win')
    if names[-5:] == list(added[:5]): return abc, tuple(range(count - 5, count)), strings.index(added[5])
    reader = ABCReader(abc); reader.pos = b
    ns_count = reader.u30(); ns_start = reader.pos
    for _ in range(ns_count - 1): reader.byte(); reader.u30()
    ns_end = reader.pos
    values = b''.join(encode_u30(len(s.encode())) + s.encode() for s in added)
    records = b'\x07' + encode_u30(ns_count) + encode_u30(len(strings))
    # The module's ordinary public properties use the empty package namespace 2.
    records += b''.join(b'\x07' + encode_u30(2) + encode_u30(len(strings) + i) for i in range(1, 5))
    updated = (abc[:a] + encode_u30(len(strings) + len(added)) + abc[a + len(encode_u30(len(strings))):b] + values +
               encode_u30(ns_count + 1) + abc[ns_start:ns_end] + b'\x16' + encode_u30(len(strings) + 6) +
               abc[ns_end:c] + encode_u30(count + 5) + abc[c + len(encode_u30(count)):d] + records + abc[d:])
    return updated, tuple(range(count, count + 5)), len(strings) + 5


def patch_national_swf(source):
    data, (tag, payload, a, b) = abc_section(source); original, positions = normalize(data[a:b])
    abc, (mark, child, name, y, day_event), mark_string = national_symbols(original)
    _, _, bodies = inspect_abc(abc, 'GuoQin2Win'); edits = []
    mgr = prop(q(0x60, 82), 125)
    marker_name = q(0x2c, mark_string)
    def markers(create=False):
        c = Code(); c.add(number(0) + put(5)); c.label('loop')
        c.add(get(5) + prop(get(0), 47, 89)); c.branch(0x18, 'end')
        c.add(prop(get(0), 47) + get(5) + q(0x66, 77) + put(6))
        if create:
            c.add(q(0x5d, mark) + q(0x4a, mark, 0) + put(7))
            c.add(get(7) + marker_name + q(0x61, name))
            c.add(get(7) + prop(get(6), 101) + number(22) + b'\xa1' + q(0x61, 131))
            c.add(get(7) + number(0) + q(0x61, y))
            c.add(get(7) + b'\x27' + q(0x61, 79))
            c.add(call(get(6), 90, get(7), void=True))
        else:
            c.add(call(get(6), child, marker_name) + put(7) + b'\x27' + put(8))
            c.add(get(7)); c.branch(0x12, 'next')
            c.add(prop(mgr, 126) + number(1)); c.branch(0x15, 'show')
            c.add(prop(mgr, 126) + number(7)); c.branch(0x17, 'show')
            c.add(prop(mgr, 127) + get(5) + q(0x66, 77) + number(1)); c.branch(0x1a, 'show')
            c.add(prop(mgr, 127) + get(5) + number(7) + b'\xa0' + q(0x66, 77) + number(0)); c.branch(0x1a, 'show')
            c.add(b'\x26' + put(8)); c.label('show'); c.add(get(7) + get(8) + q(0x61, 79))
        c.label('next'); c.add(q(0xc2, 5)); c.branch(0x10, 'loop')
        c.label('end'); return c.finish()
    def edit(mid, transform, locals_=9):
        start, size, limits = bodies[mid]; code = abc[start:start + size]
        value, moved = transform(code)
        if value == code and locals_ == limits[1]: return
        r = ABCReader(abc); r.pos = start + size
        if r.u30(): raise ValueError('Unexpected national-day exceptions')
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        new_limits = (max(limits[0], 5), locals_, *limits[2:])
        record = b''.join(encode_u30(v) for v in (mid, *new_limits, len(value))) + value + b'\0'
        edits.append((start - len(header), r.pos, record))
    def insert(code, value):
        return (code, lambda p: p) if value in code else relocate(code, [(len(code) - 1, len(code) - 1, value)])
    edit(6, lambda code: insert(code, markers(True)))
    for mid, listener in ((7, 106), (8, 114)):
        value = call(q(0x60, 107), listener, prop(q(0x60, 5), day_event), prop(get(0), 67), void=True)
        edit(mid, lambda code, value=value: (code, lambda p: p) if value in code else relocate(code, [(2, 2, value)]), bodies[mid][2][1])
    pos, kind = parameter_positions(abc)[11][0]
    if kind != 3: edits.append((pos, pos + len(encode_u30(kind)), encode_u30(3)))
    def update(code):
        # Build from the original body so all display branches share one refresh.
        baseline = baseline_abc(NATIONAL); _, _, before = inspect_abc(baseline)
        start, size, _ = before[13]; code = baseline[start:start + size]
        prefix = Code(); prefix.add(markers())
        prefix.add(prop(get(0), 20) + b'\x27' + q(0x61, 79))
        prefix.add(prop(get(0), 49) + number(0)); prefix.branch(0x15, 'invalid')
        prefix.add(prop(get(0), 49) + number(6)); prefix.branch(0x16, 'valid')
        prefix.label('invalid'); prefix.add(prop(get(0), 18) + b'\x27' + q(0x61, 79) + b'\x47')
        prefix.label('valid')
        c = Code(); c.add(b'\x27' + put(2))
        c.add(prop(mgr, 126) + number(1)); c.branch(0x15, 'done')
        c.add(prop(mgr, 126) + number(7)); c.branch(0x17, 'done')
        c.add(prop(mgr, 127) + prop(get(0), 49) + q(0x66, 77) + number(1)); c.branch(0x1a, 'done')
        c.add(prop(mgr, 127) + prop(get(0), 49) + number(7) + b'\xa0' + q(0x66, 77) + number(0)); c.branch(0x1a, 'done')
        c.add(b'\x26' + put(2)); c.label('done')
        c.add(prop(get(0), 20) + get(2) + q(0x61, 79))
        # Keep the original claim button behavior for known statuses.
        c.add(prop(get(0), 18) + prop(mgr, 127) + prop(get(0), 49) + number(7) + b'\xa0' + q(0x66, 77) + number(1) + b'\xab\x96' + q(0x61, 79))
        updated, moved = relocate(code, [(2, 2, prefix.finish()), (94, 210, c.finish())])
        return updated, moved
    edit(13, update)
    result = bytearray(abc)
    for x, end, value in sorted(edits, reverse=True): result[x:end] = value
    restored = bytearray(result); shift = 0; undo = []
    for x, end, value in sorted(edits):
        undo.append((x + shift, x + shift + len(value), abc[x:end])); shift += len(value) - (end - x)
    for x, end, value in reversed(undo): restored[x:end] = value
    if restored != abc: raise ValueError('Unrelated national-day resources changed')
    for pos in positions: result[pos] = 0
    result = bytes(result)
    updated = data[:tag + 2] + struct.pack('<I', a - payload + len(result)) + data[payload:a] + result + data[b:]
    updated = updated[:4] + struct.pack('<I', len(updated)) + updated[8:]
    if updated[8:tag] != data[8:tag] or updated[a + len(result):] != data[b:]: raise ValueError('National-day artwork changed')
    return updated[:8] + zlib.compress(updated[8:], 9)


def main():
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--check', action='store_true'); args = parser.parse_args()
    for path, patch in ((CLIENT, patch_swf), (NATIONAL, patch_national_swf)):
        source = path.read_bytes(); updated = patch(source)
        if patch(updated) != updated: raise ValueError('Patch is not idempotent')
        if args.check:
            if source != updated: raise ValueError('Client needs patching')
        elif updated != source: path.write_bytes(updated)
    print('Verified festival action reminders and preserved unrelated resources.')


if __name__ == '__main__': main()
