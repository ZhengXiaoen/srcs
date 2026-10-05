"""Execute shipped window bytecode with synchronous UI events and real rewards."""
from __future__ import annotations

import copy
import hashlib
from pathlib import Path
import subprocess
import sys
import unittest

from patch_activity_entries import strings_of
from patch_activity_reminders import CLIENT, ROOT, normalize
from patch_activity_window_lifecycle import BASELINE, MODULE, ORIGINAL_MODULE, patch_swf
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp, read_pack
from test_activity_reminders import config_value, execute


class Selection(dict):
    def __init__(self, owner):
        super().__init__(dataProvider=[], selectedIndex=-1, selectedData=None)
        self.owner = owner

    def __setitem__(self, key, value):
        super().__setitem__(key, value)
        if key in ('dataProvider', 'selectedIndex'):
            data, index = self['dataProvider'], self['selectedIndex']
            super().__setitem__('selectedData', data[index] if 0 <= index < len(data) else None)
            self.owner.emit(self, 'change')


class WindowLifecycleTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.sources = [CLIENT.read_bytes(), MODULE.read_bytes()]
        cls.modules = []
        for source in cls.sources:
            raw, (_, _, a, b) = abc_section(source); abc, _ = normalize(raw[a:b])
            names, _, bodies = inspect_abc(abc)
            cls.modules.append((abc, names, bodies, strings_of(abc)))
        cls.cfg = config_value(read_cbp((ROOT / 'web/v2/lang/zh-cn/longtengzhuanpancfg.cbp').read_bytes())[1])

    def setUp(self):
        self.listeners = []; self.pages = []; self.requests = []; self.events = []
        self.visible = set(range(11)); self.dispatcher = {'class': 'dispatcher'}
        self.activities = [464, 434, 1037, 1038, 1039, 996, 1040, 1041, 1042, 1043, 1044]
        self.mgr = {'index': 0, 'pos': 0, 'remainTime': 1, 'items': [], 'hasGet': [0] * 50, 'hasAward': 0}
        self.globals = {'ACTIVITYS': self.activities, 'DAY_CHANGE': False,
            'Event': {'CHANGE': 'change'}, 'DataEventDispatcher': self.dispatcher,
            'DaJiDaLiEvent': {'OPEN_DAY': 'day', 'STATU_CHANGE': 'state'},
            'CliffordEvent': {k: k for k in ('LONGTENG_TURN_INFO', 'LONGTENG_TURNING_INFO', 'LONGTENG_REMAIN_TIME', 'SHILIAN_DAY')},
            'OtherEvent': {'GameCurPayGoldChange': 'pay'}, 'TimerEvent': {'TIMER': 'timer'}, 'MouseEvent': {'CLICK': 'click'},
            'GameData': {'daJiDaLiDataProvider': {}, 'longTengTurnProvider': {'cfg': self.cfg}},
            'GlobalData': {'dajidaliDataMgr': {'openDay': 1}, 'longTengTurnMgr': self.mgr,
                           'itemDataMgr': {'curPayGold': 0, 'bagItems': []}, 'role': {'bagGridCount': 20}}}

    def run_code(self, mid, obj, arg=None, module=False):
        abc, names, bodies, strings = self.modules[module]; start, size, limits = bodies[mid]
        code = abc[start:start + size]
        for op in instructions(code):
            if 0xd0 <= op.opcode <= 0xd7: self.assertLess((op.opcode - 0xd0) % 4, limits[1])
            if op.opcode in (0x62, 0x63, 0x08, 0xc2): self.assertLess(op.operands[0], limits[1])
        value, maximum = execute(code, names, strings, {0: obj, 1: arg}, self.globals, self.invoke)
        self.assertLessEqual(maximum, limits[0], mid)
        return value

    def emit(self, obj, event):
        for target, type_, callback in list(self.listeners):
            if target is obj and type_ == event: self.invoke(callback[2], callback[1], [None])

    def invoke(self, obj, name, args):
        ids = {'onDayChange': 22111, 'onChange': 22110, 'createPage': 22112, 'onStateChange': 22109}
        if name in ids: return self.run_code(ids[name], obj, args[0] if args else None)
        if name in ('updateAwards', 'updateLabels') and '_timer' in obj:
            return self.run_code({'updateAwards': 12, 'updateLabels': 15}[name], obj, module=True)
        if name in ('addEventListener', 'removeEventListener'):
            row = (obj, args[0], args[1])
            if name == 'addEventListener':
                if not any(t is obj and e == args[0] and c == args[1] for t, e, c in self.listeners): self.listeners.append(row)
            else: self.listeners[:] = [(t, e, c) for t, e, c in self.listeners if not (t is obj and e == args[0] and c == args[1])]
            return
        if name == 'checkActivityOpen': return args[0] in self.visible
        if name == 'indexOf': return obj.index(args[0]) if args[0] in obj else -1
        if name == 'push': obj.append(args[0]); return len(obj)
        if name == 'setTimeout': self.requests.append(args[2:]); return
        if name == '__construct__':
            if 'class' not in obj: return {'type': args[0] if args else None}
            if obj['class'] == 'page':
                value = {'class': 'page', 'visible': True, 'parent': None, 'init': 0, 'remove': 0, 'updates': 0}
                self.pages.append(value); return value
            return {'class': obj['class'], 'type': args[0] if args else None}
        if name in ('initEvent', 'removeEvent', 'update'):
            key = {'initEvent': 'init', 'removeEvent': 'remove', 'update': 'updates'}[name]
            obj[key] += 1; return
        if name == 'addChild': obj['children'].append(args[0]); args[0]['parent'] = obj; return
        if name == 'removeChild':
            obj['children'][:] = [v for v in obj['children'] if v is not args[0]]; args[0]['parent'] = None; return
        if name == 'move': obj['move'] = args; return
        if name == 'doLongTengInfo': self.requests.append(args[0]); return
        if name in ('start', 'stop'): obj['running'] = name == 'start'; return
        if name == 'charAt': return obj[args[0]]
        if name == 'int': return int(args[0])
        if name == 'setData': obj['data'] = copy.deepcopy(args[1]); return
        if name == 'clear': obj.pop('data', None); return
        if name == 'doFlyTipMsg': self.events.append(args[0]); return
        if name in ('readByte', 'readInt'): return obj['values'].pop(0)
        if name == 'getBitsValue': return ((args[0] & 0xffffffff) | ((args[3] & 0xffffffff) << 32)) >> args[1] & 1
        if name == 'dispatchEvent': self.events.append(args[0]['type']); return
        raise ValueError((name, obj, args))

    def window(self):
        return {'_list': Selection(self), '_pageCtrl': [], '_cIndex': -1, 'children': [],
                'PAGES': [{'class': 'page'} if i != 4 else None for i in range(11)]}

    def assert_active(self, window, expected):
        shown = [v for v in window['children'] if v['visible']]
        self.assertEqual(1 if expected >= 0 else 0, len(shown)); self.assertEqual(expected, window['_cIndex'])
        if expected >= 0: self.assertIs(shown[0], window['_pageCtrl'][expected]); self.assertEqual(1, shown[0]['init'])

    def test_new_instances_and_twenty_reopens_initialize_exactly_one_page(self):
        for _ in range(3):
            window = self.window()
            for _ in range(20):
                self.run_code(22107, window); self.assert_active(window, 0)
                self.assertEqual(3, len(self.listeners))
                self.run_code(22108, window)
                self.assertEqual([], window['children']); self.assertEqual([], self.listeners)
            self.assertTrue(all(p['init'] == p['remove'] == 1 for p in self.pages))

    def test_reselection_state_refresh_switching_and_day_rebuild(self):
        window = self.window(); self.run_code(22107, window)
        for index in (0, 1, 1, 8, 8, 0, 10):
            window['_list']['selectedIndex'] = index - (1 if index > 4 else 0)
            self.assert_active(window, index); self.run_code(22109, window); self.assert_active(window, index)
        old = list(window['children']); self.run_code(22111, window); self.assert_active(window, 10)
        self.assertTrue(all(v['remove'] == 1 and v['parent'] is None for v in old))
        self.visible = {0, 1}; self.run_code(22111, window); self.assert_active(window, 0)

    def test_empty_list_retired_purchase_and_invalid_selection_are_safe(self):
        for allowed in (set(), {4}, set(range(11))):
            self.visible = allowed; window = self.window(); self.run_code(22107, window)
            self.assertNotIn(self.activities[4], window['_list']['dataProvider'])
            self.assert_active(window, 0 if 0 in allowed else -1)
            window['_list']['selectedIndex'] = 999; self.assert_active(window, -1)
            self.assertIsNone(self.run_code(22112, window)); self.run_code(22108, window)

    def dragon(self):
        return {'btn': {'enabled': True}, '_timer': {'running': True}, '_timer1': {'running': True},
            '_posEff': {}, '_isInfoBack': True, '_totalTime': 9999, '_currPos': 0,
            '_grids': [{} for _ in range(50)], '_hasGetImgs': [{} for _ in range(50)],
            '_label_0': {}, '_label_1': {}, '_label_2': {}, '_label_3': {}, '_maxImg': {},
            '_award1': {}, '_award2': {}, 'posX': list(range(50)), 'posY': list(range(50))}

    def test_dragon_open_close_cleans_timers_and_recovers_pending_award(self):
        window = self.dragon()
        for _ in range(20):
            self.run_code(7, window, module=True)
            self.assertEqual([3, 1], self.requests[-2:]); self.assertFalse(window['btn']['enabled'])
            self.assertFalse(window['_isInfoBack']); self.assertEqual(0, window['_totalTime'])
            self.assertEqual(8, len(self.listeners))
            self.run_code(8, window, module=True)
            self.assertEqual([], self.listeners)
            self.assertTrue(all(not window[k]['running'] for k in ('_timer', '_timer1', '_posEff')))

    def test_dragon_spins_wait_for_new_reply_and_reject_finished_board(self):
        window = self.dragon(); self.run_code(16, window, module=True)
        self.assertEqual([2], self.requests); self.assertFalse(window['_isInfoBack'])
        self.assertFalse(window['btn']['enabled']); self.assertTrue(window['_timer']['running'])
        self.run_code(16, window, module=True); self.assertEqual([2], self.requests)
        window['btn']['enabled'] = True; self.mgr['pos'] = 49
        self.run_code(16, window, module=True); self.assertEqual([2], self.requests)

    def test_all_four_layouts_render_received_items_and_claim_marks(self):
        for index, positions in enumerate(self.cfg['posList']):
            slots = [i for i, v in enumerate(positions) if v == '1']
            for choice in (1, 'last'):
                libraries = [0 if i == 1 else 1 if i <= 24 else 2 if i <= 48 else 3 for i in slots]
                self.mgr.update(index=index, pos=0, items=[1 if choice == 1 else len(self.cfg['itemList'][lib]) for lib in libraries],
                                hasGet=[int(i in slots and i % 2) for i in range(50)])
                window = self.dragon(); self.run_code(17, window, module=True)
                self.assertTrue(window['btn']['enabled'])
                for offset, lib in zip(slots, libraries):
                    row = self.cfg['itemList'][lib][0 if choice == 1 else -1]
                    award = window['_grids'][offset]['data']
                    self.assertEqual(row[:3], [award['id'], award['count'], award['bind']])
                    self.assertEqual(bool(self.mgr['hasGet'][offset]), window['_hasGetImgs'][offset]['visible'])

    def test_packet_reader_handles_full_spin_remaining_and_high_claim_bits(self):
        packet = {'values': [1, 4, 9, 26, 3, 1, 2, 3, 2, 1 << 17]}
        self.run_code(8635, {}, packet)
        self.assertEqual([], packet['values']); self.assertEqual((3, 9, 25), tuple(self.mgr[k] for k in ('index', 'remainTime', 'pos')))
        self.assertEqual([1, 2, 3], self.mgr['items']); self.assertEqual(1, self.mgr['hasGet'][49])
        self.run_code(8635, {}, {'values': [2, 8, 50, 1]}); self.assertEqual((8, 49, 1), tuple(self.mgr[k] for k in ('remainTime', 'pos', 'hasAward')))
        self.run_code(8635, {}, {'values': [3, 7]}); self.assertEqual(7, self.mgr['remainTime'])
        self.assertEqual(['LONGTENG_TURN_INFO', 'LONGTENG_TURNING_INFO', 'LONGTENG_REMAIN_TIME'], self.events)

    def test_patch_is_reproducible_scoped_and_module_route_exists(self):
        original = subprocess.check_output(['git', 'show', f'{BASELINE}:web/GameFrame.swf'], cwd=ROOT)
        self.assertEqual(self.sources[0], patch_swf(original))
        self.assertEqual(self.sources[1], patch_swf(ORIGINAL_MODULE.read_bytes(), True))
        self.assertEqual('3600b87d72321bf34e936de23df08b1f3bf493c5321b6bd0d9fa466e3da0ae76', hashlib.sha256(ORIGINAL_MODULE.read_bytes()).hexdigest())
        for module, source in enumerate(self.sources): self.assertEqual(source, patch_swf(source, bool(module)))
        abc, names, bodies, strings = self.modules[0]; start, size, _ = bodies[482]
        self.assertTrue(any(o.opcode == 0x2c and strings[o.operands[0]] == 'longtengturns' for o in instructions(abc[start:start + size])))
        self.assertTrue(MODULE.is_file())

    def test_server_reward_tables_match_packed_client_exactly(self):
        sys.path.insert(0, str(Path.home() / 'AppData/Local/Temp/codex-lupa'))
        from lupa.lua51 import LuaRuntime
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute((ROOT / 'Server/S1001/data/config/modules/LongTengZhuanPanCfg.lua').read_text('utf-8-sig'))
        def plain(table):
            if hasattr(table, 'items'): return [plain(table[i]) for i in range(1, len(table) + 1)]
            return table
        for key in ('posList', 'itemList', 'payGiveTimes'): self.assertEqual(plain(lua.globals().LongTengZhuanPanCfg[key]), self.cfg[key], key)
        directory = ROOT / 'web/v2/lang/zh-cn'
        self.assertEqual((directory / 'longtengzhuanpancfg.cbp').read_bytes(),
                         dict(read_pack((directory / 'zh-cn.dat').read_bytes()))['longtengzhuanpancfg.cbp'])

    def test_original_graphics_effects_and_button_states_are_present(self):
        base = ROOT / 'web/v2/lang/zh-cn'
        paths = [base / f'interface/otherpng/{i:05}.png' for i in (2360, 2361, 2362, 2363)]
        paths += [base / 'interface/text/00623.png']
        paths += [base / f'interface/btn/{state}/01247.png' for state in ('btnup', 'btnover', 'btndown')]
        paths += [base / f'effect/{i:05}.sr' for i in (622, 640)]
        for path in paths: self.assertGreater(path.stat().st_size, 0, str(path))

    def test_real_server_open_claim_recovery_and_board_reply(self):
        sys.path.insert(0, str(Path.home() / 'AppData/Local/Temp/codex-lupa'))
        from lupa.lua51 import LuaRuntime
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''
            state={days={PeyNum=3000},LongTengZhuanPanAwardData=257}; given=0;packets={}
            PROP_ACTOR_CIRCLE=1;PROP_ENTITY_ID=2;ttFlyTip=1;ttScreenCenter=2;ttChatWindow=4
            LogicCmd={miscSysEx={sub={sLongTengZhuanPan=90}}};LogIds={LongTengZhuanPanAward=1}
            Actor={getStaticVar=function() return state end,getIntProperty=function() return 3 end,
                getName=function() return 'test' end,sendTipmsg=function() end}
            System={getRandomNumber=function() return 0 end,broadcastTipmsg=function() end,
                getInt64Byte=function(v,i) return math.floor(v/256^i)%256 end,
                setInt64Byte=function(v,i,n) return v+(n-math.floor(v/256^i)%256)*256^i end}
            Item={getBagEmptyGridCount=function() return 10 end,getItemName=function() return 'reward' end}
            Awards={Give=function(_,award) given=given+1;lastAward=award[1] end}
            DataPack={readByte=function(p) return p.msg end,allocPacket=function() return {} end,
                writeByte=function(p,v) p[#p+1]=v end,
                writeUint64=function(p,v) p[#p+1]=v%2^32;p[#p+1]=math.floor(v/2^32) end,
                flush=function(p) packets[#packets+1]=p end}
        ''')
        lua.execute((ROOT / 'Server/S1001/data/config/modules/LongTengZhuanPanCfg.lua').read_text('utf-8-sig'))
        lua.execute((ROOT / 'Server/S1001/data/functions/modules/LongTengZhuanPan.lua').read_text('utf-8-sig'))
        for msg in (3, 3, 1): lua.globals().LongTengZhuanPanMain(1, 151, lua.table_from({'msg': msg}))
        self.assertEqual(1, lua.globals().given); self.assertIsNone(lua.globals().state.LongTengZhuanPanAwardData)
        reward = self.cfg['itemList'][0][0]
        self.assertEqual(reward[:3], [lua.globals().lastAward[k] for k in ('id', 'count', 'bind')])
        packet = lua.globals().packets[1]; values = [packet[i] for i in range(1, len(packet) + 1)]
        self.run_code(8635, {}, {'values': values}); self.assertEqual([], values)
        self.assertEqual((0, 1, 0), tuple(self.mgr[k] for k in ('index', 'remainTime', 'pos')))
        window = self.dragon(); self.run_code(17, window, module=True)
        self.assertEqual(reward[:3], [window['_grids'][1]['data'][k] for k in ('id', 'count', 'bind')])


if __name__ == '__main__': unittest.main()
