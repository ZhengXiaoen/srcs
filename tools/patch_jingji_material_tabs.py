"""Add native claim marks to all four Jingji material rebate selectors."""
from __future__ import annotations

import argparse
import struct
import zlib

from patch_activity_entries import q
from patch_activity_reminders import CLIENT, Code, GAME, call, get, normalize, number, prop, put, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_competition_hongli_reminders import pool_layout
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_jingji_material_reminders import JJ

BASELINE = '6c84020'
METHODS = {15825, 15826, 15829}
MARKS = 4015  # Existing public QName "mark"; one new Array slot on this page.
DYNAMIC = 46817
SLOT = b''.join(encode_u30(v) for v in (MARKS, 0, 0, 22, 0))


def page_traits(abc):
    """Locate the target instance trait list, leaving all other metadata intact."""
    r = ABCReader(abc); r.pos = pool_layout(abc)[4]
    for _ in range(r.u30()):
        count = r.u30(); r.u30()
        for _ in range(count): r.u30()
        r.u30(); flags = r.byte()
        if flags & 8:
            for _ in range(r.u30()): r.u30(); r.byte()
        if flags & 128:
            for _ in range(count): r.u30()
    for _ in range(r.u30()):
        r.u30()
        for _ in range(r.u30()): r.u30(); r.u30()
    for _ in range(r.u30()):
        name = r.u30(); r.u30(); flags = r.byte()
        if flags & 8: r.u30()
        for _ in range(r.u30()): r.u30()
        r.u30(); start = r.pos; count = r.u30(); fields = []
        for _ in range(count):
            field = r.u30(); attrs = r.byte(); kind = attrs & 15
            r.u30(); r.u30()
            if kind in (0, 6):
                if r.u30(): r.byte()
            elif kind not in (1, 2, 3, 4, 5): raise ValueError('Unexpected page trait')
            if attrs & 64:
                for _ in range(r.u30()): r.u30()
            fields.append(field)
        if name == 16364: return start, r.pos, count, fields
    raise ValueError('Missing JingjiFanLiPage')


def create_marks():
    c = Code(); c.add(get(0) + q(0x56, 0) + q(0x68, MARKS))
    for index in range(4):
        c.add(call(prop(get(0), 16367), 6102, number(index)) + put(2))
        c.add(q(0x5d, 388) + q(0x4a, 388, 0) + put(3))
        c.add(get(3) + b'\x27' + q(0x61, 1832))
        c.add(get(3) + prop(get(2), 1578) + number(18) + b'\xa1' + q(0x61, 1656))
        c.add(get(3) + number(-6) + q(0x61, 1657))
        c.add(call(get(2), 1868, get(3), void=True))
        c.add(prop(get(0), MARKS) + number(index) + get(3) + q(0x61, DYNAMIC))
    return c.finish()


def refresh_marks():
    c = Code(); c.add(prop(get(0), MARKS)); c.branch(0x12, 'done')
    cfg = call(prop(GAME, 32246), 11394)
    c.add(b''.join(prop(cfg, field) for field in (24596, 24599, 24597, 24598)) + q(0x56, 4) + put(4))
    c.add(number(0) + put(6))
    c.label('outer')
    c.add(get(6) + number(4)); c.branch(0x18, 'done')
    c.add(prop(get(0), MARKS) + get(6) + q(0x66, DYNAMIC) + put(2))
    c.add(b'\x27' + put(5))
    for field in (3491, 3492):
        c.add(prop(JJ, field) + number(0)); c.branch(0x0e, 'effect')
    c.add(prop(JJ, 3492) + prop(JJ, 3491)); c.branch(0x17, 'effect')
    c.add(prop(JJ, 3490) + number(2)); c.branch(0x1a, 'effect')
    for field in (3504, 3505):
        c.add(prop(JJ, field)); c.branch(0x12, 'effect')
    c.add(prop(JJ, 3505) + get(6) + q(0x66, DYNAMIC) + put(8))
    c.add(get(8)); c.branch(0x12, 'effect')
    c.add(get(4) + get(6) + q(0x66, DYNAMIC) + put(9))
    c.add(get(9)); c.branch(0x12, 'effect')
    c.add(prop(JJ, 3504) + get(6) + q(0x66, DYNAMIC) + put(3))
    c.add(number(0) + put(7))
    c.label('inner')
    for row in (8, 9):
        c.add(get(7) + prop(get(row), 3237)); c.branch(0x18, 'effect')
    c.add(get(8) + get(7) + q(0x66, DYNAMIC) + number(0)); c.branch(0x1a, 'advance')
    c.add(get(3) + prop(get(9) + get(7) + q(0x66, DYNAMIC), 3754)); c.branch(0x0f, 'advance')
    c.add(b'\x26' + put(5)); c.branch(0x10, 'effect')
    c.label('advance'); c.add(q(0xc2, 7)); c.branch(0x10, 'inner')
    c.label('effect'); c.add(get(2) + get(5) + q(0x61, 1832))
    c.add(q(0xc2, 6)); c.branch(0x10, 'outer')
    c.label('done'); c.add(b'\x09')
    return c.finish()


def patch_swf(source):
    data, (tag, payload, a, b) = abc_section(source)
    abc, positions = normalize(data[a:b]); names, traits, bodies = inspect_abc(abc, 'JingjiFanLiPage')
    if traits != {'initView': (15825, 16372), 'initEvent': (15826, 3112), 'removeEvent': (15827, 3113),
                  'setSelect': (15828, 16373), 'infoBack': (15829, 16374)}:
        raise ValueError('Unexpected material page methods')
    lo, hi, count, fields = page_traits(abc)
    refresh = refresh_marks(); creation = create_marks()
    if MARKS in fields:
        start, size, _ = bodies[15829]
        if abc[start + 2:start + 2 + len(refresh)] != refresh: raise ValueError('Partial material-tab patch')
        return source
    changes = [(lo, hi, encode_u30(count + 1) + abc[lo + len(encode_u30(count)):hi] + SLOT)]
    for mid in sorted(METHODS):
        start, size, limits = bodies[mid]; code = abc[start:start + size]
        if size != {15825: 272, 15826: 120, 15829: 94}[mid]: raise ValueError('Unexpected original material page')
        if mid == 15825: updated, moved = relocate(code, [(size - 1, size - 1, creation)])
        elif mid == 15826:
            query = Code()
            # setSelect queries the current project; refresh the other three too.
            for index, msg in enumerate((6, 7, 9, 8)):
                query.add(prop(get(0), 16369) + number(index)); query.branch(0x13, f'next{index}')
                query.add(call(q(0x60, 11028), 37543, number(msg), number(1), void=True))
                query.label(f'next{index}')
            query.add(b'\x09'); query = query.finish()
            updated, moved = relocate(code, [(113, 113, refresh),
                                            (size - 1, size - 1, query)])
        else: updated, moved = relocate(code, [(2, 2, refresh)])
        reader = ABCReader(abc); reader.pos = start + size
        if reader.u30() != 0: raise ValueError('Unexpected material page exceptions')
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected page method header')
        new_limits = (max(limits[0], 4), max(limits[1], 4 if mid == 15825 else 10), *limits[2:])
        value = b''.join(encode_u30(v) for v in (mid, *new_limits, len(updated))) + updated + b'\0'
        instructions(updated); changes.append((start - len(header), reader.pos, value))
    ordered = sorted(changes); result = bytearray(abc)
    for start, end, value in reversed(ordered): result[start:end] = value
    _, _, after = inspect_abc(result)
    for mid, (start, size, limits) in bodies.items():
        new_start, new_size, new_limits = after[mid]
        if mid not in METHODS and (limits != new_limits or abc[start:start + size] != result[new_start:new_start + new_size]):
            raise ValueError('Unrelated client method changed')
    restored = bytearray(result); shift = 0; undo = []
    for start, end, value in ordered:
        undo.append((start + shift, start + shift + len(value), abc[start:end])); shift += len(value) - (end - start)
    for start, end, value in reversed(undo): restored[start:end] = value
    if restored != abc: raise ValueError('Unrelated ABC metadata changed')
    for pos in positions: result[pos] = 0
    swf = data[:tag + 2] + struct.pack('<I', a - payload + len(result)) + data[payload:a] + result + data[b:]
    swf = swf[:4] + struct.pack('<I', len(swf)) + swf[8:]
    if swf[8:tag] != data[8:tag] or swf[a + len(result):] != data[b:]: raise ValueError('Unrelated SWF resources changed')
    return swf[:8] + zlib.compress(swf[8:], 9)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--check', action='store_true')
    args = parser.parse_args(); source = CLIENT.read_bytes(); updated = patch_swf(source)
    if patch_swf(updated) != updated: raise ValueError('Non-idempotent material-tab patch')
    if args.check:
        if source != updated: raise ValueError('Material-tab marks missing')
    elif source != updated: CLIENT.write_bytes(updated)
    print('Four material selectors now use native claim marks and refresh all received states.')
