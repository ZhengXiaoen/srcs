"""Reuse the shipped five activity pages inside the anniversary window.

The only imported library is the existing HongLi module, with private copies of
its class names. Preserve original method IDs, reward tables and artwork; check
every unrelated method and resource before writing the result.
"""
from pathlib import Path
import argparse
import struct
import subprocess
import tempfile
import zlib

from patch_activity_entries import q, strings_of
from patch_activity_reminders import (Code, get, put, prop, call, number, normalize,
                                     relocate, days_available, spin_available,
                                     GD, GAME, HONG, HONG_CFG, PAY, MONEY, YEAR)
from patch_bag_client import ABCReader, encode_u30
from patch_competition_hongli_reminders import pool_layout
from patch_drop_pickup_retry import abc_section, encode_s24
from patch_merge_feature_gates import instructions
from patch_appearance_upgrade import inspect_abc

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / 'web/GameFrame.swf'
MODULE = ROOT / 'web/v2/modules/hongli/HongLi.swf'
SLOTS = (1, 4, 7, 8, 10, 11, 12, 13, 14, 15, 16)
# Display order is independent of the original protocol/page indexes.
DISPLAY_SLOTS = (1, 8, 12, 13, 14, 16, 15, 4, 10, 7, 11)
# Original title bitmap IDs and positions from Jingji, HongLi, DaJiDaLi and QD.
TAB_ARTWORK = ((1143, 32, 11), (1301, 35, 11), (996, 30, 11),
               (840, 30, 11), (1145, 30, 11))
MERGED_EVENTS = ((331, 36051), (331, 36035), (359, 42525),
                 (331, 36018), (141, 31502), (141, 31479), (206, 40568))


def bytecode_requirements(code, names, initial_scope):
    """Check every branch as Flash does before executing a method.

    Return minimum operand stack, local-register and scope capacities. Window
    constructors include their original UI object literals after the page array;
    their peak stack can exceed the new page count.
    """
    ops = {op.start: op for op in instructions(code)}
    pending = [(0, 0, initial_scope)]; seen = {}
    maximum, locals_needed, scopes_needed = 0, 0, initial_scope
    while pending:
        pos, depth, scope = pending.pop()
        if pos in seen:
            if seen[pos] != (depth, scope):
                raise ValueError(f'Inconsistent bytecode branch at {pos}')
            continue
        seen[pos] = (depth, scope)
        op = ops[pos]; kind, args = op.opcode, op.operands
        consumed, added = 0, 0
        if 0xd0 <= kind <= 0xd3 or kind in (0x60,0x62,0x20,0x24,0x25,0x26,0x27,
                                           0x28,0x2c,0x2d,0x2e,0x2f,0x5d,0x5e,0x65,0x57):
            added = 1
        elif 0xd4 <= kind <= 0xd7 or kind in (0x63,0x29,0x30,0x1c,0x48,0x03): consumed = 1
        elif kind in (0x66,0x61,0x68,0x05):
            consumed = (1 if kind == 0x66 else 2) + int(not names[args[0]])
            added = int(kind == 0x66)
        elif kind in (0x46,0x4f,0x4e,0x4a):
            consumed, added = args[1]+1, int(kind in (0x46,0x4a))
        elif kind == 0x42: consumed, added = args[0]+1, 1
        elif kind in (0x49,0x56): consumed, added = args[0]+int(kind==0x49), int(kind==0x56)
        elif kind == 0x55: consumed, added = args[0]*2, 1
        elif kind == 0x2a: consumed, added = 1, 2
        elif kind in (0x73,0x74,0x76,0x80,0x82,0x85,0x90,0x93,0x96,0xb2,0xc0,0x58): consumed, added = 1, 1
        elif kind in (0x87,0x1e,0x23): consumed, added = 2, 1
        elif kind == 0x32: added = 1
        elif kind == 0x1b or kind in (0x11,0x12): consumed = 1
        elif 0x0c <= kind <= 0x1a and kind != 0x10: consumed = 2
        elif 0xa0 <= kind <= 0xb1: consumed, added = 2, 1
        elif kind not in (0x09,0x08,0xc2,0x47,0x10,0x1d):
            raise ValueError(f'Uninspected verifier opcode {kind:#x} at {pos}')
        if depth < consumed: raise ValueError(f'Bytecode stack underflow at {pos}')
        depth += added-consumed; maximum = max(maximum, depth)
        if kind in (0x30,0x1c): scope += 1
        elif kind == 0x1d: scope -= 1
        if scope < initial_scope: raise ValueError(f'Bytecode scope underflow at {pos}')
        if kind == 0x65 and args[0] >= scope: raise ValueError(f'Invalid scope index at {pos}')
        scopes_needed = max(scopes_needed, scope)
        registers = (args[:2] if kind == 0x32 else args[:1] if kind in (0x62,0x63,0x08,0xc2)
                     else (kind-0xd0,) if 0xd0<=kind<=0xd3
                     else (kind-0xd4,) if 0xd4<=kind<=0xd7 else ())
        if registers: locals_needed = max(locals_needed, max(registers)+1)
        if kind in (0x47,0x48,0x03):
            if depth: raise ValueError(f'Nonempty bytecode stack at return {pos}')
            continue
        targets = [target for _,target,_ in op.branches]
        if kind not in (0x10,0x1b): targets.append(op.end)
        pending.extend((target,depth,scope) for target in targets)
    return maximum, locals_needed, scopes_needed


def repair_window_stack(source):
    """Repair already-integrated clients without rebuilding or changing code."""
    raw,(_,_,a,b)=abc_section(source);abc,positions=normalize(raw[a:b])
    names,classes,bodies=inspect_abc(abc)
    mid=classes['YearActiveWin']['constructor'];start,length,limits=bodies[mid]
    required,registers,scopes=bytecode_requirements(abc[start:start+length],names,limits[2])
    if registers>limits[1] or scopes>limits[3]:raise ValueError('Unexpected window registers or scope')
    if required<=limits[0]:return source
    old=b''.join(encode_u30(v) for v in (mid,*limits,length))
    new=b''.join(encode_u30(v) for v in (mid,required,*limits[1:],length))
    if abc[start-len(old):start]!=old:raise ValueError('Unexpected window method header')
    result=bytearray(abc)
    for pos in positions:result[pos]=0
    result[start-len(old):start]=new
    return assemble(source,bytes(result))


def assemble(source, abc):
    data, (tag, payload, start, end) = abc_section(source)
    result = (data[:tag + 2] + struct.pack('<I', start - payload + len(abc))
              + data[payload:start] + abc + data[end:])
    result = result[:4] + struct.pack('<I', len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(abc):] != data[end:]:
        raise ValueError('Unrelated SWF resources changed')
    return result[:8] + zlib.compress(result[8:], 9)


def display_ids():
    original = (438,1118,994,434,1300,439,1101,591,550,1119,1102,600)
    return tuple(original[s] if s < 12 else 20000+s for s in DISPLAY_SLOTS)


def tab_renderer(prologue, empty_string):
    """Use shipped title bitmaps while keeping each activity's original index."""
    c=Code();button=prop(get(0),29712)
    c.add(prologue+button+q(0x2c,empty_string)+q(0x61,11014)+get(1)+b'\x73'+put(2))
    for i,(asset,x,y) in enumerate(TAB_ARTWORK):
        c.add(get(2)+number(20012+i));c.branch(0x14,f'next{i}')
        bitmap=call(prop(q(0x60,1042),30729),1428,number(asset))
        c.add(call(button,15981,bitmap,number(x),number(y),void=True))
        c.add(prop(get(0),29713)+call(YEAR,3373,number(12+i))+q(0x61,1832)+b'\x47')
        c.label(f'next{i}')
    c.add(get(2)+number(0));c.branch(0x16,'empty')
    c.add(call(prop(q(0x60,23804),42709),43280,get(2))+b'\x73'+put(3))
    bitmap=call(prop(q(0x60,1042),30729),1428,get(2))
    c.add(call(button,15981,bitmap,number(32),number(11),void=True))
    c.add(prop(get(0),29713)+call(YEAR,3373,get(3))+q(0x61,1832)+b'\x47')
    c.label('empty');c.add(call(button,15989,void=True)+b'\x47')
    # Code.finish's older parser does not support the original setsuper prologue.
    for pos,label in c.branches:c.code[pos:pos+3]=encode_s24(c.labels[label]-pos-3)
    return bytes(c.code)


def upgrade_tab_presentation(source):
    """Upgrade integrated clients without touching page logic or resources."""
    raw,(_,_,a,b)=abc_section(source);abc,positions=normalize(raw[a:b])
    names,_,bodies=inspect_abc(abc)
    ctor_start,ctor_size,_=bodies[22158]
    constructor=abc[ctor_start:ctor_start+ctor_size]
    # Later retirement keeps the original protocol slots but removes these
    # two pages. Do not restore their old display order on a repeated run.
    if q(0x60,18630) not in constructor and q(0x60,29738) not in constructor:
        return source
    empty_string=next(i for i,s in enumerate(strings_of(abc)) if i>0 and s=='')
    start,length,limits=bodies[28484]
    updates={28484:(tab_renderer(abc[start:start+10],empty_string),limits)}
    start,length,limits=bodies[22163];code=abc[start:start+length];ops=instructions(code)
    setter=next(i for i,o in enumerate(ops) if o.opcode==0x61 and o.operands==(6138,))
    array=ops[setter-1];count=len(DISPLAY_SLOTS);items=ops[setter-1-count:setter-1]
    if array.opcode!=0x56 or array.operands!=(count,) or any(o.opcode!=0x25 for o in items):
        raise ValueError('Unexpected anniversary tab list')
    if {o.operands[0] for o in items}!=set(display_ids()):
        raise ValueError('Anniversary tabs do not match the visible pages')
    ordered=b''.join(number(i) for i in display_ids())
    updated,_=relocate(code,[(items[0].start,array.start,ordered)])
    updates[22163]=(updated,limits)
    replacements=[]
    for mid,(updated,limits) in updates.items():
        start,length,old_limits=bodies[mid]
        if updated==abc[start:start+length]:continue
        stack,registers,scopes=bytecode_requirements(updated,names,limits[2])
        if stack>limits[0] or registers>limits[1] or scopes>limits[3]:
            raise ValueError(f'Method {mid} exceeds Flash execution capacities')
        r=ABCReader(abc);r.pos=start+length
        if r.u30():raise ValueError('Unexpected anniversary tab exception handlers')
        header=b''.join(encode_u30(v) for v in (mid,*old_limits,length))
        if abc[start-len(header):start]!=header:raise ValueError('Unexpected tab method header')
        value=b''.join(encode_u30(v) for v in (mid,*limits,len(updated)))+updated+b'\0'
        replacements.append((start-len(header),r.pos,value))
    if not replacements:return source
    result=bytearray(abc)
    for start,end,value in sorted(replacements,reverse=True):result[start:end]=value
    _,_,after=inspect_abc(result)
    for mid,(start,length,limits) in bodies.items():
        now,size,current=after[mid]
        if mid not in updates and (limits!=current or abc[start:start+length]!=result[now:now+size]):
            raise ValueError(f'Unrelated method {mid} changed')
    for pos in positions:result[pos]=0
    return assemble(source,bytes(result))


def imported_library():
    data, (_, _, a, b) = abc_section(MODULE.read_bytes())
    abc, _ = normalize(data[a:b])
    names, classes, _ = inspect_abc(abc)
    start, end, strings, _, _, _ = pool_layout(abc)
    # Rename all module-owned classes, including its three shared classes.
    renamed = [f'Anniversary{s}' if s in classes else s for s in strings[1:]]
    records = b''.join(encode_u30(len(s.encode())) + s.encode() for s in renamed)
    result = abc[:start] + encode_u30(len(strings)) + records + abc[end:]
    _, after, _ = inspect_abc(result)
    if set(after) != {'Anniversary' + c for c in classes}:
        raise ValueError('Imported class names were not isolated')
    return result


def import_page(source, java, ffdec):
    data, (_, _, a, b) = abc_section(source)
    original, _ = normalize(data[a:b])
    names, classes, bodies = inspect_abc(original)
    if 'AnniversaryHongLiTurnPage' in classes:
        return source
    if java is None or ffdec is None:
        raise ValueError('Java and FFDec are required for the initial page import')
    library = imported_library()
    _, added_classes, added_bodies = inspect_abc(library)
    payload = struct.pack('<I', 1) + b'anniversary-lucky-spin\0' + library
    tag = struct.pack('<HI', (82 << 6) | 63, len(payload)) + payload
    intermediate = data[:b] + tag + data[b:]
    intermediate = intermediate[:4] + struct.pack('<I', len(intermediate)) + intermediate[8:]
    with tempfile.TemporaryDirectory(prefix='SRCS-Anniversary-') as directory:
        src = Path(directory) / 'library.swf'; dst = Path(directory) / 'merged.swf'
        src.write_bytes(intermediate[:8] + zlib.compress(intermediate[8:], 9))
        subprocess.run([str(java), '-jar', str(ffdec), '-abcmerge', str(dst), str(src)], check=True)
        raw, (_, _, c, d) = abc_section(dst.read_bytes()); merged, _ = normalize(raw[c:d])
    new_names, new_classes, new_bodies = inspect_abc(merged)
    if new_names[:len(names)] != names or set(new_classes) != set(classes) | set(added_classes):
        raise ValueError('Original classes or multinames changed during import')
    if len(new_bodies) != len(bodies) + len(added_bodies):
        raise ValueError('Unexpected imported methods')
    for mid, (pos, length, limits) in bodies.items():
        new, size, new_limits = new_bodies[mid]
        if limits != new_limits or original[pos:pos+length] != merged[new:new+size]:
            raise ValueError(f'Original method {mid} changed during import')
    return assemble(source, merged)


def add_strings(abc, values):
    start, end, strings, _, _, _ = pool_layout(abc)
    extra = [s for s in values if s not in strings]
    records = b''.join(encode_u30(len(s.encode())) + s.encode() for s in extra)
    header = start + len(encode_u30(len(strings)))
    updated = abc[:start] + encode_u30(len(strings)+len(extra)) + abc[header:end] + records + abc[end:]
    return updated, {s: (strings+extra).index(s) for s in values}


def query_merged():
    code = b''
    for msg in (6, 7, 8, 9):
        code += call(q(0x60,11028),37543,number(msg),number(1),void=True)
    code += call(q(0x60,11028),37557,number(0),number(4),void=True)
    code += call(q(0x60,11028),37594,number(0),number(6),void=True)
    code += call(q(0x60,11028),37707,number(0),number(12),void=True)
    return code


def merged_listeners(handler, add, existing=()):
    return b''.join(call(q(0x60,1563),13671 if add else 13672,
                        prop(q(0x60,event_class),event),prop(get(0),handler),void=True)
                    for event_class,event in MERGED_EVENTS if event not in existing)


def date_code(label):
    server_time = call(q(0x60,1561),31827)
    start = number(1) + prop(YEAR,3394) + b'\xa1'
    finish = start + prop(YEAR,4811) + number(1) + b'\xa1\xa0'
    return (b'\xd0\x30' + prop(get(0),label) + q(0x2c,39930)
            + call(q(0x60,1561),31838,server_time,start) + b'\xa0' + q(0x2c,38298) + b'\xa0'
            + call(q(0x60,1561),31838,server_time,finish) + b'\xa0' + q(0x2c,38290) + b'\xa0'
            + q(0x61,11014) + b'\x47')


def new_awards():
    c=Code();c.add(prop(get(0),3394)+number(1));c.branch(0x15,'false')
    c.add(prop(get(0),3394)+prop(get(0),4811));c.branch(0x17,'false')
    for slot in (0,2,3,5,6,9,15):
        c.add(get(1)+number(slot));c.branch(0x13,'false')
    c.add(get(1)+number(12));c.branch(0x14,'spin')
    cfg=call(prop(GAME,32246),11394)
    c.add(b''.join(prop(cfg,k) for k in (24596,24599,24597,24598))+q(0x56,4)+put(4))
    c.add(number(0)+put(6));c.label('material_outer')
    c.add(get(6)+prop(get(4),3237));c.branch(0x18,'false')
    c.add(prop(HONG,3505)+get(6)+q(0x66,43950)+put(8))
    c.add(get(8));c.branch(0x12,'material_next')
    c.add(get(4)+get(6)+q(0x66,43950)+put(9)+number(0)+put(7))
    c.label('material_inner')
    for row in (8,9):
        c.add(get(7)+prop(get(row),3237));c.branch(0x18,'material_next')
    c.add(get(8)+get(7)+q(0x66,43950)+number(0));c.branch(0x1a,'material_advance')
    c.add(prop(HONG,3504)+get(6)+q(0x66,43950)+prop(get(9)+get(7)+q(0x66,43950),3754))
    c.branch(0x18,'true')
    c.label('material_advance');c.add(q(0xc2,7));c.branch(0x10,'material_inner')
    c.label('material_next');c.add(q(0xc2,6));c.branch(0x10,'material_outer')
    c.label('spin');c.add(get(1)+number(13));c.branch(0x14,'consume')
    spin_available(c,HONG,prop(HONG_CFG,24578),PAY,MONEY,(3476,14710,24092,43950,3237),'anniversary_spin')
    c.add(get(5)+b'\x48')
    c.label('consume');c.add(get(1)+number(14));c.branch(0x14,'recharge')
    c.add(prop(call(prop(GAME,32309),3909,number(5)),14277)+put(4)+number(0)+put(6))
    c.label('consume_loop');c.add(get(6)+prop(get(4),3237));c.branch(0x18,'false')
    c.add(get(6)+prop(GD,31285,3358,3237));c.branch(0x18,'false')
    c.add(prop(GD,31285,3358)+get(6)+q(0x66,43950)+number(0));c.branch(0x1a,'consume_next')
    c.add(prop(GD,31285,3357)+prop(get(4)+get(6)+q(0x66,43950),14268));c.branch(0x18,'true')
    c.label('consume_next');c.add(q(0xc2,6));c.branch(0x10,'consume_loop')
    c.label('recharge');c.add(get(1)+number(16));c.branch(0x14,'original')
    days_available(c,prop(GAME,32205,11369,14703),prop(GD,31272,3371),prop(GD,31272,3845),43950,prefix='anniversary_recharge')
    c.add(get(5)+b'\x48')
    c.label('true');c.add(b'\x26\x48')
    c.label('false');c.add(b'\x27\x48')
    c.label('original');c.add(b'\x09')
    return c.finish()


def window_lifecycle(abc,bodies):
    code=lambda mid:abc[bodies[mid][0]:sum(bodies[mid][:2])]
    day=code(22163);added=code(22159);removed=code(22160);create=code(22164)
    listen=lambda add:call(prop(get(0),23809),13671 if add else 13672,
                           prop(q(0x60,2),39383),prop(get(0),23815),void=True)
    cleanup=day[184:264]  # Remove cached pages and detach their event listeners.
    changes={}
    added,_=relocate(added,[(33,86,b''),(98,122,b'')])
    added,_=relocate(added,[(len(added)-1,len(added)-1,query_merged())])
    added,_=relocate(added,[(len(added)-1,len(added)-1,merged_listeners(23814,True))])
    changes[22159]=(added,lambda p:p,(5,5,14,15))
    removed,_=relocate(removed,[(33,78,cleanup),(len(removed)-1,len(removed)-1,
        call(q(0x60,1563),13672,prop(q(0x60,358),42512),prop(get(0),23816),void=True)
        + merged_listeners(23814,False))])
    changes[22160]=(removed,lambda p:p,(5,11,14,15))
    c=Code();c.add(b'\xd0\x30'+prop(get(0),23810)+prop(get(0),23811)+q(0x66,48308)+put(2))
    c.add(get(2));c.branch(0x12,'create');c.add(get(2)+b'\x27'+q(0x61,1832))
    c.label('create');c.add(call(get(0),23817)+put(2))
    c.add(get(0)+call(q(0x60,42709),43280,prop(get(0),23809,6136))+q(0x68,23811))
    c.add(get(2));c.branch(0x12,'done');c.add(get(2)+b'\x26'+q(0x61,1832)+call(get(2),2070,void=True))
    c.label('done');c.add(b'\x47');changes[22162]=(c.finish(),lambda p:p,(3,3,14,15))
    c=Code();c.add(day[:34]+prop(get(0),23809,6136)+put(4)+listen(False)+cleanup)
    c.add(get(0)+number(-1)+q(0x68,23811))
    c.add(prop(get(0),23809)+b''.join(number(i) for i in display_ids())+q(0x56,len(DISPLAY_SLOTS))+q(0x61,6138))
    c.add(call(prop(get(0),23809,6138),43280,get(4))+put(3))
    c.add(get(3)+number(0));c.branch(0x18,'select');c.add(number(0)+put(3))
    c.label('select');c.add(prop(get(0),23809)+get(3)+q(0x61,6104)+listen(True)+call(get(0),23815,b'\x20',void=True)+b'\x47')
    changes[22163]=(c.finish(),lambda p:p,(14,11,14,15))
    # All pages fit the existing right-hand content region at this origin.
    create,_=relocate(create,[(101,137,call(get(2),1631,number(472),number(192),void=True))])
    c=Code();c.add(get(1)+number(0));c.branch(0x15,'empty')
    c.add(prop(get(0),23805)+get(1)+q(0x66,48308));c.branch(0x12,'empty')
    c.add(create[21:]);c.label('empty');c.add(b'\x20\x48')
    changes[22164]=(create[:21]+c.finish(),lambda p:p,(3,4,14,15))
    return changes


def patch_swf(source,java=None,ffdec=None):
    source=import_page(source,java,ffdec)
    data,(_,_,a,b)=abc_section(source);abc,positions=normalize(data[a:b])
    names,classes,bodies=inspect_abc(abc)
    st,size,_=bodies[22158]
    if q(0x60,names.index('AnniversaryHongLiTurnPage')) in abc[st:st+size]:
        return upgrade_tab_presentation(repair_window_stack(source))
    # Remap only the descriptions actually referenced by the migrated pages.
    strings=pool_layout(abc)[2]
    description_edits={}
    for mid in (17923,28461):
        start,size,_=bodies[mid]
        for op in instructions(abc[start:start+size]):
            if op.opcode!=0x2c:continue
            text=strings[op.operands[0]]
            if mid==17923 and '万服庆典消费排行奖励' in text:
                description_edits[(mid,op.start,op.end)]=text.replace('万服庆典','周年庆典')
            elif mid==28461 and '活动第2-3天' in text:
                description_edits[(mid,op.start,op.end)]=text.replace('活动第2-3天','活动期间').replace('活动期间每天只可领取一次','活动期间每档只可领取一次')
    if len(description_edits)!=2:raise ValueError('Unexpected migrated-page descriptions')
    abc,labels=add_strings(abc,description_edits.values())
    names,classes,bodies=inspect_abc(abc)
    code=lambda mid:abc[bodies[mid][0]:sum(bodies[mid][:2])]
    transforms=window_lifecycle(abc,bodies)
    def change(mid,updated,limits=None,moved=lambda p:p):
        transforms[mid]=(updated,moved,limits or bodies[mid][2])
    for mid in (17923,28461):
        edits=[(start,end,q(0x2c,labels[text])) for (method,start,end),text in description_edits.items() if method==mid]
        updated,moved=relocate(code(mid),edits);change(mid,updated,moved=moved)
    for mid,add in ((6333,True),(6377,False)):
        src=code(mid)
        change(mid,relocate(src,[(len(src)-1,len(src)-1,merged_listeners(8171,add,(36018,)))])[0])
    # Always remove the retired icons, including stale state after a live reload.
    for mid,button in ((6335,38328),(6382,38315),(6408,38294)):
        change(mid,b'\xd0\x30'+call(q(0x60,8096),38381,prop(q(0x60,13052),button),prop(q(0x60,13052),button),void=True)+b'\x47',(3,*bodies[mid][2][1:]))
    src=code(6334);c=Code()
    c.add(prop(HONG,3490)+number(2));c.branch(0x14,'original')
    button=names.index('RIGHT_TOP_JING_JI_BTN')
    c.add(call(q(0x60,8096),38381,prop(q(0x60,13052),button),prop(q(0x60,13052),button),void=True)+b'\x47')
    c.label('original');prefix=c.finish()
    change(6334,src[:2]+prefix+src[2:],moved=lambda p:p+(len(prefix) if p>=2 else 0))
    # Preserve the original protocol indexes, including the retired null slots.
    pages=[0,18832,0,0,16278,0,0,29743,29738,0,18010,29705,
           16364,names.index('AnniversaryHongLiTurnPage'),29700,18573,18630]
    constructor=code(22158)
    new=(get(0)+b''.join(q(0x60,p) if p else b'\x20' for p in pages)+q(0x56,len(pages))+q(0x68,23805))
    change(22158,relocate(constructor,[(2,47,new)])[0],(max(18,bodies[22158][2][0]),*bodies[22158][2][1:]))
    static=code(22157);change(22157,relocate(static,[(51,51,b''.join(number(20012+i) for i in range(5))),(51,53,q(0x56,17))])[0],(18,*bodies[22157][2][1:]))
    # Reuse the original activities' title artwork for the imported pages.
    empty_string=next(i for i,s in enumerate(strings_of(abc)) if i>0 and s=='')
    change(28484,tab_renderer(code(28484)[:10],empty_string),(5,4,12,13))
    prefix=new_awards();change(4080,code(4080)[:2]+prefix+code(4080)[2:],(7,15,4,5),lambda p:p+(len(prefix) if p>=2 else 0))
    # Replace the anniversary entry's old recharge marks with all retained pages.
    c=Code();c.add(b'\xd0\x30'+call(q(0x60,8094),42485,prop(q(0x60,13052),38323))+put(2)+get(2));c.branch(0x12,'end')
    for i,slot in enumerate((1,10,11,12,13,14,16)):
        if i:c.add(b'\x2a');c.branch(0x11,'set');c.add(b'\x29')
        c.add(call(YEAR,3373,number(slot))+b'\x76')
    c.label('set');c.add(put(3)+call(get(2),12784,get(3),void=True));c.label('end');c.add(b'\x47')
    change(6379,c.finish(),(4,4,10,11))
    old=code(6380)
    updated=relocate(old,[(129,153,b''),(177,177,query_merged())])[0];change(6380,updated,(5,3,10,11))
    # Reuse base-class date renderers with the anniversary's period.
    for mid,label in [(17932,18575),(17966,18622)]:change(mid,date_code(label),(10,*bodies[mid][2][1:]))
    change(17965,relocate(code(17965),[(70,77,prop(YEAR,4811))])[0])
    change(15826,relocate(code(15826),[(2,77,date_code(16366)[2:-1])])[0],(10,*bodies[15826][2][1:]))
    # Material-page red dots depend on the anniversary rather than retired Jingji state.
    for mid in (15826,15829):
        src=transforms[mid][0] if mid in transforms else code(mid)
        edits=[]
        for op in instructions(src):
            if op.opcode==0x66 and op.operands in ((3491,),(3492,),(3490,)):
                previous=[x for x in instructions(src) if x.end==op.start][0]
                if previous.opcode==0x66 and previous.operands==(31270,):
                    repl=prop(GD,31288,4811 if op.operands==(3491,) else 3394) if op.operands!=(3490,) else number(2)
                    before=[x for x in instructions(src) if x.end==previous.start][0]
                    edits.append((before.start,op.end,repl))
        if edits:change(mid,relocate(src,edits)[0],transforms[mid][2] if mid in transforms else None)
    # The consumption gift inherits DaJiDaLiBasePage; only its date needs overriding.
    src=code(17258);c=Code();c.add(get(0)+q(0x60,29700)+b'\xb1');c.branch(0x12,'original')
    c.add(date_code(18076)[2:]);c.label('original');c.add(src[2:]);change(17258,src[:2]+c.finish(),(10,*bodies[17258][2][1:]))
    # Imported lucky-spin page uses the existing daily pay and balance state.
    turn=classes['AnniversaryHongLiTurnPage']['instance'];init_mid=turn['init'][0]
    src=code(init_mid);ops=instructions(src)
    label=next(op.operands[0] for op in ops if op.opcode==0x66 and names[op.operands[0]].startswith('_label_'))
    change(init_mid,date_code(label),(10,*bodies[init_mid][2][1:]))
    remove_mid=turn['removeEvent'][0]
    src=code(remove_mid)
    timer_name=next(i for i,n in enumerate(names) if i>50800 and n=='_timer')
    change(remove_mid,relocate(src,[(len(src)-1,len(src)-1,call(prop(get(0),timer_name),names.index('stop'),void=True))])[0])
    replacements=[]
    for mid,(updated,moved,limits) in transforms.items():
        instructions(updated)
        required,registers,scopes=bytecode_requirements(updated,names,limits[2])
        if required>limits[0] or registers>limits[1] or scopes>limits[3]:
            raise ValueError(f'Method {mid} exceeds Flash execution capacities')
        start,length,old_limits=bodies[mid];r=ABCReader(abc);r.pos=start+length;exceptions=[]
        for _ in range(r.u30()):
            row=[r.u30() for _ in range(5)];exceptions.append([moved(x) for x in row[:3]]+row[3:])
        header=b''.join(encode_u30(x) for x in (mid,*old_limits,length))
        if abc[start-len(header):start]!=header:raise ValueError('Unexpected method header')
        value=b''.join(encode_u30(x) for x in (mid,*limits,len(updated)))+updated
        value+=encode_u30(len(exceptions))+b''.join(encode_u30(x) for row in exceptions for x in row)
        replacements.append((start-len(header),r.pos,value))
    result=bytearray(abc)
    for start,end,value in sorted(replacements,reverse=True):result[start:end]=value
    _,_,after=inspect_abc(result)
    for mid,(a,l,li) in bodies.items():
        b,n,newli=after[mid]
        if mid not in transforms and (li!=newli or abc[a:a+l]!=result[b:b+n]):
            raise ValueError(f'Unrelated method {mid} changed')
    for pos in positions:result[pos]=0
    return assemble(source,bytes(result))


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--java',type=Path);p.add_argument('--ffdec',type=Path);args=p.parse_args()
    source=CLIENT.read_bytes();updated=patch_swf(source,args.java,args.ffdec)
    if patch_swf(updated)!=updated:raise ValueError('Patch must be idempotent')
    CLIENT.write_bytes(updated)
    print('Anniversary pages integrated; retired slots hidden; unrelated resources preserved.')
