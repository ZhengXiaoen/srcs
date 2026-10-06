"""Test server material replies through shipped entry, badge and claim bytecode."""
from __future__ import annotations

from itertools import product
import subprocess
import sys
import unittest

from patch_activity_entries import q, strings_of
from patch_activity_reminders import CLIENT, ROOT, call, get, normalize, prop
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp, read_pack
from patch_jingji_material_reminders import BASELINE, METHODS, patch_swf
from test_activity_reminders import config_value, execute

KEYS = ('GemRank', 'PeartRank', 'RingRank', 'MountRank')
CONFIG = 'Server/S1001/data/config/new_activity/festival/activity_jingji.lua'
SERVER = 'Server/S1001/data/functions/new_activity/festival/ActivityRankFunc.lua'


class JingjiMaterialReminderTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = CLIENT.read_bytes()
        raw, (_, _, a, b) = abc_section(cls.source); cls.abc, _ = normalize(raw[a:b])
        cls.names, _, cls.bodies = inspect_abc(cls.abc); cls.strings = strings_of(cls.abc)
        cls.cfg = config_value(read_cbp((ROOT / 'web/v2/lang/zh-cn/activityjingji.cbp').read_bytes())[1])

    def setUp(self):
        self.mgr = dict(activeType=2, activeDay=3, activeNow=1, jingjiLogin=-1,
                        jingjiChongzhiDays=[], jingjiChongzhiStatu=[], JingjiRemainTime=0,
                        jingjiFanliUseNum=[0] * 4, jingJiFanliGet=[[1] * 5 for _ in KEYS],
                        jingjiBigSale=[0] * 12, jingjiFashionWeapenGet=[0] * 10)
        self.entry = {'effect': False}; self.win = {'_icon': [{'visible': False} for _ in range(6)]}
        self.calls = []; self.requests = []; self.events = []; self.packet = []
        self.globals = {'GlobalData': {'cliffordDataMgr': self.mgr, 'role': {'level': 80}},
                        'GameData': {'jingji2Provider': {'cfg': self.cfg}},
                        'MsgButtonTypes': {'RIGHT_TOP_JING_JI_BTN': 'jj', 'RIGHT_TOP_SHENG_DAN_BTN': 'christmas'},
                        'CliffordEvent': {'JING_JI_FAN_LI_INFO': 'material', 'ACTIVE_OPEN_INFO': 'open'}}

    def invoke(self, obj, name, args):
        self.calls.append(name)
        if name == 'getCfg': return obj['cfg']
        if name == 'getBtn': return self.entry
        if name == 'setEffect': obj['effect'] = args[0]; return
        if name == 'delBtn': self.entry = None; return
        if name == 'getjjActiveInfo': self.requests.append(args); return
        if name == 'getjjActiveTurnInfo': self.requests.append(args); return
        if name in ('readByte', 'readInt'): return self.packet.pop(0)
        if name == '__construct__': return {'type': args[0], 'data': args[1] if len(args) > 1 else None}
        if name == 'dispatchEvent':
            self.events.append(args[0]); self.run_code(6334, {}, args[0]); self.run_code(5579, self.win, args[0]); return
        if name == 'getOtherPng': return args[0]
        raise ValueError((name, args))

    def run_code(self, mid, obj=None, arg=None, start=0, end=None, extra=None):
        a, size, limits = self.bodies[mid]
        result, maximum = execute(self.abc[a:a + size], self.names, self.strings,
                                  {0: obj or {}, 1: arg, **(extra or {})}, self.globals, self.invoke, start, end)
        self.assertLessEqual(maximum, limits[0], mid)
        return result

    def refresh(self):
        self.run_code(6334, {}, {'type': 'material'}); self.run_code(5579, self.win)
        return self.entry['effect'], self.win['_icon'][4]['visible']

    def test_every_material_tier_and_claim_state_matches_visible_claim_button(self):
        for tier, key in enumerate(KEYS):
            for index, row in enumerate(self.cfg[key]):
                for count, status in product((row['count'] - 1, row['count'], row['count'] + 1), (0, 1)):
                    self.mgr['jingjiFanliUseNum'] = [0] * 4; self.mgr['jingjiFanliUseNum'][tier] = count
                    self.mgr['jingJiFanliGet'] = [[1] * 5 for _ in KEYS]
                    self.mgr['jingJiFanliGet'][tier][index] = status
                    expected = count >= row['count'] and status == 0
                    self.assertEqual((expected, expected), self.refresh(), (key, index, count, status))
                    item = {'_title': tier, '_index': index, '_button2_0': {}, '_image_9': {}}
                    self.run_code(25436, item, start=90, end=277, extra={2: row})
                    self.assertEqual(expected, item['_button2_0']['visible'])

    def test_received_and_missing_flags_do_not_create_a_reminder(self):
        for flags in ([[], [], [], []], [None, None, None, None], [[1] * 5 for _ in KEYS]):
            self.mgr.update(jingjiFanliUseNum=[999999] * 4, jingJiFanliGet=flags)
            self.win['_icon'][4]['visible'] = True
            self.assertEqual((False, False), self.refresh())
        # Unknown top-level state must also clear an old native mark.
        for field in ('jingjiFanliUseNum', 'jingJiFanliGet'):
            original = self.mgr[field]; self.mgr[field] = None
            self.run_code(5579, self.win); self.assertFalse(self.win['_icon'][4]['visible'])
            self.mgr[field] = original

    def test_claim_one_reward_keeps_reminder_until_all_available_rewards_are_claimed(self):
        self.mgr['jingjiFanliUseNum'] = [999999] * 4
        self.mgr['jingJiFanliGet'] = [[0] * 5 for _ in KEYS]
        self.assertEqual((True, True), self.refresh())
        for tier, index in product(range(4), range(5)):
            self.mgr['jingJiFanliGet'][tier][index] = 1
            remaining = not (tier == 3 and index == 4)
            self.assertEqual((remaining, remaining), self.refresh())

    def test_purchase_states_do_not_set_material_or_entry_reminders(self):
        for sale, weapon in product((0, 1), repeat=2):
            self.mgr.update(jingjiBigSale=[sale] * 12, jingjiFashionWeapenGet=[weapon] * 10)
            self.assertEqual((False, False), self.refresh())
            self.run_code(5580, self.win); self.assertFalse(self.win['_icon'][3]['visible'])

    def test_activity_end_clears_native_material_mark(self):
        self.mgr.update(jingjiFanliUseNum=[999999] * 4, jingJiFanliGet=[[0] * 5 for _ in KEYS])
        for field, value in (('activeType', 1), ('activeType', 0), ('activeNow', 0), ('activeNow', 4)):
            original = self.mgr[field]; self.mgr[field] = value; self.win['_icon'][4]['visible'] = True
            self.run_code(5579, self.win); self.assertFalse(self.win['_icon'][4]['visible'])
            self.mgr[field] = original

    def test_server_packets_refresh_entry_and_native_mark_and_clear_after_real_claim(self):
        from lupa.lua51 import LuaRuntime
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''
            state={JingJi_Data={}}; packets={}; given=0
            Actor={getStaticVar=function() return state end,sendTipmsg=function() end,getName=function() return 'test' end}
            LogicCmd={miscSysEx={sub={sJingJI_Acts=1}}};LogIds={JingJiActivity=1}
            ttFlyTip=1;ttChatWindow=2;System={broadcastTipmsg=function() end}
            Awards={CheckBagGridCount=function() return true end,Give=function() given=given+1 end}
            function GetJingjiActivityType() return 2 end
            DataPack={allocPacket=function() return {} end,
              writeByte=function(p,v) p[#p+1]=v end,writeInt=function(p,v) p[#p+1]=v end,
              readByte=function(p) return p.index end,flush=function(p) packets[#packets+1]=p end}
        ''')
        lua.execute((ROOT / CONFIG).read_text('utf-8-sig')); lua.execute((ROOT / SERVER).read_text('utf-8-sig'))
        for msg, tier in ((6, 0), (7, 1), (8, 3), (9, 2)):
            threshold = self.cfg[KEYS[tier]][0]['count']
            lua.globals().state.JingJi_Data[msg] = lua.table_from({'count': threshold})
            lua.globals().MiscHandleGetNewRankInfo(1, msg, 1, None)
            packet = lua.globals().packets[len(lua.globals().packets)]
            self.packet = [packet[i] for i in range(1, len(packet) + 1)]
            self.run_code(8611, {}, {})
            self.assertEqual([], self.packet); self.assertEqual(msg, self.events[-1]['data'])
            self.assertTrue(self.entry['effect']); self.assertTrue(self.win['_icon'][4]['visible'])
            self.assertEqual(threshold, self.mgr['jingjiFanliUseNum'][tier])
            lua.globals().MiscHandleGetNewRankInfo(1, msg, 2, lua.table_from({'index': 1}))
            packet = lua.globals().packets[len(lua.globals().packets)]
            self.packet = [packet[i] for i in range(1, len(packet) + 1)]
            self.run_code(8611, {}, {})
            self.assertFalse(self.entry['effect']); self.assertFalse(self.win['_icon'][4]['visible'])
        self.assertEqual(4, lua.globals().given); self.assertEqual([], self.requests)

    def test_reward_config_ids_counts_and_pack_match_server(self):
        from lupa.lua51 import LuaRuntime
        lua = LuaRuntime(); lua.execute((ROOT / CONFIG).read_text('utf-8-sig'))
        for key in KEYS:
            for index, row in enumerate(self.cfg[key], 1):
                server = lua.globals().activity_jingji[key][index]
                self.assertEqual(row['count'], server['count'])
                for slot, reward in enumerate(row['award'], 1):
                    self.assertEqual(reward, {k: v for k, v in server['award'][slot].items()})
        directory = ROOT / 'web/v2/lang/zh-cn'
        self.assertEqual((directory / 'activityjingji.cbp').read_bytes(),
                         dict(read_pack((directory / 'zh-cn.dat').read_bytes()))['activityjingji.cbp'])

    def test_resource_scope_and_existing_event_listeners(self):
        source = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        self.assertEqual(self.source, patch_swf(source)); self.assertEqual(self.source, patch_swf(self.source))
        raw, (_, _, a, b) = abc_section(source); before, _ = normalize(raw[a:b]); _, _, old = inspect_abc(before)
        changed = set()
        for mid, (a, size, limits) in old.items():
            b, length, after_limits = self.bodies[mid]
            if before[a:a + size] != self.abc[b:b + length] or limits != after_limits: changed.add(mid)
        self.assertEqual(METHODS, changed); self.assertEqual(strings_of(before), self.strings)
        for mid, listener, handler in ((6333, 13671, 8121), (6377, 13672, 8121),
                                       (5570, 13671, 6766), (5571, 13672, 6766)):
            a, size, _ = self.bodies[mid]
            self.assertIn(call(q(0x60, 1563), listener, prop(q(0x60, 331), 36051),
                               prop(get(0), handler), void=True), self.abc[a:a + size])
        a, size, limits = self.bodies[5579]; code = self.abc[a:a + size]
        for op in instructions(code):
            if op.opcode in (0x62, 0x63, 0xc2): self.assertLess(op.operands[0], limits[1])
            for _, target, _ in op.branches:
                if target <= op.start: self.assertEqual(0x09, code[target])
        for path in (CONFIG, SERVER, 'web/v2/lang/zh-cn/activityjingji.cbp', 'web/v2/lang/zh-cn/zh-cn.dat'):
            self.assertEqual(subprocess.check_output(['git', 'show', BASELINE + ':' + path], cwd=ROOT),
                             (ROOT / path).read_bytes(), path)


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(); parser.add_argument('--lua-path'); args = parser.parse_args()
    if args.lua_path: sys.path.insert(0, args.lua_path)
    unittest.main(argv=[sys.argv[0]], verbosity=2)
