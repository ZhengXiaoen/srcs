"""Run VIP material auto-use with the real Lua 5.1 manual-use handlers."""
from __future__ import annotations

import argparse
from pathlib import Path
import re
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
FUNCTIONS = ROOT / "Server/S1001/data/functions"
CONFIG = ROOT / "Server/S1001/data/config/item/NormalItemDatas.lua"
TARGET_IDS = (542, 543, 544, 527, 528, 529, 530, 6297, 6374, 6298,
              5165, 5166, 5167, 5168, 5171, 6912, 6913, 6914, 6915, 6916, 6917,
              4744, 4745, 4746, 7061, 7062, 7063, 7064, 7065, 7066,
              7151, 7152, 7153, 7154, 7155, 7618, 7619, 7620,
              7780, 7781, 7782, 7783, 7784, 7785, 508)


def named_table(code, name):
    match = re.search(r"(?ms)^" + name + r"\s*=\s*\{.*?^\};?", code)
    if not match:
        raise ValueError("Missing configuration table " + name)
    return match[0]


def function(code, name):
    start = code.index("function " + name + "(")
    end = code.find("\nfunction ", start + 1)
    return code[start:end if end >= 0 else None]


class VipMaterialAutoUseTests(unittest.TestCase):
    def runtime(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute(r"""
LocalDT={}; bag={}; state={autoUseMaterials=1,d={},days={}}; properties={}
vip=true; logs={}; ranks={}; packets=0; bloodPackets=0; ringPackets=0; spiritPackets=0; effects=0; removed={};tips={};money={};actorData={}
PROP_ACTOR_INNER_EXP=80;state.fighterLevel=1
PROP_ACTOR_CIRCLE_SOUL=79; PROP_ENTITY_ID=5; ttFlyTip=16
PROP_ACTOR_BIND_COIN=6;GameLog={clNpcGiveMoney=7}
LogIds={shiyongzhuanshengxiuweidan=2708,shenhunzhibianhua=2783,hufusuipian=2697,
 xuelianValue=8,ThorEquipValueChange=9,UseRingGodAddValueItem=2801,xianzuan=2812,
 shiyongneigongjingyanquan=2707,UseSFighterEnergyItem=2784}
LogicCmd={miscSysEx={sub={sRingGodSystem=92}}}
Lang={ScriptTips={Qf00008='%s:%s:%s',b005='%s:%s:%s'}}
IsSpeciaTitleVip=function(_,type) assert(type==3);return vip end
Actor={
 getStaticVar=function()return state end,
 getItemCount=function(_,id)local count=0;for _,i in ipairs(bag)do if i.id==id then count=count+i.count end end;return count end,
 getName=function()return 'test' end,
 getIntProperty=function(_,id)return properties[id] or 0 end,
 getUIntProperty=function(_,id)return properties[id] or 0 end,
 setIntProperty=function(_,id,value)properties[id]=value end,
 setUIntProperty=function(_,id,value)properties[id]=value end,
 getXueLianValue=function()return state.bloodValue or 0 end,
 setXueLianValue=function(_,value)state.bloodValue=value end,
 getXueLianData=function(_,index)assert(index==0);return 2 end,
 getThorEquipValue=function()return state.thorValue or 0 end,
 setThorEquipValue=function(_,value)state.thorValue=value end,
 getRingGodValue=function()return state.ringValue or 0 end,
 setRingGodValue=function(_,value)state.ringValue=value end,
 getRingGodLevel=function()return state.ringLevel or 0 end,
 getSpiritFighterLevel=function()return state.fighterLevel end,
 getSpiritFighterEnergyExp=function()return state.spiritExp or 0 end,
 setSpiritFighterEnergyExp=function(_,value)state.spiritExp=value end,
 addInnerExp=function(_,value)
  local old=properties[PROP_ACTOR_INNER_EXP] or 0
  local added=math.min(value,math.max(0,(state.innerLimit or math.huge)-old))
  properties[PROP_ACTOR_INNER_EXP]=old+added;return added
 end,
 playEnergyEffect=function(_,effect,value)assert(effect==4 and value==0);effects=effects+1 end,
 changeMoney=function(_,type,value,log)
  assert(type==0 and log==7);money[type]=(money[type] or 0)+value
  properties[PROP_ACTOR_BIND_COIN]=money[type]
 end,
 sendTipmsg=function(_,msg)table.insert(tips,msg)end,
 removeItemByPtr=function(_,item,count)
  if failRemove then return 0 end
  for index,current in ipairs(bag) do
   if current==item then
    assert(count>0 and count<=item.count)
    item.count=item.count-count;removed[item.id]=(removed[item.id] or 0)+count
    if item.count==0 then table.remove(bag,index)end
    return count
   end
  end
  return 0
 end
}
Item={ipItemCount=100,
 getBagItemCount=function()return #bag end,
 getItemPtrByIndex=function(_,index)return bag[index+1]end,
 getItemId=function(item)return item.id end,
 getItemProperty=function(_,item,prop)assert(prop==100);return item.count end,
 getItemName=function(id)return tostring(id)end,
 getItemLinkMsg=function(id)return tostring(id)end
}
System={getDaysSinceOpenServer=function()return 10 end,
 sendCommonLog=function(id,...)table.insert(logs,{id=id,args={...}})end}
DataPack={allocPacket=function(_,main,sub)return {main=main,sub=sub,bytes={}}end,
 writeInt=function(packet,value)packet.value=value;packet.ints=packet.ints or {};table.insert(packet.ints,value)end,
 writeUInt=function(packet,value)packet.value=value end,
 writeByte=function(packet,value)table.insert(packet.bytes,value)end,
 flush=function(packet)
  if packet.main==151 then
   assert(packet.sub==92 and packet.bytes[1]==1 and packet.ints[1]==state.ringValue and packet.ints[2]==(state.ringLevel or 0))
   ringPackets=ringPackets+1
  elseif packet.main==74 then
   assert(packet.sub==8 and packet.value==state.spiritExp);spiritPackets=spiritPackets+1
  elseif packet.main==73 then
   assert(packet.sub==2 and packet.value==state.bloodValue and packet.bytes[1]==1 and packet.bytes[2]==2)
   bloodPackets=bloodPackets+1
  else assert(packet.value==state.godSoulValue);packets=packets+1 end
 end}
send_actor_data_on_login=function()table.insert(actorData,state.xianzuan)end
HandleAddNewRankCount=function(_,index,value)ranks[index]=(ranks[index] or 0)+value end
JSLingLiDanUseTable={};onAchievementFunc=function()error('unexpected achievement use')end
""")
        config = CONFIG.read_text(encoding="utf-8-sig")
        for name in ("zJuanZhouAdd", "FuSoulAdd", "zAchievement", "CircleExp", "zGnItem100", "SpiritFighterEnergyItemTable"):
            lua.execute(named_table(config, name))
        code = (FUNCTIONS / "Qfunctions.lua").read_text(encoding="utf-8-sig")
        for name in ("onJuanZhouAdd", "onFuSoulAdd", "onCircleExp", "onZhaoCaiFu", "onUseSpiritFighterEnergyItem"):
            lua.execute(function(code, name))
        ring_code = (FUNCTIONS / "EquipEnhance/RingGodSystem.lua").read_text(encoding="utf-8-sig")
        lua.execute(function(ring_code, "SendRingGodInfo"))
        lua.execute((FUNCTIONS / "VipRecovery.lua").read_text(encoding="utf-8-sig"))
        return lua

    def test_all_variants_use_entire_bound_and_unbound_stacks_once(self):
        lua = self.runtime()
        for id in TARGET_IDS:
            lua.execute(f"table.insert(bag,{{id={id},count=3,bind=0}});table.insert(bag,{{id={id},count=200,bind=1}})")
        lua.execute("VipAutoUseMaterials({})")
        state = lua.globals().state
        properties = lua.globals().properties
        self.assertEqual(0, len(lua.globals().bag))
        for id in TARGET_IDS:
            self.assertEqual(203, lua.globals().removed[id], id)
        self.assertEqual(203 * (1000 + 5000 + 10000), properties[79])
        self.assertEqual(203 * (1 + 100 + 10000 + 10), properties[131])
        self.assertEqual(203 * (10000 + 50000 + 100000), properties[166])
        self.assertEqual(203 * (10 + 100 + 1000 + 10000 + 1), state.godSoulValue)
        self.assertEqual(203 * (2 + 5 + 10 + 100 + 1000 + 10000), state.bloodValue)
        self.assertEqual(203 * (1 + 10 + 100 + 1000 + 10000), state.thorValue)
        self.assertEqual(203 * (100 + 1000 + 10000), state.ringValue)
        self.assertEqual(6, lua.globals().ringPackets)
        self.assertEqual(203 * (10000 + 20000 + 50000), properties[80])
        self.assertEqual(203 * (2 + 5 + 10 + 100 + 1000 + 10000), state.spiritExp)
        self.assertEqual(12, lua.globals().spiritPackets)
        self.assertEqual(203 * (2 + 5 + 10 + 100 + 1000 + 10000), state.xianzuan)
        self.assertEqual(12, len(lua.globals().actorData))
        self.assertEqual(203 * 600000, lua.globals().money[0])
        self.assertIsNone(state.days.barsNum)
        self.assertEqual(12, lua.globals().bloodPackets)
        self.assertEqual(12, lua.globals().effects)
        self.assertEqual(properties[131], lua.globals().ranks[9])
        self.assertEqual(10, lua.globals().packets)
        logs = len(lua.globals().logs)
        lua.execute("VipAutoUseMaterials({})")
        self.assertEqual(logs, len(lua.globals().logs))

    def timer_runtime(self):
        lua = self.runtime()
        types = (FUNCTIONS / "BaseDef/ItemTypes.lua").read_text(encoding="gb18030")
        recovery = (FUNCTIONS / "VipRecovery.lua").read_text(encoding="utf-8-sig")
        # The server includes itemTypes as a field of the local BaseTypes table.
        lua.execute("local BaseTypes={" + types + "}\n" + recovery)
        lua.execute(r"""
System.isCrossServer=function()return crossServer or false end
get_d_val=function(_,key)return state.d[key] or 0 end
set_d_val=function(_,key,value)state.d[key]=value end
ShuaXinFengHao=function()end;OnFinish_Liveness=function()end
PROP_CREATURE_LEVEL=300;Actor.getActorMaxLevel=function()return 1000 end
LogicCmd.miscSys={sysId=139,sub={sHuiShouZhuangbei=200}}
local flush=DataPack.flush
DataPack.flush=function(packet)if packet.sub~=200 then flush(packet)end end
Actor.playEnergyEffect=function()end
Actor.changeMoney=function(_,kind,value)money[kind]=(money[kind] or 0)+value end
Actor.addExp=function(_,value)state.recycleExp=(state.recycleExp or 0)+value end
Item.ipItemType=1;Item.ipItemNeedCircle=2;itemDefinitions={}
Item.getItemPropertyById=function(id,key)return itemDefinitions[id][key]end
Actor.removeItem=function(actor,id,count)
 for index=#bag,1,-1 do
  if bag[index].id==id and count>0 then
   local used=math.min(count,bag[index].count)
   Actor.removeItemByPtr(actor,bag[index],used);count=count-used
  end
 end
end
RecycledItems={};for i=1,20 do RecycledItems[i]={title='test',list={},notAuto=true}end
RecycledItems[2].notAuto=nil;state.d[119]=1
for circle=0,4 do
 for kind=1,3 do
  local id=10000+circle*10+kind
  itemDefinitions[id]={[1]=kind,[2]=circle}
  table.insert(RecycledItems[2].list,{itemid=id,exp=10,bindgold=2,gold=0,hufu=0})
  table.insert(bag,{id=id,count=1})
 end
end
""")
        timer = (FUNCTIONS / "TimerFunc.lua").read_text(encoding="utf-8-sig")
        lua.execute("TimerFunc={};" + re.search(r"(?ms)^TimerFunc\[27\] = function\(sysarg\).*?^end", timer)[0])
        lua.execute(function((FUNCTIONS / "player.lua").read_text(encoding="utf-8-sig"), "OnActorTimer"))
        return lua

    def test_timer_recycles_equipment_then_uses_materials_with_local_item_types(self):
        lua = self.timer_runtime()
        self.assertIsNone(lua.globals().itemTypes)
        for id in TARGET_IDS:
            lua.execute(f"table.insert(bag,{{id={id},count=3,bind=0}});table.insert(bag,{{id={id},count=200,bind=1}})")
        lua.execute("OnActorTimer({},27)")
        self.assertEqual(6, len(lua.globals().bag))
        self.assertEqual(90, lua.globals().state.recycleExp)
        self.assertEqual(203 * 600000 + 18, lua.globals().money[0])
        for circle in range(5):
            for kind in range(1,4):
                id = 10000 + circle * 10 + kind
                self.assertEqual(1 if kind in (1,2) and 1 <= circle <= 3 else 0,
                                 lua.globals().Actor.getItemCount(None, id), id)
        for id in TARGET_IDS:
            self.assertEqual(203, lua.globals().removed[id], id)
        lua.execute("OnActorTimer({},27)")
        self.assertEqual(90, lua.globals().state.recycleExp)
        self.assertEqual(6, len(lua.globals().bag))
        lua.execute("table.insert(bag,{id=10043,count=1});table.insert(bag,{id=7618,count=2});OnActorTimer({},27)")
        self.assertEqual(100, lua.globals().state.recycleExp)
        self.assertEqual(203 * 11100 + 200, lua.globals().state.ringValue)

    def test_timer_respects_cross_server_privilege_and_material_switch(self):
        for setting in ("crossServer=true", "vip=false"):
            lua = self.timer_runtime()
            lua.execute("table.insert(bag,{id=7618,count=2});" + setting + ";OnActorTimer({},27)")
            self.assertEqual(16, len(lua.globals().bag))
            self.assertEqual(0, len(lua.globals().removed))
        lua = self.timer_runtime()
        lua.execute("table.insert(bag,{id=7618,count=2});state.autoUseMaterials=0;OnActorTimer({},27)")
        self.assertEqual(7, len(lua.globals().bag))
        self.assertEqual(2, lua.globals().Actor.getItemCount(None,7618))
        self.assertEqual(90, lua.globals().state.recycleExp)

    def test_diamonds_add_to_existing_balance_and_sync_each_consumed_stack(self):
        lua = self.runtime()
        lua.execute("state.xianzuan=17")
        expected = 17
        for id, value in zip(range(7780, 7786), (2, 5, 10, 100, 1000, 10000)):
            lua.execute(f"bag={{{{id={id},count=3,bind=0}},{{id={id},count=200,bind=1}}}};VipAutoUseMaterials({{}})")
            for count in (200, 3):
                old = expected
                expected += value * count
                log = lua.globals().logs[len(lua.globals().logs) - (1 if count == 200 else 0)]
                self.assertEqual(2812, log.id)
                self.assertEqual((old, expected, "使用仙钻"), (log.args[4], log.args[5], log.args[8]))
            self.assertEqual(expected, lua.globals().state.xianzuan)
            self.assertEqual(expected, lua.globals().actorData[len(lua.globals().actorData)])
            self.assertEqual(0, len(lua.globals().bag))
        lua.execute("VipAutoUseMaterials({})")
        self.assertEqual(12, len(lua.globals().logs))
        self.assertEqual(12, len(lua.globals().actorData))
        self.assertEqual(expected, lua.globals().state.xianzuan)

    def test_ring_dust_adds_to_existing_balance_and_syncs_each_stack(self):
        lua = self.runtime()
        lua.execute("state.ringValue=17;state.ringLevel=50")
        expected = 17
        for id, value in zip((7618, 7619, 7620), (100, 1000, 10000)):
            lua.execute(f"bag={{{{id={id},count=3,bind=0}},{{id={id},count=200,bind=1}}}};VipAutoUseMaterials({{}})")
            for count in (200, 3):
                old = expected
                expected += value * count
                log = lua.globals().logs[len(lua.globals().logs) - (1 if count == 200 else 0)]
                self.assertEqual(2801, log.id)
                self.assertEqual((old, expected, "使用戒灵粉尘"), (log.args[4], log.args[5], log.args[8]))
            self.assertEqual(expected, lua.globals().state.ringValue)
            self.assertEqual(50, lua.globals().state.ringLevel)
            self.assertEqual(0, len(lua.globals().bag))
        lua.execute("VipAutoUseMaterials({})")
        self.assertEqual(6, lua.globals().ringPackets)
        self.assertEqual(6, len(lua.globals().logs))
        self.assertEqual(expected, lua.globals().state.ringValue)

    def test_ring_dust_consumption_failure_preserves_items_and_balance(self):
        lua = self.runtime()
        lua.execute("state.ringValue=17;failRemove=true")
        for id in (7618, 7619, 7620):
            lua.execute(f"table.insert(bag,{{id={id},count=3,bind=0}});table.insert(bag,{{id={id},count=200,bind=1}})")
        lua.execute("VipAutoUseMaterials({})")
        self.assertEqual(6, len(lua.globals().bag))
        self.assertEqual(17, lua.globals().state.ringValue)
        for id in (7618, 7619, 7620):
            self.assertEqual(203, lua.globals().Actor.getItemCount(None, id))
        for name in ("removed", "logs", "tips"):
            self.assertEqual(0, len(lua.globals()[name]))
        self.assertEqual(0, lua.globals().ringPackets)

    def test_spirit_potential_waits_for_activation_without_repeated_tips(self):
        lua = self.runtime()
        lua.execute("state.fighterLevel=0;state.spiritExp=17")
        for id in range(7061, 7067):
            lua.execute(f"table.insert(bag,{{id={id},count=3,bind=0}});table.insert(bag,{{id={id},count=200,bind=1}})")
        lua.execute("table.insert(bag,{id=7618,count=2});VipAutoUseMaterials({});VipAutoUseMaterials({})")
        self.assertEqual(12, len(lua.globals().bag))
        self.assertEqual(17, lua.globals().state.spiritExp)
        self.assertEqual(200, lua.globals().state.ringValue)
        self.assertEqual(1, len(lua.globals().tips))
        self.assertEqual(0, lua.globals().spiritPackets)
        lua.execute("state.fighterLevel=1;VipAutoUseMaterials({})")
        self.assertEqual(17 + 203 * (2 + 5 + 10 + 100 + 1000 + 10000), lua.globals().state.spiritExp)
        self.assertEqual(0, len(lua.globals().bag))
        self.assertEqual(12, lua.globals().spiritPackets)

    def test_inner_scrolls_and_potential_consumption_failure_grant_nothing(self):
        lua = self.runtime()
        lua.execute("properties[PROP_ACTOR_INNER_EXP]=17;state.spiritExp=23;failRemove=true")
        for id in (*range(4744, 4747), *range(7061, 7067)):
            lua.execute(f"table.insert(bag,{{id={id},count=3,bind=0}});table.insert(bag,{{id={id},count=200,bind=1}})")
        lua.execute("VipAutoUseMaterials({})")
        self.assertEqual(18, len(lua.globals().bag))
        self.assertEqual(17, lua.globals().properties[80])
        self.assertEqual(23, lua.globals().state.spiritExp)
        for name in ("removed", "logs", "tips"):
            self.assertEqual(0, len(lua.globals()[name]))
        self.assertEqual(0, lua.globals().spiritPackets)
        lua.execute("onJuanZhouAdd({},4744,bag[1],{item_id=4744,value=10000,str='内功经验',type=8},0,1)")
        self.assertEqual(17, lua.globals().properties[80])
        self.assertEqual(0, len(lua.globals().logs))

    def test_inner_scrolls_keep_engine_reward_and_log_actual_experience(self):
        lua = self.runtime()
        lua.execute("properties[PROP_ACTOR_INNER_EXP]=17;state.innerLimit=25000;bag={{id=4744,count=3}};VipAutoUseMaterials({})")
        self.assertEqual(25000, lua.globals().properties[80])
        self.assertEqual(0, len(lua.globals().bag))
        log = lua.globals().logs[1]
        self.assertEqual(2707, log.id)
        self.assertEqual((17, 25000, "使用内功经验券"), (log.args[4], log.args[5], log.args[6]))
        lua.execute("VipAutoUseMaterials({})")
        self.assertEqual(1, len(lua.globals().logs))

    def test_disabled_switch_or_missing_privilege_preserves_items(self):
        for setting in ("state.autoUseMaterials=0", "vip=false"):
            lua = self.runtime()
            for id in TARGET_IDS:
                lua.execute(f"table.insert(bag,{{id={id},count=3}})")
            lua.execute(setting)
            lua.execute("VipAutoUseMaterials({})")
            self.assertEqual(len(TARGET_IDS), len(lua.globals().bag))
            self.assertEqual(0, len(lua.globals().removed))
            self.assertEqual(0, len(lua.globals().logs))

    def test_new_material_consumption_failure_does_not_grant_rewards(self):
        lua = self.runtime()
        for id in range(6912, 6918):
            lua.execute(f"table.insert(bag,{{id={id},count=3}})")
        for id in range(7151, 7156):
            lua.execute(f"table.insert(bag,{{id={id},count=3}})")
        for id in range(7780, 7786):
            lua.execute(f"table.insert(bag,{{id={id},count=3}})")
        lua.execute("table.insert(bag,{id=508,count=3});failRemove=true;VipAutoUseMaterials({})")
        self.assertEqual(18, len(lua.globals().bag))
        self.assertTrue(all(item.count == 3 for item in lua.globals().bag.values()))
        for name in ("bloodValue", "thorValue", "xianzuan"):
            self.assertIsNone(lua.globals().state[name])
        self.assertIsNone(lua.globals().money[0])
        for name in ("removed", "logs", "actorData"):
            self.assertEqual(0, len(lua.globals()[name]))
        for name in ("bloodPackets", "effects"):
            self.assertEqual(0, lua.globals()[name])

    def test_newly_picked_boss_gold_bricks_use_same_bound_gold_handler(self):
        lua = self.runtime()
        for name in ("dropsBossGoldBrick.lua", "dropsBossGoldBrickProtected.lua"):
            path = ROOT / "Server/S1001/data/config/monster/drops" / name
            source = path.read_text(encoding="gb18030")
            drop = lua.execute("return {" + source + "}")[1]
            self.assertEqual((0, 508, 1, 0), (drop.type, drop.id, drop.count, drop.bind))
        lua.execute("state.days.barsNum=100;bag={{id=508,count=1,bind=0}};VipAutoUseMaterials({})")
        self.assertEqual(600000, lua.globals().money[0])
        self.assertEqual(0, len(lua.globals().bag))
        lua.execute("table.insert(bag,{id=508,count=1,bind=0});VipAutoUseMaterials({})")
        self.assertEqual(1200000, lua.globals().money[0])
        self.assertEqual(100, lua.globals().state.days.barsNum)
        self.assertEqual(2, lua.globals().removed[508])
        lua.execute("VipAutoUseMaterials({})")
        self.assertEqual(1200000, lua.globals().money[0])

    def test_script_compiles_with_existing_include_local_budget(self):
        lua = self.runtime()
        source = (FUNCTIONS / "VipRecovery.lua").read_text(encoding="utf-8-sig")
        combined = ";".join(f"local existing{index}=0" for index in range(180)) + ";" + source
        self.assertTrue(lua.eval("function(source) return assert(loadstring(source)) ~= nil end")(combined))

    def test_consumption_failure_does_not_grant_new_rewards(self):
        for id, property in ((542, 79), (527, 131), (6297, 166)):
            lua = self.runtime()
            lua.execute(f"bag={{{{id={id},count=3}}}};failRemove=true;VipAutoUseMaterials({{}})")
            self.assertEqual(3, lua.globals().bag[1].count)
            self.assertIsNone(lua.globals().properties[property])
            self.assertEqual(0, len(lua.globals().removed))

    def test_cost_boxes_and_unrelated_items_are_not_auto_used(self):
        lua = self.runtime()
        lua.execute("bag={{id=617,count=1},{id=618,count=1},{id=619,count=1},{id=620,count=1},{id=621,count=1},{id=625,count=1},{id=83,count=1},{id=507,count=1},{id=509,count=1},{id=542,count=2}};VipAutoUseMaterials({})")
        self.assertEqual(9, len(lua.globals().bag))
        self.assertEqual(2000, lua.globals().properties[79])
        self.assertIsNone(lua.globals().LocalDT.VipRecoveryAutoUseMaterialIds[617])

    def test_legacy_switch_migrates_once_and_off_stays_off(self):
        lua = self.runtime()
        lua.execute("state.autoUseMaterials=nil;state.autoUseGemFragments=1")
        self.assertTrue(lua.execute("return LocalDT.IsVipMaterialAutoUseEnabled({})"))
        self.assertIsNone(lua.globals().state.autoUseGemFragments)
        lua.execute("state.autoUseMaterials=0;state.autoUseHolyPearlFragments=1")
        self.assertFalse(lua.execute("return LocalDT.IsVipMaterialAutoUseEnabled({})"))

    def test_client_dialog_lists_supported_material_families(self):
        lua = self.runtime()
        lua.execute("RecycledItems={};for i=2,20 do RecycledItems[i]={notAuto=true}end;get_d_val=function()return 0 end;state.dealAutoSell={}")
        dialog = lua.execute("return onVipAutomaticHs({})")
        for label in ("转生丹", "元神丹", "特戒结晶", "神魂", "血炼精华", "战灵潜能", "内功经验卷", "仙力", "戒灵粉尘", "仙钻", "金砖(绑金)"):
            self.assertIn(label, dialog)
        self.assertIn("已开启", dialog)
        self.assertIn("@onVipAutomaticHsEx,21", dialog)

    def test_client_item_values_and_pack_copies_match_auto_use(self):
        from patch_guild_quest_config import read_cbp, read_pack
        client = ROOT / "web/v2/lang/zh-cn"
        pack = dict(read_pack((client / "zh-cn.dat").read_bytes()))
        # Item extension resources replace the base resource's placeholders.
        active = {}
        for path in sorted(client.glob("stditems*.cbp")):
            self.assertEqual(path.read_bytes(), pack[path.name], path.name)
            _, tree = read_cbp(path.read_bytes())
            for node in tree.children:
                fields = {child.name: child for child in node.children}
                if "id" in fields and int(fields["id"].number()) in TARGET_IDS:
                    active[int(fields["id"].number())] = fields
        self.assertEqual(set(TARGET_IDS), set(active))
        lua = self.runtime()
        for table_name, family in (("CircleExp", "转生修为丹"),
                                   ("zJuanZhouAdd", None), ("zGnItem100", "金砖(绑金)"),
                                   ("SpiritFighterEnergyItemTable", "潜能")):
            for config in lua.globals()[table_name].values():
                if config.item_id not in TARGET_IDS:
                    continue
                if table_name == "zGnItem100" and config.item_id != 508:
                    continue
                fields = active[config.item_id]
                name = fields["name"].value.decode("utf-8")
                description = fields["desc"].value.decode("utf-8").replace(",", "")
                self.assertIn(family or ("血炼精华" if config.type == 10 else
                              "仙力" if config.type == 11 else "戒灵粉尘" if config.type == 13 else
                              "内功经验卷" if config.type == 8 else
                              "仙钻" if config.type == 14 else
                              "神魂" if config.type == 5 else
                              "元神丹" if config.pr == 166 else "特戒结晶"), name)
                self.assertIn(str(int(config.addExp if table_name == "SpiritFighterEnergyItemTable" else config.value)), description)
        exported = (FUNCTIONS / "GlobalNpcFunctions.lua").read_bytes()
        self.assertIn(b"onVipAutomaticHs", exported)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
