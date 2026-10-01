"""Check consumption callbacks with a newly cleared actor variable table.

Requires Lua 5.1 from lupa; pass --lua-path for an isolated installation.
"""

from __future__ import annotations

import argparse
import sys
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CONSUME_PATH = ROOT / "Server/S1001/data/functions/ActorEvent/WithDrawYuanBao.lua"
SPIN_PATH = ROOT / "Server/S1001/data/functions/Activity/XiaoFeiZhuanPan.lua"
SETUP = r'''
state = {}
packets = {}
Actor = {
    getStaticVar = function() return state end,
    getIntProperty = function() return 2 end,
    getName = function() return "test actor" end,
}
System = {
    getStaticVar = function() return {} end,
    sendCommonLog = function() end,
}
DataPack = {
    allocPacket = function()
        local packet = {}
        table.insert(packets, packet)
        return packet
    end,
    writeByte = function(packet, value) packet.byte = value end,
    writeInt = function(packet, value) packet.int = value end,
    writeUInt = function(packet, value) packet.uint = value end,
    flush = function() end,
}
LogicCmd = {miscSysEx = {sub = {sXiaoFeiZhuanPan = 78}}}
LogIds = {xiaofeiLog = 1}
LuaEventId = {ActorConsumeYb = 1}
XiaoFeiZhuanPan = {cosumeEveryYB = 100}
OnRankingConsumeYbEvent = function() end
is_spring_festival_time = function() return false end
OnLuaEvent = function() end
ZP_IsUseOld = function() return false end
sendClientConsumeInfo = function() end
'''


class YuanBaoConsumptionTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.lua.execute(SETUP)
        self.lua.execute(CONSUME_SOURCE)
        self.lua.execute(SPIN_SOURCE)

    def test_new_actor_consumption_sends_remaining_draws(self):
        self.lua.execute("OnConsumeYuanBaoEvent(1, 250, 178)")
        self.assertEqual(250, self.lua.eval("state.dayConsumeYB_WUYI"))
        self.assertTrue(self.lua.eval("state.newdays ~= nil"))
        self.assertEqual(2, self.lua.eval("packets[1].int"))
        self.assertEqual(250, self.lua.eval("packets[1].uint"))

    def test_nested_callback_clears_daily_state(self):
        self.lua.execute('''
            state.newdays = {}
            OnLuaEvent = function() state.newdays = nil end
            OnConsumeYuanBaoEvent(1, 150, 178)
        ''')
        self.assertTrue(self.lua.eval("state.newdays ~= nil"))
        self.assertEqual(1, self.lua.eval("packets[1].int"))

    def test_consume_callbacks_receive_initialized_daily_tables(self):
        self.lua.execute('''
            OnRankingConsumeYbEvent = function()
                assert(state.days ~= nil and state.newdays ~= nil)
            end
            OnLuaEvent = function()
                assert(state.days ~= nil and state.newdays ~= nil)
            end
            OnConsumeYuanBaoEvent(1, 150, 178)
        ''')
        self.assertTrue(self.lua.eval("state.days ~= nil"))

    def test_existing_draw_count_is_preserved(self):
        self.lua.execute('''
            state.newdays = {ZPhasDoTime = 1}
            OnConsumeYuanBaoEvent(1, 250, 178)
        ''')
        self.assertEqual(1, self.lua.eval("state.newdays.ZPhasDoTime"))
        self.assertEqual(1, self.lua.eval("packets[1].int"))

    def test_legacy_draw_counter_starts_from_zero(self):
        self.lua.execute('''
            ZP_IsUseOld = function() return true end
            OnConsumeYuanBaoEvent(1, 250, 178)
        ''')
        self.assertEqual(2, self.lua.eval("state.newdays.ZPcanDoTime"))
        self.assertEqual(50, self.lua.eval("state.dayCountRunLuck"))
        self.assertEqual(2, self.lua.eval("packets[1].int"))

    def test_new_actor_can_open_spin_panel(self):
        self.lua.execute("AskLucklyZP_canRunTime(1)")
        self.assertTrue(self.lua.eval("state.newdays ~= nil"))
        self.assertEqual(0, self.lua.eval("packets[1].int"))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime

    consume = CONSUME_PATH.read_text(encoding="utf-8-sig")
    CONSUME_SOURCE = consume[
        consume.index("function OnConsumeYuanBaoEvent(") :
        consume.index("function UpdateQingDianEveryTotalPayProgressByDailyPay(")
    ]
    spin = SPIN_PATH.read_text(encoding="utf-8-sig")
    SPIN_SOURCE = spin[
        spin.index("function AskLucklyZP_canRunTime(") :
        spin.index("function AskLucklyZP_awardInfo(")
    ]
    unittest.main(argv=[sys.argv[0]], verbosity=2)
