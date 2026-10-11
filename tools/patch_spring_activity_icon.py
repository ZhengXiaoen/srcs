"""Move the Spring Festival entry to the first row, including deferred opening.

Only two boolean instructions change. Method lengths, branch destinations,
constant pools, graphics, and other SWF resources remain byte-identical.
"""
from __future__ import annotations

import hashlib
from pathlib import Path
import zlib

from patch_activity_entries import q
from patch_activity_reminders import normalize
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / 'web/GameFrame.swf'
METHODS = {6440}
BASELINE = '460692a'
ORIGINAL_HASH = 'c2b13ff20cfac33dcf3981369a6378c4dc413fdb0d66c1febee742d178a6196f'
ROW_FLAGS = (174, 303)


def patch_swf(source: bytes) -> bytes:
    data, (_, _, start, end) = abc_section(source)
    abc, _ = normalize(data[start:end])
    names, traits, bodies = inspect_abc(abc, 'NavTopRightArea')
    if traits['activeChange'] != (6440, 8251):
        raise ValueError('Unexpected activity entry method')
    if names[44568] != 'isUp' or names[38258] != 'Right_Top_NewYear':
        raise ValueError('Unexpected Spring Festival row fields')
    offset, size, _ = bodies[6440]
    code = bytearray(abc[offset:offset + size])
    if any(code[pos] not in (0x26, 0x27) for pos in ROW_FLAGS):
        raise ValueError('Unexpected row instructions')
    original = bytearray(code)
    for pos in ROW_FLAGS:
        original[pos] = 0x27
    if hashlib.sha256(original).hexdigest() != ORIGINAL_HASH:
        raise ValueError('Activity entry method differs from inspected release')
    if code[171:174] != q(0x2c, 3208) or code[304:306] != b'\x63\x05':
        raise ValueError('Spring Festival row flags moved')
    if all(code[pos] == 0x26 for pos in ROW_FLAGS):
        return source
    for pos in ROW_FLAGS:
        code[pos] = 0x26
    before = instructions(original)
    after = instructions(code)
    if [(o.start, o.end, o.branches) for o in before] != [(o.start, o.end, o.branches) for o in after]:
        raise ValueError('Activity entry branch layout changed')
    result = bytearray(data)
    for pos in ROW_FLAGS:
        result[start + offset + pos] = 0x26
    if [i for i, (a, b) in enumerate(zip(data, result, strict=True)) if a != b] != [start + offset + p for p in ROW_FLAGS]:
        raise ValueError('Unrelated SWF data changed')
    return bytes(result[:8]) + zlib.compress(result[8:], 9)


if __name__ == '__main__':
    source = CLIENT.read_bytes()
    updated = patch_swf(source)
    if updated != source:
        CLIENT.write_bytes(updated)
    print('Spring Festival entry uses the first row; patch is idempotent.')
