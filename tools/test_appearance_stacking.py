"""Check appearance stack resources and real Lua 5.1 consumption handlers.

Requires lupa.lua51; pass --lua-path when using a separate dependency directory.
"""

from __future__ import annotations

import argparse
from copy import deepcopy
from pathlib import Path
import re
import subprocess
import sys
import unittest

from patch_box_stacking import DUP, ITEM_DIR, ROOT, SERVER, appearance_groups, server_items, stack_limit
from patch_guild_quest_config import read_cbp, read_pack
import test_thor_legend_stacking as thor


BASELINE = "7e798b5"
GROUPS = appearance_groups()
APPEARANCES = set().union(*(ids for group, ids in GROUPS.items() if group != "ride_gear"))
EXISTING = {*range(5947, 5951), *range(6272, 6276)}
NEW = (APPEARANCES - EXISTING) | GROUPS["ride_gear"]
SHIELD = ROOT / "Server/S1001/data/functions/EquipEnhance/ShenDunSystem.lua"
MAKE = ROOT / "Server/S1001/data/functions/ShenDunMake.lua"
FASHION = ROOT / "Server/S1001/data/functions/modules/fashion_dress.lua"
CONFIG = ROOT / "Server/S1001/data/config"


def original(path):
    return subprocess.check_output(
        ["git", "show", BASELINE + ":" + path.relative_to(ROOT).as_posix()], cwd=ROOT)


def execute_file(lua, path):
    lua.execute(path.read_text(encoding="utf-8-sig"))


def activation_runtime():
    thor.LuaRuntime = LuaRuntime
    lua = thor.runtime()
    source = thor.PLAYER.read_text(encoding="utf-8-sig")
    start = source.index("LocalDT.IsFixedTaoStrongEquipment = function(")
    end = source.index("LocalDT.GetSRRefreshMonsterSave = function(", start)
    lua.execute(source[start:end])
    lua.execute("Item.ipItemType=11; itemTypes={};"
                "Item.getItemPropertyById=function(id,p) assert(p==11); return itemTypes[id] end")
    items = server_items(SERVER.read_bytes())
    for item, block in items.items():
        lua.globals().itemTypes[item] = int(re.search(rb"(?m)^  type=(\d+),", block)[1])
    return lua


def consumption_runtime():
    lua = LuaRuntime(unpack_returned_tuples=True)
    lua.execute("""
counts = {}; added = {}; removals = {}; slots = {}; recalculated = 0
LogIds = {}; ttFlyTip = 1; ttChatWindow = 2; PROP_ACTOR_VOCATION = 3; job = 1
Actor = {
 getItemCount = function(_, id) return counts[id] or 0 end,
 removeItem = function(_, id, n, a, b, bind)
  if failRemove then return 0 end
  assert((counts[id] or 0) >= n)
  counts[id] = counts[id] - n
  table.insert(removals,{id=id,count=n,bind=bind}); return n
 end,
 addItem = function(_,id,a,b,n,bind)
  table.insert(added,{id=id,count=n,bind=bind}); counts[id]=(counts[id] or 0)+n
 end,
 removeItemByPtr = function(_,p,n)
  if failRemove then return 0 end
  assert(n==1 and p.count>=n); p.count=p.count-n; return n
 end,
 getIntProperty = function(_,prop) assert(prop==3); return job end,
 getName = function() return 'test' end,
 sendTipmsg = function() end,
 getShenDunInfo = function(_,slot) return slots[slot] or 0 end,
 setShenDunInfo = function(_,slot,id) slots[slot]=id; return true end,
 getShenDunChoose = function() return 0 end,
 collectOperate = function() recalculated=recalculated+1 end
}
Item = {
 ipItemID = 1,
 getItemProperty = function(_,p,prop) assert(prop==1); return p.id end,
 getBagItemPtrByGuid = function(_,guid) assert(guid==42); return itemPtr end,
 getItemName = function(id) return tostring(id) end,
 getItemLinkMsg = function(id) return tostring(id) end,
 getBagEmptyGridCount = function() return freeSlots or 0 end,
 getAddItemNeedGridCount = function(_,id,n,a,b,bind)
  assert(n==1 and bind==1); return needSlots or 0
 end,
 createItem = function(id,n,a,b,bind) assert(n==1); return {id=id,count=n,bind=bind} end,
 addItem = function(_,p) table.insert(added,p) end
}
DataPack = {
 readByte = function(p) return p.slot end,
 readUint64 = function(p) return p.guid end,
 allocPacket = function() return {} end,
 writeInt = function() end, writeByte = function() end, flush = function() end
}
System = {broadcastTipmsg=function() end}
LogicCmd = {miscSysEx={sub={}}}
MiscsImplementEx = {registerMsgHandler=function() end}
EventCallDispatcher = {registerEventCall=function() end}
BaseTypes = {ActorEventId={}}
""")
    return lua


class AppearanceStackingTests(unittest.TestCase):
    def test_157_new_items_change_only_stack_limit_in_all_text_copies(self):
        self.assertEqual({"ride": 26, "ride_gear": 20, "shield": 32, "fashion": 87},
                         {group: len(ids) for group, ids in GROUPS.items()})
        self.assertEqual(157, len(NEW))
        compile_source = LuaRuntime(encoding=None).eval(
            b"function(s) return assert(loadstring(s)) ~= nil end")
        paths = [SERVER, ITEM_DIR / "StdItems - 副本.txt",
                 *sorted((ITEM_DIR / "stdItemForClient").glob("StdItems*.txt"))]
        for path in paths:
            before, after = original(path), path.read_bytes()
            self.assertEqual(DUP.sub(rb"\1LIMIT\3", before), DUP.sub(rb"\1LIMIT\3", after), path)
            self.assertTrue(compile_source(after.removeprefix(b"\xef\xbb\xbf")))
            if path.name == "StdItems5.txt":
                continue
            old, new = server_items(before), server_items(after)
            changed = {item for item in old if old[item] != new[item]}
            self.assertEqual(NEW & old.keys(), changed, path)
            for item in changed:
                self.assertEqual((1, 200), (stack_limit(old[item]), stack_limit(new[item])))
        for path in [thor.PLAYER, thor.BOX, SHIELD, MAKE, FASHION]:
            self.assertTrue(compile_source(path.read_bytes().removeprefix(b"\xef\xbb\xbf")))

    def test_client_fields_and_other_packed_resources_are_preserved(self):
        client = ROOT / "web/v2/lang/zh-cn"
        previous = read_pack(original(client / "zh-cn.dat"))
        packed_before = dict(previous)
        found = set()
        for path in sorted(client.glob("stditems*.cbp")):
            _, before = read_cbp(packed_before[path.name])
            _, after = read_cbp(path.read_bytes())
            expected = deepcopy(before)
            for row in expected.children:
                item = int(row.child("id").number())
                if item in NEW:
                    self.assertEqual(1, row.child("dup").number())
                    row.child("dup").set_number(200)
                    found.add(item)
            self.assertEqual(expected, after, path)
        self.assertEqual(NEW, found)
        current = read_pack((client / "zh-cn.dat").read_bytes())
        self.assertEqual(len(previous), len(current))
        changed = set()
        for old, new in zip(previous, current):
            self.assertEqual(old[0], new[0])
            if old != new:
                changed.add(old[0])
                self.assertEqual((client / old[0]).read_bytes(), new[1])
        self.assertEqual({"stditems.cbp", "stditems4.cbp"}, changed)

    def test_cleanup_preserves_quantity_binding_base_attributes_and_ride_gear(self):
        lua = activation_runtime()
        classify = lua.globals().LocalDT.IsStackableActivationItem
        self.assertEqual(APPEARANCES | thor.MATERIALS,
                         {item for item in range(1, 7968) if classify(item)})
        for item in sorted(APPEARANCES):
            lua.execute(f"bag[#bag+1]={{id={item},count=200,bind=1,tao=6,base=188,expires=123456}}")
        for item in sorted(GROUPS["ride_gear"]):
            lua.execute(f"bag[#bag+1]={{id={item},count=200,bind=0,tao=3,base=380}}")
        lua.execute("bag[#bag+1]={id=451,count=1,bind=0,tao=6,base=42};"
                    "LocalDT.NormalizeActivationItemStacks(1)")
        for row in lua.globals().bag.values():
            if row.id in APPEARANCES:
                self.assertEqual((200, 1, 0, 188, 123456),
                                 (row.count, row.bind, row.tao, row.base, row.expires))
            elif row.id in GROUPS["ride_gear"]:
                self.assertEqual((200, 0, 3, 380), (row.count, row.bind, row.tao, row.base))
        lua.execute("LocalDT.NormalizeBagEquipmentTaoStrong(1)")
        for row in lua.globals().bag.values():
            if row.id in GROUPS["ride_gear"]:
                self.assertEqual((200, 0, 6, 380), (row.count, row.bind, row.tao, row.base))
        lua.execute("bag={{id=6888,count=200,bind=1,tao=4},{id=7658,count=200,bind=1,tao=5}};"
                    "LocalDT.NormalizeActivationItemStacks(1,7658)")
        self.assertEqual((4, 0), (lua.globals().bag[1].tao, lua.globals().bag[2].tao))
        self.assertEqual(0, lua.globals().removed)

    def test_box_rewards_have_consistent_properties_and_consume_one(self):
        lua = activation_runtime()
        for item in sorted(APPEARANCES | GROUPS["ride_gear"]):
            lua.execute(f"added={{}};box={{count=200}};"
                        f"onItemBoxFor2017(1,7047,box,{{item_id=7047,type=0,bind=1,"
                        f"giveid={{{item}}}}},0,200)")
            reward = lua.globals().added[1]
            self.assertEqual((item, 1, 1), (reward[2], reward[5], reward[6]))
            if item in GROUPS["ride_gear"]:
                self.assertEqual(14, len(reward))
                self.assertEqual(6, reward[14])
            else:
                self.assertEqual(9, len(reward))
            self.assertEqual(199, lua.globals().box.count)
        self.assertEqual(0, lua.globals().randomCalls)

    def test_shield_wear_return_and_three_to_one_synthesis(self):
        lua = consumption_runtime()
        execute_file(lua, CONFIG / "equipSynthesis/ShenDunCfg.lua")
        execute_file(lua, SHIELD)
        execute_file(lua, MAKE)
        for item in sorted(GROUPS["shield"]):
            lua.execute(f"slots={{}};added={{}};recalculated=0;itemPtr={{id={item},count=200,bind=1}};"
                        "TakeOnShenDunEquipment(1,{slot=1,guid=42})")
            self.assertEqual((199, item, 1), (lua.globals().itemPtr.count,
                             lua.globals().slots[0], lua.globals().recalculated))
            lua.execute("TakeOnShenDunEquipment(1,{slot=1,guid=42})")
            self.assertEqual(199, lua.globals().itemPtr.count)
            self.assertTrue(lua.globals().TakeOffShenDunEquipment(1, lua.table_from({"slot": 1})))
            reward = lua.globals().added[1]
            self.assertEqual((item, 1, 1), (reward.id, reward.count, reward.bind))
            self.assertEqual((0, 2), (lua.globals().slots[0], lua.globals().recalculated))
        lua.execute("slots={};failRemove=true;itemPtr={id=7658,count=200,bind=1};"
                    "TakeOnShenDunEquipment(1,{slot=1,guid=42});failRemove=false")
        self.assertIsNone(lua.globals().slots[0])
        self.assertEqual(200, lua.globals().itemPtr.count)
        for group, cfg in lua.globals().ShenDunMakeCfg.items():
            for index, recipe in cfg.list.items():
                lua.execute(f"added={{}};removals={{}};counts={{[{recipe.itemid}]=200}}")
                lua.globals().ShenDunMakeMkae(1, group, index)
                self.assertEqual(197, lua.globals().counts[recipe.itemid])
                self.assertEqual((recipe.destid, 1), (lua.globals().added[1].id,
                                                     lua.globals().added[1].count))
                lua.execute(f"added={{}};failRemove=true;counts={{[{recipe.itemid}]=200}}")
                lua.globals().ShenDunMakeMkae(1, group, index)
                self.assertEqual(0, len(lua.globals().added))
                self.assertEqual(200, lua.globals().counts[recipe.itemid])
                lua.execute("failRemove=false")

    def test_fashion_activation_and_upgrades_consume_configured_totals(self):
        lua = consumption_runtime()
        execute_file(lua, CONFIG / "modules/fashion_dress_cfg.lua")
        execute_file(lua, FASHION)
        tested = set()
        for _, dress in lua.globals().fashion_dress_cfg.dress_list.items():
            for job, cfg in dress.items():
                if cfg.itemId not in APPEARANCES or cfg.upgradeItemCounts is None:
                    continue
                for level in (-1, 0, 10):
                    amount = cfg.upgradeItemCounts[level + 2]
                    if amount is None:
                        continue
                    material = cfg.itemId if level in (-1, 10) else cfg.upgradeItemId
                    lua.execute(f"counts={{[{material}]=200}};removals={{}};job={job}")
                    result = lua.globals().handleFashionDress_Upgrade(1, cfg.itemId, level, 1)
                    self.assertEqual(level + 1, result)
                    self.assertEqual(200 - amount, lua.globals().counts[material])
                    removal = lua.globals().removals[1]
                    self.assertEqual((material, amount, 1), (removal.id, removal.count, removal.bind))
                    lua.execute(f"counts={{[{material}]=200}};removals={{}};failRemove=true")
                    self.assertEqual(-1, lua.globals().handleFashionDress_Upgrade(1, cfg.itemId, level, 1))
                    self.assertEqual(200, lua.globals().counts[material])
                    lua.execute("failRemove=false")
                tested.add(cfg.itemId)
        self.assertTrue(GROUPS["fashion"] - {6013, 6014, 6015} <= tested)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
