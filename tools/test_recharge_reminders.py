"""Run shipped recharge bytecode against claimed, hidden and unmet reward states."""
from __future__ import annotations

import argparse
from dataclasses import dataclass
from itertools import product
import subprocess
import sys
import unittest

from patch_activity_entries import strings_of
from patch_daily_recharge_client import read_cbp, read_pack
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_recharge_reminders import CLIENT, ROOT, TARGETS, patch_swf

BASELINE_REF = "b9542a383416b88570d18a35ecea2905ee772713"


@dataclass(frozen=True)
class Ref:
    name: str


def execute(code, names, strings, locals_, globals_):
    ops = {op.start: op for op in instructions(code)}
    stack, calls = [], []
    maximum = 0
    pos = 0
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
        elif kind in (0x20, 0x24, 0x25, 0x26, 0x27, 0x2C):
            value = {0x20: None, 0x26: True, 0x27: False}.get(kind)
            stack.append(strings[args[0]] if kind == 0x2C else args[0] if args else value)
        elif kind in (0x09, 0x80):
            pass
        elif kind == 0x30:
            stack.pop()
        elif kind == 0x60:
            stack.append(globals_.get(names[args[0]], Ref(names[args[0]])))
        elif kind == 0x66:
            name = names[args[0]]
            key = name if name else stack.pop()
            obj = stack.pop()
            if name == "length":
                value = len(obj)
            elif name == "count" and isinstance(obj, dict) and "items" in obj:
                value = len(obj["items"])
            elif isinstance(obj, (list, tuple)):
                value = obj[key] if 0 <= key < len(obj) else None
            else:
                value = obj.get(key)
            stack.append(value)
        elif kind in (0x61, 0x68):
            name = names[args[0]]
            value = stack.pop()
            key = name if name else stack.pop()
            obj = stack.pop()
            if isinstance(obj, list):
                while len(obj) <= key:
                    obj.append(None)
            obj[key] = value
        elif kind in (0x46, 0x4F):
            name, count = names[args[0]], args[1]
            values = stack[-count:] if count else []
            if count:
                del stack[-count:]
            obj = stack.pop()
            if name == "min":
                stack.append(min(values))
            elif name == "indexOf":
                stack.append(obj.index(values[0]) if values[0] in obj else -1)
            elif name == "getEffect":
                stack.append(Ref("effect"))
            elif name == "clear":
                obj["items"].clear()
            elif name == "addDataAt":
                obj["items"].insert(values[1], values[0])
            elif name == "changeEverydayRechargeGiftStatus":
                obj["dot"] = values[0]
            elif name in ("addBtn2", "delBtn", "hideWin"):
                calls.append((name, values))
            else:
                raise ValueError(f"Unexpected recharge call {name}")
        elif kind == 0x56:
            count = args[0]
            value = stack[-count:] if count else []
            if count:
                del stack[-count:]
            stack.append(value)
        elif kind == 0x2A:
            stack.append(stack[-1])
        elif kind == 0x29:
            stack.pop()
        elif kind in (0x73, 0x76, 0x93, 0xC0, 0x96):
            value = stack.pop()
            stack.append(int(value or 0) if kind == 0x73 else bool(value) if kind == 0x76
                         else value - 1 if kind == 0x93 else value + 1 if kind == 0xC0 else not value)
        elif kind == 0xC2:
            locals_[args[0]] += 1
        elif kind in (0xA0, 0xA4, 0xAB, 0xAD, 0xAF, 0xB0):
            right, left = stack.pop(), stack.pop()
            stack.append({0xA0: lambda: left + right, 0xA4: lambda: left % right,
                          0xAB: lambda: left == right, 0xAD: lambda: left < right,
                          0xAF: lambda: left > right, 0xB0: lambda: left >= right}[kind]())
        elif kind in (0x10, 0x11, 0x12, 0x0D, 0x0F, 0x13, 0x14, 0x15):
            if kind == 0x10:
                take = True
            elif kind in (0x11, 0x12):
                value = bool(stack.pop())
                take = value if kind == 0x11 else not value
            else:
                right, left = stack.pop(), stack.pop()
                take = {0x0D: lambda: left <= right, 0x0F: lambda: left >= right,
                        0x13: lambda: left == right, 0x14: lambda: left != right,
                        0x15: lambda: left < right}[kind]()
                if kind in (0x0D, 0x0F):
                    take = not take
            if take:
                pos = op.branches[0][1]
        elif kind == 0x47:
            if stack:
                raise ValueError("Nonempty recharge stack on return")
            return locals_, calls, maximum
        else:
            raise ValueError(f"Unexpected recharge opcode {kind:#x}")
        maximum = max(maximum, len(stack))
    raise ValueError("Recharge method did not terminate")


class RechargeRemindersTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = CLIENT.read_bytes()
        data, (_, _, start, end) = abc_section(cls.source)
        cls.abc = data[start:end]
        cls.strings = strings_of(cls.abc)
        cls.classes = {name: inspect_abc(cls.abc, name) for name, _ in TARGETS}
        original = subprocess.check_output(["git", "show", BASELINE_REF + ":web/GameFrame.swf"], cwd=ROOT)
        data, (_, _, start, end) = abc_section(original)
        cls.baseline = data[start:end]
        _, root = read_cbp((ROOT / "web/v2/lang/zh-cn/EveryDayPayGiftCfg.cbp").read_bytes())
        cls.config = [[{"index": i, "needPayMoney": int(t.child("needPayMoney").number())}
                       for i, t in enumerate(g.children)] for g in root.children]

    def run_body(self, cls, method, state, globals_, abc=None):
        names, traits, bodies = self.classes[cls] if abc is None else inspect_abc(abc, cls)
        start, size, limits = bodies[traits[method][0]]
        result, calls, maximum = execute((abc or self.abc)[start:start + size], names,
                                        self.strings, {0: state, 1: None}, globals_)
        self.assertLessEqual(maximum, limits[0])
        return result[0], calls

    def daily(self, statuses, abc=None):
        globals_ = {"GlobalData": {"everydayRechargeStatus": list(statuses), "copyrightVersion": False},
                    # The shipped provider's total slot defaults to seven.
                    "GameData": {"everydayRechargeCfgProvider": {"total": 7}},
                    "_isGetFirstRecharge": True,
                    "MsgButtonTypes": {"Right_Top_EverydayRecharge": 1},
                    "GameResource": {"defaultResource": {}},
                    "LogicResProvider": {"EFID_BTN": 1},
                    "GameNavigateType": {"WIN_everydayGetBag": 1}}
        return self.run_body("NavTopRightArea", "updateEverydayRechargeBtn", {"dot": False, "onOpenWin": None}, globals_, abc)

    def jingji(self, days, flags, abc=None):
        return self.run_body("JingJiWin", "chongzhitehuiIcon", {"_icon": [{}, {}, {"visible": False}]},
                             {"GlobalData": {"cliffordDataMgr": {"jingjiChongzhiDays": days,
                                                                  "jingjiChongzhiStatu": flags}}}, abc)[0]["_icon"][2]["visible"]

    def test_baseline_reproduces_both_reports(self):
        baseline = self.baseline
        self.assertTrue(self.daily([2] * 6 + [1], baseline)[0]["dot"])
        self.assertTrue(self.jingji([1, 0], [[1, 0, 0], [0, 0, 0]], baseline))
        self.assertFalse(self.jingji([0, 1], [[0, 0, 0], [0, 0, 0]], baseline))

    def test_daily_dot_ignores_hidden_tier_all_claim_states(self):
        for visible in product(range(3), repeat=6):
            for hidden in range(3):
                state, _ = self.daily([*visible, hidden])
                self.assertEqual(state["dot"], 1 in visible, (visible, hidden))

    def test_daily_list_never_displays_hidden_tier(self):
        for day, statuses in product((1, 7, 8, 9, 100), product(range(3), repeat=7)):
            state, _ = self.run_body("EverydayRechargeWin2", "updateList", {"_list": {"items": []}},
                                     {"GlobalFunc": {"sectionOpenDays": day},
                                      "GameData": {"everydayRechargeCfgProvider": {"config": self.config}},
                                      "GlobalData": {"everydayRechargeStatus": statuses}})
            self.assertLessEqual(len(state["_list"]["items"]), 6)
            self.assertTrue(all(t["index"] < 6 for t in state["_list"]["items"]))

    def test_jingji_dot_matches_each_reward_day_all_claim_states(self):
        for days, bits in product(product(range(6), repeat=2), product(range(2), repeat=6)):
            flags = [list(bits[:3]), list(bits[3:])]
            expected = any(days[tier] >= index + 1 and flags[tier][index] == 0
                           for tier in range(2) for index in range(3))
            self.assertEqual(self.jingji(days, flags), expected, (days, flags))

    def test_patch_is_idempotent(self):
        self.assertEqual(patch_swf(self.source), self.source)

    def test_only_three_related_method_bodies_changed(self):
        _, _, before = inspect_abc(self.baseline, "JingJiWin")
        _, _, after = self.classes["JingJiWin"]
        # Later activity fixes edit other methods independently; these three
        # recharge methods must still match their own patch applied to baseline.
        expected_swf = patch_swf(subprocess.check_output(
            ["git", "show", BASELINE_REF + ":web/GameFrame.swf"], cwd=ROOT))
        data, (_, _, start, end) = abc_section(expected_swf)
        expected_abc = data[start:end]
        _, _, expected_bodies = inspect_abc(expected_abc, "JingJiWin")
        changed = set()
        for method, (start, size, limits) in before.items():
            if method not in {5581, 6438, 6624}:
                continue
            new_start, new_size, new_limits = after[method]
            self.assertEqual(limits, new_limits)
            expected_start, expected_size, expected_limits = expected_bodies[method]
            self.assertEqual(new_limits, expected_limits)
            self.assertEqual(self.abc[new_start:new_start + new_size],
                             expected_abc[expected_start:expected_start + expected_size])
            if self.baseline[start:start + size] != self.abc[new_start:new_start + new_size]:
                changed.add(method)
        self.assertEqual(changed, {5581, 6438, 6624})

    def test_client_server_and_pack_rewards_match(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute((ROOT / "Server/S1001/data/config/activity/EveryDayPayGiftCfg.lua").read_text("utf-8-sig"))
        lua.execute((ROOT / "Server/S1001/data/config/new_activity/festival/activity_jingji.lua").read_text("utf-8-sig"))
        directory = ROOT / "web/v2/lang/zh-cn"
        pack = dict(read_pack((directory / "zh-cn.dat").read_bytes()))
        for name, server in (("EveryDayPayGiftCfg.cbp", lua.globals().EveryDayPayGiftCfg),
                             ("activityjingji.cbp", lua.globals().activity_jingji.payGiveAwardNew.Info)):
            source = (directory / name).read_bytes()
            self.assertEqual(source, pack[name])
            _, root = read_cbp(source)
            groups = root.children if name.startswith("Every") else root.child("payGiveAwardNew").child("Info").children
            if name == "activityjingji.cbp":
                self.assertEqual([int(c.number()) for c in root.child("payGiveAwardNew").child("needMoney").children],
                                 [lua.globals().activity_jingji.payGiveAwardNew.needMoney[i] for i in (1, 2)])
            for group in groups:
                for tier in group.children:
                    row = server[int(group.name) + 1][int(tier.name) + 1]
                    for field in ("needPayMoney",):
                        if row[field] is not None:
                            self.assertEqual(tier.child(field).number(), row[field])
                    awards = tier.child("award").children
                    self.assertEqual(len(awards), len(row.award))
                    for award in awards:
                        expected = row.award[int(award.name) + 1]
                        for field in ("type", "id", "count", "bind"):
                            self.assertEqual(award.child(field).number(), expected[field])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path")
    args, remaining = parser.parse_known_args()
    if args.lua_path:
        sys.path.insert(0, args.lua_path)
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0], *remaining])
