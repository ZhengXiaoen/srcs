"""Verify migrated activity protocols, reward state and shipped AVM2 pages."""
from pathlib import Path
import argparse
import re
import struct
import subprocess
import sys
import unittest
import zlib

from test_consume_ranking import SETUP
from patch_super_anniversary import (CLIENT, ROOT, SLOTS, MERGED_EVENTS, patch_swf,
                                    abc_section, normalize, inspect_abc, instructions,
                                    pool_layout, bytecode_requirements)
import test_activity_reminders as reminders
from test_activity_reminders import execute, config_value
from patch_guild_quest_config import read_cbp, read_pack
from patch_consume_ranking_client import verify_rewards

DATA = ROOT / 'Server/S1001/data'
BASELINE = 'd708b6e4d1045a37916ea6f68aec0544c5770868'


def source(path):
    return (DATA / path).read_text(encoding='utf-8-sig').rstrip('\0')


def function(path, name):
    text = source(path)
    match = re.search(r'^(?:function '+name+r'\(|'+name+r'\s*=\s*function\s*\()', text, re.M)
    if match is None: raise ValueError(name)
    end = re.search(r'^end\s*$', text[match.start():], re.M)
    return text[match.start():match.start()+end.end()]


class ServerTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.lua.execute(SETUP)
        self.lua.execute('''
player={days={PeyNum=0}}; actors[1]=player; awards={}; packets={}; balance=100000000
System.trace=function() end;System.sendCommonLog=function() end
System.isCrossServer=function() return false end
System.getServerOpenTime=function() return 100*86400 end
Actor.IsActorInited=function() return true end
Actor.sendTipmsg=function() end
Actor.getIntProperty=function(_,key) if key==PROP_ACTOR_YUANBAO then return balance end;return 80 end
Actor.changeMoney=function(_,_,amount) balance=balance+amount;return true end
Actor.getIntPropertyForRanking=1
PROP_ACTOR_YUANBAO=2;PROP_CREATURE_LEVEL=3;mtYuanbao=3
ttFlyTip=1;ttChatWindow=1;ttScreenCenter=1
LogIds=setmetatable({},{__index=function() return 1 end})
LogicCmd={miscSysEx={sub=setmetatable({},{__index=function(_,k) return k end})}}
DataPack={
 allocPacket=function(_,_,kind) return {kind=kind} end,
 readByte=function(p) return table.remove(p,1) end,
 writeByte=function(p,v) table.insert(p,v) end,
 writeInt=function(p,v) table.insert(p,v) end,
 writeUInt=function(p,v) table.insert(p,v) end,
 flush=function(p) table.insert(packets,p) end,
}
Awards={CheckBagGridCount=function() return true end,
 Give=function(_,award) table.insert(awards,award);return true end}
LuaHelp={getAllActorList=function() return {} end}
RegisterBackCmd=function() end
MiscsImplementEx={registerMsgHandler=function() end}
ClearOneYearHongYunDangTouSystemData=function() end
daily_pay_ranking_start=function() end;daily_pay_ranking_end=function() end
daily_pay_ranking_send_data=function() end
LocalDT.InitAnniversaryPayRanking=function() end
EnsureNationalDayActivity=function() end;ensure_spring_festival_activity=function() end
daily_pay_ranking_ScriptRankingNewDayArrive=function()
 state.daily_pay_ranking_last_settle_date=math.floor(now/86400)*86400
end
XiaoFeiZhuanPan={cosumeEveryYB=100000};ZP_IsUseOld=function() return false end
sendClientConsumeInfo=function() end;OnLuaEvent=function() end;LuaEventId={ActorConsumeYb=1}
GetOneYearActInfoForTest=function() end
''')
        for path in ('config/OneYearActivity.lua','config/activity/QingDianActivityCfg.lua',
                     'config/activity/SanRenHongLiCfg.lua','config/new_activity/festival/activity_jingji.lua',
                     'config/new_activity/festival/activity_DaJiDaLi.lua','config/activity/PublicTestCfg.lua'):
            self.lua.execute(source(path))
        self.lua.execute(function('functions/player.lua','ClearOneYear_Data'))
        self.lua.execute(function('functions/player.lua','ClearJingJi_Data'))
        for path in ('new_activity/festival/OneYearActivity.lua', 'new_activity/festival/ActivityRankFunc.lua',
                     'new_activity/festival/activity_jingji.lua','new_activity/SanRenHongLi.lua',
                     'new_activity/festival/activity_dajidali.lua','Activity/QingDianActivity.lua',
                     'modules/YbConsumeRanking.lua','Activity/RecurringActivities.lua'):
            self.lua.execute(source('functions/'+path))
        for name in ('UpdateQingDianEveryTotalPayProgressByDailyPay','OnConsumeYuanBaoEvent'):
            self.lua.execute(function('functions/ActorEvent/WithDrawYuanBao.lua',name))
        self.lua.execute('''state.StartOneYear_OpenDay=7;state.isDringOneYearAct=1
state.StartOneYear_Minitime=now;GetOneYearActInfo=function() end''')

    def run_lua(self, text): return self.lua.execute(text)
    def value(self, text): return self.lua.eval(text)

    def test_all_material_counts_claims_and_protocols(self):
        for msg, cfg in ((6,'GemRank'),(7,'PeartRank'),(8,'MountRank'),(9,'RingRank')):
            self.run_lua(f'''HandleAddNewRankCount(1,{msg},activity_jingji.{cfg}[1].count-1)
handleJingjiActivity(1,0,{{{msg},2,1}})''')
            self.assertEqual(msg-6,self.value('#awards'))
            self.run_lua(f'''HandleAddNewRankCount(1,{msg},1)
handleJingjiActivity(1,0,{{{msg},2,1}});handleJingjiActivity(1,0,{{{msg},2,1}})''')
            self.assertTrue(self.value(f'awards[{msg-5}]==activity_jingji.{cfg}[1].award'))
            self.assertEqual(1,self.value(f'player.OneYearAct_Data.material[{msg}].isGive[1]'))
        self.assertEqual(4,self.value('#awards'))
        self.run_lua('HandleAddNewRankCount(1,6,-1);HandleAddNewRankCount(1,5,999999)')
        self.assertIsNone(self.value('player.OneYearAct_Data.material[5]'))

    def test_merged_progress_reset_only_on_new_anniversary(self):
        self.run_lua('''HandleAddNewRankCount(1,6,1000);player.OneYearAct_Data.loginflag={1}
player.OneYearAct_Data.consumeGift.Consume=5000;player.days.AnniversaryPayTime={1}
state.isDringOneYearAct=2;LocalDT.ClearAnniversaryMergedData(1)''')
        self.assertEqual(1000,self.value('player.OneYearAct_Data.material[6].count'))
        self.assertEqual(1,self.value('player.OneYearAct_Data.loginflag[1]'))
        self.run_lua('state.StartOneYear_Minitime=now+86400;LocalDT.ClearAnniversaryMergedData(1)')
        self.assertIsNone(self.value('player.OneYearAct_Data.material[6]'))
        self.assertIsNone(self.value('player.OneYearAct_Data.consumeGift.Consume'))
        self.assertEqual(0,self.value('#player.days.AnniversaryPayTime'))

    def test_consumption_accumulates_every_anniversary_day_and_claims_once(self):
        self.run_lua('''OnYbConsumeRanking_ActivityStart(1,1,7)
OnConsumeYuanBaoEvent(1,1000,1);state.isDringOneYearAct=7
OnConsumeYuanBaoEvent(1,activity_DaJiDaLi.comsumeGiveAward.Info[1].needMoney,1)
handleDaJiDaLi(1,0,{6,1});handleDaJiDaLi(1,0,{6,1})''')
        self.assertEqual(1,self.value('#awards'))
        self.assertTrue(self.value('awards[1]==activity_DaJiDaLi.comsumeGiveAward.Info[1].award'))
        self.assertEqual(1,self.value('player.OneYearAct_Data.consumeGift.dajidaliConsume[1]'))
        self.assertIsNone(self.value('player.DJDL_Data'))

    def test_recharge_seven_days_once_daily_and_claim_once(self):
        for day in range(1,8):
            self.run_lua(f'''state.isDringOneYearAct={day};player.days={{PeyNum=100000000}}
UpdateQingDianEveryTotalPayProgressByDailyPay(1,player,state)
UpdateQingDianEveryTotalPayProgressByDailyPay(1,player,state)''')
            for tier in range(1,5):
                self.assertEqual(day,self.value(f'player.OneYearAct_Data.recharge.payTotal[{tier}]'))
        self.run_lua('QingDianActivitys(1,0,{12,1,7});QingDianActivitys(1,0,{12,1,7})')
        self.assertEqual(1,self.value('#awards'))
        self.assertTrue(self.value('awards[1]==QingDianActivityCfg.EveryTotalPay[1].days[7].award'))
        self.assertIsNone(self.value('player.QDHD_Data'))
        self.run_lua('''state.StartOneYear_Minitime=now+7*86400;state.isDringOneYearAct=1
UpdateQingDianEveryTotalPayProgressByDailyPay(1,player,state)''')
        self.assertEqual(1,self.value('player.OneYearAct_Data.recharge.payTotal[1]'))

    def test_lucky_spin_daily_allowance_balance_and_reply(self):
        self.run_lua('''player.days.PeyNum=SanRenHongLiCfg.LuckeyZhuanPan.needPay[1]
math.random=function() return 1 end;handleSanRenHongLi(1,0,{4});handleSanRenHongLi(1,0,{4})''')
        self.assertEqual(1,self.value('player.days.sanrenhongliDraw'))
        self.assertTrue(self.value('packets[1][1]==4 and packets[1][2]==1'))
        self.run_lua('player.days.sanrenhongliDraw=0;balance=0;handleSanRenHongLi(1,0,{4})')
        self.assertEqual(0,self.value('player.days.sanrenhongliDraw'))

    def test_closed_anniversary_rejects_all_migrated_protocols(self):
        self.run_lua('''state.isDringOneYearAct=nil
HandleAddNewRankCount(1,6,99999);handleJingjiActivity(1,0,{6,2,1})
handleDaJiDaLi(1,0,{6,1});QingDianActivitys(1,0,{12,1,1})
handleSanRenHongLi(1,0,{4});UpdateQingDianEveryTotalPayProgressByDailyPay(1,player,state)
OnYbConsumeRanking_ActivityStart(1,1,7)''')
        self.assertEqual(0,self.value('#awards'))
        self.assertEqual(0,self.value('#packets'))
        self.assertIsNone(self.value('player.OneYearAct_Data'))
        self.assertFalse(self.value('YbConsumeRanking_inTime'))

    def test_original_activities_cannot_restart_and_retired_anniversary_claims_rejected(self):
        self.run_lua('''StartSanRenHongLi(1);StartDaJiDaLi(1);StartQingDianActivity(3,1)
StartJingJi(3,1,2);handleOneYearAct(1,0,{3});handleOneYearAct(1,0,{4,1})''')
        for field in ('isDringSanRenHongLi','isDringDaJiDaLi','isDringQingDianActivity','isDringJingJi'):
            self.assertIsNone(self.value('state.'+field))
        self.assertEqual(0,self.value('#awards'))

    def test_rank_settlement_reload_and_final_day_send_once(self):
        self.run_lua('''OnYbConsumeRanking_ActivityStart(1,1,7);OnRankingConsumeYbEvent(1,2000000)
YbConsumeRanking_save();YbConsumeRanking_load();now=now+86400
OnYbConsumeRankingNewDayArrive();OnYbConsumeRankingNewDayArrive()''')
        self.assertEqual(1,self.value('#mails'))
        self.assertEqual('周年庆典每日消费排行',self.value('mails[1].title'))
        self.assertEqual('7039,5,1/6820,1,1/6364,1,1/5384,5,1',self.value('mails[1].award'))
        self.run_lua('''actors={};OnRankingConsumeYbEvent(2,2000000)
OnYbConsumeRanking_ActivityEnd(1);state.isDringOneYearAct=nil;now=now+86400
OnYbConsumeRankingNewDayArrive();OnYbConsumeRankingNewDayArrive()''')
        self.assertEqual(2,self.value('#mails'))
        self.assertFalse(self.value('YbConsumeRanking_inTime'))

    def test_recurring_closes_old_activities_and_anniversary_cycles(self):
        self.run_lua('''state.isDringOneYearAct=nil;state.StartOneYear_OpenDay=nil
state.isDringQingDianActivity=1;state.isDringSanRenHongLi=1;state.isDringDaJiDaLi=1
state.isDringJingJi=1;state.JingJiActivityTypes=2
for _,cfg in ipairs(LocalDT.RecurringActivities) do
 if cfg.name=='OneYear' then LocalDT.RecurringActivities={cfg};break end
end
EnsureRecurringActivities()''')
        for day in range(9):
            self.assertEqual(day%7+1,self.value('state.isDringOneYearAct'))
            self.assertEqual(7-day%7,self.value('state.YbConsumeRankingActivities[1]'))
            for field in ('isDringQingDianActivity','isDringSanRenHongLi','isDringDaJiDaLi','isDringJingJi'):
                self.assertIsNone(self.value('state.'+field))
            self.run_lua('now=now+86400;EnsureRecurringActivities();EnsureRecurringActivities()')


class ClientTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        raw,(_,_,a,b)=abc_section(CLIENT.read_bytes());cls.abc,_=normalize(raw[a:b])
        cls.names,cls.classes,cls.bodies=inspect_abc(cls.abc)
        cls.strings=pool_layout(cls.abc)[2]
        cls.configs={}
        for name in ('SanRenHongLiCfg.cbp','activity_DajiDaLi.cbp','oneyearactivitycfg.cbp',
                     'activityjingji.cbp','QingDianActivityCfg.cbp'):
            cls.configs[name]=config_value(read_cbp((ROOT/'web/v2/lang/zh-cn'/name).read_bytes())[1])

    def setUp(self):
        self.h=reminders.ActivityRemindersTests()
        self.h.abc={False:self.abc};self.h.before={};self.h.cache={};self.h.symbols={False:(self.names,None,self.bodies)}
        self.h.configs=self.configs;self.h.setUp()
        self.h.globals['GameData'].update(jingji2Provider={'cfg':self.configs['activityjingji.cbp']},
                                         qingdianActiveProvider={'cfg':self.configs['QingDianActivityCfg.cbp']})
        self.h.globals['GlobalData']['qdActivityDataMgr']={'rechargeDays':[], 'rechargeStatu':[]}
        for name in ('jingjiFanliUseNum','jingJiFanliGet'):self.h.hong[name]=[]

    def code(self,mid):
        start,length,_=self.bodies[mid];return self.abc[start:start+length]

    def test_page_arrays_and_visible_slots(self):
        obj={};code=self.code(22158)
        end=next(op.end for op in instructions(code) if op.opcode==0x68 and self.names[op.operands[0]]=='PAGES')
        execute(code,self.names,self.strings,{0:obj},{},lambda *_:None,end=end)
        self.assertEqual(SLOTS,tuple(i for i,p in enumerate(obj['PAGES']) if p))
        self.assertEqual('AnniversaryHongLiTurnPage',obj['PAGES'][13]['class'])
        static={};execute(self.code(22157),self.names,self.strings,{0:static},{'ACTIVITYS':static,'DAY_CHANGE':static},lambda *_:None)
        self.assertEqual(list(range(20012,20017)),static['ACTIVITYS'][12:])

    def test_full_window_constructor_initializes_ui_within_flash_stack(self):
        obj={};globals_={'GlobalData':{'gameWidth':1600,'gameHeight':900},
                        'm_CloseBtn':{},'m_nDragY':obj,'addChild':obj,'move':obj,
                        'CustomList':{'class':'CustomList'}}
        obj.update(uiWidth=1316,uiHeight=692)
        def invoke(target,name,args):
            if name=='__construct__':return {}
            if name=='createUIByJson':
                return {item['instanceName']:{} for item in args[1]['childCom']}
            return None
        _,maximum=execute(self.code(22158),self.names,self.strings,
                          {0:obj,1:None,2:None,3:None},globals_,invoke)
        self.assertEqual(23,maximum)
        self.assertLessEqual(maximum,self.bodies[22158][2][0])
        self.assertEqual(40,obj['_list']['itemHeight'])
        self.assertEqual('YearActiveItemRender',obj['_list']['itemClass']['class'])
        self.assertIsNone(obj['_editor'])

    def test_flash_verifies_every_modified_function_and_imported_page(self):
        baseline=subprocess.check_output(['git','show',BASELINE+':web/GameFrame.swf'],cwd=ROOT)
        raw,(_,_,a,b)=abc_section(baseline);old,_=normalize(raw[a:b]);_,_,old_bodies=inspect_abc(old)
        for mid,(start,length,limits) in self.bodies.items():
            if mid in old_bodies:
                previous,size,before=old_bodies[mid]
                if limits==before and self.abc[start:start+length]==old[previous:previous+size]:continue
            stack,registers,scopes=bytecode_requirements(self.code(mid),self.names,limits[2])
            self.assertLessEqual(stack,limits[0],f'Method {mid} Flash operand stack')
            self.assertLessEqual(registers,limits[1],f'Method {mid} Flash registers')
            self.assertLessEqual(scopes,limits[3],f'Method {mid} Flash scope')

    def test_previous_black_screen_is_reproduced_and_repaired_without_code_changes(self):
        broken=subprocess.check_output(['git','show','e84eb00:web/GameFrame.swf'],cwd=ROOT)
        raw,(_,_,a,b)=abc_section(broken);old,_=normalize(raw[a:b]);names,classes,bodies=inspect_abc(old)
        mid=classes['YearActiveWin']['constructor'];start,length,limits=bodies[mid]
        stack,_,_=bytecode_requirements(old[start:start+length],names,limits[2])
        self.assertEqual(18,limits[0]);self.assertEqual(23,stack)
        self.assertEqual(CLIENT.read_bytes(),patch_swf(broken))
        for method,(previous,size,before) in bodies.items():
            now,length,after=self.bodies[method]
            self.assertEqual(old[previous:previous+size],self.abc[now:now+length],method)
            self.assertEqual((23,*before[1:]) if method==mid else before,after,method)

    def test_merged_and_retired_red_dots(self):
        for slot in (0,2,3,5,6,9,12,13,14,15,16):
            self.assertFalse(self.h.run_method(4080,self.h.year,slot),slot)
        self.h.hong['jingjiFanliUseNum']=[100000000]*4
        self.h.hong['jingJiFanliGet']=[[0]*10 for _ in range(4)]
        self.assertTrue(self.h.run_method(4080,self.h.year,12))
        self.h.hong['jingJiFanliGet']=[[1]*10 for _ in range(4)]
        self.assertFalse(self.h.run_method(4080,self.h.year,12))
        self.h.hong['hongLiTurnTime']=0;self.h.items['curPayGold']=self.h.cfg_hong['LuckeyZhuanPan']['needPay'][0]
        self.h.role['money']=100000000
        self.assertTrue(self.h.run_method(4080,self.h.year,13))
        self.h.role['money']=0;self.assertFalse(self.h.run_method(4080,self.h.year,13))
        self.h.dj.update(consumeCount=100000000,consumeStatus=[0]*10)
        self.assertTrue(self.h.run_method(4080,self.h.year,14))
        self.h.dj['consumeStatus']=[1]*10;self.assertFalse(self.h.run_method(4080,self.h.year,14))
        qd=self.h.globals['GlobalData']['qdActivityDataMgr'];qd.update(rechargeDays=[7]*4,rechargeStatu=[[0]*7 for _ in range(4)])
        self.assertTrue(self.h.run_method(4080,self.h.year,16))
        self.h.year['curDay']=0
        for slot in (12,13,14,16):self.assertFalse(self.h.run_method(4080,self.h.year,slot))

    def test_event_refresh_has_matching_unsubscribe_and_timer_stop(self):
        for add,remove,handler,skip in ((22159,22160,23814,()),(6333,6377,8171,(36018,))):
            for event_class,event in MERGED_EVENTS:
                if event in skip:continue
                for mid in (add,remove):
                    ops=instructions(self.code(mid))
                    self.assertTrue(any(op.opcode==0x66 and op.operands==(event,) for op in ops))
                    self.assertTrue(any(op.opcode==0x66 and op.operands==(handler,) for op in ops))
        mid=self.classes['AnniversaryHongLiTurnPage']['instance']['removeEvent'][0]
        self.assertTrue(any(op.opcode==0x4f and self.names[op.operands[0]]=='stop' for op in instructions(self.code(mid))))

    def test_retired_icons_are_removed_even_with_stale_client_state(self):
        self.h.buttons.update(hong={},dj={},qd={},jingji={})
        self.h.globals['MsgButtonTypes']['RIGHT_TOP_JING_JI_BTN']='jingji'
        self.h.hong['activeType']=2
        for mid in (6334,6335,6382,6408):self.h.run_method(mid,self.h.nav,None)
        self.assertEqual({},self.h.buttons)

    def test_nav_anniversary_mark_updates_from_migrated_claims(self):
        self.h.buttons['year']={}
        self.h.year.update(loginStatus=[1]*7,index=0)
        self.h.run_method(6379,self.h.nav,None)
        self.assertFalse(self.h.buttons['year']['effect'])
        self.h.dj.update(consumeCount=100000000,consumeStatus=[0]*10)
        self.h.run_method(6379,self.h.nav,None)
        self.assertTrue(self.h.buttons['year']['effect'])
        self.h.dj['consumeStatus']=[1]*10
        self.h.run_method(6379,self.h.nav,None)
        self.assertFalse(self.h.buttons['year']['effect'])

    def test_text_tab_labels_and_dates_execute_with_valid_stack(self):
        for slot,label in zip(range(12,17),('材料返利','幸运转盘','消费豪礼','消费排行','累计充值')):
            obj={'_label_0':{},'_image_0':{}}
            code=self.code(28484);props=[self.names[x.operands[0]] for x in instructions(code) if x.opcode==0x66]
            label_name=self.names[29712];image_name=self.names[29713]
            obj={label_name:{'txtLabel':{}},image_name:{}}
            def invoke(target,name,args):
                if name=='canGetAward':return False
                return None
            _,stack=execute(code[10:],self.names,self.strings,{0:obj,1:20000+slot},{'GlobalData':{'yearAcitveDataMgr':self.h.year}},invoke)
            self.assertEqual(label,obj[label_name]['caption'])
            self.assertLessEqual(stack,self.bodies[28484][2][0])
        for mid in (17932,17966,29902):
            label=next(self.names[x.operands[0]] for x in instructions(self.code(mid)) if x.opcode==0x66)
            obj={label:{}}
            def invoke(_,name,args):return 1 if name=='getServerTime' else str(args[1])
            _,stack=execute(self.code(mid),self.names,self.strings,{0:obj},{'GlobalData':{'yearAcitveDataMgr':self.h.year}},invoke)
            self.assertIn('0-6',obj[label]['caption']);self.assertLessEqual(stack,self.bodies[mid][2][0])

    def test_descriptions_and_patch_idempotence(self):
        self.assertEqual(CLIENT.read_bytes(),patch_swf(CLIENT.read_bytes()))
        for mid,expected in ((17923,'周年庆典消费排行奖励'),(28461,'活动期间累积')):
            texts=[self.strings[x.operands[0]] for x in instructions(self.code(mid)) if x.opcode==0x2c]
            self.assertTrue(any(expected in t for t in texts))

    def test_original_artwork_configs_and_unrelated_methods_unchanged(self):
        baseline=subprocess.check_output(['git','show',BASELINE+':web/GameFrame.swf'],cwd=ROOT)
        def resource_tags(swf):
            raw=swf[:8]+zlib.decompress(swf[8:]);pos=8+(5+(raw[8]>>3)*4+7)//8+4;tags=[]
            while pos<len(raw):
                start=pos;head=struct.unpack_from('<H',raw,pos)[0];pos+=2;size=head&63
                if size==63:size=struct.unpack_from('<I',raw,pos)[0];pos+=4
                end=pos+size
                if head>>6!=82:tags.append(raw[start:end])
                pos=end
            return tags
        self.assertEqual(resource_tags(baseline),resource_tags(CLIENT.read_bytes()))
        raw,(_,_,a,b)=abc_section(baseline);old,_=normalize(raw[a:b]);_,old_classes,old_bodies=inspect_abc(old)
        expected={4080,6333,6334,6335,6377,6379,6380,6382,6408,15826,15829,
                  17258,17923,17932,17965,17966,22157,22158,22159,22160,22162,
                  22163,22164,28461,28484}
        changed=set()
        for mid,(start,size,limits) in old_bodies.items():
            now,length,current=self.bodies[mid]
            if old[start:start+size]!=self.abc[now:now+length] or limits!=current:changed.add(mid)
        self.assertEqual(expected,changed)
        self.assertEqual(11,len(set(self.classes)-set(old_classes)))

    def test_reward_and_pack_consistency(self):
        verify_rewards()
        packed={k.lower():v for k,v in read_pack((ROOT/'web/v2/lang/zh-cn/zh-cn.dat').read_bytes())}
        for name in self.configs:
            self.assertEqual((ROOT/'web/v2/lang/zh-cn'/name).read_bytes(),packed[name.lower()])
        lua=LuaRuntime(unpack_returned_tuples=True)
        for file in ('config/activity/QingDianActivityCfg.lua','config/activity/SanRenHongLiCfg.lua',
                     'config/new_activity/festival/activity_jingji.lua','config/new_activity/festival/activity_DaJiDaLi.lua'):
            lua.execute(source(file))
        def value(v):
            if not hasattr(v,'keys'):return v
            keys=list(v.keys())
            if keys and all(isinstance(k,int) for k in keys):return [value(v[k]) for k in sorted(keys)]
            return {k:value(v[k]) for k in keys}
        for name in ('GemRank','PeartRank','MountRank','RingRank'):
            self.assertEqual(value(lua.globals().activity_jingji[name]),self.configs['activityjingji.cbp'][name])
        self.assertEqual(value(lua.globals().SanRenHongLiCfg.LuckeyZhuanPan),self.configs['SanRenHongLiCfg.cbp']['LuckeyZhuanPan'])
        def rewards(rows,fields):return [{k:row[k] for k in fields} for row in rows]
        self.assertEqual(rewards(value(lua.globals().activity_DaJiDaLi.comsumeGiveAward.Info),('award','needMoney')),
                         rewards(self.configs['activity_DajiDaLi.cbp']['comsumeGiveAward']['Info'],('award','needMoney')))
        self.assertEqual(rewards(value(lua.globals().QingDianActivityCfg.EveryTotalPay),('days','needPay')),
                         rewards(self.configs['QingDianActivityCfg.cbp']['EveryTotalPay'],('days','needPay')))


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--lua-path',type=Path);args=parser.parse_args()
    if args.lua_path:sys.path.insert(0,str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]],verbosity=2)
