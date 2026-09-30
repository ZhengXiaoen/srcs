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
BASELINE = "ca69794"


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
        start = code.index("LocalDT.DropBossMaterials = function")
        end = code.index("--当一个怪物被杀死", start)
        cls.helper = code[start:end]
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
        assert current.split(b"\n", 1)[1] == b"".join(remaining), path + ": unrelated bytes changed"
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
LogIds={BossMaterialDrop=2824,HuangGuBossDrop=2823}
System={
 getRandomNumber=function(limit) draws=draws+1; return randomValue % limit end,
 trace=function() errors=errors+1 end,
 broadcastTipmsg=function() broadcasts=broadcasts+1 end
}
Actor={getSceneId=function(m) return m.scene or 0 end,
 getEntityType=function(a) return a.kind or 0 end,
 getStaticVar=function(a) a.state=a.state or {}; return a.state end}
Item={
 createItem=function(id,count,strong,quality,bind)
  if failCreate then return nil end
  assert(count>0 and count<=255 and count<=LocalDT.BossMaterialMaxStack[id])
  return {id=id,count=count,strong=strong,quality=quality,bind=bind}
 end,
 createDropItem=function(monster,item,log,name,owner)
  if failDrop then return false end
  assert(log==2824 and name=='BossMaterialDrop' and owner==nil)
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
            self.assertFalse(re.search(rb'\bbroadcast\s*=\s*true', block))
            self.assertFalse(re.search(rb'\bdropBroadcast\s*=\s*[1-9]', block))

    def test_all_monsters_keep_baseline_rewards_for_same_draws(self):
        lua = self.runtime()
        for value in (0, 1, 7):
            for mid, ids in self.mapping.items():
                expected = defaultdict(int)
                for index in ids:
                    for cfg in self.originals[index]:
                        probability = cfg['propability']
                        if probability > 0 and (probability == 1 or value % probability == 0):
                            expected[(cfg['id'], cfg['bind'])] += cfg['count']
                lua.globals().randomValue = value
                lua.execute(f"drops={{}};drop({{}},{{}},{mid})")
                self.assertEqual(dict(expected), self.actual(lua), (mid, value))
                self.assertEqual(0, lua.globals().broadcasts)

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
            self.assertEqual(baseline(path),source(path))
        path=DATA+"config/monster/drops/drops2354.lua"
        self.assertEqual([x for x in rows(baseline(path)) if x['group']==13],
                         [x for x in rows(source(path)) if x['group']==13])


if __name__ == "__main__":
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path",type=Path)
    parser.add_argument("--baseline-ref",default=BASELINE)
    args=parser.parse_args()
    BASELINE=args.baseline_ref
    if args.lua_path:sys.path.insert(0,str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]],verbosity=2)
