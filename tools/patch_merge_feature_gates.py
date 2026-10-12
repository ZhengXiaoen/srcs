"""Open permanent accessory features through the shipped treasure window.

The ornament page already lives in BaoWu.swf. Merge its code library into the main
client without copying or changing any artwork or item/reward configuration.
Keep ornaments in BaoWu, remove the duplicate forge tab, and preserve the
forge's special soul-injection navigation link.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import struct
import subprocess
import tempfile
import zlib

from patch_activity_entries import q
from patch_activity_reminders import relocate
from patch_auto_medicine_frequency import Block
from patch_appearance_upgrade import extend_pools, inspect_abc
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions as basic_instructions


def instructions(code):
    # Decode setsuper using the identical multiname operand of getproperty.
    from dataclasses import replace
    import re
    data=bytearray(code);super_properties=set()
    while True:
        try:
            return [replace(op,opcode=5) if op.start in super_properties else op
                    for op in basic_instructions(data)]
        except ValueError as error:
            match=re.fullmatch(r'Uninspected AVM2 opcode 0x5 at (\d+)',str(error))
            if not match:raise
            pos=int(match[1]);data[pos]=0x66;super_properties.add(pos)

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / 'web/GameFrame.swf'
MODULE = ROOT / 'web/v2/modules/baowu/BaoWu.swf'
METHODS = {6166, 6173, 12527, 12529, 19911, 21699}
TITLE = "<textformat leading='7'>饰<BR>品</textformat>"


def assemble(source, abc):
    data, (tag, payload, start, end) = abc_section(source)
    result = (data[:tag + 2] + struct.pack('<I', start - payload + len(abc))
              + data[payload:start] + abc + data[end:])
    result = result[:4] + struct.pack('<I', len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(abc):] != data[end:]:
        raise ValueError('Unrelated SWF resources changed')
    return result[:8] + zlib.compress(result[8:], 9)


def import_library(source, java, ffdec):
    data, (_, _, _, end) = abc_section(source)
    module, (_, _, start, stop) = abc_section(patch_module(MODULE.read_bytes()))
    old_names, old_classes, old_bodies = inspect_abc(data[abc_section(source)[1][2]:end])
    library_names, library_classes, library_bodies = inspect_abc(module[start:stop])
    if set(old_classes) & set(library_classes):
        raise ValueError('Unexpected duplicate module class')
    library = struct.pack('<I', 1) + b'forge-ornament\0' + module[start:stop]
    tag = struct.pack('<HI', (82 << 6) | 63, len(library)) + library
    intermediate = data[:end] + tag + data[end:]
    intermediate = intermediate[:4] + struct.pack('<I', len(intermediate)) + intermediate[8:]
    with tempfile.TemporaryDirectory(prefix='SRCS-ForgeLibrary-') as directory:
        src = Path(directory) / 'library.swf'
        dst = Path(directory) / 'merged.swf'
        src.write_bytes(intermediate[:8] + zlib.compress(intermediate[8:], 9))
        subprocess.run([str(java), '-jar', str(ffdec), '-abcmerge', str(dst), str(src)], check=True)
        merged = dst.read_bytes()
    out, (_, _, a, b) = abc_section(merged)
    abc = out[a:b]
    names, classes, bodies = inspect_abc(abc)
    original = data[abc_section(source)[1][2]:end]
    if names[:len(old_names)] != old_names or len(classes) != len(old_classes) + len(library_classes):
        raise ValueError('Original names or classes changed during library import')
    for mid, (s, n, limits) in old_bodies.items():
        ns, nn, nl = bodies[mid]
        if limits != nl or original[s:s+n] != abc[ns:ns+nn]:
            raise ValueError(f'Original method {mid} changed during library import')
    # All imported method counts must be accounted for by the existing module.
    if len(bodies) != len(old_bodies) + len(library_bodies):
        raise ValueError('Unexpected imported methods')
    return assemble(source, abc)


def replace_body(abc, mid, code, limits, transform):
    _, _, bodies = inspect_abc(abc)
    start, size, old_limits = bodies[mid]
    old = abc[start:start+size]
    if old == code:
        return abc
    reader = ABCReader(abc); reader.pos = start + size
    exceptions = []
    for _ in range(reader.u30()):
        row = [reader.u30() for _ in range(5)]
        exceptions.append([transform(x) for x in row[:3]] + row[3:])
    header = b''.join(encode_u30(x) for x in (mid, *old_limits, size))
    if abc[start-len(header):start] != header:
        raise ValueError('Unexpected method header')
    value = b''.join(encode_u30(x) for x in (mid, *limits, len(code))) + code
    value += encode_u30(len(exceptions))
    value += b''.join(encode_u30(x) for row in exceptions for x in row)
    return abc[:start-len(header)] + value + abc[reader.pos:]


def patch_main(source, java=None, ffdec=None):
    data, (_, _, a, b) = abc_section(source)
    names, classes, bodies = inspect_abc(data[a:b])
    if 'EquipBoostOrnamentPage' not in classes:
        if not java or not ffdec:
            raise ValueError('The ornament page library has not been imported')
        source = import_library(source, java, ffdec)
        data, (_, _, a, b) = abc_section(source)
    original = data[a:b]
    abc, strings, added = extend_pools(original, [TITLE],
                                     [('view.game.equipBoost.pageII', 'EquipBoostOrnamentPage')])
    ornament = added['EquipBoostOrnamentPage']
    names, _, bodies = inspect_abc(abc)
    for index, name in {1507:'GlobalData', 1561:'GlobalFunc', 5298:'combineDay',
                        31840:'sectionOpenDays', 43315:'push', 7870:'m_mark',
                        7868:'m_pageCaptions', 7869:'m_pageClass', 43280:'indexOf',
                        43682:'unshift', 19740:'EquipBoostZhuLingPage'}.items():
        if names[index] != name:
            raise ValueError(f'Unexpected symbol {index}: {names[index]}')
    for mid in sorted(METHODS):
        start, size, limits = bodies[mid]
        code = abc[start:start+size]
        edits = []
        if mid == 6166:
            # BaoWu already provides ornaments. Remove both the duplicate
            # caption and page class, including their page-count increment.
            entry = (b'\xd0' + q(0x66, 7868) + q(0x2c, strings[TITLE]) + q(0x4f, 43682, 1)
                     + b'\xd0' + q(0x66, 7869) + q(0x60, ornament) + q(0x4f, 43315, 1)
                     + b'\xc2\x01')
            legacy = entry.replace(q(0x4f, 43682, 1), q(0x4f, 43315, 1), 1)
            matches = [value for value in (entry, legacy) if value in code]
            if matches:
                if len(matches) != 1 or code.count(matches[0]) != 1:
                    raise ValueError('Unexpected duplicate ornament tab')
                pos = code.index(matches[0])
                edits.append((pos, pos + len(matches[0]), b''))
            elif size != 549 or code[405:408] != b'\x24\x00\xd7':
                raise ValueError('Unexpected forge page catalog')
        elif mid == 6173:
            # @@showWin,5,10000 is the server's "我也要注灵" link.
            # Resolve the visible page index; low-level roles fall back to
            # the first page rather than retaining an invalid index of -1.
            block = Block()
            block.emit(b'\xd0' + q(0x66,7869) + q(0x60,19740)
                       + q(0x46,43280,1) + b'\x73\xd5\xd1\x24\x00')
            block.branch(0x18, 'ready')
            block.emit(b'\x24\x00\xd5')
            block.label('ready')
            target, _ = block.finish()
            if any(o.opcode == 0x66 and o.operands == (5298,) for o in instructions(code)):
                if size != 112 or code[10:19] != bytes.fromhex('60990c66b22924010f'):
                    raise ValueError('Unexpected legacy forge navigation')
                edits.append((10,74,target))
            elif code[10:10 + len(target)] != target:
                old = b'\xd0' + q(0x66,7869) + q(0x60,ornament) + q(0x46,43280,1) + b'\x73\xd5'
                if code[10:25] != old:
                    raise ValueError('Unexpected forge special navigation')
                edits.append((10,25,target))
        else:
            # Preserve every original short-circuit expression and branch offset.
            # Only its merge predicate becomes true (entry) or false (exclusion).
            predicate = q(0x60,1561)+q(0x66,5298)
            expected = {12527:2,12529:1,19911:1,21699:1}[mid]
            count = 0
            for op in instructions(code):
                if code[op.start:op.start+len(predicate)] != predicate:
                    continue
                end = op.start + len(predicate) + 3
                value = b'\x27' if mid == 21699 else b'\x26'
                if mid == 12529:
                    # Two stack operands feed the existing comparison branch.
                    end = op.start + len(predicate) + 2
                    value = b'\x24\x01\x24\x00'
                edits.append((op.start,end,value+b'\x02'*(end-op.start-len(value))))
                count += 1
            if count not in (0,expected):
                raise ValueError('Unexpected ornament merge predicate count')
        if edits:
            updated, moved = relocate(code, edits)
            instructions(updated)
            abc = replace_body(abc,mid,updated,limits,moved)
            names, _, bodies = inspect_abc(abc)
    _, _, before = inspect_abc(original); _, _, after = inspect_abc(abc)
    for mid,(s,n,l) in before.items():
        ns,nn,nl = after[mid]
        if mid not in METHODS and (l != nl or original[s:s+n] != abc[ns:ns+nn]):
            raise ValueError(f'Unrelated method {mid} changed')
    return source if abc == original else assemble(source,abc)


def patch_module(source):
    data, (_, _, a, b) = abc_section(source); abc = data[a:b]
    names, classes, bodies = inspect_abc(abc)
    mid = classes['BaoWuWin']['instance']['checkTitle'][0]
    start,size,limits = bodies[mid];code = abc[start:start+size]
    old = bytes.fromhex('60e90366eb032400ab')
    new = b'\x27'+b'\x02'*(len(old)-1)
    if old not in code:
        if new not in code: raise ValueError('Unexpected BaoWu ornament gate')
        return source
    if code.count(old) != 1: raise ValueError('Duplicate BaoWu gate')
    result = bytearray(abc);pos = start+code.index(old)
    result[pos:pos+len(old)] = new
    instructions(result[start:start+size])
    return assemble(source,bytes(result))


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check',action='store_true')
    parser.add_argument('--java',type=Path);parser.add_argument('--ffdec',type=Path)
    args=parser.parse_args()
    # Import the untouched module first so both entries reuse identical page code.
    for path,patch in [(CLIENT,lambda s:patch_main(s,args.java,args.ffdec)),(MODULE,patch_module)]:
        source=path.read_bytes();updated=patch(source)
        if patch(updated)!=updated:raise ValueError('Non-idempotent patch')
        if args.check:
            if source!=updated:raise ValueError(f'{path.name} still has merge gates')
        elif updated!=source:path.write_bytes(updated)
    print('Ornaments remain in BaoWu; duplicate forge tab removed; resources preserved.')


if __name__=='__main__':main()
