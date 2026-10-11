"""Exercise unique ranking lifecycle, shipped AVM2 pages and resource integrity."""
from __future__ import annotations

import argparse
from pathlib import Path
import subprocess
import sys
import unittest

from patch_unique_activity_rankings import (BASELINE, CLIENT, MODULE, ROOT, MAIN_METHODS,
                                            MODULE_METHODS, patch_swf, patch_config)
from patch_consume_ranking_client import patch_swf as descriptions, verify_rewards
from patch_activity_reminders import normalize, get, number, prop
from patch_spring_activity_icon import METHODS as SPRING_METHODS, patch_swf as spring_icon
from patch_retired_festival_pages import METHODS as RETIRED_METHODS, patch_swf as retired_pages, patch_config as retired_config
from patch_wanfu_opening import METHODS as WANFU_METHODS, patch_swf as wanfu_opening
from patch_spring_display import patch_swf as spring_display
from patch_retired_hunt_pages import METHODS as HUNT_METHODS, patch_swf as retired_hunt
from patch_activity_entries import q, strings_of
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp, read_pack, write_node
from test_activity_entries import execute as entries_execute, Ref
from test_activity_reminders import execute, config_value

BASE = ROOT/'Server/S1001/data/functions'

SETUP = r'''LocalDT={}; state={daily_pay_ranking_last_settle_date=86400*100}; now=86400*100+3600; actors={}; mails={}; ranks={}; clearCount=0
System={getStaticVar=function() return state end,saveStaticVar=function() end,
 getCurrMiniTime=function() return now end,
 GetSystemTimeInMiniTime=function(t) return 2026,1,math.floor(t/86400) end,
 encodeNumTime=function(_,_,d) return d*86400 end,
 AddMail=function(id,_,_,title,desc,_,_,award) table.insert(mails,{id=id,title=title,desc=desc,award=award}) end}
Actor={getStaticVar=function(id) if not actors[id] then actors[id]={} end return actors[id] end,
 getIntProperty=function(id) return id end}
Ranking={clear_ranking=function() ranks={};clearCount=clearCount+1 end,
 update_value=function(_,id,yb)
  for _,r in ipairs(ranks) do if r.id==id then r.yb=yb;return end end
  table.insert(ranks,{id=id,yb=yb});table.sort(ranks,function(a,b) return a.yb>b.yb end)
 end,
 get_ranking_item_count=function() return #ranks end,
 get_ranking_item=function(_,i) return ranks[i+1] end,
 ranking_item_actorid=function(r) return r.id end, ranking_item_value=function(r) return r.yb end}
PROP_ENTITY_ID=1;registerLuaEventCallback=function() end;RegisterBackCmd=function() end;MiscsImplementEx={registerMsgHandler=function() end};LogicCmd={miscSysEx={sub={}}};LuaEventId={};print=function() end
'''

class UniqueServerTests(unittest.TestCase):
    def setUp(self):
        self.lua=LuaRuntime(unpack_returned_tuples=True);self.lua.execute(SETUP)
        self.lua.execute((ROOT/'Server/S1001/data/config/activity/SanRenHongLiCfg.lua').read_text('utf-8-sig'))
        self.source=(BASE/'modules/daily_pay_ranking.lua').read_text('utf-8-sig')
        self.lua.execute(self.source)

    def exec(self,s):return self.lua.execute(s)
    def value(self,s):return self.lua.eval(s)
    def start(self,day=1,duration=7):
        self.exec(f'state.isDringOneYearAct={day};state.StartOneYear_OpenDay={duration};daily_pay_ranking_start({day},{duration},2)')
    def pay(self,id=1,amount=2000000):
        self.exec(f'actors[{id}]={{days={{PeyNum={amount}}}}};daily_pay_ranking_OnActorPayMoney({id},nil)')
    def midnight(self):self.exec('now=now+86400;daily_pay_ranking_ScriptRankingNewDayArrive()')

    def test_retired_starts_and_old_states_cannot_create_or_award(self):
        self.exec('state.daily_pay_ranking_day_data=771;daily_pay_ranking_start(1,3,0);daily_pay_ranking_start(1,3,1)')
        self.pay();self.midnight()
        self.assertEqual(0,self.value('#ranks'));self.assertEqual(0,self.value('#mails'))

    def test_anniversary_only_sends_one_unchanged_reward(self):
        self.start();self.pay();self.exec('daily_pay_ranking_start(1,3,0);daily_pay_ranking_start(1,3,1)');self.midnight()
        self.assertEqual(1,self.value('#mails'))
        self.assertEqual('周年庆典每日充值排行',self.value('mails[1].title'))
        self.assertEqual(self.value('SanRenHongLiCfg.DailyPayRanking.awardList[1].mailAward'),self.value('mails[1].award'))

    def test_migration_preserves_current_rank_and_actor_pay(self):
        self.exec('state={isDringOneYearAct=2,StartOneYear_OpenDay=7,daily_pay_ranking_day_data=771,daily_pay_ranking_last_settle_date=86400*100};ranks={{id=1,yb=2000000}};actors[1]={days={PeyNum=2000000}}')
        self.lua.execute(self.source)
        self.assertEqual(6,self.value('state.daily_pay_ranking_year_days'))
        self.assertIsNone(self.value('state.daily_pay_ranking_day_data'))
        self.assertEqual(0,self.value('clearCount'))
        self.assertEqual(2000000,self.value('ranks[1].yb'))
        self.midnight();self.assertEqual(1,self.value('#mails'))

    def test_reload_migration_is_once_and_keeps_remaining_days(self):
        self.start();self.pay();self.midnight();self.lua.execute(self.source)
        self.assertEqual(6,self.value('state.daily_pay_ranking_year_days'))
        self.exec('daily_pay_ranking_ScriptRankingNewDayArrive()')
        self.assertEqual(1,self.value('#mails'))

    def test_end_before_midnight_preserves_final_rewards_and_stops_pay(self):
        self.start();self.pay()
        self.exec('daily_pay_ranking_end();state.isDringOneYearAct=nil;state.StartOneYear_OpenDay=nil')
        self.pay(2);self.assertEqual(1,self.value('#ranks'))
        self.midnight();self.assertEqual(1,self.value('#mails'))
        self.assertIsNone(self.value('state.daily_pay_ranking_year_days'))
        self.midnight();self.assertEqual(1,self.value('#mails'))

    def test_final_day_settles_before_reopening_cycle(self):
        self.start(day=7);self.pay();self.exec('now=now+86400');self.start()
        self.assertEqual(1,self.value('#mails'));self.assertEqual(0,self.value('#ranks'))
        self.assertEqual(7,self.value('state.daily_pay_ranking_year_days'))
        self.pay(2);self.exec('daily_pay_ranking_ScriptRankingNewDayArrive()')
        self.assertEqual(2,self.value('ranks[1].id'));self.assertEqual(1,self.value('#mails'))

    def test_actual_anniversary_cycle_pays_daily_once_and_preserves_today(self):
        import re
        self.exec('''System.isCrossServer=function() return false end
System.getServerOpenTime=function() return 86400*100 end
System.trace=function() end;System.setActivtyExpRate=function() end
System.broadcastTipmsg=function() end;System.hasTimer=function() return false end
LuaHelp={getAllActorList=function() return {} end}
ClearOneYearHongYunDangTouSystemData=function() end
EnsureDaJiDaLiActivity=function() end;EnsureNationalDayActivity=function() end
ensure_spring_festival_activity=function() end;OnYbConsumeRankingNewDayArrive=function() end
ttScreenCenter=1;ttChatWindow=2''')
        source=(BASE/'new_activity/festival/OneYearActivity.lua').read_text('utf-8-sig')
        for name in ('StartOneYearActivity','EndOneYearActivity'):
            a=source.index(name+' = function(');b=re.search(r'^end\s*$',source[a:],re.M)
            self.exec(source[a:a+b.end()])
        self.exec((BASE/'Activity/RecurringActivities.lua').read_text('utf-8-sig'))
        self.exec('LocalDT.RecurringActivities={LocalDT.RecurringActivities[4]};EnsureRecurringActivities()')
        for day in range(8):
            self.exec('mails={};ranks={};actors={}')
            self.pay()
            self.exec('now=now+86400;EnsureRecurringActivities();daily_pay_ranking_ScriptRankingNewDayArrive();EnsureRecurringActivities()')
            self.assertEqual(1,self.value('#mails'))
            self.assertEqual((day+1)%7+1,self.value('state.isDringOneYearAct'))
            self.assertEqual(7-(day+1)%7,self.value('state.daily_pay_ranking_year_days'))

    def test_rank_thresholds_and_top_twenty_cap_are_retained(self):
        self.start()
        for id,amount in enumerate([2000000,1000000,500000]+[200000]*22,1):self.pay(id,amount)
        self.midnight();self.assertEqual(20,self.value('#mails'))
        self.assertIn('第20名',self.value('mails[20].desc'))

    def test_below_minimum_and_closed_anniversary_do_not_rank(self):
        self.start();self.pay(amount=19999);self.assertEqual(0,self.value('#ranks'))
        self.exec('state.isDringOneYearAct=nil');self.pay();self.assertEqual(0,self.value('#ranks'))

    def test_actual_query_protocol_can_request_rank_without_sanren_or_jingji(self):
        self.lua.execute((BASE/'new_activity/SanRenHongLi.lua').read_text('utf-8-sig'))
        self.exec('''queries=0;DataPack={readByte=function(p) return table.remove(p,1) end}
GetSanRenHongLiInfo=function(_,idx) assert(idx==6);queries=queries+1 end''')
        self.start();self.exec('handleSanRenHongLi(1,0,{0,6})')
        self.assertEqual(1,self.value('queries'))
        self.exec('state.isDringOneYearAct=nil;state.isDringSanRenHongLi=1;ClearSanRenHongLi_Data=function() end;handleSanRenHongLi(1,0,{0,6})')
        self.assertEqual(1,self.value('queries'))

    def test_old_open_server_rank_has_no_awards_or_runtime_operations(self):
        self.lua.execute((BASE/'modules/OpenServer_Pay_Rank.lua').read_text('utf-8-sig'))
        self.exec('state.pay_ranking=123;Pay_Rank_StartServer();Pay_Rank_CreateRank();Pay_Rank_Activity_Start(1);Pay_Rank_UpdateItem(1,"p",200000);Pay_Rank_Activity_Stop();Pay_Rank_Query(1)')
        self.assertIsNone(self.value('state.pay_ranking'));self.assertEqual(0,self.value('#mails'))

    def test_wanfu_spin_old_request_and_direct_draw_cannot_award(self):
        self.lua.execute((ROOT/'Server/S1001/data/config/activity/QingDianActivityCfg.lua').read_text('utf-8-sig'))
        self.lua.execute((BASE/'Activity/QingDianActivity.lua').read_text('utf-8-sig'))
        self.exec('''DataPack={readByte=function(p) return table.remove(p,1) end};Actor.IsActorInited=function() return true end
state.QingDian_openDay=3;state.isDringQingDianActivity=1;draws=0
Awards={Give=function() draws=draws+1 end};GetQD_FeiZhuanPan(1)
QingDianActivitys(1,0,{14});QingDianActivitys(1,0,{10})''')
        self.assertEqual(0,self.value('draws'));self.assertEqual(0,self.value('#mails'))
        self.assertFalse(self.value('QingDianActivityCfg.XiaoFeiZhuanPanNew.isOpen'))


class UniqueClientTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.data={}
        for path in (CLIENT,MODULE):
            d,(_,_,a,b)=abc_section(path.read_bytes());abc,_=normalize(d[a:b])
            n,t,bs=inspect_abc(abc,'HongLiActiveWin' if path==MODULE else 'YearActiveWin')
            cls.data[path]=(abc,n,strings_of(abc),bs)

    def code(self,method,path=CLIENT):
        abc,n,st,bs=self.data[path];a,l,li=bs[method];return abc[a:a+l],n,st,li
    def fields(self,method,end_field,path=CLIENT):
        code,n,st,li=self.code(method,path)
        end=next(o.end for o in instructions(code) if o.opcode==0x68 and n[o.operands[0]]==end_field)
        local,calls,maximum=entries_execute(code,n,st,{0:{}},end=end)
        self.assertLessEqual(maximum,li[0]);return local[0]

    def test_anniversary_replaces_consume_page_and_title_with_recharge(self):
        fields=self.fields(22158,'PAGES');self.assertEqual(Ref('HongLiTreasurePage'),fields['PAGES'][4])
        code,n,st,_=self.code(22157);ops=instructions(code)
        self.assertEqual([438,1118,994,434,1300,439,1101,591,550,1119,1102,600],
                         [o.operands[0] for o in ops if o.opcode==0x25])

    def test_both_jingji_variants_have_no_rank_page_or_button(self):
        code,n,st,_=self.code(5567)
        self.assertNotIn(q(0x60,16278),code)
        self.assertEqual([7,5],[o.operands[0] for o in instructions(code) if o.opcode==0x56])
        fields=self.fields(5568,'obj')
        def buttons(value):
            if isinstance(value,dict):
                if 'instanceName' in value:yield value['instanceName']
                for v in value.values():yield from buttons(v)
            elif isinstance(value,list):
                for v in value:yield from buttons(v)
        defined=list(buttons(fields['obj']))
        self.assertNotIn('_loaderbasebutton_7',defined);self.assertNotIn('_loaderbasebutton_15',defined)

    def test_hongli_button_page_order_and_fixed_coordinates_are_aligned(self):
        fields=self.fields(5,'obj',MODULE)
        definitions=fields['obj']['childCom']
        buttons=[v for v in definitions if v.get('instanceName','').startswith('_loaderbasebutton_')]
        self.assertEqual(['_loaderbasebutton_'+str(i) for i in (0,1,2,4,5)], [v['instanceName'] for v in buttons])
        self.assertEqual(['293,196','293,240','293,284','293,328','293,372'],[v['move'] for v in buttons])
        code,n,st,_=self.code(6,MODULE)
        self.assertNotIn(q(0x60,53),code);self.assertNotIn(q(0x66,26),code)
        page_refs=[n[o.operands[0]] for o in instructions(code) if o.opcode==0x60 and n[o.operands[0]].endswith('Page')]
        self.assertEqual(['HongLiLoginPage','HongLiRechargePage','HongLiTotalChargePage','HongLiFlashSalePage','HongLiTurnPage'],page_refs)

    def test_only_anniversary_can_construct_recharge_rank_and_no_retired_consume_page(self):
        abc,n,st,bs=self.data[CLIENT]
        forbidden={29710,50009,18049,47143,21919,47881};rank={16278,46803};hits=[]
        for method,(a,l,_) in bs.items():
            code=abc[a:a+l]
            needles=[q(0x60,i) for i in forbidden|rank]+[q(0x4a,i) for i in forbidden|rank]
            if not any(v in code for v in needles):continue
            try:ops=instructions(code)
            except ValueError:continue
            for o in ops:
                if o.opcode in (0x60,0x4a) and o.operands[0] in forbidden|rank:hits.append((method,o.operands[0]))
        self.assertEqual([(22158,16278)],hits)

    def test_anniversary_rank_date_uses_full_duration(self):
        code,n,st,li=self.code(15772)
        for duration in (1,3,7,14):
            for day in range(1,duration+1):
                label={};obj={'_label_1':label};seen=[]
                def invoke(obj,name,args):
                    if name=='getServerTime':return 1000
                    if name=='getUseTime':seen.append(args);return str(args[1])
                    raise ValueError(name)
                globals_={'GlobalData':{'yearAcitveDataMgr':{'curDay':day,'totalDay':duration}}}
                _,maximum=execute(code,n,st,{0:obj},globals_,invoke)
                self.assertEqual([[1000,1-day],[1000,duration-day]],seen)
                self.assertLessEqual(maximum,li[0])

    def test_rank_page_keeps_existing_packet_and_configuration(self):
        code,n,st,_=self.code(15769)
        self.assertIn(q(0x60,11028)+number(0)+number(6)+q(0x4f,37557,2),code)
        code,n,st,_=self.code(15768)
        self.assertIn(q(0x66,24579),code)

    def test_resource_upgrade_is_reproducible_and_only_allowed_bodies_and_strings_change(self):
        for path,module,expected in ((CLIENT,False,MAIN_METHODS),(MODULE,True,MODULE_METHODS)):
            source=subprocess.check_output(['git','show',BASELINE+':'+path.relative_to(ROOT).as_posix()],cwd=ROOT)
            upgraded=patch_swf(source,module)
            if not module:upgraded=retired_hunt(wanfu_opening(spring_display(retired_pages(spring_icon(descriptions(upgraded))))));expected=expected|SPRING_METHODS|RETIRED_METHODS|WANFU_METHODS|HUNT_METHODS
            self.assertEqual(upgraded,path.read_bytes());self.assertEqual(patch_swf(upgraded,module),upgraded)
            d,(_,_,a,b)=abc_section(source);before,_=normalize(d[a:b]);oldnames,_,old=inspect_abc(before)
            abc,n,st,new=self.data[path];changed=set()
            for m,(a,l,li) in old.items():
                b,size,newli=new[m]
                if before[a:a+l]!=abc[b:b+size] or li!=newli:changed.add(m)
            self.assertEqual(expected,changed)
            oldstrings=strings_of(before)
            changedstrings=[(a,b) for a,b in zip(oldstrings,st,strict=True) if a!=b]
            self.assertEqual(2,len(changedstrings))
            if module:self.assertEqual([('293,372','293,328'),('293,416','293,372')],changedstrings)
            else:self.assertTrue(all('万服庆典消费排行奖励' in new for _,new in changedstrings))

    def test_changed_branch_targets_and_local_slots_are_valid(self):
        for path,targets in ((CLIENT,MAIN_METHODS),(MODULE,MODULE_METHODS)):
            for method in targets:
                code,n,st,limits=self.code(method,path);ops=instructions(code)
                for o in ops:
                    if o.opcode in (0x62,0x63,0xc2,0xc3,0x08):self.assertLess(o.operands[0],limits[1])
                    for _,target,_ in o.branches:
                        if target<=o.start:self.assertEqual(0x09,code[target],(method,o.start,target))

    def test_pack_changes_only_spin_switch_and_reward_data_matches(self):
        directory=ROOT/'web/v2/lang/zh-cn';packpath=directory/'zh-cn.dat'
        before=dict(read_pack(subprocess.check_output(['git','show',BASELINE+':'+packpath.relative_to(ROOT).as_posix()],cwd=ROOT)))
        after=dict(read_pack(packpath.read_bytes()))
        self.assertEqual(before.keys(),after.keys())
        self.assertEqual({'QingDianActivityCfg.cbp','SpringFestivalCfg.cbp','treasurehuntcfg.cbp'},{k for k in before if before[k]!=after[k]})
        self.assertEqual(retired_config(patch_config(before['QingDianActivityCfg.cbp']),'QingDianActivityCfg.cbp'),after['QingDianActivityCfg.cbp'])
        _,old=read_cbp(before['QingDianActivityCfg.cbp']);_,new=read_cbp(after['QingDianActivityCfg.cbp'])
        spin=new.child('XiaoFeiZhuanPanNew');spin.children=[v for v in spin.children if v.name!='isOpen'];words=new.child('QingDianJiZi');words.children=[v for v in words.children if v.name!='isOpen']
        self.assertEqual(write_node(old),write_node(new));verify_rewards()
        lua=LuaRuntime();lua.execute((ROOT/'Server/S1001/data/config/activity/SanRenHongLiCfg.lua').read_text('utf-8-sig'))
        _,cfg=read_cbp(next(v for k,v in after.items() if k.lower()=='sanrenhonglicfg.cbp'));client=config_value(cfg)['DailyPayRanking']
        for i,row in enumerate(client['awardList'],1):
            server=lua.globals().SanRenHongLiCfg.DailyPayRanking.awardList[i]
            self.assertEqual(server.minPay,row['minPay'])
            mail='/'.join(','.join(str(int(item[k])) for k in ('id','count','bind')) for item in row['award'])
            self.assertEqual(server.mailAward,mail)


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--lua-path',type=Path);args=parser.parse_args()
    if args.lua_path:sys.path.insert(0,str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]],verbosity=2)
