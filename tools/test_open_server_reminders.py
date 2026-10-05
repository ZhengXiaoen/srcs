"""Execute shipped opening reminder bytecode and verify the resource scope."""
from __future__ import annotations

from patch_activity_window_lifecycle import MAIN_METHODS as WINDOW_METHODS, patch_swf as window_lifecycle
from patch_wanfu_dragon_reminders import METHODS as REMINDER_METHODS, patch_swf as wanfu_dragon

from itertools import product
import subprocess
import unittest

from patch_activity_entries import strings_of
from patch_activity_reminders import CLIENT, ROOT, normalize
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_pack
from patch_open_server_reminders import BASELINE, METHODS, patch_swf
from test_activity_reminders import execute
from patch_jingji_material_reminders import METHODS as MATERIAL_METHODS, patch_swf as material_reminders
from patch_jingji_material_tabs import METHODS as TAB_METHODS, patch_swf as tab_reminders


class OpenServerReminderTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = CLIENT.read_bytes()
        cls.baseline = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        cls.abc, cls.names, cls.strings, cls.bodies = cls.parse(cls.source)
        cls.old, cls.old_names, cls.old_strings, cls.old_bodies = cls.parse(cls.baseline)
        # Read actual constants and both day-dependent tab arrays from the SWF.
        a, size, _ = cls.bodies[6805]; ops = instructions(cls.abc[a:a + size])
        cls.tabs = {}
        for i, op in enumerate(ops):
            if op.opcode != 0x68: continue
            name = cls.names[op.operands[0]]; previous = ops[i - 1]
            if name.startswith('PAGE_'):
                assert previous.opcode == 0x24
                cls.tabs[name] = previous.operands[0]
            elif name in ('configIndexs', 'configIndexs2', 'buttonIds', 'buttonIds2'):
                assert previous.opcode == 0x56
                cls.tabs[name] = [cls.tabs[cls.names[v.operands[0]]] if v.opcode == 0x60
                                  else v.operands[0] for v in ops[i - 1 - previous.operands[0]:i - 1]]

    @staticmethod
    def parse(source):
        raw, (_, _, a, b) = abc_section(source); abc, _ = normalize(raw[a:b])
        names, _, bodies = inspect_abc(abc)
        return abc, names, strings_of(abc), bodies

    def setUp(self):
        self.states = {name: False for name in ('isCanGetReward', 'getAllBossKilled',
                      'isCanGetBossKillFirstAward', 'isCanGetOpenServerGiftAward',
                      'isCanGetMaterialAward', 'isCanGetRewardByType')}
        self.states['isCanBuyShop'] = True
        self.effect = None; self.calls = []
        self.mgr = {'bossAwardStatu': 1, 'buys': [0]}
        self.globals = {'GlobalData': {'competitivelDataMgr': self.mgr,
                        'isTwiceRecharge': 1, 'vipDataMgr': {'totalRecharge': 0}},
                        'GlobalFunc': {'sectionOpenDays': 1}, 'OpenServerActiveWin': self.tabs,
                        'MsgButtonTypes': {'Right_Top_Preferential': 'opening'},
                        'LangManager': {'Lang': {'welfare': [None] * 16}},
                        'OtherGuideManager': {'instance': {}, 'GUIDE_KAIFU': 'opening'}}

    def invoke(self, obj, name, args):
        self.calls.append(name)
        if name in self.states: return self.states[name]
        if name == 'indexOf': return obj.index(args[0]) if args[0] in obj else -1
        if name == 'updateButtonTips': self.effect = args[1]; return
        if name in ('getBtn', 'setTimeout', 'resetGuide', 'showGuide'): return
        raise ValueError((name, args))

    def run_code(self, mid, obj=None, before=False):
        abc, names, strings, bodies = ((self.old, self.old_names, self.old_strings, self.old_bodies)
                                      if before else (self.abc, self.names, self.strings, self.bodies))
        a, size, limits = bodies[mid]
        result, maximum = execute(abc[a:a + size], names, strings, {0: obj or {}, 1: None},
                                  self.globals, self.invoke)
        self.assertLessEqual(maximum, limits[0], mid)
        return result

    def badge(self, button, before=False, visible=True):
        self.globals['m_Data'] = button; obj = {'_tipIcon': {'visible': visible}}
        self.run_code(19561, obj, before)
        return obj['_tipIcon']['visible']

    def test_original_purchase_only_state_reproduces_both_reminders(self):
        self.run_code(6433, before=True); self.assertTrue(self.effect)
        self.assertTrue(self.badge(1144, before=True))

    def test_purchase_states_never_light_entry_or_shop_mark_on_either_tab_layout(self):
        for day, can_buy, initial in product((1, 3, 4, 7, 8), (False, True), (False, True)):
            self.globals['GlobalFunc']['sectionOpenDays'] = day
            self.states['isCanBuyShop'] = can_buy; self.calls.clear()
            self.run_code(6433); self.assertFalse(self.effect, (day, can_buy))
            self.assertFalse(self.badge(1144, visible=initial), (day, can_buy, initial))
            self.assertNotIn('isCanBuyShop', self.calls)

    def test_each_claim_source_still_lights_entry_and_clears_after_claim(self):
        for name in ('isCanGetReward', 'getAllBossKilled', 'isCanGetBossKillFirstAward',
                     'isCanGetOpenServerGiftAward', 'isCanGetMaterialAward'):
            self.mgr['bossAwardStatu'] = 0; self.states[name] = True
            self.run_code(6433); self.assertTrue(self.effect, name)
            self.states[name] = False
            self.run_code(6433); self.assertFalse(self.effect, name)
        data = self.globals['GlobalData']; data['isTwiceRecharge'] = 0
        for recharge, expected in ((9899, False), (9900, True), (10000, True)):
            data['vipDataMgr']['totalRecharge'] = recharge
            self.run_code(6433); self.assertEqual(expected, self.effect)
        data['isTwiceRecharge'] = 1; self.run_code(6433); self.assertFalse(self.effect)

    def test_reward_marks_remain_independent_of_purchase_mark_and_clear(self):
        for day, (button, predicate) in product((1, 3, 4, 7),
                ((292, 'isCanGetRewardByType'), (363, 'getAllBossKilled'),
                 (971, 'isCanGetBossKillFirstAward'), (972, 'isCanGetOpenServerGiftAward'),
                 (1143, 'isCanGetMaterialAward'))):
            self.globals['GlobalFunc']['sectionOpenDays'] = day
            self.mgr['bossAwardStatu'] = 0; self.states[predicate] = True
            self.assertTrue(self.badge(button), (day, button))
            self.assertFalse(self.badge(1144), (day, button))
            self.states[predicate] = False
            self.assertFalse(self.badge(button), (day, button))
        data = self.globals['GlobalData']; data['vipDataMgr']['totalRecharge'] = 9900
        data['isTwiceRecharge'] = 0; self.assertTrue(self.badge(730))
        data['isTwiceRecharge'] = 1; self.assertFalse(self.badge(730))

    def test_patch_is_reproducible_idempotent_and_preserves_unrelated_methods(self):
        self.assertEqual(self.source, wanfu_dragon(window_lifecycle(tab_reminders(material_reminders(patch_swf(self.baseline))))))
        self.assertEqual(self.source, patch_swf(self.source))
        changed = set()
        for mid, (a, size, limits) in self.old_bodies.items():
            b, length, new_limits = self.bodies[mid]
            expected = ((4, 10, *limits[2:]) if mid in MATERIAL_METHODS else
                        (max(limits[0], 4), max(limits[1], 4 if mid == 15825 else 10), *limits[2:])
                        if mid in TAB_METHODS else limits)
            if mid not in WINDOW_METHODS | REMINDER_METHODS: self.assertEqual(expected, new_limits, mid)
            if self.old[a:a + size] != self.abc[b:b + length]: changed.add(mid)
        self.assertEqual(METHODS | MATERIAL_METHODS | TAB_METHODS | WINDOW_METHODS | REMINDER_METHODS, changed)
        self.assertEqual(self.old_strings, self.strings)
        for mid in changed:
            a, size, limits = self.bodies[mid]; code = self.abc[a:a + size]
            for op in instructions(code):
                if op.opcode in (0x62, 0x63, 0x08): self.assertLess(op.operands[0], limits[1])
                for _, target, _ in op.branches:
                    if target <= op.start: self.assertEqual(0x09, code[target])

    def test_server_client_and_packed_configs_are_unchanged_and_match(self):
        paths = ('Server/S1001/data/config/activity/OpenServerAwardCfg.lua',
                 'Server/S1001/data/functions/Activity/OpenServerAward.lua',
                 'web/v2/lang/zh-cn/openserverawardCfg.cbp', 'web/v2/lang/zh-cn/zh-cn.dat')
        for path in paths:
            previous = subprocess.check_output(['git', 'show', BASELINE + ':' + path], cwd=ROOT)
            self.assertEqual(previous, (ROOT / path).read_bytes(), path)
        config = ROOT / paths[2]
        entries = [(name, data) for name, data in read_pack((ROOT / paths[3]).read_bytes())
                   if name == config.name]
        self.assertEqual([(config.name, config.read_bytes())], entries)


if __name__ == '__main__':
    unittest.main(verbosity=2)
