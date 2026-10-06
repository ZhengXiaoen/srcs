"""Regress stacked BOSS material drops in Lua 5.1 and audit migration.

Use --lua-path for an isolated lupa installation. The baseline is the revision
before this refactor; no live server or database is changed.
"""
from __future__ import annotations

import argparse
from collections import defaultdict
from pathlib import Path
import re
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
DATA = "Server/S1001/data/"
CONFIG = DATA + "config/monster/BossMaterialDropCfg.lua"
MONSTERS = DATA + "config/monster/StdMonster.txt"
ITEMS = DATA + "config/item/StdItems.txt"
FUNCTION = DATA + "functions/MonsterFunction.lua"
BASELINE = "4b74c90"


def source(path):
    return (ROOT / path).read_bytes()


def baseline(path):
    return subprocess.check_output(["git", "show", BASELINE + ":" + path], cwd=ROOT)


def rows(data):
    return [dict((k.decode(), int(v)) for k, v in re.findall(rb"(\w+)=(-?\d+)", line))
            for line in data.splitlines() if line.startswith(b"{type=")]


def definitions(data, key):
    output = {}
    for block in re.split(rb"\r?\n\{\r?\n", data)[1:]:
        match = re.search(key + rb"=(\d+)", block)
        if match:
            output[int(match[1])] = block
    return output


class BossMaterialDropTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.lua = LuaRuntime(unpack_returned_tuples=True)
        cls.lua.execute("LocalDT={}")
        cls.lua.execute(source(CONFIG).decode("utf-8"))
        code = source(FUNCTION).decode("utf-8")
        cls.config = cls.lua.globals().LocalDT
        cls.templates = {int(k): [dict(row.items()) for _, row in table.items()]
                         for k, table in cls.config.BossMaterialDrops.items()}
        cls.mapping = {int(k): [int(v) for _, v in table.items()]
                       for k, table in cls.config.BossMaterialDropMonsters.items()}
        cls.stacks = dict(cls.config.BossMaterialMaxStack.items())
        cls.monsters = definitions(source(MONSTERS), b"entityid")
        cls.items = definitions(source(ITEMS), b"id")
        cls.originals = {}
        for index, migrated in cls.templates.items():
            path = DATA + f"config/monster/drops/drops{index}.lua"
            original = baseline(path)
            current = source(path)
            cls.originals[index] = rows(original)
            cls.assertion_migration(path, original, current, migrated)

    @classmethod
    def assertion_migration(cls, path, original, current, migrated):
        remaining = []
        expected = []
        for line in original.splitlines(keepends=True):
            parsed = rows(line)
            d = parsed[0] if parsed else None
            if d and any(all(d.get(k) == v for k, v in cfg.items()) for cfg in migrated):
                expected.append(d)
            else:
                remaining.append(line)
        assert current == b"".join(remaining), path + ": unrelated bytes changed"
        assert len(expected) == len(migrated), path + ": missing or duplicate migration"
        for old, new in zip(expected, migrated):
            assert all(old[k] == v for k, v in new.items()), path
            assert all(old.get(k, 0) == 0 for k in (
                "group", "LootTime", "ExpireTime", "strong", "quality", "Job", "openDay",
                "CombineDrop", "openMiniDay", "FristHoleRate", "EndMonthActivityDrop",
                "qingdianActivity", "NationalDayActivity", "qingdianActivity_C", "yuandanActivity",
                "springfestival", "shengdan")), path
        cls.originals[int(Path(path).stem[5:])] = expected

    def runtime(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute(r"""
LocalDT={}; drops={}; released=0; broadcasts=0; errors=0; draws=0
LogIds={BossMaterialDrop=2825,HuangGuBossDrop=2823}
ttChatWindow=128;ttScreenCenter=2;messages={};openDay=1
Lang={ScriptTips={zf560="%s/%s/%s/%d/%d"}}
ZhuanShengAccessoryDropCfg={tiers={}}
System={
 getRandomNumber=function(limit) draws=draws+1; return randomValue % limit end,
 trace=function() errors=errors+1 end,
 getDaysSinceOpenServer=function() return openDay end,
 broadcastTipmsg=function(msg,flags) broadcasts=broadcasts+1;table.insert(messages,{msg=msg,flags=flags}) end
}
Actor={getName=function(a) return a.name or "name" end,
 getSceneName=function(m) return "scene",10,20 end,
 getSceneId=function(m) return m.scene or 0 end,
 getEntityType=function(a) return a.kind or 0 end,
 getStaticVar=function(a) a.state=a.state or {}; return a.state end}
Item={
 getItemLinkMsg=function(id) return "item"..id end,
 createItem=function(id,count,strong,quality,bind)
  if failCreate then return nil end
  assert(count>0 and count<=255 and count<=(LocalDT.BossMaterialMaxStack[id] or 200))
  return {id=id,count=count,strong=strong,quality=quality,bind=bind}
 end,
 createDropItem=function(monster,item,log,name,owner)
  if failDrop then return false end
  assert((log==2825 and name=='BossMaterialDrop' or log==2823 and name=='HuangGuBoss') and owner==nil)
  table.insert(drops,item);return true
 end,
 releaseItemPtr=function() released=released+1 end
}
randomValue=0;OneTimesDropMonsters={};MonsterForQuest={};ShareHitMonsterForQuest={}
OnMonsterByKilled=function() end
MonDieDispatcher={CommonDieFunc=function()end}
""")
        lua.execute(source(CONFIG).decode("utf-8"))
        lua.execute(source(FUNCTION).decode("utf-8"))
        lua.execute("drop=LocalDT.DropBossMaterials")
        return lua

    def actual(self, lua):
        result = defaultdict(int)
        for _, item in lua.globals().drops.items():
            result[(int(item.id), int(item.bind))] += int(item.count)
        return dict(result)

    def test_mapping_follows_every_original_include(self):
        for mid, ids in self.mapping.items():
            include = [int(v) for v in re.findall(rb'--#include "drops\\drops(\d+)\.lua"', self.monsters[mid])]
            self.assertEqual(ids, [i for i in include if i in self.templates], mid)
        for mid, block in self.monsters.items():
            include = [int(v) for v in re.findall(rb'--#include "drops\\drops(\d+)\.lua"', block)]
            if any(i in self.templates for i in include):
                self.assertIn(mid, self.mapping)

    def test_material_types_stacks_and_broadcast_flags(self):
        for id, stack in self.stacks.items():
            block = self.items[id]
            self.assertEqual(stack, int(re.search(rb'\bdup=(\d+)', block)[1]))
            self.assertIn(int(re.search(rb'\btype=(\d+)', block)[1]), (102, 106))
            notice = self.config.BossMaterialBroadcast[id]
            day = int(re.search(rb'\bdropBroadcast=(-?\d+)', block)[1])
            flag = bool(re.search(rb'\bbroadcast\s*=\s*true', block))
            if day != 0 or flag:
                self.assertIsNotNone(notice)
                self.assertEqual(day, notice.dropBroadcast)
                self.assertEqual(flag, notice.broadcast)
            else:
                self.assertIsNone(notice)

    def test_all_monsters_keep_baseline_rewards_for_same_draws(self):
        lua = self.runtime()
        for value in (0, 1, 7):
            for mid, ids in self.mapping.items():
                expected = defaultdict(int)
                for index in ids:
                    for cfg in self.originals[index]:
                        probability = cfg['propability']
                        if probability > 0 and (probability == 1 or value % probability == 0):
                            expected[(cfg['id'], cfg['bind'])] += cfg['count'] if cfg['count'] > 0 else cfg['mincount'] + value % (cfg['maxcount'] - cfg['mincount'] + 1)
                lua.globals().randomValue = value
                lua.execute(f"drops={{}};drop({{}},{{}},{mid})")
                self.assertEqual(dict(expected), self.actual(lua), (mid, value))
                # Broadcast behavior is checked separately below.

    def test_repeated_crystals_merge_and_count_beats_minmax(self):
        lua = self.runtime()
        mid = next(i for i, ids in self.mapping.items() if 2999 in ids)
        # Isolate the original two guaranteed and three optional rows of each crystal.
        lua.execute(f"LocalDT.BossMaterialDropMonsters[{mid}]={{2999}};randomValue=1;drop({{}},{{}},{mid})")
        self.assertEqual({(537,1):2,(572,1):2}, self.actual(lua))
        self.assertEqual(2, len(lua.globals().drops))
        lua.execute(f"drops={{}};randomValue=0;drop({{}},{{}},{mid})")
        self.assertEqual({(537,1):5,(572,1):5}, self.actual(lua))

    def test_player_pet_and_hero_use_same_callback(self):
        mid = next(i for i, ids in self.mapping.items() if 2130 in ids)
        results=[]
        for kind in (0, 2, 3):
            lua = self.runtime()
            self.assertTrue(lua.execute(f"return HandlerMonsterByKilled({{}},{{kind={kind}}},{mid},0,0,nil)"))
            results.append(self.actual(lua))
        self.assertTrue(results[0])
        self.assertEqual(results[0], results[1])
        self.assertEqual(results[0], results[2])

    def test_unknown_or_nil_killer_produces_no_extra_items(self):
        lua=self.runtime()
        mid=next(iter(self.mapping))
        lua.execute(f"drop({{}},nil,{mid});drop(nil,{{}},{mid});drop({{}},{{}},999999)")
        self.assertEqual({},self.actual(lua))

    def test_one_time_guard_prevents_repeat_materials(self):
        lua=self.runtime();mid=next(iter(self.mapping))
        lua.execute(f"OneTimesDropMonsters[{mid}]=true;actor={{}};monster={{}}")
        self.assertTrue(lua.execute(f"return HandlerMonsterByKilled(monster,actor,{mid},0,0,nil)"))
        first=self.actual(lua)
        self.assertFalse(lua.execute(f"return HandlerMonsterByKilled(monster,actor,{mid},0,0,nil)"))
        self.assertEqual(first,self.actual(lua))

    def test_binding_separate_large_stacks_and_disabled_rows(self):
        lua=self.runtime()
        lua.execute(r"""
LocalDT.BossMaterialBroadcast[568]=nil
LocalDT.BossMaterialDropMonsters[999]={999}
LocalDT.BossMaterialDrops[999]={
 {id=568,count=180,propability=1,bind=1},
 {id=568,count=90,propability=1,bind=1},
 {id=568,count=5,propability=1,bind=0},
 {id=568,count=99,propability=0,bind=1}
};drop({}, {}, 999)
""")
        self.assertEqual({(568,1):270,(568,0):5},self.actual(lua))
        self.assertEqual([200,70,5],[int(i.count) for _,i in lua.globals().drops.items()])
        self.assertEqual(0,lua.globals().draws)

    def test_item_creation_and_ground_failure_do_not_leak(self):
        for failure, released in (("failCreate",0),("failDrop",1)):
            lua=self.runtime()
            lua.execute(f"LocalDT.BossMaterialDropMonsters[999]={{999}};LocalDT.BossMaterialDrops[999]={{{{id=568,count=3,propability=1,bind=1}}}};{failure}=true;drop({{}},{{}},999)")
            self.assertEqual({},self.actual(lua))
            self.assertEqual(released,lua.globals().released)
            self.assertEqual(1,lua.globals().errors)

    def test_protected_materials_and_mixed_equipment_groups_unchanged(self):
        for index in (2184,2201,2331,2332,2351):
            path=DATA+f"config/monster/drops/drops{index}.lua"
            original_without_gold = b"".join(
                line for line in baseline(path).splitlines(keepends=True)
                if not re.match(rb"\s*\{type=[56],", line))
            # Only the independent rows may move out of a protected/mixed table.
            for cfg in self.templates.get(index, []):
                matching = next(line for line in original_without_gold.splitlines(keepends=True)
                                if rows(line) and all(rows(line)[0].get(k)==v for k,v in cfg.items()))
                original_without_gold=original_without_gold.replace(matching,b"",1)
            self.assertEqual(original_without_gold,source(path))
        path=DATA+"config/monster/drops/drops2354.lua"
        self.assertEqual([x for x in rows(baseline(path)) if x['group']==13],
                         [x for x in rows(source(path)) if x['group']==13])

    def test_broadcast_merge_day_limits_failure_and_stack_split(self):
        for day in (0,1,3,4,5,6,7,8,100):
            for item,limit in ((491,3),(5363,3),(5364,5),(5365,7),(5171,-1)):
                lua=self.runtime()
                lua.execute(f"openDay={day};LocalDT.BossMaterialDropMonsters[999]={{999}};LocalDT.BossMaterialDrops[999]={{{{id={item},count=2,propability=1,bind=0}},{{id={item},count=3,propability=1,bind=0}}}};drop({{}},{{}},999)")
                self.assertEqual({(item,0):5},self.actual(lua))
                self.assertEqual(1,len(lua.globals().drops))
                expected=int(limit==-1 or day<=limit)
                self.assertEqual(expected,lua.globals().broadcasts,(item,day))
                if expected:
                    self.assertIn(" x5",lua.globals().messages[1].msg)
                    self.assertEqual(128,lua.globals().messages[1].flags)
        for failure in ("failCreate","failDrop"):
            lua=self.runtime()
            lua.execute(f"LocalDT.BossMaterialDropMonsters[999]={{999}};LocalDT.BossMaterialDrops[999]={{{{id=491,count=5,propability=1,bind=0}}}};{failure}=true;drop({{}},{{}},999)")
            self.assertEqual(0,lua.globals().broadcasts)
        lua=self.runtime()
        lua.execute("LocalDT.BossMaterialDropMonsters[999]={999};LocalDT.BossMaterialDrops[999]={{id=491,count=250,propability=1,bind=0}};drop({},{},999)")
        self.assertEqual([200,50],[i.count for _,i in lua.globals().drops.items()])
        self.assertEqual(2,lua.globals().broadcasts)
        lua.execute("messages={};broadcasts=0;LocalDT.BossMaterialBroadcast[491].broadcast=true;openDay=100;drop({},{},999)")
        self.assertEqual(2,lua.globals().broadcasts)
        self.assertTrue(all(i.flags==130 for _,i in lua.globals().messages.items()))

    def test_random_count_and_huanggu_group_boundaries(self):
        lua=self.runtime()
        lua.execute("LocalDT.BossMaterialDropMonsters[999]={999};LocalDT.BossMaterialDrops[999]={{id=568,count=0,mincount=3,maxcount=5,propability=1,bind=0}};randomValue=2;drop({},{},999)")
        self.assertEqual({(568,0):5},self.actual(lua))
        for upper in (False,True):
            for chance in (29,30):
                lua=self.runtime();lua.globals().randomValue=chance
                lua.execute("LocalDT.BossMaterialDropMonsters[635]=nil;math.random=function(a,b) return "+("b" if upper else "a")+" end;HandlerMonsterByKilled({scene=286},{},635,0,286,nil)")
                expected={(552,0):5 if upper else 3}
                if chance<30:expected[(553,0)]=2 if upper else 1
                self.assertEqual(expected,self.actual(lua))
                self.assertEqual(len(expected),len(lua.globals().drops))

    def test_frontend_stack_ids_and_pack_copies(self):
        from patch_guild_quest_config import read_cbp,read_pack
        client=ROOT/"web/v2/lang/zh-cn";pack=dict(read_pack((client/"zh-cn.dat").read_bytes()));found=defaultdict(list)
        for path in client.glob("stditems*.cbp"):
            self.assertEqual(path.read_bytes(),pack[path.name],path.name)
            _,tree=read_cbp(path.read_bytes())
            for node in tree.children:
                item=int(node.child("id").number())
                if item in self.stacks:found[item].append(int(node.child("dup").number()))
        self.assertEqual(set(self.stacks),set(found))
        for item,values in found.items():self.assertTrue(all(v==self.stacks[item] for v in values),(item,values))


if __name__ == "__main__":
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path",type=Path)
    parser.add_argument("--baseline-ref",default=BASELINE)
    args=parser.parse_args()
    BASELINE=args.baseline_ref
    if args.lua_path:sys.path.insert(0,str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]],verbosity=2)
