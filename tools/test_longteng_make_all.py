"""Exercise the actual Lua 5.1 dragon equipment pages and inventory operations."""
from pathlib import Path
import re
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "Server/S1001/data"
SOURCE = DATA / "functions/LongTengMake.lua"
sys.path.insert(0, str(Path.home() / "AppData/Local/Temp/codex-lupa"))
from lupa.lua51 import LuaRuntime


SETUP = '''
LocalDT={};bag={};tips={};broadcasts={};operations={};capacity=256
failRemove={};failAdd={};refundFailure=false;unboundFirst=false;given=0
function slots()
    local n=0
    for _,v in pairs(bag) do n=n+v[0]+v[1] end
    return n
end
function put(id,bound,unbound) bag[id]={[1]=bound,[0]=unbound} end
Actor={
 getItemCount=function(_,id,quality,strong,bind)
    local v=bag[id] or {[0]=0,[1]=0}
    if bind==0 or bind==1 then
        assert(quality==-1 and strong==-1)
        return v[bind]
    end
    return v[0]+v[1]
 end,
 removeItem=function(_,id,count,quality,strong,bind,label,log)
    assert(quality==-1 and strong==-1 and bind==-1 and log==2796)
    local v=bag[id] or {[0]=0,[1]=0}
    local removed=math.min(count,v[0]+v[1],failRemove[id] or count)
    local first=unboundFirst and 0 or 1
    local n=math.min(removed,v[first])
    v[first]=v[first]-n;v[1-first]=v[1-first]-(removed-n)
    table.insert(operations,{id=id,count=-removed,label=label})
    return removed
 end,
 addItem=function(_,id,quality,strong,count,bind,param,label,log)
    assert(quality==0 and strong==0 and param==0 and log==2796)
    local n=math.min(count,math.max(0,capacity-slots()))
    if failAdd[id] and given>=failAdd[id] then n=0 end
    if refundFailure and label=='龙腾合成返还' then n=0 end
    if not bag[id] then put(id,0,0) end
    bag[id][bind]=bag[id][bind]+n
    if label=='龙腾合成' then given=given+n end
    table.insert(operations,{id=id,count=n,bind=bind,label=label})
    return n
 end,
 sendTipmsg=function(_,s) table.insert(tips,s) end,
 getName=function() return '测试角色' end,
 closearrowsguide=function() end,
 getStaticVar=function() return {} end,
 getIntProperty=function() return 0 end,
}
Item={getItemLinkMsg=function(id) return 'item'..id end}
System={broadcastTipmsg=function(s) table.insert(broadcasts,s) end}
LogIds={longtengMake=2796};ttFlyTip=1;ttChatWindow=2
task_all={};get_taskflags_val=function() return 0 end
'''


class DragonSynthesisTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.lua.execute(SETUP)
        self.lua.execute(SOURCE.read_bytes())
        self.lua.execute((DATA / "functions/GlobalNpcFunctions.lua").read_bytes())
        dispatcher = (DATA / "functions/NpcMiscFun/NpcEventDispatcher.lua").read_text("utf-8-sig")
        a = dispatcher.index("function OnNpcEvent(")
        b = dispatcher.index("\nfunction OnNpcTimer(", a)
        self.lua.execute(dispatcher[a:b])
        self.g = self.lua.globals()

    def count(self, itemid, bind=None):
        return self.g.Actor.getItemCount(1, itemid, -1, -1, bind)

    def click(self, level):
        return self.g.OnNpcEvent(1, 0, "LongTengMakeAll", str(level))

    def test_all_five_pages_have_registered_button_beside_home_and_nine_original_links(self):
        home = self.g.LongTengMakeInit(1)
        self.assertEqual(len(self.g.LongTengMakeCfg), 5)
        for level in range(1, 6):
            self.assertIn(f"/@LongTengMakeMkaeList,{level}", home)
            page = self.g.LongTengMakeMkaeList(1, str(level))
            self.assertRegex(page, rf"<返回主页/@LongTengMakeInit> +<一键合成/@LongTengMakeAll,{level}>")
            self.assertEqual(page.count("<合成/@LongTengMakeMkae,"), 9)
        self.assertEqual(self.g.GlobalNpcFunctionsFilter.LongTengMakeAll, 1)

    def test_all_levels_consume_exact_triples_keep_remainders_and_do_not_chain(self):
        for level in range(1, 6):
            with self.subTest(level=level):
                self.setUp()
                recipes = list(self.g.LongTengMakeCfg[level].list.values())
                expected = 0
                for n, cfg in enumerate(recipes):
                    count = n + 4
                    self.g.put(cfg.itemid, count // 2, count - count // 2)
                    self.g.put(cfg.destid, 0, 9)
                    expected += count // 3
                self.g.put(489, 2, 3)
                page = self.click(level)
                for n, cfg in enumerate(recipes):
                    self.assertEqual(self.count(cfg.itemid), (n + 4) % 3)
                    self.assertEqual(self.count(cfg.destid), 9 + (n + 4) // 3)
                    self.assertEqual(self.count(cfg.destid, 1), 0)
                self.assertEqual(self.count(489), 5)
                self.assertEqual(self.g.given, expected)
                self.assertEqual(len(self.g.broadcasts), 9)
                self.assertEqual(len(self.g.tips), 1)
                self.assertIn(f"共合成{expected}件", self.g.tips[1])
                self.assertIn(f"/@LongTengMakeAll,{level}", page)

    def test_insufficient_materials_and_second_click_do_not_consume_remainders(self):
        self.g.put(7201, 0, 2)
        self.g.put(7202, 1, 0)
        self.click(1)
        self.assertEqual(len(self.g.operations), 0)
        self.assertEqual(self.g.tips[1], "材料不足,无法合成!")
        self.g.put(7201, 2, 8)
        self.click(1)
        count = len(self.g.operations)
        self.click(1)
        self.assertEqual(len(self.g.operations), count)
        self.assertEqual(self.count(7201), 1)
        self.assertEqual(self.count(7210), 3)

    def test_full_bag_succeeds_using_slots_released_by_materials(self):
        self.g.put(7201, 1, 2)
        self.g.put(489, 0, 253)
        self.click(1)
        self.assertEqual(self.count(7201), 0)
        self.assertEqual(self.count(7210), 1)
        self.assertEqual(self.g.slots(), 254)

    def test_partial_removal_refunds_original_binding_and_stops_before_next_recipe(self):
        for first in (True, False):
            with self.subTest(unbound_first=first):
                self.setUp()
                self.g.unboundFirst = first
                self.g.put(7201, 2, 4)
                self.g.put(7202, 0, 3)
                self.g.failRemove[7201] = 2
                self.click(1)
                self.assertEqual(self.count(7201, 1), 2)
                self.assertEqual(self.count(7201, 0), 4)
                self.assertEqual(self.count(7202), 3)
                self.assertEqual(self.g.given, 0)
                self.assertEqual(len(self.g.broadcasts), 0)
                self.assertIn("已返还", self.g.tips[1])

    def test_reward_failure_preserves_previous_success_and_refunds_failed_triple(self):
        self.g.put(7201, 4, 5)
        self.g.put(7202, 0, 3)
        self.g.failAdd[7210] = 1
        self.click(1)
        self.assertEqual(self.count(7201, 1), 1)
        self.assertEqual(self.count(7201, 0), 5)
        self.assertEqual(self.count(7210), 1)
        self.assertEqual(self.count(7202), 3)
        self.assertEqual(len(self.g.broadcasts), 1)
        self.assertIn("已返还", self.g.tips[1])
        self.assertIn("共合成1件", self.g.tips[2])

    def test_zero_removal_and_failed_refund_never_report_success(self):
        self.g.put(7201, 0, 3)
        self.g.failRemove[7201] = 0
        self.click(1)
        self.assertEqual(self.count(7201), 3)
        self.assertEqual(self.g.given, 0)
        self.g.failRemove[7201] = 3
        self.g.failAdd[7210] = 0
        self.g.refundFailure = True
        self.click(1)
        self.assertIn("材料返还异常", self.g.tips[2])
        self.assertEqual(len(self.g.broadcasts), 0)

    def test_original_single_button_produces_only_one_and_rejects_invalid_recipe(self):
        self.g.put(7201, 0, 9)
        self.g.OnNpcEvent(1, 0, "LongTengMakeMkae", "1", "1")
        self.assertEqual(self.count(7201), 6)
        self.assertEqual(self.count(7210), 1)
        self.assertEqual(len(self.g.broadcasts), 1)
        before = len(self.g.operations)
        for value in (None, "", "bad", "0", "-1", "1.5", "6", "nan", "inf"):
            self.g.LongTengMakeAll(1, value)
            self.g.LongTengMakeMkaeList(1, value)
            self.g.LongTengMakeMkae(1, "1", value)
        self.assertEqual(len(self.g.operations), before)

    def test_recipes_exchange_and_top_level_locals_unchanged_and_materials_do_not_stack(self):
        before = subprocess.check_output(["git", "show", "HEAD:Server/S1001/data/functions/LongTengMake.lua"], cwd=ROOT)
        after = SOURCE.read_bytes()
        marker = "--龙腾合成".encode()
        self.assertEqual(before.split(marker, 1)[0], after.split(marker, 1)[0])
        self.assertEqual(before[before.index("--龙腾男女互换".encode()):],
                         after[after.index("--龙腾男女互换".encode()):])
        self.assertEqual(re.findall(rb"^local .*$", before, re.M),
                         re.findall(rb"^local .*$", after, re.M))
        items = (DATA / "config/item/StdItems.txt").read_bytes()
        for cfg in self.g.LongTengMakeCfg.values():
            for recipe in cfg.list.values():
                for itemid in (recipe.itemid, recipe.destid):
                    entry = re.search(rb"\n  id=" + str(itemid).encode() + rb",.*?(?=\n  id=|\Z)", items, re.S)
                    self.assertIsNotNone(entry)
                    self.assertIn(b"\n  dup=1,", entry[0])
                self.assertEqual(recipe.count, 3)
                self.assertEqual(recipe.bind, 0)


if __name__ == "__main__":
    unittest.main(verbosity=2)
