"""Run shipped festival AVM2 against claim, purchase, expiry and reply states."""
from __future__ import annotations

from itertools import product
import subprocess
import sys
import unittest

from patch_festival_action_reminders import (BASELINE, CLIENT, NATIONAL, ROOT,
                                             METHODS, NATIONAL_METHODS,
                                             patch_swf, patch_national_swf,
                                             national_symbols)
from patch_activity_entries import q, strings_of
from patch_activity_reminders import call, get, normalize, prop
from patch_competition_hongli_reminders import parameter_positions
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp
import test_activity_reminders as activity_tests
from test_activity_reminders import config_value, execute


class FestivalActionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.clients = {}
        for key, path in (('main', CLIENT), ('national', NATIONAL)):
            raw, (_, _, a, b) = abc_section(path.read_bytes()); abc, _ = normalize(raw[a:b])
            cls.clients[key] = (abc, *inspect_abc(abc, 'NavTopRightArea'), strings_of(abc))
        cls.cfgs = {name: config_value(read_cbp((ROOT / 'web/v2/lang/zh-cn' / name).read_bytes())[1])
                    for name in ('SpringFestivalCfg.cbp', 'activityjingji.cbp', 'QingDianActivityCfg.cbp')}

    def setUp(self):
        self.requests = []; self.effects = {}; self.listeners = []
        self.spring_cfg = self.cfgs['SpringFestivalCfg.cbp']; self.jj_cfg = self.cfgs['activityjingji.cbp']
        self.qd_cfg = self.cfgs['QingDianActivityCfg.cbp']
        self.spring = {'_cfg': self.spring_cfg, 'openDay': 1, 'loginFlag': -1, 'loginCount': 0,
                       'rechargeDays': [], 'rechargeStatu': []}
        self.jj = {'activeType': 2, 'activeDay': 3, 'activeNow': 1, 'jingjiLogin': -1,
                   'JingjiRemainTime': 0, 'jingjiChongzhiDays': [], 'jingjiChongzhiStatu': [],
                   'jingJiFanliGet': [[], [], [], []], 'jingjiFanliUseNum': [], 'guoQingDay': 1,
                   'guoQingSign': []}
        self.qd = {'loginDay': 0, 'loginStatu': [], 'isGet2': [], 'rechargeDays': [], 'rechargeStatu': []}
        self.dragon = {'remainTime': 0, 'pos': 0, 'hasAward': 0}
        self.role = {'level': 80, 'actorCircle': 3}
        self.items = {'curPayGold': 0}
        self.qd_win = {'openDay': 1, 'totalOpenDay': 3}
        self.globals = {'GlobalData': {'newYearActivityDataMgr': self.spring, 'cliffordDataMgr': self.jj,
                        'qdActivityDataMgr': self.qd, 'longTengTurnMgr': self.dragon,
                        'itemDataMgr': self.items, 'role': self.role},
                        'GameData': {'newYearDataProvider': {'cfg': self.spring_cfg},
                                     'jingji2Provider': {'cfg': self.jj_cfg}, 'qingdianActiveProvider': {'cfg': self.qd_cfg}},
                        'QingDianActiveWin': self.qd_win,
                        'MsgButtonTypes': {'RIGHT_TOP_GUO_QING_BTN': 'national', 'RIGHT_TOP_LONG_TENG_TURN_BTN': 'dragon'},
                        'GlobalFunc': {'sectionOpenDays': 1}, 'OtherEvent': {'GameCurPayGoldChange': 'pay'}, 'CliffordEvent': {'SHILIAN_DAY': 'day'}}
        self.icons = {'_icon': [{'visible': True} for _ in range(6)], 'tipsIcon0': {'visible': True},
                      'tipsIcon1': {'visible': True}, 'tipsIcon2': {'visible': True}}

    def invoke(self, obj, name, args):
        if name == 'getCfg': return obj['cfg']
        if name == 'updateButtonTips': self.effects[args[0]] = args[1]; return
        if name in ('doLongTengInfo', 'requestNewYearActivityData'): self.requests.append((name, args)); return
        if name == 'push': obj.extend(args); return
        if name == 'getBitsValue': return 0
        if name == 'dispatchEvent': return
        if name == '__construct__': return {'event': args[0]}
        if name == 'getChildByName': return obj['children'].get(args[0])
        if name in ('addEventListener', 'removeEventListener'): self.listeners.append((name, args)); return
        if name == 'canGet' or name == 'checkOpenIsSpring': return False
        if name.startswith('isCanGet') or name == 'getAllBossKilled': return obj.get(name, False)
        if name in ('showOpenServerWin', 'resetGuide', 'setTimeout'): return
        if name in ('move', 'setDate', 'start'): return
        if name in ('getTextLabel', 'getRoleWeaponActionPackage', 'getMountShowPackage'): return 'resource'
        if name in ('getBtn', 'getPaneBtn2ByType'): return None
        if name == 'readByte': return obj['bytes'].pop(0)
        if name == 'readInt': return obj['ints'].pop(0)
        raise ValueError(f'Unexpected method {name}')

    def run_method(self, mid, obj=None, arg=None, key='main', start=0, end=None, extra=None):
        abc, names, _, bodies, strings = self.clients[key]; a, size, limits = bodies[mid]
        local = {0: obj if obj is not None else self.icons, 1: arg}; local.update(extra or {})
        if isinstance(arg, dict) and 'bytes' in arg:
            # The test reader exposes a property updated before every read.
            arg['bytesAvailable'] = len(arg['bytes'])
        value, stack = execute(abc[a:a + size], names, strings, local, self.globals, self.invoke, start, end)
        self.assertLessEqual(stack, limits[0]); return value

    def test_spring_login_checks_every_accumulated_tier(self):
        rewards = self.spring_cfg['LoginGift']['addupLoginAwards']
        daily = (1 << len(self.spring_cfg['XianShiQiangGou'])) - 1
        for i, row in enumerate(rewards):
            for count in (row['needCount'] - 1, row['needCount']):
                self.spring.update(loginCount=count, loginFlag=daily | sum(1 << (24 + j) for j in range(len(rewards)) if j != i))
                self.assertEqual(self.run_method(3327, self.spring), count >= row['needCount'])
        for day, flag in product((-1, 0, 1, 12, 13), (-1, 0, daily)):
            self.spring.update(openDay=day, loginFlag=flag, loginCount=0)
            self.assertEqual(self.run_method(3327, self.spring), 1 <= day <= 12 and flag == 0)

    def test_spring_current_recharge_unknown_claimed_and_expired(self):
        self.spring.update(rechargeDays=[1], rechargeStatu=[[0]])
        self.assertTrue(self.run_method(3329, self.spring))
        for days, status in product(([], [0], [1]), ([], [None], [[None]], [[0]], [[1]])):
            self.spring.update(rechargeDays=days, rechargeStatu=status)
            self.assertEqual(self.run_method(3329, self.spring), days == [1] and status == [[0]])
        self.spring.update(rechargeDays=[3], rechargeStatu=[[0]], openDay=13)
        self.assertFalse(self.run_method(3329, self.spring))

    def test_jingji_purchase_hints_never_show(self):
        for active in (1, 2):
            self.jj['activeType'] = active
            self.run_method(5578); self.run_method(5580)
            self.assertFalse(self.icons['_icon'][4 if active == 1 else 5]['visible'])
            self.assertFalse(self.icons['_icon'][3]['visible'])

    def test_jingji_level_login_turn_and_closed(self):
        for level, flag, turns in product((79, 80), (-1, 0, 1), (0, 1)):
            self.role['level'] = level; self.jj.update(jingjiLogin=flag, JingjiRemainTime=turns)
            self.run_method(5577); self.run_method(5576)
            self.assertEqual(self.icons['_icon'][1]['visible'], level >= 80 and flag == 0)
            self.assertEqual(self.icons['_icon'][0]['visible'], turns > 0)
        self.jj['activeNow'] = 4; self.run_method(5576); self.run_method(5577)
        self.assertFalse(self.icons['_icon'][0]['visible']); self.assertFalse(self.icons['_icon'][1]['visible'])

    def test_jingji_material_each_tier_strict_received_state(self):
        for group, key in enumerate(('GemRank', 'PeartRank', 'RingRank', 'MountRank')):
            for index, row in enumerate(self.jj_cfg[key]):
                for count, flag in product((row['count'] - 1, row['count']), (None, 0, 1)):
                    self.jj.update(jingJiFanliGet=[[], [], [], []], jingjiFanliUseNum=[0] * 4)
                    self.jj['jingJiFanliGet'][group] = [1] * len(self.jj_cfg[key]); self.jj['jingJiFanliGet'][group][index] = flag
                    self.jj['jingjiFanliUseNum'][group] = count; self.run_method(5579)
                    self.assertEqual(self.icons['_icon'][4]['visible'], count >= row['count'] and flag == 0)

    def test_jingji_and_wanfu_recharge_received_reward_day(self):
        for mid, mgr, day_field, flag_field, mark in ((5581, self.jj, 'jingjiChongzhiDays', 'jingjiChongzhiStatu', self.icons['_icon'][2]),
                 (6033, self.qd, 'rechargeDays', 'rechargeStatu', self.icons['tipsIcon2'])):
            for days, flags in product(range(4), product((None, 0, 1), repeat=3)):
                mgr[day_field] = [days]; mgr[flag_field] = [list(flags)]; self.run_method(mid)
                self.assertEqual(mark['visible'], any(days >= i + 1 and flag == 0 for i, flag in enumerate(flags)))
            mgr[flag_field] = [None]; self.run_method(mid); self.assertFalse(mark['visible'])

    def test_wanfu_login_level_gift_and_empty_state_clear_marks(self):
        for level, count, flags in product((79, 80), (0, 1), ([], [None], [0], [1])):
            self.role['level'] = level; self.qd.update(loginDay=count, loginStatu=flags)
            self.run_method(6035); self.assertEqual(self.icons['tipsIcon0']['visible'], level >= 80 and count > 0 and flags == [0])
        for i, row in enumerate(self.qd_cfg['ChongZhiGift']):
            for pay, flag in product((row['needChongzhiYB'] - 1, row['needChongzhiYB']), (None, 0, 1, 2)):
                self.items['curPayGold'] = pay; self.qd['isGet2'] = [0] * len(self.qd_cfg['ChongZhiGift']); self.qd['isGet2'][i] = flag
                self.run_method(6034); self.assertEqual(self.icons['tipsIcon1']['visible'], pay >= row['needChongzhiYB'] and flag == 1)
        self.qd['isGet2'] = []; self.run_method(6034); self.assertFalse(self.icons['tipsIcon1']['visible'])
        self.qd_win['openDay'] = 4
        for mid, mark in ((6033, 'tipsIcon2'), (6034, 'tipsIcon1'), (6035, 'tipsIcon0')):
            self.run_method(mid); self.assertFalse(self.icons[mark]['visible'])

    def test_national_entry_all_seven_claims_missing_and_closed(self):
        for i, day, earned, claimed in product(range(7), (0, 1, 7, 8), (None, 0, 1), (None, 0, 1)):
            self.jj.update(guoQingDay=day, guoQingSign=[0] * 7 + [1] * 7)
            self.jj['guoQingSign'][i] = earned; self.jj['guoQingSign'][i + 7] = claimed
            self.run_method(6336); self.assertEqual(self.effects['national'], 1 <= day <= 7 and earned == 1 and claimed == 0)

    def test_national_native_marks_match_each_claim(self):
        obj = {'_dayBtns': [{'children': {'festivalClaimMark': {'visible': True}}} for _ in range(7)],
               '_dayIndex': 0, '_cfg': [{'needYB': '100', 'jiazhi': '200'} for _ in range(7)]}
        for field in ('_image_15', '_image_16', '_mdpmovie_0', '_loaderbasebutton_0',
                      'needPayNum', 'valueNum', '_roleInnerView', '_mdp'): obj[field] = {}
        self.role['sex'] = 0; self.globals['GameResource'] = {'defaultResource': {}}
        for i, day, earned, claimed in product(range(7), (0, 1, 7, 8), (None, 0, 1), (None, 0, 1)):
            self.jj.update(guoQingDay=day, guoQingSign=[0] * 7 + [1] * 7)
            self.jj['guoQingSign'][i] = earned; self.jj['guoQingSign'][i + 7] = claimed
            for selected in range(7):
                obj['_dayIndex'] = selected
                self.run_method(13, obj, key='national')
                for j in range(7): self.assertEqual(obj['_dayBtns'][j]['children']['festivalClaimMark']['visible'], j == i and 1 <= day <= 7 and earned == 1 and claimed == 0)
                self.assertEqual(obj['_mdpmovie_0']['visible'], selected == i and 1 <= day <= 7 and earned == 1 and claimed == 0)
        for selected in (-1, 7):
            obj['_dayIndex'] = selected; self.jj.update(guoQingDay=8, guoQingSign=[])
            self.run_method(13, obj, key='national')
            self.assertFalse(obj['_mdpmovie_0']['visible']); self.assertFalse(obj['_loaderbasebutton_0']['visible'])
            self.assertFalse(any(btn['children']['festivalClaimMark']['visible'] for btn in obj['_dayBtns']))

    def test_dragon_remaining_turns_and_payment_day_refresh(self):
        for circle, turns, pos, award in product((2, 3), (0, 1), (0, 48, 49), (0, 1)):
            self.role['actorCircle'] = circle; self.dragon.update(remainTime=turns, pos=pos, hasAward=award)
            self.run_method(6397); self.assertEqual(self.effects['dragon'], circle >= 3 and turns > 0)
        self.requests.clear(); self.run_method(6397, arg={'type': 'reply'}); self.assertEqual(self.requests, [])
        self.run_method(6397, arg={'type': 'pay'}); self.assertEqual(self.requests, [('doLongTengInfo', [4])])
        self.requests.clear(); self.run_method(6397, arg={'type': 'day'}); self.assertEqual(self.requests, [('doLongTengInfo', [1])])

    def test_open_server_purchase_never_contributes_to_entry(self):
        mgr = {'isCanBuyShop': True, 'isCanGetReward': False, 'getAllBossKilled': False,
               'isCanGetBossKillFirstAward': False, 'isCanGetOpenServerGiftAward': False, 'isCanGetMaterialAward': False}
        self.globals['GlobalData'].update(competitivelDataMgr=mgr, isTwiceRecharge=1, vipDataMgr={'totalRecharge': 999999})
        self.globals['MsgButtonTypes']['Right_Top_Preferential'] = 'open'
        self.globals['LangManager'] = {'Lang': {'welfare': [''] * 16}}
        self.run_method(6433); self.assertFalse(self.effects['open'])
        mgr['isCanGetMaterialAward'] = True; self.run_method(6433); self.assertTrue(self.effects['open'])
        self.globals['GlobalFunc']['sectionOpenDays'] = 8
        self.run_method(6433); self.assertFalse(self.effects['open'])
        self.run_method(19561, {'_tipIcon': {'visible': True}})

    def test_open_server_final_configured_day_is_inclusive(self):
        self.globals['GameData']['competitiveProvider'] = {'config': [{'openTime': [1, 7]}]}
        for day in (0, 1, 6, 7, 8):
            self.globals['GlobalFunc']['sectionOpenDays'] = day
            self.assertEqual(self.run_method(4146, {}, 0), 1 <= day <= 7)
        self.globals['GlobalFunc']['sectionOpenDays'] = 8
        for mid in (4142, 4143, 4144): self.assertFalse(self.run_method(mid, {}))

    def test_spring_payment_queries_current_page_and_reply_does_not_query(self):
        self.globals['MsgButtonTypes']['Right_Top_NewYear'] = 'spring'
        self.run_method(6365, arg={'type': 'pay'})
        self.assertEqual(self.requests, [('requestNewYearActivityData', [12, 0])])
        self.requests.clear(); self.run_method(6365, arg={'type': 'reply'}); self.assertEqual(self.requests, [])

    def test_event_callbacks_use_event_and_remove_login_listener(self):
        abc, names, _, bodies, _ = self.clients['main']; params = parameter_positions(abc)
        for mid in (5577, 6034, 6336, 17345): self.assertEqual(params[mid][0][1], 2)
        a, size, _ = bodies[17374]
        self.assertNotIn(q(0x4f, 13671, 2), abc[a:a + size])
        for added, removed, cls, event, callback in ((6333, 6377, 827, 39371, 8157), (6333, 6377, 331, 36020, 8189),
                    (6026, 6027, 141, 31479, 7671), (5570, 5571, 329, 40567, 6764), (22159, 22160, 331, 36011, 23814)):
            for mid, listener in ((added, 13671), (removed, 13672)):
                a, size, _ = bodies[mid]; self.assertIn(call(q(0x60, 1563), listener, prop(q(0x60, cls), event), prop(get(0), callback), void=True), abc[a:a + size])

    def test_reproducible_patch_preserves_unrelated_resources_and_is_idempotent(self):
        for key, path, patch, allowed in (('main', CLIENT, patch_swf, METHODS), ('national', NATIONAL, patch_national_swf, NATIONAL_METHODS)):
            before = subprocess.check_output(['git', 'show', BASELINE + ':' + path.relative_to(ROOT).as_posix()], cwd=ROOT)
            self.assertEqual(patch(before), path.read_bytes()); self.assertEqual(patch(path.read_bytes()), path.read_bytes())
            raw, (_, _, a, b) = abc_section(before); abc, _ = normalize(raw[a:b])
            if key == 'national': abc = national_symbols(abc)[0]
            _, _, old = inspect_abc(abc, 'NavTopRightArea'); actual = self.clients[key]; after, _, _, new, _ = actual
            changed = set()
            for mid, (a, size, limits) in old.items():
                c, length, new_limits = new[mid]
                if abc[a:a + size] != after[c:c + length] or limits != new_limits: changed.add(mid)
            self.assertTrue(changed <= allowed); self.assertGreater(len(changed), 3)
            for mid in changed:
                a, size, _ = new[mid]
                for op in instructions(after[a:a + size]):
                    for _, target, _ in op.branches:
                        if target <= op.start: self.assertEqual(after[a + target], 0x09)

    def test_all_changed_methods_pass_stack_and_local_verification(self):
        fixture = activity_tests.ActivityRemindersTests()
        fixture.abc = {}; fixture.symbols = {}
        for module, key in ((False, 'main'), (True, 'national')):
            abc, names, traits, bodies, _ = self.clients[key]
            fixture.abc[module] = abc; fixture.symbols[module] = (names, traits, bodies)
        fixture.bytecode_methods = ((False, sorted(METHODS)), (True, sorted(NATIONAL_METHODS)))
        fixture.test_all_modified_bytecode_paths_have_balanced_stack_and_local_limits()


if __name__ == '__main__': unittest.main(verbosity=2)
