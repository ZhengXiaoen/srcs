"""Lay out shared equipment details and position links like backpack tooltips.

The main column stays next to the mouse. Each hover/move chooses rightward or
leftward layout using the main column width, matching GameItemTips.updateLayout.
Only shared show and the two link handlers change; other client data is intact.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import struct
import zlib

from patch_activity_entries import q
from patch_activity_reminders import Code, call, get, number, prop, put, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / 'web/GameFrame.swf'
BASELINE = 'eb602de'
LINK_LIMITS = (4, 9, 13, 14)


def mouse_layout():
    """Use the backpack cursor offsets, direction check and vertical limits."""
    tip = q(0x60, 39379)
    container = prop(tip, 3134)
    stage = prop(container, 14882)
    manager = q(0x60, 3111)
    c = Code()
    c.add(number(0) + put(5) + number(0) + put(6))
    c.add(prop(manager, 14074) + q(0x80, 20) + put(2))
    c.add(get(2)); c.branch(0x12, 'point')
    c.add(prop(manager, 14076) + q(0x80, 23) + put(8))
    c.add(prop(get(2), 1617) + number(2) + b'\xa0'
          + prop(get(8), 1656) + b'\xa1\x73' + put(5))
    c.add(prop(get(2), 1618) + number(2) + b'\xa0'
          + prop(get(8), 1657) + b'\xa1\x73' + put(6))
    c.label('point')
    point = (q(0x5d, 23) + prop(stage, 43456) + prop(stage, 43457)
             + q(0x4a, 23, 2))
    c.add(call(container, 43462, point) + q(0x80, 23) + put(3))
    c.add(prop(tip, 1618) + b'\x73' + put(7))
    c.add(b'\x26' + put(4))
    c.add(prop(get(3), 1656) + prop(tip, 1617) + b'\xa0'
          + get(5) + b'\xa0' + prop(manager, 1617))
    c.branch(0x0e, 'horizontal')
    c.add(b'\x27' + put(4))
    c.label('horizontal')
    c.add(get(3) + prop(get(3), 1656) + get(5) + b'\xa0' + q(0x61, 1656))
    c.add(prop(get(3), 1657) + get(7) + b'\xa0'
          + get(6) + b'\xa0' + prop(manager, 1618))
    c.branch(0x0e, 'below')
    c.add(get(3) + prop(get(3), 1657) + get(7) + b'\xa1' + q(0x61, 1657))
    c.branch(0x10, 'clamp')
    c.label('below')
    c.add(get(3) + prop(get(3), 1657) + get(6) + b'\xa0' + q(0x61, 1657))
    c.label('clamp')
    c.add(prop(get(3), 1656) + number(0)); c.branch(0x0c, 'vertical')
    c.add(get(3) + number(0) + q(0x61, 1656))
    c.label('vertical')
    c.add(prop(get(3), 1657) + number(38)); c.branch(0x0c, 'place')
    c.add(get(3) + number(38) + q(0x61, 1657))
    c.label('place')
    c.add(tip + prop(get(3), 1656) + q(0x61, 1656))
    c.add(tip + prop(get(3), 1657) + q(0x61, 1657))
    c.add(call(tip, 14168, get(4), void=True))
    return c.finish()


def patch_abc(source: bytes) -> bytes:
    names, methods, bodies = inspect_abc(source, 'GameItemTipsPanel')
    expected = {14168: 'layoutDlg', 42514: 'addToParent', 39379: '_tipSp',
                3134: 'container', 14882: 'stage', 43456: 'mouseX', 43457: 'mouseY',
                43462: 'globalToLocal', 3111: 'UIManager', 14074: 'cursorShape',
                14076: 'cursorHotPoint', 1617: 'width', 1618: 'height'}
    if methods is None or any(names[i] != n for i, n in expected.items()):
        raise ValueError('Unexpected shared equipment tooltip properties')
    replacements = {}
    method = methods['show'][0]
    start, length, limits = bodies[method]
    code = source[start:start + length]
    layout = b'\xd0\x26\x4f' + encode_u30(14168) + b'\x01'
    tail = b'\x4f' + encode_u30(42514) + b'\x02'
    if code.endswith(tail + layout + b'\x47'):
        pass
    elif length == 139 and limits == (3, 5, 9, 10) and code.endswith(tail + b'\x47'):
        if any(target >= length - 1 for op in instructions(code)
               for _, target, _ in op.branches):
            raise ValueError('A branch targets the show insertion point')
        replacements[method] = (code[:-1] + layout + code[-1:], limits)
    else:
        raise ValueError('Unexpected shared tooltip show body')

    _, link_methods, _ = inspect_abc(source, 'GameRichFiled')
    if link_methods is None:
        raise ValueError('Missing equipment link handlers')
    for name, offset in (('onOver', 102), ('onMove', 80)):
        method = link_methods[name][0]
        start, length, limits = bodies[method]
        code = source[start:start + length]
        if code[offset:-1] == mouse_layout() and limits == LINK_LIMITS:
            continue
        # Preserve construction, visibility, stage attachment and item content.
        # Replace only the mouse positioning suffix; retain the original return
        # so onMove's existing visibility guard still exits there.
        if code[offset:offset + 2] != q(0x5d, 23) or code[-1:] != b'\x47':
            raise ValueError('Unexpected equipment link positioning suffix')
        if limits != (4, 5, 13, 14):
            raise ValueError('Unexpected equipment link method limits')
        updated, _ = relocate(code, [(offset, length - 1, mouse_layout())])
        replacements[method] = (updated, LINK_LIMITS)

    edits = []
    for method, (updated, new_limits) in replacements.items():
        start, length, limits = bodies[method]
        instructions(updated)
        reader = ABCReader(source); reader.pos = start + length
        if reader.u30() or reader.u30():
            raise ValueError('Unexpected tooltip exceptions or body traits')
        header = b''.join(encode_u30(v) for v in (method, *limits, length))
        header_start = start - len(header)
        if source[header_start:start] != header:
            raise ValueError('Unexpected tooltip method header')
        value = b''.join(encode_u30(v) for v in (method, *new_limits, len(updated))) + updated
        edits.append((header_start, start + length, value))
    result = bytearray(source)
    for a, b, value in sorted(edits, reverse=True):
        result[a:b] = value
    inspect_abc(result, 'GameItemTipsPanel')
    restored = bytearray(result); undo = []; shift = 0
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
    source = CLIENT.read_bytes(); result = patch_swf(source)
    if patch_swf(result) != result:
        raise ValueError('Tooltip layout patch is not idempotent')
    if args.check:
        if source != result:
            raise ValueError('Mouse-following tooltip layout is missing')
    elif source != result:
        CLIENT.write_bytes(result)
    print('Verified backpack-style mouse positioning; unrelated client bytes preserved')


if __name__ == '__main__':
    main()
