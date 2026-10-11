"""Reuse Wanfu pages and activate only the selected page's events and queries."""
from __future__ import annotations

import struct
import zlib

from patch_activity_reminders import Code, call, get, number, prop, put, normalize, relocate
from patch_activity_entries import q
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_retired_festival_pages import CLIENT

BASELINE = '8d60e11'
METHODS = {6023, 6024, 6025, 6026, 6027, 6039, 6040, 6041, 18059}
CTRL = prop(get(0),7645)
ACTIVE = prop(CTRL,15596)


def children(code):
    changed,moved=relocate(code,[(451,505,b''),(521,527,b'')])
    return changed,moved


def reset(_):
    c=Code();c.add(b'\xd0\x30'+CTRL);c.branch(0x12,'create')
    c.add(prop(get(0),7643));c.branch(0x12,'detach')
    c.add(call(ACTIVE,3113,void=True)+call(prop(get(0),7643),15987,b'\x27',void=True))
    c.label('detach');c.add(call(get(0),1869,CTRL,void=True))
    c.label('create')
    c.add(get(0)+b'\x20'+q(0x68,7643)+get(0)+number(-1)+q(0x68,7644))
    c.add(get(0)+b'\x20'+q(0x68,7661))
    c.add(get(0)+q(0x5d,303)+q(0x4a,303,0)+q(0x68,7645))
    c.add(call(CTRL,1631,number(306),number(181),void=True))
    c.add(q(0x5d,1868)+CTRL+q(0x4f,1868,1))
    c.add(CTRL+b'\x27'+q(0x61,1619)+CTRL+b'\x26'+q(0x61,1620)+b'\x47')
    return c.finish(),lambda p:p


def init(code):
    # Choose the current variant in an existing local, then compare its array identity.
    selection=[]
    ops=instructions(code)
    for i,o in enumerate(ops):
        if o.opcode==0x68 and o.operands==(7661,):
            selection.append((ops[i-3].start,o.end,prop(get(0),ops[i-1].operands[0])+put(2)))
    selected,_=relocate(code,selection)
    ops=instructions(selected)
    cutoff=next(o.start for i,o in enumerate(ops) if o.opcode==0xd0 and i+1<len(ops) and
        ops[i+1].opcode==0x66 and ops[i+1].operands==(7661,) and
        ops[i+2].opcode==0x66 and ops[i+2].operands==(3237,))
    original_loop=code[127:]
    # The selection's branches already land at the end of this prefix.
    c=Code();c.add(selected[:cutoff]+get(2)+prop(get(0),7661));c.branch(0x14,'build')
    # Arrays support named properties: remember the duration without adding a class slot.
    duration=q(0x60,7620)+q(0x66,35309)
    day=q(0x60,7620)+q(0x66,3346)
    c.add(prop(get(2),35309)+duration);c.branch(0x14,'build')
    c.add(prop(get(2),3346)+day);c.branch(0x13,'return')
    c.label('build')
    c.add(call(get(0),7660,void=True)+get(0)+get(2)+q(0x68,7661))
    c.add(prop(get(0),7661)+duration+q(0x61,35309))
    c.add(prop(get(0),7661)+day+q(0x61,3346))
    # Retain the original construction, buttons and reminder attachment loop.
    c.add(original_loop[:-1]);c.label('return');c.add(b'\x47')
    return c.finish(),lambda p:p


def added(code):
    # Eliminate unconditional controller rebuild, hidden-page init and duplicate layout timers.
    c=Code()
    # Window marks must reflect cached server replies, even for pages not yet visited.
    for field in (7651,7652,7653,7655,7657):c.add(prop(get(0),field)+b'\x27'+q(0x61,1832))
    c.add(call(get(0),7672,b'\x20',void=True)+call(get(0),7671,b'\x20',void=True))
    state=q(0x60,1507)+q(0x66,31272)
    cfg=q(0x60,1740)+q(0x66,32205)+q(0x66,11369)+q(0x66,14703)+q(0x66,3237)
    for field in (3845,3371):
        c.add(prop(state,field,3237)+cfg);c.branch(0x15,'haoli')
    c.add(call(get(0),7670,b'\x20',void=True))
    c.label('haoli');c.add(prop(state,3850));c.branch(0x12,'done')
    c.add(call(get(0),7669,b'\x20',void=True))
    c.label('done');cached=c.finish()
    return relocate(code,[(217,222,b''),(235,301,b''),(301,307,cached+code[301:307]),(307,326,b'')])


def removed(code):
    c=Code();c.add(code[:217]+prop(get(0),7643));c.branch(0x12,'return')
    c.add(call(ACTIVE,3113,void=True)+call(prop(get(0),7643),15987,b'\x27',void=True))
    c.add(get(0)+b'\x20'+q(0x68,7643))
    c.label('return');c.add(b'\x47');return c.finish(),lambda p:p


def clicked(_):
    c=Code();c.add(b'\xd0\x30'+get(1));c.branch(0x12,'return')
    c.add(prop(get(1),43310)+put(2)+get(2));c.branch(0x12,'return')
    c.add(get(0)+call(prop(get(0),7642),43280,get(2))+q(0x68,7677))
    c.label('return');c.add(b'\x47');return c.finish(),lambda p:p


def selected(_):
    c=Code();c.add(b'\xd0\x30'+get(1)+number(0));c.branch(0x15,'return')
    c.add(get(1)+prop(get(0),7642,3237));c.branch(0x18,'return')
    c.add(get(1)+prop(get(0),7644));c.branch(0x14,'change')
    c.add(prop(get(0),7643));c.branch(0x11,'return')
    c.label('change');c.add(get(0)+get(1)+q(0x68,7644)+call(get(0),7678,void=True))
    c.label('return');c.add(b'\x47');return c.finish(),lambda p:p


def change(_):
    c=Code();c.add(b'\xd0\x30'+prop(get(0),7643));c.branch(0x12,'activate')
    c.add(call(ACTIVE,3113,void=True)+call(prop(get(0),7643),15987,b'\x27',void=True))
    c.label('activate');c.add(CTRL+prop(get(0),7644)+q(0x61,15595))
    c.add(get(0)+prop(get(0),7642)+prop(get(0),7644)+q(0x66,44442)+q(0x68,7643))
    c.add(call(prop(get(0),7643),15987,b'\x26',void=True))
    c.add(call(ACTIVE,3112,void=True)+call(ACTIVE,2070,void=True)+b'\x47')
    return c.finish(),lambda p:p


def recharge_removed(code):
    ops=instructions(code)
    found=[o for o in ops if o.opcode==0x4f and o.operands==(13671,2)]
    if len(found)!=1:raise ValueError('Unexpected recharge removal listener')
    o=found[0];return relocate(code,[(o.start,o.end,q(0x4f,13672,2))])


def patch_swf(source):
    data,(tag,payload,a,b)=abc_section(source);abc,positions=normalize(data[a:b])
    _,_,bodies=inspect_abc(abc,'QingDianActiveWin')
    start,size,_=bodies[6041]
    if abc[start:start+size]==change(None)[0]:
        for mid,expected in ((6024,reset(None)[0]),(6039,clicked(None)[0]),(6040,selected(None)[0])):
            start,size,_=bodies[mid]
            if abc[start:start+size]!=expected:raise ValueError('Incomplete Wanfu opening patch')
        return source
    changes=[]
    transforms={6023:children,6024:reset,6025:init,6026:added,6027:removed,
        6039:clicked,6040:selected,6041:change,18059:recharge_removed}
    for mid,transform in transforms.items():
        start,size,limits=bodies[mid];updated,moved=transform(abc[start:start+size]);instructions(updated)
        if mid==6041:limits=(max(limits[0],3),*limits[1:])
        reader=ABCReader(abc);reader.pos=start+size;exceptions=[]
        for _ in range(reader.u30()):
            row=[reader.u30() for _ in range(5)];exceptions.append([moved(p) for p in row[:3]]+row[3:])
        old_limits=bodies[mid][2];header=b''.join(encode_u30(v) for v in (mid,*old_limits,size))
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
    if updated!=source:CLIENT.write_bytes(updated)
    print('Wanfu reuses pages, initializes only the active tab and removes recharge listeners correctly.')
