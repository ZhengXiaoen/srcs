"""Hide the forge's Combin tab mark while retaining all in-page reminders.

Keep checkCanUpgrade's page-mark refresh and the synthesis success effect.
Only two existing method bodies change; other code and resources are preserved.
"""
from __future__ import annotations

import argparse
import hashlib
import struct
import zlib

from patch_activity_reminders import CLIENT, normalize, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc

METHODS = {6167, 6172}
ORIGINAL_HASHES = {
    6167: 'b4194f943fec4c3c6b3254f9655c2c11a39a3758ab542fc39464c66a26c339fa',
    6172: '714911a09d9dec34717f04b645dc258cbb4b6c6ebf464c4ab50ce480e11d7fed',
}


def patch_swf(source):
    data, (tag, payload, a, b) = abc_section(source)
    abc, positions = normalize(data[a:b])
    names, traits, bodies = inspect_abc(abc, 'EquipBoostWinII')
    if traits['onAddedToStage'] != (6167, 7875) or traits['checkCombin'] != (6172, 7880):
        raise ValueError('Unexpected forge window methods')
    for index, name in ((7870, 'm_mark'), (1832, 'visible'), (4084, 'checkCanUpgrade')):
        if names[index] != name:
            raise ValueError('Unexpected forge reminder symbols')
    changes = []
    for mid in sorted(METHODS):
        start, size, limits = bodies[mid]
        code = abc[start:start + size]
        if mid == 6167:
            # Keep the call: it also refreshes the marks inside the Combin page.
            if size == 240 and code[83:92] == bytes.fromhex('46f41f00292761a80e'):
                original, _ = relocate(code, [(87, 89, b'')])
                if hashlib.sha256(original).hexdigest() == ORIGINAL_HASHES[mid]:
                    continue
            if hashlib.sha256(code).hexdigest() != ORIGINAL_HASHES[mid]:
                raise ValueError('Unexpected forge opening reminder')
            updated, moved = relocate(code, [(87, 87, b'\x29\x27')])
        else:
            # Material updates and successful synthesis share this assignment.
            if size == 82 and code[67:68] == b'\x27':
                original = code[:67] + b'\xd1' + code[68:]
                if hashlib.sha256(original).hexdigest() == ORIGINAL_HASHES[mid]:
                    continue
            if hashlib.sha256(code).hexdigest() != ORIGINAL_HASHES[mid]:
                raise ValueError('Unexpected forge update reminder')
            updated, moved = relocate(code, [(67, 68, b'\x27')])
        instructions(updated)
        reader = ABCReader(abc)
        reader.pos = start + size
        exceptions = []
        for _ in range(reader.u30()):
            row = [reader.u30() for _ in range(5)]
            exceptions.append([moved(p) for p in row[:3]] + row[3:])
        header = b''.join(encode_u30(v) for v in (mid, *limits, size))
        if abc[start - len(header):start] != header:
            raise ValueError('Unexpected method header')
        value = b''.join(encode_u30(v) for v in (mid, *limits, len(updated))) + updated
        value += encode_u30(len(exceptions))
        value += b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start - len(header), reader.pos, value))
    if not changes:
        return source
    result = bytearray(abc)
    for start, end, value in reversed(changes):
        result[start:end] = value
    _, _, after = inspect_abc(result)
    for mid, (start, size, limits) in bodies.items():
        new_start, new_size, new_limits = after[mid]
        if limits != new_limits or (mid not in METHODS and
                abc[start:start + size] != result[new_start:new_start + new_size]):
            raise ValueError('Unrelated client method changed')
    restored = bytearray(result)
    shift = 0
    undo = []
    for start, end, value in changes:
        undo.append((start + shift, start + shift + len(value), abc[start:end]))
        shift += len(value) - (end - start)
    for start, end, value in reversed(undo):
        restored[start:end] = value
    if restored != abc:
        raise ValueError('Unrelated ABC metadata changed')
    for pos in positions:
        result[pos] = 0
    swf = data[:tag + 2] + struct.pack('<I', a - payload + len(result)) + data[payload:a] + result + data[b:]
    swf = swf[:4] + struct.pack('<I', len(swf)) + swf[8:]
    if swf[8:tag] != data[8:tag] or swf[a + len(result):] != data[b:]:
        raise ValueError('Unrelated SWF resources changed')
    return swf[:8] + zlib.compress(swf[8:], 9)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    updated = patch_swf(source)
    if patch_swf(updated) != updated:
        raise ValueError('Non-idempotent forge reminder patch')
    if args.check:
        if updated != source:
            raise ValueError('Forge Combin tab reminder is still enabled')
    elif updated != source:
        CLIENT.write_bytes(updated)
    print('Forge Combin tab reminder disabled; page reminders and other resources preserved.')
