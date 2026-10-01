"""Exercise overlapping celebration settlement with Lua 5.1 game API stubs."""

from __future__ import annotations

import argparse
import subprocess
import sys
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
RANKING_PATH = "Server/S1001/data/functions/modules/YbConsumeRanking.lua"
SETUP = r'''
LocalDT = {}
now = 86400 * 100 + 3600
state = {}
actors = {}
mails = {}
timers = {}
files = {}
spring = false
PROP_ENTITY_ID = 1
ttScreenCenterBigNotice = 1
System = {
    getStaticVar = function() return state end,
    saveStaticVar = function() end,
    getCurrMiniTime = function() return now end,
    GetSystemTimeInMiniTime = function(time) return 2026, 1, math.floor(time / 86400) end,
    encodeNumTime = function(_, _, day) return day * 86400 end,
    isSameDay = function(a, b) return math.floor(a / 86400) == math.floor(b / 86400) end,
    hasTimer = function(name) return timers[name] ~= nil end,
    addTimer = function(name) timers[name] = true end,
    deleteTimer = function(name) timers[name] = nil end,
    broadcastTipmsg = function() end,
    AddMail = function(id, _, _, title, desc, _, _, award)
        table.insert(mails, {id = id, title = title, desc = desc, award = award})
    end,
}
Actor = {
    getStaticVar = function(id)
        if actors[id] == nil then actors[id] = {} end
        return actors[id]
    end,
    getIntProperty = function(id) return id end,
    getName = function(id) return "player"..id end,
}
is_spring_festival_time = function() return spring end
register_spring_festival_start_end_func = function() end
print = function() end
io.open = function(path, mode)
    if mode == "r" and files[path] == nil then return nil end
    if mode == "w" then files[path] = "" end
    local position = 1
    return {
        write = function(_, data) files[path] = files[path]..data end,
        close = function() end,
        read = function(_, count)
            local content = files[path]
            if position > #content then return nil end
            if count ~= nil then
                local result = string.sub(content, position, position + count - 1)
                position = position + count
                return result
            end
            local last = string.find(content, "\n", position) or (#content + 1)
            local result = string.sub(content, position, last - 1)
            position = last + 1
            return result
        end,
    }
end
'''


class ConsumeRankingTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime()
        self.lua.execute(SETUP)
        self.lua.execute((ROOT / "Server/S1001/data/config/activity/PublicTestCfg.lua").read_text(encoding="utf-8-sig"))
        self.lua.execute(RANKING_SOURCE)

    def run_lua(self, source):
        return self.lua.execute(source)

    def value(self, source):
        return self.lua.eval(source)

    def start(self, kind, day=1, duration=3):
        self.run_lua(f"OnYbConsumeRanking_ActivityStart({kind}, {day}, {duration})")

    def consume(self, id=1, amount=2_000_000):
        self.run_lua(f"OnRankingConsumeYbEvent({id}, {amount})")

    def midnight(self):
        self.run_lua("now = math.floor(now / 86400) * 86400 + 86400; OnYbConsumeRankingNewDayArrive()")

    def titles(self):
        return [self.value(f"mails[{i}].title") for i in range(1, self.value("#mails") + 1)]

    def test_two_celebrations_send_two_named_identical_rewards(self):
        self.start(0, duration=7)
        self.start(1)
        self.consume()
        self.midnight()
        self.assertEqual(["周年庆典每日消费排行", "万服庆典每日消费排行"], self.titles())
        self.assertEqual(self.value("mails[1].award"), self.value("mails[2].award"))
        self.assertEqual("7039,5,1/6820,1,1/6364,1,1/5384,5,1", self.value("mails[1].award"))
        self.assertEqual(0, self.value("#YbConsumeRanking"))

    def test_single_celebration_sends_only_its_reward(self):
        for kind, name in ((0, "周年庆典"), (1, "万服庆典")):
            with self.subTest(kind=kind):
                self.setUp()
                self.start(kind)
                self.consume()
                self.midnight()
                self.assertEqual([name + "每日消费排行"], self.titles())

    def test_starting_second_activity_keeps_rank_and_defers_rewards(self):
        self.start(0)
        self.consume()
        self.start(1)
        self.assertEqual(0, self.value("#mails"))
        self.assertEqual(2_000_000, self.value("YbConsumeRanking[1].yb"))
        self.midnight()
        self.assertEqual(2, self.value("#mails"))

    def test_repeated_midnight_cannot_send_duplicate_rewards_or_clear_today(self):
        self.start(0)
        self.start(1)
        self.consume()
        self.midnight()
        self.run_lua("actors = {}")
        self.consume(2)
        self.run_lua("OnYbConsumeRankingNewDayArrive()")
        self.assertEqual(2, self.value("#mails"))
        self.assertEqual(2, self.value("YbConsumeRanking[1].id"))

    def test_last_day_pays_both_before_short_activity_stops(self):
        self.start(0, duration=7)
        self.start(1, day=3)
        self.consume()
        self.midnight()
        self.run_lua("OnYbConsumeRanking_ActivityEnd(1)")
        self.assertEqual(2, self.value("#mails"))
        self.assertTrue(self.value("YbConsumeRanking_inTime"))
        self.assertIsNone(self.value("state.YbConsumeRankingActivities[1]"))
        self.run_lua("actors = {}; mails = {}")
        self.consume()
        self.midnight()
        self.assertEqual(["周年庆典每日消费排行"], self.titles())

    def test_end_before_midnight_preserves_today_but_stops_future_rewards(self):
        self.start(0)
        self.start(1)
        self.consume()
        self.run_lua("OnYbConsumeRanking_ActivityEnd(1)")
        self.assertEqual(0, self.value("#mails"))
        self.assertEqual(1, self.value("#YbConsumeRanking"))
        self.midnight()
        self.assertEqual(2, self.value("#mails"))
        self.assertIsNone(self.value("state.YbConsumeRankingActivities[1]"))

    def test_all_activities_end_after_final_settlement(self):
        self.start(0, day=3)
        self.start(1, day=3)
        self.consume()
        self.midnight()
        self.assertEqual(2, self.value("#mails"))
        self.assertFalse(self.value("YbConsumeRanking_inTime"))
        self.assertIsNone(self.value('timers["YbConsumeRanking_OnTimer"]'))

    def test_new_cycle_does_not_send_previous_cycle_twice(self):
        self.start(0, duration=7)
        self.start(1, day=3)
        self.consume()
        self.run_lua("now = now + 86400; OnYbConsumeRanking_ActivityEnd(1)")
        self.start(1)
        self.run_lua("OnYbConsumeRankingNewDayArrive()")
        self.assertEqual(2, self.value("#mails"))
        self.assertEqual(3, self.value("state.YbConsumeRankingActivities[1]"))

    def test_sparse_thresholds_use_same_rank_in_both_mails(self):
        self.start(0)
        self.start(1)
        for id, amount in enumerate((999_999, 499_999, 249_999), 1):
            self.consume(id, amount)
        self.midnight()
        self.assertEqual(4, self.value("#mails"))
        self.assertIn("第3名", self.value("mails[1].desc"))
        self.assertIn("第4名", self.value("mails[3].desc"))
        self.assertEqual(self.value("mails[1].id"), self.value("mails[2].id"))

    def test_same_day_reload_preserves_rank_and_activity_states(self):
        self.start(0)
        self.start(1)
        self.consume()
        self.run_lua("YbConsumeRanking_save(); YbConsumeRanking_load()")
        self.assertEqual(1, self.value("#YbConsumeRanking"))
        self.midnight()
        self.assertEqual(2, self.value("#mails"))

    def test_cross_day_reload_settles_saved_ranking_once(self):
        self.start(0)
        self.start(1)
        self.consume()
        self.run_lua("YbConsumeRanking_save(); now = now + 86400; YbConsumeRanking_load()")
        self.assertEqual(1, self.value("#YbConsumeRanking"))
        self.run_lua("OnYbConsumeRankingNewDayArrive(); YbConsumeRanking_load(); OnYbConsumeRankingNewDayArrive()")
        self.assertEqual(2, self.value("#mails"))

    def test_already_settled_previous_file_is_discarded_after_restart(self):
        self.start(0)
        self.consume()
        self.run_lua("YbConsumeRanking_save(); now = now + 86400; state.YbConsumeRankingLastSettleDate = math.floor(now / 86400) * 86400; YbConsumeRanking_load()")
        self.assertEqual(0, self.value("#YbConsumeRanking"))

    def test_legacy_active_states_migrate_without_losing_current_rank(self):
        self.run_lua("state = {isDringOneYearAct = 2, StartOneYear_OpenDay = 7, isDringQingDianActivity = 1, QingDian_openDay = 3}; YbConsumeRanking_load()")
        self.consume()
        self.midnight()
        self.assertEqual(2, self.value("#mails"))
        self.assertEqual(5, self.value("state.YbConsumeRankingActivities[0]"))
        self.assertEqual(2, self.value("state.YbConsumeRankingActivities[1]"))

    def test_spring_end_does_not_stop_celebrations(self):
        self.start(0)
        self.start(1)
        self.run_lua("spring_YbConsumeRanking_activity_start_or_end(false, false)")
        self.consume()
        self.midnight()
        self.assertEqual(2, self.value("#mails"))

    def test_no_activity_or_under_threshold_sends_no_rewards(self):
        self.consume()
        self.midnight()
        self.assertEqual(0, self.value("#mails"))
        self.start(0)
        self.start(1)
        self.consume(amount=249_999)
        self.midnight()
        self.assertEqual(0, self.value("#mails"))

    def test_invalid_activity_does_not_modify_ranking(self):
        self.start(0)
        self.consume()
        self.start(99)
        self.start(1, day=4)
        self.assertIsNone(self.value("state.YbConsumeRankingActivities[1]"))
        self.assertEqual(1, self.value("#YbConsumeRanking"))

    def test_engine_static_nested_userdata_supports_settlement_and_reload(self):
        self.start(0)
        self.start(1)
        self.run_lua('''local data = state.YbConsumeRankingActivities
local proxy = newproxy(true)
getmetatable(proxy).__index = data
getmetatable(proxy).__newindex = function(_, key, value) data[key] = value end
state.YbConsumeRankingActivities = proxy''')
        self.consume()
        self.run_lua("YbConsumeRanking_save(); YbConsumeRanking_load()")
        self.midnight()
        self.assertEqual(2, self.value("#mails"))
        self.assertTrue(self.value("YbConsumeRanking_inTime"))

    def recurring_setup(self):
        self.run_lua('''
ttChatWindow = 1
ttScreenCenter = 2
System.isCrossServer = function() return false end
System.getServerOpenTime = function() return 100 * 86400 end
System.trace = function() end
System.setActivtyExpRate = function() end
LuaHelp = {getAllActorList = function() return {} end}
ClearHongYunDangTouSystemData = function() end
ClearOneYearHongYunDangTouSystemData = function() end
EnsureDaJiDaLiActivity = function() end
EnsureNationalDayActivity = function() end
ensure_spring_festival_activity = function() end
daily_pay_ranking_ScriptRankingNewDayArrive = function()
    state.daily_pay_ranking_last_settle_date = math.floor(now / 86400) * 86400
end
DataPack = {
    allocPacket = function() return {} end,
    writeByte = function() end,
    flush = function() end,
}
''')
        import re
        for path, names in (
            ("Activity/QingDianActivity.lua", ("StartQingDianActivity", "EndQingDianActivity")),
            ("new_activity/festival/OneYearActivity.lua", ("StartOneYearActivity", "EndOneYearActivity")),
        ):
            source = (ROOT / "Server/S1001/data/functions" / path).read_text(encoding="utf-8-sig")
            for name in names:
                start = source.index(name + " = function(")
                end = re.search(r"^end\s*$", source[start:], re.M)
                self.run_lua(source[start:start + end.end()])
        self.run_lua((ROOT / "Server/S1001/data/functions/Activity/RecurringActivities.lua").read_text(encoding="utf-8-sig"))
        self.run_lua("LocalDT.RecurringActivities = {LocalDT.RecurringActivities[1], LocalDT.RecurringActivities[4]}")

    def test_actual_recurring_activities_pay_every_day_across_new_cycles(self):
        self.recurring_setup()
        self.run_lua("EnsureRecurringActivities()")
        for day in range(8):
            self.run_lua("actors = {}; mails = {}")
            self.consume()
            self.run_lua("now = now + 86400; EnsureRecurringActivities(); OnYbConsumeRankingNewDayArrive(); EnsureRecurringActivities()")
            self.assertEqual(["周年庆典每日消费排行", "万服庆典每日消费排行"], self.titles())
            self.assertEqual((day + 1) % 3 + 1, self.value("state.isDringQingDianActivity"))
            self.assertEqual((day + 1) % 7 + 1, self.value("state.isDringOneYearAct"))

    def test_actual_end_handler_before_or_after_midnight_preserves_other_activity(self):
        self.recurring_setup()
        self.run_lua("StartQingDianActivity(3, 3); StartOneYearActivity(7, 1)")
        self.consume()
        self.run_lua("now = now + 86400; EndQingDianActivity(); OnYbConsumeRankingNewDayArrive(); StartQingDianActivity(3, 1)")
        self.assertEqual(2, self.value("#mails"))
        self.assertEqual(6, self.value("state.YbConsumeRankingActivities[0]"))
        self.assertEqual(3, self.value("state.YbConsumeRankingActivities[1]"))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    parser.add_argument("--baseline", action="store_true")
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    RANKING_SOURCE = subprocess.check_output(["git", "show", f"HEAD:{RANKING_PATH}"], cwd=ROOT).decode("utf-8-sig") if args.baseline else (ROOT / RANKING_PATH).read_text(encoding="utf-8-sig")
    unittest.main(argv=[sys.argv[0]], verbosity=2)
