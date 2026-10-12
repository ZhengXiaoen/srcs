"""Exercise actual Legend/Thor Lua pages, dispatch and stack-aware exchanges."""
from pathlib import Path
import re
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "Server/S1001/data"
sys.path.insert(0, str(Path.home() / "AppData/Local/Temp/codex-lupa"))
from lupa.lua51 import LuaRuntime


SETUP = '''
LocalDT={};bag={};tips={};operations={};capacity=256;addCalls=0
failRemove={};failAdd={};failAfter=nil;refundFailure=false;unboundFirst=false
function put(id,bound,unbound) bag[id]={[1]=bound,[0]=unbound} end
function quantity(id,bind)
    local v=bag[id] or {[0]=0,[1]=0}
    return bind~=nil and v[bind] or v[0]+v[1]
end
function slots()
    local n=0
    for _,v in pairs(bag) do
        n=n+math.ceil(v[0]/9999)+math.ceil(v[1]/9999)
    end
    return n
end
Item={
 getItemLinkMsg=function(id) return 'item'..id end,
 getBagEmptyGridCount=function() return capacity-slots() end,
 getAddItemNeedGridCount=function(_,id,count,quality,strong,bind)
    assert(count>0 and count<=65535 and quality==0 and strong==0)
    local n=quantity(id,bind)
    return math.ceil((n+count)/9999)-math.ceil(n/9999)
 end,
}
Actor={
 getItemCount=function(_,id,quality,strong,bind)
    if bind==0 or bind==1 then
        assert(quality==-1 and strong==-1)
        return quantity(id,bind)
    end
    return quantity(id)
 end,
 removeItem=function(_,id,count,quality,strong,bind,label,log)
    assert(count>0 and count<=65535 and quality==-1 and strong==-1)
    assert(log==2725 or log==2789)
    local n=math.min(count,quantity(id,bind==-1 and nil or bind),failRemove[id] or count)
    local v=bag[id] or {[0]=0,[1]=0}
    if bind==-1 then
        local first=unboundFirst and 0 or 1
        local take=math.min(n,v[first])
        v[first]=v[first]-take;v[1-first]=v[1-first]-(n-take)
    else
        v[bind]=v[bind]-n
    end
    table.insert(operations,{id=id,count=-n,requested=count,bind=bind,label=label,log=log})
    return n
 end,
 addItem=function(_,id,quality,strong,count,bind,param,label,log)
    assert(count>0 and count<=65535 and quality==0 and strong==0 and param==0)
    assert(log==2725 or log==2789)
    local old=quantity(id,bind)
    local room=math.ceil(old/9999)*9999-old+(capacity-slots())*9999
    local n=math.min(count,room)
    if label=='传世装备兑换' or label=='雷神装备兑换' then
        addCalls=addCalls+1
        if failAfter and addCalls>failAfter then n=0 end
        if failAdd[id] then n=math.min(n,failAdd[id]) end
    elseif refundFailure then
        n=0
    end
    if not bag[id] then put(id,0,0) end
    bag[id][bind]=bag[id][bind]+n
    table.insert(operations,{id=id,count=n,requested=count,bind=bind,label=label,log=log})
    return n
 end,
 sendTipmsg=function(_,s) table.insert(tips,s) end,
 closearrowsguide=function() end,getStaticVar=function() return {} end,
 getIntProperty=function() return 0 end,
}
LogIds={legendequipexchange=2725,Thorequipexchange=2789};ttFlyTip=1
Lang={ScriptTips={mt00001='空间不足，需要%d格'}}
task_all={};get_taskflags_val=function() return 0 end
'''


class EquipmentExchangeTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.lua.execute(SETUP)
        for path in ("Activity/Common/Awards.lua", "ThorEquipFunc.lua",
                     "LegendEquipFunc.lua", "GlobalNpcFunctions.lua"):
            self.lua.execute((DATA / "functions" / path).read_bytes().removeprefix(b"\xef\xbb\xbf"))
        source = (DATA / "functions/NpcMiscFun/NpcEventDispatcher.lua").read_text("utf-8-sig")
        a = source.index("function OnNpcEvent(")
        b = source.index("\nfunction OnNpcTimer(", a)
        self.lua.execute(source[a:b])
        self.g = self.lua.globals()

    def click(self, kind, page="1"):
        return self.g.OnNpcEvent(1, 0, f"handExChange{kind}All", page)

    def recipes(self, kind):
        return list(self.g[f"{kind}ExchangeCfg"][1].exchange.values())

    def test_buttons_follow_eight_original_rows_and_use_registered_routes(self):
        for kind in ("Legend", "Thor"):
            page = self.g[f"handExChange{kind}Page"](1, "1")
            self.assertEqual(page.count("兑换(0)"), 8)
            self.assertIn(f"<#c0xFF15EA40#一键兑换/@handExChange{kind}All,1>", page)
            self.assertLess(page.index("兑换(0)"), page.index("一键兑换"))
            self.assertLess(page.index("一键兑换"), page.rindex("<(idecoLine#350)>"))
            self.assertEqual(self.g.GlobalNpcFunctionsFilter[f"handExChange{kind}All"], 1)
        self.assertNotIn("一键兑换", self.g.handExChangeLegendPage(1, "2"))

    def test_all_eight_materials_exchange_exact_rewards_and_binding(self):
        for kind, rewardid, ratios in (
            ("Legend", 6402, [20, 15, 10, 10, 10, 10, 10, 10]),
            ("Thor", 7151, [160, 120, 80, 80, 80, 80, 80, 80]),
        ):
            with self.subTest(kind=kind):
                self.setUp()
                expected = 0
                for n, cfg in enumerate(self.recipes(kind)):
                    self.assertEqual((cfg.count, cfg.exchangeid, cfg.exchangecount, cfg.exchangebind),
                                     (1, rewardid, ratios[n], 1))
                    self.g.put(cfg.itemid, n + 1, n + 2)
                    expected += (2*n + 3)*ratios[n]
                self.g.put(rewardid, 5, 7)
                self.g.put(489, 2, 3)
                other = 7078 if kind == "Legend" else 6392
                self.g.put(other, 2, 2)
                page = self.click(kind)
                self.assertEqual(self.g.quantity(rewardid, 1), 5 + expected)
                self.assertEqual(self.g.quantity(rewardid, 0), 7)
                for cfg in self.recipes(kind):
                    self.assertEqual(self.g.quantity(cfg.itemid), 0)
                self.assertEqual(self.g.quantity(489), 5)
                self.assertEqual(self.g.quantity(other), 4)
                self.assertEqual(len(self.g.tips), 1)
                self.assertIn(f"item{rewardid}×{expected}", self.g.tips[1])
                self.assertEqual(page.count("兑换(0)"), 8)
                self.assertEqual(self.g.addCalls, 8)

    def test_large_stacks_use_bounded_batches_without_truncating_rewards(self):
        for kind in ("Legend", "Thor"):
            with self.subTest(kind=kind):
                self.setUp()
                self.g.capacity = 1024
                expected = 0
                for cfg in self.recipes(kind):
                    self.g.put(cfg.itemid, 4000, 5999)
                    expected += 9999*cfg.exchangecount
                self.click(kind)
                self.assertEqual(self.g.quantity(self.recipes(kind)[0].exchangeid), expected)
                self.assertLess(self.g.addCalls, 150)
                self.assertEqual(len(self.g.tips), 1)
                self.assertIn("共兑换79992件", self.g.tips[1])
                self.assertLessEqual(max(op.requested for op in self.g.operations.values()), 65535)

    def test_empty_bag_and_repeated_click_do_not_repeat_rewards(self):
        for kind in ("Legend", "Thor"):
            self.setUp()
            self.click(kind)
            self.assertEqual(len(self.g.operations), 0)
            self.assertEqual(self.g.tips[1], "没有可兑换的装备!")
            cfg = self.recipes(kind)[0]
            self.g.put(cfg.itemid, 1, 2)
            self.click(kind)
            count = len(self.g.operations)
            self.click(kind)
            self.assertEqual(len(self.g.operations), count)
            self.assertEqual(self.g.quantity(cfg.exchangeid), 3*cfg.exchangecount)

    def test_full_bag_can_use_slot_freed_by_consuming_entire_material_stack(self):
        self.g.capacity = 2
        self.g.put(6392, 0, 100)
        self.g.put(489, 0, 9999)
        self.click("Legend")
        self.assertEqual(self.g.quantity(6392), 0)
        self.assertEqual(self.g.quantity(6402, 1), 2000)
        self.assertEqual(self.g.slots(), 2)

    def test_limited_capacity_exchanges_fitting_batch_and_preserves_remaining_materials(self):
        self.g.capacity = 3
        self.g.put(7078, 0, 1000)
        self.g.put(489, 0, 9999)
        page = self.click("Thor")
        self.assertEqual(self.g.quantity(7151), 62*160)
        self.assertEqual(self.g.quantity(7078), 938)
        self.assertIn("兑换(938)", page)
        self.assertEqual(self.g.tips[1], "包裹空间不足!")
        self.assertIn("共兑换62件", self.g.tips[2])

    def test_full_bag_can_fill_existing_reward_stack_without_consuming_extra_materials(self):
        self.g.capacity = 2
        self.g.put(6392, 0, 1000)
        self.g.put(6402, 9900, 0)
        self.click("Legend")
        self.assertEqual(self.g.quantity(6402, 1), 9980)
        self.assertEqual(self.g.quantity(6392), 996)

    def test_full_bag_without_room_leaves_materials_untouched(self):
        self.g.capacity = 2
        self.g.put(7078, 0, 1000)
        self.g.put(489, 0, 9999)
        self.click("Thor")
        self.assertEqual(len(self.g.operations), 0)
        self.assertEqual(self.g.quantity(7078), 1000)
        self.assertEqual(self.g.tips[1], "包裹空间不足!")

    def test_failed_or_partial_removal_refunds_original_binding_and_stops(self):
        for kind in ("Legend", "Thor"):
            for first in (False, True):
                for failure in (0, 3):
                    with self.subTest(kind=kind, unbound_first=first, removed=failure):
                        self.setUp()
                        cfg, following = self.recipes(kind)[:2]
                        self.g.put(cfg.itemid, 4, 6)
                        self.g.put(following.itemid, 0, 3)
                        self.g.unboundFirst = first
                        self.g.failRemove[cfg.itemid] = failure
                        self.click(kind)
                        self.assertEqual(self.g.quantity(cfg.itemid, 1), 4)
                        self.assertEqual(self.g.quantity(cfg.itemid, 0), 6)
                        self.assertEqual(self.g.quantity(following.itemid), 3)
                        self.assertEqual(self.g.quantity(cfg.exchangeid), 0)
                        self.assertIn("已返还", self.g.tips[1])

    def test_failed_or_partial_reward_is_retracted_and_materials_refunded(self):
        for given in (0, 100):
            self.setUp()
            self.g.put(7078, 1, 1)
            self.g.put(7151, 500, 700)
            self.g.failAdd[7151] = given
            self.click("Thor")
            self.assertEqual(self.g.quantity(7078, 1), 1)
            self.assertEqual(self.g.quantity(7078, 0), 1)
            self.assertEqual(self.g.quantity(7151, 1), 500)
            self.assertEqual(self.g.quantity(7151, 0), 700)
            self.assertIn("已返还", self.g.tips[1])

    def test_later_failure_preserves_previous_success_and_reports_exact_totals(self):
        self.g.put(7078, 500, 9499)
        self.g.put(7079, 0, 3)
        self.g.failAfter = 1
        self.click("Thor")
        self.assertEqual(self.g.quantity(7078, 1), 91)
        self.assertEqual(self.g.quantity(7078, 0), 9499)
        self.assertEqual(self.g.quantity(7151, 1), 409*160)
        self.assertEqual(self.g.quantity(7079), 3)
        self.assertIn("已返还", self.g.tips[1])
        self.assertIn("共兑换409件", self.g.tips[2])
        self.assertIn("item7151×65440", self.g.tips[2])

    def test_single_exchanges_and_reverse_legend_exchange_still_produce_only_one(self):
        for kind in ("Legend", "Thor"):
            self.setUp()
            cfg = self.recipes(kind)[0]
            self.g.put(cfg.itemid, 1, 2)
            self.g.OnNpcEvent(1, 0, f"handExChange{kind}Item", "1", "1")
            self.assertEqual(self.g.quantity(cfg.itemid), 2)
            self.assertEqual(self.g.quantity(cfg.exchangeid), cfg.exchangecount)
            self.assertEqual(self.g.addCalls, 1)
        self.setUp()
        self.g.put(6402, 0, 100)
        self.g.handExChangeLegendItem(1, "2", "1")
        self.assertEqual(self.g.quantity(6402), 80)
        self.assertEqual(self.g.quantity(6396, 1), 1)

    def test_invalid_requests_and_bulk_reverse_exchange_do_not_change_inventory(self):
        self.g.put(6402, 0, 100)
        for kind in ("Legend", "Thor"):
            for value in (None, "", "bad", "0", "-1", "1.5", "3", "nan", "inf"):
                self.g[f"handExChange{kind}All"](1, value)
                self.g[f"handExChange{kind}Page"](1, value)
                self.g[f"handExChange{kind}Item"](1, value, "1")
                self.g[f"handExChange{kind}Item"](1, "1", value)
        self.click("Legend", "2")
        self.assertEqual(len(self.g.operations), 0)
        self.assertEqual(self.g.quantity(6402), 100)

    def test_exchange_configs_upgrade_code_and_top_level_locals_are_unchanged(self):
        for filename in ("LegendEquipFunc.lua", "ThorEquipFunc.lua"):
            path = "Server/S1001/data/functions/" + filename
            before = subprocess.check_output(["git", "show", "HEAD:" + path], cwd=ROOT)
            after = (ROOT / path).read_bytes()
            self.assertEqual(before.split(b"    };", 1)[0], after.split(b"    };", 1)[0])
            self.assertEqual(re.findall(rb"^local .*$", before, re.M),
                             re.findall(rb"^local .*$", after, re.M))
            if filename == "LegendEquipFunc.lua":
                a = before.index(b"function handleUpLegendEquip(")
                b = before.index(b"function handExChangeLegend(")
                self.assertIn(before[a:b], after)


if __name__ == "__main__":
    unittest.main(verbosity=2)
