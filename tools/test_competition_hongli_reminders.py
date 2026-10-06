"""Exercise shipped reminder callbacks, event types and resource preservation."""
from __future__ import annotations

import subprocess
import unittest

from patch_activity_entries import strings_of
from patch_activity_reminders import normalize
from patch_bag_client import ABCReader, encode_u30
from patch_competition_hongli_reminders import (ADDED_NAMES, BASELINE, CLIENT,
    EVENT_METHODS, MAIN_METHODS, MODULE, MODULE_METHODS, ROOT, module_symbols,
    parameter_positions, patch_swf)
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
import test_activity_reminders as activity_tests
from test_activity_reminders import execute


def unpack(source):
    raw, (_, _, start, end) = abc_section(source)
    abc, _ = normalize(raw[start:end])
    names, _, bodies = inspect_abc(abc, "NavTopRightArea")
    return abc, names, bodies


def method_record(abc, bodies, method):
    start, size, limits = bodies[method]
    header = b"".join(encode_u30(value) for value in (method, *limits, size))
    reader = ABCReader(abc)
    reader.pos = start + size
    for _ in range(reader.u30()):
        for _ in range(5):
            reader.u30()
    return start - len(header), reader.pos


class CompetitionHongLiRemindersTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        activity_tests.ActivityRemindersTests.setUpClass()
        cls.current = {module: unpack(path.read_bytes())
                       for path, module in ((CLIENT, False), (MODULE, True))}
        cls.baseline = {module: subprocess.check_output(
            ["git", "show", BASELINE + ":" + path.relative_to(ROOT).as_posix()], cwd=ROOT)
            for path, module in ((CLIENT, False), (MODULE, True))}

    def setUp(self):
        self.fixture = activity_tests.ActivityRemindersTests()
        self.fixture.setUp()

    def test_jingji_purchase_tab_never_glows_and_other_marks_are_untouched(self):
        abc, names, bodies = self.current[False]
        start, size, limits = bodies[5580]
        for purchased in ([], [0] * 12, [1] * 12, [999] * 12):
            window = {"_icon": [{"visible": True} for _ in range(8)]}
            execute(abc[start:start + size], names, strings_of(abc), {0: window},
                    {"GlobalData": {"cliffordDataMgr": {"jingjiBigSale": purchased}}},
                    lambda obj, name, args: self.fail("Purchase hint queried rewards"))
            self.assertFalse(window["_icon"][3]["visible"])
            self.assertTrue(all(mark["visible"] for index, mark in enumerate(window["_icon"]) if index != 3))

    def test_payment_and_currency_refresh_precede_unrelated_activity_guards(self):
        fixture = self.fixture
        fixture.hong.update(hongLiLoginGet=1, hongLiEveryDayRechargeGet=0, hongLiTurnTime=0)
        fixture.items["curPayGold"] = 10000
        fixture.role["money"] = 10000
        fixture.buttons["hong"] = {"effect": False}
        fixture.globals["GlobalData"]["activeDataMgr"] = {}
        fixture.globals["MsgButtonTypes"]["Right_Top_LaborDay"] = "labor"
        abc, names, bodies = self.current[False]
        for method in (6353, 6437):
            calls = []

            def invoke(obj, name, args):
                calls.append(name)
                if name == "hongLiActiveOpen":
                    return fixture.invoke(obj, name, args)
                if name == "isActivityOpen":
                    return False
                return None

            start, size, _ = bodies[method]
            fixture.buttons["hong"]["effect"] = False
            code = abc[start:start + size]
            execute(code, names, strings_of(abc), {0: fixture.nav, 1: None},
                    fixture.globals, invoke, end=8 if method == 6353 else None)
            self.assertTrue(fixture.buttons["hong"]["effect"])
            ops = instructions(code)
            refresh = next(op.start for op in ops if op.opcode == 0x4f and names[op.operands[0]] == "hongLiActiveOpen")
            guard = next(op.start for op in ops if op.branches)
            self.assertLess(refresh, guard)
            self.assertEqual(1, calls.count("hongLiActiveOpen"))

    def test_wrong_event_type_is_reproduced_and_generic_callbacks_accept_pay_money(self):
        before, _, _ = unpack(self.baseline[True])
        after, names, _ = self.current[True]
        old_parameters = parameter_positions(before)
        new_parameters = parameter_positions(after)
        for method in EVENT_METHODS:
            self.assertEqual(4, old_parameters[method][0][1])
            self.assertEqual("Event", names[new_parameters[method][0][1]])
        fixture = self.fixture
        win = {f"tipsIcon{index}": {} for index in (0, 1, 2, 5)}
        fixture.hong.update(hongLiLoginGet=1, hongLiEveryDayRechargeGet=0, hongLiTurnTime=0)
        fixture.items["curPayGold"] = 10000
        fixture.role["money"] = 10000
        for event in ("GameCurPayGoldChange", "EVERYDAY_RECHARGE_DATA_CHANGE", "MAIN_MONEY_CHANGE"):
            fixture.run_method(11, win, {"type": event}, True)
            self.assertTrue(win["tipsIcon1"]["visible"])
            self.assertTrue(win["tipsIcon5"]["visible"])
        fixture.hong.update(hongLiEveryDayRechargeGet=1, hongLiTurnTime=999)
        fixture.run_method(11, win, {"type": "MAIN_MONEY_CHANGE"}, True)
        self.assertFalse(win["tipsIcon1"]["visible"])
        self.assertFalse(win["tipsIcon5"]["visible"])

    def test_payment_currency_and_spin_page_listeners_add_and_remove_symmetrically(self):
        abc, names, bodies = self.current[True]

        def listeners(method):
            start, size, _ = bodies[method]
            ops = instructions(abc[start:start + size])
            found = []
            for index, op in enumerate(ops):
                if op.opcode != 0x4f or names[op.operands[0]] not in ("addEventListener", "removeEventListener"):
                    continue
                block = ops[max(0, index - 5):index]
                if [item.opcode for item in block] == [0x60, 0x60, 0x66, 0xd0, 0x66]:
                    found.append(tuple(names[block[offset].operands[0]] for offset in (1, 2, 4)))
            return found

        for added, removed, expected in (
                (7, 8, {("OtherEvent", "GameCurPayGoldChange", "dataChangeHandler"),
                        ("PropertyEvent", "MAIN_MONEY_CHANGE", "dataChangeHandler")}),
                (29, 30, {("OtherEvent", "GameCurPayGoldChange", "updateTime"),
                          ("OtherEvent", "EVERYDAY_RECHARGE_DATA_CHANGE", "updateTime")}),
                (69, 70, {("OtherEvent", "GameCurPayGoldChange", "dataChangeHandler")})):
            self.assertEqual(listeners(added), listeners(removed))
            self.assertTrue(expected <= set(listeners(added)))

    def test_both_shipped_clients_are_reproducible_idempotent_and_preserve_other_bytes(self):
        for path, module in ((CLIENT, False), (MODULE, True)):
            self.assertEqual(path.read_bytes(), patch_swf(self.baseline[module], module))
            self.assertEqual(path.read_bytes(), patch_swf(path.read_bytes(), module))
            old, old_names, old_bodies = unpack(self.baseline[module])
            new, new_names, new_bodies = self.current[module]
            if module:
                self.assertEqual(old_names, new_names[:-3])
                self.assertEqual(ADDED_NAMES, tuple(new_names[-3:]))
                expanded, _ = module_symbols(old)
                old, old_names, old_bodies = unpack_abc(expanded)
            else:
                self.assertEqual(old_names, new_names)
            changed = {method for method, (start, size, limits) in old_bodies.items()
                       if (new_bodies[method][2] != limits or
                           old[start:start + size] != new[new_bodies[method][0]:new_bodies[method][0] + new_bodies[method][1]])}
            self.assertEqual(MODULE_METHODS if module else MAIN_METHODS, changed)
            restored = bytearray(new)
            edits = []
            for method in changed:
                start, end = method_record(old, old_bodies, method)
                new_start, new_end = method_record(new, new_bodies, method)
                edits.append((new_start, new_end, old[start:end]))
            for start, end, value in sorted(edits, reverse=True):
                restored[start:end] = value
            if module:
                for method in EVENT_METHODS:
                    position, _ = parameter_positions(old)[method][0]
                    restored[position] = 4
            self.assertEqual(old, restored)
            old_raw, (old_tag, old_payload, old_start, old_end) = abc_section(self.baseline[module])
            new_raw, (new_tag, new_payload, new_start, new_end) = abc_section(path.read_bytes())
            self.assertEqual(old_raw[8:old_tag + 2], new_raw[8:new_tag + 2])
            self.assertEqual(old_raw[old_payload:old_start], new_raw[new_payload:new_start])
            self.assertEqual(old_raw[old_end:], new_raw[new_end:])

    def test_all_modified_paths_pass_stack_local_and_loop_label_checks(self):
        self.fixture.test_all_modified_bytecode_paths_have_balanced_stack_and_local_limits()
        self.fixture.test_all_activity_back_edges_have_flash_verifier_labels()

    def test_server_and_packed_reward_configuration_is_unchanged(self):
        for relative in ("Server/S1001/data/config/activity/SanRenHongLiCfg.lua",
                         "Server/S1001/data/config/new_activity/festival/activity_jingji.lua",
                         "web/v2/lang/zh-cn/sanrenhonglicfg.cbp",
                         "web/v2/lang/zh-cn/activityjingji.cbp",
                         "web/v2/lang/zh-cn/zh-cn.dat"):
            self.assertEqual((ROOT / relative).read_bytes(), subprocess.check_output(
                ["git", "show", BASELINE + ":" + relative], cwd=ROOT))


def unpack_abc(abc):
    names, _, bodies = inspect_abc(abc, "HongLiActiveWin")
    return abc, names, bodies


if __name__ == "__main__":
    unittest.main(verbosity=2)
