"""Verify Spring packet dates, all daily goods and actual purchase routing."""
from __future__ import annotations

import argparse
import copy
from datetime import datetime, timedelta
import math
from pathlib import Path
import subprocess
import sys
import unittest

from patch_activity_entries import q, strings_of
from patch_activity_reminders import normalize
from patch_bag_client import ABCReader
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp, read_pack
from patch_spring_flash_sale import BASELINE, CLIENT, CONFIG, METHODS, ROOT, date_update, elapsed_day, config_start, patch_swf
from test_activity_reminders import config_value, execute

SERVER = ROOT / 'Server/S1001/data'
CONFIG_PATH = 'config/activity/SpringFestivalCfg.lua'


class SpringFlashSaleTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = CLIENT.read_bytes()
        raw, (_, _, start, end) = abc_section(cls.source)
        cls.abc, _ = normalize(raw[start:end])
        cls.names, _, cls.bodies = inspect_abc(cls.abc, 'NewYearWin')
        cls.strings = strings_of(cls.abc)
        cls.config = config_value(read_cbp((ROOT / 'web/v2/lang/zh-cn/SpringFestivalCfg.cbp').read_bytes())[1])

    def setUp(self):
        self.config = copy.deepcopy(type(self).config)
        self.window = {'class': 'NewYearWin'}
        self.manager = {}
        self.today = datetime(2026, 10, 6, 12)
        self.globals = {'NewYearWin': self.window, 'openDay': self.window,
            'GameData': {'newYearDataProvider': {'cfg': self.config}},
            'GlobalData': {'newYearActivityDataMgr': self.manager},
            'MsgButtonTypes': {'Right_Top_NewYear': 84}, '_scopes': [{}, {}]}

    def date(self, value):
        return {'time': value.timestamp() * 1000, 'date': value.day,
                'month': value.month - 1, 'fullYear': value.year}

    def invoke(self, obj, name, args):
        if name == 'getCurrentServerDate':
            return self.date(self.today)
        if name == '__construct__' and obj.get('class') == 'Date':
            return self.date(datetime(int(args[0]), int(args[1]) + 1, int(args[2])))
        if name == 'floor':
            return math.floor(args[0])
        if name.startswith('check'):
            return False
        raise ValueError(name)

    def run_code(self, code, values=None, invoke=None, **kwargs):
        return execute(code, self.names, self.strings, values or {0: {}}, self.globals,
                       invoke or self.invoke, **kwargs)

    def body(self, method):
        start, size, limits = self.bodies[method]
        return self.abc[start:start + size], limits

    def announce(self, start, activity=84):
        end = start + timedelta(days=11)
        self.globals['_scopes'][1] = {2: activity, 8: self.date(start), 9: self.date(end)}
        code, limits = self.body(1272)
        block = date_update()
        self.assertEqual(1, code.count(block))
        offset = code.index(block)
        _, stack = self.run_code(code, start=offset, end=offset + len(block))
        self.assertLessEqual(stack, limits[0])

    def window_day(self):
        expression = q(0x5e, 3346) + elapsed_day(config_start(CONFIG)) + q(0x61, 3346)
        for method in (5903, 5904):
            code, limits = self.body(method)
            self.assertEqual(1, code.count(expression))
            offset = code.index(expression)
            _, stack = self.run_code(code, start=offset, end=offset + len(expression))
            self.assertLessEqual(stack, limits[0])
        return self.window['openDay']

    def test_reproduces_old_fourth_day_display_and_fixes_first_day(self):
        self.config['time'] = [2019, 2, 2, 2019, 2, 13]
        old_day = self.today.day - self.config['time'][2] + 1
        self.assertEqual(5, old_day)
        self.today = datetime(2026, 10, 5, 12)
        old_day = self.today.day - self.config['time'][2] + 1
        self.assertEqual([6372, 6297, 5646], [row['award'][0]['id'] for row in self.config['XianShiQiangGou'][old_day - 1][:3]])
        self.announce(datetime(2026, 10, 5))
        self.assertEqual(1, self.window_day())
        self.assertEqual([7194, 537, 572], [row['award'][0]['id'] for row in self.config['XianShiQiangGou'][0][:3]])

    def test_all_twelve_days_cross_month_year_and_cycle_restart(self):
        for start in (datetime(2026, 10, 6), datetime(2026, 10, 28), datetime(2026, 12, 27)):
            for day in range(1, 13):
                with self.subTest(start=start, day=day):
                    self.today = start + timedelta(days=day - 1, hours=23, minutes=59, seconds=59)
                    self.announce(start)
                    self.assertEqual(day, self.manager['openDay'])
                    self.assertEqual(day, self.window_day())
                    code, limits = self.body(3325)
                    _, stack = self.run_code(code, {0: {'_cfg': self.config}})
                    self.assertLessEqual(stack, limits[0])
            self.today = start + timedelta(days=12)
            self.announce(self.today)
            self.assertEqual(1, self.window_day())

    def test_reminder_includes_twelfth_day_and_rejects_dates_outside_cycle(self):
        start = datetime(2026, 10, 28)
        self.today = start
        self.announce(start)
        code, _ = self.body(3325)
        for day, expected in ((0, -1), (1, 1), (12, 12), (13, -1)):
            self.today = start + timedelta(days=day - 1, hours=12)
            manager = {'_cfg': self.config}
            result, _ = self.run_code(code, {0: manager})
            self.assertFalse(result)
            self.assertEqual(expected, manager['openDay'])

    def test_other_activity_packet_does_not_change_spring_dates(self):
        before = copy.deepcopy(self.config)
        self.announce(datetime(2026, 10, 6), activity=99)
        self.assertEqual(before, self.config)
        self.assertEqual({'class': 'NewYearWin'}, self.window)
        self.assertEqual({}, self.manager)

    def test_all_visible_tiers_send_matching_index_price_and_awards(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute((SERVER / CONFIG_PATH).read_text('utf-8-sig'))
        lua.execute('''var={};given={};charges={};day=1;money=1000000
            is_spring_festival_time=function() return true end
            get_spring_festival_day_count=function() return day end
            register_spring_festival_func=function() end
            register_spring_festival_start_end_func=function() end
            register_spring_festival_login_func=function() end
            register_spring_festival_online_cross_day_func=function() end
            Actor={getStaticVar=function() return var end,sendTipmsg=function() end,
                getName=function() return 'test' end,getIntProperty=function() return 1 end,
                changeMoney=function(actor,kind,amount)
                    if money+amount<0 then return false end
                    money=money+amount;table.insert(charges,amount);return true end}
            Awards={CheckBagGridCount=function() return true end,
                Give=function(actor,award) table.insert(given,award) end}
            System={trace=function() end,sendCommonLog=function() end,broadcastTipmsg=function() end}
            Item={getItemLinkMsg=function() return '' end};LogIds={SpringXianShiQiangGou=1}
        ''')
        lua.execute((SERVER / 'functions/Activity/spring/spring_total.lua').read_text('utf-8-sig'))
        lua.execute('GetSpringXianShibuyInfo=function() end')
        start = datetime(2026, 10, 28)
        for day in range(1, 13):
            self.today = start + timedelta(days=day - 1, hours=12)
            self.announce(start)
            self.window_day()
            lua.execute(f'day={day};var={{}};given={{}};charges={{}};money=1000000')
            flags = [0] * 9
            self.manager['tehuiFlags'] = flags
            requests = []
            self.globals['MiscCC'] = {}
            def invoke(obj, name, args):
                if name == 'setData':
                    visible[args[0]] = args[1]
                elif name == 'indexOf':
                    return next((index for index, value in enumerate(obj) if value is args[0]), -1)
                elif name == 'requestNewYearActivityData':
                    requests.append(args)
                else:
                    return self.invoke(obj, name, args)
            for tier in range(3):
                visible = {}
                code, limits = self.body(17369)
                _, stack = self.run_code(code, {0: {'_itemShowGrid': {}}}, invoke=invoke)
                self.assertLessEqual(stack, limits[0])
                for column in range(3):
                    index = tier * 3 + column
                    row = self.config['XianShiQiangGou'][day - 1][index]
                    self.assertIs(row, visible[column])
                    code, limits = self.body(26308)
                    _, stack = self.run_code(code, {0: {'cfg': row}}, invoke=invoke)
                    self.assertLessEqual(stack, limits[0])
                    self.assertEqual([9, 2, [index + 1]], requests[-1])
                    lua.execute(f'GetSpringXianShiQiangGou(1,{index + 1})')
                    self.assertEqual(-row['needMoney'], lua.globals().charges[index + 1])
                    actual = lua.globals().given[index + 1][1]
                    for field in ('id', 'count', 'bind', 'type'):
                        self.assertEqual(row['award'][0][field], actual[field])
                    lua.execute(f'GetSpringXianShiQiangGou(1,{index + 1})')
                    self.assertEqual(index + 1, lua.eval('#given'))
                    flags[index] = 1

    def test_only_audited_methods_change_and_config_pack_remain_identical(self):
        original = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        from patch_spring_reminders import METHODS as REMINDER_METHODS, PARAMETER_METHODS, patch_swf as spring_reminders
        from patch_open_server_reminders import METHODS as OPENING_METHODS, patch_swf as opening_reminders
        from patch_jingji_material_reminders import METHODS as MATERIAL_METHODS, patch_swf as material_reminders
        from patch_jingji_material_tabs import METHODS as TAB_METHODS, patch_swf as tab_reminders
        self.assertEqual(self.source, tab_reminders(material_reminders(opening_reminders(spring_reminders(patch_swf(original))))))
        self.assertEqual(self.source, patch_swf(self.source))
        raw, (_, _, start, end) = abc_section(original)
        before, _ = normalize(raw[start:end])
        _, _, bodies = inspect_abc(before)
        changed = set()
        for method, (offset, size, limits) in bodies.items():
            new_offset, new_size, new_limits = self.bodies[method]
            if before[offset:offset + size] != self.abc[new_offset:new_offset + new_size] or limits != new_limits:
                changed.add(method)
            if method in METHODS:
                code, _ = self.body(method)
                boundaries = {op.start for op in instructions(code)} | {len(code)}
                reader = ABCReader(self.abc)
                reader.pos = new_offset + new_size
                for _ in range(reader.u30()):
                    row = [reader.u30() for _ in range(5)]
                    self.assertTrue(set(row[:3]) <= boundaries)
        self.assertEqual(METHODS | (REMINDER_METHODS - PARAMETER_METHODS) | OPENING_METHODS | MATERIAL_METHODS | TAB_METHODS, changed)
        for path in ('web/v2/lang/zh-cn/SpringFestivalCfg.cbp', 'web/v2/lang/zh-cn/zh-cn.dat', 'Server/S1001/data/' + CONFIG_PATH):
            self.assertEqual(subprocess.check_output(['git', 'show', BASELINE + ':' + path], cwd=ROOT), (ROOT / path).read_bytes())
        directory = ROOT / 'web/v2/lang/zh-cn'
        self.assertEqual((directory / 'SpringFestivalCfg.cbp').read_bytes(), dict(read_pack((directory / 'zh-cn.dat').read_bytes()))['SpringFestivalCfg.cbp'])


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--lua-path', type=Path)
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
