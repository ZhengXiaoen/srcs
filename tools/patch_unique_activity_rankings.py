"""Keep one anniversary recharge ranking and one Wanfu consumption ranking.

Patch only the inspected activity methods and descriptions. Preserve constant
pool indexes, unrelated methods, graphics and other resource-pack entries.
"""
from __future__ import annotations

import argparse
import struct
import zlib
from pathlib import Path

from patch_activity_entries import q, strings_of, occurrences
from patch_activity_reminders import Code, call, get, number, prop, put, normalize, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import Node, read_cbp, write_cbp, read_pack, write_pack

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / 'web/GameFrame.swf'
MODULE = ROOT / 'web/v2/modules/hongli/HongLi.swf'
BASELINE = 'd88426b'
MAIN_METHODS = {22157, 22158, 15772, 5567, 5568, 5569, 5573,
                6021, 6022, 6023, 6028, 6042, 6403, 6408,
                5903, 5906, 7236, 7241, 7242, 7243, 7244}
MODULE_METHODS = {5, 6}


def replace(code, old, new):
    found = occurrences(code, old)
    if len(found) != 1:
        raise ValueError(f'Expected one instruction sequence: {old.hex()}')
    start = found[0]
    return relocate(code, [(start, start + len(old), new)])


def arrays(code, page, count=None):
    ops = instructions(code); edits = []
    for i, op in enumerate(ops):
        if op.opcode != 0x60 or op.operands != (page,): continue
        build = next(x for x in ops[i + 1:] if x.opcode == 0x56)
        if count is not None and build.operands != (count,):
            raise ValueError('Unexpected page array size')
        edits += [(op.start, op.end, b''), (build.start, build.end, q(0x56, build.operands[0] - 1))]
    if not edits: raise ValueError('Missing retired page')
    return relocate(code, edits)


def definitions(code, strings, buttons):
    ops = instructions(code); edits = []; counts = {}
    for button in buttons:
        matches = [i for i, op in enumerate(ops) if op.opcode == 0x2c and strings[op.operands[0]] == button
                   and i > 0 and ops[i-1].opcode == 0x2c and strings[ops[i-1].operands[0]] == 'instanceName']
        if len(matches) != 1: raise ValueError('Unexpected button definition')
        i = matches[0]
        previous = max(j for j in range(i) if ops[j].opcode == 0x55)
        end = next(j for j in range(i, len(ops)) if ops[j].opcode == 0x55)
        edits.append((ops[previous].end, ops[end].end, b''))
        build = next(x for x in ops[end + 1:] if x.opcode == 0x56)
        counts[build.start] = (build, counts.get(build.start, (build, 0))[1] + 1)
    for build, removed in counts.values():
        edits.append((build.start, build.end, q(0x56, build.operands[0] - removed)))
    return relocate(code, edits)


def bindings(code, fields):
    ops = instructions(code); edits = []
    for i, op in enumerate(ops):
        if op.opcode != 0x68 or op.operands[0] not in fields: continue
        block = ops[i-4:i+1]
        if [x.opcode for x in block] != [0xd0, 0xd1, 0x2c, 0x66, 0x68]:
            raise ValueError('Unexpected button binding')
        edits.append((block[0].start, block[-1].end, b''))
    return relocate(code, edits)


def pushes(code, field, push=43315):
    ops = instructions(code); edits = []
    for i, op in enumerate(ops):
        if op.opcode != 0x66 or op.operands != (field,): continue
        block = ops[i-3:i+2]
        if [x.opcode for x in block] == [0xd0, 0x66, 0xd0, 0x66, 0x4f] and block[-1].operands == (push,1):
            edits.append((block[0].start, block[-1].end, b''))
    if len(edits) != 1: raise ValueError('Unexpected button push')
    return relocate(code, edits)


def navigate():
    c = Code(); c.add(b'\xd0\x30')
    removed = (4, 5, 6, 7, 11, 14)
    c.add(get(1) + number(0)); c.branch(0x15, 'return')
    c.add(get(1) + number(15)); c.branch(0x18, 'return')
    for old in removed:
        c.add(get(1) + number(old)); c.branch(0x13, 'return')
    for count in range(len(removed), 0, -1):
        c.add(get(1) + number(removed[count-1] + 1)); c.branch(0x15, str(count))
        c.add(get(1) + number(count) + b'\xa1\x73' + put(1)); c.branch(0x10, 'apply')
        c.label(str(count))
    c.label('apply')
    c.add(get(0) + get(1) + q(0x4e,1856,1) + get(0) + get(1) + q(0x68,7677))
    c.label('return'); c.add(b'\x47')
    return c.finish()


def year_time(code):
    # The existing date renderer uses an offset from today and a final-day offset.
    gd = prop(q(0x60,1507),31288)
    changed, _ = relocate(code, [(2,75, number(1) + prop(gd,3394) + b'\xa1\x73' + put(1))])
    return replace(changed, get(1) + number(2) + b'\xa0',
                   get(1) + prop(gd,4811) + number(1) + b'\xa1\xa0')


def qd_children(code):
    changed, _ = pushes(code,7633)
    # Remove spin mark construction, attachment and shift the retained hunt mark.
    ops = instructions(changed)
    init = next(i for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(7656,))
    end = next(o.start for o in ops[init+1:] if o.opcode==0xd0 and changed[o.start+1:o.start+1+len(q(0x5d,388))]==q(0x5d,388))
    attach = next(i for i,o in enumerate(ops) if o.opcode==0x66 and o.operands==(7633,))
    changed,_ = relocate(changed,[(ops[init-3].start,end,b''),(ops[attach-1].start,ops[attach+3].end,b'')])
    return replace(changed, prop(get(0),7657)+q(0x25,188)+number(9),
                   prop(get(0),7657)+q(0x25,188)+number(8))


def no_spin_effect(code):
    ops = instructions(code)
    start = next(o.start for o in ops if o.opcode==0x60 and o.operands==(1740,)
                 and code[o.start:o.start+len(prop(q(0x60,1740),32205,11369,14704))]==prop(q(0x60,1740),32205,11369,14704))
    # The first config in this block is preceded by no extra stack value.
    end = next(o.branches[0][1] for o in ops if o.opcode==0x15 and o.start>start
               and code[o.start-4:o.start]==get(6)+number(0))
    return relocate(code,[(start,end,b'')])


def bounded_page(code, field, length):
    c=Code(); c.add(prop(get(0),field)+number(0)); c.branch(0x15,'return')
    c.add(prop(get(0),field)+length); c.branch(0x18,'return')
    c.add(code[2:-1]); c.label('return'); c.add(b'\x47')
    return b'\xd0\x30'+c.finish()


def newyear_constructor(code, strings):
    changed,_=definitions(code,strings,['_loaderbasebutton_11'])
    changed,_=bindings(changed,{7453})
    changed,_=pushes(changed,7453)
    changed,_=arrays(changed,18049,13)
    changed,_=replace(changed,q(0x2c,40122),q(0x2c,40120))
    return replace(changed,prop(get(0),7458)+number(12)+q(0x46,15593,1),
                   prop(get(0),7458)+number(11)+q(0x46,15593,1))


def newyear_click(code):
    # Page 12 (hunt gifts) moves to 11; the retired button cannot select a page.
    return replace(code,prop(get(0),7458)+number(12)+q(0x61,15595),
                   prop(get(0),7458)+number(11)+q(0x61,15595))


def monthly_ui(code):
    changed,_=arrays(code,21919,5)
    ops=instructions(changed); edits=[]
    titles=[i for i,o in enumerate(ops) if o.opcode==0x2c and o.operands==(41165,)]
    if len(titles)!=1: raise ValueError('Missing monthly ranking title')
    i=titles[0]; build=ops[i+5]
    if build.opcode!=0x56 or build.operands!=(5,): raise ValueError('Unexpected monthly titles')
    edits += [(ops[i].start,ops[i].end,b''),(build.start,build.end,q(0x56,4))]
    # Matching badge list follows the titles.
    badge=next(j for j in range(i+6,len(ops)) if ops[j].opcode==0x56 and ops[j].operands==(5,))
    edits += [(ops[badge-5].start,ops[badge-4].start,b''),(ops[badge].start,ops[badge].end,q(0x56,4))]
    return relocate(changed,edits)


def hongli_view(code):
    changed,_=bindings(code,{26})
    changed,_=replace(changed,get(0)+q(0x66,26),b'')
    # Removing the matching button and page leaves their remaining indexes aligned.
    changed,_=replace(changed,q(0x56,6)+q(0x68,29),q(0x56,5)+q(0x68,29))
    changed,_=arrays(changed,53,6)
    # Flash-sale and spin marks follow the removed fourth button.
    changed,_=replace(changed,prop(get(0),41)+q(0x25,278)+number(86)+b'\xa0',
                       prop(get(0),41)+q(0x25,278)+number(43)+b'\xa0')
    return replace(changed,prop(get(0),42)+q(0x25,278)+q(0x25,129)+b'\xa0',
                   prop(get(0),42)+q(0x25,278)+number(86)+b'\xa0')


def hongli_constructor(code, strings):
    changed,_=definitions(code,strings,['_loaderbasebutton_3'])
    return changed, lambda p:p


def patch_abc(source, module=False):
    abc,positions=normalize(source)
    names,_,bodies=inspect_abc(abc,'HongLiActiveWin' if module else 'QingDianActiveWin')
    sentinel=5 if module else 22158
    a,l,_=bodies[sentinel]
    if module:
        done=not any(o.opcode==0x2c and strings_of(abc)[o.operands[0]]=='_loaderbasebutton_3'
                     for o in instructions(abc[a:a+l]))
    else: done=q(0x60,16278) in abc[a:a+l]
    if done:return source
    strings=strings_of(abc)
    transforms={}
    if module:
        transforms={5:lambda c:hongli_constructor(c,strings),6:hongli_view}
    else:
        # Check the anniversary data fields before reusing them for the date renderer.
        if names[31288]!='yearAcitveDataMgr' or names[3394]!='curDay' or names[4811]!='totalDay':
            raise ValueError('Unexpected anniversary date fields')
        transforms={
            22157:lambda c:replace(c,number(840),number(1300)),
            22158:lambda c:replace(c,q(0x60,29710),q(0x60,16278)),
            15772:year_time,
            5567:lambda c:arrays(c,16278),
            5568:lambda c:definitions(c,strings,['_loaderbasebutton_7','_loaderbasebutton_15']),
            5569:lambda c:relocate(c,[(90,92,number(7)),(182,184,number(5))]),
            5573:lambda c:(bounded_page(c,6743,prop(get(0),6745,3237)),lambda p:p),
            6021:lambda c:arrays(definitions(c,strings,['_loaderbasebutton_6'])[0],18777,10),
            6022:lambda c:bindings(c,{7633}),6023:qd_children,
            6028:lambda c:(b'\xd0\x30\x47',lambda p:p),
            6042:lambda c:(navigate(),lambda p:p),6403:no_spin_effect,
            6408:lambda c:replace(c,call(q(0x60,11028),37707,number(0),number(14),void=True),b''),
            5903:lambda c:newyear_constructor(c,strings),5906:newyear_click,
            7236:monthly_ui,
            7241:lambda c:relocate(c,[(141,len(c)-1,b'')]),
            7242:lambda c:replace(c,prop(get(0),9488),number(2)),
            7243:lambda c:(b'\xd0\x30\x47',lambda p:p),
            7244:lambda c:replace(c,prop(get(0),9488),number(2)),
        }
    changes=[]
    for method,transform in transforms.items():
        start,size,limits=bodies[method];code=abc[start:start+size]
        updated,moved=transform(code);instructions(updated)
        r=ABCReader(abc);r.pos=start+size
        exceptions=[]
        for _ in range(r.u30()):
            row=[r.u30() for _ in range(5)]
            exceptions.append([moved(p) for p in row[:3]]+row[3:])
        header=b''.join(encode_u30(v) for v in (method,*limits,size))
        if abc[start-len(header):start]!=header:raise ValueError('Unexpected method header')
        new_limits = (7, *limits[1:]) if method == 15772 and not module else limits
        replacement=b''.join(encode_u30(v) for v in (method,*new_limits,len(updated)))+updated
        replacement+=encode_u30(len(exceptions))+b''.join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start-len(header),r.pos,replacement))
    result=bytearray(abc)
    for a,b,value in sorted(changes,reverse=True):result[a:b]=value
    _,_,after=inspect_abc(bytes(result),'QingDianActiveWin')
    for method,(a,l,li) in bodies.items():
        b,n,newli=after[method]
        if method not in transforms and (abc[a:a+l]!=result[b:b+n] or li!=newli):
            raise ValueError('Unrelated method changed')
    # Undo only our method records to prove all other ABC metadata stayed intact.
    restored=bytearray(result);shift=0;undo=[]
    for a,b,value in sorted(changes):
        undo.append((a+shift,a+shift+len(value),abc[a:b]));shift+=len(value)-(b-a)
    for a,b,value in reversed(undo):restored[a:b]=value
    if restored!=abc:raise ValueError('Unrelated ABC bytes changed')
    if module:
        result=bytearray(replace_strings(bytes(result), {'293,372':'293,328', '293,416':'293,372'}))
    for p in positions:result[p]=0
    return bytes(result)


def replace_strings(source, replacements):
    r=ABCReader(source);r.skip(4)
    for _ in range(2):
        for _ in range(r.u30()-1):r.u30()
    r.skip(8*(r.u30()-1));edits=[]
    for _ in range(r.u30()-1):
        a=r.pos;l=r.u30();text=source[r.pos:r.pos+l].decode('utf-8');r.skip(l)
        if text in replacements:
            value=replacements[text].encode('utf-8');edits.append((a,r.pos,encode_u30(len(value))+value))
    if len(edits)!=len(replacements):raise ValueError('Missing exclusive activity string')
    out=bytearray(source)
    for a,b,v in reversed(edits):out[a:b]=v
    return bytes(out)


def patch_swf(source,module=False):
    data,(tag,payload,a,b)=abc_section(source)
    abc=patch_abc(data[a:b],module)
    if abc==data[a:b]:return source
    result=data[:tag+2]+struct.pack('<I',a-payload+len(abc))+data[payload:a]+abc+data[b:]
    result=result[:4]+struct.pack('<I',len(result))+result[8:]
    if result[8:tag]!=data[8:tag] or result[a+len(abc):]!=data[b:]:
        raise ValueError('Unrelated SWF tags changed')
    return result[:8]+zlib.compress(result[8:],9)


def patch_config(source):
    header,root=read_cbp(source);spin=root.child('XiaoFeiZhuanPanNew')
    existing=[c for c in spin.children if c.name=='isOpen']
    if existing:
        if existing[0].kind!=1 or existing[0].value!=b'\0'*8:raise ValueError('Unexpected spin switch')
        return source
    spin.children.append(Node('isOpen',1,b'\0'*8))
    return write_cbp(header,root)


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--check',action='store_true')
    args=parser.parse_args()
    for path,module in ((CLIENT,False),(MODULE,True)):
        old=path.read_bytes();new=patch_swf(old,module)
        if patch_swf(new,module)!=new:raise ValueError('Patch is not idempotent')
        if args.check and old!=new:raise ValueError(f'{path.name} needs patching')
        if not args.check and old!=new:path.write_bytes(new)
    directory=ROOT/'web/v2/lang/zh-cn';path=directory/'QingDianActivityCfg.cbp';packpath=directory/'zh-cn.dat'
    old=path.read_bytes();new=patch_config(old);entries=read_pack(packpath.read_bytes())
    for i,(name,data) in enumerate(entries):
        if name==path.name:
            if data!=old:raise ValueError('Standalone and packed config differ')
            entries[i]=(name,new)
    if args.check and old!=new:raise ValueError('Spin config needs patching')
    if not args.check and old!=new:
        path.write_bytes(new);packpath.write_bytes(write_pack(entries))
    print('Verified unique activity ranking entries and retired Wanfu spin.')


if __name__=='__main__':main()
