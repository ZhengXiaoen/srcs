"""Execute the shipped main-entry bytecode with actual reward/reply states."""
from __future__ import annotations

from patch_unique_activity_rankings import MAIN_METHODS, MODULE_METHODS, patch_swf as unique_rankings
from patch_consume_ranking_client import patch_swf as ranking_description
from patch_spring_activity_icon import METHODS as SPRING_METHODS, patch_swf as spring_icon
from patch_retired_festival_pages import METHODS as RETIRED_METHODS, patch_swf as retired_pages

from patch_wanfu_opening import METHODS as WANFU_METHODS, patch_swf as wanfu_opening
from patch_spring_display import patch_swf as spring_display
from patch_retired_hunt_pages import METHODS as HUNT_METHODS, patch_swf as retired_hunt
from patch_spring_flash_sale import METHODS as SPRING_DATE_METHODS, patch_swf as spring_dates

def current_release(source, module=False):
    updated = unique_rankings(source, module)
    from patch_festival_action_reminders import patch_swf as action_reminders
    from patch_competition_hongli_reminders import patch_swf as competition_reminders
    from patch_appearance_upgrade import patch_swf as appearance_upgrade
    if module: return competition_reminders(updated, True)
    for patch in (ranking_description, spring_icon, retired_pages, spring_display,
                  wanfu_opening, retired_hunt, spring_dates, appearance_upgrade,
                  competition_reminders, action_reminders):
        updated = patch(updated)
    return updated


from itertools import product
import subprocess
import unittest

from patch_activity_reminders import CLIENT, ROOT, call, get, normalize, prop
from patch_activity_entries import q
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp
from patch_main_activity_reminders import BASELINE, METHODS, patch_swf
import test_activity_reminders as reminders


class MainActivityRemindersTests(unittest.TestCase):
    run_method = reminders.ActivityRemindersTests.run_method

    @classmethod
    def setUpClass(cls):
        reminders.ActivityRemindersTests.setUpClass.__func__(cls)
        cls.main_configs = {name: reminders.config_value(read_cbp((ROOT / 'web/v2/lang/zh-cn' / name).read_bytes())[1])
                            for name in ('QingDianActivityCfg.cbp', 'activityjingji.cbp', 'treasurehuntcfg.cbp')}

    def setUp(self):
        reminders.ActivityRemindersTests.setUp(self)
        self.jj_cfg = self.main_configs['activityjingji.cbp']
        self.qd_cfg = self.main_configs['QingDianActivityCfg.cbp']
        self.hunt_cfg = self.main_configs['treasurehuntcfg.cbp']
        self.hong.update(activeType=2, activeDay=3, activeNow=1, jingjiLogin=-1,
                         jingjiChongzhiDays=[], jingjiChongzhiStatu=[], JingjiRemainTime=0,
                         jingjiFanliUseNum=[], jingJiFanliGet=[[], [], [], []],
                         jingjiBigSale=[0] * 10, jingjiFashionWeapenGet=[0] * 10)
        self.qd = {'loginDay': 0, 'loginStatu': [], 'isGet2': [], 'rechargeDays': [],
                   'rechargeStatu': [], 'curPayNum': 0, 'zpIndex': 0, 'haoli': None,
                   'haoliTimes': 0, 'isGet1': 1, 'yanhuaStatu': [0] * 8, 'milionair': 1}
        self.nav.update(onYanhuaShowEffect=True, onMilionairShowEffect=True, onTehuiShowEffect=True,
                        onLoginShowEffect=True, onCollectWordEffect=True)
        self.globals['GlobalData']['qdActivityDataMgr'] = self.qd
        self.globals['GameData'].update(jingji2Provider={'cfg': self.jj_cfg},
                    qingdianActiveProvider={'cfg': self.qd_cfg}, qdTreasureHuntProvider={'cfg': self.hunt_cfg})
        self.globals['QingDianActiveWin'] = {'openDay': 1, 'totalOpenDay': 3}
        self.globals['CliffordEvent'].update({e: e for e in ('ACTIVE_OPEN_INFO', 'JING_JI_LOGIN_INFO',
                    'JING_JI_RECHARGE_INFO', 'JING_JI_Turn_Info', 'JING_JI_FAN_LI_INFO',
                    'QINGDIAN_LOGIN_STATU', 'QINGDIAN_ACC_RECHARGE_STATU', 'YEAR_ZHUAN_PAN_INFO', 'QINGDIAN_HAO_LI')})
        self.globals['ItemEvent'] = {'USERITEM_COUNT_CHANGE': 'USERITEM_COUNT_CHANGE'}
        self.buttons['qd'] = {'effect': True}
        self.globals['MsgButtonTypes'].update(RIGHT_QING_DIAN='qd', RIGHT_TOP_JING_JI_BTN='jj',
                                              RIGHT_TOP_SHENG_DAN_BTN='christmas')

    def invoke(self, obj, name, args):
        if name == 'jingjiOpen': return self.run_method(6334, obj, args[0])
        if name == 'checkQDShowEffect': return self.run_method(6403, obj)
        if name in ('getjjActiveInfo', 'getjjActiveTurnInfo', 'sendQDActiveInfo'):
            self.requests.append((name, tuple(args))); return None
        if name in ('sendPlat', 'getOldPlayerInfo'): return None
        return reminders.ActivityRemindersTests.invoke(self, obj, name, args)

    def jj_dot(self, event='JING_JI_RECHARGE_INFO'):
        self.run_method(6334, self.nav, {'type': event})
        return self.buttons['jj']['effect']

    def qd_dot(self):
        self.run_method(6403, self.nav)
        return self.buttons['qd']['effect']

    def test_jingji_first_open_requests_rewards_then_replies_do_not_query(self):
        self.run_method(6334, self.nav, {'type': 'ACTIVE_OPEN_INFO'})
        self.assertEqual(self.requests, [('getjjActiveInfo', p) for p in ((0, 1), (0, 3), (6, 1),
                                      (7, 1), (8, 1), (9, 1))] + [('getjjActiveTurnInfo', (1,))])
        self.assertFalse(self.buttons['jj']['effect'])
        self.requests.clear(); self.hong['jingjiLogin'] = 0
        self.assertTrue(self.jj_dot('JING_JI_LOGIN_INFO'))
        self.hong['jingjiLogin'] = 1
        self.assertFalse(self.jj_dot('JING_JI_LOGIN_INFO'))
        self.assertEqual(self.requests, [])
        self.run_method(6334, self.nav, None); self.assertEqual(self.requests, [])

    def test_jingji_login_level_free_turns_and_closed_activity(self):
        for status, level, turns in product((-1, 0, 1), (79, 80), (0, 1)):
            self.hong.update(jingjiLogin=status, JingjiRemainTime=turns); self.role['level'] = level
            self.assertEqual(self.jj_dot(), status == 0 and level >= 80 or turns > 0)
        for field, value in (('activeDay', 0), ('activeNow', 0), ('activeNow', 4)):
            self.hong.update(activeDay=3, activeNow=1); self.hong[field] = value
            self.run_method(6334, self.nav, None); self.assertNotIn('jj', self.buttons)

    def test_jingji_recharge_uses_reward_day_and_received_flags(self):
        for days, flags in product(product(range(4), repeat=2), product(range(2), repeat=6)):
            self.hong.update(jingjiChongzhiDays=list(days), jingjiChongzhiStatu=[list(flags[:3]), list(flags[3:])])
            expected = any(days[t] >= r + 1 and flags[t * 3 + r] == 0 for t in range(2) for r in range(3))
            self.assertEqual(self.jj_dot(), expected)
        self.hong.update(jingjiChongzhiDays=[], jingjiChongzhiStatu=[[0], None])
        self.assertFalse(self.jj_dot())

    def test_jingji_every_material_rebate_boundary_and_claimed_flags(self):
        for tier, key in enumerate(('GemRank', 'PeartRank', 'RingRank', 'MountRank')):
            for index, row in enumerate(self.jj_cfg[key]):
                for count, status in product((row['count'] - 1, row['count']), (0, 1)):
                    self.hong['jingjiFanliUseNum'] = [0] * 4
                    self.hong['jingjiFanliUseNum'][tier] = count
                    self.hong['jingJiFanliGet'] = [[1] * len(self.jj_cfg[k]) for k in
                                                  ('GemRank', 'PeartRank', 'RingRank', 'MountRank')]
                    self.hong['jingJiFanliGet'][tier][index] = status
                    self.assertEqual(self.jj_dot(), count >= row['count'] and status == 0)
        self.hong.update(jingjiFanliUseNum=[999999] * 4, jingJiFanliGet=[None, [], [], []])
        self.assertFalse(self.jj_dot())

    def test_qingdian_retired_purchase_and_unknown_state_do_not_glow(self):
        self.assertFalse(self.qd_dot())
        self.qd.update(isGet2=[0] * 3, loginStatu=[1] * 7, loginDay=7, rechargeDays=[99, 99],
                       rechargeStatu=[[1] * 20] * 2, zpIndex=len(self.qd_cfg['XiaoFeiZhuanPanNew']['0']),
                       curPayNum=99999999, haoli=[1] * len(self.hunt_cfg['hunt_times']), haoliTimes=99999)
        self.items['curPayGold'] = 99999999
        self.assertFalse(self.qd_dot())

    def test_qingdian_login_flags_days_level_and_closed(self):
        for flags in product(range(2), repeat=len(self.qd_cfg['TotalLoginAward'])):
            for day, login, level in product((1, 3, 7), (0, 1, 7), (79, 80)):
                self.globals['QingDianActiveWin'].update(openDay=day, totalOpenDay=7)
                self.qd.update(loginStatu=list(flags), loginDay=login); self.role['level'] = level
                self.assertEqual(self.qd_dot(), level >= 80 and 0 in flags[:min(day, login)])
        self.globals['QingDianActiveWin']['openDay'] = 0; self.assertFalse(self.qd_dot())

    def test_qingdian_recharge_gifts_use_unclaimed_one_and_each_threshold(self):
        for flags in product(range(2), repeat=3):
            for pay in (0, 9999, 10000, 99999, 100000, 499999, 500000):
                self.items['curPayGold'] = pay; self.qd['isGet2'] = list(flags)
                self.assertEqual(self.qd_dot(), any(flags[i] == 1 and pay >= row['needChongzhiYB']
                                                   for i, row in enumerate(self.qd_cfg['ChongZhiGift'])))
        self.qd['isGet2'] = []; self.assertFalse(self.qd_dot())

    def test_qingdian_accumulated_charge_days(self):
        for days, flags in product(product(range(4), repeat=2), product(range(2), repeat=6)):
            self.qd.update(rechargeDays=list(days), rechargeStatu=[list(flags[:3]), list(flags[3:])])
            self.assertEqual(self.qd_dot(), any(days[t] >= r + 1 and flags[t * 3 + r] == 0
                                               for t in range(2) for r in range(3)))
        self.qd.update(rechargeDays=[99, 99], rechargeStatu=[None, []]); self.assertFalse(self.qd_dot())

    def test_qingdian_spin_only_next_unclaimed_tier_for_dynamic_duration(self):
        import math
        cfg = self.qd_cfg['XiaoFeiZhuanPanNew']['0']
        for total in (1, 3, 7):
            self.globals['QingDianActiveWin']['totalOpenDay'] = total
            for index, row in enumerate(cfg):
                need = math.ceil(row['needPay'] * total / 3)
                for pay in (need - 1, need):
                    self.qd.update(zpIndex=index, curPayNum=pay)
                    self.assertFalse(self.qd_dot())
            self.qd.update(zpIndex=len(cfg), curPayNum=999999999); self.assertFalse(self.qd_dot())

    def test_qingdian_retired_collect_never_highlights(self):
        first = self.qd_cfg['QingDianJiZi']['needCollect'][0]
        for counts in product((0, 1), repeat=len(first)):
            self.items['bag'] = {row['id']: counts[i] for i, row in enumerate(first)}
            self.assertFalse(self.qd_dot())
        # Mutate the mock config to exercise quantities >1 and empty groups.
        self.globals['GameData']['qingdianActiveProvider']['cfg'] = dict(self.qd_cfg,
                    QingDianJiZi={'needCollect': [[], [{'id': 5649, 'count': 2}]]})
        for count in (0, 1, 2):
            self.items['bag'] = {5649: count}; self.assertFalse(self.qd_dot())

    def test_qingdian_hunt_every_tier_and_missing_reply(self):
        cfg = [row for key, row in self.hunt_cfg['hunt_times'].items() if key.isdigit()]
        for index, row in enumerate(cfg):
            for times, flag in product((row['times'] - 1, row['times']), (0, 1)):
                self.qd.update(haoliTimes=times, haoli=[1] * len(cfg)); self.qd['haoli'][index] = flag
                self.assertFalse(self.qd_dot())
        self.qd['haoli'] = None; self.assertFalse(self.qd_dot())

    def test_qingdian_initial_queries_and_event_bridge_without_year_button(self):
        self.run_method(6408, self.nav, {'data': 1})
        self.assertEqual(self.requests, [('sendQDActiveInfo', (0, slot)) for slot in (2, 3, 11, 12, 13)])
        self.assertFalse(self.buttons['qd']['effect']); self.requests.clear()
        self.qd.update(loginDay=1, loginStatu=[0])
        self.run_method(6379, self.nav, {'type': 'QINGDIAN_LOGIN_STATU'})
        self.assertTrue(self.buttons['qd']['effect'])
        self.qd['loginStatu'] = [1]
        self.run_method(6379, self.nav, {'type': 'QINGDIAN_LOGIN_STATU'})
        self.assertFalse(self.buttons['qd']['effect']); self.assertEqual(self.requests, [])

    def test_claim_callbacks_listen_and_dispose_symmetrically(self):
        added = []
        for method, listener in ((6333, 13671), (6377, 13672)):
            a, size, _ = self.symbols[False][2][method]; code = self.abc[False][a:a + size]
            expected = [(331, e, 8121) for e in (36044, 36045, 36049, 36051)]
            expected += [(331, e, 8171) for e in (36017, 36018, 36012, 36027)] + [(329, 40723, 8171)]
            for cls, event, handler in expected:
                self.assertIn(call(q(0x60, 1563), listener, prop(q(0x60, cls), event),
                                   prop(get(0), handler), void=True), code)
            added.append(expected)
        self.assertEqual(*added)

    def test_listener_registration_precedes_other_activity_guards(self):
        for method in (6333, 6377):
            a, size, _ = self.symbols[False][2][method]; code = self.abc[False][a:a + size]
            ops = instructions(code)
            registrations = [o.end for o in ops if o.opcode == 0x4f and o.operands[0] in (13671, 13672)]
            # Execute just the unconditional prefix using the real handlers.
            self.listeners.clear()
            self.run_method(method, self.nav, None, end=registrations[8])
            self.assertEqual(len(self.listeners), 9)

    def test_payment_and_level_callbacks_refresh_outside_labor_activity(self):
        for method in (6437, 6357):
            a, size, _ = self.symbols[False][2][method]; code = self.abc[False][a:a + size]
            ops = instructions(code)
            end = next(o.end for o in ops if o.opcode == 0x4f and o.operands == (8200, 0))
            self.qd.update(isGet2=[1, 0, 0]); self.items['curPayGold'] = 10000
            self.hong['jingjiLogin'] = 0; self.role['level'] = 80
            self.run_method(method, self.nav, None, end=end)
            self.assertTrue(self.buttons['qd']['effect']); self.assertTrue(self.buttons['jj']['effect'])
            self.qd['isGet2'] = [0, 0, 0]; self.hong['jingjiLogin'] = 1
            self.run_method(method, self.nav, None, end=end)
            self.assertFalse(self.buttons['qd']['effect']); self.assertFalse(self.buttons['jj']['effect'])

    def test_jingji_initial_login_is_unknown(self):
        self.run_method(2720, self.hong); self.assertEqual(self.hong['jingjiLogin'], -1)

    def test_patch_changes_only_expected_methods_and_resource_bytes(self):
        from patch_mystery_shop_reminder import METHODS as SHOP_METHODS, patch_swf as shop_reminder
        baseline = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        self.assertEqual(current_release(shop_reminder(patch_swf(baseline))), CLIENT.read_bytes())
        patched = patch_swf(baseline)
        self.assertEqual(patch_swf(patched), patched)
        raw, (_, _, a, b) = abc_section(baseline); before, _ = normalize(raw[a:b])
        _, _, old = inspect_abc(before, 'NavTopRightArea'); changed = set()
        for method, (a, size, limits) in old.items():
            b, length, new_limits = self.symbols[False][2][method]
            if before[a:a + size] != self.abc[False][b:b + length] or limits != new_limits: changed.add(method)
        from patch_festival_action_reminders import METHODS as ACTION_METHODS
        self.assertEqual(changed, {5580, 6353, 27339} | ACTION_METHODS | METHODS | SHOP_METHODS | MAIN_METHODS | SPRING_METHODS | RETIRED_METHODS | WANFU_METHODS | HUNT_METHODS | SPRING_DATE_METHODS)


if __name__ == '__main__': unittest.main(verbosity=2)
