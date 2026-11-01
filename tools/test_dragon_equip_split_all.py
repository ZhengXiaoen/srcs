"""Run the real dragon recipes, NPC routes and split handlers with wallet/bag accounting."""
from collections import Counter
from pathlib import Path
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "Server/S1001/data"
sys.path.insert(0, str(Path.home() / "AppData/Local/Temp/codex-lupa"))
from lupa.lua51 import LuaRuntime

SETUP = r'''
LocalDT={}; bag={}; tips={}; logs={}; wallet=1000000000; capacity=10000
addCalls=0; charges=0; failCharge=false; partialCharge=false; failAdd=false
failSet=false; failAfter=nil; dealing=false; static={}; mtYuanbao=3; ttFlyTip=1
LogIds={DragonEquipSplit=2441}; NpcCommonFunc={}; task_all={}
get_taskflags_val=function() return 0 end
function put(id,level,super,count,bind)
 local p={id=id,dragon=level,super=super,count=count or 1,bind=bind or 0,
          strong=9,soul=123,expiry=456};bag[#bag+1]=p;return p
end
function quantity(id)
 local count=0;for _,p in ipairs(bag) do if p.id==id then count=count+p.count end end;return count
end
propNames={[1]='count',[2]='strong',[4]='bind',[15]='dragon',[24]='super',[33]='expiry'}
Item={ipItemID='id',ipDragonEquipLevel=15,ipItemSuperAttrLevel=24,
 ipItemCount=1,ipItemStrong=2,ipItemBind=4,ipItemQuality='quality',ipItemStaticPropStart=44,ipItemDupCount=68,
 getBagItemCount=function() return #bag end,
 getBagItemBySortID=function(_,i) return bag[i] end,
 getItemProperty=function(_,p,prop) assert(not p.destroyed);return p[propNames[prop] or prop] or 0,0 end,
 setItemProperty=function(_,p,prop,value)
  if failSet and value==0 then return false end
  if failCopy and p.count==1 and prop==33 then return false end
  p[propNames[prop] or prop]=value;return true
 end,
 getBagEmptyGridCount=function() return capacity-#bag end,
 getAddItemNeedGridCount=function(_,id,count,q,s,bind)
  assert(count>0 and count<=65535 and q==0 and s==0 and bind==0)
  for _,p in ipairs(bag) do
   if p.id==id and p.bind==bind and p.count+count<=9999 then return 0 end
  end
  return 1
 end,
 SendItemLog=function(_,p,label,log) assert(log==2441);logs[#logs+1]=p end,
 GetItemNameEx=function(p) return 'item'..p.id end,
 getItemName=function(id) return 'item'..id end,
 getItemId=function(p) assert(not p.destroyed);return p.id end,
 getItemPropertyById=function() return 9999 end,
 createItem=function(id,count,strong,quality,bind)
  return {id=id,count=count,strong=strong,bind=bind,dragon=0,super=0,soul=0,expiry=0}
 end,
 releaseItemPtr=function(p) assert(not p.destroyed);p.destroyed=true end,
 getFuHunInfo=function(p,kind) assert(not p.destroyed);return kind==1 and 0 or p.soul end,
 setFuHunInfo=function(_,p,kind,value) if kind==2 then p.soul=value end end,
 getItemLeftTime=function(p) return p.expiry end,
 addItem=function(_,ptr,label,log,count)
  assert(not ptr.destroyed and count==1 and log==2441)
  if failNormalAdd then return 0 end
  for _,p in ipairs(bag) do
   if p.id==ptr.id and p.dragon==0 and p.count<9999 and ptr.soul==0
    and LocalDT.DragonEquipSplitAttributesEqual(1,p,ptr) then
    p.count=p.count+1;ptr.destroyed=true;return 1
   end
  end
  if #bag>=capacity then return 0 end
  table.insert(bag,1,ptr);return 1
 end,
}
Actor={isDealing=function() return dealing end,
 getMoneyCount=function(_,kind) assert(kind==3);return wallet end,
 changeMoney=function(_,kind,delta,log,label)
  assert(kind==3 and log==2441)
  if delta<0 then
   charges=charges+1
   if failCharge then return false end
   if partialCharge then wallet=wallet-1;return false end
  end
  wallet=wallet+delta;return true
 end,
 addItem=function(_,id,q,s,count,bind,param,label,log)
  assert(q==0 and s==0 and count>0 and count<=65535 and bind==0 and param==0 and log==2441)
  addCalls=addCalls+1
  if failAdd or (failAfter and addCalls>failAfter) then return 0 end
  if partialAward and count>1 then count=count-1 end
  for _,p in ipairs(bag) do
   if p.id==id and p.bind==bind and p.count+count<=9999 then p.count=p.count+count;return count end
  end
  if #bag>=capacity then return 0 end
  -- New awards can move the live bag order while the operation is in progress.
  table.insert(bag,1,{id=id,count=count,bind=bind,dragon=0,super=0,soul=0,expiry=0,strong=0});return count
 end,
 removeItem=function(_,id,count,q,s,bind,label,log)
  local removed=0
  for i=#bag,1,-1 do
   local p=bag[i]
   if p.id==id and p.bind==bind then
    local take=math.min(p.count,count-removed);p.count=p.count-take;removed=removed+take
    if p.count==0 then table.remove(bag,i) end
   end
  end
  return removed
 end,
 sendTipmsg=function(_,message) tips[#tips+1]=message end,
 closearrowsguide=function() end,getStaticVar=function() return static end,
 getIntProperty=function() return 0 end,
}
'''


class DragonSplitTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.lua.execute(SETUP)
        for name in (
            "config/equipSynthesis/EquipDragonCfg.lua",
            "functions/NpcMiscFun/SanRenNPC/MapNpc/SanWeiZhenHuo.lua",
        ):
            self.lua.execute((DATA / name).read_bytes().removeprefix(b"\xef\xbb\xbf"))
        self.g = self.lua.globals()
        self.g.npc = self.g.GetNpcSanWeiZhenHuo()
        self.lua.execute("NpcDialog={[367]=npc}")
        dispatcher = (DATA / "functions/NpcMiscFun/NpcEventDispatcher.lua").read_text("utf-8-sig")
        self.lua.execute(dispatcher[dispatcher.index("function OnNpcEvent("):dispatcher.index("\nfunction OnNpcTimer(")])

    def click(self, name="OnDragonEquipSplitAll", *args):
        return self.g.OnNpcEvent(1, 367, name, *map(str, args))

    def put(self, itemid=4618, level=1, superlevel=0, **kwargs):
        return self.g.put(itemid, level, superlevel, kwargs.get("count", 1), kwargs.get("bind", 0))

    def check_tip(self, split, left, spent):
        self.assertEqual(len(self.g.tips), 1)
        self.assertIn(f"已拆分{split}个，剩余{left}个融合龍装，消耗{spent}元宝", self.g.tips[1])

    def test_button_uses_registered_npc_route_and_refreshes_split_page(self):
        button = "<一键拆分/@OnDragonEquipSplitAll>"
        self.assertIn(button, self.click("OnDragonEquipFuseList", 1, 2))
        self.assertNotIn(button, self.click("OnDragonEquipFuseList", 1, 1))
        self.assertIn(button, self.click())
        self.check_tip(0, 0, 0)
        self.assertEqual((self.g.charges, self.g.addCalls), (0, 0))

    def test_every_recipe_matches_level_base_item_and_normal_king_emperor(self):
        items, expected, fees, keys = [], Counter(), 0, {}
        for level, parts in self.g.EquipDragonCfg.Fuse.items():
            for part in parts.values():
                for group in part.Item.values():
                    for cfg in group.List.values():
                        key = (level, cfg.id, cfg.pro)
                        value = (cfg.id2, cfg.money)
                        if key in keys:
                            self.assertEqual(keys[key], value)
                            continue
                        keys[key] = value
                        # Higher odd/even super levels follow the same king/emperor rule.
                        superlevel = (0, 3, 4)[cfg.pro]
                        items.append(self.put(cfg.id, level, superlevel, bind=1))
                        expected[cfg.id2] += 1
                        fees += cfg.money
        normal = self.put(4618, 0)
        self.g.wallet = fees
        self.click()
        self.check_tip(len(items), 0, fees)
        self.assertEqual(self.g.wallet, 0)
        self.assertEqual(len(self.g.logs), len(items))
        for p in items:
            self.assertEqual((p.dragon, p.bind, p.strong, p.soul, p.expiry), (0, 1, 9, 123, 456))
        self.assertEqual((normal.dragon, normal.strong), (0, 9))
        for itemid, count in expected.items():
            self.assertEqual(self.g.quantity(itemid), count, itemid)

    def test_insufficient_wallet_skips_expensive_item_and_uses_affordable_later_item(self):
        first = self.put(4618)  # 2888
        expensive = self.put(4672)  # 6888
        last = self.put(4645)  # 4888
        self.g.wallet = 7776
        self.click()
        self.check_tip(2, 1, 7776)
        self.assertEqual((first.dragon, expensive.dragon, last.dragon), (0, 1, 0))
        self.assertEqual((self.g.wallet, self.g.quantity(5960)), (0, 2))
        self.assertIn("元宝不足", self.g.tips[1])

    def test_wallet_below_cheapest_fee_does_not_change_items_or_money(self):
        p = self.put()
        self.g.wallet = 2887
        self.click()
        self.check_tip(0, 1, 0)
        self.assertEqual((p.dragon, self.g.wallet, self.g.charges, self.g.addCalls), (1, 2887, 0, 0))

    def test_full_bag_uses_existing_material_stack_and_preserves_blocked_items(self):
        material = self.put(5960, 0, count=9998)
        first = self.put()
        second = self.put(4645)
        self.g.capacity = len(self.g.bag)
        self.click()
        self.check_tip(1, 1, 2888)
        self.assertEqual((material.count, first.dragon, second.dragon), (9999, 0, 1))
        self.assertIn("包裹空间不足", self.g.tips[1])

    def test_full_bag_can_continue_with_another_material_that_has_stack_space(self):
        self.put(5960, 0, count=9999)
        self.put(5961, 0, count=9998)
        blocked = self.put()
        affordable = self.put(4619)
        self.g.capacity = len(self.g.bag)
        self.click()
        self.check_tip(1, 1, 2888)
        self.assertEqual((blocked.dragon, affordable.dragon, self.g.quantity(5961)), (1, 0, 9999))

    def test_charge_update_or_reward_failure_restores_wallet_and_stops(self):
        for flag in ("failCharge", "partialCharge", "failSet", "failAdd"):
            with self.subTest(flag=flag):
                self.setUp()
                first, second = self.put(), self.put(4645)
                self.g[flag] = True
                self.click()
                self.check_tip(0, 2, 0)
                self.assertEqual((first.dragon, second.dragon, self.g.wallet), (1, 1, 1000000000))
                self.assertEqual((self.g.quantity(5960), len(self.g.logs)), (0, 0))
                self.assertIn("已停止拆分", self.g.tips[1])

    def test_failure_after_success_preserves_remaining_items_and_reports_only_success(self):
        first, second, third = self.put(), self.put(4645), self.put(4672)
        self.g.failAfter = 1
        self.click()
        self.check_tip(1, 2, 2888)
        self.assertEqual((first.dragon, second.dragon, third.dragon), (0, 1, 1))
        self.assertEqual((self.g.wallet, self.g.quantity(5960)), (1000000000-2888, 1))

    def test_repeat_click_cannot_pay_or_award_again(self):
        self.put()
        self.click()
        self.lua.execute("tips={}")
        self.click()
        self.check_tip(0, 0, 0)
        self.assertEqual((self.g.charges, self.g.addCalls, self.g.quantity(5960)), (1, 1, 1))

    def test_unknown_fusion_recipe_is_retained_and_reported(self):
        p = self.put(4618, 6)
        self.click()
        self.check_tip(0, 1, 0)
        self.assertEqual((p.dragon, self.g.charges), (6, 0))
        self.assertIn("没有对应拆分配置", self.g.tips[1])

    def test_single_split_keeps_server_recipe_fee_and_same_reward_rules(self):
        p = self.put()
        self.click("onDragonEquipSplitExExEx", 1, 2, 2, 1, 0, 1, 1, 1)
        self.assertEqual((p.dragon, self.g.wallet, self.g.quantity(5960)), (0, 1000000000-2888, 1))
        self.assertIn("拆分成功", self.g.tips[1])

    def test_trade_blocks_bulk_split(self):
        p = self.put()
        self.g.dealing = True
        self.assertEqual(self.click(), "null")
        self.assertEqual((p.dragon, len(self.g.tips), self.g.charges), (1, 0, 0))

    def test_large_fused_stack_charges_and_returns_every_unit_in_one_batch(self):
        p = self.put(count=9999)
        self.g.wallet = 9999*2888
        self.click()
        self.check_tip(9999, 0, 9999*2888)
        self.assertEqual((p.dragon, p.count, self.g.quantity(5960)), (0, 9999, 9999))
        self.assertEqual((self.g.wallet, self.g.charges, self.g.addCalls), (0, 1, 1))

    def test_partial_fused_stack_preserves_remaining_count_and_copies_normal_attributes(self):
        p = self.put(count=10, bind=1)
        p.soul = 0
        self.g.wallet = 3*2888+1
        self.click()
        self.check_tip(3, 7, 3*2888)
        self.assertEqual((p.dragon, p.count, self.g.wallet, self.g.quantity(5960)), (1, 7, 1, 3))
        normal = [v for v in self.g.bag.values() if v.id==4618 and v.dragon==0]
        self.assertEqual(len(normal), 1)
        result = normal[0]
        self.assertEqual((result.count, result.bind, result.strong, result.expiry), (3, 1, 9, 456))

    def test_single_split_from_stack_only_charges_one_and_keeps_other_fused_units(self):
        p = self.put(count=5)
        self.click("onDragonEquipSplitExExEx", 1, 2, 2, 1, 0, 1, 1, 1)
        self.assertEqual((p.dragon, p.count, self.g.wallet, self.g.quantity(5960)), (1, 4, 1000000000-2888, 1))
        self.assertEqual(sum(v.count for v in self.g.bag.values() if v.id==4618 and v.dragon==0), 1)

    def test_failed_normal_item_add_restores_stack_and_withdraws_material(self):
        p = self.put(count=5)
        self.g.wallet = 3*2888
        self.g.failNormalAdd = True
        self.click()
        self.check_tip(0, 5, 0)
        self.assertEqual((p.dragon, p.count, self.g.wallet, self.g.quantity(5960)), (1, 5, 3*2888, 0))
        self.assertIn("原装备返还失败", self.g.tips[1])

    def test_partial_material_award_restores_whole_stack_and_actual_fee(self):
        p = self.put(count=5)
        self.g.partialAward = True
        self.click()
        self.check_tip(0, 5, 0)
        self.assertEqual((p.dragon, p.count, self.g.wallet, self.g.quantity(5960)), (1, 5, 1000000000, 0))

    def test_partial_stack_does_not_charge_when_normal_item_needs_unavailable_slot(self):
        p = self.put(count=5)
        self.put(5960, 0, count=1)
        self.g.capacity = len(self.g.bag)
        self.g.wallet = 3*2888
        self.click()
        self.check_tip(0, 5, 0)
        self.assertEqual((p.count, self.g.wallet, self.g.charges), (5, 3*2888, 0))

    def test_uncopyable_attribute_preserves_fused_stack_without_charging(self):
        p = self.put(count=5)
        self.g.wallet = 3*2888
        self.g.failCopy = True
        self.click()
        self.check_tip(0, 5, 0)
        self.assertEqual((p.count, p.dragon, self.g.charges), (5, 1, 0))
        self.assertIn("装备属性复制失败", self.g.tips[1])


if __name__ == "__main__":
    unittest.main()
