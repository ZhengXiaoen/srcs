"""Exercise main/daily quest callbacks with real Lua 5.1 task configuration."""

from __future__ import annotations

import argparse
import subprocess
import sys
import unittest
from pathlib import Path

import test_daily_task_submit as daily


ROOT = Path(__file__).resolve().parents[1]
FUNCTIONS = ROOT / "Server/S1001/data/functions"
SETUP = daily.SETUP + r'''
Lang = {EntityName=setmetatable({}, {__index=function(_, key) return key end})}
GameLog = {}
ActorInitConfig = {nCreateInitFb={{createPos={{nScenceID=101}}}}}
scene = 9
money = 0
items = {}
routes = {}
Actor.getSceneId = function() return scene end
Actor.getBagEmptyGridCount = function() return 100 end
Actor.changeMoney = function(_, _, amount) money = money + amount end
Actor.addItem = function(_, id, _, _, count) items[id] = (items[id] or 0) + count end
Actor.autoFindPathToNpc = function(_, mapid, name) table.insert(routes, {mapid, name}) end
Item = {
    getAddItemNeedGridCount=function() return 1 end,
    getBagEmptyGridCount=function() return 100 end
}
DataPack = setmetatable({}, {__index=function() return function() end end})
System.isCrossServer = function() return false end
System.sendCommonLog = function() end
Fuben.getNpcPtrById = function() return 0 end
SpecialQuest_UpdatePic = function() end
OnCompleteGiftTask = function() end
'''


def source(name: str) -> str:
    path = FUNCTIONS / name
    if BASELINE:
        return subprocess.check_output(
            ["git", "show", "HEAD:" + path.relative_to(ROOT).as_posix()], cwd=ROOT
        ).decode("utf-8-sig").rstrip("\0")
    return path.read_text(encoding="utf-8-sig").rstrip("\0")


class MainQuestSubmitTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime()
        self.lua.execute(SETUP)
        self.lua.execute(source("StdTask.lua") + "\n_G.task_all = task_all")
        self.lua.execute(source("ActorFlags.lua"))
        self.lua.execute(source("NpcMiscFun/SanRenNPC/ZhuXianRenWu.lua"))
        self.lua.execute(source("NpcMiscFun/SanRenNPC/MapNpc/ZhanWuShuang.lua"))
        dispatcher = source("NpcMiscFun/NpcEventDispatcher.lua")
        self.lua.execute(dispatcher[dispatcher.index("function OnNpcEvent("):
                                    dispatcher.index("function OnNpcTimer(")])
        timer = source("TimerFunc.lua")
        self.lua.execute("TimerFunc = {}\n" + timer[timer.index("TimerFunc[14] = function("):
                                                    timer.index("TimerFunc[15] = function(")])
        self.lua.execute("NpcDialog[251] = GetNpcRiChangChuMo(); state.taskflags_val = 65")

    def run_lua(self, code):
        self.lua.execute(code)

    def value(self, expression):
        return self.lua.eval(expression)

    def assert_progress(self, task, exp=0, money=0):
        self.assertEqual(task, self.value("get_taskflags_val({})"))
        self.assertEqual(exp, self.value("exp"))
        self.assertEqual(money, self.value("money"))

    def test_first_daily_completion_preserves_following_main_task(self):
        self.run_lua('OnNpcEvent({},251,"rcWanChengRenWu")')
        self.assert_progress(65, 2000000)
        self.assertEqual(10000, self.value("inner"))
        self.assertEqual(1, self.value("completions"))
        self.assertEqual(37, self.value("task_all[65].npcid"))
        for _ in range(4):
            self.run_lua('OnNpcEvent({},251,"onAcceptTask")')
        self.assert_progress(65, 2000000)
        self.assertIsNone(self.value("items[1780]"))
        self.run_lua('OnNpcEvent({},37,"onAcceptTask")')
        self.assert_progress(66, 2430000, 5000)
        self.assertEqual(3, self.value("items[1780]"))

    def test_level_up_during_daily_reward_cannot_submit_other_npc_task(self):
        self.run_lua('''level = 59
            Actor.addExp = function(_, amount)
                exp = exp + amount
                level = 70
                OnNpcEvent({},251,"onAcceptTask")
            end
            OnNpcEvent({},251,"rcWanChengRenWu")''')
        self.assert_progress(65, 2000000)

    def test_stale_callbacks_cannot_skip_later_npc_feature_tasks(self):
        for task in (65, 66, 68, 69, 82, 84, 92, 94, 97, 100, 102, 104, 106, 108, 110):
            with self.subTest(task=task):
                self.setUp()
                self.run_lua(f'''state.taskflags_val = {task}; level = 90
                    OnNpcEvent({{}},251,"onAcceptTask")
                    MasterStokeAcceptTask({{}},251)''')
                self.assert_progress(task)

    def test_correct_npc_respects_level_requirement(self):
        self.run_lua('level=59; MasterStokeAcceptTask({},37)')
        self.assert_progress(65)
        self.run_lua('level=60; MasterStokeAcceptTask({},37)')
        self.assert_progress(66, 430000, 5000)

    def test_wrong_scene_cannot_submit_dialog_or_guide(self):
        for task in (65, 67, 72):
            with self.subTest(task=task):
                self.setUp()
                self.run_lua(f'''state.taskflags_val={task}; scene=12
                    MasterStokeAcceptTask({{}},task_all[{task}].npcid)''')
                self.assert_progress(task)

    def test_correct_guide_still_advances(self):
        for task in (64, 67, 72):
            with self.subTest(task=task):
                self.setUp()
                self.run_lua(f'''state.taskflags_val={task}
                    MasterStokeAcceptTask({{}},task_all[{task}].npcid)''')
                self.assert_progress(task + 1)

    def test_teleport_guide_completes_only_at_pending_destination(self):
        for task, destination in ((30, 6), (49, 7), (72, 12)):
            with self.subTest(task=task):
                self.setUp()
                self.run_lua(f'''state.taskflags_val={task}; scene={destination}
                    dynamic.nowNumberOfStep=1
                    MasterStokeAcceptTask({{}},325)''')
                self.assert_progress(task)
                self.run_lua('dynamic.nowNumberOfStep=2; scene=99; MasterStokeAcceptTask({},325)')
                self.assert_progress(task)
                self.run_lua(f'scene={destination}; TimerFunc[14]({{}})')
                self.assert_progress(task + 1)

    def test_initial_scene_shard_is_allowed(self):
        self.run_lua('state.taskflags_val=3; scene=101; MasterStokeAcceptTask({},3)')
        self.assertEqual(4, self.value("get_taskflags_val({})"))
        self.assertEqual(20, self.value("exp"))
        self.assertEqual(1, self.value("items[2]"))

    def test_daily_retry_keeps_single_reward_and_main_progress(self):
        self.run_lua('''OnNpcEvent({},251,"rcWanChengRenWu")
            OnNpcEvent({},251,"rcWanChengRenWu")
            OnNpcEvent({},251,"onAcceptTask")''')
        self.assert_progress(65, 2000000)
        self.assertEqual(1, self.value("completions"))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    parser.add_argument("--baseline", action="store_true")
    args = parser.parse_args()
    BASELINE = args.baseline
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
