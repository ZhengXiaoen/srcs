"""Hide Spring greeting and treasure tabs without changing their reward data."""
from __future__ import annotations

import struct
import zlib

from patch_retired_festival_pages import CLIENT, compact_definitions
from patch_activity_entries import q, strings_of
from patch_activity_reminders import Code, call, get, number, prop, put, normalize, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_unique_activity_rankings import arrays, bindings, definitions, pushes, replace

BASELINE = '3369a99'
METHODS = {5903, 5904, 5906}
BUTTONS = (1, 2, 3, 8, 10, 12)


def constructor(code, strings):
    # The first button follows the parent sprite's childCom key; preserve that parent metadata.
    ops = instructions(code)
    at = next(i for i,o in enumerate(ops) if o.opcode == 0x2c and strings[o.operands[0]] == '_loaderbasebutton_0')
    child = max(i for i in range(at) if ops[i].opcode == 0x2c and strings[ops[i].operands[0]] == 'childCom')
    end = next(i for i in range(at,len(ops)) if ops[i].opcode == 0x55)
    build = next(o for o in ops[end+1:] if o.opcode == 0x56)
    changed, _ = relocate(code,[(ops[child+1].start,ops[end].end,b''),
        (build.start,build.end,q(0x56,build.operands[0]-1))])
    changed, _ = definitions(changed, strings, ['_loaderbasebutton_6'])
    changed, _ = bindings(changed, {7442, 7448})
    for field in (7442, 7448): changed, _ = pushes(changed, field)
    for page in (17989, 17983): changed, _ = arrays(changed, page)
    # The dynamic treasure classes and their daily replacement are no longer displayed.
    ops = instructions(changed)
    end = next(i for i,o in enumerate(ops) if o.opcode == 0x68 and o.operands == (7468,))
    start = end - 6
    if ops[start].opcode != 0xd0 or ops[end-1].operands != (4,):
        raise ValueError('Unexpected treasure class array')
    edits = [(ops[start].start, ops[end].end, b'')]
    start = next(i for i,o in enumerate(ops) if o.opcode == 0x62 and o.operands == (5,) and
        changed[o.start:o.start+4] == get(5)+number(4))
    end = next(i for i in range(start+1,len(ops)) if ops[i].opcode == 0xc2 and ops[i].operands == (5,))
    edits.append((ops[start].start, ops[end].start, b''))
    changed, _ = relocate(changed, edits)
    changed, _ = replace(changed, get(0)+prop(get(0),7442)+q(0x68,7461),
                         get(0)+prop(get(0),7443)+q(0x68,7461))
    for old,new in ((1,0),(3,2),(7,5)):
        changed, _ = replace(changed, prop(get(0),7458)+number(old)+q(0x46,15593,1),
                             prop(get(0),7458)+number(new)+q(0x46,15593,1))
    return compact_definitions(changed,strings,{f'_loaderbasebutton_{v}':i for i,v in enumerate(BUTTONS)},148,45)


def added(code):
    ops = instructions(code)
    start = next(i for i,o in enumerate(ops) if o.opcode == 0x62 and o.operands == (7,) and
        code[o.start:o.start+4] == get(7)+number(4))
    end = next(i for i in range(start+1,len(ops)) if ops[i].opcode == 0xd0 and
        [v.opcode for v in ops[i:i+5]] == [0xd0,0x66,0x62,0x46,0x60] and
        ops[i+3].operands == (15593,1) and ops[i+4].operands == (901,))
    return relocate(code,[(ops[start].start,ops[end].start,b'')])


def clicked(_):
    c=Code();c.add(b'\xd0\x30'+prop(get(1),43310)+put(2))
    c.add(get(2));c.branch(0x12,'return')
    for page,button in enumerate(BUTTONS):
        c.add(get(2)+prop(get(0),7442+button));c.branch(0x14,f'next_{page}')
        c.add(prop(get(0),7458)+number(page)+q(0x61,15595));c.branch(0x10,'select')
        c.label(f'next_{page}')
    c.branch(0x10,'return')
    c.label('select');c.add(prop(get(0),7461));c.branch(0x12,'selected')
    c.add(call(prop(get(0),7461),15987,b'\x27',void=True))
    c.label('selected');c.add(get(0)+get(2)+q(0x68,7461)+call(get(2),15987,b'\x26',void=True))
    c.label('return');c.add(b'\x47');return c.finish(),lambda p:p


def patch_swf(source):
    data,(tag,payload,a,b)=abc_section(source);abc,positions=normalize(data[a:b])
    _,_,bodies=inspect_abc(abc,'NewYearWin');strings=strings_of(abc)
    offset,size,_=bodies[5906]
    if abc[offset:offset+size]==clicked(None)[0]:return source
    changes=[]
    for mid,transform in {5903:lambda c:constructor(c,strings),5904:added,5906:clicked}.items():
        start,size,limits=bodies[mid];updated,moved=transform(abc[start:start+size]);instructions(updated)
        reader=ABCReader(abc);reader.pos=start+size;exceptions=[]
        for _ in range(reader.u30()):
            row=[reader.u30() for _ in range(5)];exceptions.append([moved(p) for p in row[:3]]+row[3:])
        header=b''.join(encode_u30(v) for v in (mid,*limits,size))
        if abc[start-len(header):start]!=header:raise ValueError('Unexpected method header')
        replacement=b''.join(encode_u30(v) for v in (mid,*limits,len(updated)))+updated
        replacement+=encode_u30(len(exceptions))+b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start-len(header),reader.pos,replacement))
    result=bytearray(abc)
    for start,end,value in sorted(changes,reverse=True):result[start:end]=value
    restored=bytearray(result);shift=0;undo=[]
    for start,end,value in sorted(changes):
        undo.append((start+shift,start+shift+len(value),abc[start:end]));shift+=len(value)-(end-start)
    for start,end,value in reversed(undo):restored[start:end]=value
    if restored!=abc:raise ValueError('Unrelated ABC data changed')
    for pos in positions:result[pos]=0
    swf=data[:tag+2]+struct.pack('<I',a-payload+len(result))+data[payload:a]+result+data[b:]
    swf=swf[:4]+struct.pack('<I',len(swf))+swf[8:]
    if swf[8:tag]!=data[8:tag] or swf[a+len(result):]!=data[b:]:raise ValueError('Unrelated SWF resources changed')
    return swf[:8]+zlib.compress(swf[8:],9)


if __name__=='__main__':
    source=CLIENT.read_bytes();updated=patch_swf(source)
    if patch_swf(updated)!=updated:raise ValueError('Non-idempotent patch')
    if source!=updated:CLIENT.write_bytes(updated)
    print('Spring greeting and treasure display hidden; retained pages synchronized.')
