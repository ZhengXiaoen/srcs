"""Run shipped shop bytecode and server packets through view/refresh cycles."""
from __future__ import annotations

from patch_unique_activity_rankings import MAIN_METHODS, MODULE_METHODS, patch_swf as unique_rankings
from patch_consume_ranking_client import patch_swf as ranking_description
from patch_spring_activity_icon import METHODS as SPRING_METHODS, patch_swf as spring_icon
from patch_retired_festival_pages import METHODS as RETIRED_METHODS, patch_swf as retired_pages

from patch_wanfu_opening import METHODS as WANFU_METHODS, patch_swf as wanfu_opening
from patch_spring_display import patch_swf as spring_display
from patch_retired_hunt_pages import METHODS as HUNT_METHODS, patch_swf as retired_hunt

def current_release(source, module=False):
    updated = unique_rankings(source, module)
    return updated if module else retired_hunt(wanfu_opening(spring_display(retired_pages(spring_icon(ranking_description(updated))))))


import argparse
import subprocess
import sys
import unittest

from patch_activity_entries import q, strings_of
from patch_activity_reminders import CLIENT, ROOT, call, get, normalize, prop
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_mystery_shop_reminder import BASELINE, METHODS, VIEW, patch_abc, patch_swf
from test_activity_reminders import config_value, execute
from patch_guild_quest_config import read_cbp, read_pack

SERVER = ROOT / 'Server/S1001/data/functions/Activity/QingDianActivity.lua'


def server_runtime():
    lua = LuaRuntime(unpack_returned_tuples=True)
    source = SERVER.read_text('utf-8-sig')
    lua.execute('''
        now=36000; packets={}; mails=0; dvar={}; costs={}; grants=0
        svar = {SHENMISTORE_openDay=3, isDringShenMiSD=1}
        actor = {days={firstFreInToday=1}, randTable={1,2,3,4}, ShenMiStorebuyFlag={1,0,1,0}}
        LocalDT={}
        System = {getStaticVar=function() return svar end,
                  getDyanmicVar=function() return dvar end,
                  getRandomNumber=function() return 0 end,
                  getCurrMiniTime=function() return now end,
                  GetSystemTimeInMiniTime=function(t)
                      return 2026,10,2,math.floor(t/3600)%24,math.floor(t/60)%60,t%60 end,
                  getTime=function() return math.floor(now/3600)%24,math.floor(now/60)%60,now%60 end,
                  AddMail=function() mails=mails+1 end, saveStaticVar=function() end,
                  broadcastTipmsg=function() end,sendCommonLog=function() end}
        Actor = {IsActorInited=function() return true end, getStaticVar=function() return actor end,
                 getIntProperty=function() return 80 end,getName=function() return '测试' end,
                 changeMoney=function(a,t,n) table.insert(costs,{t,n}); return true end,
                 sendTipmsg=function() end}
        LuaHelp={getAllActorList=function() return {1} end}
        LogicCmd = {miscSysEx={sub={sQingDianActivity=1,sShenMiShangDianIsOpen=2,sQingDianActivitySendOneLog=3}}}
        DataPack = {allocPacket=function(a,b,cmd) packet={} return packet end,
                    readByte=function(p) return table.remove(p,1) end,
                    writeByte=function(p,n) table.insert(p,n) end,
                    writeInt=function(p,n) table.insert(p,n) end,
                    writeString=function(p,n) table.insert(p,n) end,
                    flush=function(p) table.insert(packets,p) end}
        QingDianActivityCfg = {ShenMiShangDian={Fre_Money=10,ShangPing={}}}
        for i=1,4 do
            QingDianActivityCfg.ShenMiShangDian.ShangPing[i]={weight=1,moneyType=3,needYb=i,
                award={{id=1000+i,count=i}}}
        end
        Awards={CheckBagGridCount=function() return true end,Give=function() grants=grants+1 end}
        Item={getItemLinkMsg=function() return '商品' end}
        LogIds={ShenMiShangDian=1}; ttFlyTip=1; ttChatWindow=1; PROP_ENTITY_ID=1; PROP_CREATURE_LEVEL=2
    ''')
    helpers = source[source.index('LocalDT.ShenMiStoreCycle'):source.index('QingDianActivitys = function')]
    dispatcher = source[source.index('QingDianActivitys = function'):source.index('GetQingDianActivityLoginGift = function')]
    query = source[source.index('GetQingDianActivityInfo = function'):source.index('--------------------------------------------------神秘商店')]
    shop = source[source.index('Fre_ShenMiStoreTime =function'):source.index('MiscsImplementEx.registerMsgHandler')]
    for chunk in (helpers, dispatcher, query, shop): lua.execute(chunk)
    return lua


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
        self.globals['CustomByteArray'] = {'class': 'packet'}
        self.globals['MainGameSocket'] = {'instance': {}}

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
        if name == 'sendQDActiveInfo': self.run_method(8774, args[0], obj={}, extra={2: args[1], 3: -1}); return None
        if name == '__construct__':
            return {'values': []} if obj.get('class') == 'packet' else {'type': args[0], 'data': args[1]}
        if name == 'writeCmd': return None
        if name == 'writeByte': obj['values'].append(args[0]); return None
        if name == 'sendSocket': self.requests.append(args[0]['values']); return None
        if name == 'dispatchEvent':
            self.events.append(args[0]); self.run_method(6405, args[0])
            if args[0]['type'] == 'products' and self.window and self.window['parent']:
                self.run_method(6692, obj=self.window)
            return None
        if name in ('readByte', 'readInt'):
            value = obj['values'].pop(0); obj['bytesAvailable'] = len(obj['values']); return value
        if name == 'push': obj.append(args[0]); return None
        if name in ('addEventListener', 'removeEventListener'): self.listeners.append((name, args)); return None
        raise ValueError(f'Unexpected shop call {name}')

    def open_status(self, day=1, unread=1):
        values = [day, 3] + ([] if unread is None else [unread])
        packet = {'values': values, 'bytesAvailable': len(values)}
        self.run_method(8758, packet, obj={}); self.assertEqual(packet['values'], [])

    def view(self):
        self.window = {'parent': {'visible': True}}
        # Execute the real view acknowledgement before simulating window data.
        a, size, _ = self.bodies[6687]; code = self.abc[a:a + size]
        start = code.index(VIEW); self.run_method(6687, obj=self.window, start=start, end=start + len(VIEW))
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
        self.open_status(unread=0); self.assertFalse(self.button['effect'])
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
        self.product_reply([1, 2, 3, 4], refresh=1); self.assertTrue(self.button['effect'])
        self.view(); self.window = None
        for buys in ((0, 0, 0, 0), (1, 0, 0, 0), (1, 1, 1, 0)):
            self.product_reply([1, 2, 3, 4], buys, refresh=0); self.assertFalse(self.button['effect'])

    def test_refresh_received_while_shop_open_is_already_viewed(self):
        self.open_status(); self.view()
        self.product_reply([4, 3, 2, 1], refresh=1); self.assertFalse(self.button['effect'])
        self.window = None; self.open_status(unread=0); self.assertFalse(self.button['effect'])

    def test_legacy_packet_without_flag_still_reads_goods_and_purchase_states(self):
        self.open_status(); self.view(); self.window = None
        self.product_reply([1, 2, 3, 4], refresh=None); self.assertFalse(self.button['effect'])
        self.view(); self.window = None
        self.product_reply([1, 2, 3, 4], (1, 0, 0, 0), refresh=None); self.assertFalse(self.button['effect'])
        self.product_reply([1, 5, 3, 4], refresh=None); self.assertFalse(self.button['effect'])
        self.assertEqual(self.qd['shenmiShop'], [1, 5, 3, 4])
        self.assertEqual(self.qd['shenmiBuys'], [0, 0, 0, 0])

    def test_clock_ticks_cannot_relight_or_send_queries(self):
        self.open_status(); self.view(); self.window = None
        self.requests.clear()
        for _ in range(20): self.run_method(6393)
        self.assertFalse(self.button['effect']); self.assertEqual(self.requests, [])

    def test_product_reply_does_not_change_activity_day_or_create_closed_entry(self):
        self.product_reply([1, 2, 3, 4], refresh=1)
        self.assertIsNone(self.button); self.assertEqual(self.shop['openDay'], 0)
        self.open_status(2); self.product_reply([2, 3, 4, 5], refresh=0)
        self.assertEqual(self.shop['openDay'], 2)
        self.open_status(0); self.assertIsNone(self.button)

    def test_manual_product_changes_and_relogin_stay_read_until_next_cycle(self):
        self.open_status(); self.view(); self.window = None
        for products in ([4, 3, 2, 1], [2, 1, 4, 3], [1, 2, 3, 4]):
            self.product_reply(products, refresh=0); self.assertFalse(self.button['effect'])
        self.button = None; self.open_status(unread=0); self.assertFalse(self.button['effect'])
        self.open_status(unread=1); self.assertTrue(self.button['effect'])

    def test_view_ack_packet_is_sent_on_open_and_updates(self):
        self.open_status(); self.view()
        self.assertEqual(self.requests, [[6, 4], [6, 4]])
        self.product_reply([4, 3, 2, 1], refresh=1)
        self.assertEqual(self.requests[-1], [6, 4]); self.assertFalse(self.button['effect'])

    def test_legacy_open_status_cannot_relight(self):
        self.open_status(unread=None); self.assertFalse(self.button['effect'])

    def test_product_listener_registration_and_disposal_are_unconditional(self):
        for method, listener in ((6333, 13671), (6377, 13672)):
            a, size, _ = self.bodies[method]; code = self.abc[a:a + size]
            registration = call(q(0x60, 1563), listener, prop(q(0x60, 141), 31651), prop(get(0), 8206), void=True)
            self.assertEqual(code[2:2 + len(registration)], registration)
            self.listeners.clear(); self.run_method(method, end=2 + len(registration))
            self.assertEqual(len(self.listeners), 1)

    def test_only_targeted_bodies_change_and_patch_is_idempotent(self):
        baseline = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        self.assertEqual(current_release(patch_swf(baseline)), CLIENT.read_bytes())
        self.assertEqual(patch_swf(CLIENT.read_bytes()), CLIENT.read_bytes())
        previous = subprocess.check_output(['git', 'show', '6909720:web/GameFrame.swf'], cwd=ROOT)
        self.assertEqual(current_release(patch_swf(previous)), CLIENT.read_bytes())
        raw, (_, _, a, b) = abc_section(baseline); before, _ = normalize(raw[a:b])
        _, _, old = inspect_abc(before, 'NavTopRightArea'); changed = set()
        for method, (a, size, limits) in old.items():
            b, size2, limits2 = self.bodies[method]
            if before[a:a + size] != self.abc[b:b + size2] or limits != limits2: changed.add(method)
        self.assertEqual(changed, METHODS | MAIN_METHODS | SPRING_METHODS | RETIRED_METHODS | WANFU_METHODS | HUNT_METHODS)

    def test_server_query_and_refresh_packets_preserve_goods_and_buy_flags(self):
        lua = server_runtime(); g = lua.globals()
        g.GetQingDianActivityInfo(1, 6)
        self.assertEqual(list(g.packet.values()), [6, 1, 2, 3, 4, 1, 0, 1, 0, 1])
        g.RandTheShenMiStore(1)
        self.assertEqual(list(g.packet.values()), [6, 1, 2, 3, 4, 0, 0, 0, 0, 1])
        g.QingDianActivitys(1, 0, lua.table_from([6, 4]))
        g.RandTheShenMiStore(1)
        self.assertEqual(list(g.packet.values()), [6, 1, 2, 3, 4, 0, 0, 0, 0, 0])

    def test_server_two_hour_refresh_once_per_boundary_without_mail(self):
        lua = server_runtime(); g = lua.globals()
        g.now = 35999; g.Fre_ShenMiStoreTime(); self.assertEqual(len(g.packets), 0)
        g.now = 36000; g.Fre_ShenMiStoreTime(); self.assertEqual(g.packet[10], 1)
        for second in range(1, 60):
            g.now = 36000 + second; g.Fre_ShenMiStoreTime()
        self.assertEqual(len(g.packets), 1)
        g.QingDianActivitys(1, 0, lua.table_from([6, 4]))
        for second in range(60, 7200):
            g.now = 36000 + second; g.Fre_ShenMiStoreTime()
        self.assertEqual(len(g.packets), 1)
        g.now = 43200; g.Fre_ShenMiStoreTime()
        self.assertEqual(len(g.packets), 2); self.assertEqual(g.packet[10], 1)
        self.assertEqual(g.mails, 0)

    def test_server_manual_refresh_buy_and_sold_out_refresh_stay_read(self):
        lua = server_runtime(); g = lua.globals()
        g.QingDianActivitys(1, 0, lua.table_from([6, 4]))
        g.FreshenTheShenMiStore(1); self.assertEqual(g.packet[10], 0)
        self.assertEqual(list(g.costs[1].values()), [3, -10])
        for index in range(1, 5):
            g.BuyInShenMiStore(1, index); self.assertEqual(g.packet[10], 0)
        self.assertEqual(g.grants, 4)
        self.assertEqual(list(g.actor.ShenMiStorebuyFlag.values()), [0, 0, 0, 0])
        g.actor.randTable = None; g.FreshenTheShenMiStore(1)
        self.assertEqual(g.packet[10], 0)
        g.actor.days.firstFreInToday = None; g.GetQingDianActivityInfo(1, 6)
        self.assertEqual(g.packet[10], 0)

    def test_server_relogin_and_day_boundary_use_persisted_view_state(self):
        lua = server_runtime(); g = lua.globals()
        g.ShenMiShangDianIsOpen(1, 0, None); self.assertEqual(list(g.packet.values()), [1, 3, 1])
        g.QingDianActivitys(1, 0, lua.table_from([6, 4]))
        # Recreate the dynamic state as on reconnect; keep role static data.
        g.dvar = lua.table(); g.now = 43199
        g.ShenMiShangDianIsOpen(1, 0, None); self.assertEqual(list(g.packet.values()), [1, 3, 0])
        g.now = 43200; g.ShenMiShangDianIsOpen(1, 0, None); self.assertEqual(g.packet[3], 1)
        g.QingDianActivitys(1, 0, lua.table_from([6, 4])); g.now = 43199
        self.assertEqual(g.LocalDT.ShenMiStoreUnread(1), 1)  # cycle changes in either time direction
        g.now = 86399; g.QingDianActivitys(1, 0, lua.table_from([6, 4]))
        g.now = 86400; self.assertEqual(g.LocalDT.ShenMiStoreUnread(1), 1)

    def test_open_shop_during_system_refresh_acknowledges_new_cycle(self):
        lua = server_runtime(); g = lua.globals()
        self.open_status(); self.view(); g.QingDianActivitys(1, 0, lua.table_from(self.requests[-1]))
        g.now = 43200; g.Fre_ShenMiStoreTime()
        self.product_reply(list(g.packet.values())[1:5], refresh=g.packet[10])
        self.assertFalse(self.button['effect'])
        g.QingDianActivitys(1, 0, lua.table_from(self.requests[-1]))
        self.window = None; g.ShenMiShangDianIsOpen(1, 0, None)
        self.open_status(unread=g.packet[3]); self.assertFalse(self.button['effect'])

    def test_server_closed_activity_has_no_refresh_or_mail(self):
        lua = server_runtime(); g = lua.globals(); g.svar.isDringShenMiSD = 0
        g.Fre_ShenMiStoreTime(); self.assertEqual(len(g.packets), 0); self.assertEqual(g.mails, 0)
        g.EndShenMiActivity(); self.assertEqual(list(g.packet.values()), [0, 0, 0])

    def test_view_sender_preserves_other_query_packets(self):
        for msgid in (0, 2, 3, 5, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18):
            self.run_method(8774, msgid, obj={}, extra={2: 4, 3: -1})
            self.assertEqual(self.requests[-1], [msgid, 4])
        self.run_method(8774, 1, obj={}, extra={2: 4, 3: -1})
        self.assertEqual(self.requests[-1], [1])

    def test_shop_products_prices_and_packed_config_match_server(self):
        path = ROOT / 'web/v2/lang/zh-cn/QingDianActivityCfg.cbp'
        raw = path.read_bytes(); _, root = read_cbp(raw)
        config = config_value(root)['ShenMiShangDian']
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute((ROOT / 'Server/S1001/data/config/activity/QingDianActivityCfg.lua').read_text('utf-8-sig'))
        def verify(value, expected):
            if isinstance(value, list):
                self.assertEqual(len(value), len(expected))
                for index, child in enumerate(value, 1): verify(child, expected[index])
            elif isinstance(value, dict):
                self.assertEqual(set(value), set(expected.keys()))
                for key, child in value.items(): verify(child, expected[key])
            else: self.assertEqual(value, expected)
        verify(config, lua.globals().QingDianActivityCfg.ShenMiShangDian)
        packed = [(k, v) for k, v in read_pack((ROOT / 'web/v2/lang/zh-cn/zh-cn.dat').read_bytes())
                  if k.lower() == path.name.lower()]
        self.assertEqual(len(packed), 1); self.assertEqual(packed[0][1], raw)

    def test_patched_methods_keep_valid_local_slots_and_loop_labels(self):
        for method in METHODS:
            a, size, limits = self.bodies[method]; code = self.abc[a:a + size]
            for op in instructions(code):
                if op.opcode in (0x62, 0x63, 0xc2, 0x08): self.assertLess(op.operands[0], limits[1])
                for _, target, _ in op.branches:
                    if target <= op.start: self.assertEqual(code[target], 0x09)

    def test_partial_patch_is_rejected_instead_of_treated_as_complete(self):
        data = bytearray(self.abc); a, _, _ = self.bodies[8758]; data[a] = 0xd1
        with self.assertRaisesRegex(ValueError, 'Incomplete or unexpected shop patch'):
            patch_abc(bytes(data))

    def test_complete_server_file_compiles_without_new_locals_or_reward_edits(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        source = SERVER.read_bytes()
        compile_ = lua.eval('function(s) local f,e=loadstring(s); return f~=nil,e end')
        self.assertEqual(compile_(source.decode('utf-8-sig')), (True, None))
        baseline = subprocess.check_output(['git', 'show', BASELINE + ':' + SERVER.relative_to(ROOT).as_posix()], cwd=ROOT)
        source = source.replace('\telseif index==8 then -- 集字有礼已下架\r\n\t\tif QingDianActivityCfg.QingDianJiZi.isOpen == false then return end'.encode(), b'\telseif index==8 then ')
        source = source.replace(b'\tif QingDianActivityCfg.QingDianJiZi.isOpen == false then return end\r\n', b'')
        source = source.replace('\telseif msgid==8 then  -- 已下架的集字有礼\r\n\t\treturn'.encode(), '\telseif msgid==8 then  --兑换集字\r\n\t\tGetQingDianJiZiGift(sysarg,DataPack.readByte(packet))'.encode())

        source = source.replace('\t\tif QingDianActivityCfg.XiaoFeiZhuanPanNew.isOpen == false then return end\r\n'.encode(), b'')
        source = source.replace('\tif QingDianActivityCfg.XiaoFeiZhuanPanNew.isOpen == false then return end\r\n'.encode(), b'')
        source = source.replace('万服庆典唯一消费排行'.encode(), '月度活动 元宝消耗排行榜'.encode())
        for field in ('hunt_times', 'shop'):
            guard = f'\t\tif treasure_hunt_cfg.{field}.isOpen == false then return end\r\n'.encode()
            self.assertEqual(2, source.count(guard))
            source = source.replace(guard, b'')
        # Reverse only this reminder's edits; every other byte must match.
        a = source.index('-- 每两小时为一轮'.encode()); b = source.index(b'QingDianActivitys = function')
        source = source[:a] + source[b:]
        additions = [
            '\t\telseif optType==4 then --点开商店，取消本轮提醒\r\n\t\t\tActor.getStaticVar(sysarg).ShenMiStoreViewedCycle = LocalDT.ShenMiStoreCycle()\r\n',
            '\t\tDataPack.writeByte(netPack,LocalDT.ShenMiStoreUnread(sysarg)) -- 本轮未查看才高亮\r\n',
            '\tDataPack.writeByte(netPack,LocalDT.ShenMiStoreUnread(sysarg)) -- 手动刷新不改变本轮查看状态\r\n',
            '\t\tDataPack.writeByte(netPack,LocalDT.ShenMiStoreUnread(player))\r\n',
            '\t\tDataPack.writeByte(netPack,0) --关闭活动时取消提醒\r\n',
            '\tDataPack.writeByte(netPack,LocalDT.ShenMiStoreUnread(sysarg)) --登录和开关查询同步本轮提醒\r\n',
        ]
        for addition in additions:
            addition = addition.encode()
            self.assertEqual(source.count(addition), 1); source = source.replace(addition, b'')
        a = baseline.index(b'\t\t\t\t\r\n\t\t\t\tif Actor.getIntProperty(v,PROP_CREATURE_LEVEL)>=80 then', baseline.index(b'Fre_ShenMiStoreTime =function'))
        b = baseline.index(b'\r\n\t\t\tend', baseline.index(b'\r\n\t\t\t\tend', a)) + 2
        marker = b'\t\t\t\tRandTheShenMiStore(v)\r\n'
        self.assertEqual(source.count(marker), 1); source = source.replace(marker, marker + baseline[a:b])
        self.assertEqual(source, baseline)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--lua-path')
    args, rest = parser.parse_known_args()
    if args.lua_path: sys.path.insert(0, args.lua_path)
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0], *rest], verbosity=2)
