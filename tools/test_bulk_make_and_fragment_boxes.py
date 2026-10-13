"""Run real Lua synthesis and fragment-box handlers with stack and wallet accounting."""
from pathlib import Path
import re
import subprocess
import unittest

from test_equip_exchange_all import ROOT, DATA, SETUP, LuaRuntime


class BulkMakeTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        setup = SETUP.replace("assert(log==2725 or log==2789)", "assert(type(log)=='number')")
        setup = setup.replace("for _,v in pairs(bag)", "for id,v in pairs(bag)")
        setup = setup.replace("/9999", "/limit(id)").replace("*9999", "*limit(id)")
        self.lua.execute("limits={};function limit(id) return limits[id] or 9999 end")
        self.lua.execute(setup)
        self.lua.execute('''
LogIds={shendunMake=1,warrionequipmake=2,xianzhuanghecheng=3,exHeChengZhuangBei=4,
 duihuansanguoshizhuanghun=5,duihuanzhizhuntulong=6,duihuanshizhuanghun=7,
 longtengMake=2796,longzuhanghecheng=2703}
mtBindCoin=0;mtCoin=1;wallet={[0]=0,[1]=0};failCharge=false;partialCharge=false
Actor.getMoneyCount=function(_,kind) return wallet[kind] end
Actor.checkConsume=function(_,kind,id,count) assert(kind==5 and id==0);return wallet[0]+wallet[1]>=count end
Actor.removeConsume=function(_,kind,id,count)
 if failCharge then return 0 end
 local charged=partialCharge and count-1 or count
 local bound=math.min(wallet[0],charged)
 wallet[0]=wallet[0]-bound;wallet[1]=wallet[1]-(charged-bound)
 return charged
end
Actor.changeMoney=function(_,kind,count) wallet[kind]=wallet[kind]+count;return true end
Actor.getName=function() return '测试角色' end
Item.getItemName=function(id) return id and 'item'..id or '' end
System={broadcastTipmsg=function() end};get_d_val=function() return 0 end
-- Count any synthesis/exchange award, with controllable failure after a success.
originalAdd=Actor.addItem
Actor.addItem=function(_,id,q,s,count,bind,param,label,log)
 if not string.find(label,'返还') then
  local mapped=label=='外观合成' and '传世装备兑换' or '雷神装备兑换'
  return originalAdd(1,id,q,s,count,bind,param,mapped,log)
 end
 return originalAdd(1,id,q,s,count,bind,param,label,log)
end
''')
        for path in (
            "functions/Activity/Common/Awards.lua", "functions/ThorEquipFunc.lua",
            "functions/BulkMake.lua", "config/ActorEvent/HeChengCfg.lua",
            "config/WarriorEquipMakeCfg.lua", "config/ImmortalSystemConfig.lua",
            "functions/ShenDunMake.lua", "functions/AppearanceMake.lua",
            "functions/WarriorEquipMake.lua", "functions/ImmortalEquipMake.lua",
            "functions/LongTengMake.lua", "config/equipSynthesis/EquipDragonCfg.lua",
            "functions/NpcMiscFun/SanRenNPC/MapNpc/SanWeiZhenHuo.lua",
            "functions/GlobalNpcFunctions.lua",
            "functions/NpcMiscFun/SanRenNPC/MapNpc/GaoJiDuanZaoShi.lua",
        ):
            self.lua.execute((DATA / path).read_bytes().removeprefix(b"\xef\xbb\xbf"))
        self.g = self.lua.globals()
        self.g.npc = self.g.GetNpcWanShiTong()
        self.g.dragon = self.g.GetNpcSanWeiZhenHuo()
        self.lua.execute("NpcCommonFunc={};NpcDialog={[1]=GetNpcSanWeiZhenHuo()}")
        for cfg in self.g.ImmortalSystemConfig.ExChange.values():
            for recipe in cfg.list.values():
                self.g.limits[recipe.itemid] = 1
                self.g.limits[recipe.destid] = 1
        source = (DATA / "functions/NpcMiscFun/NpcEventDispatcher.lua").read_text("utf-8-sig")
        self.lua.execute(source[source.index("function OnNpcEvent("):source.index("\nfunction OnNpcTimer(")])

    def click(self, name, *args):
        return self.g.OnNpcEvent(1, 0, name, *map(str, args))

    def outer_systems(self):
        return (
            ("ShenDunMakeAll", self.g.ShenDunMakeCfg, "ShenDunMakeInit", 0, 0),
            ("WarriorEquipMakeAll", self.g.WarriorEquipMakeCfg, "WarriorEquipMakeInit", 1, 0),
            ("ImmortalEquipMakeAll", self.g.ImmortalSystemConfig.ExChange, "ImmortalEquipMakeInit", 1, 0),
            ("LongTengMakeAll", self.g.LongTengMakeCfg, "LongTengMakeInit", 0, 0),
            ("OnDragonEquipComposeAll", self.g.EquipDragonCfg.Compose, "OnDragonEquipComposeListEx", 0, 1),
        )

    def dispatch_make(self, name, npc_id, *args):
        return self.g.OnNpcEvent(1, npc_id, name, *map(str, args))

    def test_outer_buttons_dispatch_all_categories_and_chain_in_config_order(self):
        for name in ("ShenDunMakeAll", "WarriorEquipMakeAll", "ImmortalEquipMakeAll",
                     "LongTengMakeAll", "OnDragonEquipComposeAll"):
            with self.subTest(name=name):
                self.setUp()
                _, groups, home, bind, npc_id = next(s for s in self.outer_systems() if s[0] == name)
                owner = self.g.dragon if npc_id else self.g
                self.assertIn(f"<一键合成/@{name}>", owner[home](1))
                recipes = [recipe for group in groups.values() for recipe in group.list.values()]
                expected = {}
                for cfg in recipes:
                    count = cfg.count*2+1
                    self.g.put(cfg.itemid, 0, count)
                    expected[cfg.itemid] = count
                self.g.put(489, 2, 3)
                total, cost = 0, 0
                for cfg in recipes:
                    times = expected.get(cfg.itemid, 0)//cfg.count
                    expected[cfg.itemid] -= times*cfg.count
                    expected[cfg.destid] = expected.get(cfg.destid, 0)+times
                    total += times
                    cost += times*(cfg.needmoney or 0)
                self.g.wallet[0], self.g.wallet[1] = 0, 1000000000
                page = self.dispatch_make(name, npc_id)
                self.assertIn(f"<一键合成/@{name}>", page)
                for itemid, count in expected.items():
                    self.assertEqual(self.g.quantity(itemid), count, (name, itemid))
                for cfg in groups[len(groups)].list.values():
                    self.assertEqual(self.g.quantity(cfg.destid, bind), expected[cfg.destid])
                self.assertEqual(self.g.quantity(489), 5)
                self.assertEqual(self.g.wallet[1], 1000000000-cost)
                self.assertEqual(len(self.g.tips), 1)
                self.assertIn(f"共合成{total}件", self.g.tips[1])
                operation_count = len(self.g.operations)
                self.dispatch_make(name, npc_id)
                self.assertEqual(len(self.g.operations), operation_count)

    def test_dragon_category_buttons_only_consume_selected_recipes(self):
        for index in range(1, 5):
            with self.subTest(index=index):
                self.setUp()
                groups = self.g.EquipDragonCfg.Compose
                expected = {}
                for group in groups.values():
                    for cfg in group.list.values():
                        self.g.put(cfg.itemid, 0, 7)
                        expected[cfg.itemid] = 7
                for cfg in groups[index].list.values():
                    expected[cfg.itemid] -= 6
                    expected[cfg.destid] = expected.get(cfg.destid, 0)+2
                page = self.dispatch_make("OnDragonEquipComposeAll", 1, index)
                self.assertIn(f"<一键合成/@OnDragonEquipComposeAll,{index}>", page)
                self.assertEqual(page.count("<合成/@OnDragonEquipCompose,"), 9)
                for itemid, count in expected.items():
                    self.assertEqual(self.g.quantity(itemid), count, itemid)

    def test_outer_failures_refund_current_recipe_and_do_not_touch_later_categories(self):
        names = [s[0] for s in self.outer_systems()]
        for name in names:
            for flag in ("award", "remove", "space"):
                with self.subTest(name=name, flag=flag):
                    self.setUp()
                    _, groups, _, _, npc_id = next(s for s in self.outer_systems() if s[0] == name)
                    first = groups[1].list[1]
                    later = groups[len(groups)].list[len(groups[len(groups)].list)]
                    self.g.put(first.itemid, 1, first.count*2)
                    self.g.put(later.itemid, 0, later.count*2)
                    self.g.wallet[0], self.g.wallet[1] = 50000, 10000000
                    if flag == "award":
                        self.g.failAdd[first.destid] = 0
                    elif flag == "remove":
                        self.g.failRemove[first.itemid] = 1
                    else:
                        self.g.put(first.itemid, 0, first.count*2+1)
                        self.g.capacity = self.g.slots()
                    self.dispatch_make(name, npc_id)
                    self.assertEqual((self.g.quantity(first.itemid, 1), self.g.quantity(first.itemid, 0)),
                                     (0, first.count*2+1) if flag == "space" else (1, first.count*2))
                    self.assertEqual(self.g.quantity(later.itemid), later.count*2)
                    self.assertEqual(self.g.quantity(first.destid), 0)
                    self.assertEqual((self.g.wallet[0], self.g.wallet[1]), (50000, 10000000))
                    self.assertFalse(any("一键合成成功" in tip for tip in self.g.tips.values()))

    def test_outer_invalid_indices_leave_available_materials_untouched(self):
        for name, groups, _, _, npc_id in self.outer_systems():
            cfg = groups[1].list[1]
            self.g.put(cfg.itemid, 2, cfg.count*5)
            for index in ("", "bad", "0", "-1", "1.5", "9999", "nan", "inf"):
                self.dispatch_make(name, npc_id, index)
            self.assertEqual(self.g.quantity(cfg.itemid), 2+cfg.count*5)
        self.assertEqual(len(self.g.operations), 0)

    def test_all_enabled_synthesis_pages_have_registered_buttons(self):
        for name, cfgs in (("ShenDun", self.g.ShenDunMakeCfg),
                           ("WarriorEquip", self.g.WarriorEquipMakeCfg),
                           ("ImmortalEquip", self.g.ImmortalSystemConfig.ExChange)):
            self.assertEqual(self.g.GlobalNpcFunctionsFilter[name + "MakeAll"], 1)
            for index, cfg in cfgs.items():
                page = self.g[name + "MakeMkaeList"](1, str(index))
                self.assertIn(f"<一键合成/@{name}MakeAll,{index}>", page)
                self.assertEqual(page.count("<合成/"), len(cfg.list))
        for group, size in ((1, 6), (2, 8), (3, 5)):
            self.assertIn(f"<一键合成/@AppearanceMakeAll,{group}>",
                          self.g.AppearanceMakeCategory(1, str(group)))
            for series in range(1, size + 1):
                self.assertIn(f"<一键合成/@AppearanceMakeAll,{group},{series}>",
                              self.g.AppearanceMakeList(1, str(group), str(series)))

    def test_every_appearance_series_chains_only_its_three_recipes_and_keeps_binding(self):
        for group, size in ((1, 6), (2, 8), (3, 5)):
            for series in range(1, size + 1):
                with self.subTest(group=group, series=series):
                    self.setUp()
                    recipes = self.g.LocalDT.AppearanceMakeRecipes(group)
                    selected = [recipes[i] for i in range((series - 1)*3 + 1, series*3 + 1)]
                    expected = {selected[0].itemid: [17, 83]}
                    self.g.put(selected[0].itemid, 17, 83)
                    other = recipes[4 if series == 1 else 1].itemid
                    self.g.put(other, 3, 3)
                    for cfg in selected:
                        bound, unbound = expected.get(cfg.itemid, [0, 0])
                        times = (bound + unbound)//3
                        used_bound = min(bound, times*3)
                        bound_out = (used_bound + 2)//3
                        expected[cfg.itemid] = [bound - used_bound, unbound - (times*3 - used_bound)]
                        expected[cfg.destid] = [bound_out, times - bound_out]
                    page = self.click("AppearanceMakeAll", group, series)
                    for itemid, counts in expected.items():
                        self.assertEqual((self.g.quantity(itemid, 1), self.g.quantity(itemid, 0)), tuple(counts))
                    self.assertEqual(self.g.quantity(other), 6)
                    self.assertIn(f"/@AppearanceMakeAll,{group},{series}>", page)
                    self.assertEqual(len(self.g.tips), 1)

    def test_category_button_processes_all_series_and_stops_at_configured_highest(self):
        for group in (1, 2, 3):
            self.setUp()
            recipes = list(self.g.LocalDT.AppearanceMakeRecipes(group).values())
            for index in range(0, len(recipes), 3):
                self.g.put(recipes[index].itemid, 0, 27)
            page = self.click("AppearanceMakeAll", group)
            for index in range(0, len(recipes), 3):
                self.assertEqual(self.g.quantity(recipes[index + 2].destid, 0), 1)
                self.assertEqual(self.g.quantity(recipes[index].itemid), 0)
            self.assertIn(f"/@AppearanceMakeAll,{group}>", page)

    def test_four_shield_series_keep_original_three_to_one_recipes_and_remainders(self):
        for index in range(1, 5):
            self.setUp()
            recipes = list(self.g.ShenDunMakeCfg[index].list.values())
            self.g.put(recipes[0].itemid, 3, 80)
            self.click("ShenDunMakeAll", index)
            expected = 83
            for cfg in recipes:
                self.assertEqual(self.g.quantity(cfg.itemid), expected % 3)
                expected //= 3
                self.assertEqual(self.g.quantity(cfg.destid, 1), 0)
            self.assertEqual(self.g.quantity(recipes[-1].destid), expected)
            self.assertEqual(len(self.g.tips), 1)

    def test_warrior_bulk_applies_only_selected_page_and_keeps_result_bound(self):
        for index in (1, 2):
            self.setUp()
            for cfg in self.g.WarriorEquipMakeCfg[index].list.values():
                self.g.put(cfg.itemid, 5, 26)
            self.click("WarriorEquipMakeAll", index)
            for cfg in self.g.WarriorEquipMakeCfg[index].list.values():
                self.assertEqual(self.g.quantity(cfg.itemid), 1)
                self.assertEqual(self.g.quantity(cfg.destid, 1), 10)

    def test_immortal_bulk_charges_original_cost_and_stops_when_money_runs_out(self):
        cfg = self.g.ImmortalSystemConfig.ExChange[1].list[1]
        self.g.put(cfg.itemid, 0, 8)
        self.g.wallet[0], self.g.wallet[1] = 150000, 160000
        self.click("ImmortalEquipMakeAll", 1)
        self.assertEqual(self.g.quantity(cfg.itemid), 2)
        self.assertEqual(self.g.quantity(cfg.destid, 1), 3)
        self.assertEqual((self.g.wallet[0], self.g.wallet[1]), (0, 10000))
        self.assertIn("金币不足", self.g.tips[1])
        self.assertIn("共合成3件", self.g.tips[2])

    def test_immortal_failures_refund_both_currency_types_and_original_materials(self):
        for flag in ("award", "remove", "charge", "partial_charge", "space"):
            with self.subTest(flag=flag):
                self.setUp()
                cfg = self.g.ImmortalSystemConfig.ExChange[1].list[1]
                self.g.put(cfg.itemid, 1, 3)
                self.g.wallet[0], self.g.wallet[1] = 50000, 150000
                if flag == "award": self.g.failAdd[cfg.destid] = 0
                if flag == "remove": self.g.failRemove[cfg.itemid] = 1
                if flag == "charge": self.g.failCharge = True
                if flag == "partial_charge": self.g.partialCharge = True
                if flag == "space": self.g.capacity = 4
                self.click("ImmortalEquipMakeAll", 1)
                self.assertEqual((self.g.wallet[0], self.g.wallet[1]), (50000, 150000))
                self.assertEqual((self.g.quantity(cfg.itemid, 1), self.g.quantity(cfg.itemid, 0)), (1, 3))
                self.assertEqual(self.g.quantity(cfg.destid), 0)

    def test_mixed_appearance_failure_refunds_binding_and_stops_without_success_tip(self):
        self.g.put(6888, 2, 9999)
        self.g.failAdd[6889] = 0
        self.click("AppearanceMakeAll", 1, 1)
        self.assertEqual((self.g.quantity(6888, 1), self.g.quantity(6888, 0)), (2, 9999))
        self.assertEqual(self.g.quantity(6889), 0)
        self.assertEqual(self.g.tips[1], "合成失败，已返还扣除的材料。")

    def test_all_five_fragment_box_routes_exchange_every_complete_group_once(self):
        for index, itemid, boxid, cost in ((1, 7046, 7051, 15), (2, 7039, 6936, 38),
                                           (12, 7810, 6371, 15), (13, 7811, 7047, 15),
                                           (0, 6691, 6657, 15)):
            with self.subTest(index=index):
                self.setUp()
                self.g.put(itemid, 4000, 6001)
                self.g.put(489, 2, 3)
                route = self.g.npc.onduihuanshizhuang if index == 0 else self.g.npc.suihuanAllFunc
                page = route(1) if index == 0 else route(1, str(index))
                self.assertEqual(self.g.quantity(itemid), 10001 % cost)
                self.assertEqual(self.g.quantity(boxid, 1), 10001//cost)
                self.assertEqual(self.g.quantity(489), 5)
                self.assertIn("【碎片兑换】", page)
                before = len(self.g.operations)
                route(1) if index == 0 else route(1, str(index))
                self.assertEqual(len(self.g.operations), before)

    def test_fragment_large_quantities_fit_native_count_range_and_keep_remainder(self):
        self.g.put(7046, 100000, 100003)
        self.g.npc.suihuanAllFunc(1, "1")
        self.assertEqual(self.g.quantity(7051, 1), 200003//15)
        self.assertEqual(self.g.quantity(7046), 200003 % 15)
        self.assertLessEqual(max(op.requested for op in self.g.operations.values()), 65535)

    def test_fragment_failure_and_no_space_leave_materials_unchanged(self):
        for flag in ("award", "remove", "space"):
            self.setUp()
            self.g.put(7046, 7, 100000)
            if flag == "award": self.g.failAdd[7051] = 0
            if flag == "remove": self.g.failRemove[7046] = 3
            if flag == "space": self.g.capacity = self.g.slots()
            self.g.npc.suihuanAllFunc(1, "1")
            self.assertEqual((self.g.quantity(7046, 1), self.g.quantity(7046, 0)), (7, 100000))
            self.assertEqual(self.g.quantity(7051), 0)

    def test_selected_equipment_and_dragon_token_exchange_remain_single(self):
        for index in (3, 6, 14):
            self.setUp()
            cfg = self.g.npc.duihuanAll[index]
            self.g.put(cfg[1], 0, cfg[3]*3)
            self.g.npc.suihuanAllFunc(1, str(index))
            self.assertEqual(self.g.quantity(cfg[1]), cfg[3]*2)
            self.assertEqual(self.g.quantity(cfg[2]), 1)

    def test_invalid_buttons_do_not_consume_and_added_helpers_have_no_top_level_locals(self):
        for value in (None, "", "bad", "0", "-1", "1.5", "100", "nan", "inf"):
            for name in ("ShenDunMakeAll", "WarriorEquipMakeAll", "ImmortalEquipMakeAll"):
                self.g[name](1, value)
            self.g.AppearanceMakeAll(1, value)
            self.g.AppearanceMakeAll(1, "1", value)
            self.g.npc.suihuanAllFunc(1, value)
        self.assertEqual(len(self.g.operations), 0)
        for path in ("BulkMake.lua", "AppearanceMake.lua", "ShenDunMake.lua",
                     "WarriorEquipMake.lua", "ImmortalEquipMake.lua", "ThorEquipFunc.lua"):
            after = (DATA / "functions" / path).read_bytes()
            added = re.findall(rb"^local .*$", after, re.M)
            if path == "BulkMake.lua":
                self.assertEqual(added, [])
            else:
                before = subprocess.check_output(["git", "show", "HEAD:Server/S1001/data/functions/" + path], cwd=ROOT)
                self.assertEqual(added, re.findall(rb"^local .*$", before, re.M))


if __name__ == "__main__":
    unittest.main(verbosity=2)
