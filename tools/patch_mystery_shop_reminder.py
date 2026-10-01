"""Remind once per two-hour shop cycle and mark the cycle read on opening.

Server product and open-status replies append the cycle's unread state. Legacy
products remain readable without inferring reminders from changed IDs. Only
targeted method bodies change; packaged graphics, configuration, traits and
other bytes are preserved.
"""
from __future__ import annotations

import argparse
import hashlib
import struct
import zlib

from patch_activity_reminders import (CLIENT, Code, call, get, normalize,
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
METHODS = {6333, 6377, 6393, 6405, 6687, 6692, 8758, 8763, 8774}
ORIGINAL_HASHES = {
    6333: 'ccf786e59fc25b826cae40355913bc7b1a8f0f4a53af60209016e585e7ad4e57',
    6377: '7405b0393aace2d010a706ea2af2b2c6010236205bf41f77b1daf2985c45f5f7',
    6393: 'fc2b7ab6f1d6a0abb6c0adf965c355d6afd0e04a5e60d2b94c16b2938e370316',
    6405: '7ea12174bc8120d0843c05ab1f2e2a65fb1092fe35b4f0b92782db3672405086',
    6687: '729d3b4e70f5d34bab87750bc0e2d43f9b3a6f39018bb2c00ddb6c19f85c126e',
    6692: 'fed6ddeac67515df28142b41b6a18d6df28b3f7d8b41dbe8f1c066caf1361682',
    8758: '61fc30f38ed443c275239321276bbf9725d005f6d961669fd4b669348a661125',
    8763: 'd1d949e83c46953bb46f66e7d13c129dfdc6945d940fedec8c10a9f1942cf356',
    8774: 'b748dd7c43906239269204188799dfef033ea23c81865dbb57e17e39190fefdd',
}
PREVIOUS_HASHES = {**ORIGINAL_HASHES,
    6333: 'b632cc7809b74bc4e67ff7b428c42ae1f4a8397dad27528c7d9c1f79bb617808',
    6377: '2b8ab8e145e1e19644f9b7bb05f2a51653d260bcb205169e502b8aaac4cb3f03',
    6393: 'a968960b201420953c59656517f78c74a88e3e2aebf37839d8e70f6e531134c4',
    6405: '3c5b1f9029f33f09d2844e38f183f72baee33adfa03b37f11864c366665cb385',
    6692: '6fe9f3fc150c6ebb004f2a70ba7592d543e7d65b7e7809d68215c6a9146c53c6',
    8763: '7dde7956b41b22ab393b4bf46f17a86ce446132c36ad20fd9a77f44e810c5829',
}
PATCHED_HASHES = {**PREVIOUS_HASHES,
    6405: '3a30429a14dbf5c4ba37d629c91e59e234e5b3656aef164b89a6c490e3a4021c',
    6687: '3147632c614dd809747e2bf11effd39eda8238a8eb882e9474caf14972e6905e',
    6692: '0c02ab13face5299a2f406400e00f8570fa7f3dd3eafe652e4546ea1c1c2f54e',
    8758: '65d69495aa3a773515a52fba9db7f402679a9c7dc41f7e200941aa1481d738d4',
    8763: '1998129d8e9266bd8e556f881473cd64c2f99fa9d4121707b9f401d4f5bcfa2d',
    8774: '289c5ac31309f1449904bd0e66bacc981b05233ba24c0780039935dca93f6e0e',
}
VIEW = call(q(0x60, 11028), 37707, number(6), number(4), void=True)


def visible_guard(c, window_local, done):
    c.add(call(NAVIGATOR, 31807, WINDOW) + put(window_local))
    c.add(get(window_local)); c.branch(0x12, done)
    c.add(prop(get(window_local), 14463)); c.branch(0x12, done)
    c.add(b'\x27' + put(6))


def entry(code):
    # Product events carry the cycle's unread state, never an activity open day.
    prefix = Code(); prefix.add(prop(get(1), 6015) + prop(q(0x60, 141), 31651))
    prefix.branch(0x14, 'normal')
    prefix.add(call(PANEL, 38383, BUTTON) + put(5))
    prefix.add(get(5)); prefix.branch(0x12, 'return')
    prefix.add(prop(get(1), 1513) + number(1) + b'\xab' + put(6))
    # The server persists read state across purchases, manual refresh and login.
    visible_guard(prefix, 4, 'effect')
    prefix.label('effect'); prefix.add(call(get(5), 12784, get(6), void=True))
    prefix.label('return'); prefix.add(b'\x47'); prefix.label('normal')

    create = call(PANEL, 38383, BUTTON) + put(3)
    initial = Code(); initial.add(get(3)); initial.branch(0x11, 'done')
    initial.add(b'\x27' + put(6)); visible_guard(initial, 4, 'effect')
    initial.label('effect'); initial.add(call(get(5), 12784, get(6), void=True))
    initial.label('done')
    # Preserve original title, icon, navigation, activity close and open-day data.
    return relocate(code, [(2, 2, prefix.finish()), (41, 41, create),
                           (260, 267, initial.finish())])


def product_reply_prefix():
    c = Code(); c.add(number(0) + put(3))
    c.add(prop(get(1), 43440) + number(0)); c.branch(0x16, 'done')
    c.add(call(get(1), 43492) + put(3))
    c.label('done')
    return c.finish()


def product_reply(code):
    return relocate(code, [(749, 749, product_reply_prefix()), (786, 790, get(3) + q(0x4a, 141, 2))])


def open_reply(code):
    c = Code(); c.add(prop(get(1), 43440) + number(0)); c.branch(0x16, 'done')
    c.add(q(0x60, 1563) + q(0x5d, 141) + prop(q(0x60, 141), 31651))
    c.add(call(get(1), 43492) + q(0x4a, 141, 2) + q(0x4f, 13673, 1))
    c.label('done')
    # First create/remove the entry using its existing activity status event.
    return relocate(code, [(45, 45, c.finish())])


def view_sender(code):
    # sendQDActiveInfo originally omits the operation byte for message 6.
    c = Code(); c.add(b'\x2a'); c.branch(0x11, 'done')
    c.add(b'\x29' + get(1) + number(6) + b'\xab'); c.label('done')
    return relocate(code, [(182, 182, c.finish())])


def clear_on_update(code):
    # A system refresh received while the shop is open is viewed immediately.
    c = Code(); c.add(VIEW + call(PANEL, 38383, BUTTON) + put(1))
    c.add(get(1)); c.branch(0x12, 'done')
    c.add(call(get(1), 12784, b'\x27', void=True)); c.label('done')
    return relocate(code, [(7, 7, c.finish())])


def patch_abc(source):
    abc, positions = normalize(source)
    names, _, bodies = inspect_abc(abc, 'NavTopRightArea')
    for index, expected in {38295: 'RIGHT_SHENMI_SHOP', 31651: 'QINGDIAN_ACTIVE_SHENMI_SHOP',
                            43440: 'bytesAvailable', 3832: 'shenmiShop'}.items():
        if names[index] != expected: raise ValueError(f'Unexpected QName {index}')
    a, size, _ = bodies[6687]
    if VIEW in abc[a:a + size]:
        for method, expected in PATCHED_HASHES.items():
            a, size, _ = bodies[method]
            if hashlib.sha256(abc[a:a + size]).hexdigest() != expected:
                raise ValueError(f'Incomplete or unexpected shop patch at method {method}')
        if bodies[6692][2][0] < 3: raise ValueError('Shop update stack limit is too small')
        return source
    a, size, _ = bodies[6393]
    previous = abc[a:a + size] == b'\xd0\x30\x47'
    expected_hashes = PREVIOUS_HASHES if previous else ORIGINAL_HASHES
    for method, expected in expected_hashes.items():
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

    if previous:
        # Upgrade the already shipped patch using its verified insertion bounds.
        # Keep all unrelated client fixes in the current resource.
        edit(6405, lambda code: relocate(code, [(49, 59, b''), (382, 383, b'\x27')]))
        edit(8763, lambda code: relocate(code, [(749, 845, product_reply_prefix())]))
        edit(6692, lambda code: relocate(code, [(7, 7, VIEW)]), stack=3)
    else:
        edit(6405, entry)
        edit(8763, product_reply)
        edit(6692, clear_on_update, stack=3)
    edit(6687, lambda code: relocate(code, [(139, 139, VIEW)]))
    edit(8758, open_reply, stack=4)
    edit(8774, view_sender)
    # Server packets decide the reminder; never guess from the client clock.
    edit(6393, lambda _: b'\xd0\x30\x47')
    for method, listener in (() if previous else ((6333, 13671), (6377, 13672))):
        value = call(q(0x60, 1563), listener, prop(q(0x60, 141), 31651), prop(get(0), 8206), void=True)
        edit(method, lambda code, value=value: relocate(code, [(2, 2, value)]))

    result = bytearray(abc)
    for a, b, value, _ in sorted(changes, reverse=True): result[a:b] = value
    result = bytes(result)
    _, _, after = inspect_abc(result, 'NavTopRightArea')
    expected_changes = METHODS - {6333, 6377} if previous else METHODS
    if {m for _, _, _, m in changes} != expected_changes: raise ValueError('Unexpected methods')
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
    print('Verified two-hour shop reminders and unchanged unrelated resources.')


if __name__ == '__main__': main()
