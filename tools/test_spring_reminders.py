"""Execute the shipped Spring reminder bytecode with server claim states."""
from __future__ import annotations

from patch_activity_window_lifecycle import MAIN_METHODS as WINDOW_METHODS, patch_swf as window_lifecycle

from itertools import product
import subprocess
import unittest

from patch_activity_entries import strings_of
from patch_activity_reminders import CLIENT, ROOT, normalize
from patch_competition_hongli_reminders import parameter_positions
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp
from patch_spring_reminders import BASELINE, METHODS, PARAMETER_METHODS, patch_swf
from test_activity_reminders import config_value, execute
from patch_open_server_reminders import METHODS as OPENING_METHODS, patch_swf as opening_reminders
from patch_jingji_material_reminders import METHODS as MATERIAL_METHODS, patch_swf as material_reminders
from patch_jingji_material_tabs import METHODS as TAB_METHODS, patch_swf as tab_reminders


class SpringReminderTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = CLIENT.read_bytes()
        raw, (_, _, a, b) = abc_section(cls.source); cls.abc, _ = normalize(raw[a:b])
        cls.names, _, cls.bodies = inspect_abc(cls.abc); cls.strings = strings_of(cls.abc)
        cls.cfg = config_value(read_cbp((ROOT / 'web/v2/lang/zh-cn/SpringFestivalCfg.cbp').read_bytes())[1])

    def setUp(self):
        self.mgr = {'_cfg': self.cfg, 'openDay': 1, 'loginFlag': 0xfff,
                    'loginCount': 0, 'rechargeDays': [], 'rechargeStatu': [],
                    'chargeFlag': 0, 'tehuiFlags': [0] * 20, 'luckCount': 100}
        self.nav = {}; self.requests = []; self.listeners = []; self.effect = None
        self.globals = {'GlobalData': {'newYearActivityDataMgr': self.mgr},
                        'GameData': {'newYearDataProvider': {'cfg': self.cfg}},
                        'MsgButtonTypes': {'Right_Top_NewYear': 84},
                        'NewYearEvent': {'RECHARGE': 'recharge'},
                        'OtherEvent': {'GameCurPayGoldChange': 'pay'},
                        'CliffordEvent': {'SHILIAN_DAY': 'day'},
                        'NewYearWin': {'openDay': 1}}
        self.day = 1

    def invoke(self, obj, name, args):
        for method, mid in (('checkLoginCanGet', 3327), ('checkNewYearCharge', 3329), ('canGet', 3325)):
            if name == method: return self.run_code(mid, obj)
        if name == 'getCurrentServerDate': return {'time': (self.day - 1) * 86400000}
        if name == '__construct__': return {'time': 0}
        if name == 'floor': return int(args[0] // 1)
        if name == 'requestNewYearActivityData': self.requests.append(args); return
        if name == 'updateButtonTips': self.effect = args[1]; return
        if name in ('addEventListener', 'removeEventListener'):
            self.listeners.append((name, args)); return
        raise ValueError((name, args))

    def run_code(self, mid, obj=None, arg=None, start=0):
        a, size, limits = self.bodies[mid]; code = self.abc[a:a + size]
        result, maximum = execute(code, self.names, self.strings,
                                  {0: self.mgr if obj is None else obj, 1: arg},
                                  self.globals, self.invoke, start=start)
        self.assertLessEqual(maximum, limits[0], mid)
        return result

    def test_daily_login_unknown_claimed_future_and_expired(self):
        for day, flags in product((-1, 0, 1, 12, 13), (-1, 0, 0xfff)):
            self.mgr.update(openDay=day, loginFlag=flags)
            self.assertEqual(1 <= day <= 12 and flags == 0, self.run_code(3327))

    def test_every_accumulated_login_tier_is_checked(self):
        rewards = self.cfg['LoginGift']['addupLoginAwards']
        for i, row in enumerate(rewards):
            for count in (0, int(row['needCount']) - 1, int(row['needCount']), 12):
                self.mgr.update(loginCount=count, loginFlag=0xfff | sum(1 << (24 + j) for j in range(len(rewards)) if j != i))
                self.assertEqual(count >= row['needCount'], self.run_code(3327), (i, count))
        self.mgr.update(loginCount=12, loginFlag=0xfff | sum(1 << (24 + j) for j in range(len(rewards))))
        self.assertFalse(self.run_code(3327))

    def test_every_recharge_tier_and_day_uses_received_flags(self):
        cfg = self.cfg['EveryTotalPay']
        for i, row in enumerate(cfg):
            for j in range(len(row['days'])):
                for achieved, flag in product((j, j + 1, 12), (0, 1)):
                    flags = [[1] * len(v['days']) for v in cfg]; flags[i][j] = flag
                    days = [12] * len(cfg); days[i] = achieved
                    self.mgr.update(rechargeDays=days, rechargeStatu=flags)
                    self.assertEqual(achieved >= j + 1 and flag == 0, self.run_code(3329), (i, j, achieved, flag))
        for days, flags in (([], []), ([1], []), ([1], [None]), ([1], [[]]), ([0], [[0]])):
            self.mgr.update(rechargeDays=days, rechargeStatu=flags)
            self.assertFalse(self.run_code(3329))
        self.mgr.update(openDay=13, rechargeDays=[12], rechargeStatu=[[0]])
        self.assertFalse(self.run_code(3329))

    def test_buying_and_retired_states_never_light_entry(self):
        for flags, money, luck in product((0, 0xff), (0, 99999999), (0, 100)):
            self.mgr.update(chargeFlag=flags, tehuiFlags=[0] * 20, luckCount=luck)
            self.globals['GlobalData']['itemDataMgr'] = {'curPayGold': money, 'mainMoney': money}
            self.assertFalse(self.run_code(3325))

    def test_entry_and_native_marks_agree_and_clear_after_claim(self):
        page = {'mark': {'visible': True}, '_list': {}, '_tabBar': {'selectedIndex': 0}}
        # The display list stays untouched; execute the new refresh after it is built.
        for login, recharge in product((False, True), repeat=2):
            self.mgr.update(loginFlag=0 if login else 0xfff,
                            rechargeDays=[1], rechargeStatu=[[0 if recharge else 1]])
            self.run_code(6365, self.nav, {'type': 'recharge'})
            self.assertEqual(login or recharge, self.effect)
            self.run_code(17347, page, start=118)
            self.assertEqual(recharge, page['mark']['visible'])
            self.assertEqual(login, self.run_code(3327))
        self.day = 13
        self.run_code(6365, self.nav, {'type': 'recharge'})
        self.assertFalse(self.effect)
        self.run_code(17347, page, start=118)
        self.assertFalse(page['mark']['visible'])

    def test_payment_queries_current_page_and_reply_does_not_query(self):
        self.run_code(6365, self.nav, {'type': 'pay'})
        self.assertEqual([[12, 0]], self.requests)
        self.requests.clear(); self.run_code(6365, self.nav, {'type': 'recharge'})
        self.assertEqual([], self.requests)

    def test_entry_initialization_requests_login_and_current_recharge(self):
        a, size, _ = self.bodies[6440]; code = self.abc[a:a + size]
        execute(code, self.names, self.strings, {0: self.nav}, self.globals,
                self.invoke, start=1089, end=1113)
        self.assertEqual([[2, 1], [12, 0]], self.requests)

    def test_login_mark_uses_shared_predicate_on_actual_page(self):
        a, size, _ = self.bodies[17378]; code = self.abc[a:a + size]
        page = {'mark': {'visible': True}}
        for flags, expected in ((0, True), (0xfff, False), (-1, False)):
            self.mgr['loginFlag'] = flags
            self.run_code(17378, page, start=777)
            self.assertEqual(expected, page['mark']['visible'])

    def test_closed_login_page_removes_listener_instead_of_registering_again(self):
        a, size, _ = self.bodies[17374]; code = self.abc[a:a + size]
        execute(code, self.names, self.strings, {0: self.nav},
                {**self.globals, 'NewYearEvent': {'GIVE_GIFTS': 'login'}},
                self.invoke, start=66, end=85)
        self.assertEqual('removeEventListener', self.listeners[0][0])

    def test_midnight_clears_stale_claims_and_requests_both_reward_pages(self):
        self.mgr.update(loginFlag=0, rechargeDays=[12], rechargeStatu=[[0]])
        self.day = 2
        self.run_code(6365, self.nav, {'type': 'day'})
        self.assertFalse(self.effect)
        self.assertEqual(-1, self.mgr['loginFlag'])
        self.assertEqual([], self.mgr['rechargeStatu'])
        self.assertEqual([[2, 1], [12, 0]], self.requests)

    def test_recharge_listener_is_paired_and_accepts_actual_event_type(self):
        for mid in PARAMETER_METHODS:
            self.assertEqual(2, parameter_positions(self.abc)[mid][0][1])
        for mid, expected in ((6333, 'addEventListener'), (6377, 'removeEventListener')):
            a, size, _ = self.bodies[mid]; code = self.abc[a:a + size]
            # Only the added listeners before the original body.
            calls = []
            execute(code, self.names, self.strings, {0: self.nav}, self.globals,
                    lambda o, n, args: calls.append((n, args)), end=56)
            self.assertEqual([expected] * 3, [v[0] for v in calls])
            self.assertEqual(['recharge', 'pay', 'day'], [v[1][0] for v in calls])
        for mid, listener in ((17342, 'addEventListener'), (17343, 'removeEventListener'),
                              (17373, 'addEventListener'), (17374, 'removeEventListener')):
            a, size, _ = self.bodies[mid]; code = self.abc[a:a + size]; calls = []
            execute(code, self.names, self.strings, {0: {}}, self.globals,
                    lambda o, n, args: calls.append((n, args)), end=21)
            self.assertEqual([(listener, 'day')], [(n, args[0]) for n, args in calls])

    def test_patch_is_reproducible_idempotent_and_changes_only_spring(self):
        source = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        self.assertEqual(self.source, window_lifecycle(tab_reminders(material_reminders(opening_reminders(patch_swf(source))))))
        self.assertEqual(self.source, patch_swf(self.source))
        raw, (_, _, a, b) = abc_section(source); before, _ = normalize(raw[a:b]); _, _, old = inspect_abc(before)
        changed = set()
        for mid, (a, size, limits) in old.items():
            b, length, new_limits = self.bodies[mid]
            if before[a:a + size] != self.abc[b:b + length] or limits != new_limits: changed.add(mid)
        self.assertEqual((METHODS - PARAMETER_METHODS) | OPENING_METHODS | MATERIAL_METHODS | TAB_METHODS | WINDOW_METHODS, changed)
        self.assertEqual(strings_of(before), self.strings)
        for mid in changed:
            a, size, limits = self.bodies[mid]; code = self.abc[a:a + size]
            for op in instructions(code):
                if op.opcode in (0x62, 0x63, 0xc2, 0x08): self.assertLess(op.operands[0], limits[1])
                for _, target, _ in op.branches:
                    if target <= op.start: self.assertEqual(0x09, code[target])
        # The constructor has exactly the original two native marks and hides both.
        a, size, _ = self.bodies[5903]; code = self.abc[a:a + size]
        self.assertEqual(2, sum(o.opcode == 0x4a and o.operands == (388, 0) for o in instructions(code)))
        marks = {'_tipsMark1': {'visible': True}, '_tipsMark2': {'visible': True}}
        self.run_code(5903, marks, start=len(code) - 17)
        self.assertFalse(marks['_tipsMark1']['visible'])
        self.assertFalse(marks['_tipsMark2']['visible'])


if __name__ == '__main__':
    unittest.main(verbosity=2)
