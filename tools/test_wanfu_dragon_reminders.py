"""Reproduce first-open native marks and exercise actual dragon entry replies."""
from __future__ import annotations

from itertools import product
import subprocess
import unittest

from patch_activity_reminders import CLIENT, ROOT, normalize
from patch_activity_entries import strings_of
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp
from patch_wanfu_dragon_reminders import BASELINE, METHODS, patch_swf
from test_activity_reminders import config_value, execute
from test_activity_window_lifecycle import WindowLifecycleTests
from test_wanfu_opening import Lifecycle, unpack


class WanfuLifecycle(Lifecycle):
    def __init__(self, data, cfg):
        super().__init__(data)
        self.obj['tipsIcon6'] = None
        self.attached = []
        self.globals['GameData']['qingdianActiveProvider']['cfg'] = cfg
        self.globals['GlobalData'].update(role={'level': 80}, itemDataMgr={'curPayGold': 0})
        self.globals['GlobalData']['qdActivityDataMgr'].update(loginDay=0, loginStatu=[], isGet2=[])

    def invoke(self, obj, name, args):
        if name == '__construct__':
            value = super().invoke(obj, name, args)
            if obj['class'] == 'PlaintMark': value['visible'] = True
            return value
        if name == 'addChild':
            if args[0] is None: raise ValueError('Cannot attach the retired null reminder')
            if isinstance(args[0], dict) and args[0].get('class') == 'PlaintMark': self.attached.append(args[0]['visible'])
        handlers = {'onLoginResultHandler': 6035, 'onTehuiResultHandler': 6034, 'onAccRecharge': 6033}
        if name in handlers: return self.run(handlers[name], obj, args[0] if args else None)
        return super().invoke(obj, name, args)


class WanfuDragonReminderTests(unittest.TestCase):
    run_code = WindowLifecycleTests.run_code

    @classmethod
    def setUpClass(cls):
        WindowLifecycleTests.setUpClass.__func__(cls)
        cls.source = CLIENT.read_bytes(); cls.data = unpack(cls.source)
        cls.before_source = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        cls.cfg_wanfu = config_value(read_cbp((ROOT / 'web/v2/lang/zh-cn/QingDianActivityCfg.cbp').read_bytes())[1])

    def setUp(self):
        WindowLifecycleTests.setUp(self)
        self.entry = {'effect': False}
        self.globals['NavTopBtnPanel2'] = {'_instance': {}}
        self.globals['MsgButtonTypes'] = {'RIGHT_TOP_LONG_TENG_TURN_BTN': 77}
        self.globals['GlobalData']['role']['actorCircle'] = 3

    def invoke(self, obj, name, args):
        if name == 'getBtnByType': return self.entry
        if name == 'setEffect': obj['effect'] = args[0]; return
        if name == 'addBtn2':
            self.entry = {'effect': args[3]}; return
        if name == 'getEffect': return {}
        return WindowLifecycleTests.invoke(self, obj, name, args)

    def wanfu(self, source=None): return WanfuLifecycle(unpack(source) if source else self.data, self.cfg_wanfu)

    def test_before_release_exposes_default_marks_and_attaches_deleted_mark(self):
        vm = self.wanfu(self.before_source); vm.children()
        self.assertEqual([True, True, True, False], vm.attached)
        with self.assertRaisesRegex(ValueError, 'retired null'): vm.open()

    def test_first_open_and_twenty_reopens_hide_unknown_marks_before_display(self):
        vm = self.wanfu(); vm.children()
        self.assertEqual([False] * 4, vm.attached)
        for _ in range(20):
            vm.open()
            self.assertEqual([False] * 4, [vm.obj[f'tipsIcon{i}']['visible'] for i in (0, 1, 2, 4)])
            self.assertEqual(6, len(vm.created)); vm.close()

    def test_five_variants_no_rewards_and_claimed_rewards_stay_clear(self):
        vm = self.wanfu(); vm.children()
        mgr = vm.globals['GlobalData']['qdActivityDataMgr']
        mgr.update(loginDay=3, loginStatu=[1] * 30, isGet2=[0] * 30,
                   rechargeDays=[3] * len(self.cfg_wanfu['EveryTotalPay']),
                   rechargeStatu=[[1] * 30 for _ in self.cfg_wanfu['EveryTotalPay']])
        vm.globals['GlobalData']['itemDataMgr']['curPayGold'] = 99999999
        for variant in range(5):
            vm.open(variant)
            self.assertEqual([False] * 4, [vm.obj[f'tipsIcon{i}']['visible'] for i in (0, 1, 2, 4)])
            vm.close()

    def test_native_login_and_recharge_badges_match_received_thresholds(self):
        vm = self.wanfu(); vm.children(); vm.open()
        mgr = vm.globals['GlobalData']['qdActivityDataMgr']
        for flags, days, level in product(([], [1] * 30, [0] * 30, [None] * 30), (0, 1, 3), (79, 80)):
            mgr.update(loginStatu=flags, loginDay=days); vm.globals['GlobalData']['role']['level'] = level
            vm.run(6035)
            self.assertEqual(bool(flags and flags[0] == 0 and days > 0 and level >= 80), vm.obj['tipsIcon0']['visible'])
        for index, reward in enumerate(self.cfg_wanfu['ChongZhiGift']):
            for pay, flag in product((reward['needChongzhiYB'] - 1, reward['needChongzhiYB']), (0, 1, None)):
                mgr['isGet2'] = [0] * len(self.cfg_wanfu['ChongZhiGift']); mgr['isGet2'][index] = flag
                vm.globals['GlobalData']['itemDataMgr']['curPayGold'] = pay
                vm.run(6034)
                self.assertEqual(flag == 1 and pay >= reward['needChongzhiYB'], vm.obj['tipsIcon1']['visible'])

    def test_accumulated_recharge_handles_partial_unknown_received_and_claimed_flags(self):
        vm = self.wanfu(); vm.children(); vm.open()
        mgr = vm.globals['GlobalData']['qdActivityDataMgr']
        for flags in ([], [None], [[]], [[None]], [[0]], [[1]]):
            mgr.update(rechargeDays=[1], rechargeStatu=flags); vm.run(6033)
            self.assertEqual(flags == [[0]], vm.obj['tipsIcon2']['visible'], flags)
        mgr.update(rechargeDays=[3] * 20, rechargeStatu=[[0] * 20 for _ in range(20)])
        for day in (0, 4):
            vm.globals['QingDianActiveWin']['openDay'] = day
            for mid in (6033, 6034, 6035): vm.run(mid)
            self.assertEqual([False] * 3, [vm.obj[f'tipsIcon{i}']['visible'] for i in range(3)])

    def test_dragon_counts_highlight_without_opening_window_and_clear_at_zero(self):
        for count in (-1, 0, 1, 9, 0):
            self.run_code(8635, {}, {'values': [3, count]})
            self.assertEqual(count > 0, self.entry['effect'])
        self.run_code(8635, {}, {'values': [2, 2, 25, 0]}); self.assertTrue(self.entry['effect'])
        self.run_code(8635, {}, {'values': [2, 0, 50, 1]}); self.assertFalse(self.entry['effect'])

    def test_dragon_entry_creation_queries_board_and_applies_cached_count(self):
        abc, names, bodies, strings = self.modules[0]; start, size, limits = bodies[6497]; code = abc[start:start + size]
        # Execute only this switch case, through the next case's label.
        ops = instructions(code); end = next(o.start for o in ops if o.start > 393 and o.opcode == 0x10)
        for count in (0, 4):
            self.requests.clear(); self.mgr['remainTime'] = count
            obj = {'onOpenWin': {}, '_isInitBtn': {}}
            execute(code, names, strings, {0: obj, 4: 77}, self.globals, self.invoke, start=331, end=end)
            self.assertEqual([1], self.requests); self.assertEqual(count > 0, self.entry['effect'])

    def test_payment_midnight_queries_and_closed_system_skips_queries(self):
        abc, names, bodies, strings = self.modules[0]
        for mid, op in ((6437, 4), (6355, 1)):
            start, size, _ = bodies[mid]; code = abc[start:start + size]
            # Added prefix ends before the first original instruction at offset 2.
            end = 2 + len(__import__('patch_wanfu_dragon_reminders').query(op))
            for circle in (2, 3):
                self.requests.clear(); self.globals['GlobalData']['role']['actorCircle'] = circle
                execute(code, names, strings, {0: {}, 1: None}, self.globals, self.invoke, end=end)
                self.assertEqual([op] if circle >= 3 else [], self.requests)

    def test_missing_dragon_entry_is_safe_and_no_state_reply_sends_requests(self):
        self.entry = None; self.run_code(8635, {}, {'values': [3, 1]})
        self.assertEqual([], self.requests)
        self.globals['NavTopBtnPanel2']['_instance'] = None
        self.run_code(8635, {}, {'values': [3, 0]})
        self.assertEqual([], self.requests)

    def test_server_client_rewards_and_language_pack_are_unchanged(self):
        for relative in ('Server/S1001/data/config/activity/QingDianActivityCfg.lua',
                         'Server/S1001/data/functions/Activity/QingDianActivity.lua',
                         'Server/S1001/data/config/modules/LongTengZhuanPanCfg.lua',
                         'Server/S1001/data/functions/modules/LongTengZhuanPan.lua',
                         'web/v2/lang/zh-cn/QingDianActivityCfg.cbp',
                         'web/v2/lang/zh-cn/longtengzhuanpancfg.cbp', 'web/v2/lang/zh-cn/zh-cn.dat',
                         'web/v2/modules/longtengturns/longtengturns.swf'):
            self.assertEqual(subprocess.check_output(['git', 'show', BASELINE + ':' + relative], cwd=ROOT),
                             (ROOT / relative).read_bytes(), relative)

    def test_reproducible_patch_preserves_other_methods_and_all_resources(self):
        self.assertEqual(self.source, patch_swf(self.before_source)); self.assertEqual(self.source, patch_swf(self.source))
        raw, (_, _, a, b) = abc_section(self.before_source); before, _ = normalize(raw[a:b])
        _, _, old = inspect_abc(before); abc, names, bodies, strings = self.modules[0]; changed = set()
        for mid, (start, size, limits) in old.items():
            new_start, new_size, new_limits = bodies[mid]
            if before[start:start + size] != abc[new_start:new_start + new_size] or limits != new_limits: changed.add(mid)
        self.assertEqual(METHODS, changed); self.assertEqual(strings_of(before), strings)


if __name__ == '__main__': unittest.main(defaultTest='WanfuDragonReminderTests')
