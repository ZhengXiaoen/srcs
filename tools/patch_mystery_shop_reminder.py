"""Mark mysterious-shop products unseen on refresh and read on opening.

Server product replies append a refresh flag. Legacy replies without the flag
remain readable and detect changed product IDs. Only targeted method bodies
change; packaged graphics, configuration, traits and other bytes are preserved.
"""
from __future__ import annotations

import argparse
import hashlib
import struct
import zlib

from patch_activity_reminders import (CLIENT, Code, GD, call, get, normalize,
                                      number, prop, put, relocate)
from patch_activity_entries import q
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section
from patch_god_equip_state import inspect_abc

BASELINE = '38726a1'
PANEL = q(0x60, 8096)
BUTTON = prop(q(0x60, 13052), 38295)
NAVIGATOR = q(0x60, 1560)
WINDOW = prop(q(0x60, 1506), 31003)
METHODS = {6333, 6377, 6393, 6405, 6692, 8763}
ORIGINAL_HASHES = {
    6333: 'ccf786e59fc25b826cae40355913bc7b1a8f0f4a53af60209016e585e7ad4e57',
    6377: '7405b0393aace2d010a706ea2af2b2c6010236205bf41f77b1daf2985c45f5f7',
    6393: 'fc2b7ab6f1d6a0abb6c0adf965c355d6afd0e04a5e60d2b94c16b2938e370316',
    6405: '7ea12174bc8120d0843c05ab1f2e2a65fb1092fe35b4f0b92782db3672405086',
    6692: 'fed6ddeac67515df28142b41b6a18d6df28b3f7d8b41dbe8f1c066caf1361682',
    8763: 'd1d949e83c46953bb46f66e7d13c129dfdc6945d940fedec8c10a9f1942cf356',
}


def visible_guard(c, window_local, done):
    c.add(call(NAVIGATOR, 31807, WINDOW) + put(window_local))
    c.add(get(window_local)); c.branch(0x12, done)
    c.add(prop(get(window_local), 14463)); c.branch(0x12, done)
    c.add(b'\x27' + put(6))


def entry(code):
    # Product events carry only the refresh flag, never an activity open day.
    prefix = Code(); prefix.add(prop(get(1), 6015) + prop(q(0x60, 141), 31651))
    prefix.branch(0x14, 'normal')
    prefix.add(call(PANEL, 38383, BUTTON) + put(5))
    prefix.add(get(5)); prefix.branch(0x12, 'return')
    prefix.add(prop(get(1), 1513) + number(1) + b'\xab' + put(6))
    # Queries and purchases preserve an already-unread reminder.
    prefix.add(get(6)); prefix.branch(0x11, 'visibility')
    prefix.branch(0x10, 'return')
    prefix.label('visibility'); visible_guard(prefix, 4, 'effect')
    prefix.label('effect'); prefix.add(call(get(5), 12784, get(6), void=True))
    prefix.label('return'); prefix.add(b'\x47'); prefix.label('normal')

    create = call(PANEL, 38383, BUTTON) + put(3)
    initial = Code(); initial.add(get(3)); initial.branch(0x11, 'done')
    initial.add(b'\x26' + put(6)); visible_guard(initial, 4, 'effect')
    initial.label('effect'); initial.add(call(get(5), 12784, get(6), void=True))
    initial.label('done')
    # Preserve original title, icon, navigation, activity close and open-day data.
    return relocate(code, [(2, 2, prefix.finish()), (41, 41, create),
                           (260, 267, initial.finish())])


def product_reply(code):
    c = Code(); c.add(number(0) + put(3))
    c.add(prop(get(1), 43440) + number(0)); c.branch(0x16, 'legacy')
    c.add(call(get(1), 43492) + put(3)); c.branch(0x10, 'done')
    c.label('legacy')
    # Older servers have no flag: compare only goods, not purchase flags.
    c.add(prop(GD, 31272, 3832) + put(4))
    c.add(get(4)); c.branch(0x12, 'changed')
    c.add(prop(get(4), 3237) + number(4)); c.branch(0x14, 'changed')
    c.add(number(0) + put(8))
    c.label('compare')
    c.add(get(8) + number(4)); c.branch(0x18, 'done')
    c.add(get(4) + get(8) + q(0x66, 43950) + get(9) + get(8) + q(0x66, 43950))
    c.branch(0x1a, 'changed')
    c.add(q(0xc2, 8)); c.branch(0x10, 'compare')
    c.label('changed'); c.add(number(1) + put(3))
    c.label('done')
    return relocate(code, [(749, 749, c.finish()), (786, 790, get(3) + q(0x4a, 141, 2))])


def clear_on_update(code):
    c = Code(); c.add(call(PANEL, 38383, BUTTON) + put(1))
    c.add(get(1)); c.branch(0x12, 'done')
    c.add(call(get(1), 12784, b'\x27', void=True)); c.label('done')
    return relocate(code, [(7, 7, c.finish())])


def patch_abc(source):
    abc, positions = normalize(source)
    names, _, bodies = inspect_abc(abc, 'NavTopRightArea')
    for index, expected in {38295: 'RIGHT_SHENMI_SHOP', 31651: 'QINGDIAN_ACTIVE_SHENMI_SHOP',
                            43440: 'bytesAvailable', 3832: 'shenmiShop'}.items():
        if names[index] != expected: raise ValueError(f'Unexpected QName {index}')
    a, size, _ = bodies[6393]
    if abc[a:a + size] == b'\xd0\x30\x47': return source
    for method, expected in ORIGINAL_HASHES.items():
        a, size, _ = bodies[method]
        if hashlib.sha256(abc[a:a + size]).hexdigest() != expected:
            raise ValueError(f'Unexpected original method {method}')
    changes = []

    def edit(method, transform, stack=None, locals_=None):
        start, size, limits = bodies[method]; code = abc[start:start + size]
        value = transform(code)
        updated, moved = value if isinstance(value, tuple) else (value, lambda p: p)
        limits2 = (stack or limits[0], locals_ or limits[1], *limits[2:])
        r = ABCReader(abc); r.pos = start + size; exceptions = []
        for _ in range(r.u30()):
            row = [r.u30() for _ in range(5)]
            exceptions.append([moved(p) for p in row[:3]] + row[3:])
        header = b''.join(encode_u30(v) for v in (method, *limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected method header')
        replacement = b''.join(encode_u30(v) for v in (method, *limits2, len(updated))) + updated
        replacement += encode_u30(len(exceptions)) + b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start - len(header), r.pos, replacement, method))

    edit(6405, entry)
    edit(8763, product_reply)
    # Actual product packets decide the reminder; never guess from the clock.
    edit(6393, lambda _: b'\xd0\x30\x47')
    edit(6692, clear_on_update, stack=2)
    for method, listener in ((6333, 13671), (6377, 13672)):
        value = call(q(0x60, 1563), listener, prop(q(0x60, 141), 31651), prop(get(0), 8206), void=True)
        edit(method, lambda code, value=value: relocate(code, [(2, 2, value)]))

    result = bytearray(abc)
    for a, b, value, _ in sorted(changes, reverse=True): result[a:b] = value
    result = bytes(result)
    _, _, after = inspect_abc(result, 'NavTopRightArea')
    if {m for _, _, _, m in changes} != METHODS: raise ValueError('Unexpected methods')
    for method, (a, size, limits) in bodies.items():
        b, size2, limits2 = after[method]
        if method not in METHODS and (limits != limits2 or abc[a:a + size] != result[b:b + size2]):
            raise ValueError('Unrelated method changed')
    restored = bytearray(result); shift = 0; undo = []
    for a, b, value, _ in sorted(changes):
        undo.append((a + shift, a + shift + len(value), abc[a:b])); shift += len(value) - (b - a)
    for a, b, value in reversed(undo): restored[a:b] = value
    if restored != abc: raise ValueError('Unrelated ABC metadata or resource changed')
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
    elif source != updated: CLIENT.write_bytes(updated)
    print('Verified shop view/refresh reminders and unchanged unrelated resources.')


if __name__ == '__main__': main()
