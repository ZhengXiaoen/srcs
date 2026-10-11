"""Retire four Spring Festival pages and Wanfu's collect-word page."""
from __future__ import annotations

import argparse
from pathlib import Path
import struct
import zlib

from patch_activity_entries import q, strings_of
from patch_activity_reminders import Code, call, get, number, prop, put, normalize, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import Node, read_cbp, write_cbp, read_pack, write_pack
from patch_unique_activity_rankings import arrays, bindings, definitions, pushes, replace

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / 'web/GameFrame.swf'
BASELINE = '5bf574f'
METHODS = {5903, 5904, 5906, 3326, 3328, 6021, 6022, 6023, 6025, 6026, 6027, 6038, 6042, 6403, 6408}
SPRING_BUTTONS = (0, 1, 2, 3, 6, 8, 10, 12)
SWITCHES = {'SpringFestivalCfg.cbp': ('goods', 'SpringJiZi', 'XiaoFeiZhuanPanNew'),
            'QingDianActivityCfg.cbp': ('QingDianJiZi',)}


def compact_definitions(code, strings, kept, origin_y, spacing):
    ops = instructions(code); edits = []
    for button, index in kept.items():
        at = next(i for i, o in enumerate(ops) if o.opcode == 0x2c and strings[o.operands[0]] == button
                  and i and ops[i-1].opcode == 0x2c and strings[ops[i-1].operands[0]] == 'instanceName')
        lo = max(i for i in range(at) if ops[i].opcode == 0x55)
        hi = next(i for i in range(at, len(ops)) if ops[i].opcode == 0x55)
        moves = [i+1 for i in range(lo+1, hi) if ops[i].opcode == 0x2c and strings[ops[i].operands[0]] == 'move']
        if len(moves) != 1: raise ValueError('Unexpected activity button position')
        op = ops[moves[0]]; old = strings[op.operands[0]]; x, _ = old.split(',')
        value = f'{x},{origin_y + spacing * index}'
        if value not in strings: raise ValueError(f'Missing existing coordinate {value}')
        edits.append((op.start, op.end, q(0x2c, strings.index(value))))
    return relocate(code, edits)


def spring_constructor(code, strings):
    changed, _ = definitions(code, strings, [f'_loaderbasebutton_{i}' for i in (4, 5, 7, 9)])
    changed, _ = bindings(changed, {7446, 7447, 7449, 7451})
    for field in (7446, 7447, 7449, 7451): changed, _ = pushes(changed, field)
    # Retired spin/collect marks refer to pages and buttons that no longer exist.
    ops = instructions(changed)
    a = next(i for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(7465,))
    b = next(i for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(7467,))
    changed, _ = relocate(changed, [(ops[a-3].start, ops[b-3].start, b'')])
    for page in (17966, 18123, 18042, 18115): changed, _ = arrays(changed, page)
    changed, _ = replace(changed, get(5)+number(6), get(5)+number(4))
    changed, _ = replace(changed, prop(get(0),7458)+number(11)+q(0x46,15593,1),
                         prop(get(0),7458)+number(7)+q(0x46,15593,1))
    return compact_definitions(changed, strings, {f'_loaderbasebutton_{i}':p for p,i in enumerate(SPRING_BUTTONS)}, 148, 45)


def spring_added(code):
    changed, _ = replace(code, get(7)+number(6), get(7)+number(4))
    return replace(changed, prop(get(0),7458)+number(6)+q(0x4f,15592,1),
                   prop(get(0),7458)+number(4)+q(0x4f,15592,1))


def spring_click(_):
    c=Code();c.add(b'\xd0\x30'+prop(get(1),43310)+put(2))
    c.add(get(2));c.branch(0x12,'return')
    for page,button in enumerate(SPRING_BUTTONS):
        c.add(get(2)+prop(get(0),7442+button));c.branch(0x14,f'next_{page}')
        c.add(prop(get(0),7458)+number(page)+q(0x61,15595));c.branch(0x10,'select')
        c.label(f'next_{page}')
    c.branch(0x10,'return')
    c.label('select');c.add(prop(get(0),7461));c.branch(0x12,'selected')
    c.add(call(prop(get(0),7461),15987,b'\x27',void=True))
    c.label('selected');c.add(get(0)+get(2)+q(0x68,7461)+call(get(2),15987,b'\x26',void=True))
    c.label('return');c.add(b'\x47');return c.finish(),lambda p:p


def wanfu_constructor(code, strings, page):
    changed,_=definitions(code,strings,['_loaderbasebutton_9'])
    changed,_=arrays(changed,page)
    return changed,lambda p:p


def wanfu_children(code):
    changed,_=pushes(code,7630)
    ops=instructions(changed)
    at=next(i for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(7654,))
    following=next(i for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(7655,))
    changed,_=relocate(changed,[(ops[at-3].start,ops[following-3].start,b'')])
    return replace(changed,prop(get(0),7657)+q(0x25,188)+number(8),
                   prop(get(0),7657)+q(0x25,188)+number(7))


def wanfu_attach(code):
    old=prop(get(0),7638)+prop(get(0),7654)+q(0x4f,1868,1)
    return replace(code,old,b'')


def remove_collect_listeners(code):
    ops=instructions(code);edits=[]
    for i,o in enumerate(ops):
        if o.opcode==0x66 and o.operands==(7675,):
            block=ops[i-4:i+2]
            if [o.opcode for o in block]!=[0x60,0x60,0x66,0xd0,0x66,0x4f]:raise ValueError('Unexpected collect listener')
            edits.append((block[0].start,block[-1].end,b''))
    if len(edits)!=3:raise ValueError('Missing collect listeners')
    return relocate(code,edits)


def wanfu_nav(_):
    c=Code();c.add(b'\xd0\x30');removed=(4,5,6,7,9,11,14)
    c.add(get(1)+number(0));c.branch(0x15,'return')
    c.add(get(1)+number(15));c.branch(0x18,'return')
    for old in removed:c.add(get(1)+number(old));c.branch(0x13,'return')
    for count in range(len(removed),0,-1):
        c.add(get(1)+number(removed[count-1]+1));c.branch(0x15,f'next{count}')
        c.add(get(1)+number(count)+b'\xa1\x73'+put(1));c.branch(0x10,'apply');c.label(f'next{count}')
    c.label('apply');c.add(get(0)+get(1)+q(0x4e,1856,1)+get(0)+get(1)+q(0x68,7677))
    c.label('return');c.add(b'\x47');return c.finish(),lambda p:p


def no_word_effect(code):
    ops=instructions(code)
    marker=prop(q(0x60,1740),32205,11369,23977,23953)
    start=code.index(marker)
    end=code.index(prop(q(0x60,1740),32329,11369,14702),start)
    if start not in {o.start for o in ops}:raise ValueError('Invalid collect effect block')
    return relocate(code,[(start,end,b'')])


def no_collect_request(code):
    return replace(code,call(q(0x60,11028),37707,number(0),number(8),void=True),b'')


def patch_swf(source):
    data,(tag,payload,a,b)=abc_section(source);abc,positions=normalize(data[a:b])
    n,_,bs=inspect_abc(abc,'NewYearWin');strings=strings_of(abc)
    s,l,_=bs[3326]
    if abc[s:s+l]==b'\xd0\x30\x27\x48':
        old_word,size,_=bs[3328]
        if abc[old_word:old_word+size]!=b'\xd0\x30\x27\x48':raise ValueError('Incomplete retired collect reminders')
        return source
    page=next(i for i,name in enumerate(n) if name=='QDCollectWordPage')
    transforms={5903:lambda c:spring_constructor(c,strings),5904:spring_added,5906:spring_click,
      3326:lambda c:(b'\xd0\x30\x27\x48',lambda p:p),3328:lambda c:(b'\xd0\x30\x27\x48',lambda p:p),
      6021:lambda c:wanfu_constructor(c,strings,page),6022:lambda c:bindings(c,{7630}),6023:wanfu_children,
      6025:wanfu_attach,6026:remove_collect_listeners,6027:remove_collect_listeners,
      6038:lambda c:(b'\xd0\x30\x47',lambda p:p),6042:wanfu_nav,6403:no_word_effect,6408:no_collect_request}
    changes=[]
    for mid,transform in transforms.items():
        start,size,limits=bs[mid];code=abc[start:start+size];updated,moved=transform(code);instructions(updated)
        r=ABCReader(abc);r.pos=start+size;exceptions=[]
        for _ in range(r.u30()):
            row=[r.u30() for _ in range(5)];exceptions.append([moved(p) for p in row[:3]]+row[3:])
        header=b''.join(encode_u30(v) for v in (mid,*limits,size))
        if abc[start-len(header):start]!=header:raise ValueError('Unexpected method header')
        replacement=b''.join(encode_u30(v) for v in (mid,*limits,len(updated)))+updated
        replacement+=encode_u30(len(exceptions))+b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start-len(header),r.pos,replacement))
    result=bytearray(abc)
    for start,end,value in sorted(changes,reverse=True):result[start:end]=value
    _,_,after=inspect_abc(bytes(result))
    for mid,(start,size,limits) in bs.items():
        new,length,newlimits=after[mid]
        if mid not in METHODS and (abc[start:start+size]!=result[new:new+length] or limits!=newlimits):
            raise ValueError('Unrelated activity method changed')
    restored=bytearray(result);shift=0;undo=[]
    for start,end,value in sorted(changes):
        undo.append((start+shift,start+shift+len(value),abc[start:end]));shift+=len(value)-(end-start)
    for start,end,value in reversed(undo):restored[start:end]=value
    if restored!=abc:raise ValueError('Unrelated ABC metadata changed')
    for pos in positions:result[pos]=0
    swf=data[:tag+2]+struct.pack('<I',a-payload+len(result))+data[payload:a]+result+data[b:]
    swf=swf[:4]+struct.pack('<I',len(swf))+swf[8:]
    if swf[8:tag]!=data[8:tag] or swf[a+len(result):]!=data[b:]:raise ValueError('Unrelated SWF resources changed')
    return swf[:8]+zlib.compress(swf[8:],9)


def patch_config(source,name):
    header,root=read_cbp(source);changed=False
    for field in SWITCHES[name]:
        node=root.child(field);flags=[v for v in node.children if v.name=='isOpen']
        if flags:
            if flags[0].kind!=1 or flags[0].value!=b'\0'*8:raise ValueError('Unexpected activity switch')
        else:node.children.append(Node('isOpen',1,b'\0'*8));changed=True
    return write_cbp(header,root) if changed else source


def main():
    source=CLIENT.read_bytes();updated=patch_swf(source)
    if patch_swf(updated)!=updated:raise ValueError('Non-idempotent patch')
    if source!=updated:CLIENT.write_bytes(updated)
    directory=ROOT/'web/v2/lang/zh-cn';packpath=directory/'zh-cn.dat';entries=read_pack(packpath.read_bytes());changed=False
    for name in SWITCHES:
        path=directory/name;source=path.read_bytes();updated=patch_config(source,name)
        matches=[i for i,(key,_) in enumerate(entries) if key==name]
        if len(matches)!=1 or entries[matches[0]][1]!=source:raise ValueError('Standalone/packed config differs')
        if source!=updated:path.write_bytes(updated);entries[matches[0]]=(name,updated);changed=True
    if changed:packpath.write_bytes(write_pack(entries))
    print('Retired festival pages, operations and packed config switches synchronized.')


if __name__=='__main__':main()
