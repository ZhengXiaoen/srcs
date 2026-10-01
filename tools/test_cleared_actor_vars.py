"""Exercise callbacks with actor variables emptied by the test-data cleanup.

Requires Lua 5.1 from lupa; pass --lua-path for an isolated installation.
"""

from __future__ import annotations

import argparse
import sys
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PLAYER_PATH = ROOT / "Server/S1001/data/functions/player.lua"
PAY_PATH = ROOT / "Server/S1001/data/functions/ActorEvent/WithDrawYuanBao.lua"
OLD_PLAYER_PATH = ROOT / "Server/S1001/data/functions/OldPlayerReturnFunc.lua"
SETUP = r'''
state = {}
packets = {}
sent_pay = nil
Actor = {
    getStaticVar = function() return state end,
    getIntProperty = function() return 1 end,
    getName = function() return "test actor" end,
}
System = {
    getStaticVar = function() return {} end,
    getDaysSinceOpenServer = function() return 8 end,
    getCurrMiniTime = function() return 1000 end,
    isSameDay = function() return true end,
    isCrossServer = function() return false end,
    AddMail = function() end,
}
DataPack = {
    allocPacket = function()
        local packet = {}
        table.insert(packets, packet)
        return packet
    end,
    writeByte = function(packet, value) packet.byte = value end,
    writeInt = function(packet, value) packet.int = value end,
    flush = function() end,
}
LogicCmd = {miscSys = {sub = {sSendTodayPay = 9}}}
Item = {getItemLinkMsg = function() return "item" end}
SendFreeRelive = function() end
ht_OnVipLevelUp = function() end
SendCombineData = function() end
UpdateQingDianEveryTotalPayProgressByDailyPay = function() end
UpdateSanRenHongLiEveryTotalPayProgressByDailyPay = function() end
is_spring_festival_time = function() return false end
'''


class ClearedActorVarsTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.lua.execute(SETUP)
        self.lua.execute(VIP_SOURCE)
        self.lua.execute(PAY_SOURCE)
        self.lua.execute(OLD_PLAYER_SOURCE)

    def test_first_vip_upgrade_initializes_missing_counters(self):
        self.lua.execute("OnVipLevelUp(1, 1, 0)")
        self.assertEqual(20, self.lua.eval("state.d[16]"))
        self.assertEqual(20, self.lua.eval("state.d[17]"))
        self.assertEqual(20, self.lua.eval("state.d[28]"))
        self.assertTrue(self.lua.eval("state.days ~= nil"))

    def test_vip_upgrade_preserves_existing_counters_and_clears_daily_flags(self):
        self.lua.execute('''
            state.d = {[16] = 7, [17] = 8, [28] = 9}
            state.days = {vipPrivilege = {[1] = 1, [2] = 1, [5] = 1}, VipFreeRelive = 2}
            OnVipLevelUp(1, 5, 4)
        ''')
        self.assertEqual(57, self.lua.eval("state.d[16]"))
        self.assertEqual(58, self.lua.eval("state.d[17]"))
        self.assertEqual(59, self.lua.eval("state.d[28]"))
        self.assertTrue(self.lua.eval("next(state.days.vipPrivilege) == nil"))
        self.assertTrue(self.lua.eval("state.days.VipFreeRelive == nil"))

    def test_first_recharge_creates_daily_data_and_sends_today_pay(self):
        self.lua.execute("GetPeyYuanBaoHandlerEx(1, {100})")
        self.assertEqual(100, self.lua.eval("state.days.PeyNum"))
        self.assertEqual(0, self.lua.eval("state.days.PeyFlag"))
        self.assertEqual(100, self.lua.eval("packets[2].int"))

    def test_recharge_after_day_change_discards_previous_daily_total(self):
        self.lua.execute('''
            state.days = {PeyNum = 40, PeyFlag = 3}
            state.lastPeyTime = 900
            System.isSameDay = function() return false end
            GetPeyYuanBaoHandlerEx(1, {50})
        ''')
        self.assertEqual(50, self.lua.eval("state.days.PeyNum"))
        self.assertEqual(0, self.lua.eval("state.days.PeyFlag"))

    def test_send_today_pay_with_empty_daily_data(self):
        self.lua.execute("SendTodayPay(1)")
        self.assertEqual(0, self.lua.eval("packets[1].int"))
        self.assertTrue(self.lua.eval("state.days ~= nil"))

    def test_returning_player_rewards_handle_missing_daily_pay(self):
        self.lua.execute('''
            state.days = {}
            state.oldplayret = {isold = 0}
            OldPlayerReturnCfg = {[2] = {PayFeelBack = {{money = 100}}}}
            System.getStaticVar = function() return {oldplayer = true} end
            Actor.getIntProperty = function() return 80 end
            tips = {}
            Actor.sendTipmsg = function(_, message) table.insert(tips, message) end
            InitOldPlayerReturnInfo = function() return state end
            DataPack.readByte = function(packet)
                local value = packet[1]
                table.remove(packet, 1)
                return value
            end
            OldPlayerReturnGiveAward(1, 0, {2})
            OldPlayerReturnGiveAward(1, 0, {3, 1})
        ''')
        self.assertEqual(2, self.lua.eval("#tips"))
        self.assertIn("今日还未冲值", self.lua.eval("tips[1]"))
        self.assertIn("冲值元宝不足", self.lua.eval("tips[2]"))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime

    player = PLAYER_PATH.read_text(encoding="utf-8-sig")
    VIP_SOURCE = player[
        player.index("function OnVipLevelUp(") :
        player.index("--装备过期了", player.index("function OnVipLevelUp("))
    ]
    pay = PAY_PATH.read_text(encoding="utf-8-sig")
    PAY_SOURCE = pay[
        pay.index("function GetPeyYuanBaoHandlerEx(") :
        pay.index("--充值赠送神器", pay.index("function GetPeyYuanBaoHandlerEx("))
    ] + pay[
        pay.index("function SendTodayPay(") :
        pay.index("function OnCumulativeRecharge(")
    ]
    old_player = OLD_PLAYER_PATH.read_text(encoding="utf-8-sig")
    OLD_PLAYER_SOURCE = old_player[old_player.index("function OldPlayerReturnGiveAward(") :]
    unittest.main(argv=[sys.argv[0]], verbosity=2)
