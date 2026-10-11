"""Exercise actual Lua warrior rate handlers and compare packed client resources."""
import argparse
from pathlib import Path
import re
import subprocess
import sys
import unittest

from patch_box_stacking import ROOT, server_items
from patch_guild_quest_config import read_cbp, read_pack

PLAYER = ROOT / "Server/S1001/data/functions/player.lua"
BOX = ROOT / "Server/S1001/data/functions/Qfunctions.lua"
CLIENT = ROOT / "web/v2/lang/zh-cn/stditems1.cbp"
PACK = CLIENT.parent / "zh-cn.dat"
LANGUAGE = ROOT / "Server/S1001/data/language/Zh-CN/Item.lua"
BASELINE = "c9a3c2c6dde6ca598a010806e1566a12c25692bc"


def baseline(path):
    return subprocess.check_output(["git", "show", BASELINE + ":" + path.relative_to(ROOT).as_posix()], cwd=ROOT)


def runtime():
    lua = LuaRuntime(unpack_returned_tuples=True)
    lua.execute("""
LocalDT={}; bag={}; writes=0; types={};
Item={ipItemType=1, ipheroDamageRateEx=2, ipHeroDamageRate=3}
Item.getItemProperty=function(_,p,k) if k==1 then return p.type elseif k==2 then return p.max else return p.rate end end
Item.setItemProperty=function(_,p,k,v) assert(k==3); p.rate=v; writes=writes+1; return true end
Item.getItemPropertyById=function(id) return types[id] end
Item.getBagItemCount=function() return #bag end
Item.getItemPtrByIndex=function(_,i) return bag[i+1] end
Item.getItemId=function(p) return p.id end
""")
    source = PLAYER.read_text(encoding="utf-8-sig")
    begin = source.index("LocalDT.NormalizeWarriorEquipmentRate = function(")
    end = source.index("LocalDT.GetSRRefreshMonsterSave = function(", begin)
    lua.execute(source[begin:end])
    return lua


class WarriorRateTests(unittest.TestCase):
    def test_all_warrior_types_use_cap_and_are_idempotent(self):
        lua = runtime()
        lua.execute("""
for t=201,205 do
 for old=0,10 do
  local item={id=1783,type=t,max=10,rate=old}
  assert(LocalDT.NormalizeWarriorEquipmentRate(1,item)==(old~=10))
  assert(item.rate==10)
  assert(not LocalDT.NormalizeWarriorEquipmentRate(1,item))
 end
end
for _,t in ipairs({1,115,200,206}) do
 local item={type=t,max=10,rate=2}
 assert(not LocalDT.NormalizeWarriorEquipmentRate(1,item)); assert(item.rate==2)
end
assert(not LocalDT.NormalizeWarriorEquipmentRate(1,nil))
assert(not LocalDT.NormalizeWarriorEquipmentRate(1,{type=201,max=0,rate=2}))
""")

    def test_login_and_new_item_bag_filter(self):
        lua = runtime()
        lua.execute("""
bag={{id=1783,type=201,max=10,rate=1},{id=1784,type=202,max=10,rate=2},{id=7057,type=115,max=10,rate=3}}
types[1783]=201; types[1784]=202; types[7057]=115
LocalDT.NormalizeBagWarriorEquipmentRate(1,7057); assert(writes==0)
LocalDT.NormalizeBagWarriorEquipmentRate(1,1783)
assert(bag[1].rate==10 and bag[2].rate==2 and writes==1)
LocalDT.NormalizeBagWarriorEquipmentRate(1)
assert(bag[2].rate==10 and bag[3].rate==3 and writes==2)
""")

    def test_warrior_box_does_not_overwrite_rate_with_random(self):
        lua = runtime()
        lua.execute("""
System={getRandomNumber=function(n) randomCalls=randomCalls+1; return 0 end}
Actor={getItemName=function() return 'box' end, removeItemByPtr=function() return 1 end}
Item.getBagEmptyGridCount=function() return 1 end
Item.getItemName=function() return 'box' end
Item.createItem=function(id) created={id=id,type=201,max=10,rate=1}; return created end
Item.SetItemRuneAttr=function() end
Item.addItem=function(_,p) LocalDT.NormalizeWarriorEquipmentRate(1,p) end
randomCalls=0
""")
        source = BOX.read_text(encoding="utf-8-sig")
        begin = source.index("function onFuWenBox(")
        end = source.index("\nfunction ", begin + 1)
        lua.execute(source[begin:end])
        lua.execute("onFuWenBox(1,0,{}, {item_id=5366,index=13},0,1); assert(created.rate==10 and randomCalls==0)")

    def test_client_keeps_original_descriptions_and_matching_caps(self):
        items = server_items((ROOT / "Server/S1001/data/config/item/StdItems.txt").read_bytes())
        ids = {item for item, block in items.items()
               if 201 <= int(re.search(rb"(?m)^  type=(\d+),", block)[1]) <= 205}
        self.assertEqual(50, len(ids))
        rows = read_cbp(CLIENT.read_bytes())[1].children
        original_rows = read_cbp(baseline(CLIENT))[1]
        original_language = baseline(LANGUAGE)
        for row in rows:
            item = int(row.child('id').number())
            if item in ids:
                self.assertEqual(original_rows.child(row.name), row)
                pattern = rf'\bi{item}="([^"\r\n]*)"'.encode()
                self.assertEqual(re.search(pattern, original_language)[1],
                                 re.search(pattern, LANGUAGE.read_bytes())[1])
                self.assertEqual(10, row.child('heroDamageRate').number())
                self.assertIn(b'heroDamageRate=10,', items[item])
        packed = dict(read_pack(PACK.read_bytes()))
        self.assertEqual(CLIENT.read_bytes(), packed[CLIENT.name])

    def test_modified_lua_compiles(self):
        lua = LuaRuntime(encoding=None)
        compile_fn = lua.eval(b'function(s) return assert(loadstring(s)) ~= nil end')
        for path in (PLAYER,BOX,LANGUAGE):
            self.assertTrue(compile_fn(path.read_bytes().removeprefix(b'\xef\xbb\xbf').rstrip(b'\x00')))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--deps')
    args, rest = parser.parse_known_args()
    if args.deps: sys.path.insert(0,args.deps)
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0],*rest])
