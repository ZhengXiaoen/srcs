"""Run shipped lucky-spin click, reply parser and animation with Flash rotations."""
import subprocess
import sys
import unittest

from patch_anniversary_spin_finish import CLIENT, METHODS, patch_swf
from patch_super_anniversary import abc_section, normalize, inspect_abc, bytecode_requirements
from patch_activity_entries import strings_of
from patch_guild_quest_config import read_cbp
from test_activity_reminders import execute, config_value

BASELINE = '316d88b'


class Rotation(dict):
    def __setitem__(self, key, value):
        if key == 'rotation': value = (value + 180) % 360 - 180
        super().__setitem__(key, value)


class SpinFinishTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        raw, (_, _, a, b) = abc_section(CLIENT.read_bytes())
        cls.abc, _ = normalize(raw[a:b]); cls.names, _, cls.bodies = inspect_abc(cls.abc)
        cls.strings = strings_of(cls.abc)
        cfg = CLIENT.parent / 'v2/lang/zh-cn/SanRenHongLiCfg.cbp'
        cls.config = config_value(read_cbp(cfg.read_bytes())[1])['LuckeyZhuanPan']

    def setUp(self):
        self.page = {'_btn': {'enabled': True}, '_timer': {'running': False},
                     '_totalTime': 0, '_isInfoBack': False, '_remainTime': 15,
                     '_needYB': 10000, '_container': Rotation(rotation=0.0000001), '_cfg': self.config}
        self.hong = {'hongLiTurnPos': 0, 'hongLiTurnTime': 0}
        self.globals = {'GlobalData': {'cliffordDataMgr': self.hong, 'role': {}},
                        'MoneyType': {'NON_BIND_YUANBAO': 1}, 'Math': {},
                        'CliffordCC': {}, 'DataEventDispatcher': {},
                        'CliffordEvent': {'HONG_LI_TURN_POS': 'result', 'HONG_LI_TURN_TIME': 'count'}}
        self.requests = []; self.tips = []

    def run_method(self, mid, obj=None, arg=None):
        start, size, limits = self.bodies[mid]
        result, maximum = execute(self.abc[start:start + size], self.names, self.strings,
                                  {0: self.page if obj is None else obj, 1: arg}, self.globals, self.invoke)
        self.assertLessEqual(maximum, limits[0]); return result

    def invoke(self, obj, name, args):
        if name == 'getRoleMoneyByType': return 100000000
        if name == 'start': obj['running'] = True; return
        if name == 'stop': obj['running'] = False; return
        if name == 'getHongLiInfo': self.requests.append(args); return
        if name == 'abs': return abs(args[0])
        if name in ('readByte', 'readUnsignedByte'): return obj.pop(0)
        if name == '__construct__': return {'event': args[0]}
        if name == 'dispatchEvent':
            if args[0]['event'] == 'result': self.run_method(29901)
            return
        if name == 'doFlyTipMsg': self.tips.append(args[0]); return
        if name in ('addEventListener', 'removeEventListener'): return
        raise ValueError(f'Unimplemented call {name}')

    def reply(self, index): self.run_method(8624, obj={}, arg=[4, 1, index])

    def ticks(self, count):
        for _ in range(count):
            if not self.page['_timer']['running']: break
            self.run_method(29904)

    def test_all_ten_results_finish_despite_fractional_rotation(self):
        for index, row in enumerate(self.config['rate'], 1):
            for initial in (0.0000001, 17.95, -179.9, 179.9999999):
                self.setUp(); self.page['_container']['rotation'] = initial
                self.run_method(29905); self.assertEqual([[4]], self.requests)
                self.assertFalse(self.page['_btn']['enabled']); self.reply(index); self.ticks(80)
                self.assertTrue(self.page['_btn']['enabled']); self.assertFalse(self.page['_timer']['running'])
                expected = row[3] * 36
                if expected > 180: expected -= 360
                self.assertAlmostEqual(0, (expected - self.page['_container']['rotation'] + 180) % 360 - 180)
                self.assertEqual(0, self.page['_totalTime']); self.assertFalse(self.page['_isInfoBack'])

    def test_missing_result_recovers_after_ten_seconds_without_redraw(self):
        self.run_method(29905); self.ticks(199)
        self.assertFalse(self.page['_btn']['enabled'])
        self.ticks(1); self.assertTrue(self.page['_btn']['enabled'])
        self.assertFalse(self.page['_timer']['running']); self.assertEqual([[4], [0, 4]], self.requests)
        self.reply(1); self.assertFalse(self.page['_isInfoBack'])

    def test_delayed_result_keeps_rotating_and_then_finishes(self):
        self.run_method(29905); self.ticks(100)
        before = self.page['_container']['rotation']; self.ticks(1)
        self.assertNotEqual(before, self.page['_container']['rotation'])
        self.reply(8); self.ticks(22); self.assertTrue(self.page['_btn']['enabled'])
        self.assertEqual([[4]], self.requests)

    def test_rejected_and_invalid_results_restore_controls(self):
        for index in (0, 11, 255):
            self.setUp(); self.run_method(29905); self.reply(index); self.ticks(70)
            self.assertTrue(self.page['_btn']['enabled']); self.assertFalse(self.page['_timer']['running'])
            self.assertEqual([[4], [0, 4]], self.requests)

    def test_close_or_tab_change_resets_pending_animation_before_next_draw(self):
        self.run_method(29905); self.reply(3); self.ticks(12); self.run_method(29900)
        self.assertTrue(self.page['_btn']['enabled']); self.assertFalse(self.page['_timer']['running'])
        self.assertEqual(0, self.page['_totalTime']); self.assertFalse(self.page['_isInfoBack'])
        self.reply(3); self.assertFalse(self.page['_isInfoBack'])
        self.run_method(29905); self.reply(9); self.ticks(80)
        self.assertTrue(self.page['_btn']['enabled']); self.assertEqual([[4], [4]], self.requests)

    def test_repeated_clicks_send_only_one_draw_and_insufficient_counts_do_not_lock(self):
        self.run_method(29905); self.run_method(29905); self.assertEqual([[4]], self.requests)
        self.run_method(29900); self.page['_remainTime'] = 0; self.run_method(29905)
        self.assertTrue(self.page['_btn']['enabled']); self.assertEqual(['次数不足'], self.tips)

    def test_previous_release_stays_locked_with_float_error_no_reply_and_close(self):
        previous = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=CLIENT.parent.parent)
        raw, (_, _, a, b) = abc_section(previous); old, _ = normalize(raw[a:b]); _, _, bodies = inspect_abc(old)
        saved = self.abc, self.bodies
        try:
            self.abc, self.bodies = old, bodies
            self.run_method(29905); self.reply(1); self.ticks(400)
            self.assertFalse(self.page['_btn']['enabled']); self.assertTrue(self.page['_timer']['running'])
            self.run_method(29900); self.assertFalse(self.page['_btn']['enabled'])
            self.setUp(); self.run_method(29905); self.ticks(400)
            self.assertFalse(self.page['_btn']['enabled']); self.assertEqual(2500, self.page['_totalTime'])
        finally: self.abc, self.bodies = saved

    def test_server_results_charge_once_and_each_actual_packet_finishes_animation(self):
        import test_super_anniversary as server
        from lupa.lua51 import LuaRuntime
        server.LuaRuntime = LuaRuntime
        h = server.ServerTests(); h.setUp()
        for index, row in enumerate(self.config['rate'], 1):
            self.setUp(); self.run_method(29905)
            h.run_lua(f'''player.days.PeyNum=2000000;player.days.sanrenhongliDraw=0
balance=100000000;packets={{}};math.random=function() return {max(1, int(row[1]))} end
handleSanRenHongLi(1,0,{{4}})''')
            packet = h.value('packets[1]')
            self.assertEqual(index, packet[3]); self.assertEqual(1, h.value('player.days.sanrenhongliDraw'))
            self.assertEqual(100000000 - 10000 + 10000 * row[0], h.value('balance'))
            self.run_method(8624, obj={}, arg=[packet[i] for i in range(1, 4)])
            self.ticks(80); self.assertTrue(self.page['_btn']['enabled'])

    def test_patch_preserves_unrelated_code_artwork_and_flash_limits(self):
        before = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=CLIENT.parent.parent)
        self.assertEqual(CLIENT.read_bytes(), patch_swf(before)); self.assertEqual(CLIENT.read_bytes(), patch_swf(CLIENT.read_bytes()))
        raw, (_, _, a, b) = abc_section(before); old, _ = normalize(raw[a:b]); _, _, bodies = inspect_abc(old)
        changed = {mid for mid, (start, size, limits) in bodies.items()
                   if old[start:start + size] != self.abc[self.bodies[mid][0]:sum(self.bodies[mid][:2])]
                   or limits != self.bodies[mid][2]}
        self.assertEqual(METHODS, changed); self.assertEqual(strings_of(old), self.strings)
        for mid in METHODS:
            start, size, limits = self.bodies[mid]
            required = bytecode_requirements(self.abc[start:start + size], self.names, limits[2])
            for have, need in zip((limits[0], limits[1], limits[3]), required): self.assertGreaterEqual(have, need)


if __name__ == '__main__':
    sys.path.insert(0, r'C:\Users\zxe\.codex\tmp\warrior-equipment-deps')
    unittest.main(verbosity=2)
