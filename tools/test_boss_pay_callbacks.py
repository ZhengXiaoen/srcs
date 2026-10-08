"""Verify BOSS rewards finish in the monster NPC without retired recharge APIs."""
import argparse
from pathlib import Path
import re
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]


class BossPayCallbackTests(unittest.TestCase):
    def runtime(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute(r"""
LocalDT={};state={days={PeyNum=17},nYuanBao=23};server={};properties={}
vipPoints=0;awardCalls=0;packets={};tips={};broadcasts=0
PROP_ACTOR_DRAW_YB_COUNT=1;PROP_ACTOR_LINGLI_VALUE=2;PROP_ENTITY_ID=3
ttFlyTip=16;GameLog={cKillBossAward=1}
LogicCmd={miscSys={sub={sSendTodayPay=1}},miscSysEx={sub={sFootPrint=2,sOpenSeverContinuePay=3}}}
System={getStaticVar=function()return server end,getCurrMiniTime=function()return 1000000 end,
 isSameDay=function()return true end,isCrossServer=function()return false end,
 getDaysSinceOpenServer=function()return 3 end,getDaysSinceCombineServer=function()return 0 end,
 getRandomNumber=function()return 0 end,broadcastTipmsg=function()broadcasts=broadcasts+1 end}
Actor={getStaticVar=function()return state end,getName=function()return 'test' end,
 getUIntProperty=function(_,id)return properties[id] or 0 end,
 setUIntProperty=function(_,id,value)properties[id]=value end,
 addVipPoint=function(_,value)vipPoints=vipPoints+value end,
 addInnerExp=function(_,value)state.innerExp=(state.innerExp or 0)+value;return value end,
 sendTipmsg=function(_,msg)table.insert(tips,msg)end}
Awards={Give=function(_,items)
 awardCalls=awardCalls+1;if failAward then return false end
 for _,item in ipairs(items)do
  if item.type==15 then state.awardedYb=(state.awardedYb or 0)+item.count
  elseif item.type==69 then state.awardedYg=(state.awardedYg or 0)+item.count
  else error('unexpected reward type')end
 end
 return true
end}
DataPack={allocPacket=function(_,sys,sub)return {sys=sys,sub=sub,values={}}end,
 writeByte=function(p,v)table.insert(p.values,v)end,
 writeUInt=function(p,v)table.insert(p.values,v)end,
 writeInt=function(p,v)table.insert(p.values,v)end,
 flush=function(p)table.insert(packets,p)end}
-- These APIs are absent in SYS-MONSTER and the recharge page is retired.
assert(UpdateQingDianEveryTotalPayProgressByDailyPay==nil)
assert(LocalDT.IsAnniversaryActivityOpen==nil and GetQingDianActivityInfo==nil)
""")
        code = (ROOT / "Server/S1001/data/functions/player.lua").read_text(encoding="utf-8-sig")
        handler = re.search(r"(?ms)^function BossKillPayMoney\(.*?^end", code)[0]
        lua.execute(handler)
        return lua

    def test_monster_rewards_complete_without_retired_callbacks(self):
        lua = self.runtime()
        self.assertTrue(lua.execute("return BossKillPayMoney({},1000,10,'boss','scene')"))
        state = lua.globals().state
        self.assertEqual((1000, 10), (state.awardedYb, state.awardedYg))
        self.assertEqual(1000, lua.globals().vipPoints)
        self.assertEqual((1023, 1017, 1000, 1000),
                         (state.nYuanBao, state.days.PeyNum, state.RechInt, state.FootPrintPayMoney))
        self.assertEqual(1017, state.newdays.daily_pay_ranking_yb)
        self.assertEqual((1000, 1000, 1017),
                         (state.nYuanBao_timedGift, state.OpenServerLotteryScore, state.OScontinuePay[3]))
        self.assertEqual((10, 50), (lua.globals().properties[2], state.innerExp))
        self.assertEqual(1, lua.globals().broadcasts)
        self.assertEqual(3, len(lua.globals().packets))
        self.assertTrue(lua.execute("return BossKillPayMoney({},1000,0,'boss','scene')"))
        self.assertEqual(2017, state.days.PeyNum)
        self.assertEqual(2000, state.FootPrintPayMoney)
        self.assertEqual(2, lua.globals().broadcasts)

    def test_removed_page_is_not_called_when_npc_has_callback_modules(self):
        lua = self.runtime()
        lua.execute("""
UpdateQingDianEveryTotalPayProgressByDailyPay=function()error('retired recharge callback')end
LocalDT.IsAnniversaryActivityOpen=function()return true end
GetQingDianActivityInfo=function()error('retired recharge page')end
daily_pay_ranking_sync_pay=function()state.rankingSynced=state.days.PeyNum end
foot_print_add_weekly_pay_money_by_killboss=function(_,value)state.FootPrintPayMoney=value end
""")
        self.assertTrue(lua.execute("return BossKillPayMoney({},1000,0,'boss','scene')"))
        self.assertEqual(1017, lua.globals().state.rankingSynced)
        self.assertEqual(1000, lua.globals().state.FootPrintPayMoney)

    def test_reward_failure_does_not_update_recharge_or_broadcast(self):
        lua = self.runtime()
        lua.execute("failAward=true")
        self.assertFalse(lua.execute("return BossKillPayMoney({},1000,10,'boss','scene')"))
        self.assertEqual((23, 17), (lua.globals().state.nYuanBao, lua.globals().state.days.PeyNum))
        self.assertEqual(0, lua.globals().vipPoints)
        self.assertEqual(0, lua.globals().broadcasts)
        self.assertEqual(0, len(lua.globals().packets))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
