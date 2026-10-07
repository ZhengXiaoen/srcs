"""Exercise shipped icon bytecode and actual Lua claim/next-day state replies."""
from __future__ import annotations

import subprocess
import sys
import unittest

from patch_activity_reminders import CLIENT, ROOT, normalize
from patch_activity_entries import strings_of
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_daily_activity_icons import METHODS, patch_swf
from test_activity_reminders import execute

BASELINE = 'fb777e5'


class DailyIconsTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        raw, (_, _, a, b) = abc_section(CLIENT.read_bytes())
        cls.abc, _ = normalize(raw[a:b])
        cls.names, _, cls.bodies = inspect_abc(cls.abc)
        cls.strings = strings_of(cls.abc)

    def setUp(self):
        self.buttons = {}; self.requests = []; self.listeners = []
        self.nav = {'onOpenWin': {}, '_isInitBtn': True}
        self.mgr = {'pos': 0, 'remainTime': 0, 'hasAward': 0}
        self.national = {'guoQingDay': 1, 'guoQingSign': [0] * 14}
        self.dispatcher = {}
        self.globals = {'GlobalData': {'role': {'level': 80, 'actorCircle': 3},
                                      'cliffordDataMgr': self.national, 'longTengTurnMgr': self.mgr},
                        'NavTopBtnPanel2': {'_instance': {}}, 'MsgButtonTypes': {
                            'RIGHT_TOP_GUO_QING_BTN': 88, 'RIGHT_TOP_LONG_TENG_TURN_BTN': 77},
                        'DataEventDispatcher': self.dispatcher,
                        'CliffordEvent': {'LONGTENG_REMAIN_TIME': 'icon', 'LONGTENG_TURNING_INFO': 'spin',
                                         'LONGTENG_TURN_INFO': 'board'}}
        self.listeners.append((self.dispatcher, 'icon', ('method', 'onServiceWarCan', self.nav)))

    def run_code(self, mid, obj=None, arg=None, start=0, end=None, locals_=None):
        a, b, limits = self.bodies[mid]; code = self.abc[a:a + b]
        for o in instructions(code):
            if o.opcode in (0x62, 0x63, 0xc2): self.assertLess(o.operands[0], limits[1])
        result, maximum = execute(code, self.names, self.strings,
                                  locals_ or {0: self.nav if obj is None else obj, 1: arg},
                                  self.globals, self.invoke, start=start, end=end)
        self.assertLessEqual(maximum, limits[0]); return result

    def invoke(self, obj, name, args):
        if name == 'checkAddBtn':
            a, b, _ = self.bodies[6497]; code = self.abc[a:a + b]
            marker = next(o.start for o in instructions(code) if o.opcode == 0x66 and o.operands[0] == 38327)
            start = 190
            end = next(o.start for o in instructions(code) if o.opcode == 0x10 and o.start > marker)
            self.run_code(6497, start=start, end=end, locals_={0: obj, 4: args[1]}); return
        if name == 'updateGuoQingDay': return self.run_code(6381, obj)
        if name == 'onServiceWarCan': return self.run_code(6496, obj, args[0])
        if name in ('getBtnByType', 'getPaneBtn2ByType'): return self.buttons.get(args[0])
        if name == 'addBtn2': self.buttons.setdefault(args[0], {'effect': False}); return
        if name == 'delBtn': self.buttons.pop(args[0], None); return
        if name == 'setEffect': obj['effect'] = args[0]; return
        if name == 'getEffect': return {}
        if name == 'doLongTengInfo': self.requests.append(args[0]); return
        if name in ('readByte', 'readInt'): return obj['values'].pop(0)
        if name == 'push': obj.append(args[0]); return
        if name == 'getBitsValue': return ((args[0] & 0xffffffff) >> args[1]) & 1
        if name == '__construct__': return {'type': args[0]}
        if name == 'dispatchEvent':
            for target, event, callback in list(self.listeners):
                if target is obj and event == args[0]['type']:
                    self.invoke(callback[2], callback[1], args)
            return
        if name in ('addEventListener', 'removeEventListener'):
            row = (obj, args[0], args[1])
            if name == 'addEventListener': self.listeners.append(row)
            else: self.listeners.remove(row)
            return
        raise ValueError((name, args))

    def test_national_claim_today_keeps_past_rewards_from_hiding_tomorrow(self):
        for day in range(1, 8):
            self.national.update(guoQingDay=day, guoQingSign=[1] * 7 + [1] * (day - 1) + [0] * (8 - day))
            self.run_code(6336); self.assertIn(88, self.buttons)
            self.national['guoQingSign'][day + 6] = 1
            self.run_code(6336); self.assertNotIn(88, self.buttons)
            self.run_code(6381); self.assertNotIn(88, self.buttons)
        self.national.update(guoQingDay=1, guoQingSign=[0] * 14)
        self.run_code(6336); self.assertIn(88, self.buttons)
        for day in (0, 8):
            self.national['guoQingDay'] = day; self.run_code(6381); self.assertNotIn(88, self.buttons)

    def test_dragon_only_final_claim_hides_and_midnight_restores(self):
        for step, pending in ((1, 0), (25, 0), (49, 0), (50, 1), (50, 0), (50, 0), (1, 0)):
            self.run_code(8635, {}, {'values': [4, step, pending]})
            self.assertEqual(step < 50 or pending == 1, 77 in self.buttons)
        self.assertEqual([], self.requests)
        self.globals['GlobalData']['role']['actorCircle'] = 2
        self.run_code(8635, {}, {'values': [4, 1, 0]}); self.assertNotIn(77, self.buttons)

    def test_spinning_last_prize_does_not_hide_before_claim_reply(self):
        self.run_code(8635, {}, {'values': [4, 1, 0]})
        self.run_code(8635, {}, {'values': [2, 0, 50, 1]}); self.assertIn(77, self.buttons)
        self.run_code(8635, {}, {'values': [4, 50, 0]}); self.assertNotIn(77, self.buttons)
        self.run_code(8635, {}, {'values': [3, 9]}); self.assertNotIn(77, self.buttons)

    def test_dragon_creation_keeps_query_for_new_day_and_hides_cached_completion(self):
        a, b, _ = self.bodies[6497]; code = self.abc[a:a + b]; ops = instructions(code)
        # Locate the previous case's exit before LongTeng's visibility guard.
        marker = next(o.start for o in ops if o.opcode == 0x66 and o.operands[0] == 38325)
        previous = [o for o in ops if o.opcode == 0x10 and o.start < marker and o.branches[0][1] > 7000]
        start = previous[-1].end + 1
        end = next(o.start for o in ops if o.opcode == 0x10 and o.start > marker and o.branches[0][1] > 7000)
        for pos, pending, visible in ((0, 0, True), (25, 0, True), (49, 1, True), (49, 0, False)):
            self.buttons.clear(); self.requests.clear(); self.mgr.update(pos=pos, hasAward=pending)
            self.run_code(6497, start=start, end=end, locals_={0: self.nav, 4: 77})
            self.assertEqual(visible, 77 in self.buttons); self.assertEqual([1], self.requests)

    def test_listener_registration_and_cleanup_use_same_event(self):
        for mid in (6333, 6377):
            a, b, _ = self.bodies[mid]; ops = instructions(self.abc[a:a + b])
            end = next(o.end for o in ops if o.opcode == 0x4f)
            self.run_code(mid, end=end)
        self.assertEqual(1, len(self.listeners))

    def test_patch_changes_only_reviewed_methods_and_preserves_artwork(self):
        before = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        self.assertEqual(CLIENT.read_bytes(), patch_swf(before))
        self.assertEqual(CLIENT.read_bytes(), patch_swf(CLIENT.read_bytes()))
        raw, (_, _, a, b) = abc_section(before); old, _ = normalize(raw[a:b]); _, _, bodies = inspect_abc(old)
        changed = set()
        for mid, (a, b, limits) in bodies.items():
            c, d, new_limits = self.bodies[mid]
            if old[a:a + b] != self.abc[c:c + d] or limits != new_limits: changed.add(mid)
        self.assertEqual(METHODS, changed)
        self.assertEqual(strings_of(old), self.strings)

    def runtime(self):
        from lupa.lua51 import LuaRuntime
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''
LocalDT={}; state={days={PeyNum=0}}; packets={}; given=0; mails=0; failed=false; bag=10
LogicCmd={miscSysEx={sub={sLongTengZhuanPan=90}}}; LogIds={LongTengZhuanPanAward=1}
PROP_ACTOR_CIRCLE=1;PROP_ENTITY_ID=2;ttFlyTip=1;ttScreenCenter=2;ttChatWindow=4
Actor={getStaticVar=function() return state end,getIntProperty=function() return 3 end,
       getName=function() return 'test' end,sendTipmsg=function() end}
System={getRandomNumber=function() return 0 end,broadcastTipmsg=function() end,
 getInt64Byte=function(v,i) return math.floor(v/256^i)%256 end,
 setInt64Byte=function(v,i,n) return v+(n-math.floor(v/256^i)%256)*256^i end,
 AddMail=function() mails=mails+1 end}
Item={getBagEmptyGridCount=function() return bag end,getItemName=function() return 'reward' end}
Awards={Give=function(_,award) if failed then return false end;given=given+1;lastAward=award[1] end}
DataPack={readByte=function(p) return p.msg end,allocPacket=function() return {} end,
 writeByte=function(p,v) p[#p+1]=v end,
 writeUint64=function(p,v) p[#p+1]=v%2^32;p[#p+1]=math.floor(v/2^32) end,
 flush=function(p) packets[#packets+1]=p end}
''')
        for path in ('config/modules/LongTengZhuanPanCfg.lua', 'functions/modules/LongTengZhuanPan.lua'):
            lua.execute((ROOT / 'Server/S1001/data' / path).read_text('utf-8-sig'))
        return lua

    def deliver(self, lua):
        packets = lua.globals().packets
        for i in range(1, len(packets) + 1):
            packet = packets[i]; values = [packet[k] for k in range(1, len(packet) + 1)]
            self.run_code(8635, {}, {'values': values}); self.assertEqual([], values)
        lua.execute('packets={}')

    def test_actual_lua_final_claim_failure_retry_mail_and_next_day(self):
        for mail in (False, True):
            self.setUp(); lua = self.runtime()
            lua.execute('state.days.LongTengZhuanPanData={zhuanPanData=50*256^2};state.LongTengZhuanPanAwardData=260')
            lua.globals().LocalDT.SendLongTengZhuanPanIconState(1)
            self.deliver(lua); self.assertIn(77, self.buttons)
            lua.execute('failed=true')
            lua.globals().LongTengZhuanPan_GetAward(1)
            self.assertEqual(260, lua.globals().state.LongTengZhuanPanAwardData); self.assertIn(77, self.buttons)
            lua.execute('failed=false;bag=' + ('0' if mail else '10'))
            lua.globals().LongTengZhuanPan_GetAward(1)
            self.deliver(lua); self.assertNotIn(77, self.buttons)
            lua.globals().LongTengZhuanPan_GetAward(1)
            self.assertEqual(1, lua.globals().given + lua.globals().mails)
            lua.globals().LongTengZhuanPan_SendLeftTimes(1)
            self.deliver(lua); self.assertNotIn(77, self.buttons)
            lua.execute('state.days={PeyNum=0}')
            lua.globals().LongTengZhuanPan_SendData(1)
            self.deliver(lua); self.assertIn(77, self.buttons)

    def test_actual_lua_midway_zero_times_and_legacy_completion(self):
        lua = self.runtime()
        lua.execute('state.days.LongTengZhuanPanData={zhuanPanData=25*256^2}')
        lua.globals().LongTengZhuanPan_SendLeftTimes(1)
        self.deliver(lua); self.assertIn(77, self.buttons)
        lua.execute('state.days.LongTengZhuanPanData.zhuanPanData=50*256^2')
        lua.globals().LongTengZhuanPan_SendLeftTimes(1)
        self.deliver(lua); self.assertNotIn(77, self.buttons)


if __name__ == '__main__':
    if '--lua-path' in sys.argv:
        index = sys.argv.index('--lua-path'); sys.path.insert(0, sys.argv[index + 1]); del sys.argv[index:index + 2]
    unittest.main()
