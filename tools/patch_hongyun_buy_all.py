"""Keep Spring Hongyun only and add its adjacent buy-all control to the shipped SWF."""
from __future__ import annotations

import argparse
from pathlib import Path
import struct
import zlib

from patch_activity_entries import q, relocate
from patch_activity_reminders import Code, call, get, number, prop
from patch_appearance_upgrade import extend_pools, inspect_abc, pools
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_unique_activity_rankings import arrays, bindings, definitions, pushes, replace

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / 'web/GameFrame.swf'
BASELINE = 'b130530'
METHODS = {6021, 6022, 6023, 6042, 22158, 22163, 17276, 17277, 17278, 17281}


def patch_abc(original):
    names, catalog, bodies = inspect_abc(original)
    start, size, _ = bodies[17276]
    strings = pools(original)['strings'][3]
    if 'hongyunBuyAllButton' in names and q(0x2c, strings.index('一键购买')) in original[start:start+size]:
        return original
    source, texts, added = extend_pools(original,
        ['一键购买', '364,441', 'hongyunBuyAllButton',
         '按当前价格购买剩余特惠，元宝或背包不足时停止'], [('', 'hongyunBuyAllButton')])
    names, _, bodies = inspect_abc(source)
    button = prop(get(0), 18114, added['hongyunBuyAllButton'])

    def constructor(code):
        ops = instructions(code)
        marker = next(i for i,o in enumerate(ops) if o.opcode == 0x2c and o.operands == (9213,))
        lo = max(i for i in range(marker) if ops[i].opcode == 0x55)
        hi = next(i for i in range(marker, len(ops)) if ops[i].opcode == 0x55)
        template = code[ops[lo].end:ops[hi].end]
        for before, after in ((45269, texts['一键购买']), (45268, texts['364,441']),
                              (9213, texts['hongyunBuyAllButton'])):
            if template.count(q(0x2c, before)) != 1: raise ValueError('Unexpected button template')
            template = template.replace(q(0x2c, before), q(0x2c, after))
        tooltip = q(0x2c, strings.index('toolTip')) + q(0x2c, 1)
        template = template.replace(tooltip, q(0x2c, strings.index('toolTip')) +
                                    q(0x2c, texts['按当前价格购买剩余特惠，元宝或背包不足时停止']))
        build = ops[hi+1]
        if build.opcode != 0x56 or build.operands != (18,): raise ValueError('Unexpected page components')
        # The page is sealed. Retain a dynamic Object in its existing editJson slot.
        capture = (get(0) + q(0x2c, texts['hongyunBuyAllButton']) + get(1) +
                   q(0x2c, texts['hongyunBuyAllButton']) + q(0x66, 47151) +
                   q(0x55, 1) + q(0x68, 18114))
        clear = get(0) + b'\x20' + q(0x68, 18114)
        at = code.index(clear)
        return relocate(code, [(build.start, build.end, template + q(0x56, 19)),
                               (at, at+len(clear), capture)])

    def lifecycle(code, listener):
        extra = call(button, listener, prop(q(0x60, 5),33809), prop(get(0),18110), void=True)
        return relocate(code, [(2, 3, extra + code[2:3])])

    def click(_):
        c = Code(); c.add(b'\xd0\x30' + prop(get(1),43310) + button)
        c.branch(0x14, 'single')
        c.add(call(q(0x60,1787),32657,number(11),number(4),void=True) + b'\x47')
        c.label('single')
        c.add(call(q(0x60,1787),32657,number(11),number(1),void=True) + b'\x47')
        return c.finish(), lambda p:p

    def wanfu_constructor(code):
        changed, _ = definitions(code, strings, ['_loaderbasebutton_10'])
        return arrays(changed, 18636)

    def wanfu_children(code):
        changed, _ = pushes(code, 7631)
        return replace(changed, prop(get(0),7655)+number(188)+number(317),
                       prop(get(0),7655)+number(188)+number(272))

    def wanfu_nav(_):
        c = Code(); c.add(b'\xd0\x30')
        for page, old in enumerate((0,1,2,3,10)):
            c.add(get(1)+number(old)); c.branch(0x14, f'next{page}')
            c.add(get(0)+number(page)+q(0x4e,1856,1)+get(0)+number(page)+q(0x68,7677))
            c.branch(0x10,'return'); c.label(f'next{page}')
        c.label('return'); c.add(b'\x47'); return c.finish(), lambda p:p

    def year_constructor(code):
        # Preserve server protocol/page indexes for all retained anniversary pages.
        return replace(code, q(0x60,29789), b'\x20')

    def year_days(code):
        # The existing tenth-entry guard skips Hongyun after day six. Make its
        # date condition always true, retaining every other protocol/page index.
        return replace(code, prop(q(0x60,1507),31288,3394)+number(6)+b'\xaf', b'\x26')

    transforms = {17276:constructor, 17277:lambda c:lifecycle(c,13671),
        17278:lambda c:lifecycle(c,13672), 17281:click,
        6021:wanfu_constructor, 6022:lambda c:bindings(c,{7631}),
        6023:wanfu_children, 6042:wanfu_nav, 22158:year_constructor, 22163:year_days}
    changes = []
    for method, transform in transforms.items():
        start, size, limits = bodies[method]
        updated, moved = transform(source[start:start+size]); instructions(updated)
        reader = ABCReader(source); reader.pos = start+size
        exceptions = []
        for _ in range(reader.u30()):
            row = [reader.u30() for _ in range(5)]
            exceptions.append([moved(p) for p in row[:3]]+row[3:])
        header = b''.join(encode_u30(v) for v in (method,*limits,size))
        if source[start-len(header):start] != header: raise ValueError('Unexpected method header')
        # Appending one component adds one live stack value while building the JSON.
        new_limits = (limits[0]+1,*limits[1:]) if method == 17276 else limits
        value = b''.join(encode_u30(v) for v in (method,*new_limits,len(updated))) + updated
        value += encode_u30(len(exceptions)) + b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start-len(header),reader.pos,value))
    result = bytearray(source)
    for a,b,value in sorted(changes,reverse=True): result[a:b] = value
    result = bytes(result)
    _, after_catalog, after = inspect_abc(result)
    if after_catalog != catalog: raise ValueError('Unrelated class traits changed')
    for method,(a,size,limits) in inspect_abc(original)[2].items():
        b,length,new_limits = after[method]
        if method not in METHODS and (original[a:a+size] != result[b:b+length] or limits != new_limits):
            raise ValueError(f'Unrelated method changed: {method}')
    return result


def patch_swf(source):
    data,(tag,payload,a,b) = abc_section(source)
    abc = patch_abc(data[a:b])
    if abc == data[a:b]: return source
    result = data[:tag+2] + struct.pack('<I',a-payload+len(abc)) + data[payload:a] + abc + data[b:]
    result = result[:4] + struct.pack('<I',len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[a+len(abc):] != data[b:]:
        raise ValueError('Unrelated SWF graphics/resources changed')
    return result[:8] + zlib.compress(result[8:],9)


if __name__ == '__main__':
    parser=argparse.ArgumentParser(description=__doc__); parser.add_argument('--check',action='store_true')
    args=parser.parse_args(); source=CLIENT.read_bytes(); updated=patch_swf(source)
    if patch_swf(updated) != updated: raise ValueError('Patch is not idempotent')
    if args.check:
        if source != updated: raise ValueError('Hongyun client update missing')
    elif source != updated: CLIENT.write_bytes(updated)
    print('Verified Spring buy-all button and retired celebration entries; unrelated resources preserved.')
