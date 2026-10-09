"""Sync only existing BOSS award entries in the client resource and its pack."""
from pathlib import Path
import argparse, sys, struct
from patch_boss_equipment_drop import ROOT,DATA,load,build
from patch_guild_quest_config import read_cbp,write_cbp,read_pack,write_pack,Node

def number(name,value):return Node(name,2,struct.pack('<d',value))

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--lua-path');p.add_argument('--check',action='store_true');args=p.parse_args()
    lua,items,meta,monsters=load(args.lua_path);cfg,audit=build(lua,items,meta,monsters)
    path=ROOT/'web/v2/lang/zh-cn/AdvanceMonsterEquipCfg.cbp'
    header,root=read_cbp(path.read_bytes());changed=0
    for row in root.children:
        mid=int(row.child('id').number())
        if mid not in cfg['monsters']:continue
        rows=cfg['profiles'][cfg['monsters'][mid]['profile']-1]['weights'][0]
        highest=max(r['tier'] for r in rows)
        ids=sorted({i for r in rows if r['tier']==highest for i in r['weapons']+r['clothes']})
        for awards in row.child('awards').children:
            present={int(a.child('id').number()) for a in awards.children}
            for iid in ids:
                if iid in present:continue
                index=str(len(awards.children))
                awards.children.append(Node(index,4,children=[number('type',0),number('id',iid),number('count',1),number('bind',0)]))
                changed+=1
    result=write_cbp(header,root)
    if args.check:assert read_cbp(path.read_bytes())[1]==root
    elif changed:path.write_bytes(result)
    packpath=path.parent/'zh-cn.dat';entries=read_pack(packpath.read_bytes())
    assert sum(name.lower()==path.name.lower() for name,_ in entries)==1
    packed=path.read_bytes()
    if args.check:assert all(data==packed for name,data in entries if name.lower()==path.name.lower())
    else:packpath.write_bytes(write_pack([(name,packed if name.lower()==path.name.lower() else data) for name,data in entries]))
    print('Preview additions',changed)
