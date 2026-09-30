"""Regression checks for one-time login rewards and equipped artifact upgrades.

Requires lupa.lua51. Supply --lua-path for an isolated dependency directory.
"""

from __future__ import annotations

import argparse
import re
import sys
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "Server/S1001/data"


def source(path):
    return (DATA / path).read_text(encoding="utf-8-sig")


def function(text, name):
    start = text.index(f"function {name}(")
    end = re.search(r"^end\s*$", text[start:], re.M)
    if end is None:
        raise ValueError(f"Missing function end: {name}")
    return text[start:start + end.end()]


SETUP = r'''
LocalDT = {}
state, packets, tips, equips = {}, {}, {}, {}
now = 86400 * 100 + 100
job, sex = 1, 0
rewardSuccess, rewardCount = true, 0
PROP_ENTITY_ID, PROP_ACTOR_VOCATION, PROP_ACTOR_SEX = 1, 2, 3
itPayWeaponPos, itPayDressPos, ipItemID = 49, 50, 1
ttFlyTip, ttChatWindow = 1, 2
Lang = {ScriptTips = {zf194 = "success", mt00001 = "%d empty slots required"}}
LogicCmd = {miscSys = {sysId = 139, sub = {cSevenDaysActivityOpt = 188, sSevenDaysActivityResut = 188}}}
LogIds = {shenhunzhibianhua = 1, goduplevel = 2}
Actor = {
 getStaticVar = function() return state end,
 getName = function() return 'test' end,
 getIntProperty = function(_, prop) if prop == PROP_ACTOR_VOCATION then return job elseif prop == PROP_ACTOR_SEX then return sex else return 1 end end,
 sendTipmsg = function(_, message) table.insert(tips, message) end,
}
System = {
 getCurrMiniTime = function() return now end,
 isSameDay = function(a, b) return math.floor(a / 86400) == math.floor(b / 86400) end,
 getIntBit = function(value, bit) return math.floor(value / 2^bit) % 2 end,
 setIntBit = function(value, bit, flag) return value + (flag - math.floor(value / 2^bit) % 2)*2^bit end,
 sendCommonLog = function() end, broadcastTipmsg = function() end,
}
Item = {
 getEquipByPos = function(actor, pos) assert(actor == 'actor'); return equips[pos] end,
 getItemProperty = function(_, item) return item.id end,
 setItemProperty = function(_, item, _, id) item.id = id end,
 getItemName = function(id) return tostring(id) end,
 getItemLinkMsg = function(id) return tostring(id) end,
}
DataPack = {
 readByte = function(packet) return table.remove(packet, 1) end,
 allocPacket = function(_, system, command) return {system=system, command=command, values={}} end,
 writeByte = function(packet, value) table.insert(packet.values, value) end,
 writeInt = function(packet, value) table.insert(packet.values, value) end,
 flush = function(packet) table.insert(packets, packet) end,
}
Awards = {Give = function(_, award)
 if not rewardSuccess then return false end
 rewardCount = rewardCount + 1
 givenAward = award
 return true
end}
MiscsImplement = {registerMsgHandler = function() end}
'''


class RegressionTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.lua.execute(SETUP)
        self.lua.execute(source("config/activity/SevenDaysActivitycfg.lua"))
        self.lua.execute(source("config/GodSoulCfg.lua"))
        player = source("functions/player.lua")
        self.lua.execute(function(player, "sevenDaysActivity_WhenLogin"))
        self.lua.execute(source("functions/Activity/SevenDaysActivity.lua"))
        misc = source("functions/modules/misc.lua")
        for name in ("MiscGodEquipUpLev", "GetGodEquipItemId", "MiscGetGodSoul", "MiscSendGiveGodEquipState", "MiscActivateGodDress"):
            self.lua.execute(function(misc, name))

    def run_lua(self, code):
        self.lua.execute(code)

    def test_first_day_query_and_claim(self):
        self.run_lua('''
handleSevenDaysActivityOpt('actor',188,{1})
assert(state.sevenDActivity==1 and packets[1].values[1]==1 and packets[1].values[2]==0)
handleSevenDaysActivityOpt('actor',188,{2,1})
assert(rewardCount==1 and state.sevenDActivityData==1 and givenAward==Award[1])
''')

    def test_first_day_direct_claim(self):
        self.run_lua("GetThe7DayAwards('actor',1); assert(rewardCount==1 and state.sevenDActivityData==1)")

    def test_each_reward_once_without_reopening(self):
        self.run_lua('''
for day=1,7 do
 sevenDaysActivity_WhenLogin('actor',true)
 GetThe7DayAwards('actor',day)
 GetThe7DayAwards('actor',day)
 assert(rewardCount==day)
 now=now+86400
end
assert(state.sevenDActivityData==127)
now=now+86400*400
sevenDaysActivity_WhenLogin('actor',true)
for day=1,7 do GetThe7DayAwards('actor',day) end
assert(state.sevenDActivity==7 and state.sevenDActivityData==127 and rewardCount==7)
''')

    def test_duplicate_callbacks_relogin_and_offline_gap(self):
        self.run_lua('''
sevenDaysActivity_WhenLogin('actor',false)
for i=1,5 do sevenDaysActivity_WhenLogin('actor',false) end
assert(state.sevenDActivity==1)
now=now+86400
sevenDaysActivity_WhenLogin('actor',true)
sevenDaysActivity_WhenLogin('actor',true)
GetThe7DayData('actor')
assert(state.sevenDActivity==2)
now=now+86400*10
sevenDaysActivity_WhenLogin('actor',true)
assert(state.sevenDActivity==3)
''')

    def test_existing_progress_migration_and_clock_rollback(self):
        self.run_lua('''
state.sevenDActivity, state.sevenDActivityData=4,5
sevenDaysActivity_WhenLogin('actor',true)
assert(state.sevenDActivity==5 and state.sevenDActivityData==5)
now=now-86400*10
sevenDaysActivity_WhenLogin('actor',true)
now=now+86400*10
sevenDaysActivity_WhenLogin('actor',true)
assert(state.sevenDActivity==5 and state.sevenDActivityData==5)
''')

    def test_future_invalid_and_failed_claims(self):
        self.run_lua('''
for _,index in ipairs({0,8,-1,1.5,'bad'}) do GetThe7DayAwards('actor',index) end
GetThe7DayAwards('actor',nil)
GetThe7DayAwards('actor',2)
rewardSuccess=false
GetThe7DayAwards('actor',1)
assert(rewardCount==0 and (state.sevenDActivityData or 0)==0)
rewardSuccess=true
GetThe7DayAwards('actor',1)
assert(rewardCount==1 and state.sevenDActivityData==1)
''')

    def test_claim_record_survives_tip_failure(self):
        self.run_lua('''
Actor.sendTipmsg=function() error('tip failed') end
assert(not pcall(GetThe7DayAwards,'actor',1))
assert(state.sevenDActivityData==1 and rewardCount==1)
Actor.sendTipmsg=function() end
GetThe7DayAwards('actor',1)
assert(rewardCount==1)
''')

    def test_artifact_status_without_purchase_flag(self):
        self.run_lua('''
equips[49]={id=5172}
MiscSendGiveGodEquipState('actor')
assert(packets[1].values[1]==1 and state.buyoldgod==nil)
equips[49]={id=5221}
MiscSendGiveGodEquipState('actor')
assert(packets[2].values[1]==1)
equips[49]={id=3624}
MiscSendGiveGodEquipState('actor')
assert(packets[3].values[1]==0)
''')

    def test_all_artifact_and_armor_upgrades(self):
        self.run_lua('''
for equipType=1,2 do
 local cfg=equipType==1 and GodSoulCfg.UpLev.GodWeapon or GodSoulCfg.UpLev.GodDress
 local pos=equipType==1 and 49 or 50
 for vocation=1,3 do for gender=0,1 do
  job,sex=vocation,gender
  for level=1,49 do
   local entry=cfg[level]
   equips[pos]={id=entry.SrcItem[equipType==1 and 1 or gender+1]}
   state.godSoulValue=10000000
   local target=GetGodEquipItemId('actor',entry.DestItem)
   MiscGodEquipUpLev('actor',nil,{equipType})
   assert(equips[pos].id==target)
   assert(state.godSoulValue==10000000-entry.NeedSoulValue)
  end
 end end
end
''')

    def test_max_level_invalid_type_missing_equip_and_insufficient_soul(self):
        self.run_lua('''
state.godSoulValue=100
equips[49]={id=5172}
MiscGodEquipUpLev('actor',nil,{1})
assert(equips[49].id==5172 and state.godSoulValue==100)
state.godSoulValue=100000
equips[49]={id=5221}
MiscGodEquipUpLev('actor',nil,{1})
assert(equips[49].id==5221 and state.godSoulValue==100000)
MiscGodEquipUpLev('actor',nil,{3})
assert(equips[49].id==5221 and state.godSoulValue==100000)
equips[49]=nil
MiscGodEquipUpLev('actor',nil,{1})
assert(state.godSoulValue==100000)
''')

    def test_equipped_armor_prevents_duplicate_activation(self):
        self.run_lua("equips[50]={id=5222}; MiscActivateGodDress('actor'); assert(equips[50].id==5222 and #tips==1)")

    def test_frontend_reward_and_upgrade_configs(self):
        from patch_daily_recharge_client import read_cbp, read_pack
        directory = ROOT / "web/v2/lang/zh-cn"
        entries = dict(read_pack((directory / "zh-cn.dat").read_bytes()))
        for name in ("sevenDaysActivitycfg.cbp", "godSoulCfg.cbp"):
            self.assertEqual((directory / name).read_bytes(), entries[name])
        _, client = read_cbp(entries["sevenDaysActivitycfg.cbp"])
        self.assertEqual(7, len(client.children))
        for day, node in enumerate(client.children, 1):
            actual = [{field.name: int(field.number()) for field in item.children} for item in node.children]
            expected = [dict(item.items()) for item in self.lua.globals().Award[day].values()]
            self.assertEqual(expected, actual)
        _, client = read_cbp(entries["godSoulCfg.cbp"])
        for name in ("GodWeapon", "GodDress"):
            for level, node in enumerate(client.child("UpLev").child(name).children, 1):
                server = self.lua.globals().GodSoulCfg.UpLev[name][level]
                self.assertEqual(list(server.SrcItem.values()), [int(item.number()) for item in node.child("SrcItem").children])
                self.assertEqual(server.NeedSoulValue, node.child("NeedSoulValue").number())
                self.assertEqual([dict(item.items()) for item in server.DestItem.values()],
                                 [{field.name: int(field.number()) for field in item.children} for item in node.child("DestItem").children])

    def test_client_patch_is_idempotent(self):
        from patch_god_equip_state import CLIENT, patch_swf
        content = CLIENT.read_bytes()
        self.assertEqual(content, patch_swf(content))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path")
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, args.lua_path)
    global LuaRuntime
    from lupa.lua51 import LuaRuntime
    result = unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(RegressionTests))
    if not result.wasSuccessful():
        raise SystemExit(1)


if __name__ == "__main__":
    main()
