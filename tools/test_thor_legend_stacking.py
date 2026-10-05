"""Verify Thor/Legend material resources and real Lua 5.1 bag/box handlers."""

from __future__ import annotations

import argparse
from pathlib import Path
import re
import subprocess
import sys
import unittest

from patch_box_stacking import ROOT, SERVER, patch_client, patch_text, server_items, stack_limit, targets
from patch_guild_quest_config import read_cbp, read_pack


BASELINE = "eea0975"
MATERIALS = {6392, 6393, *range(6396, 6402), *range(7078, 7086),
             *range(7094, 7134), *range(7928, 7968)}
PLAYER = ROOT / "Server/S1001/data/functions/player.lua"
BOX = ROOT / "Server/S1001/data/functions/Qfunctions.lua"


def original(path):
    return subprocess.check_output(
        ["git", "show", BASELINE + ":" + path.relative_to(ROOT).as_posix()], cwd=ROOT)


def runtime():
    lua = LuaRuntime(unpack_returned_tuples=True)
    lua.execute("""
LocalDT = {}; bag = {}; added = {}; removed = 0; randomCalls = 0
LogIds = {}; GameLog = {}; ttChatWindow = 1
Item = {
 ipTaoStrong = 10,
 getBagItemCount = function() return #bag end,
 getItemPtrByIndex = function(_, i) return bag[i + 1] end,
 getItemId = function(p) return p.id end,
 getItemProperty = function(_, p, prop) assert(prop == 10); return p.tao end,
 setItemProperty = function(_, p, prop, v) assert(prop == 10); p.tao = v end,
 getItemName = function(id) return tostring(id) end,
 getBagEmptyGridCount = function() return 10 end,
 getItemLinkMsg = function(id) return tostring(id) end
}
Actor = {
 removeItemByPtr = function(_, p, count)
  if failRemove then return 0 end
  assert(count == 1 and p.count > 0); p.count = p.count - count
  removed = removed + count; return count
 end,
 addItem = function(...) table.insert(added, {...}) end,
 getName = function() return 'test' end
}
System = {
 getRandomNumber = function() randomCalls = randomCalls + 1; return 5 end,
 broadcastTipmsg = function() end,
 getDaysSinceOpenServer = function() return 10 end
}
""")
    source = PLAYER.read_text(encoding="utf-8-sig")
    start = source.index("LocalDT.IsThorLegendMaterial = function(")
    end = source.index("LocalDT.IsFixedTaoStrongEquipment = function(", start)
    lua.execute(source[start:end])
    source = BOX.read_text(encoding="utf-8-sig")
    start = source.index("function onItemBoxFor2017(")
    end = source.index("\nfunction ", start + 1)
    lua.execute(source[start:end])
    return lua


class ThorLegendStackingTests(unittest.TestCase):
    def test_96_materials_remain_stackable_with_configured_extensions(self):
        limits, _ = targets(original(SERVER))
        paths = [ROOT / "Server/S1001/data/config/item/StdItems.txt",
                 ROOT / "Server/S1001/data/config/item/stdItemForClient/StdItems4.txt"]
        for path in paths:
            before, after = original(path), path.read_bytes()
            self.assertEqual(patch_text(before, limits)[0], after)
            old, new = server_items(before), server_items(after)
            changed = {item for item in old if old[item] != new[item]}
            self.assertTrue(MATERIALS <= changed)
            for item in MATERIALS:
                self.assertEqual(1, stack_limit(old[item]))
                self.assertEqual(200, stack_limit(new[item]))
                self.assertRegex(new[item], rb"(?m)^  type=106,")
        lua = LuaRuntime(encoding=None)
        compile_source = lua.eval(b"function(s) return assert(loadstring(s)) ~= nil end")
        for path in [*paths, PLAYER, BOX]:
            self.assertTrue(compile_source(path.read_bytes().removeprefix(b"\xef\xbb\xbf")))

    def test_client_and_pack_change_only_matching_dup_fields(self):
        limits, _ = targets(original(SERVER))
        path = ROOT / "web/v2/lang/zh-cn/stditems4.cbp"
        _, before = read_cbp(original(path))
        _, after = read_cbp(path.read_bytes())
        changed = set()
        for row in before.children:
            item = int(row.child("id").number())
            if item in MATERIALS:
                self.assertEqual(1, row.child("dup").number())
                self.assertEqual(106, row.child("type").number())
                changed.add(item)
        self.assertEqual(MATERIALS, changed)
        _, expected = read_cbp(patch_client(original(path), limits)[0])
        self.assertEqual(expected, after)
        pack = path.parent / "zh-cn.dat"
        previous = read_pack(original(pack))
        current = read_pack(pack.read_bytes())
        self.assertEqual(len(previous), len(current))
        for old, new in zip(previous, current):
            self.assertEqual(old[0], new[0])
            if old[0].startswith("stditems") and old[0].endswith(".cbp"):
                self.assertEqual(patch_client(old[1], limits)[0], new[1])
                self.assertEqual((path.parent / old[0]).read_bytes(), new[1])
            else:
                self.assertEqual(old, new)

    def test_legacy_attributes_clear_without_changing_quantity_or_binding(self):
        lua = runtime()
        classify = lua.globals().LocalDT.IsThorLegendMaterial
        self.assertEqual(MATERIALS, {item for item in range(1, 7968) if classify(item)})
        for item in sorted(MATERIALS):
            lua.execute(f"table.insert(bag,{{id={item},count=200,bind=1,tao=6}})")
            lua.execute(f"table.insert(bag,{{id={item},count=3,bind=0,tao=2}})")
        lua.execute("bag[#bag+1]={id=6404,count=1,bind=1,tao=6};"
                    "bag[#bag+1]={id=7537,count=1,bind=1,tao=6};"
                    "LocalDT.NormalizeActivationItemStacks(1)")
        for index in range(len(lua.globals().bag)):
            row = lua.globals().bag[index + 1]
            if row.id in MATERIALS:
                self.assertEqual(0, row.tao)
                self.assertEqual((200, 1) if index % 2 == 0 else (3, 0), (row.count, row.bind))
            else:
                self.assertEqual((1, 1, 6), (row.count, row.bind, row.tao))
        self.assertEqual(0, lua.globals().removed)
        lua.execute("bag={{id=7078,count=3,bind=0,tao=4},{id=7080,count=2,bind=1,tao=5}};"
                    "LocalDT.NormalizeActivationItemStacks(1,6404)")
        self.assertEqual((4, 5), (lua.globals().bag[1].tao, lua.globals().bag[2].tao))
        lua.execute("LocalDT.NormalizeActivationItemStacks(1,7078)")
        self.assertEqual((0, 5), (lua.globals().bag[1].tao, lua.globals().bag[2].tao))
        source = PLAYER.read_text(encoding="utf-8-sig")
        self.assertIn("LocalDT.NormalizeActivationItemStacks(sysarg)\n", source)
        self.assertIn("LocalDT.NormalizeActivationItemStacks(sysarg, itemId)\n", source)

    def test_box_materials_have_no_random_attribute_and_consume_one(self):
        lua = runtime()
        for item in sorted(MATERIALS):
            lua.execute(f"added={{}};box={{count=200}};"
                        f"onItemBoxFor2017(1,7651,box,{{item_id=7651,type=0,"
                        f"bind=1,giveid={{{item}}}}},0,200)")
            result = lua.globals().added[1]
            self.assertEqual((item, 1, 1), (result[2], result[5], result[6]))
            self.assertEqual(9, len(result))
            self.assertEqual(199, lua.globals().box.count)
        self.assertEqual(0, lua.globals().randomCalls)
        lua.execute("added={};box={count=200};"
                    "onItemBoxFor2017(1,376,box,{item_id=376,type=0,bind=1,giveid={451}},0,1)")
        self.assertEqual(14, len(lua.globals().added[1]))
        self.assertEqual(6, lua.globals().added[1][14])
        lua.execute("added={};box={count=200};failRemove=true;"
                    "onItemBoxFor2017(1,7651,box,{item_id=7651,type=0,bind=1,giveid={7080}},0,1)")
        self.assertEqual(0, len(lua.globals().added))
        self.assertEqual(200, lua.globals().box.count)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    parser.add_argument("--baseline-ref", default=BASELINE)
    args = parser.parse_args()
    BASELINE = args.baseline_ref
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
