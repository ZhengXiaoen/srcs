"""Exercise actual server draws and client bytecode at every tier boundary."""
from __future__ import annotations

import argparse
from dataclasses import dataclass
import math
from pathlib import Path
import re
import sys
import unittest

from patch_celebration_spin import CLIENT, CONFIGS, LANG, ROOT, patch_swf
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp


@dataclass
class Ref:
    name: str


def execute(code, names, locals_, globals_, start=0):
    ops = {op.start: op for op in instructions(code)}
    stack = []
    maximum = 0
    pos = start
    result = None
    for _ in range(10000):
        op = ops[pos]
        pos = op.end
        kind, args = op.opcode, op.operands
        if 0xD0 <= kind <= 0xD3:
            stack.append(locals_[kind - 0xD0])
        elif 0xD4 <= kind <= 0xD7:
            locals_[kind - 0xD4] = stack.pop()
        elif kind == 0x62:
            stack.append(locals_[args[0]])
        elif kind == 0x63:
            locals_[args[0]] = stack.pop()
        elif kind in (0x20, 0x24, 0x25, 0x2C):
            stack.append(None if kind == 0x20 else "label" if kind == 0x2C else args[0])
        elif kind == 0x30:
            stack.pop()
        elif kind in (0x09, 0x80, 0x82):
            pass
        elif kind == 0x60:
            stack.append(globals_.get(names[args[0]], Ref(names[args[0]])))
        elif kind == 0x66:
            name = names[args[0]]
            key = name if name else stack.pop()
            obj = stack.pop()
            stack.append(len(obj) if name == "length" else obj[key])
        elif kind in (0x61, 0x68):
            value, obj = stack.pop(), stack.pop()
            obj[names[args[0]]] = value
        elif kind == 0x87:
            stack.pop()  # astypelate; the object remains on the stack.
        elif kind == 0xB2:
            obj = stack.pop()
            stack.append(names[args[0]] in obj["classes"])
        elif kind == 0x46:
            name, count = names[args[0]], args[1]
            values = stack[-count:] if count else []
            if count:
                del stack[-count:]
            obj = stack.pop()
            if name == "ceil":
                stack.append(math.ceil(values[0]))
            elif name == "getCurNum":
                stack.append(obj["consume"])
            elif name == "getIndex":
                stack.append(obj["claimed"])
            elif name == "indexOf":
                stack.append(obj.index(values[0]) if values[0] in obj else -1)
            else:
                raise ValueError(f"Unexpected client call {name}")
        elif kind in (0xA0, 0xA1, 0xA2, 0xA3, 0xAF):
            right, left = stack.pop(), stack.pop()
            if kind == 0xA0 and (isinstance(left, str) or isinstance(right, str)):
                value = str(left) + str(right)
            else:
                value = {0xA0: lambda: left + right, 0xA1: lambda: left - right,
                         0xA2: lambda: left * right, 0xA3: lambda: left / right,
                         0xAF: lambda: left > right}[kind]()
            stack.append(value)
        elif kind in (0x73, 0x93):
            value = stack.pop()
            stack.append(int(value) if kind == 0x73 else value - 1)
        elif kind == 0xC2:
            locals_[args[0]] += 1
        elif kind == 0x32:
            obj, index = args
            locals_[index] += 1
            stack.append(locals_[index] <= len(locals_[obj]))
        elif kind == 0x23:
            index, obj = stack.pop(), stack.pop()
            stack.append(obj[index - 1])
        elif kind == 0x08:
            locals_[args[0]] = None
        elif kind == 0x2A:
            stack.append(stack[-1])
        elif kind in (0x10, 0x11, 0x12, 0x14, 0x15, 0x0F):
            if kind == 0x10:
                take = True
            elif kind in (0x11, 0x12):
                value = bool(stack.pop())
                take = value if kind == 0x11 else not value
            else:
                right, left = stack.pop(), stack.pop()
                take = {0x14: lambda: left != right, 0x15: lambda: left < right,
                        0x0F: lambda: left < right}[kind]()
            if take:
                pos = op.branches[0][1]
        elif kind in (0x47, 0x48):
            if kind == 0x48:
                result = stack.pop()
            if stack:
                raise ValueError("Nonempty client stack at return")
            return result, maximum
        else:
            raise ValueError(f"Unexpected client opcode {kind:#x}")
        maximum = max(maximum, len(stack))
    raise ValueError("Client scenario did not terminate")


class CelebrationSpinTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        data, (_, _, start, end) = abc_section(CLIENT.read_bytes())
        cls.abc = data[start:end]
        cls.names, cls.methods, cls.bodies = inspect_abc(cls.abc, "YearActiveZhuanPanPage")
        cls.tiers = {}
        for filename, _, key, _ in CONFIGS:
            _, root = read_cbp((LANG / filename).read_bytes())
            cls.tiers[key] = [{"needPay": int(t.child("needPay").number())}
                              for t in root.child(key).child("0").children]

    def body(self, cls, name):
        _, methods, _ = inspect_abc(self.abc, cls)
        start, size, limits = self.bodies[methods[name][0]]
        return self.abc[start:start + size], limits

    def test_actual_server_draw_boundaries_all_days_and_all_rewards(self):
        for _, server, key, baseline in CONFIGS:
            lua = LuaRuntime(unpack_returned_tuples=True)
            lua.execute((ROOT / server).read_text("utf-8-sig"))
            lua.execute('''
                state = {}; svar = {}; rewards = {}; mails = {}; tip = nil
                bag = true
                Actor = {getStaticVar=function() return state end,
                    getIntProperty=function() return 101 end, getName=function() return 'test' end,
                    sendTipmsg=function(_,value) tip=value end}
                System = {getStaticVar=function() return svar end,
                    broadcastTipmsg=function() end, sendCommonLog=function() end,
                    AddMail=function(...) table.insert(mails,{...}) end}
                Awards = {CheckBagGridCount=function() return bag end,
                    Give=function(_,award) table.insert(rewards,award) end}
                Item = {getItemLinkMsg=function() return 'item' end}
                LogIds = {}; ClearOneYear_Data=function() end; ClearQingDian_Data=function() end
                GetOneYearActInfo=function() end; GetQingDianActivityInfo=function() end
            ''')
            year = baseline == 7
            path = "new_activity/festival/OneYearActivity.lua" if year else "Activity/QingDianActivity.lua"
            name = "GetOneYearXiaoFeiZhuanPan" if year else "GetQD_FeiZhuanPan"
            text = (ROOT / "Server/S1001/data/functions" / path).read_text("utf-8-sig")
            source = text[text.index("function " + name):]
            source = source[:re.search(r"^end\s*$", source, re.M).end()]
            lua.execute(source)
            state_name = "OneYearAct_Data" if year else "QDHD_Data"
            days_name = "StartOneYear_OpenDay" if year else "QingDian_openDay"
            cfg = lua.globals().OneYearActivityCfg if year else lua.globals().QingDianActivityCfg
            cfg = cfg[key][1]
            for days in (1, 2, 3, 4, 5, 6, 7, 14):
                lua.globals().svar[days_name] = days
                self.assertEqual(days * 3000000, math.ceil(cfg[12].needPay * days / baseline))
                for tier in range(1, 13):
                    threshold = math.ceil(cfg[tier].needPay * days / baseline)
                    state = lua.table_from({"XFZP": tier, "XFZPCosume": threshold - 1})
                    lua.globals().state[state_name] = state
                    lua.globals().rewards = lua.table()
                    lua.globals()[name](1)
                    self.assertEqual(tier, state.XFZP)
                    self.assertEqual("消费不足", lua.globals().tip)
                    state.XFZPCosume = threshold
                    lua.globals()[name](1)
                    self.assertEqual(tier + 1, state.XFZP)
                    award = lua.globals().rewards[1][1]
                    self.assertEqual(tuple(cfg[tier].award[1][field] for field in ("id", "count", "bind")),
                                     tuple(award[field] for field in ("id", "count", "bind")))
                # The same accumulated total unlocks all twelve draws.
                state = lua.table_from({"XFZP": 1, "XFZPCosume": days * 3000000})
                lua.globals().state[state_name] = state
                for _ in range(12):
                    lua.globals()[name](1)
                self.assertEqual(13, state.XFZP)
                self.assertEqual(days * 3000000, state.XFZPCosume)
            lua.globals().bag = False
            lua.globals().state[state_name] = lua.table_from({"XFZP": 12, "XFZPCosume": 42000000})
            lua.globals()[name](1)
            self.assertEqual(1, len(lua.globals().mails))

    def test_actual_client_counts_deficits_and_red_dots_match_server(self):
        info, info_limits = self.body("YearActiveZhuanPanPage", "infoBack")
        qd_red, qd_limits = self.body("QingDianActiveWin", "updateTurn")
        year_red, year_limits = self.body("YearAcitveDataMgr", "canGetAward")
        red_start = next(o.start for o in instructions(year_red) if o.opcode == 0x60 and o.operands == (1740,))
        for key, baseline, classes in (("XiaoFeiZhuanPan", 7, set()),
                                       ("XiaoFeiZhuanPanNew", 3, {"QDZhuanPanPage"}),
                                       ("XiaoFeiZhuanPan", 1, {"NewYearZhuanPanPage"})):
            cfg = self.tiers[key]
            for days in range(1, 8):
                scale = 1 if classes == {"NewYearZhuanPanPage"} else days / baseline
                thresholds = [math.ceil(t["needPay"] * days / baseline) if scale != 1 else t["needPay"] for t in cfg]
                for index, threshold in enumerate(thresholds):
                    for consume in (threshold - 1, threshold):
                        claimed = index
                        mgr = {"totalDay": days, "curDay": days, "curPayNum": consume,
                               "zpIndex": claimed, "index": claimed}
                        globals_ = {"GlobalData": {"yearAcitveDataMgr": mgr, "qdActivityDataMgr": mgr},
                                    "QingDianActiveWin": {"totalOpenDay": days},
                                    "FilterUtils": {"DefaultGrayFilters": "gray"},
                                    "GameData": {"oneYearActiveProvider": {"data": {"XiaoFeiZhuanPan": [cfg]}},
                                                 "qingdianActiveProvider": {"cfg": {"XiaoFeiZhuanPanNew": [cfg]}}}}
                        page = {"classes": classes, "consume": consume, "claimed": claimed,
                                "_cfg": cfg, "_cells": [{} for _ in range(12)],
                                "_randomIndex": list(range(13)),
                                "_label_2": {}, "_label_3": {}}
                        _, maximum = execute(info, self.names, {0: page}, globals_)
                        self.assertLessEqual(maximum, info_limits[0])
                        available = sum(consume >= t for t in thresholds)
                        self.assertEqual(available, page["_totalTime"])
                        self.assertEqual(available - claimed, page["_remainTime"])
                        if consume < threshold:
                            self.assertIn(str(threshold - consume), page["_label_3"]["caption"])
                        if baseline == 7:
                            result, maximum = execute(year_red, self.names, {0: mgr, 4: 0}, globals_, red_start)
                            self.assertEqual(available > claimed, result)
                            self.assertLessEqual(maximum, year_limits[0])
                        elif baseline == 3:
                            win = {"tipsIcon5": {}}
                            _, maximum = execute(qd_red, self.names, {0: win}, globals_)
                            self.assertEqual(available > claimed, win["tipsIcon5"]["visible"])
                            self.assertLessEqual(maximum, qd_limits[0])

    def test_patch_idempotence(self):
        source = CLIENT.read_bytes()
        self.assertEqual(source, patch_swf(source))

    def test_previously_claimed_rewards_show_next_unclaimed_threshold(self):
        info, limits = self.body("YearActiveZhuanPanPage", "infoBack")
        for key, baseline, classes in (("XiaoFeiZhuanPan", 7, set()),
                                       ("XiaoFeiZhuanPanNew", 3, {"QDZhuanPanPage"})):
            cfg = self.tiers[key]
            for days in (1, 3, 7):
                thresholds = [math.ceil(t["needPay"] * days / baseline) for t in cfg]
                for claimed in range(1, 13):
                    old_consumption = math.ceil(cfg[claimed - 1]["needPay"] * days / baseline / 2)
                    for consume in (old_consumption, thresholds[-1]):
                        mgr = {"totalDay": days}
                        globals_ = {"GlobalData": {"yearAcitveDataMgr": mgr},
                                    "QingDianActiveWin": {"totalOpenDay": days},
                                    "FilterUtils": {"DefaultGrayFilters": "gray"}}
                        page = {"classes": classes, "consume": consume, "claimed": claimed,
                                "_cfg": cfg, "_cells": [{} for _ in range(12)],
                                "_randomIndex": list(range(13)), "_label_2": {}, "_label_3": {}}
                        _, maximum = execute(info, self.names, {0: page}, globals_)
                        available = max(claimed, sum(consume >= t for t in thresholds))
                        self.assertEqual(available - claimed, page["_remainTime"])
                        self.assertGreaterEqual(page["_remainTime"], 0)
                        if available < 12:
                            self.assertIn(str(thresholds[available] - consume), page["_label_3"]["caption"])
                        self.assertLessEqual(maximum, limits[0])

    def test_same_cycle_preserves_saved_draw_and_consumption_records(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''
            state = {OneYear_Minitime=100, QDHD_MiNitime=200,
                     OneYearAct_Data={XFZP=10, XFZPCosume=7500000},
                     QDHD_Data={XFZP=12, XFZPCosume=4000000}}
            svar = {StartOneYear_Minitime=100, StartQDHD_MiNitime=200}
            Actor = {getStaticVar=function() return state end}
            System = {getStaticVar=function() return svar end, isCrossServer=function() return false end}
        ''')
        text = (ROOT / "Server/S1001/data/functions/player.lua").read_text("utf-8-sig")
        for name in ("ClearOneYear_Data", "ClearQingDian_Data"):
            source = text[text.index("function " + name):]
            source = source[:re.search(r"^end\s*$", source, re.M).end()]
            lua.execute(source)
        for _ in range(3):
            lua.globals().ClearOneYear_Data(1)
            lua.globals().ClearQingDian_Data(1)
        self.assertEqual(10, lua.globals().state.OneYearAct_Data.XFZP)
        self.assertEqual(7500000, lua.globals().state.OneYearAct_Data.XFZPCosume)
        self.assertEqual(12, lua.globals().state.QDHD_Data.XFZP)
        self.assertEqual(4000000, lua.globals().state.QDHD_Data.XFZPCosume)
        lua.globals().svar.StartQDHD_MiNitime = 201
        lua.globals().ClearQingDian_Data(1)
        self.assertEqual(0, len(lua.globals().state.QDHD_Data))
        self.assertEqual(10, lua.globals().state.OneYearAct_Data.XFZP)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
