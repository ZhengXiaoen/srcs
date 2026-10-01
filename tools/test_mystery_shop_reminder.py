"""Run shipped shop bytecode and server packets through view/refresh cycles."""
from __future__ import annotations

import argparse
import subprocess
import sys
import unittest

from patch_activity_entries import q, strings_of
from patch_activity_reminders import CLIENT, ROOT, call, get, normalize, prop
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_mystery_shop_reminder import BASELINE, METHODS, patch_swf
from test_activity_reminders import execute

SERVER = ROOT / 'Server/S1001/data/functions/Activity/QingDianActivity.lua'


class ShopReminderTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        raw, (_, _, a, b) = abc_section(CLIENT.read_bytes()); cls.abc, _ = normalize(raw[a:b])
        cls.names, _, cls.bodies = inspect_abc(cls.abc, 'NavTopRightArea'); cls.strings = strings_of(cls.abc)

    def setUp(self):
        self.button = None; self.window = None; self.requests = []; self.listeners = []; self.events = []
        self.qd = {'shenmiShop': [], 'shenmiBuys': []}
        self.shop = {'openDay': 0, 'totalOpenDay': 3}
        self.nav = {'_isInitBtn': False, '_onSmShopTimer': {}}
        self.globals = {'GlobalData': {'qdActivityDataMgr': self.qd}, 'ShenMiShopWin': self.shop,
                        'MsgButtonTypes': {'RIGHT_SHENMI_SHOP': 'shop'},
                        'GameNavigateType': {'WIN_SHEN_MI_SHOP_ACTIVE': 217},
                        'OtherEvent': {'QINGDIAN_ACTIVE_SHENMI_SHOP': 'products', 'SHENMI_SHOP_OPEN': 'open'}}

    def run_method(self, method, arg=None, obj=None, start=0, end=None, extra=None):
        a, size, limits = self.bodies[method]
        value, maximum = execute(self.abc[a:a + size], self.names, self.strings,
                                  {0: self.nav if obj is None else obj, 1: arg, **(extra or {})},
                                  self.globals, self.invoke, start, end)
        self.assertLessEqual(maximum, limits[0]); return value

    def invoke(self, obj, name, args):
        if name == 'getBtn': return self.button
        if name == 'addBtn2':
            if self.button is None: self.button = {'effect': False}
            return None
        if name == 'setEffect': obj['effect'] = args[0]; return None
        if name == 'delBtn': self.button = None; return None
        if name == 'getWinByType': return self.window
        if name == 'start': return None
        if name == 'close': self.window['parent'] = None; return None
        if name == 'updateCell': return None
        if name in ('readByte', 'readInt'):
            value = obj['values'].pop(0); obj['bytesAvailable'] = len(obj['values']); return value
        if name == 'push': obj.append(args[0]); return None
        if name in ('addEventListener', 'removeEventListener'): self.listeners.append((name, args)); return None
        raise ValueError(f'Unexpected shop call {name}')

    def open_status(self, day=1): self.run_method(6405, {'type': 'open', 'data': day})

    def view(self):
        self.window = {'parent': {'visible': True}}
        # onAddedToStage already clears the button; updateShop now handles all
        # subsequent replies while the window remains open.
        self.run_method(6692, obj=self.window)

    def product_reply(self, products, buys=(0, 0, 0, 0), refresh=0):
        values = list(products) + list(buys) + ([] if refresh is None else [refresh])
        packet = {'values': values, 'bytesAvailable': len(values)}
        a, size, _ = self.bodies[8763]; ops = instructions(self.abc[a:a + size])
        start = next(o.start for o in ops if o.opcode == 0x56 and o.start > 665)
        end = next(o.start for o in ops if o.opcode == 0x60 and o.start > start and o.operands == (1563,))
        state = {0: {}, 1: packet}
        execute(self.abc[a:a + size], self.names, self.strings, state, self.globals, self.invoke, start, end)
        self.assertEqual(packet['values'], [])
        self.run_method(6405, {'type': 'products', 'data': state[3]})
        if self.window and self.window['parent']: self.run_method(6692, obj=self.window)

    def test_initial_open_view_close_and_reopen_status_stays_read(self):
        self.open_status(); self.assertTrue(self.button['effect'])
        self.view(); self.assertFalse(self.button['effect'])
        self.window = None
        self.open_status(); self.assertFalse(self.button['effect'])
        self.product_reply([1, 2, 3, 4], refresh=0); self.assertFalse(self.button['effect'])
        self.view(); self.assertFalse(self.button['effect'])

    def test_refresh_same_products_and_view_repeats(self):
        self.open_status(); self.view(); self.window = None
        for _ in range(3):
            # A real refresh can randomly select exactly the same four goods.
            self.product_reply([1, 2, 3, 4], refresh=1); self.assertTrue(self.button['effect'])
            self.view(); self.assertFalse(self.button['effect']); self.window = None

    def test_queries_and_purchases_preserve_read_or_unread(self):
        self.open_status()
        self.product_reply([1, 2, 3, 4], refresh=0); self.assertTrue(self.button['effect'])
        self.view(); self.window = None
        for buys in ((0, 0, 0, 0), (1, 0, 0, 0), (1, 1, 1, 0)):
            self.product_reply([1, 2, 3, 4], buys, refresh=0); self.assertFalse(self.button['effect'])

    def test_refresh_received_while_shop_open_is_already_viewed(self):
        self.open_status(); self.view()
        self.product_reply([4, 3, 2, 1], refresh=1); self.assertFalse(self.button['effect'])
        self.window = None; self.open_status(); self.assertFalse(self.button['effect'])

    def test_legacy_packet_without_flag_still_reads_goods_and_purchase_states(self):
        self.open_status(); self.view(); self.window = None
        self.product_reply([1, 2, 3, 4], refresh=None); self.assertTrue(self.button['effect'])
        self.view(); self.window = None
        self.product_reply([1, 2, 3, 4], (1, 0, 0, 0), refresh=None); self.assertFalse(self.button['effect'])
        self.product_reply([1, 5, 3, 4], refresh=None); self.assertTrue(self.button['effect'])

    def test_clock_ticks_cannot_relight_or_send_queries(self):
        self.open_status(); self.view(); self.window = None
        for _ in range(20): self.run_method(6393)
        self.assertFalse(self.button['effect']); self.assertEqual(self.requests, [])

    def test_product_reply_does_not_change_activity_day_or_create_closed_entry(self):
        self.product_reply([1, 2, 3, 4], refresh=1)
        self.assertIsNone(self.button); self.assertEqual(self.shop['openDay'], 0)
        self.open_status(2); self.product_reply([2, 3, 4, 5], refresh=0)
        self.assertEqual(self.shop['openDay'], 2)
        self.open_status(0); self.assertIsNone(self.button)

    def test_product_listener_registration_and_disposal_are_unconditional(self):
        for method, listener in ((6333, 13671), (6377, 13672)):
            a, size, _ = self.bodies[method]; code = self.abc[a:a + size]
            registration = call(q(0x60, 1563), listener, prop(q(0x60, 141), 31651), prop(get(0), 8206), void=True)
            self.assertEqual(code[2:2 + len(registration)], registration)
            self.listeners.clear(); self.run_method(method, end=2 + len(registration))
            self.assertEqual(len(self.listeners), 1)

    def test_only_targeted_bodies_change_and_patch_is_idempotent(self):
        baseline = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        self.assertEqual(patch_swf(baseline), CLIENT.read_bytes())
        self.assertEqual(patch_swf(CLIENT.read_bytes()), CLIENT.read_bytes())
        raw, (_, _, a, b) = abc_section(baseline); before, _ = normalize(raw[a:b])
        _, _, old = inspect_abc(before, 'NavTopRightArea'); changed = set()
        for method, (a, size, limits) in old.items():
            b, size2, limits2 = self.bodies[method]
            if before[a:a + size] != self.abc[b:b + size2] or limits != limits2: changed.add(method)
        self.assertEqual(changed, METHODS)

    def test_server_query_and_refresh_packets_preserve_goods_and_buy_flags(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        source = SERVER.read_text('utf-8-sig')
        # Execute the real handlers, not reimplemented packet construction.
        query = source[source.index('GetQingDianActivityInfo = function'):source.index('--------------------------------------------------神秘商店')]
        rand = source[source.index('RandTheShenMiStore = function'):source.index('--开始神秘商店')]
        lua.execute('''
            svar = {SHENMISTORE_openDay=3, isDringShenMiSD=1}
            actor = {days={firstFreInToday=1}, randTable={1,2,3,4}, ShenMiStorebuyFlag={1,0,1,0}}
            System = {getStaticVar=function() return svar end,
                      getRandomNumber=function() return 0 end}
            Actor = {IsActorInited=function() return true end, getStaticVar=function() return actor end}
            LogicCmd = {miscSysEx={sub={sQingDianActivity=1}}}
            DataPack = {allocPacket=function() packet={} return packet end,
                        writeByte=function(p,n) table.insert(p,n) end,
                        writeInt=function(p,n) table.insert(p,n) end,
                        flush=function(p) end}
            QingDianActivityCfg = {ShenMiShangDian={ShangPing={{weight=1},{weight=1},{weight=1},{weight=1}}}}
        ''')
        lua.execute(query); lua.execute(rand)
        lua.globals().GetQingDianActivityInfo(1, 6)
        self.assertEqual(list(lua.globals().packet.values()), [6, 1, 2, 3, 4, 1, 0, 1, 0, 0])
        lua.globals().RandTheShenMiStore(1)
        self.assertEqual(list(lua.globals().packet.values()), [6, 1, 2, 3, 4, 0, 0, 0, 0, 1])

    def test_complete_server_file_compiles_without_new_locals_or_reward_edits(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        source = SERVER.read_bytes()
        compile_ = lua.eval('function(s) local f,e=loadstring(s); return f~=nil,e end')
        self.assertEqual(compile_(source.decode('utf-8-sig')), (True, None))
        baseline = subprocess.check_output(['git', 'show', BASELINE + ':' + SERVER.relative_to(ROOT).as_posix()], cwd=ROOT)
        # Removing only the two appended protocol flags restores the file,
        # including original encoding/line endings and every reward/config ID.
        additions = [b'\t\tDataPack.writeByte(netPack,0) -- ' + '当前商品查询/购买回包，不重新提示'.encode() + b'\r\n',
                     b'\tDataPack.writeByte(netPack,1) -- ' + '商品实际刷新，客户端重新提示未查看商品'.encode() + b'\r\n']
        for addition in additions:
            self.assertEqual(source.count(addition), 1); source = source.replace(addition, b'')
        self.assertEqual(source, baseline)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--lua-path')
    args, rest = parser.parse_known_args()
    if args.lua_path: sys.path.insert(0, args.lua_path)
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0], *rest], verbosity=2)
