"""Check Spring Festival activation, first-row routing and shipped reward data."""
from __future__ import annotations

import argparse
from datetime import datetime
from pathlib import Path
import subprocess
import sys
import unittest

from patch_spring_activity_icon import BASELINE, CLIENT, ROOT, ROW_FLAGS, patch_swf
from patch_activity_entries import strings_of
from patch_activity_reminders import normalize
from patch_drop_pickup_retry import abc_section
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp, read_pack
from test_activity_reminders import config_value, execute

SERVER = ROOT / 'Server/S1001/data'


class SpringServerTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.today = datetime(2026, 10, 12, 12)
        g = self.lua.globals()
        g.test_encode = lambda *parts: int(datetime(*map(int, parts)).timestamp())
        g.test_date = lambda: (self.today.year, self.today.month, self.today.day)
        g.test_decode = lambda stamp: tuple(datetime.fromtimestamp(stamp).timetuple()[:6])
        g.test_now = lambda: int(self.today.timestamp())
        g.test_days = lambda *parts: (datetime(*map(int, parts[3:])) - datetime(*map(int, parts[:3]))).days
        g.test_range = lambda *parts: datetime(*map(int, parts[:6])) <= self.today <= datetime(*map(int, parts[6:]))
        self.lua.execute('''state={};dynamic={};icons={};starts=0;ends=0;saves=0;requests=0
            System={getStaticVar=function() return state end,getDyanmicVar=function() return dynamic end,
                getDate=test_date,encodeNumTime=test_encode,GetSystemTimeInMiniTime=test_decode,getTimeDay=test_days,
                getCurrMiniTime=test_now,isInDateRange=test_range,
                getServerOpenTime=function() return 0 end,saveStaticVar=function() saves=saves+1 end}
            print=function() end
            AllActivityButtonState=function(actor,id,open,dates) table.insert(icons,{id=id,open=open,dates=dates}) end
            Actor={sendTipmsg=function() end};DataPack={readByte=function(packet) return packet end}
            LogicCmd={miscSys={sub={cSpringFestivalActivity=1}}}
        ''')
        self.lua.execute((SERVER / 'config/activity/SpringFestivalCfg.lua').read_text('utf-8-sig'))
        self.lua.execute((SERVER / 'functions/Activity/SpringFestivalActivity.lua').read_text('utf-8-sig'))
        self.lua.execute('''register_spring_festival_start_end_func(function(open,restart)
            if open then starts=starts+1 else ends=ends+1 end end)
            register_spring_festival_func(14,function() requests=requests+1 end)''')

    def test_enabled_activity_initializes_current_game_day(self):
        self.lua.execute('ensure_spring_festival_activity(false)')
        self.assertFalse(self.lua.globals().SpringFestivalActivityDisabled)
        self.assertTrue(self.lua.eval('is_spring_festival_time()'))
        self.assertEqual(1, self.lua.eval('get_spring_festival_day_count()'))
        self.assertEqual(int(datetime(2026, 10, 12).timestamp()), self.lua.eval('state.SpringTime'))
        self.assertEqual([2026, 10, 12, 2026, 10, 23], list(self.lua.eval('get_spring_festival_time(false)').values()))

    def test_same_cycle_keeps_rewards_and_does_not_start_twice(self):
        self.lua.execute('ensure_spring_festival_activity(false);state.rewardMarker=123;ensure_spring_festival_activity(false)')
        self.assertEqual(1, self.lua.eval('starts'))
        self.assertEqual(123, self.lua.eval('state.rewardMarker'))
        self.assertEqual(0, self.lua.eval('ends'))

    def test_expired_cycle_renews_after_twelfth_day(self):
        self.lua.execute('ensure_spring_festival_activity(false)')
        self.today = datetime(2026, 10, 23, 23, 59, 59)
        self.assertEqual(12, self.lua.eval('get_spring_festival_day_count()'))
        self.today = datetime(2026, 10, 24)
        self.lua.execute('ensure_spring_festival_activity(false)')
        self.assertEqual(1, self.lua.eval('get_spring_festival_day_count()'))
        self.assertEqual(2, self.lua.eval('starts'))
        self.assertEqual(1, self.lua.eval('ends'))

    def test_login_sends_existing_icon_and_dynamic_dates(self):
        self.lua.execute('ensure_spring_festival_activity(false);on_spring_festival_player_login(1,0)')
        self.assertEqual(84, self.lua.eval('icons[1].id'))
        self.assertEqual(1, self.lua.eval('icons[1].open'))
        self.assertEqual('2026-10-12 2026-10-23', self.lua.eval('icons[1].dates'))

    def test_requests_are_enabled_and_disable_switch_still_closes(self):
        self.lua.execute('''ensure_spring_festival_activity(false);on_msg_spring_festival_activity(1,1,14)
            SpringFestivalActivityDisabled=true;ensure_spring_festival_activity(false)
            on_spring_festival_player_login(1,0);on_msg_spring_festival_activity(1,1,14)''')
        self.assertEqual(1, self.lua.eval('requests'))
        self.assertEqual(0, self.lua.eval('icons[1].open'))
        self.assertIsNone(self.lua.eval('dynamic.start_spring_festival_activity'))


class SpringClientTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = CLIENT.read_bytes()
        raw, (_, _, a, b) = abc_section(cls.source)
        cls.abc, _ = normalize(raw[a:b])
        cls.names, _, cls.bodies = inspect_abc(cls.abc, 'NavTopRightArea')
        a, size, cls.limits = cls.bodies[6440]
        cls.code = cls.abc[a:a + size]
        cls.strings = strings_of(cls.abc)

    def test_only_two_row_flags_change_in_entire_uncompressed_swf(self):
        original = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        self.assertEqual(self.source, patch_swf(original))
        self.assertEqual(self.source, patch_swf(self.source))
        old, (_, _, a, b) = abc_section(original)
        abc, _ = normalize(old[a:b]); _, _, bodies = inspect_abc(abc)
        offset, _, _ = bodies[6440]
        new, _ = abc_section(self.source)
        changed = [i for i, (x, y) in enumerate(zip(old, new, strict=True)) if x != y]
        self.assertEqual([a + offset + p for p in ROW_FLAGS], changed)

    def test_open_and_close_route_to_first_row(self):
        for opened in (True, False):
            with self.subTest(opened=opened):
                calls = []
                globals_ = {'MsgButtonTypes': {'Right_Top_NewYear': 84},
                    'GameNavigateType': {'WIN_NEWYEAR': 243},
                    'ActiveDataMgr': {'ACTIVITY_OPEN': 1},
                    'GlobalData': {'newYearActivityDataMgr': {'openDay': 1}}}
                def invoke(obj, name, args):
                    calls.append((obj, name, args))
                _, stack = execute(self.code, self.names, self.strings,
                    {0: {'notUseful': False, '_isInitBtn': False}, 1: 84, 2: int(opened)},
                    globals_, invoke, start=288)
                routed = [(obj['class'], name) for obj, name, _ in calls if name in ('addBtn2', 'delBtn')]
                self.assertEqual([('NavTopBtnPanel2', 'addBtn2' if opened else 'delBtn')], routed)
                self.assertLessEqual(stack, self.limits[0])
                if opened:
                    self.assertIn('requestNewYearActivityData', [name for _, name, _ in calls])

    def test_deferred_level_opening_uses_same_first_row(self):
        values = {0: {}}
        _, stack = execute(self.code, self.names, self.strings, values,
            {'MsgButtonTypes': {'Right_Top_NewYear': 84}, 'GameNavigateType': {'WIN_NEWYEAR': 243}},
            lambda *_: None, start=143, end=181)
        self.assertTrue(values[6]['isUp'])
        self.assertEqual(84, values[6]['type'])
        self.assertLessEqual(stack, self.limits[0])

    def test_shipped_spring_rewards_match_server_and_pack(self):
        path = ROOT / 'web/v2/lang/zh-cn/SpringFestivalCfg.cbp'
        source = path.read_bytes()
        self.assertEqual(source, dict(read_pack(path.with_name('zh-cn.dat').read_bytes()))[path.name])
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute((SERVER / 'config/activity/SpringFestivalCfg.lua').read_text('utf-8-sig'))
        checked = []
        def verify(value, expected, key=''):
            if isinstance(value, list):
                for i, child in enumerate(value, 1): verify(child, expected[i], str(i))
            elif isinstance(value, dict):
                for k, child in value.items():
                    if k in ('id','count','bind','type','needPay','needCount','times','ybmin','ybmax','itemID','itemId') or isinstance(child, (dict, list)):
                        verify(child, expected[k], k)
            else:
                self.assertEqual(value, expected, key); checked.append(key)
        verify(config_value(read_cbp(source)[1]), lua.globals().SpringFestivalCfg)
        self.assertGreater(len(checked), 2000)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(); parser.add_argument('--lua-path', type=Path); args = parser.parse_args()
    if args.lua_path: sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
