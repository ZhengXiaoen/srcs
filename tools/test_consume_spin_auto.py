"""Exercise server reward accounting and actual Flash automatic draw bytecode."""
from __future__ import annotations

from collections import deque
from pathlib import Path
import re
import subprocess
import sys
import unittest

from patch_consume_spin_auto import CLIENT, ROOT, patch_swf
from patch_appearance_upgrade import inspect_abc, pools
from patch_drop_pickup_retry import abc_section, instructions
from patch_guild_quest_config import read_cbp, read_pack
from test_activity_entries import execute as constructor_execute

sys.path.insert(0, str(Path.home() / "AppData/Local/Temp/codex-lupa"))
from lupa.lua51 import LuaRuntime

SERVER = ROOT / "Server/S1001/data/functions/Activity/XiaoFeiZhuanPan.lua"
CONFIG = ROOT / "Server/S1001/data/config/activity/XiaoFeiZhuanPan.lua"
BASELINE = "fc430e35b3fbd1cc4ca6135ee7d620743474a0c9"


class ClientVM:
    def __init__(self, abc):
        self.abc = abc
        self.names, self.catalog, self.bodies = inspect_abc(abc)
        self.strings = pools(abc)["strings"][3]
        self.button = {"text": "自动", "listeners": []}
        self.page = {"editJson": {"xfzpAuto": False, "xfzpAutoButton": self.button},
                     "_isTurn": False, "leftNum": 205, "_gIndex": -1,
                     "linkBtn": {"listeners": []}, "_loaderbasebutton_0": {"listeners": []}}
        self.manager = {"leftNum": 205, "costGold": 2050000}
        self.globals = {"GlobalData": {"costTurnMgr": self.manager},
                        "MouseEvent": {"CLICK": "click"}, "OtherEvent": {
                            "QINGDIAN_COST_TURN": "spin", "MONTHLY_ACTIVITY_MY_RANK_DATA": "rank"}}
        self.requests = []
        self.tips = []
        self.events = []
        self.maximum = 0

    def body(self, cls, name):
        index = self.catalog[cls]["instance" if cls == "QDCostTurnWin" else "static"][name][0]
        start, size, limits = self.bodies[index]
        return self.abc[start:start + size], limits

    def run(self, cls, name, argument=None):
        code, limits = self.body(cls, name)
        ops = {op.start: op for op in instructions(code)}
        obj = self.page if cls == "QDCostTurnWin" else {}
        local = {0: obj, 1: argument}
        stack = []
        pos = 0
        maximum = 0
        for _ in range(10000):
            op = ops[pos]
            pos = op.end
            kind, args = op.opcode, op.operands
            if kind in range(0xd0, 0xd4): stack.append(local[kind - 0xd0])
            elif kind in range(0xd4, 0xd8): local[kind - 0xd4] = stack.pop()
            elif kind == 0x62: stack.append(local[args[0]])
            elif kind == 0x63: local[args[0]] = stack.pop()
            elif kind in (0x60, 0x5d):
                key = self.names[args[0]]
                stack.append(self.globals.get(key, {"class": key}))
            elif kind == 0x66:
                key = self.names[args[0]]
                target = stack.pop()
                stack.append(target.get(key, ("method", key)))
            elif kind in (0x61, 0x68):
                value, target = stack.pop(), stack.pop()
                target[self.names[args[0]]] = value
            elif kind in (0x24, 0x25): stack.append(args[0])
            elif kind == 0x2c: stack.append(self.strings[args[0]])
            elif kind == 0x20: stack.append(None)
            elif kind in (0x26, 0x27): stack.append(kind == 0x26)
            elif kind == 0x30: stack.pop()
            elif kind == 0x2a: stack.append(stack[-1])
            elif kind in (0x73, 0x80): pass
            elif kind in (0x46, 0x4f, 0x4e, 0x4a):
                method, count = self.names[args[0]], args[1]
                values = stack[-count:] if count else []
                if count: del stack[-count:]
                target = stack.pop()
                result = None
                if kind == 0x4a:
                    result = {"data": values[-1]}
                elif method == "getCostTurnData": self.requests.append(values[0])
                elif method == "doFlyTipMsg": self.tips.append(values[0])
                elif method == "stop": self.page["_isTurn"] = False
                elif method == "updateInfo": self.page["leftNum"] = self.manager["leftNum"]
                elif method in ("readInt", "readUnsignedInt", "readByte"):
                    result = target["values"].popleft()
                elif method == "dispatchEvent": self.events.append(values[0])
                elif method in ("addEventListener", "removeEventListener") and "listeners" in target:
                    if method == "addEventListener": target["listeners"].append(values)
                    else: target["listeners"].remove(values)
                elif method in ("onAddedToStage", "onRemovedFromStage"):
                    pass
                elif method in ("addEventListener", "removeEventListener"):
                    pass
                else: raise ValueError(f"Unimplemented call {method}")
                if kind in (0x46, 0x4a): stack.append(result)
            elif 0x0c <= kind <= 0x14:
                if kind == 0x10: take = True
                elif kind in (0x11, 0x12): take = bool(stack.pop()) == (kind == 0x11)
                else:
                    right, left = stack.pop(), stack.pop()
                    take = {0x0c: lambda: not left < right, 0x0d: lambda: not left <= right,
                            0x0e: lambda: not left > right, 0x0f: lambda: not left >= right,
                            0x13: lambda: left == right, 0x14: lambda: left != right}[kind]()
                if take: pos = op.branches[0][1]
            elif kind == 0x47:
                if stack: raise ValueError("Nonempty return stack")
                if maximum > limits[0]: raise ValueError("ABC stack limit exceeded")
                self.maximum = max(self.maximum, maximum)
                return
            else: raise ValueError(f"Unsupported opcode {kind:#x}")
            maximum = max(maximum, len(stack))
        raise ValueError("Client bytecode did not terminate")

    def click(self, auto=True):
        self.run("QDCostTurnWin", "refeshGoods", {"currentTarget": self.button if auto else self.page["linkBtn"]})

    def reply(self, remaining, operation=9):
        self.run("CliffordCC", "doCostTurnBack", {"values": deque([operation, remaining, 2050000])})
        self.run("QDCostTurnWin", "updatePoint", self.events.pop())


SETUP = r'''
LocalDT = {}
state = {dayConsumeYB_WUYI = 2050000, days = {Luckly_ZPawardInfo = {1,2,3,4,5,6,7,8}}, newdays = {}}
global = {}
packets = {}
rewards = {}
mails = {}
bag = true
old = false
Actor = {
 getStaticVar = function() return state end,
 getName = function() return "测试玩家" end,
 getIntProperty = function() return 1 end,
 sendTipmsg = function() end,
 changeMoney = function() error("自动抽奖不应消耗元宝") end,
}
Item = {getBagEmptyGridCount = function() return bag and 1 or 0 end}
Awards = {
 CheckBagGridCount = function() return bag end,
 Give = function(_, award) rewards[#rewards+1] = award[1] end,
}
System = {
 getStaticVar = function() return global end,
 getRandomNumber = function() return 0 end,
 broadcastTipmsg = function() end,
 AddMail = function(...) mails[#mails+1] = {...} end,
}
LuaHelp = {getAllActorList = function() return {} end}
DataPack = {
 readByte = function(packet) return packet.operation end,
 allocPacket = function() local p = {}; packets[#packets+1] = p; return p end,
 writeByte = function(p,v) p[#p+1] = v end,
 writeInt = function(p,v) p[#p+1] = v end,
 writeUInt = function(p,v) p[#p+1] = v end,
 writeString = function(p,v) p[#p+1] = v end,
 flush = function() end,
}
LogicCmd = {miscSysEx = {sub = {sXiaoFeiZhuanPan = 78}}}
LogIds = {xiaofeizhuanpan = 1}
lua_string_split = function(s, sep)
 local result = {}; for entry in string.gmatch(s, "[^"..sep.."]+") do result[#result+1] = entry end; return result
end
'''


class AutomaticSpinTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.swf = CLIENT.read_bytes()
        data, (_, _, start, end) = abc_section(cls.swf)
        cls.abc = data[start:end]

    def server(self, times=205, old=False):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute(SETUP)
        lua.execute(CONFIG.read_text("utf-8-sig"))
        lua.execute(SERVER.read_text("utf-8-sig"))
        lua.execute("ZP_IsUseOld = function() return old end")
        lua.globals().old = old
        lua.globals().state.dayConsumeYB_WUYI = times * 10000
        lua.globals().state.newdays.ZPcanDoTime = times
        return lua

    def test_batches_finish_all_counts_in_both_counter_modes(self):
        for old in (False, True):
            for times in (0, 1, 9, 10, 99, 100, 101, 205, 1000):
                with self.subTest(times=times, old=old):
                    lua = self.server(times, old)
                    for _ in range(max(1, (times + 99) // 100)):
                        lua.execute("handXiaoFeiZhuanPanEx(1, 75, {operation=9})")
                    self.assertEqual(times, lua.eval("#rewards"))
                    self.assertEqual(0, lua.eval("packets[#packets][2]"))
                    self.assertEqual(10 if times == 0 else 9, lua.eval("packets[#packets][1]"))
                    lua.execute("handXiaoFeiZhuanPanEx(1, 75, {operation=9})")
                    self.assertEqual(times, lua.eval("#rewards"))
                    self.assertEqual(10, lua.eval("packets[#packets][1]"))

    def test_pending_manual_reward_is_granted_once(self):
        lua = self.server(1)
        lua.execute("state.QD_ZPgetAwardIndex=1; handXiaoFeiZhuanPanEx(1,75,{operation=9})")
        self.assertEqual(2, lua.eval("#rewards"))
        self.assertIsNone(lua.eval("state.QD_ZPgetAwardIndex"))
        lua.execute("AskLucklyZP_getAward(1)")
        self.assertEqual(2, lua.eval("#rewards"))

    def test_full_bag_mails_every_reward_and_keeps_pool(self):
        lua = self.server(205)
        lua.execute("bag=false; pool=state.days.Luckly_ZPawardInfo")
        for _ in range(3): lua.execute("handXiaoFeiZhuanPanEx(1,75,{operation=9})")
        self.assertEqual(0, lua.eval("#rewards"))
        self.assertEqual(3, lua.eval("#mails"))
        self.assertEqual([100, 100, 5], [lua.eval(f'#lua_string_split(mails[{i}][8], "/")') for i in range(1, 4)])
        self.assertTrue(lua.eval("pool == state.days.Luckly_ZPawardInfo"))
        self.assertEqual(50, lua.eval('#lua_string_split(global.Luckly_ZPLog,"|")'))

    def test_single_ten_hundred_and_refresh_still_work(self):
        lua = self.server(111)
        for operation in (4, 5, 7, 8):
            lua.execute(f"handXiaoFeiZhuanPanEx(1,75,{{operation={operation}}})")
        self.assertEqual(111, lua.eval("#rewards"))
        self.assertEqual(111, lua.eval("state.newdays.ZPhasDoTime"))
        lua.execute("charged=0; Actor.changeMoney=function(_,_,amount) charged=charged+amount; return true end")
        lua.execute("handXiaoFeiZhuanPanEx(1,75,{operation=6})")
        self.assertEqual(-500, lua.eval("charged"))

    def test_client_waits_for_ack_and_finishes_remainder_without_animation(self):
        vm = ClientVM(self.abc)
        vm.click()
        vm.click()
        self.assertEqual([9], vm.requests)
        self.assertFalse(vm.page["editJson"]["xfzpAuto"])
        vm.reply(105)
        self.assertEqual([9], vm.requests)
        vm.click()
        for remaining in (5, 0): vm.reply(remaining)
        self.assertEqual([9, 9, 9], vm.requests)
        self.assertFalse(vm.page["_isTurn"])
        self.assertEqual("自动", vm.button["text"])
        self.assertEqual(0, vm.page["leftNum"])

    def test_server_replies_drive_client_until_all_205_rewards_are_granted(self):
        lua = self.server(205)
        vm = ClientVM(self.abc)
        vm.click()
        processed = 0
        while processed < len(vm.requests):
            self.assertLess(processed, 4)
            self.assertEqual(9, vm.requests[processed])
            lua.execute("handXiaoFeiZhuanPanEx(1,75,{operation=9})")
            operation = lua.eval("packets[#packets][1]")
            remaining = lua.eval("packets[#packets][2]")
            vm.reply(remaining, operation)
            processed += 1
        self.assertEqual(3, processed)
        self.assertEqual(205, lua.eval("#rewards"))
        self.assertFalse(vm.page["editJson"]["xfzpAuto"])

    def test_client_refresh_and_no_count_or_busy_click(self):
        vm = ClientVM(self.abc)
        vm.click(auto=False)
        self.assertEqual([6], vm.requests)
        vm.page["leftNum"] = 0
        vm.click()
        vm.page.update(leftNum=100, _isTurn=True)
        vm.click()
        self.assertEqual([6], vm.requests)

    def test_failure_reply_stops_and_retains_server_count(self):
        vm = ClientVM(self.abc)
        vm.click()
        vm.reply(45, 10)
        self.assertEqual([9], vm.requests)
        self.assertEqual(45, vm.page["leftNum"])
        self.assertFalse(vm.page["editJson"]["xfzpAuto"])

    def test_lifecycle_binds_and_removes_auto_click_and_stops_on_close(self):
        vm = ClientVM(self.abc)
        vm.run("QDCostTurnWin", "onAddedToStage", {})
        self.assertEqual(1, len(vm.button["listeners"]))
        vm.click()
        vm.run("QDCostTurnWin", "onRemovedFromStage", {})
        self.assertFalse(vm.button["listeners"])
        vm.reply(105)
        self.assertEqual([1, 2, 3, 9], vm.requests)

    def test_constructor_creates_adjacent_refresh_auto_controls_within_stack_limit(self):
        names, catalog, bodies = inspect_abc(self.abc)
        start, size, limits = bodies[catalog["QDCostTurnWin"]["constructor"]]
        code = self.abc[start:start + size]
        end = next(op.end for op in instructions(code) if op.opcode == 0x68 and names[op.operands[0]] == "editJson")
        local, _, maximum = constructor_execute(code, names, pools(self.abc)["strings"][3], {0: {}}, end=end)
        children = local[0]["editJson"]["childCom"]
        self.assertEqual(10, len(children))
        buttons = [entry for entry in children if entry["className"] == "CommonUI.Button.SimpleLinkLabel"]
        self.assertEqual(["刷新", "自动"], [entry["text"] for entry in buttons])
        self.assertEqual(["208,311", "270,311"], [entry["move"] for entry in buttons])
        self.assertLessEqual(maximum, limits[0])

    def test_patch_is_reproducible_and_other_resources_preserved(self):
        baseline = subprocess.check_output(["git", "show", BASELINE + ":web/GameFrame.swf"], cwd=ROOT)
        self.assertEqual(self.swf, patch_swf(baseline))
        self.assertEqual(self.swf, patch_swf(self.swf))

    def test_client_server_reward_ids_counts_bind_and_pack_match(self):
        path = ROOT / "web/v2/lang/zh-cn/XiaoFeiZhuanPan.cbp"
        source = path.read_bytes()
        self.assertEqual(source, dict(read_pack((path.parent / "zh-cn.dat").read_bytes()))[path.name])
        _, cfg = read_cbp(source)
        lua = self.server()
        for index, entry in enumerate(cfg.child("award").children, 1):
            award = lua.globals().XiaoFeiZhuanPan.award[index]
            self.assertEqual(tuple(award[field] for field in ("id", "count", "bind", "rate")),
                             tuple(entry.child(field).number() for field in ("id", "count", "bind", "rate")))

    def test_lua51_compiles_without_new_top_level_locals(self):
        lua = LuaRuntime()
        compile_ = lua.eval('function(s) return assert(loadstring(s))~=nil end')
        source = SERVER.read_text("utf-8-sig")
        self.assertTrue(compile_(source))
        full_budget = "local LocalDT={}\n" + "\n".join(f"local x{i}=0" for i in range(199)) + "\n"
        self.assertTrue(compile_(full_budget + source))
        baseline = subprocess.check_output(["git", "show", BASELINE + ":Server/S1001/data/functions/Activity/XiaoFeiZhuanPan.lua"], cwd=ROOT).decode("utf-8-sig")
        self.assertEqual(re.findall(r"^local\s", baseline, re.M), re.findall(r"^local\s", SERVER.read_text("utf-8-sig"), re.M))


if __name__ == "__main__":
    unittest.main(verbosity=2)
