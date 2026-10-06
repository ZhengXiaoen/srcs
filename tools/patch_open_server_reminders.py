"""Remove purchase reminders from the opening entry and native shop tab mark.

Keep purchasing, claim predicates, reward tables and artwork unchanged.
"""
from __future__ import annotations

import argparse
import struct
import zlib

from patch_activity_reminders import CLIENT, GD, call, normalize, prop, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc

BASELINE = '1f6fbdc'
METHODS = {6433, 19561}
PURCHASE = call(prop(GD, 31245), 5335)


def patch_swf(source):
    data, (tag, payload, a, b) = abc_section(source)
    abc, positions = normalize(data[a:b]); names, _, bodies = inspect_abc(abc)
    for index, name in ((31245, 'competitivelDataMgr'), (5335, 'isCanBuyShop'),
                        (20808, '_tipIcon'), (1832, 'visible')):
        if names[index] != name: raise ValueError('Unexpected opening-activity symbols')
    expressions = {
        # The last OR term contributes false; earlier claim terms still short-circuit.
        6433: (159, 303, PURCHASE + b'\x76'),
        # Reuse the system's original mark and hide it on every shop refresh.
        19561: (316, 594, PURCHASE),
    }
    changes = []
    for mid, (at, original_size, old) in expressions.items():
        start, size, limits = bodies[mid]; code = abc[start:start + size]
        if size != original_size or code[at:at + len(old)] != old:
            if size == original_size - len(old) + 1 and code[at:at + 1] == b'\x27' and PURCHASE not in code:
                continue
            raise ValueError(f'Expected reminder expression missing in method {mid}')
        if code.count(old) != 1: raise ValueError('Ambiguous reminder expression')
        updated, moved = relocate(code, [(at, at + len(old), b'\x27')])
        instructions(updated)
        reader = ABCReader(abc); reader.pos = start + size; exceptions = []
        for _ in range(reader.u30()):
            row = [reader.u30() for _ in range(5)]
            exceptions.append([moved(p) for p in row[:3]] + row[3:])
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected method header')
        value = b''.join(encode_u30(v) for v in (mid, *limits, len(updated))) + updated
        value += encode_u30(len(exceptions)) + b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start - len(header), reader.pos, value))
    if not changes: return source
    ordered = sorted(changes); result = bytearray(abc)
    for start, end, value in reversed(ordered): result[start:end] = value
    _, _, after = inspect_abc(result)
    for mid, (start, size, limits) in bodies.items():
        new_start, new_size, new_limits = after[mid]
        if new_limits != limits or (mid not in METHODS and
                abc[start:start + size] != result[new_start:new_start + new_size]):
            raise ValueError('Unrelated client code or method limits changed')
    # Reversing the edited records must recover all original ABC metadata exactly.
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
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true'); args = parser.parse_args()
    source = CLIENT.read_bytes(); updated = patch_swf(source)
    if patch_swf(updated) != updated: raise ValueError('Non-idempotent reminder patch')
    if args.check:
        if updated != source: raise ValueError('Opening purchase reminders are still enabled')
    elif updated != source: CLIENT.write_bytes(updated)
    print('Opening purchase reminders are disabled; claim reminders and resources are preserved.')
