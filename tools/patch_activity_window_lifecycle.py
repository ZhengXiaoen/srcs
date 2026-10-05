"""Repair DaJiDaLi window reuse and the restored LongTeng module lifecycle.

Only the listed method bodies change; pools, traits and artwork stay intact.
The missing module comes from SRCS.zip's original release.
"""
from __future__ import annotations

import argparse
import struct
import zlib
from pathlib import Path

from patch_activity_entries import q
from patch_activity_reminders import CLIENT, ROOT, Code, call, get, normalize, number, prop, put
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc

BASELINE = '795251c'
MODULE = ROOT / 'web/v2/modules/longtengturns/longtengturns.swf'
ORIGINAL_MODULE = Path(__file__).resolve().parent / 'fixtures/longtengturns-original.swf'
MAIN_METHODS = {22107, 22108, 22110, 22111, 22112}
MODULE_METHODS = {7, 8, 16, 17}


def listen(add=True):
    return call(prop(get(0), 23744), 13671 if add else 13672,
                prop(q(0x60, 2), 39383), prop(get(0), 23751), void=True)


def cleanup(code):
    # Original loop removes every cached page and its listeners, then clears it.
    return code[179:259]


def main_bodies(bodies):
    added, removed, change, day, create = (bodies[n] for n in (22107, 22108, 22110, 22111, 22112))
    result = {}
    # onDayChange initializes the new page; do not initialize it a second time.
    result[22107] = (added[:16] + call(get(0), 23752, void=True) + added[89:], (3, 6, 14, 15))
    # Clear pages when closing, so reopening never reuses detached listeners.
    result[22108] = (removed[:71] + cleanup(day) + get(0) + number(-1) + q(0x68, 23742) + b'\x47', (3, 11, 14, 15))

    c = Code(); c.add(get(0) + b'\x30')
    c.add(prop(get(0), 23743) + prop(get(0), 23742) + q(0x66, 48284) + put(2))
    c.add(get(2)); c.branch(0x12, 'create')
    c.add(get(2) + b'\x27' + q(0x61, 1832))
    c.label('create'); c.add(call(get(0), 23753) + put(2))
    c.add(get(0) + call(q(0x60, 42709), 43280, prop(get(0), 23744, 6136)) + q(0x68, 23742))
    c.add(get(2)); c.branch(0x12, 'done')
    c.add(get(2) + b'\x26' + q(0x61, 1832) + call(get(2), 2070, void=True))
    c.label('done'); c.add(b'\x47')
    result[22110] = (c.finish(), (3, 3, 14, 15))

    c = Code(); c.add(day[:34])
    c.add(prop(get(0), 23744, 6136) + put(4) + listen(False))
    # Ignore the shared DAY_CHANGE flag: each window owns its own contents.
    c.add(day[51:160] + cleanup(day))
    c.add(get(0) + number(-1) + q(0x68, 23742))
    c.add(prop(get(0), 23744) + get(2) + q(0x61, 6138))
    c.add(call(get(2), 43280, get(4)) + put(3))
    c.add(get(3) + number(0)); c.branch(0x18, 'select')
    c.add(number(0) + put(3))
    c.label('select'); c.add(prop(get(0), 23744) + get(3) + q(0x61, 6104))
    c.add(listen() + call(get(0), 23751, b'\x20', void=True) + b'\x47')
    result[22111] = (c.finish(), (6, 11, 14, 15))

    c = Code(); c.add(create[:21])
    c.add(get(1) + number(0)); c.branch(0x15, 'empty')
    c.add(prop(get(0), 23740) + get(1) + q(0x66, 48284)); c.branch(0x12, 'empty')
    # Keep the existing cache and construction path, including one initEvent.
    c.add(create[21:])
    c.label('empty'); c.add(b'\x20\x48')
    result[22112] = (c.finish(), (3, 4, 14, 15))
    return result


def dragon_reset():
    return (call(prop(get(0), 21), 108, void=True) + call(prop(get(0), 23), 108, void=True)
            + get(0) + b'\x27' + q(0x68, 27) + get(0) + number(0) + q(0x68, 25))


def module_bodies(bodies):
    added, removed, turn, info = (bodies[n] for n in (7, 8, 16, 17))
    result = {}
    # Claim any interrupted spin before requesting the current board. Operation
    # 3 is server-idempotent, including when there is no pending reward.
    result[7] = (added[:106] + dragon_reset() + prop(get(0), 17) + b'\x27' + q(0x61, 131)
                 + call(q(0x60, 104), 105, number(3), void=True) + added[106:], (3, 2, 15, 16))
    timer_listener = call(prop(get(0), 21), 107, prop(q(0x60, 6), 103), prop(get(0), 53), void=True)
    result[8] = (removed[:93] + timer_listener + dragon_reset() + removed[93:], (3, 2, 15, 16))
    c = Code(); c.add(turn[:2])
    c.add(prop(get(0), 17, 131)); c.branch(0x12, 'done')
    c.add(prop(q(0x60, 89), 116, 129) + number(49)); c.branch(0x18, 'done')
    # Reset the reply flag before each spin, so a previous response cannot drive
    # the next animation or claim the next reward early.
    c.add(dragon_reset() + turn[2:])
    c.label('done'); c.add(b'\x47')
    result[16] = (c.finish(), (3, 2, 15, 16))
    result[17] = (info[:2] + dragon_reset() + prop(get(0), 17) + b'\x26' + q(0x61, 131) + info[2:],
                  (6, 11, 15, 16))
    return result


def patch_swf(source, module=False):
    data, (tag, payload, a, b) = abc_section(source)
    abc, positions = normalize(data[a:b]); _, _, bodies = inspect_abc(abc)
    target = MODULE_METHODS if module else MAIN_METHODS
    marker = call(prop(get(0), 21), 108, void=True) if module else listen(False)
    check = 7 if module else 22111
    start, size, _ = bodies[check]
    if marker in abc[start:start + size]: return source
    expected = {7: 120, 8: 100, 16: 91, 17: 429} if module else {22107: 128, 22108: 117, 22110: 73, 22111: 363, 22112: 120}
    original = {n: abc[bodies[n][0]:sum(bodies[n][:2])] for n in target}
    for n in target:
        if len(original[n]) != expected[n]: raise ValueError(f'Unexpected original method {n}: {len(original[n])}')
    updates = module_bodies(original) if module else main_bodies(original)
    changes = []
    for mid, (code, limits) in updates.items():
        instructions(code)
        start, size, old_limits = bodies[mid]
        header = b''.join(encode_u30(v) for v in (mid, *old_limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected method header')
        r = ABCReader(abc); r.pos = start + size
        if r.u30(): raise ValueError('Unexpected method exceptions')
        value = b''.join(encode_u30(v) for v in (mid, *limits, len(code))) + code + b'\0'
        changes.append((start - len(header), r.pos, value))
    result = bytearray(abc); ordered = sorted(changes)
    for start, end, value in reversed(ordered): result[start:end] = value
    _, _, after = inspect_abc(result)
    for mid, (start, size, limits) in bodies.items():
        new_start, new_size, new_limits = after[mid]
        if mid not in target and (limits != new_limits or abc[start:start + size] != result[new_start:new_start + new_size]):
            raise ValueError('Unrelated method changed')
    restored = bytearray(result); shift = 0; undo = []
    for start, end, value in ordered:
        undo.append((start + shift, start + shift + len(value), abc[start:end])); shift += len(value) - (end - start)
    for start, end, value in reversed(undo): restored[start:end] = value
    if restored != abc: raise ValueError('Unrelated ABC metadata changed')
    for pos in positions: result[pos] = 0
    swf = data[:tag + 2] + struct.pack('<I', a - payload + len(result)) + data[payload:a] + result + data[b:]
    swf = swf[:4] + struct.pack('<I', len(swf)) + swf[8:]
    if swf[8:tag] != data[8:tag] or swf[a + len(result):] != data[b:]: raise ValueError('Unrelated resources changed')
    return swf[:8] + zlib.compress(swf[8:], 9)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    for path, module in ((CLIENT, False), (MODULE, True)):
        source = path.read_bytes() if path.exists() else ORIGINAL_MODULE.read_bytes()
        updated = patch_swf(source, module)
        if patch_swf(updated, module) != updated: raise ValueError('Non-idempotent window patch')
        if args.check:
            if source != updated: raise ValueError('Window lifecycle patch missing')
        elif source != updated:
            path.parent.mkdir(parents=True, exist_ok=True); path.write_bytes(updated)
    print('DaJiDaLi reuse and LongTeng loading/closing lifecycle repaired.')
