"""Exercise retired protocols, shipped navigation, reminders and reward preservation."""
from __future__ import annotations

import argparse
from pathlib import Path
import subprocess
import sys
import unittest

from patch_retired_festival_pages import BASELINE, CLIENT, METHODS, ROOT, SWITCHES, patch_swf, patch_config
from patch_wanfu_opening import METHODS as WANFU_METHODS, patch_swf as wanfu_opening
from patch_spring_display import BASELINE as DISPLAY_BASELINE, METHODS as DISPLAY_METHODS, patch_swf as spring_display
from patch_activity_entries import QD_ARRAYS, strings_of
from patch_activity_reminders import normalize
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp, read_pack, write_node
from patch_spring_recharge import patch_config as spring_recharge, server_rewards
from patch_retired_hunt_pages import METHODS as HUNT_METHODS, SPRING_BUTTONS, patch_swf as retired_hunt, patch_config as hunt_config, SWITCHES as HUNT_SWITCHES
from test_activity_reminders import execute

SERVER = ROOT / 'Server/S1001/data'
LUA_FILES = ('config/activity/SpringFestivalCfg.lua', 'config/activity/QingDianActivityCfg.lua',
    'functions/Activity/spring/spring_goods.lua', 'functions/Activity/spring/spring_total.lua',
    'functions/ActorEvent/WithDrawYuanBao.lua', 'functions/RedPacketFunc.lua',
    'functions/Activity/QingDianActivity.lua')
SPRING_PAGES = ['NewYearGiveGiftsPage', 'NewYearBeastPage', 'NewYearRechargePage',
    'NewYearTeHuiPage', 'NewYearHongYunPage']


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
        self.assertEqual([f'84,{148+45*i}' for i in range(5)], [v['move'] for v in entries])
        baseline=subprocess.check_output(['git','show',DISPLAY_BASELINE+':web/GameFrame.swf'],cwd=ROOT)
        raw,(_,_,a,b)=abc_section(baseline);before,_=normalize(raw[a:b]);_,_,old_bodies=inspect_abc(before)
        a,size,_=old_bodies[5903];old_code=before[a:a+size]
        old_end=next(o.end for o in instructions(old_code) if o.opcode==0x68 and self.names[o.operands[0]]=='_editor')
        old_values={0:{}}
        execute(old_code,self.names,self.strings,old_values,{},lambda *_:None,end=old_end)
        def hide(v):
            if isinstance(v,dict):
                if v.get('instanceName','').startswith('_loaderbasebutton_'):
                    index=int(v['instanceName'].rsplit('_',1)[1])
                    if index not in SPRING_BUTTONS:return None
                    v['move']=f'84,{148+45*SPRING_BUTTONS.index(index)}'
                return {k:hide(child) for k,child in v.items()}
            if isinstance(v,list):return [changed for child in v if (changed:=hide(child)) is not None]
            return v
        self.assertEqual(hide(old_values[0]['_editor']),values[0]['_editor'])
        pages = [self.names[o.operands[0]] for o in ops if o.opcode == 0x60 and self.names[o.operands[0]] in SPRING_PAGES]
        # Later references attach marks; the first five are the actual page array.
        self.assertEqual(SPRING_PAGES, pages[:5])
        self.assertFalse(any(o.opcode in (0x66,0x68) and o.operands[0] in (7442,7446,7447,7448,7449,7451,7465,7466,7468) for o in ops))

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

    def test_hidden_treasure_is_never_constructed_or_refreshed_and_marks_use_retained_pages(self):
        code,_=self.body(5903);ops=instructions(code)
        start=next(o.start for o in ops if o.opcode==0x60 and self.names[o.operands[0]]=='NewYearGiveGiftsPage')
        end=next(o.start for i,o in enumerate(ops) if o.opcode==0xd0 and o.start>start and
            ops[i+1].opcode==0x66 and self.names[ops[i+1].operands[0]]=='_basesprite_0')
        for day in range(1,13):
            ctrl={'pageCount':5};obj={'_pageCtrl':ctrl};created=[];initialized=[]
            def invoke(o,n,a):
                if n=='__construct__':return {'class':o['class']}
                if n=='addPage':created.append(a[0]);return None
                if n=='getPage':return created[a[0]]
                if n=='initEvent':initialized.append(o['class']);return None
                raise ValueError(n)
            self.run_code(5903,{0:obj,5:0},{'openDay':day},invoke,start=start,end=end)
            self.assertEqual(SPRING_PAGES,[p['class'] for p in created])
            added,_=self.body(5904);ops2=instructions(added)
            loop=next(o.start for i,o in enumerate(ops2) if o.opcode==0xd0 and
                ops2[i+1].opcode==0x66 and self.names[ops2[i+1].operands[0]]=='_pageCtrl' and
                ops2[i+2].opcode==0x66 and self.names[ops2[i+2].operands[0]]=='pageCount')
            self.run_code(5904,{0:obj},{'openDay':day},invoke,start=loop)
            self.assertEqual(SPRING_PAGES,initialized)
        # Marks attach to the matching page classes after both hidden pages are removed.
        marks=[]
        code,_=self.body(5903);ops=instructions(code)
        start=next(ops[i-3].start for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(7463,))
        end=next(ops[i-2].start for i,o in enumerate(ops) if o.opcode==0x4f and o.operands==(1868,1)
            and i and ops[i-1].opcode==0x60 and self.names[ops[i-1].operands[0]]=='m_CloseBtn')
        values={0:{'_pageCtrl':ctrl,'_loaderbasebutton_1':{'x':84,'y':148},
            '_loaderbasebutton_3':{'x':84,'y':238},'_loaderbasebutton_12':{'x':84,'y':373},'_basesprite_0':{}},7:130,8:5}
        def marks_invoke(o,n,a):
            if n=='getPage':marks.append(a[0]);return created[a[0]]
            if n=='__construct__':return {}
            if n=='addChild':return None
            raise ValueError(n)
        self.run_code(5903,values,invoke=marks_invoke,start=start,end=end)
        self.assertEqual([0,2],marks)
        for page,key in ((0,'_tipsMark1'),(2,'_tipsMark2')):
            self.assertEqual(values[0][key],created[page]['mark'])
        # The first displayed button is also the default selected button.
        start=next(ops[i-3].start for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(7461,))
        end=next(ops[i-2].start for i,o in enumerate(ops) if o.opcode==0x4a and o.operands==(303,0))
        selections=[]
        self.run_code(5903,values,invoke=lambda o,n,a:selections.append((o,a)),start=start,end=end)
        self.assertIs(values[0]['_lastBtn'],values[0]['_loaderbasebutton_1'])
        self.assertEqual([(values[0]['_loaderbasebutton_1'],[True])],selections)

    def test_display_and_followup_patches_preserve_configuration_and_rewards(self):
        baseline=subprocess.check_output(['git','show',DISPLAY_BASELINE+':web/GameFrame.swf'],cwd=ROOT)
        displayed = spring_display(baseline)
        self.assertEqual(displayed, spring_display(displayed))
        self.assertEqual(self.source,retired_hunt(wanfu_opening(displayed)))
        raw,(_,_,a,b)=abc_section(baseline);before,_=normalize(raw[a:b]);_,_,old=inspect_abc(before)
        changed=set()
        for method,(a,size,limits) in old.items():
            b,length,newlimits=self.bodies[method]
            if before[a:a+size]!=self.abc[b:b+length] or limits!=newlimits:changed.add(method)
        self.assertEqual(DISPLAY_METHODS | WANFU_METHODS | HUNT_METHODS,changed);self.assertEqual(strings_of(before),self.strings)
        # Recharge rewards were subsequently revised; other Spring sections and
        # packed resources remain identical to the retired-page release.
        path='Server/S1001/data/config/activity/SpringFestivalCfg.lua'
        old=subprocess.check_output(['git','show',DISPLAY_BASELINE+':'+path],cwd=ROOT)
        current=(ROOT/path).read_bytes()
        def without_recharge(source):
            return (source.split(b'\tEveryTotalPay =',1)[0]+source.split(b'\tXiaoFeiZhuanPanNew =',1)[1]).replace('\t\tisOpen = false, -- 寻宝返利已下架\r\n'.encode(),b'')
        self.assertEqual(without_recharge(old),without_recharge(current))
        for path in ('web/v2/lang/zh-cn/zh-cn.dat','web/v2/lang/zh-cn/SpringFestivalCfg.cbp'):
            old=subprocess.check_output(['git','show',DISPLAY_BASELINE+':'+path],cwd=ROOT)
            if path.endswith('.dat'):
                old=dict(read_pack(old));current=dict(read_pack((ROOT/path).read_bytes()))
                old['SpringFestivalCfg.cbp']=spring_recharge(old['SpringFestivalCfg.cbp'],server_rewards())
                for name in HUNT_SWITCHES:old[name]=hunt_config(old[name],name)
                self.assertEqual(old,current)
            else:
                self.assertEqual(hunt_config(spring_recharge(old,server_rewards()),'SpringFestivalCfg.cbp'),(ROOT/path).read_bytes())
        compiler=LuaRuntime(unpack_returned_tuples=True).eval('function(s) local f,e=loadstring(s);return f~=nil,e end')
        links={
            'spring_total.lua':(('我也要购买/@@showWin,243,5','我也要购买/@@showWin,243,3'),
                ('我也要购买/@@showWin,243,6','我也要购买/@@showWin,243,4'),
                ('我也要领取/@@showWin,243,3','我也要领取/@@showWin,243,2')),
            'spring_monster.lua':(('立即前往/@@showWin,243>','立即前往/@@showWin,243,1>'),),
            'spring_redpacket.lua':(('<赠送红包给好友！/@@showWin,243>',''),)}
        for name,replacements in links.items():
            path=SERVER/'functions/Activity/spring'/name
            baseline=subprocess.check_output(['git','show',DISPLAY_BASELINE+':'+path.relative_to(ROOT).as_posix()],cwd=ROOT)
            for old,new in replacements:
                self.assertEqual(1,baseline.count(old.encode()));baseline=baseline.replace(old.encode(),new.encode())
            if name == 'spring_total.lua':
                for signature in ('function spring_xunbaofanli_main(sysarg,packet)',
                                  'function GetSpringXunBaoFanLiData(sysarg)',
                                  'function GetSpringXunBaoFanLiGife(sysarg, index)'):
                    original = (signature + '\r\n').encode()
                    guard = '\tif SpringFestivalCfg.hunt_times.isOpen == false then return end\r\n'.encode()
                    self.assertEqual(1, baseline.count(original))
                    baseline = baseline.replace(original, original + guard)
            self.assertEqual(baseline,path.read_bytes(),name)
            self.assertEqual((True,None),compiler(path.read_text('utf-8-sig')),name)

    def test_all_wanfu_page_variants_and_legacy_navigation_are_aligned(self):
        code,_=self.body(6021);ops=instructions(code)
        expected=['QDLoginPage','QDRechargePage','QDAccRechargePage','QDFlashSalePage','QDHongYunDangTouPage','QDConsumePage']
        for field in QD_ARRAYS:
            i=next(i for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(field,))
            self.assertEqual((6,),ops[i-1].operands)
            self.assertEqual(expected,[self.names[o.operands[0]] for o in ops[i-7:i-1]])
        retained=(0,1,2,3,8,10)
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
        self.assertEqual(self.source,retired_hunt(wanfu_opening(spring_display(patch_swf(baseline)))));self.assertEqual(self.source,patch_swf(self.source))
        raw,(_,_,a,b)=abc_section(baseline);before,_=normalize(raw[a:b]);_,_,old=inspect_abc(before)
        changed=set()
        for method,(a,size,limits) in old.items():
            b,length,newlimits=self.bodies[method]
            if before[a:a+size]!=self.abc[b:b+length] or limits!=newlimits:changed.add(method)
        self.assertEqual(METHODS | WANFU_METHODS | HUNT_METHODS,changed);self.assertEqual(strings_of(before),self.strings)
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
        self.assertEqual(set(SWITCHES)|set(HUNT_SWITCHES),{k for k in before if before[k]!=after[k]})
        lua=LuaRuntime()
        for name,fields in SWITCHES.items():
            self.assertEqual(after[name],(directory/name).read_bytes())
            expected=patch_config(before[name],name)
            if name=='SpringFestivalCfg.cbp':expected=hunt_config(spring_recharge(expected,server_rewards()),name)
            self.assertEqual(after[name],expected);self.assertEqual(after[name],patch_config(after[name],name))
            header,old=read_cbp(before[name]);_,new=read_cbp(after[name])
            lua.execute((SERVER/'config/activity'/name.replace('.cbp','.lua')).read_text('utf-8-sig'))
            for field in fields:
                node=new.child(field);self.assertFalse(lua.globals()[name[:-4]][field].isOpen)
                flag=node.child('isOpen');self.assertEqual((1,b'\0'*8),(flag.kind,flag.value))
                node.children=[v for v in node.children if v.name!='isOpen']
            if name=='SpringFestivalCfg.cbp':
                new.child('EveryTotalPay').children=old.child('EveryTotalPay').children
                new.child('hunt_times').children=[v for v in new.child('hunt_times').children if v.name!='isOpen']
            self.assertEqual(write_node(old),write_node(new),name)
        self.assertFalse(lua.globals().SpringFestivalCfg.shousui.isOpen)


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--lua-path',type=Path);args=parser.parse_args()
    if args.lua_path:sys.path.insert(0,str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]],verbosity=2)
