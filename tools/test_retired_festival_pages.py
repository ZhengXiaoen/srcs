"""Exercise retired protocols, shipped navigation, reminders and reward preservation."""
from __future__ import annotations

import argparse
from pathlib import Path
import subprocess
import sys
import unittest

from patch_retired_festival_pages import BASELINE, CLIENT, METHODS, ROOT, SPRING_BUTTONS, SWITCHES, patch_swf, patch_config
from patch_activity_entries import QD_ARRAYS, strings_of
from patch_activity_reminders import normalize
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp, read_pack, write_node
from test_activity_reminders import execute

SERVER = ROOT / 'Server/S1001/data'
LUA_FILES = ('config/activity/SpringFestivalCfg.lua', 'config/activity/QingDianActivityCfg.lua',
    'functions/Activity/spring/spring_goods.lua', 'functions/Activity/spring/spring_total.lua',
    'functions/ActorEvent/WithDrawYuanBao.lua', 'functions/RedPacketFunc.lua',
    'functions/Activity/QingDianActivity.lua')
SPRING_PAGES = ['NewYearPackPage', 'NewYearGiveGiftsPage', 'NewYearBeastPage', 'NewYearRechargePage',
    'NewYearTreasuePage', 'NewYearTeHuiPage', 'NewYearHongYunPage', 'NewYearHaoliPage']


class RetiredServerTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.lua.execute('''
            noop=function() end; callbacks={}; LocalDT={}; EventCallDispatcher={registerEventCall=noop}
            BaseTypes={ActorEventId={}}
            register_spring_festival_func=function(id,f) callbacks[id]=f end
            register_spring_festival_start_end_func=noop
            MiscsImplementEx={registerMsgHandler=noop}
            LogicCmd={miscSysEx={sub={}}}
            state={SpringTime=123,QingDian_openDay=3,isDringQingDianActivity=1,redpack={count=999}}
            actor={days={},newdays={},Spring_Data={XFZPCosume=321,XFZP=2}}
            is_spring_festival_time=function() return true end
            System={getStaticVar=function() return state end}
            Actor={getStaticVar=function() return actor end,IsActorInited=function() return true end}
            DataPack={readByte=function(p) return table.remove(p,1) end}
        ''')
        for file in LUA_FILES:
            self.lua.execute((SERVER / file).read_text('utf-8-sig'))

    def test_changed_files_and_combined_chunk_compile_without_new_top_level_locals(self):
        compiler = self.lua.eval('function(s) local f,e=loadstring(s); return f~=nil,e end')
        sources = [(SERVER / f).read_text('utf-8-sig') for f in LUA_FILES]
        self.assertEqual((True, None), compiler('\n'.join(sources)))
        for file, source in zip(LUA_FILES, sources):
            baseline = subprocess.check_output(['git', 'show', BASELINE + ':Server/S1001/data/' + file], cwd=ROOT).decode('utf-8-sig')
            # No additional declarations in the outer merged include scope.
            self.assertEqual([l for l in baseline.splitlines() if l.startswith('local ')],
                             [l for l in source.splitlines() if l.startswith('local ')], file)

    def test_retired_direct_calls_return_before_reading_or_mutating_actor_inventory(self):
        self.lua.execute('''
            fail=function() error('retired operation touched actor, currency, packet or rewards') end
            Actor=setmetatable({},{__index=function() return fail end})
            System=setmetatable({},{__index=function() return fail end})
            DataPack=setmetatable({},{__index=function() return fail end})
            Awards=setmetatable({},{__index=function() return fail end})
            spring_goods_main(1,{});spring_goods_get_data(1);spring_goods_buy(1,{})
            spring_JiZi_main(1,{});GetSpringJiZiGift(1,1)
            spring_xiaofeizhuanpan_main(1,{});GetSpringXiaoFeiZhuanPanData(1);GetSpringXiaoFeiZhuanPanGife(1)
            GetQingDianJiZiGift(1,1)
        ''')

    def test_old_protocols_cannot_dispatch_retired_rewards_or_queries(self):
        self.lua.execute('''
            rewards=0
            GetQingDianJiZiGift=function() rewards=rewards+1 end
            QingDianActivitys(1,0,{8,1});GetQingDianActivityInfo(1,8)
            callbacks[5](1,{2,1});callbacks[10](1,{2,1});callbacks[13](1,{2})
        ''')
        self.assertEqual(0, self.lua.eval('rewards'))
        self.assertEqual(321, self.lua.eval('actor.Spring_Data.XFZPCosume'))
        self.assertEqual(2, self.lua.eval('actor.Spring_Data.XFZP'))

    def test_consuming_does_not_accumulate_or_send_retired_spin_reminders(self):
        self.lua.execute('''
            Actor.getIntProperty=function() return 2 end;Actor.getName=function() return 'test' end
            System.sendCommonLog=noop;OnRankingConsumeYbEvent=noop;OnLuaEvent=noop
            ZP_IsUseOld=function() return false end;sendClientConsumeInfo=noop
            LuaEventId={ActorConsumeYb=1};XiaoFeiZhuanPan={cosumeEveryYB=100};LogIds={xiaofeiLog=1}
            LogicCmd.miscSysEx.sub.sXiaoFeiZhuanPan=78
            packets={};DataPack.allocPacket=function(a,sys,cmd)
                assert(cmd==78,'retired spin packet');local p={};table.insert(packets,p);return p end
            DataPack.writeByte=noop;DataPack.writeInt=noop;DataPack.writeUInt=noop;DataPack.flush=noop
            ClearAllSpringData=function() error('retired consumption cleared spring state') end
            OnConsumeYuanBaoEvent(1,250,178)
        ''')
        self.assertEqual(321, self.lua.eval('actor.Spring_Data.XFZPCosume'))
        self.assertEqual(1, self.lua.eval('#packets'))
        self.assertEqual(250, self.lua.eval('actor.dayConsumeYB_WUYI'))

    def test_spring_restart_and_midnight_preserve_independent_redpacket_pool(self):
        self.lua.execute('''
            InitRedPacket=function() error('retired shousui reset independent redpack') end
            ClearSpringHongYunDangTouSystemData=noop;EnsureSpringHongYunDangTouSystemData=noop
            Ranking={getRanking=function() return nil end}
            RedPacketCfg={RankName='independent_redpack'}
            spring_hongyun_activity_start_or_end(true,false)
            spring_hongyun_activity_start_or_end(true,true);RedPacketCross()
        ''')
        self.assertEqual(999, self.lua.eval('state.redpack.count'))


class RetiredClientTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = CLIENT.read_bytes()
        raw, (_, _, a, b) = abc_section(cls.source); cls.abc, _ = normalize(raw[a:b])
        cls.names, _, cls.bodies = inspect_abc(cls.abc, 'NewYearWin'); cls.strings = strings_of(cls.abc)

    def body(self, method):
        a, size, limits = self.bodies[method]; return self.abc[a:a+size], limits

    def run_code(self, method, values, globals_=None, invoke=None, **kwargs):
        code, limits = self.body(method)
        result, stack = execute(code, self.names, self.strings, values, globals_ or {}, invoke or (lambda *_: None), **kwargs)
        self.assertLessEqual(stack, limits[0]); return result

    def test_spring_buttons_have_contiguous_positions_and_only_retained_pages(self):
        code, _ = self.body(5903); ops = instructions(code)
        end = next(o.end for o in ops if o.opcode == 0x68 and self.names[o.operands[0]] == '_editor')
        values = {0: {}}; self.run_code(5903, values, end=end)
        def buttons(v):
            if isinstance(v, dict):
                if v.get('instanceName','').startswith('_loaderbasebutton_'): yield v
                for child in v.values(): yield from buttons(child)
            elif isinstance(v, list):
                for child in v: yield from buttons(child)
        entries = list(buttons(values[0]['_editor']))
        self.assertEqual(['_loaderbasebutton_'+str(i) for i in SPRING_BUTTONS], [v['instanceName'] for v in entries])
        self.assertEqual([f'84,{148+45*i}' for i in range(8)], [v['move'] for v in entries])
        pages = [self.names[o.operands[0]] for o in ops if o.opcode == 0x60 and self.names[o.operands[0]] in SPRING_PAGES]
        # Later references attach marks; the first eight are the actual page array.
        self.assertEqual(SPRING_PAGES, pages[:8])
        self.assertFalse(any(o.opcode in (0x66,0x68) and o.operands[0] in (7446,7447,7449,7451,7465,7466) for o in ops))

    def test_spring_clicks_select_correct_page_and_retired_buttons_do_nothing(self):
        for clicked in range(13):
            with self.subTest(clicked=clicked):
                buttons = {f'_loaderbasebutton_{i}': {'id': i} for i in range(13)}
                ctrl = {'activePageIndex': -1}; last = {'id':99}; obj = {**buttons,'_pageCtrl':ctrl,'_lastBtn':last}
                calls=[]
                self.run_code(5906,{0:obj,1:{'currentTarget':buttons[f'_loaderbasebutton_{clicked}']}},
                    invoke=lambda b,n,a: calls.append((b['id'],n,a)))
                if clicked in SPRING_BUTTONS:
                    self.assertEqual(SPRING_BUTTONS.index(clicked),ctrl['activePageIndex'])
                    self.assertEqual([(99,'setSelect',[False]),(clicked,'setSelect',[True])],calls)
                else:self.assertEqual(-1,ctrl['activePageIndex']);self.assertEqual([],calls)

    def test_treasure_creation_refresh_and_hunt_gift_mark_use_compacted_slots(self):
        code,_=self.body(5903);ops=instructions(code)
        start=next(o.start for o in ops if o.opcode==0x60 and self.names[o.operands[0]]=='NewYearPackPage')
        end=next(o.start for o in ops if o.opcode==0xd0 and o.start>start and
            ops[ops.index(o)+1].opcode==0x66 and self.names[ops[ops.index(o)+1].operands[0]]=='_basesprite_0')
        treasure=[{'class':f'Treasure{i}'} for i in range(4)]
        for day in range(1,13):
            ctrl={'pageCount':8};obj={'_pageCtrl':ctrl,'_treasurePages':treasure};created=[]
            def invoke(o,n,a):
                if n=='__construct__':return {'class':o['class']}
                if n=='addPage':created.append(a[0]);return None
                raise ValueError(n)
            self.run_code(5903,{0:obj,5:0},{'openDay':day},invoke,start=start,end=end)
            self.assertEqual(8,len(created));self.assertEqual(f'Treasure{(day-1)%3}',created[4]['class'])
            # The original daily replacement formula is retained, with only its slot moved.
            ctrl['pages']=created;swaps=[]
            def refresh(o,n,a):
                if n=='int':return int(a[0])
                if n=='getPage':return ctrl['pages'][a[0]]
                if n=='removePageAt':swaps.append(a[0]);ctrl['pages'].pop(a[0]);return None
                if n=='addPageAt':ctrl['pages'].insert(a[1],a[0]);return None
                if n=='__construct__':return {'class':o['class']}
                if n=='initEvent':return None
                raise ValueError(n)
            self.run_code(5904,{0:obj,7:0,6:8},{'openDay':day},refresh,start=273)
            self.assertTrue(all(slot==4 for slot in swaps))
            self.assertEqual(f'Treasure{int((day-2)/3)}',ctrl['pages'][4]['class'])
            swaps.clear()
            self.run_code(5904,{0:obj,7:0,6:8},{'openDay':day},refresh,start=273)
            self.assertEqual([],swaps)
        marks=[]
        self.run_code(5903,{0:{'_pageCtrl':ctrl,'_tipsMark1':{},'_tipsMark2':{},'_tipsMark5':{},
            '_loaderbasebutton_1':{'x':84,'y':193},'_loaderbasebutton_3':{'x':84,'y':283},
            '_loaderbasebutton_12':{'x':84,'y':463},'_basesprite_0':{}},7:130,8:5},
            invoke=lambda o,n,a: (marks.append(a[0]) or {}) if n=='getPage' else {} if n=='__construct__' else None,
            start=1666,end=1846)
        self.assertEqual([1,3,7],marks)

    def test_all_wanfu_page_variants_and_legacy_navigation_are_aligned(self):
        code,_=self.body(6021);ops=instructions(code)
        expected=['QDLoginPage','QDRechargePage','QDAccRechargePage','QDFlashSalePage','QDHongYunDangTouPage','QDConsumePage','QDZhenBaoGePage','QDHaoLiPage']
        for field in QD_ARRAYS:
            i=next(i for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(field,))
            self.assertEqual((8,),ops[i-1].operands)
            self.assertEqual(expected,[self.names[o.operands[0]] for o in ops[i-9:i-1]])
        retained=(0,1,2,3,8,10,12,13)
        for old in range(-1,17):
            obj={'selectedIndex':-1};self.run_code(6042,{0:obj,1:old})
            self.assertEqual(retained.index(old) if old in retained else -1,obj['selectedIndex'])
        for method in (6023,6025,6026,6027):
            code,_=self.body(method)
            self.assertFalse(any(o.opcode in (0x66,0x68) and o.operands[0] in (7630,7654,7675) for o in instructions(code)))

    def test_spring_entry_never_glows_from_collect_words_and_preserves_retained_rewards(self):
        mgr={'_cfg':{'time':[2026,10,12,2026,10,23]},'openDay':1}
        for login,charge in ((False,False),(True,False),(False,True)):
            def invoke(o,n,a):
                if n=='getCurrentServerDate':return {'date':12,'month':9,'fullYear':2026}
                if n=='checkCollectWord':return self.run_code(3326,{0:mgr})
                if n=='checkNewYearCollect':return self.run_code(3328,{0:mgr})
                if n=='checkLoginCanGet':return login
                if n=='checkNewYearCharge':return charge
                raise ValueError(n)
            self.assertEqual(login or charge,self.run_code(3325,{0:mgr},invoke=invoke))

    def test_full_patch_is_reproducible_idempotent_and_branch_targets_keep_loop_labels(self):
        baseline=subprocess.check_output(['git','show',BASELINE+':web/GameFrame.swf'],cwd=ROOT)
        self.assertEqual(self.source,patch_swf(baseline));self.assertEqual(self.source,patch_swf(self.source))
        raw,(_,_,a,b)=abc_section(baseline);before,_=normalize(raw[a:b]);_,_,old=inspect_abc(before)
        changed=set()
        for method,(a,size,limits) in old.items():
            b,length,newlimits=self.bodies[method]
            if before[a:a+size]!=self.abc[b:b+length] or limits!=newlimits:changed.add(method)
        self.assertEqual(METHODS,changed);self.assertEqual(strings_of(before),self.strings)
        for method in METHODS:
            code,limits=self.body(method);ops=instructions(code)
            for o in ops:
                if o.opcode in (0x62,0x63,0xc2,0xc3,0x08):self.assertLess(o.operands[0],limits[1])
                for _,target,_ in o.branches:
                    if target<=o.start:self.assertEqual(0x09,code[target],(method,o.start,target))

    def test_pack_changes_only_switches_and_preserves_all_original_reward_nodes(self):
        directory=ROOT/'web/v2/lang/zh-cn';relative=(directory/'zh-cn.dat').relative_to(ROOT).as_posix()
        before=dict(read_pack(subprocess.check_output(['git','show',BASELINE+':'+relative],cwd=ROOT)))
        after=dict(read_pack((directory/'zh-cn.dat').read_bytes()))
        self.assertEqual(before.keys(),after.keys())
        self.assertEqual(set(SWITCHES),{k for k in before if before[k]!=after[k]})
        lua=LuaRuntime()
        for name,fields in SWITCHES.items():
            self.assertEqual(after[name],(directory/name).read_bytes())
            self.assertEqual(after[name],patch_config(before[name],name));self.assertEqual(after[name],patch_config(after[name],name))
            header,old=read_cbp(before[name]);_,new=read_cbp(after[name])
            lua.execute((SERVER/'config/activity'/name.replace('.cbp','.lua')).read_text('utf-8-sig'))
            for field in fields:
                node=new.child(field);self.assertFalse(lua.globals()[name[:-4]][field].isOpen)
                flag=node.child('isOpen');self.assertEqual((1,b'\0'*8),(flag.kind,flag.value))
                node.children=[v for v in node.children if v.name!='isOpen']
            self.assertEqual(write_node(old),write_node(new),name)
        self.assertFalse(lua.globals().SpringFestivalCfg.shousui.isOpen)


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--lua-path',type=Path);args=parser.parse_args()
    if args.lua_path:sys.path.insert(0,str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]],verbosity=2)
