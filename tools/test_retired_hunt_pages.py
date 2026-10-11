"""Verify retired hunt protocols/pages and the live hunt handler's point packets."""
from __future__ import annotations

import argparse
from itertools import product
from pathlib import Path
import subprocess
import struct
import sys
import unittest

from patch_retired_hunt_pages import BASELINE, CLIENT, METHODS, SWITCHES, patch_config, patch_swf
from patch_guild_quest_config import read_cbp, read_pack, write_node
from patch_activity_entries import q, QD_ARRAYS, strings_of
from patch_activity_reminders import normalize, call, number
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from test_activity_reminders import execute

ROOT=CLIENT.parents[1]
SERVER=ROOT/'Server/S1001/data'


class HuntServerTests(unittest.TestCase):
    def runtime(self):
        lua=LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''LocalDT={};EventCallDispatcher={registerEventCall=function() end};BaseTypes={ActorEventId={}}
            MiscsImplement={registerMsgHandler=function() end};MiscsImplementEx={registerMsgHandler=function() end}
            LogicCmd={miscSys={sub={}},miscSysEx={sub={}}}
            register_spring_festival_func=function() end;register_spring_festival_start_end_func=function() end
            register_spring_festival_login_func=function() end;register_spring_festival_online_cross_day_func=function() end
        ''')
        for f in ('config/activity/SpringFestivalCfg.lua','config/new_activity/qingdian/treasure_hunt_cfg.lua',
                'functions/new_activity/qingdian/treasure_hunt.lua','functions/Activity/spring/spring_total.lua',
                'functions/ActorEvent/DmkjHandle.lua','functions/Activity/QingDianActivity.lua'):
            lua.execute((SERVER/f).read_text('utf-8-sig'))
        return lua

    def test_direct_retired_handlers_touch_no_actor_inventory_points_or_packet(self):
        lua=self.runtime()
        lua.execute('''fail=function() error('retired handler touched live state') end
            Actor=setmetatable({},{__index=function() return fail end})
            System=setmetatable({},{__index=function() return fail end})
            DataPack=setmetatable({},{__index=function() return fail end})
            Awards=setmetatable({},{__index=function() return fail end})
            qd_send_hunt_times_activity_data(1);qd_get_hunt_times_award(1,{})
            qd_send_shop_activity_data(1);qd_buy_shop_item(1,{});qd_qingdian_point_exchange(1,100)
            spring_xunbaofanli_main(1,{});GetSpringXunBaoFanLiData(1);GetSpringXunBaoFanLiGife(1,1)
        ''')

    def test_old_wanfu_protocols_no_longer_dispatch_shop_or_rebate(self):
        lua=self.runtime()
        lua.execute('''noop=function() end;Actor={IsActorInited=function() return true end}
            System={getStaticVar=function() return {} end};DataPack={readByte=function(p) return table.remove(p,1) end}
            fail=function() error('retired protocol dispatched') end
            qd_send_hunt_times_activity_data=fail;qd_get_hunt_times_award=fail
            qd_send_shop_activity_data=fail;qd_buy_shop_item=fail
            QingDianActivitys(1,0,{17,1});QingDianActivitys(1,0,{18,1})
            GetQingDianActivityInfo(1,17);GetQingDianActivityInfo(1,18)
        ''')

    def hunt_runtime(self, active, initial):
        lua=self.runtime()
        lua.execute('''state={};var={dmkj_qingdian_point=77};dynamic={};packets={};keys=100;space=100;draws=0;removeOK=true
            Actor={getStaticVar=function() return var end,getDyanmicVar=function() return dynamic end,
                getItemCount=function() return keys end,removeItem=function(a,id,n)
                    assert(id==860);if not removeOK then return 0 end;keys=keys-n;return n end,
                hasTopTitle=function() return true end,sendTipmsg=function() end}
            Dmkj={getStoreRestCount=function() return space end}
            System={getStaticVar=function() return state end,getDaysSinceCombineServer=function() return 99 end}
            DmkjConf={DmParam={{{item={id=860}},{item={id=860}},{item={id=860}}}}};Title={DmkjYb=1}
            DmkjFun.StartXB=function() draws=draws+1 end;SendHFTheInfo=function() end
            DataPack={allocPacket=function(a,sys,cmd) assert(sys==36 and cmd==2);local p={};table.insert(packets,p);return p end,
                writeByte=function(p,v) table.insert(p,v) end,writeInt=function(p,v) assert(type(v)=='number');table.insert(p,v) end,
                writeWord=function(p,v) table.insert(p,v) end,writeUInt=function(p,v) assert(type(v)=='number');table.insert(p,v) end,
                flush=function() end}
        ''')
        if active:lua.execute('state={QingDian_openDay=12,isDringQingDianActivity=1}')
        if initial is not None:lua.globals().var.TreasureHuntValue=initial
        return lua

    def test_single_ten_fifty_hunts_always_grant_and_send_treasure_points(self):
        for active,initial,batch in product((False,True),(None,123),(1,2,3)):
            lua=self.hunt_runtime(active,initial);count=(1,10,50)[batch-1]
            lua.execute(f'DmkjOpFuncList[DmkjOpId.enDm](1,{{2,1,{batch},1}})')
            expected=(initial or 0)+count
            self.assertEqual(expected,lua.eval('var.TreasureHuntValue'))
            self.assertEqual(77,lua.eval('var.dmkj_qingdian_point'))
            self.assertEqual(count,lua.eval('draws'))
            self.assertEqual([1,expected,100,77],list(lua.globals().packets[1].values()))
            self.assertEqual(100-count,lua.eval('keys'))

    def test_failed_hunts_never_grant_points_or_start_draws(self):
        for failure in ('keys=0','space=0','removeOK=false'):
            lua=self.hunt_runtime(True,123);lua.execute(failure)
            lua.execute('DmkjOpFuncList[DmkjOpId.enDm](1,{2,1,3,1})')
            self.assertEqual(123,lua.eval('var.TreasureHuntValue'))
            self.assertEqual(0,lua.eval('draws'));self.assertEqual(0,lua.eval('#packets'))

    def test_missing_retired_currency_sends_zero_and_repeated_hunts_accumulate(self):
        lua=self.hunt_runtime(True,None);lua.execute('var.dmkj_qingdian_point=nil')
        for batch in (1,2,3):lua.execute(f'DmkjOpFuncList[DmkjOpId.enDm](1,{{2,1,{batch},1}})')
        self.assertEqual(61,lua.eval('var.TreasureHuntValue'))
        self.assertEqual([1,11,61],[lua.globals().packets[i][2] for i in (1,2,3)])
        self.assertEqual([0,0,0],[lua.globals().packets[i][4] for i in (1,2,3)])

    def test_combined_changed_lua_compiles_without_new_top_level_locals(self):
        paths=('config/activity/SpringFestivalCfg.lua','config/new_activity/qingdian/treasure_hunt_cfg.lua',
            'functions/new_activity/qingdian/treasure_hunt.lua','functions/Activity/spring/spring_total.lua',
            'functions/ActorEvent/DmkjHandle.lua','functions/Activity/QingDianActivity.lua')
        compiler=LuaRuntime().eval('function(s) return assert(loadstring(s))~=nil end')
        self.assertTrue(compiler('\n'.join((SERVER/p).read_text('utf-8-sig') for p in paths)))
        for path in paths:
            original=subprocess.check_output(['git','show',BASELINE+':Server/S1001/data/'+path],cwd=ROOT).decode('utf-8-sig')
            current=(SERVER/path).read_text('utf-8-sig')
            self.assertEqual([l for l in original.splitlines() if l.startswith('local ')],
                             [l for l in current.splitlines() if l.startswith('local ')])


class HuntClientTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source=CLIENT.read_bytes()
        raw,(_,_,a,b)=abc_section(cls.source);cls.abc,_=normalize(raw[a:b]);cls.names,_,cls.bodies=inspect_abc(cls.abc)
        cls.strings = strings_of(cls.abc)

    def code(self,method):
        a,size,_=self.bodies[method];return self.abc[a:a+size]

    def test_all_page_variants_and_marks_omit_retired_pages(self):
        ops=instructions(self.code(6021))
        expected=['QDLoginPage','QDRechargePage','QDAccRechargePage','QDFlashSalePage','QDHongYunDangTouPage','QDConsumePage']
        for field in QD_ARRAYS:
            at=next(i for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(field,))
            self.assertEqual((6,),ops[at-1].operands)
            self.assertEqual(expected,[self.names[o.operands[0]] for o in ops[at-7:at-1]])
        for method in (6021,6022,6023,6026,6027,6032):
            ops=instructions(self.code(method))
            self.assertFalse(any(o.opcode in (0x66,0x68) and o.operands[0] in (7635,7636,7657,7669) for o in ops))
        ops=instructions(self.code(5903))
        self.assertFalse(any(o.opcode in (0x60,0x66,0x68) and o.operands[0] in (7454,7467,18083) for o in ops))

    def test_retired_requests_and_hunt_effect_are_removed(self):
        self.assertNotIn(call(q(0x60,11028),37707,number(0),number(17),void=True),self.code(6408))
        self.assertFalse(any(o.opcode==0x66 and o.operands[0] in (32329,3850,3851,14702)
                             for o in instructions(self.code(6403))))

    def test_live_server_point_packets_refresh_the_shipped_client_display(self):
        test = self
        for active, batch in product((False, True), (1, 2, 3)):
            lua = HuntServerTests().hunt_runtime(active, 123)
            lua.execute(f'DmkjOpFuncList[DmkjOpId.enDm](1,{{2,1,{batch},1}})')
            packet = list(lua.globals().packets[1].values())
            payload = struct.pack('<BiHI', *packet)
            offset = 0
            displayed = []
            events = []

            def run(method, obj, arg=None, **kwargs):
                result, maximum = execute(test.code(method), test.names, test.strings,
                    {0: obj, 1: arg}, globals_, invoke, **kwargs)
                test.assertLessEqual(maximum, test.bodies[method][2][0])
                return result

            class DreamState(dict):
                def __setitem__(self, key, value):
                    if key == 'jifen': run(3619, self, value)
                    else: super().__setitem__(key, value)

                def get(self, key, default=None):
                    return run(3618, self) if key == 'jifen' else super().get(key, default)

            manager = DreamState()
            window = {'_jifenBmp': {}}
            globals_ = {'GlobalData': {'dreamMgr': manager, 'qdActivityDataMgr': {}},
                        'DataEventDispatcher': {}, 'DreamEvent': {'class': 'DreamEvent',
                            'DREAM_REFRESH_JIFEN': 'refresh', 'DREAM_CONFIG_BACK': 'config'}}

            def invoke(obj, name, args):
                nonlocal offset
                if name.startswith('read'):
                    format_ = {'readUnsignedByte': '<B', 'readInt': '<i',
                               'readUnsignedShort': '<H', 'readUnsignedInt': '<I'}[name]
                    value, = struct.unpack_from(format_, payload, offset)
                    offset += struct.calcsize(format_)
                    return value
                if name == '__construct__': return {'type': args[0]}
                if name == 'dispatchEvent':
                    events.append(args[0]['type'])
                    if args[0]['type'] == 'refresh': run(7228, window)
                elif name == 'setNumStr': displayed.append(args)
                elif name != 'sendQuerStorageItem': raise ValueError(name)

            run(14812, {}, {})
            self.assertEqual(len(payload), offset)
            self.assertEqual(packet[1], manager['_jifen'])
            self.assertEqual(packet[3], globals_['GlobalData']['qdActivityDataMgr']['zhenbaogeValue'])
            self.assertEqual(['refresh', 'config'], events)
            self.assertEqual([[packet[1], 0]], displayed)
            # The initial/config reply renders that same balance as well.
            run(7229, window, start=277, end=298)
            self.assertEqual([[packet[1], 0]] * 2, displayed)

    def test_swf_only_changes_audited_methods_and_preserves_other_abc_records(self):
        oldsource=subprocess.check_output(['git','show',BASELINE+':web/GameFrame.swf'],cwd=ROOT)
        self.assertEqual(self.source,patch_swf(oldsource));self.assertEqual(self.source,patch_swf(self.source))
        raw,(_,_,a,b)=abc_section(oldsource);old,_=normalize(raw[a:b]);_,_,oldb=inspect_abc(old)
        changed=set()
        for mid,(a,size,limits) in oldb.items():
            b,length,newlimits=self.bodies[mid]
            if old[a:a+size]!=self.abc[b:b+length] or limits!=newlimits:changed.add(mid)
        self.assertEqual(METHODS,changed)

    def test_pack_changes_only_switches_and_keeps_all_rewards(self):
        directory=CLIENT.parent/'v2/lang/zh-cn';pack=directory/'zh-cn.dat'
        before=dict(read_pack(subprocess.check_output(['git','show',BASELINE+':web/v2/lang/zh-cn/zh-cn.dat'],cwd=ROOT)))
        after=dict(read_pack(pack.read_bytes()))
        self.assertEqual(before.keys(),after.keys());self.assertEqual(set(SWITCHES),{k for k in before if before[k]!=after[k]})
        for name,fields in SWITCHES.items():
            self.assertEqual(after[name],(directory/name).read_bytes())
            self.assertEqual(after[name],patch_config(before[name],name))
            old=read_cbp(before[name])[1];new=read_cbp(after[name])[1]
            for field in fields:
                flag=new.child(field).child('isOpen');self.assertEqual((1,b'\0'*8),(flag.kind,flag.value))
                new.child(field).children=[n for n in new.child(field).children if n.name!='isOpen']
            self.assertEqual(write_node(old),write_node(new))


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--lua-path',type=Path);args=parser.parse_args()
    if args.lua_path:sys.path.insert(0,str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]],verbosity=2)
