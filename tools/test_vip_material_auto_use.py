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
              5165, 5166, 5167, 5168, 5171)


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
vip=true; logs={}; ranks={}; packets=0; removed={};tips={}
PROP_ACTOR_CIRCLE_SOUL=79; PROP_ENTITY_ID=5; ttFlyTip=16
LogIds={shiyongzhuanshengxiuweidan=2708,shenhunzhibianhua=2783,hufusuipian=2697}
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
 getItemName=function(id)return tostring(id)end
}
System={getDaysSinceOpenServer=function()return 10 end,
 sendCommonLog=function(id,...)table.insert(logs,{id=id,args={...}})end}
DataPack={allocPacket=function()return {}end,writeInt=function(packet,value)packet.value=value end,
 flush=function(packet)assert(packet.value==state.godSoulValue);packets=packets+1 end}
HandleAddNewRankCount=function(_,index,value)ranks[index]=(ranks[index] or 0)+value end
JSLingLiDanUseTable={};onAchievementFunc=function()error('unexpected achievement use')end
""")
        config = CONFIG.read_text(encoding="utf-8-sig")
        for name in ("zJuanZhouAdd", "FuSoulAdd", "zAchievement", "CircleExp"):
            lua.execute(named_table(config, name))
        code = (FUNCTIONS / "Qfunctions.lua").read_text(encoding="utf-8-sig")
        for name in ("onJuanZhouAdd", "onFuSoulAdd", "onCircleExp"):
            lua.execute(function(code, name))
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
        self.assertEqual(properties[131], lua.globals().ranks[9])
        self.assertEqual(10, lua.globals().packets)
        logs = len(lua.globals().logs)
        lua.execute("VipAutoUseMaterials({})")
        self.assertEqual(logs, len(lua.globals().logs))

    def test_disabled_switch_or_missing_privilege_preserves_items(self):
        for setting in ("state.autoUseMaterials=0", "vip=false"):
            lua = self.runtime()
            lua.execute("bag={{id=542,count=3},{id=527,count=5},{id=6297,count=2},{id=5171,count=7}};" + setting)
            lua.execute("VipAutoUseMaterials({})")
            self.assertEqual(4, len(lua.globals().bag))
            self.assertEqual(0, len(lua.globals().removed))
            self.assertEqual(0, len(lua.globals().logs))

    def test_consumption_failure_does_not_grant_new_rewards(self):
        for id, property in ((542, 79), (527, 131), (6297, 166)):
            lua = self.runtime()
            lua.execute(f"bag={{{{id={id},count=3}}}};failRemove=true;VipAutoUseMaterials({{}})")
            self.assertEqual(3, lua.globals().bag[1].count)
            self.assertIsNone(lua.globals().properties[property])
            self.assertEqual(0, len(lua.globals().removed))

    def test_cost_boxes_and_unrelated_items_are_not_auto_used(self):
        lua = self.runtime()
        lua.execute("bag={{id=617,count=1},{id=618,count=1},{id=619,count=1},{id=620,count=1},{id=621,count=1},{id=625,count=1},{id=83,count=1},{id=542,count=2}};VipAutoUseMaterials({})")
        self.assertEqual(7, len(lua.globals().bag))
        self.assertEqual(2000, lua.globals().properties[79])
        self.assertIsNone(lua.globals().LocalDT.VipRecoveryAutoUseMaterialIds[617])

    def test_legacy_switch_migrates_once_and_off_stays_off(self):
        lua = self.runtime()
        lua.execute("state.autoUseMaterials=nil;state.autoUseGemFragments=1")
        self.assertTrue(lua.execute("return LocalDT.IsVipMaterialAutoUseEnabled({})"))
        self.assertIsNone(lua.globals().state.autoUseGemFragments)
        lua.execute("state.autoUseMaterials=0;state.autoUseHolyPearlFragments=1")
        self.assertFalse(lua.execute("return LocalDT.IsVipMaterialAutoUseEnabled({})"))

    def test_client_dialog_lists_all_four_material_families(self):
        lua = self.runtime()
        lua.execute("RecycledItems={};for i=2,20 do RecycledItems[i]={notAuto=true}end;get_d_val=function()return 0 end;state.dealAutoSell={}")
        dialog = lua.execute("return onVipAutomaticHs({})")
        for label in ("转生丹", "元神丹", "特戒结晶", "神魂"):
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
                                   ("zJuanZhouAdd", None)):
            for config in lua.globals()[table_name].values():
                if config.item_id not in TARGET_IDS:
                    continue
                fields = active[config.item_id]
                name = fields["name"].value.decode("utf-8")
                description = fields["desc"].value.decode("utf-8").replace(",", "")
                self.assertIn(family or ("神魂" if config.type == 5 else
                              "元神丹" if config.pr == 166 else "特戒结晶"), name)
                self.assertIn(str(int(config.value)), description)
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
