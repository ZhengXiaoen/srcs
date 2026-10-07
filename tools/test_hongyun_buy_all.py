"""Exercise real Lua purchases and shipped Flash controls, navigation and resource integrity."""
from __future__ import annotations

from pathlib import Path
import subprocess
import sys
import unittest

from patch_hongyun_buy_all import BASELINE, CLIENT, METHODS, ROOT, patch_swf
from patch_appearance_upgrade import inspect_abc, pools
from patch_drop_pickup_retry import abc_section, instructions
from patch_guild_quest_config import read_cbp, read_pack
from test_activity_entries import execute as constructor_execute
from test_activity_reminders import execute, config_value

sys.path.insert(0,str(Path.home()/'AppData/Local/Temp/codex-lupa'))
from lupa.lua51 import LuaRuntime

DATA = ROOT/'Server/S1001/data'
LUA_FILES = ('config/OneYearActivity.lua', 'config/activity/QingDianActivityCfg.lua',
             'functions/new_activity/festival/OneYearActivity.lua',
             'functions/Activity/QingDianActivity.lua', 'functions/Activity/spring/spring_total.lua')


class ServerTests(unittest.TestCase):
    def setUp(self):
        self.lua=LuaRuntime(unpack_returned_tuples=True)
        self.lua.execute('''
            noop=function() end;LocalDT={};callbacks={};state={};actors={};packets={};tips={};broadcasts={}
            money=1000000;given=0;bagLimit=100;hour=12;day=1;active=true;failCharge=false
            System={getStaticVar=function() return state end,getTime=function() return hour,0,0 end,
                getRandomNumber=function(n) return n-1 end,trace=noop,
                broadcastTipmsg=function(s) table.insert(broadcasts,s) end}
            Actor={getStaticVar=function(id) if not actors[id] then actors[id]={} end return actors[id] end,
                getMoneyCount=function() return money end,
                changeMoney=function(_,_,amount) if failCharge then return false end;money=money+amount;return true end,
                getName=function(id) return 'player'..id end,
                getIntProperty=function(id,prop) if prop==1 then return id else return 0 end end,
                sendTipmsg=function(_,s) table.insert(tips,s) end,IsActorInited=function() return true end}
            Awards={CheckBagGridCount=function() return given<bagLimit end,
                Give=function(_,award) given=given+1;assert(award[1].id==489 and award[1].count==3) end}
            DataPack={allocPacket=function() local p={};table.insert(packets,p);return p end,
                writeByte=function(p,v) table.insert(p,v) end,writeString=noop,flush=noop,
                readByte=function(p) return table.remove(p,1) end}
            get_spring_festival_day_count=function() return day end
            is_spring_festival_time=function() return active end
            PROP_ENTITY_ID=1;PROP_ACTOR_SEX=2;LogIds={SpringHongYunDangTou=2736}
            register_spring_festival_func=function(id,f) callbacks[id]=f end
            register_spring_festival_start_end_func=noop
            EventCallDispatcher={registerEventCall=noop};BaseTypes={ActorEventId={}}
            MiscsImplementEx={registerMsgHandler=noop};LogicCmd={miscSysEx={sub={}},miscSys={sub={}}}
            RegisterBackCmd=noop
        ''')
        for path in ('config/activity/SpringFestivalCfg.lua',*LUA_FILES):
            self.lua.execute((DATA/path).read_text('utf-8-sig'))
        self.lua.execute('ClearSpringHongYunDangTouSystemData()')

    def run_lua(self,s): return self.lua.execute(s)
    def value(self,s): return self.lua.eval(s)

    def buy_all(self, actor=1): self.run_lua(f'callbacks[11]({actor},{{4}})')

    def test_full_purchase_has_exact_charge_rewards_unique_numbers_and_one_reply(self):
        self.buy_all()
        self.assertEqual(100,self.value('given'))
        self.assertEqual(1000000-100*2188,self.value('money'))
        self.assertEqual(100,self.value('state.SpringHYDT_data.TeHuiTotal[1]'))
        self.assertEqual(0,self.value('#state.SpringHYDT_data.leftTable[1]'))
        numbers=list(self.value('actors[1].newdays.SpringHYDT_LuckNumber').values())
        self.assertEqual(set(range(1,101)),set(numbers))
        self.assertEqual(1,self.value('#packets'));self.assertEqual(1,self.value('#broadcasts'))
        self.assertEqual([11,1,0,100],list(self.value('packets[1]').values())[:4])
        self.assertTrue(self.value('state.SpringHYDT_data.NumberData[100].userID==1'))

    def test_second_click_and_other_player_cannot_exceed_global_stock(self):
        self.buy_all(); self.buy_all(); self.buy_all(2)
        self.assertEqual(100,self.value('given'));self.assertEqual(781200,self.value('money'))
        self.assertEqual(0,self.value('#actors[2].newdays.SpringHYDT_LuckNumber'))

    def test_limited_currency_keeps_successful_purchases_and_stops_once(self):
        self.run_lua('money=2188*3+100');self.buy_all()
        self.assertEqual(3,self.value('given'));self.assertEqual(100,self.value('money'))
        self.assertEqual(3,self.value('#actors[1].newdays.SpringHYDT_LuckNumber'))
        self.assertEqual(2,self.value('#tips'));self.assertEqual('元宝不足',self.value('tips[1]'))
        self.assertEqual(1,self.value('#packets'))

    def test_bag_capacity_stops_without_charging_failed_purchase(self):
        self.run_lua('bagLimit=2');self.buy_all()
        self.assertEqual(2,self.value('given'));self.assertEqual(1000000-2*2188,self.value('money'))
        self.assertEqual(2,self.value('state.SpringHYDT_data.TeHuiTotal[1]'))

    def test_failed_charge_or_empty_number_pool_never_gives_rewards(self):
        self.run_lua('failCharge=true');self.buy_all()
        self.assertEqual(0,self.value('given'));self.assertEqual(1000000,self.value('money'))
        self.run_lua('failCharge=false;state.SpringHYDT_data.leftTable[1]={}');self.buy_all()
        self.assertEqual(0,self.value('given'));self.assertEqual(1000000,self.value('money'))

    def test_original_single_button_still_buys_only_one(self):
        self.run_lua('callbacks[11](1,{1})')
        self.assertEqual(1,self.value('given'));self.assertEqual(1,self.value('#packets'))
        self.assertEqual(1,self.value('#broadcasts'))

    def test_only_retained_spring_draw_sends_original_reward(self):
        self.run_lua('''
            mails={};System.AddMail=function(id,_,_,title,desc,_,_,award)
                table.insert(mails,{id=id,title=title,award=award}) end
        ''')
        self.buy_all()
        self.run_lua('''hour=21;HongYunDangTou_Run();OneYearHongYunDangTou_Run();SpringHongYunDangTou_Run()''')
        self.assertEqual(1,self.value('#mails'))
        self.assertEqual(1,self.value('mails[1].id'))
        self.assertEqual('6013,1,1',self.value('mails[1].award'))
        self.assertEqual(100,self.value('state.SpringHYDT_data.days[1].luckNumber'))
        self.assertEqual('player1',self.value('state.SpringHYDT_data.days[1].luckUser'))

    def test_after_draw_preserves_original_no_number_rule(self):
        self.run_lua('hour=21');self.buy_all()
        self.assertEqual(100,self.value('given'))
        self.assertEqual(0,self.value('#actors[1].newdays.SpringHYDT_LuckNumber'))
        self.assertEqual(0,self.value('#broadcasts'))

    def test_closed_or_outside_config_days_cannot_purchase(self):
        for code in ('active=false;day=1','active=true;day=0','day=13'):
            self.run_lua(code);self.buy_all();self.run_lua('BuySpringHongYunDangTouTeHui(1)')
        self.assertEqual(0,self.value('given'));self.assertEqual(0,self.value('#packets'))

    def test_global_remaining_stock_is_shared_between_players(self):
        self.run_lua('money=2188*98');self.buy_all()
        self.run_lua('money=1000000');self.buy_all(2)
        self.assertEqual(100,self.value('given'))
        self.assertEqual(2,self.value('#actors[2].newdays.SpringHYDT_LuckNumber'))
        self.assertEqual(1000000-2*2188,self.value('money'))

    def test_retired_direct_operations_and_draws_cannot_touch_state(self):
        self.run_lua('''
            fail=function() error('retired operation touched state') end
            Actor=setmetatable({},{__index=function() return fail end})
            System=setmetatable({},{__index=function() return fail end})
            BuyHongYunDangTouTeHui(1);SendHongYunDangTouUserData(1);HongYunDangTou_Run();ClearHongYunDangTouSystemData()
            BuyOneYearHongYunDangTouTeHui(1);SendOneYearHongYunDangTouUserData(1)
            OneYearHongYunDangTou_Run();ClearOneYearHongYunDangTouSystemData()
        ''')

    def test_retired_protocols_cannot_dispatch_queries_or_purchases(self):
        self.run_lua('''
            state.StartOneYear_OpenDay=7;state.isDringOneYearAct=1
            state.QingDian_openDay=7;state.isDringQingDianActivity=1
            fail=function() error('retired protocol dispatched') end
            BuyHongYunDangTouTeHui=fail;SendHongYunDangTouUserData=fail
            BuyOneYearHongYunDangTouTeHui=fail;SendOneYearHongYunDangTouUserData=fail
            QingDianActivitys(1,0,{9,1});QingDianActivitys(1,0,{9,2})
            handleOneYearAct(1,0,{10,1});handleOneYearAct(1,0,{10,2})
            QingDianActivitys(1,0,{0,9});handleOneYearAct(1,0,{0,10})
        ''')
        self.assertEqual(0,self.value('#packets'))

    def test_no_new_top_level_locals_in_combined_chunk(self):
        import re
        for path in LUA_FILES:
            before=subprocess.check_output(['git','show',BASELINE+':Server/S1001/data/'+path],cwd=ROOT)
            after=(DATA/path).read_bytes()
            self.assertEqual(re.findall(rb'^local .*',before,re.M),re.findall(rb'^local .*',after,re.M))


class ClientTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source=CLIENT.read_bytes();d,(_,_,a,b)=abc_section(cls.source);cls.abc=d[a:b]
        cls.names,cls.catalog,cls.bodies=inspect_abc(cls.abc)
        cls.strings=pools(cls.abc)['strings'][3]

    def code(self, method):
        a,size,limits=self.bodies[method];return self.abc[a:a+size],limits

    def run_code(self,method,obj,arg=None,globals_=None,invoke=None,**kwargs):
        code,limits=self.code(method)
        result,maximum=execute(code,self.names,self.strings,{0:obj,1:arg},globals_ or {},invoke or (lambda *_:None),**kwargs)
        self.assertLessEqual(maximum,limits[0]);return result

    def test_button_position_and_all_original_components_preserved(self):
        code,limits=self.code(17276)
        end=next(o.end for o in instructions(code) if o.opcode==0x68 and self.names[o.operands[0]]=='editJson')
        local,_,maximum=constructor_execute(code,self.names,self.strings,{0:{}},end=end)
        self.assertLessEqual(maximum,limits[0])
        children=local[0]['editJson']['childCom']
        auto=next(x for x in children if x['instanceName']=='hongyunBuyAllButton')
        lucky=next(x for x in children if x['instanceName']=='_simplelinklabel_1')
        self.assertEqual('一键购买',auto['text']);self.assertEqual('364,441',auto['move'])
        self.assertEqual('463,441',lucky['move'])
        old=subprocess.check_output(['git','show',BASELINE+':web/GameFrame.swf'],cwd=ROOT)
        d,(_,_,a,b)=abc_section(old);names,_,bs=inspect_abc(d[a:b]);st=pools(d[a:b])['strings'][3]
        original_abc=d[a:b]
        a,size,_=bs[17276];original=original_abc[a:a+size]
        stop=next(o.end for o in instructions(original) if o.opcode==0x68 and names[o.operands[0]]=='editJson')
        original_children=constructor_execute(original,names,st,{0:{}},end=stop)[0][0]['editJson']['childCom']
        self.assertEqual(original_children,[x for x in children if x is not auto])

    def test_constructor_retains_button_on_existing_dynamic_object(self):
        code,_=self.code(17276);ops=instructions(code)
        # Execute the exact object assignment just after createUIByJson.
        at=max(i for i,o in enumerate(ops) if o.opcode==0x68 and self.names[o.operands[0]]=='editJson')
        segment=code[ops[at-6].start:ops[at].end]+b'\x47'
        button={};obj={}
        execute(segment,self.names,self.strings,{0:obj,1:{'hongyunBuyAllButton':button}}, {},lambda *_:None)
        self.assertIs(button,obj['editJson']['hongyunBuyAllButton'])

    def test_both_buttons_send_one_correct_request(self):
        auto={};single={};obj={'editJson':{'hongyunBuyAllButton':auto}}
        for clicked,expected in ((auto,4),(single,1)):
            requests=[]
            self.run_code(17281,obj,{'currentTarget':clicked},invoke=lambda o,n,a:requests.append((n,a)))
            self.assertEqual([('requestNewYearActivityData',[11,expected])],requests)

    def test_lifecycle_binds_and_removes_click_without_changing_existing_requests(self):
        auto={};obj={'editJson':{'hongyunBuyAllButton':auto}}
        for name in ('_loaderbasebutton_0','_simplelinklabel_0','_simplelinklabel_1','onClick','onLinkClick','onInfo'):
            obj[name]={}
        globals_={'MouseEvent':{'CLICK':'click'},'RichTextLinkEvent':{'LINK':'link'},
                  'NewYearEvent':{'NEWYEAR_HONGYUN':'update'}}
        calls=[]
        for method in (17277,17278):
            self.run_code(method,obj,globals_=globals_,invoke=lambda o,n,a:calls.append((o,n,a)))
        self.assertEqual(['addEventListener','removeEventListener'],[n for o,n,a in calls if o is auto])
        self.assertEqual([[11,2],[11,3]],[a for o,n,a in calls if n=='requestNewYearActivityData'])

    def test_wanfu_has_five_matching_buttons_and_pages_in_every_variant(self):
        code,_=self.code(6021);ops=instructions(code)
        end=next(o.end for o in ops if o.opcode==0x68 and self.names[o.operands[0]]=='editJson')
        local,_,_=constructor_execute(code,self.names,self.strings,{0:{}},end=end)
        sprite=next(c for c in local[0]['editJson']['childCom'] if c['instanceName']=='_basesprite_0')
        self.assertEqual(['_loaderbasebutton_'+str(i) for i in (0,1,2,3,11)],
                         [c['instanceName'] for c in sprite['childCom']])
        pages=['QDLoginPage','QDRechargePage','QDAccRechargePage','QDFlashSalePage','QDConsumePage']
        from patch_activity_entries import QD_ARRAYS
        for field in QD_ARRAYS:
            index=next(i for i,o in enumerate(ops) if o.opcode==0x68 and o.operands==(field,))
            self.assertEqual((5,),ops[index-1].operands)
            self.assertEqual(pages,[self.names[o.operands[0]] for o in ops[index-6:index-1]])

    def test_wanfu_legacy_navigation_skips_hongyun_and_preserves_consumption(self):
        for old in range(16):
            obj={'selectedIndex':-1};calls=[]
            self.run_code(6042,obj,old,invoke=lambda o,n,a:calls.append(a))
            expected={0:0,1:1,2:2,3:3,10:4}.get(old,-1)
            self.assertEqual(expected,obj['selectedIndex'])

    def test_wanfu_lifecycle_reopens_all_variants_and_activates_consumption_page(self):
        from test_wanfu_opening import Lifecycle, PageClasses, unpack
        from patch_activity_entries import QD_ARRAYS
        vm=Lifecycle(unpack(self.source))
        vm.page_names=['QDLoginPage','QDRechargePage','QDAccRechargePage','QDFlashSalePage','QDConsumePage']
        for field in QD_ARRAYS.values():vm.obj[field]=PageClasses({'class':name} for name in vm.page_names)
        vm.children()
        for variant in range(5):
            vm.open(variant)
            self.assertEqual(vm.page_names,[p['class'] for p in vm.obj['_pageCtrl']['pages']])
            vm.run(6042,arg=10)
            self.assertEqual('QDConsumePage',vm.obj['_pageCtrl'].get('activePage')['class'])
            before=len(vm.created);vm.close();vm.open(variant)
            self.assertEqual(before,len(vm.created))
        self.assertFalse(any(p['class']=='QDHongYunDangTouPage' for p in vm.created))

    def test_anniversary_keeps_protocol_slots_and_omits_hongyun_on_every_day(self):
        code,_=self.code(22158);end=next(o.end for o in instructions(code) if o.opcode==0x68 and self.names[o.operands[0]]=='PAGES')
        obj={};self.run_code(22158,obj,end=end)
        self.assertEqual(12,len(obj['PAGES']));self.assertIsNone(obj['PAGES'][9])
        self.assertEqual('YearActiveZhuanPanPage',obj['PAGES'][10]['class'])
        code,_=self.code(22163);ops=instructions(code)
        end=next(o.start for i,o in enumerate(ops) if o.opcode==0xd0 and ops[i+1].opcode==0x66 and self.names[ops[i+1].operands[0]]=='_list')
        for day in range(1,13):
            globals_={'ACTIVITYS':list(range(12)),
                      'GlobalData':{'yearAcitveDataMgr':{'curDay':day}}}
            # The original outer iteration still retains its full 12 protocol slots.
            captured=[]
            _,maximum=execute(code,self.names,self.strings,{0:{},3:0},globals_,
                lambda o,n,a:captured.extend(a) if n=='push' else None,start=51,end=end)
            self.assertLessEqual(maximum,self.bodies[22163][2][0])
            self.assertNotIn(9,captured);self.assertIn(10,captured);self.assertIn(11,captured)

    def test_shipped_patch_reproducible_and_all_other_methods_constants_and_graphics_unchanged(self):
        original=subprocess.check_output(['git','show',BASELINE+':web/GameFrame.swf'],cwd=ROOT)
        self.assertEqual(self.source,patch_swf(original));self.assertEqual(self.source,patch_swf(self.source))
        d,(tag,_,a,b)=abc_section(original);old=d[a:b];_,old_catalog,bodies=inspect_abc(old)
        self.assertEqual(old_catalog,self.catalog)
        self.assertEqual(METHODS,{m for m,(x,size,limits) in bodies.items() if
            old[x:x+size]!=self.abc[self.bodies[m][0]:self.bodies[m][0]+self.bodies[m][1]] or limits!=self.bodies[m][2]})
        for key,entry in pools(old).items():self.assertEqual(entry[3],pools(self.abc)[key][3][:len(entry[3])])
        new,(newtag,_,x,y)=abc_section(self.source)
        self.assertEqual(d[8:tag],new[8:newtag]);self.assertEqual(d[b:],new[y:])
        for method in METHODS:
            code,limits=self.code(method);ops=instructions(code);positions={o.start for o in ops}
            for op in ops:
                for _,target,_ in op.branches:self.assertIn(target,positions)
                if op.opcode in (0x62,0x63,0xc2,0xc3,0x08):self.assertLess(op.operands[0],limits[1])

    def test_retained_spring_rewards_prices_and_entire_config_pack_preserved(self):
        relative='web/v2/lang/zh-cn/zh-cn.dat';pack=(ROOT/relative).read_bytes()
        self.assertEqual(subprocess.check_output(['git','show',BASELINE+':'+relative],cwd=ROOT),pack)
        _,cfg=read_cbp(dict(read_pack(pack))['SpringFestivalCfg.cbp'])
        lua=LuaRuntime();lua.execute((DATA/'config/activity/SpringFestivalCfg.lua').read_text('utf-8-sig'))
        rows=config_value(cfg.child('HongYunDangTou'))
        for day,row in enumerate(rows,1):
            server=lua.globals().SpringFestivalCfg.HongYunDangTou[day]
            self.assertEqual(server.TeHui.needMoney,row['TeHui']['needMoney'])
            for field,server_awards,client_awards in [('TeHui',server.TeHui.award,row['TeHui']['award']),
                    ('HongYun_Award',server.HongYun_Award,row['HongYun_Award'])]:
                for i,item in enumerate(client_awards,1):
                    for key in ('id','count','bind'):self.assertEqual(server_awards[i][key],item[key],(day,field,key))


if __name__=='__main__':unittest.main(verbosity=2)
