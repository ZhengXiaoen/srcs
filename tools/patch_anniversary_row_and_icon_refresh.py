"""Move anniversary to row two and repair the daily icon runtime contracts."""
from __future__ import annotations

import argparse
import struct
import zlib

from patch_activity_entries import q
from patch_activity_reminders import CLIENT, call, get, normalize, number, prop, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_competition_hongli_reminders import parameter_positions
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_super_anniversary import bytecode_requirements
from patch_wanfu_dragon_reminders import query

METHODS = {6333, 6379, 6380, 6381, 6496, 6497}


def login_refresh():
    # Read saved claims even if the login packets arrived before UI listeners.
    event = q(0x5d, 331) + prop(q(0x60, 331), 36022) + q(0x4a, 331, 1)
    return (call(get(0), 8173, b'\x20', void=True)
            + call(get(0), 8308, event, void=True)
            + call(q(0x60, 11028), 37563, number(1), number(0), void=True)
            + call(q(0x60, 11028), 37563, number(2), number(0), void=True)
            + query(1))


def patch_swf(source):
    data, (tag, payload, a, b) = abc_section(source)
    abc, positions = normalize(data[a:b]); names, _, bodies = inspect_abc(abc)
    params = parameter_positions(abc)
    if params[6496][0][1] == 331:
        if names[331] != 'CliffordEvent': raise ValueError('Unexpected event type')
        return source
    if params[6496][0][1] != 330: raise ValueError('Unexpected original callback type')
    code = lambda mid: abc[bodies[mid][0]:sum(bodies[mid][:2])]
    transforms = {}
    key = prop(q(0x60, 13052), 38323)
    for mid in (6379, 6380):
        old = code(mid)
        lookup = q(0x60, 8094) + key + q(0x46, 42485, 1)
        if old.count(lookup) != 1: raise ValueError('Anniversary lookup changed')
        start = old.index(lookup)
        edits = [(start, start + len(lookup), q(0x60, 8096) + key + q(0x46, 38383, 1))]
        if mid == 6380:
            remove = q(0x60, 8094) + key + q(0x4f, 38381, 1)
            if old.count(remove) != 1: raise ValueError('Anniversary removal changed')
            start = old.index(remove)
            edits.append((start, start + len(remove), q(0x60, 8096) + key + key + q(0x4f, 38381, 2)))
        transforms[mid] = relocate(old, edits)
    old = code(6497); ops = instructions(old)
    marker = next(o.start for o in ops if o.opcode == 0x66 and o.operands[0] == 38323)
    panel = next(o for o in ops if o.start == marker - 6)
    if panel.opcode != 0x60 or panel.operands != (8094,): raise ValueError('Anniversary row changed')
    transforms[6497] = relocate(old, [(panel.start, panel.end, q(0x60, 8096))])
    # The first-row static delBtn accepts ident only. The second row accepts type and ident.
    for mid, kind in ((6381, 38327), (6496, 38325)):
        key = prop(q(0x60, 13052), kind)
        old = code(mid); remove = q(0x60, 8094) + key + key + q(0x4f, 38381, 2)
        if old.count(remove) != 1: raise ValueError('Daily icon removal changed')
        start = old.index(remove)
        transforms[mid] = relocate(old, [(start, start + len(remove), q(0x60, 8094) + key + q(0x4f, 38381, 1))])
    # Insert after the existing National Day day listener; both reply listeners now exist.
    old = code(6333)
    listener = call(q(0x60, 1563), 13671, prop(q(0x60, 331), 36024), prop(get(0), 8173), void=True)
    if old.count(listener) != 1: raise ValueError('National Day login listener changed')
    at = old.index(listener) + len(listener)
    transforms[6333] = relocate(old, [(at, at, login_refresh())])
    changes = []
    for mid, (updated, moved) in transforms.items():
        start, size, limits = bodies[mid]
        requirements = bytecode_requirements(updated, names, limits[2])
        new_limits = (max(limits[0], requirements[0]), max(limits[1], requirements[1]),
                      limits[2], max(limits[3], requirements[2]))
        r = ABCReader(abc); r.pos = start + size; exceptions = []
        for _ in range(r.u30()):
            row = [r.u30() for _ in range(5)]; exceptions.append([moved(v) for v in row[:3]] + row[3:])
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        if abc[start - len(header):start] != header: raise ValueError('Unexpected method header')
        value = b''.join(encode_u30(v) for v in (mid, *new_limits, len(updated))) + updated
        value += encode_u30(len(exceptions)) + b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start - len(header), r.pos, value))
    # Flash checks declared parameter types before dispatching the event handler.
    position, old_type = params[6496][0]
    changes.append((position, position + len(encode_u30(old_type)), encode_u30(331)))
    result = bytearray(abc)
    for start, end, value in sorted(changes, reverse=True): result[start:end] = value
    _, _, after = inspect_abc(result)
    for mid, (start, size, limits) in bodies.items():
        new_start, new_size, new_limits = after[mid]
        if mid not in METHODS and (limits != new_limits or abc[start:start + size] != result[new_start:new_start + new_size]):
            raise ValueError('Unrelated method changed')
    restored = bytearray(result); shift = 0; undo = []
    for start, end, value in sorted(changes):
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
        if source != updated: raise ValueError('Icon refresh patch missing')
    elif source != updated: CLIENT.write_bytes(updated)
    print('Anniversary second row and daily icon runtime contracts verified.')
