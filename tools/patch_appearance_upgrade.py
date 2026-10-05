"""Patch appearance click-to-combine entry points and three-for-one resources."""
from __future__ import annotations
import argparse
from pathlib import Path
import re
import struct
import zlib
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_guild_quest_config import read_cbp, write_cbp, read_pack, write_pack
ROOT=Path(__file__).resolve().parents[1]

def inspect_abc(data: bytes, class_name: str = ""):
    reader = ABCReader(data)
    reader.skip(4)
    for _ in range(2):
        for _ in range(reader.u30() - 1):
            reader.u30()
    reader.skip(8 * max(0, reader.u30() - 1))
    strings = [""]
    for _ in range(reader.u30() - 1):
        length = reader.u30()
        strings.append(data[reader.pos:reader.pos + length].decode("utf-8"))
        reader.skip(length)
    for _ in range(reader.u30() - 1):
        reader.byte()
        reader.u30()
    for _ in range(reader.u30() - 1):
        for _ in range(reader.u30()):
            reader.u30()
    names = [""]
    for _ in range(reader.u30() - 1):
        kind = reader.byte()
        if kind in (7, 13):
            reader.u30()
            name = reader.u30()
        elif kind in (15, 16, 9, 14):
            name = reader.u30()
            if kind in (9, 14):
                reader.u30()
        elif kind in (17, 18):
            name = 0
        elif kind in (27, 28):
            reader.u30()
            name = 0
        elif kind == 29:
            base = reader.u30()
            for _ in range(reader.u30()):
                reader.u30()
            names.append(names[base])
            continue
        else:
            raise ValueError(f"Unsupported multiname: {kind}")
        names.append(strings[name])
    for _ in range(reader.u30()):
        count = reader.u30()
        reader.u30()
        for _ in range(count):
            reader.u30()
        reader.u30()
        flags = reader.byte()
        if flags & 8:
            for _ in range(reader.u30()):
                reader.u30()
                reader.byte()
        if flags & 128:
            for _ in range(count):
                reader.u30()
    for _ in range(reader.u30()):
        reader.u30()
        for _ in range(reader.u30()):
            reader.u30()
            reader.u30()

    def traits():
        methods = {}
        for _ in range(reader.u30()):
            name = reader.u30()
            attributes = reader.byte()
            kind = attributes & 15
            reader.u30()
            value = reader.u30()
            if kind in (0, 6):
                if reader.u30():
                    reader.byte()
            elif kind in (1, 2, 3):
                methods[names[name]] = (value, name)
            elif kind not in (4, 5):
                raise ValueError(f"Unsupported trait: {kind}")
            if attributes & 64:
                for _ in range(reader.u30()):
                    reader.u30()
        return methods

    count = reader.u30()
    targets = None
    catalog = {}
    class_names = []
    for _ in range(count):
        name = reader.u30()
        reader.u30()
        flags = reader.byte()
        if flags & 8:
            reader.u30()
        for _ in range(reader.u30()):
            reader.u30()
        constructor = reader.u30()
        methods = traits()
        class_names.append(names[name])
        catalog[names[name]] = {"constructor": constructor, "instance": methods}
        if names[name] == class_name:
            if targets is not None:
                raise ValueError("Duplicate upgrade page class")
            targets = methods
    for i in range(count):
        constructor = reader.u30()
        methods = traits()
        catalog[class_names[i]]["static"] = methods
        catalog[class_names[i]]["static_constructor"] = constructor
    for _ in range(reader.u30()):
        reader.u30()
        traits()
    bodies = {}
    for _ in range(reader.u30()):
        method = reader.u30()
        limits = tuple(reader.u30() for _ in range(4))
        length = reader.u30()
        start = reader.pos
        reader.skip(length)
        bodies[method] = (start, length, limits)
        for _ in range(reader.u30()):
            for _ in range(5):
                reader.u30()
        traits()
    if reader.pos != len(data):
        raise ValueError("ABC did not parse completely")
    return names, catalog, bodies


def pools(data):
    r = ABCReader(data)
    r.skip(4)
    for _ in range(2):
        for _ in range(r.u30()-1):
            r.u30()
    r.skip(8*max(0,r.u30()-1))
    result = {}
    for key in ('strings','namespaces','sets','names'):
        begin = r.pos
        count = r.u30()
        content = r.pos
        values = [None]
        for _ in range(count-1):
            if key == 'strings':
                size=r.u30(); values.append(data[r.pos:r.pos+size].decode('utf-8')); r.skip(size)
            elif key == 'namespaces':
                values.append((r.byte(),r.u30()))
            elif key == 'sets':
                values.append(tuple(r.u30() for _ in range(r.u30())))
            else:
                kind=r.byte()
                if kind in (7,13,9,14): args=(r.u30(),r.u30())
                elif kind in (15,16,27,28): args=(r.u30(),)
                elif kind in (17,18): args=()
                elif kind==29: args=(r.u30(),tuple(r.u30() for _ in range(r.u30())))
                else: raise ValueError(kind)
                values.append((kind,*args))
        result[key]=(begin,content,r.pos,values)
    return result


def extend_pools(source, texts, qnames):
    table=pools(source)
    original=pools(source)
    additions={key:bytearray() for key in table}
    def string(value):
        values=table['strings'][3]
        if value not in values:
            values.append(value); raw=value.encode('utf-8')
            additions['strings'] += encode_u30(len(raw))+raw
        return values.index(value)
    text_ids={value:string(value) for value in texts}
    name_ids={}
    for package,name in qnames:
        ns=(0x16,string(package)); spaces=table['namespaces'][3]
        if ns not in spaces:
            spaces.append(ns); additions['namespaces'] += bytes([ns[0]])+encode_u30(ns[1])
        qname=(7,spaces.index(ns),string(name)); names=table['names'][3]
        if qname not in names:
            names.append(qname); additions['names'] += b'\x07'+encode_u30(qname[1])+encode_u30(qname[2])
        name_ids[name]=names.index(qname)
    result=bytearray(source)
    for key in reversed(list(table)):
        start,content,end,values=table[key]
        if additions[key]:
            result[start:end]=encode_u30(len(values))+source[content:end]+additions[key]
    # Every pre-existing constant keeps its original index and bytes.
    after=pools(bytes(result))
    for key in original:
        assert after[key][3][:len(original[key][3])]==original[key][3]
    return bytes(result),text_ids,name_ids


def q(op,index,*args):
    return bytes([op])+encode_u30(index)+b''.join(encode_u30(x) for x in args)


def patch_abc(source,mount=False):
    texts=['RideAppearanceMakeInit'] if mount else ['FashionAppearanceMakeInit','FootAppearanceMakeInit']
    # Match the public MsgSender class used by ShenDunPage.
    main=source
    if mount:
        d,(_,_,s,e)=abc_section((ROOT/'web/GameFrame.swf').read_bytes());main=d[s:e]
    names,catalog,bodies=inspect_abc(main)
    start,size,_=bodies[catalog['ShenDunPage']['instance']['heChengHandle'][0]]
    ops=instructions(main[start:start+size])
    sender=next(op.operands[0] for op in ops if op.opcode==0x60)
    method=next(op.operands[0] for op in ops if op.opcode==0x4f)
    pool=pools(main)
    def qualified(index):
        kind,namespace,name=pool['names'][3][index]
        assert kind==7
        return pool['strings'][3][pool['namespaces'][3][namespace][1]],pool['strings'][3][name]
    result,text_ids,name_ids=extend_pools(source,texts,[qualified(sender),qualified(method)])
    names,catalog,bodies=inspect_abc(result)
    target='MountIllusionCombinWin' if mount else 'FashionCombineWin'
    index=catalog[target]['instance']['show'][0]
    start,size,limits=bodies[index]
    prefix=b'\xd0\x30'
    talk=lambda text:q(0x60,name_ids['MsgSender'])+b'\x24\0'+q(0x2c,text_ids[text])+q(0x4f,name_ids['sendTalkToNPC'],2)+b'\x47'
    if mount:
        code=prefix+talk(texts[0])
    else:
        # Compare to the same public constant all FashionPage buttons pass.
        foot=next(i for i,n in enumerate(names) if n=='TYPE_FOOT_FASHION')
        body=talk(texts[1]); fallback=talk(texts[0])
        code=prefix+b'\xd1'+q(0x60,foot)+b'\x14'+struct.pack('<i',len(body))[:3]+body+fallback
    instructions(code)
    length_start=start-len(encode_u30(size))
    marker=encode_u30(index)+b''.join(encode_u30(x) for x in limits)
    header=length_start-len(marker)
    if result[header:length_start]!=marker:raise ValueError('Unexpected method header')
    reader=ABCReader(result);reader.pos=start+size
    if reader.u30()!=0 or reader.u30()!=0:raise ValueError('Unexpected show exceptions')
    replacement=encode_u30(index)+b''.join(encode_u30(x) for x in (3,limits[1],limits[2],limits[3]))+encode_u30(len(code))+code+b'\0\0'
    changed=result[:header]+replacement+result[reader.pos:]
    _,new_catalog,new_bodies=inspect_abc(changed)
    for other,(old_start,old_size,old_limits) in bodies.items():
        if other==index:continue
        new_start,new_size,new_limits=new_bodies[other]
        assert (old_size,old_limits)==(new_size,new_limits)
        assert result[old_start:old_start+old_size]==changed[new_start:new_start+new_size]
    assert catalog==new_catalog
    return changed


def patch_swf(source,mount=False):
    data,(tag,payload,start,end)=abc_section(source)
    abc=patch_abc(data[start:end],mount)
    if abc==data[start:end]:return source
    result=data[:tag+2]+struct.pack('<I',start-payload+len(abc))+data[payload:start]+abc+data[end:]
    result=result[:4]+struct.pack('<I',len(result))+result[8:]
    assert result[8:tag]==data[8:tag] and result[start+len(abc):]==data[end:]
    return result[:8]+zlib.compress(result[8:],9)


RIDES=[6888,6892,6896,6900,6941,7630]
FEET=[6967,6971,6975,6979,7786,7790,7794,7798]
DRESSES=[6715,6719,6723,6727,7703]
MATERIALS={first+i for first in RIDES+FEET+DRESSES for i in range(3)}


def patch_description(value):
    return value.replace('四个可合成'.encode('utf-8'),'三个可合成'.encode('utf-8'))


def patch_items(source):
    header,root=read_cbp(source)
    changed=False
    for row in root.children:
        if int(row.child('id').number()) in MATERIALS:
            desc=row.child('desc');new=patch_description(desc.value)
            changed |= desc.value!=new;desc.value=new
    return write_cbp(header,root) if changed else source


def patch_recipes(source):
    header,root=read_cbp(source)
    changed=False
    for group in [8,9]:
        for rows in root.child(str(group)).children:
            for row in rows.children:
                assert row.child('id1').number()==row.child('id2').number()
                a,b=row.child('needcount1'),row.child('needcount2')
                assert (a.number(),b.number()) in [(2,2),(1,2)]
                changed |= a.number()!=1;a.set_number(1)
    return write_cbp(header,root) if changed else source


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    updates={}
    for file,mount in [('web/GameFrame.swf',False),('web/v2/modules/mount/Mount.swf',True)]:
        path=ROOT/file;updates[path]=patch_swf(path.read_bytes(),mount)
        assert patch_swf(updates[path],mount)==updates[path]
    config=ROOT/'Server/S1001/data/config/ActorEvent/HeChengCfg.lua'
    source=config.read_bytes()
    for first in RIDES+FEET:
        for item in range(first,first+3):
            old=f'id1={item},needcount1=2,id2={item},needcount2=2'.encode()
            new=f'id1={item},needcount1=1,id2={item},needcount2=2'.encode()
            assert source.count(old)+source.count(new)==1
            source=source.replace(old,new)
    updates[config]=source
    lang=ROOT/'Server/S1001/data/language/Zh-CN/Item.lua'
    source=lang.read_bytes()
    for item in MATERIALS:
        pattern=rb'(\bi'+str(item).encode()+rb'=\")[^\r\n]*?\"'
        matches=list(re.finditer(pattern,source));assert len(matches)==1
        m=matches[0];source=source[:m.start()]+patch_description(m[0])+source[m.end():]
    updates[lang]=source
    client=ROOT/'web/v2/lang/zh-cn'
    for path in client.glob('stditems*.cbp'):updates[path]=patch_items(path.read_bytes())
    updates[client/'heChengCfg.cbp']=patch_recipes((client/'heChengCfg.cbp').read_bytes())
    pack=client/'zh-cn.dat';entries=read_pack(pack.read_bytes());new=[]
    for name,data in entries:
        value=updates.get(client/name,data)
        if client/name in updates:assert data==(client/name).read_bytes()
        new.append((name,value))
    updates[pack]=write_pack(new) if entries!=new else pack.read_bytes()
    global_file=ROOT/'Server/S1001/data/functions/GlobalFunction.lua'
    source=global_file.read_bytes();line=b'--#include "data\\functions\\AppearanceMake.lua" once\r\n'
    if line not in source:
        anchor=b'--#include "data\\functions\\ShenDunMake.lua" once'
        pos=source.index(b'\r\n',source.index(anchor))+2;source=source[:pos]+line+source[pos:]
    updates[global_file]=source
    whitelist=ROOT/'Server/S1001/data/functions/GlobalNpcFunctions.lua';source=whitelist.read_bytes()
    for name in ['AppearanceMakeInit','RideAppearanceMakeInit','FashionAppearanceMakeInit','FootAppearanceMakeInit','AppearanceMakeCategory','AppearanceMakeList','AppearanceMake']:
        line=b'\t'+name.encode()+b' =1,\r\n'
        if line not in source:
            pos=source.index(b'\tShenDunMakeInit =1,');source=source[:pos]+line+source[pos:]
    updates[whitelist]=source
    for path,value in updates.items():
        if path.read_bytes()!=value:
            if args.check:raise ValueError(f'Missing appearance upgrade patch: {path}')
            path.write_bytes(value);print(path.relative_to(ROOT))
    print('57 recipes and client entry points verified')


if __name__=='__main__':main()
