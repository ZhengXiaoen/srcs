"""Exercise real furnace recipes, soul inheritance, NPC routes and transactional failures."""
from collections import Counter
import re
import unittest

import test_dragon_equip_split_all as dragon_tests

DATA = dragon_tests.DATA

EXTRA = r'''
PROP_ACTOR_VOCATION='job';PROP_ACTOR_CIRCLE='circle';PROP_ACTOR_SEX='sex'
PROP_ENTITY_ID='actor';job=1;circle=8;sex=0;serial=1000;meta={};commonLogs={};broadcasts={}
cash={[0]=1000000000,[1]=1000000000,[3]=1000000000};removeCalls=0;itemAdds=0
LogIds.DragonEquipFuse=2440;LogIds.sanweizhenhuoHeCheng=2668
LogIds.zhuanbeifuhunLvChange=1;LogIds.zhuanbeifuhunExpChange=2
Item.ipTaoStrong=30;Item.ipItemType=5;Item.ipItemNeedCircle='circle';Item.ipItemNeedVocation='job'
propNames[30]='tao';propNames[5]='kind'
basePut=put
put=function(id,level,super,count,bind)
 local p=basePut(id,level,super,count,bind);serial=serial+1;p.guid=serial
 p.soul=0;p.soulLevel=0;p.kind=meta[id] and meta[id].kind or 106;p.tao=0;return p
end
Actor.getIntProperty=function(_,prop)
 if prop=='job' then return job elseif prop=='circle' then return circle elseif prop=='sex' then return sex end
 return 0
end
Actor.getName=function() return '测试角色' end
Actor.getTalkNpcName=function() return '三昧真火炉' end
Actor.getMoneyCount=function(_,kind) return cash[kind] end
Actor.changeMoney=function(_,kind,delta,log,label)
 if delta<0 then
  charges=charges+1
  if failCharge then return false end
  if partialCharge then cash[kind]=cash[kind]-1;return false end
 end
 cash[kind]=cash[kind]+delta;return true
end
Actor.getItemCount=function(_,id,q,s,bind)
 local n=0;for _,p in ipairs(bag) do if p.id==id and (bind==nil or bind==-1 or p.bind==bind) then n=n+p.count end end
 return n
end
Actor.removeItem=function(_,id,count,q,s,bind,label,log)
 if failTokenRemove then return 0 end
 local removed=0
 for i=#bag,1,-1 do
  local p=bag[i]
  if p.id==id and (bind==nil or bind==-1 or p.bind==bind) then
   local take=math.min(p.count,count-removed);p.count=p.count-take;removed=removed+take
   if p.count==0 then table.remove(bag,i);p.destroyed=true end
  end
 end
 return removed
end
Actor.addItem=function(_,id,q,s,count,bind,param,label,log)
 if failTokenAdd and not string.find(label,'返还') then return 0 end
 for _,p in ipairs(bag) do if p.id==id and p.bind==bind and p.count+count<=9999 then p.count=p.count+count;return count end end
 if #bag>=capacity then return 0 end
 local p=put(id,0,0,count,bind);p.strong=s;p.expiry=0;return count
end
Item.getItemPropertyById=function(id,prop)
 if prop==68 then return 9999 end
 return meta[id] and meta[id][prop] or 0
end
Item.createItem=function(id,count,strong,quality,bind,unused,super)
 if failCreate then return nil end
 serial=serial+1
 return {id=id,count=count,strong=strong,bind=bind,dragon=0,super=super or 0,
  soul=0,soulLevel=0,expiry=0,tao=0,kind=meta[id] and meta[id].kind or 106,guid=serial}
end
Item.getItemGuidStr=function(p) assert(not p.destroyed);return tostring(p.guid) end
Item.getItemGuid=function(p) assert(not p.destroyed);return p.guid end
Item.getFuHunInfo=function(p,kind) assert(not p.destroyed);return kind==1 and p.soulLevel or p.soul end
Item.setFuHunInfo=function(_,p,kind,value) assert(not p.destroyed);p[kind==1 and 'soulLevel' or 'soul']=value end
Item.setItemProperty=function(_,p,prop,value)
 assert(not p.destroyed)
 if failAttribute and prop==30 then return false end
 if failDragonSet and prop==15 and value>0 then return false end
 p[propNames[prop] or prop]=value;return true
end
Item.removeItem=function(_,ptr,count,label,log)
 assert(not ptr.destroyed);removeCalls=removeCalls+1
 if failRemoveOn==removeCalls then return 0 end
 if partialRemove and removeCalls==1 then count=math.min(count,1) end
 for i,p in ipairs(bag) do if p==ptr then
  assert(p.count>=count);p.count=p.count-count
  if p.count==0 then table.remove(bag,i);p.destroyed=true end
  return count
 end end
 error('material pointer is no longer in bag')
end
Item.addItem=function(_,ptr,label,log,count)
 assert(not ptr.destroyed);itemAdds=itemAdds+1;count=count or ptr.count
 if failOutput and not string.find(label,'返还') then return 0 end
 for _,p in ipairs(bag) do
  if p.id==ptr.id and p.count+count<=9999 and ptr.soul==0 and ptr.soulLevel==0
   and LocalDT.DragonEquipSplitAttributesEqual(1,p,ptr) then
   p.count=p.count+count;ptr.destroyed=true;return count
  end
 end
 if #bag>=capacity then return 0 end
 assert(ptr.count==count);table.insert(bag,1,ptr);return count
end
Item.SendItemLog=function(_,p,label,log) assert(not p.destroyed);logs[#logs+1]=p end
Item.getItemName=function(id) return '装备'..(type(id)=='table' and id.id or id) end
Item.getItemLinkMsg=function(id) return '装备'..id end
Item.GetItemNameEx=function(p)
 assert(not p.destroyed)
 return (p.dragon>0 and '融合'..p.dragon..'·' or '')..(p.super==0 and '' or (p.super%2==1 and '王·' or '帝·'))..'装备'..p.id
end
System={broadcastTipmsg=function(message,channel) broadcasts[#broadcasts+1]={message,channel} end,sendCommonLog=function(...) commonLogs[#commonLogs+1]={...} end,trace=function() end}
'''


class FurnaceTests(unittest.TestCase):
    def setUp(self):
        host = dragon_tests.DragonSplitTests()
        host.setUp()
        self.lua, self.g = host.lua, host.g
        self.lua.execute(EXTRA)
        kinds = (1, 2, 2, 3, 4, 6, 7, 8, 9)
        for classes in self.g.npc.classA.values():
            for job, group in classes.items():
                for index in range(group.min, group.max+1):
                    row = self.g.npc.data[index]
                    self.g.meta[row[1]] = self.lua.table_from({"job":job, "circle":group.zslv, "kind":kinds[index-group.min]})
        self.lua.execute((DATA / "config/item/FuHunLevelInfo.lua").read_bytes().removeprefix(b"\xef\xbb\xbf"))
        source = (DATA / "functions/EquipEnhance/FuHunHandle.lua").read_text("utf-8-sig")
        for marker in ("function calFuHunLevelUpUsedExp", "findFuHunConfig  = function"):
            start = source.index(marker)
            self.lua.execute(source[start:source.index("\nend", start)+4])

    def click(self, name, *args):
        return self.g.OnNpcEvent(1, 367, name, *map(str, args))

    def put(self, itemid=4618, count=3, superlevel=0, dragon=0, bind=0):
        ptr = self.g.put(itemid, dragon, superlevel, count, bind)
        if self.g.meta[itemid] is None:
            ptr.strong, ptr.expiry = 0, 0
        return ptr

    def snapshot(self):
        counts = Counter()
        for item in self.g.bag.values():
            counts[self.key(item)] += item.count
        return counts

    @staticmethod
    def key(p):
        return (p.id,p.super,p.dragon,p.bind,p.strong,p.soulLevel,p.soul,p.expiry,p.tao)

    def items(self, itemid, superlevel, dragon=0):
        return [p for p in self.g.bag.values() if p.id==itemid and p.super==superlevel and p.dragon==dragon]

    def test_home_buttons_are_between_forge_and_recovery(self):
        page = self.click("main")
        king, emperor = "<一键锻造王装/@onDzwdZAll,1>", "<一键锻造帝装/@onDzwdZAll,2>"
        self.assertLess(page.rindex("/@onDzwdZ,"), page.index(king))
        self.assertLess(page.index(king), page.index(emperor))
        self.assertLess(page.index(emperor), page.index("/@onHuiShouNew,"))

    def test_subclass_button_is_on_right_of_middle_row_and_scoped(self):
        for kind in (1, 2):
            page = self.click("onDzwdZ", 1, 9, kind)
            button = f"<一键合成/@onDzwdZAll,{kind},1,9>"
            self.assertEqual(page.count(button), 1)
            self.assertEqual(page.count("<点击锻造/"), 9)
            self.assertLess(page.index(f"/@onDzwdZ_only,5,{kind}|"), page.index(button))
            self.assertLess(page.index(button), page.index(f"/@onDzwdZ_only,6,{kind}|"))

    def test_home_bulk_all_jobs_all_tiers_and_both_qualities_use_original_fees(self):
        for job in (1, 2, 3):
            for kind in (1, 2):
                with self.subTest(job=job, kind=kind):
                    self.setUp()
                    self.g.job = job
                    expected_fee = 0
                    for index, cfg in self.g.npc.data.items():
                        self.put(cfg[1], 7, 0 if kind==1 else cfg[2])
                        if cfg[4]==job:
                            expected_fee += cfg[5]*2
                    protected = self.put(4618, 9, dragon=1)
                    self.click("onDzwdZAll", kind)
                    self.assertEqual(self.g.cash[0], 1000000000-expected_fee)
                    self.assertEqual(self.g.cash[1], 1000000000)
                    for cfg in self.g.npc.data.values():
                        input_pro = 0 if kind==1 else cfg[2]
                        output_pro = cfg[2]+(kind==2)
                        source = self.items(cfg[1], input_pro)
                        self.assertEqual(sum(p.count for p in source), 1 if cfg[4]==job else 7)
                        output = self.items(cfg[1], output_pro)
                        self.assertEqual(sum(p.count for p in output), 2 if cfg[4]==job else 0)
                        for p in output:
                            self.assertEqual((p.bind,p.strong,p.tao), (0,0,6))
                    self.assertEqual((protected.count,protected.dragon), (9,1))
                    self.assertIn("共锻造126件", self.g.tips[1])
                    self.assertEqual(len(self.g.tips), 1)

    def test_low_circle_and_selected_category_do_not_consume_other_recipes(self):
        self.g.circle = 2
        self.put(4618, 6)
        untouched = self.put(4645, 6)
        self.click("onDzwdZAll", 1)
        self.assertEqual(untouched.count, 6)
        self.assertEqual(sum(p.count for p in self.items(4618,1)), 2)
        self.setUp()
        self.g.job = 2
        for cfg in self.g.npc.data.values(): self.put(cfg[1],4)
        self.click("onDzwdZAll", 1, 37, 45)
        for index,cfg in self.g.npc.data.items():
            self.assertEqual(sum(p.count for p in self.items(cfg[1],0)), 1 if 37<=index<=45 else 4)
        self.assertEqual(self.g.cash[0],1000000000-9*500000)

    def test_single_forge_handles_three_units_in_one_stack(self):
        self.put(count=6)
        self.click("onDzwdZ_only", 1, 1)
        self.assertEqual(sum(p.count for p in self.items(4618,0)), 3)
        self.assertEqual(sum(p.count for p in self.items(4618,1)), 1)
        self.assertEqual(self.g.cash[0], 1000000000-250000)
        self.assertEqual([msg[2] for msg in self.g.broadcasts.values()], [128,2])
        self.assertIn("王·装备4618/v1,4618,", self.g.broadcasts[1][1])
        self.assertIn("王·装备4618", self.g.broadcasts[2][1])

    def test_money_uses_sufficient_binding_currency_then_coin_and_never_combines(self):
        for bound,coin,expected in ((250000,250000,0),(100,250000,1),(125000,125000,None)):
            with self.subTest(bound=bound,coin=coin):
                self.setUp();self.put()
                self.g.cash[0],self.g.cash[1] = bound,coin
                before = self.snapshot()
                self.click("onDzwdZAll",1)
                if expected is None:
                    self.assertEqual(self.snapshot(),before)
                    self.assertEqual((self.g.cash[0],self.g.cash[1]),(bound,coin))
                else:
                    self.assertEqual(self.g.cash[expected],0)
                    self.assertEqual(sum(p.count for p in self.items(4618,1)),1)

    def test_bulk_stops_at_affordable_count_and_repeat_click_does_not_repeat_awards(self):
        self.put(count=9);self.g.cash[0]=500100;self.g.cash[1]=0
        self.click("onDzwdZAll",1)
        self.assertEqual((sum(p.count for p in self.items(4618,0)),sum(p.count for p in self.items(4618,1))),(3,2))
        self.assertEqual(self.g.cash[0],100)
        self.assertIn("绑金或金币不足",self.g.tips[1])
        before = self.snapshot();self.click("onDzwdZAll",1)
        self.assertEqual(self.snapshot(),before)

    def test_forge_sums_all_consumed_soul_experience_using_actual_soul_config(self):
        materials = [self.put(4645,1) for _ in range(3)]
        for p,level,exp in zip(materials,(0,1,2),(20,30,40)):p.soulLevel,p.soul=level,exp
        expected = sum(p.soul+self.g.calFuHunLevelUpUsedExp(1,p) for p in materials)
        self.click("onDzwdZAll",1,28,36)
        output = self.items(4645,self.g.npc.data[28][2])[0]
        self.assertEqual(output.soul+self.g.calFuHunLevelUpUsedExp(1,output),expected)
        self.assertEqual(len(self.g.commonLogs),2)

    def test_full_bag_uses_freed_material_slot_or_matching_output_stack(self):
        self.put(count=3);self.g.capacity=1
        self.click("onDzwdZAll",1)
        self.assertEqual(len(self.g.bag),1)
        self.assertEqual(self.g.bag[1].super,1)
        self.setUp()
        self.put(count=7)
        target = self.put(count=1,superlevel=1)
        target.strong,target.expiry,target.tao=0,0,6
        self.g.capacity=2
        self.click("onDzwdZAll",1)
        self.assertEqual(target.count,3)
        self.assertEqual(sum(p.count for p in self.items(4618,0)),1)

    def test_full_bag_without_output_space_preserves_materials_and_money(self):
        self.put(count=7);self.g.capacity=1
        before = self.snapshot()
        self.click("onDzwdZAll",1)
        self.assertEqual(self.snapshot(),before)
        self.assertEqual(self.g.charges,0)
        self.assertIn("包裹空间不足",self.g.tips[1])

    def test_failures_restore_exact_material_attributes_and_actual_fee(self):
        for flag,value in (("failCreate",True),("failAttribute",True),("failCharge",True),
                           ("partialCharge",True),("failRemoveOn",1),("failRemoveOn",2),("failOutput",True)):
            with self.subTest(flag=flag,value=value):
                self.setUp()
                for n in range(3):
                    p=self.put(4645,1,bind=n%2);p.soul=11+n;p.soulLevel=n;p.expiry=456+n;p.strong=7+n
                before = self.snapshot()
                self.g[flag]=value
                self.click("onDzwdZAll",1,28,36)
                self.assertEqual(self.snapshot(),before)
                self.assertEqual((self.g.cash[0],self.g.cash[1]),(1000000000,1000000000))
                self.assertEqual(len(self.g.commonLogs),0)
                self.assertIn("共锻造0件",self.g.tips[1])

    def test_partial_material_removal_restores_only_actual_removed_quantity(self):
        self.put(count=3,bind=1);before=self.snapshot();self.g.partialRemove=True
        self.click("onDzwdZAll",1)
        self.assertEqual(self.snapshot(),before)
        self.assertEqual(self.g.cash[0],1000000000)

    def test_invalid_ranges_foreign_job_and_trade_cannot_forge(self):
        for name,args in (("onDzwdZAll",(0,)),("onDzwdZAll",(1,"bad","bad")),
                          ("onDzwdZAll",(1,1,8)),("onDzwdZAll",(1,10,18)),
                          ("onDzwdZ_only",(10,1)),("onDzwdZ_only",("bad",1))):
            with self.subTest(name=name,args=args):
                self.setUp();self.put();self.put(4627)
                before=self.snapshot();self.click(name,*args)
                self.assertEqual(self.snapshot(),before);self.assertEqual(self.g.charges,0)
        self.g.dealing=True
        self.assertEqual(self.click("onDzwdZAll",1),"null")

    def test_dragon_pages_show_seven_three_column_rows_without_job_selection(self):
        for job in (1,2,3):
            for sex in (0,1):
                self.g.job,self.g.sex=job,sex
                for level in range(1,6):
                    for part in range(1,9):
                        for mode in (1,2):
                            page=self.click("onDragonEquipFuseEx",level,part,mode,1)
                            rows=re.findall(r"(\d+)转:",page)
                            self.assertEqual(rows,["4","5","6","7","9","11","13"])
                            self.assertEqual(page.count("/@onDragonEquipByClass,"),21)
                            self.assertNotIn("/@onDragonEquipFuseExEx,",page)
                            self.assertNotIn("/@onDragonEquipSplitExEx,",page)
                            self.assertIn("#起源/@onDragonEquipByClass",page)
                            self.assertIn("#王·起源/@onDragonEquipByClass",page)
                            self.assertIn("#帝·起源/@onDragonEquipByClass",page)

    def test_dragon_recipe_resolution_covers_all_jobs_sexes_parts_levels_and_pros(self):
        for job in (1,2,3):
            for sex in (0,1):
                self.g.job,self.g.sex=job,sex
                for level in range(1,6):
                    for part in range(1,9):
                        for series in range(1,8):
                            for pro in (0,1,2):
                                cfg,_,_,group=self.g.LocalDT.GetSanWeiDragonRecipe(1,level,part,series,pro)
                                offset=0 if part==1 else (1+sex if part==2 else part)
                                self.assertEqual((cfg.id,cfg.pro),(self.g.npc.data[group.min+offset][1],pro))
                                if part==2:self.assertEqual(cfg.id2,self.g.EquipDragonCfg.dragonIds[level][5 if sex else 2])

    def test_direct_dragon_click_fuses_highest_soul_of_own_job_and_splits_with_original_fee(self):
        self.g.job=2
        cfg,_,_,_=self.g.LocalDT.GetSanWeiDragonRecipe(1,3,1,2,1)
        low=self.put(cfg.id,1,3);low.soulLevel=1
        high=self.put(cfg.id,1,3);high.soulLevel=2
        other=self.put(4645,1,3)
        self.put(cfg.id2,1)
        page=self.click("onDragonEquipByClass",3,1,2,1,1,1)
        self.assertEqual((low.dragon,high.dragon,other.dragon),(0,3,0))
        self.assertEqual(self.g.quantity(cfg.id2),0)
        self.assertEqual(page.count("/@onDragonEquipByClass,"),21)
        self.lua.execute("tips={}")
        self.click("onDragonEquipByClass",3,1,2,1,2,1)
        self.assertEqual((high.dragon,self.g.quantity(cfg.id2),self.g.cash[3]),(0,1,1000000000-cfg.money))

    def test_clothing_click_uses_own_sex_and_correct_dragon_material(self):
        for job in (1,2,3):
            for sex in (0,1):
                with self.subTest(job=job,sex=sex):
                    self.setUp();self.g.job,self.g.sex=job,sex
                    cfg,_,_,group=self.g.LocalDT.GetSanWeiDragonRecipe(1,1,2,1,0)
                    wanted=self.put(cfg.id,1)
                    other=self.put(self.g.npc.data[group.min+2-sex][1],1)
                    self.put(cfg.id2,1)
                    self.click("onDragonEquipByClass",1,2,1,0,1,1)
                    self.assertEqual((wanted.dragon,other.dragon,self.g.quantity(cfg.id2)),(1,0,0))

    def test_fusion_of_stack_uses_one_material_per_unit_and_keeps_other_units(self):
        source=self.put(count=5,bind=1);self.put(5969,2,bind=1)
        self.click("onDragonEquipByClass",2,1,1,0,1,1)
        self.click("onDragonEquipByClass",2,1,1,0,1,1)
        self.assertEqual((source.count,source.dragon,self.g.quantity(5969)),(3,0,0))
        self.assertEqual(sum(p.count for p in self.items(4618,0,2)),2)
        before=self.snapshot();self.click("onDragonEquipByClass",2,1,1,0,1,1)
        self.assertEqual(self.snapshot(),before)

    def test_fusion_failure_preserves_stack_attributes_and_material_binding(self):
        for flag in ("failDragonSet","failOutput","failTokenRemove"):
            with self.subTest(flag=flag):
                self.setUp();self.put(count=5,bind=1);self.put(5969,1,bind=1)
                before=self.snapshot();self.g[flag]=True
                self.click("onDragonEquipByClass",2,1,1,0,1,1)
                self.assertEqual(self.snapshot(),before)

    def test_invalid_dragon_links_do_not_mutate_inventory(self):
        self.put();self.put(5960,1);before=self.snapshot()
        for args in ((0,1,1,0,1,1),(1,9,1,0,1,1),(1,1,8,0,1,1),
                     (1,1,1,3,1,1),(1,1,1,0,0,1),("bad",1,1,0,1,1)):
            self.click("onDragonEquipByClass",*args)
            self.assertEqual(self.snapshot(),before)


if __name__ == "__main__":
    unittest.main()
