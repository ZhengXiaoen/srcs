"""Exercise the NPC submission path in Lua 5.1 with simulated game APIs.

Requires lupa; use --lua-path to load it from an isolated dependency directory.
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
NPC_PATH = "Server/S1001/data/functions/NpcMiscFun/SanRenNPC/MapNpc/ZhanWuShuang.lua"
DISPATCHER_PATH = "Server/S1001/data/functions/NpcMiscFun/NpcEventDispatcher.lua"
SETUP = r'''
LocalDT = {}
rc_chumo = {}
SpecialQuestFuncs = {}
PROP_CREATURE_LEVEL = 1
PROP_ACTOR_CIRCLE = 2
ttFlyTip = 256
state = {
    days = {}, d = {[2] = 1, [7] = 10}, RiChangRenWuFlag = 1,
    RiChangRenWuFinish = 1, RiChangRenWuType = 0, RiChangRenWuIndex = 1
}
dynamic = {}
level = 70
circle = 0
task = 66
exp = 0
inner = 0
completions = 0
refreshes = 0
tips = {}
privilege = false
globalState = {}
oldPlayer = false
OldPlayerReturnCfg = {{Daily = {rate = 2}}}
task_all = setmetatable({}, {__index = function()
    return {type = 4, lv = 0, mapid = 9, npcname = "NPC", nexmapid = 9, nexnpc = "NPC"}
end})
Actor = setmetatable({
    getStaticVar = function() return state end,
    getDyanmicVar = function() return dynamic end,
    getIntProperty = function(_, property)
        if property == PROP_CREATURE_LEVEL then return level else return circle end
    end,
    getName = function() return "test" end,
    getMoneyCount = function() return 1000000 end,
    getItemCount = function() return 0 end,
    addExp = function(_, value) exp = exp + value end,
    addInnerExp = function(_, value) inner = inner + value end,
    sendTipmsg = function(_, message) table.insert(tips, message) end
}, {__index = function() return function() end end})
System = {
    getStaticVar = function() return globalState end,
    getRandomNumber = function() return 0 end,
    broadcastTipmsg = function() end
}
Fuben = {getSceneNameById = function() return "map" end}
get_taskflags_val = function() return task end
set_taskflags_val = function(_, value) task = value end
get_d_val = function(_, index) return state.d[index] or 0 end
set_d_val = function(_, index, value) state.d[index] = value end
IsSpeciaTitleVip = function() return privilege end
InitOldPlayerReturnInfo = function()
    return {oldplayret = {isold = oldPlayer and 1 or 0}}
end
OnFinish_Liveness = function() completions = completions + 1 end
Quest_ShuaXin = function() refreshes = refreshes + 1 end
RegisterSpecialQuestFunc = function() end
NpcCommonFunc = {}
NpcDialog = {}
GlobalNpcFunctionsFilter = {}
'''


class DailyTaskSubmitTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime()
        self.lua.execute(SETUP)
        self.lua.execute(NPC_SOURCE)
        self.lua.execute(DISPATCHER_SOURCE)
        self.lua.execute("NpcDialog[251] = GetNpcRiChangChuMo()")

    def submit(self):
        return self.lua.execute('return OnNpcEvent({}, 251, "rcWanChengRenWu")')

    def evaluate(self, expression):
        return self.lua.eval(expression)

    def assert_rewards(self, exp=10000000, inner=50000):
        self.assertEqual(exp, self.evaluate("exp"))
        self.assertEqual(inner, self.evaluate("inner"))
        self.assertEqual(1, self.evaluate("completions"))

    def test_normal_submission(self):
        self.submit()
        self.assert_rewards()
        self.assertEqual(0, self.evaluate("state.RiChangRenWuFlag"))
        self.assertEqual(0, self.evaluate("state.RiChangRenWuFinish"))
        self.assertEqual(1, self.evaluate("state.d[7]"))
        self.assertEqual(1, self.evaluate("state.d[2]"))
        self.assertIsNone(self.evaluate("state.RiChangRenWuIndex"))

    def test_invalid_index_preserves_claim_state(self):
        for value in ("nil", "18", "-1", "1.5", '"invalid"', '"kuangshi"'):
            with self.subTest(index=value):
                self.setUp()
                self.lua.execute(f"state.RiChangRenWuIndex = {value}")
                self.submit()
                self.assertEqual(0, self.evaluate("exp"))
                self.assertEqual(0, self.evaluate("inner"))
                self.assertEqual(0, self.evaluate("completions"))
                self.assertEqual(1, self.evaluate("state.RiChangRenWuFlag"))
                self.assertEqual(1, self.evaluate("state.RiChangRenWuFinish"))
                self.assertEqual(10, self.evaluate("state.d[7]"))
                self.assertEqual(1, self.evaluate("state.d[2]"))
                self.assertEqual(1, self.evaluate("#tips"))

    def test_exp_callback_clears_or_changes_index(self):
        for value in ("nil", "18", "2"):
            with self.subTest(index=value):
                self.setUp()
                self.lua.execute(f'''Actor.addExp = function(_, value)
                    exp = exp + value
                    state.RiChangRenWuIndex = {value}
                end''')
                self.submit()
                self.assert_rewards()

    def test_duplicate_submission_has_no_second_reward(self):
        self.submit()
        self.submit()
        self.assert_rewards()

    def test_reentrant_exp_callback_cannot_claim_twice(self):
        self.lua.execute('''Actor.addExp = function(_, value)
            exp = exp + value
            OnNpcEvent({}, 251, "rcWanChengRenWu")
        end''')
        self.submit()
        self.assert_rewards()

    def test_legacy_zero_index(self):
        self.lua.execute("state.RiChangRenWuIndex = 0")
        self.submit()
        self.assert_rewards()

    def test_numeric_string_index(self):
        self.lua.execute('state.RiChangRenWuIndex = "1"')
        self.submit()
        self.assert_rewards()

    def test_bonus_lookup_failure_preserves_claim(self):
        self.lua.execute('globalState.oldplayer = {}; InitOldPlayerReturnInfo = function() error("simulated bonus failure") end')
        with self.assertRaises(Exception):
            self.submit()
        self.assertEqual(0, self.evaluate("exp"))
        self.assertEqual(1, self.evaluate("state.RiChangRenWuFlag"))
        self.assertEqual(1, self.evaluate("state.RiChangRenWuFinish"))
        self.assertEqual(10, self.evaluate("state.d[7]"))

    def test_missing_daily_state(self):
        self.lua.execute("state.days = nil")
        self.submit()
        self.assert_rewards()
        self.assertEqual(1, self.evaluate("state.days.KoRccmTime"))

    def test_exp_callback_clears_daily_state(self):
        self.lua.execute('''Actor.addExp = function(_, value)
            exp = exp + value
            state.days = nil
        end''')
        self.submit()
        self.assert_rewards()
        self.assertEqual(1, self.evaluate("state.days.KoRccmTime"))

    def test_unfinished_task_has_no_reward(self):
        self.lua.execute("state.RiChangRenWuFinish = 0")
        self.submit()
        self.assertEqual(0, self.evaluate("exp"))
        self.assertEqual(0, self.evaluate("inner"))
        self.assertEqual(1, self.evaluate("state.RiChangRenWuFlag"))

    def test_privilege_and_returning_player_bonuses(self):
        self.lua.execute("privilege = true; oldPlayer = true; globalState.oldplayer = {}")
        self.submit()
        self.assert_rewards(24000000, 120000)

    def test_mining_completion(self):
        self.lua.execute("state.RiChangRenWuType = 1; state.kuangshi_RCCM = 1")
        self.submit()
        self.assert_rewards()
        self.assertEqual(0, self.evaluate("state.kuangshi_RCCM"))

    def test_reopens_panel_for_high_level_player(self):
        self.lua.execute("level = 80; state.RiChangRenWuIndex = 7")
        result = self.submit()
        self.assert_rewards(25000000, 50000)
        self.assertIsInstance(result, str)

    def test_all_reward_indexes(self):
        for index in range(1, 18):
            with self.subTest(index=index):
                self.setUp()
                self.lua.execute(f"state.RiChangRenWuIndex = {index}")
                expected = self.evaluate(f"GetNpcRiChangChuMo()[{index}].Exp * 10")
                self.submit()
                self.assert_rewards(expected, 50000)

    def load_count_functions(self):
        source = (ROOT / "Server/S1001/data/functions/SpecialQuest.lua").read_text(encoding="utf-8-sig")
        for name in ("RefreshActorZero", "Buy_RiChangChuMo"):
            start = source.index("function " + name + "(")
            end = source.index("\nend", start) + len("\nend")
            self.lua.execute(source[start:end])
        self.lua.execute('''
            System.getDate = function() return 2026, 10, 7 end
            System.getToday = function() return 1000000 end
            System.getCurrMiniTime = function() return 1000000 end
            System.getDaysSinceOpenServer = function() return 10 end
            ShuaXinFengHao = function() end
            Fuben.getSceneHandleById = function() return 0 end
            Fuben.getSceneWidth = function() return 200 end
            Fuben.getSceneHeight = function() return 200 end
            Fuben.getScenHeight = Fuben.getSceneHeight
            Fuben.getSceenWidth = Fuben.getSceneWidth
            Fuben.onCanMove = function() return true end
            System.telportScene = function() end
            add_d_val = function(_, index, value) state.d[index] = get_d_val(nil, index) + value end
            del_d_val = function(_, index, value) state.d[index] = get_d_val(nil, index) - value end
            spent = 0
            Actor.changeMoney = function(_, _, value) spent = spent - value end
        ''')

    def test_fresh_daily_counts_and_single_purchase_across_both_entries(self):
        for first, second in (("Buy_RiChangChuMo({})", "GetNpcRiChangChuMo().buycs({})"),
                              ("GetNpcRiChangChuMo().buycs({})", "Buy_RiChangChuMo({})")):
            with self.subTest(first=first):
                self.setUp()
                self.load_count_functions()
                self.lua.execute("state.d = {}; state.RiChangRenWuFlag = 0; RefreshActorZero({})")
                self.assertEqual(2, self.evaluate("state.d[2]"))
                self.assertEqual(0, self.evaluate("state.d[10]"))
                self.lua.execute(first)
                self.assertEqual(3, self.evaluate("state.d[2]"))
                self.assertEqual(1, self.evaluate("state.d[10]"))
                self.lua.execute(second)
                self.assertEqual(3, self.evaluate("state.d[2]"))
                self.assertEqual(200000, self.evaluate("spent"))

    def test_third_attempt_submits_and_fourth_attempt_is_blocked(self):
        self.load_count_functions()
        self.lua.execute("state.d[2] = 3; state.d[10] = 1; state.RiChangRenWuFlag = 0")
        for _ in range(3):
            self.lua.execute('''
                state.RiChangRenWuIndex = 1; state.RiChangRenWuType = 0
                GetNpcRiChangChuMo().rcJieShouRenWu({})
                state.RiChangRenWuFinish = 1; state.d[7] = 10
            ''')
            self.assertIn("完成任务", self.lua.eval("GetNpcRiChangChuMo().main2({})"))
            self.submit()
        self.assertEqual(0, self.evaluate("state.d[2]"))
        self.assertEqual(3, self.evaluate("completions"))
        self.assertEqual(30000000, self.evaluate("exp"))
        self.assertEqual(150000, self.evaluate("inner"))
        self.lua.execute("GetNpcRiChangChuMo().rcJieShouRenWu({})")
        self.assertEqual(0, self.evaluate("state.RiChangRenWuFlag"))
        self.assertIn("已经都完成", self.lua.eval("GetNpcRiChangChuMo().main2({})"))

    def test_daily_reset_discards_unused_purchased_attempts(self):
        self.load_count_functions()
        self.lua.execute('''state.RiChangRenWuTimesVersion = 1
            state.d[1] = 2026106; state.d[2] = 3; state.d[10] = 1
            RefreshActorZero({})''')
        self.assertEqual(2, self.evaluate("state.d[2]"))
        self.assertEqual(0, self.evaluate("state.d[10]"))
        self.assertEqual(3, self.evaluate("state.ziYuanXunHui[1]"))
        self.lua.execute("RefreshActorZero({})")
        self.assertEqual(2, self.evaluate("state.d[2]"))

    def test_legacy_counts_convert_once_and_preserve_active_task(self):
        for remaining, bought, active, expected in ((10, 0, 0, 2), (9, 0, 1, 1),
                (5, 0, 0, 1), (0, 0, 0, 0), (15, 5, 0, 3), (0, 5, 1, 0)):
            with self.subTest(remaining=remaining, bought=bought, active=active):
                self.setUp()
                self.load_count_functions()
                self.lua.execute(f'''state.d[1] = 2026107; state.d[2] = {remaining}
                    state.d[10] = {bought}; state.RiChangRenWuFlag = {active}
                    state.ziYuanXunHui = {{[1] = 10, [2] = 77}}
                    RefreshActorZero({{}})''')
                self.assertEqual(expected, self.evaluate("state.d[2]"))
                self.assertEqual(int(bought > 0), self.evaluate("state.d[10]"))
                self.assertEqual(active, self.evaluate("state.RiChangRenWuFlag"))
                self.assertEqual(2, self.evaluate("state.ziYuanXunHui[1]"))
                self.assertEqual(77, self.evaluate("state.ziYuanXunHui[2]"))
                self.lua.execute("RefreshActorZero({})")
                self.assertEqual(expected, self.evaluate("state.d[2]"))
                self.assertEqual(2, self.evaluate("state.ziYuanXunHui[1]"))

    def test_no_new_top_level_locals(self):
        self.assertEqual(1, len(re.findall(r"^local\s+", NPC_SOURCE, re.M)))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    parser.add_argument("--baseline", action="store_true", help="Run against the unmodified Git version")
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime

    if args.baseline:
        NPC_SOURCE = subprocess.check_output(["git", "show", f"HEAD:{NPC_PATH}"], cwd=ROOT).decode("utf-8-sig")
    else:
        NPC_SOURCE = (ROOT / NPC_PATH).read_text(encoding="utf-8-sig")
    dispatcher = (ROOT / DISPATCHER_PATH).read_text(encoding="utf-8-sig")
    DISPATCHER_SOURCE = dispatcher[dispatcher.index("function OnNpcEvent(") : dispatcher.index("function OnNpcTimer(")]
    unittest.main(argv=[sys.argv[0]], verbosity=2)
