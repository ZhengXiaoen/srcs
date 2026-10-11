"""Retire Wanfu's treasure shop/rebate and Spring's hunt rebate in the client.

Remove page construction, navigation, requests and reminders. Preserve all
other ABC records, graphics and packed resources. --check performs no writes.
"""
from __future__ import annotations

import argparse
import struct
import zlib

from patch_activity_entries import q, strings_of
from patch_activity_reminders import Code, call, get, number, prop, normalize, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import Node, read_cbp, write_cbp, read_pack, write_pack
from patch_retired_festival_pages import CLIENT
from patch_unique_activity_rankings import arrays, bindings, definitions, pushes, replace

BASELINE = 'c7a0ac1'
METHODS = {5903,5906,6021,6022,6023,6026,6027,6032,6042,6403,6408}
SPRING_BUTTONS = (1,2,3,8,10)
WANFU_BUTTONS = (0,1,2,3,10,11)
SWITCHES = {'SpringFestivalCfg.cbp': ('hunt_times',),
            'treasurehuntcfg.cbp': ('hunt_times','shop')}


def spring_constructor(code, strings):
    updated,_ = definitions(code,strings,['_loaderbasebutton_12'])
    updated,_ = bindings(updated,{7454})
    updated,_ = pushes(updated,7454)
    # Remove the rebate mark together with its page reference and attachment.
    ops=instructions(updated)
    at=next(i for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(7467,))
    end=next(i for i in range(at,len(ops)) if ops[i].opcode==0x61 and ops[i].operands==(4015,))
    updated,_=relocate(updated,[(ops[at-3].start,ops[end].end,b'')])
    return arrays(updated,18083,6)


def spring_clicked():
    c=Code();c.add(b'\xd0\x30'+prop(get(1),43310)+q(0x63,2))
    c.add(get(2));c.branch(0x12,'return')
    for page,button in enumerate(SPRING_BUTTONS):
        c.add(get(2)+prop(get(0),7442+button));c.branch(0x14,f'next{page}')
        c.add(prop(get(0),7458)+number(page)+q(0x61,15595));c.branch(0x10,'select')
        c.label(f'next{page}')
    c.branch(0x10,'return');c.label('select')
    c.add(prop(get(0),7461));c.branch(0x12,'selected')
    c.add(call(prop(get(0),7461),15987,b'\x27',void=True))
    c.label('selected');c.add(get(0)+get(2)+q(0x68,7461)+call(get(2),15987,b'\x26',void=True))
    c.label('return');c.add(b'\x47')
    return c.finish(),lambda p:p


def wanfu_constructor(code, strings):
    updated,_=definitions(code,strings,['_loaderbasebutton_13','_loaderbasebutton_14'])
    updated,_=arrays(updated,18658,8)
    return arrays(updated,18857,7)


def wanfu_children(code):
    updated,_=pushes(code,7635)
    updated,_=pushes(updated,7636)
    ops=instructions(updated)
    at=next(i for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(7657,))
    end=next(i for i in range(at,len(ops)) if ops[i].opcode==0x4f and ops[i].operands==(1868,1))
    return relocate(updated,[(ops[at-3].start,ops[end].end,b'')])


def hunt_listener(code):
    ops=instructions(code);edits=[]
    for i,o in enumerate(ops):
        if o.opcode==0x66 and o.operands==(7669,):
            block=ops[i-4:i+2]
            if [v.opcode for v in block]!=[0x60,0x60,0x66,0xd0,0x66,0x4f]:
                raise ValueError('Unexpected rebate listener')
            edits.append((block[0].start,block[-1].end,b''))
    if len(edits)!=1:raise ValueError('Expected one rebate listener')
    return relocate(code,edits)


def wanfu_added(code):
    updated,_=hunt_listener(code)
    updated,_=replace(updated,prop(get(0),7657)+b'\x27'+q(0x61,1832),b'')
    ops=instructions(updated)
    at=next(i for i,o in enumerate(ops) if o.opcode==0x66 and o.operands==(3850,))
    end=next(i for i in range(at,len(ops)) if ops[i].opcode==0x4f and ops[i].operands==(7669,1))
    return relocate(updated,[(ops[at-2].start,ops[end].end,b'')])


def wanfu_nav():
    c=Code();c.add(b'\xd0\x30')
    kept=(0,1,2,3,8,10)
    for index,old in enumerate(kept):
        c.add(get(1)+number(old));c.branch(0x14,f'next{old}')
        c.add(get(0)+number(index)+q(0x4e,1856,1)+get(0)+number(index)+q(0x68,7677))
        c.branch(0x10,'return');c.label(f'next{old}')
    c.label('return');c.add(b'\x47')
    return c.finish(),lambda p:p


def no_hunt_effect(code):
    marker=prop(q(0x60,1740),32329,11369,14702)
    start=code.index(marker)
    # Keep the no-reward jump as well as the shared ready target. Falling through
    # to that target would light the main entry even without a claimable reward.
    ops=instructions(code)
    ready=next(i for i,o in enumerate(ops) if o.start>start and
        o.opcode==0x26 and ops[i+1].opcode==0x63 and ops[i+1].operands==(5,))
    if ops[ready-1].opcode!=0x10:raise ValueError('Missing no-reward effect jump')
    end=ops[ready-1].start
    return relocate(code,[(start,end,b'')])


def no_hunt_request(code):
    return replace(code,call(q(0x60,11028),37707,number(0),number(17),void=True),b'')


def patch_swf(source):
    data,(tag,payload,a,b)=abc_section(source);abc,positions=normalize(data[a:b])
    _,_,bodies=inspect_abc(abc);strings=strings_of(abc)
    start,size,_=bodies[6032]
    if abc[start:start+size]==b'\xd0\x30\x47':
        start,size,_=bodies[5906]
        if abc[start:start+size]!=spring_clicked()[0]:raise ValueError('Incomplete hunt page retirement')
        return source
    transforms={5903:lambda c:spring_constructor(c,strings),5906:lambda c:spring_clicked(),
        6021:lambda c:wanfu_constructor(c,strings),6022:lambda c:bindings(c,{7635,7636}),
        6023:wanfu_children,6026:wanfu_added,6027:hunt_listener,
        6032:lambda c:(b'\xd0\x30\x47',lambda p:p),6042:lambda c:wanfu_nav(),
        6403:no_hunt_effect,6408:no_hunt_request}
    changes=[]
    for mid,transform in transforms.items():
        start,size,limits=bodies[mid];updated,moved=transform(abc[start:start+size]);instructions(updated)
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
    restored=bytearray(result);shift=0;undo=[]
    for start,end,value in sorted(changes):
        undo.append((start+shift,start+shift+len(value),abc[start:end]));shift+=len(value)-(end-start)
    for start,end,value in reversed(undo):restored[start:end]=value
    if restored!=abc:raise ValueError('Unrelated ABC records changed')
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
            if len(flags)!=1 or flags[0].kind!=1 or flags[0].value!=b'\0'*8:
                raise ValueError('Unexpected hunt activity switch')
        else:node.children.append(Node('isOpen',1,b'\0'*8));changed=True
    return write_cbp(header,root) if changed else source


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--check',action='store_true')
    args=parser.parse_args();source=CLIENT.read_bytes();updated=patch_swf(source)
    if patch_swf(updated)!=updated:raise ValueError('Non-idempotent SWF patch')
    outputs=[(CLIENT,source,updated)]
    directory=CLIENT.parent/'v2/lang/zh-cn';packpath=directory/'zh-cn.dat'
    pack=packpath.read_bytes();entries=read_pack(pack)
    if write_pack(entries)!=pack:raise ValueError('Language pack did not round-trip')
    for name in SWITCHES:
        path=directory/name;source=path.read_bytes();updated=patch_config(source,name)
        indexes=[i for i,(key,_) in enumerate(entries) if key==name]
        if len(indexes)!=1 or entries[indexes[0]][1]!=source:raise ValueError('Standalone/packed config differs')
        entries[indexes[0]]=(name,updated);outputs.append((path,source,updated))
    outputs.append((packpath,pack,write_pack(entries)))
    if args.check:
        if any(old!=new for _,old,new in outputs):raise ValueError('Hunt page retirement needs synchronization')
    else:
        for path,old,new in outputs:
            if old!=new:path.write_bytes(new)
    print('Three hunt/shop pages, reminders, navigation and packed switches synchronized.')


if __name__=='__main__':main()
