"""Generate BOSS weapon/clothes rules from the approved native-drop baseline."""
from pathlib import Path
import argparse, collections, math, re, sys, subprocess

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / 'Server/S1001/data'
BASELINE = '122628a'
KINDS = {1, 2, 3, 4, 6, 7, 8, 9}

def load(lua_path=None):
    if lua_path:
        sys.path.insert(0, lua_path)
    from lupa.lua51 import LuaRuntime
    lua = LuaRuntime(encoding=None)
    lua.execute(b'Lang={Item={},EntityName={}}')
    for name in ['EntityName.txt', 'Item.lua']:
        lua.execute((DATA/'language/Zh-CN'/name).read_bytes().removeprefix(b'\xef\xbb\xbf').split(b'\0',1)[0])
    lua.execute((DATA/'config/item/StdItems.txt').read_bytes())
    items = {int(v[b'id']):v for _,v in lua.globals().StdItems.items()}
    meta = {iid: {'kind':int(v[b'type']), 'tier':max([int(c[b'value']) for _,c in v[b'conds'].items() if c[b'cond']==13], default=0), 'suit':int(v[b'suitId'] or 0)} for iid,v in items.items()}
    source = subprocess.check_output(['git','show',BASELINE+':Server/S1001/data/config/monster/StdMonster.txt'],cwd=ROOT)
    expanded = re.sub(rb'--#include "drops\\([^"\r\n]+)"', lambda m:(DATA/'config/monster/drops'/m[1].decode()).read_bytes(), source)
    lua.execute(expanded)
    monsters = {int(m[b'entityid']): {'type':int(m[b'monsterType']), 'rows':[{k.decode():int(v) for k,v in r.items()} for _,r in sorted(m[b'drops'].items())]} for _,m in lua.globals().StdMonster.items()}
    return lua, items, meta, monsters

def equipment(row, meta):
    m = meta.get(row['id'], {})
    return row['type']==0 and m.get('kind') in KINDS and m.get('tier',0)>0

def probabilities(rows, job):
    n = len(rows)
    a = [1/n/r['propability'] if r['propability']>0 and r.get('Job',0) in (0,job) else 0 for r in rows]
    q = sum(a)
    factor = -math.expm1(n*math.log1p(-q))/q if 0<q<1 else 1 if q==1 else 0
    return [v*factor for v in a]

def serialize(value):
    if isinstance(value, dict):
        return '{'+','.join(('['+str(k)+']' if isinstance(k,int) else k)+'='+serialize(v) for k,v in value.items())+'}'
    if isinstance(value,(list,tuple)):
        return '{'+','.join(serialize(v) for v in value)+'}'
    if isinstance(value,bool):return 'true' if value else 'false'
    return str(value)

def build(lua, items, meta, monsters):
    profiles=[]; indices={}; mapping={}; audit={}
    named=lambda iid:lua.globals().Item[('n'+str(iid)).encode()] not in (None,b'null',b'')
    used=set()
    for mid,m in sorted(monsters.items()):
        eq=[r for r in m['rows'] if equipment(r,meta) and r['propability']>0 and r['count']>0]
        if m['type']!=4 or not eq:continue
        groups=collections.defaultdict(list)
        for index,r in enumerate(m['rows'],1):
            groups[('independent',index) if r['group']==0 else r['group']].append((index,r))
        weights=[];pools={}
        for job in (1,2,3):
            buckets=collections.defaultdict(float)
            for key,entries in groups.items():
                rows=[r for _,r in entries]
                ps=([1/rows[0]['propability'] if rows[0]['propability']>0 else 0] if isinstance(key,tuple) else probabilities(rows,job))
                for r,p in zip(rows,ps):
                    if not equipment(r,meta) or p==0:continue
                    tier=meta[r['id']]['tier'];suit=meta[r['id']]['suit']
                    family=suit if tier<=3 else 4+(suit-4)//3*3
                    key=(tier,family,r['bind'])
                    buckets[key]+=p*r['count']
            total=sum(buckets.values());assert total>0,mid
            distribution=[]
            for key,w in sorted(buckets.items()):
                tier,family,bind=key
                if key not in pools:
                    # Real named equipment in the existing family; null placeholders are never awarded.
                    suits={family} if tier<=3 else {family,family+1,family+2}
                    candidates={kind:sorted(iid for iid,v in meta.items() if v['kind']==kind and v['suit'] in suits and named(iid)) for kind in (1,2)}
                    assert all(candidates.values()),(mid,key)
                    assert all(meta[i]['tier'] in (tier,tier-1) for ids in candidates.values() for i in ids),(mid,key,candidates)
                    pools[key]={'tier':tier,'bind':bind,'weapons':candidates[1],'clothes':candidates[2]}
                    used.update(candidates[1]+candidates[2])
                distribution.append(dict(pools[key],weight=w/total))
            weights.append(distribution)
        disabled=[];mixed=[]
        for key,entries in groups.items():
            old=[(i,r) for i,r in entries if equipment(r,meta) and meta[r['id']]['kind'] in (1,2) and r['propability']>0]
            if not old:continue
            if isinstance(key,tuple):disabled.extend(i for i,_ in old);continue
            disabled.extend(i for i,_ in entries)
            others=[r for _,r in entries if not (equipment(r,meta) and meta[r['id']]['kind'] in (1,2)) and r['propability']>0]
            if not others:continue
            assert all(r['type']==0 and r['count']==1 and all(r.get(k,0)==0 for k in ('strong','quality','Job','LootTime','ExpireTime','openDay','CombineDrop','openMiniDay','FristHoleRate','EndMonthActivityDrop','qingdianActivity','NationalDayActivity','qingdianActivity_C','yuandanActivity','springfestival','shengdan')) for _,r in entries),(mid,key)
            mixed.append([{'id':r['id'],'propability':r['propability'],'bind':r['bind'],'omit':equipment(r,meta) and meta[r['id']]['kind'] in (1,2)} for _,r in entries])
            used.update(r['id'] for r in others)
        profile={'weights':weights,'mixed':mixed}
        sig=serialize(profile)
        if sig not in indices:indices[sig]=len(profiles)+1;profiles.append(profile)
        mapping[mid]={'profile':indices[sig],'disabled':sorted(disabled)}
        audit[mid]=weights
    assert len(mapping)==540
    broadcast={iid:{'dropBroadcast':int(items[iid][b'dropBroadcast'] or 0),'broadcast':bool(items[iid][b'flags'][b'broadcast'])} for iid in sorted(used)}
    return {'profiles':profiles,'monsters':mapping,'broadcast':broadcast},audit

def output(path, data, check):
    data=data.encode('utf8')
    if check:assert path.read_bytes()==data,str(path)+' is stale'
    else:path.write_bytes(data)

def generate(cfg,audit,lua,check=False,report_path=None):
    lines=['-- Generated by tools/patch_boss_equipment_drop.py; baseline '+BASELINE+'.', '-- Weapon 3%, clothes 5%; weights preserve native mean equipment counts.', 'LocalDT.BossEquipmentDrop = {', 'profiles={']
    lines.extend(serialize(p)+',' for p in cfg['profiles'])
    lines+=['},','monsters={']
    lines.extend('['+str(mid)+']='+serialize(v)+',' for mid,v in cfg['monsters'].items())
    lines+=['},','broadcast='+serialize(cfg['broadcast']),'}','']
    output(DATA/'config/monster/BossEquipmentDropCfg.lua','\n'.join(lines),check)
    preview={}
    for mid,v in cfg['monsters'].items():
        rows=cfg['profiles'][v['profile']-1]['weights'][0]
        highest=max(r['tier'] for r in rows)
        preview[mid]=sorted({iid for r in rows if r['tier']==highest for iid in r['weapons']+r['clothes']})
    output(DATA/'config/monster/BossEquipmentPreviewCfg.lua','-- Generated equipment preview; existing item IDs and icons.\nLocalDT.BossEquipmentPreview = '+serialize(preview)+'\n',check)
    report=['# BOSS 武器与衣服掉落调整','', '基准：`122628a`。共 540 种常规转生装备 BOSS；生肖专属装备 BOSS 保留原规则。', '', '每次击杀独立判定武器 3%、衣服 5%，各最多一件、数量为 1。普通装备掉率不变。档位权重为原有该档常规装备平均件数除以所有档平均件数。职业限制按击杀者职业计算，候选职业款式及男女衣服等概率。保留绑定状态和公告规则。', '', '菩提、无尘、芙蓉普通装备分别为 9、11、13 转，其有效武器衣服分别为 8、10、12 转，按同系列普通装备权重分配；不投放名称为 null 的占位装备。', '', '混合抽选组保留原组条数、有放回重试和成功终止规则，抽中旧武器衣服时结束该组但不产出旧装备。新掉落独立判定，避免重复产出或改变普通装备掉率。', '', '| BOSS ID | 名称 | 最高原档位 | 方案 |', '|---:|---|---:|---:|']
    for mid,entry in cfg['monsters'].items():
        name=lua.globals().EntityName[('m'+str(mid)).encode()].decode('utf8')
        report.append(f'| {mid} | {name} | {max(v["tier"] for v in audit[mid][0])} | P{entry["profile"]} |')
    for index,p in enumerate(cfg['profiles'],1):
        report+=['',f'## P{index}','', '| 职业 | 原档位 | 权重 | 武器每击杀概率 | 衣服每击杀概率 | 武器 ID | 衣服 ID | 绑定 |', '|---|---:|---:|---:|---:|---|---|---:|']
        jobs=range(3) if p['weights'][0]!=p['weights'][1] or p['weights'][0]!=p['weights'][2] else [0]
        for job in jobs:
            for row in p['weights'][job]:
                report.append('| '+ ('三职业一致' if len(jobs)==1 else ['战士','法师','道士'][job])+f' | {row["tier"]} | {row["weight"]*100:.9f}% | {row["weight"]*3:.9f}% | {row["weight"]*5:.9f}% | '+','.join(map(str,row['weapons']))+' | '+','.join(map(str,row['clothes']))+f' | {row["bind"]} |')
    report.append('')
    # Keep the detailed audit as a task artifact, outside the game configuration.
    if report_path:output(Path(report_path),'\n'.join(report),check)

if __name__ == '__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--lua-path');parser.add_argument('--check',action='store_true');parser.add_argument('--report');args=parser.parse_args()
    lua,items,meta,monsters=load(args.lua_path)
    cfg,audit=build(lua,items,meta,monsters)
    generate(cfg,audit,lua,args.check,args.report)
    print('Bosses',len(cfg['monsters']),'profiles',len(cfg['profiles']),'mixed groups',sum(len(cfg['profiles'][v['profile']-1]['mixed']) for v in cfg['monsters'].values()))
