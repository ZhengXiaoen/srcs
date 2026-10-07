"""Lay out every equipment tooltip when its shared panel is shown.

GameRichFiled and other direct callers show GameItemTipsPanel without calling
layoutDlg. Its child panels then retain their initial (or previous) positions.
Run the existing rightward layout after all sections have been populated.
Backpack tooltips can still call layoutDlg afterwards to choose either side.
Only the shared show method and two link-positioning methods change.
Link tooltips measure all displayed sections when checking the right edge.
Formatting, data and artwork are preserved.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import struct
import zlib

from patch_bag_client import ABCReader, encode_u30
from patch_activity_reminders import relocate
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc


ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / 'web/GameFrame.swf'
BASELINE = 'eb602de'


def patch_abc(source: bytes) -> bytes:
    names, methods, bodies = inspect_abc(source, 'GameItemTipsPanel')
    if methods is None or names[14168] != 'layoutDlg':
        raise ValueError('Missing shared item tooltip layout')
    method = methods['show'][0]
    start, length, limits = bodies[method]
    code = source[start:start + length]
    layout = b'\xd0\x26\x4f' + encode_u30(14168) + b'\x01'
    tail = b'\x4f' + encode_u30(42514) + b'\x02'
    if names[42514] != 'addToParent' or limits != (3, 5, 9, 10):
        raise ValueError('Unexpected shared tooltip show method')
    if not code.endswith(tail + layout + b'\x47') and (
            length != 139 or not code.endswith(tail + b'\x47')):
        raise ValueError('Unexpected shared tooltip show body')
    # The only existing jumps target earlier instructions (13 and 124).
    # Inserting before the final return therefore keeps every jump unchanged.
    if any(target >= length - 1 for op in instructions(code)
           for _, target, _ in op.branches):
        raise ValueError('A branch targets the insertion point')
    changed = code if code.endswith(tail + layout + b'\x47') else code[:-1] + layout + code[-1:]
    instructions(changed)
    reader = ABCReader(source)
    reader.pos = start + length
    if reader.u30() or reader.u30():
        raise ValueError('Unexpected show exceptions or body traits')
    length_start = start - len(encode_u30(length))
    if source[length_start:start] != encode_u30(length):
        raise ValueError('Unexpected method code length')
    edits = [(length_start, start + length, encode_u30(len(changed)) + changed)]
    # GameItemTipsPanel.width intentionally reports only the main column.
    # Link callers need the rendered right edge, including fate and comparison
    # columns, both on first hover and while the pointer moves.
    names, link_methods, _ = inspect_abc(source, 'GameRichFiled')
    expected = {39379: '_tipSp', 1617: 'width', 44284: 'getBounds', 6052: 'right',
                43301: 'Math', 45746: 'max'}
    if link_methods is None or any(names[i] != n for i, n in expected.items()):
        raise ValueError('Unexpected equipment-link tooltip properties')
    old = b'\x60' + encode_u30(39379) + b'\x66' + encode_u30(1617)
    new = (b'\x60' + encode_u30(39379) + b'\x60' + encode_u30(39379)
           + b'\x46' + encode_u30(44284) + b'\x01\x66' + encode_u30(6052))
    for name in ('onOver', 'onMove'):
        link_start, link_length, link_limits = bodies[link_methods[name][0]]
        link_code = source[link_start:link_start + link_length]
        ops = instructions(link_code)
        positions = [op.start for op in ops if link_code[op.start:op.start + len(old)] == old]
        patched = [op.start for op in ops if link_code[op.start:op.start + len(new)] == new]
        # Clamp the selected x before assigning it to the whole tooltip. The
        # existing left shift can cross the left edge with three wide columns.
        x_value = b'\xd3\x66' + encode_u30(1656)
        assign = b'\x61' + encode_u30(1656)
        clamp = (b'\x60' + encode_u30(43301) + b'\x24\x00' + x_value
                 + b'\x46' + encode_u30(45746) + b'\x02')
        clamped = clamp + assign
        placements = [op.start for op in ops
                      if link_code[op.start:op.start + len(x_value + assign)] == x_value + assign]
        if not positions and len(patched) == 2 and link_code.count(clamped) == 1:
            continue
        if (len(positions) not in (0, 2) or len(patched) not in (0, 2)
                or len(positions) + len(patched) != 2 or len(placements) != 1
                or link_limits != (4, 5, 13, 14)):
            raise ValueError('Unexpected link tooltip boundary checks')
        p = placements[0]
        updated, _ = relocate(link_code, [(p, p + len(old), new) for p in positions]
                              + [(p, p + len(x_value), clamp)])
        reader.pos = link_start + link_length
        if reader.u30() or reader.u30():
            raise ValueError('Unexpected link tooltip exceptions or traits')
        edits.append((link_start - len(encode_u30(link_length)), link_start + link_length,
                      encode_u30(len(updated)) + updated))
    result = bytearray(source)
    for a, b, value in sorted(edits, reverse=True):
        result[a:b] = value
    _, updated_methods, updated_bodies = inspect_abc(result, 'GameItemTipsPanel')
    if updated_methods != methods or updated_bodies[method][2] != limits:
        raise ValueError('Tooltip method identity or limits changed')
    restored = bytearray(result)
    undo = []
    shift = 0
    for a, b, value in sorted(edits):
        undo.append((a + shift, a + shift + len(value), source[a:b]))
        shift += len(value) - (b - a)
    for a, b, value in reversed(undo):
        restored[a:b] = value
    if restored != source:
        raise ValueError('Unrelated ABC bytes changed')
    return bytes(result)


def patch_swf(source: bytes) -> bytes:
    data, (tag, payload, start, end) = abc_section(source)
    abc = patch_abc(data[start:end])
    if abc == data[start:end]:
        return source
    result = (data[:tag + 2] + struct.pack('<I', start - payload + len(abc))
              + data[payload:start] + abc + data[end:])
    result = result[:4] + struct.pack('<I', len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(abc):] != data[end:]:
        raise ValueError('Unrelated SWF tags changed')
    return result[:8] + zlib.compress(result[8:], 9)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    result = patch_swf(source)
    if patch_swf(result) != result:
        raise ValueError('Tooltip layout patch is not idempotent')
    if args.check:
        if source != result:
            raise ValueError('Shared tooltip layout patch is missing')
    elif source != result:
        CLIENT.write_bytes(result)
    print('Verified automatic shared tooltip layout; unrelated client bytes preserved')


if __name__ == '__main__':
    main()
