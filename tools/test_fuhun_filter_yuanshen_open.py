"""Execute installed soul list filters and spirit opening-day boundaries."""
from pathlib import Path
import math
import subprocess
import sys
import unittest

from patch_activity_entries import q
from patch_appearance_upgrade import inspect_abc, pools
from patch_drop_pickup_retry import abc_section, instructions
from patch_fuhun_filter_yuanshen_open import CLIENT, patch_swf
from test_activity_reminders import execute

ROOT = CLIENT.parents[1]
BASELINE = '9991352'
sys.path.insert(0, str(Path.home() / 'AppData/Local/Temp/codex-lupa'))
from lupa.lua51 import LuaRuntime


class ClientTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.swf = CLIENT.read_bytes()
        data, (_, _, a, b) = abc_section(cls.swf)
        cls.abc = data[a:b]
        cls.names, cls.classes, cls.bodies = inspect_abc(cls.abc)
        cls.strings = pools(cls.abc)['strings'][3]

    def item(self, item_type, circle=5, guid=None, dragon=0):
        return {'stdItem': {'type': item_type, 'itemUseCircle': circle},
                'smith': [0, dragon, 1], 'series': guid or str(item_type)}

    def soul_list(self, tab, main, bag, equips):
        page = {'_tab': {'selectedIndex': tab}, '_mainCell': {'data': main},
                '_cMainCell': {'data': main}, '_dirbutton11_0': {},
                '_customgrid_3': {'maxCount': 8}}
        globals_ = {'GlobalData': {'itemDataMgr': {'equips': equips, 'bagItems': bag},
                                  'role': {'job': 1}}}
        def invoke(obj, name, args):
            if name == 'isMain': return obj['_mainCell']['data'] is not None
            if name == 'isCMain': return obj['_cMainCell']['data'] is not None
            if name == 'isXianZhuangEquip':
                # Execute the installed classification helper, too.
                mid = self.classes['StdItemType']['static'][name][0]
                start, size, limits = self.bodies[mid]
                value, maximum = execute(self.abc[start:start + size], self.names, self.strings,
                                         {0: {}, 1: args[0]}, {}, invoke)
                self.assertLessEqual(maximum, limits[0])
                return value
            if name == 'push': obj.extend(args); return len(obj)
            if name == 'ceil': return math.ceil(args[0])
            if name == 'getLv': return 1
            if name == 'getMaxLv': return 25
            if name == 'isEquals': return obj == args[0]
            raise ValueError(name)
        mid = self.classes['EquipBoostFuHunPage']['instance']['getEquips'][0]
        at, size, limits = self.bodies[mid]
        result, maximum = execute(self.abc[at:at + size], self.names, self.strings,
                                  {0: page}, globals_, invoke)
        self.assertLessEqual(maximum, limits[0])
        return result

    def test_immortal_equipment_excluded_from_all_four_selection_lists(self):
        normal = [self.item(t) for t in (1,2,3,4,6,7,8,9)]
        immortal = [self.item(t, circle=12) for t in range(87,93)]
        main = self.item(7, guid='worn')
        mixed = normal + immortal
        self.assertEqual(self.soul_list(0, None, mixed, mixed), normal)
        self.assertEqual(self.soul_list(0, main, mixed, mixed), [normal[5]])
        self.assertEqual(self.soul_list(1, None, mixed, mixed), normal)
        self.assertEqual(self.soul_list(1, main, mixed, mixed), normal)
        for item in immortal:
            self.assertEqual(self.soul_list(0, item, mixed, mixed), [])

    def test_material_circle_type_and_dragon_rules_preserved(self):
        main = self.item(7, guid='worn')
        valid = self.item(7, circle=4)
        bag = [self.item(7,circle=3),self.item(6),self.item(7,dragon=1),valid]
        self.assertEqual(self.soul_list(0,main,bag,[]),[valid])

    def test_spirit_tab_day_eight_and_four_turn_boundary(self):
        mid = self.classes['PropertyRoleEquipPage']['instance']['initEvent'][0]
        at, size, limits = self.bodies[mid]
        code = self.abc[at:at + size]
        prefix = q(0x60,1561) + q(0x66,31840)
        pos = max(o.start for o in instructions(code) if code[o.start:o.start+len(prefix)] == prefix)
        end = next(o.start for o in instructions(code) if o.start>pos and o.opcode==0x12
                   and not (o.start and code[o.start-1]==0x2a))
        predicate = code[pos:end] + b'\x48'
        for day in (1,7,8,9,14):
            for circle in (3,4,5):
                result, maximum = execute(predicate,self.names,self.strings,{0:{}},
                    {'GlobalFunc':{'sectionOpenDays':day},'GlobalData':{'role':{'actorCircle':circle}}},
                    lambda *_: None)
                self.assertEqual(result,day>=8 and circle>=4,(day,circle))
                self.assertLessEqual(maximum,limits[0])

    def test_only_two_methods_change_and_all_other_resources_are_preserved(self):
        oldswf = subprocess.check_output(['git','show',BASELINE+':web/GameFrame.swf'],cwd=ROOT)
        old, (tag, _, a, b) = abc_section(oldswf)
        new, (ntag, _, na, nb) = abc_section(self.swf)
        self.assertEqual(old[8:tag],new[8:ntag])
        self.assertEqual(old[b:],new[nb:])
        oldabc=old[a:b]
        names, classes, bodies=inspect_abc(oldabc)
        self.assertEqual(names,self.names)
        self.assertEqual(classes,self.classes)
        changed=set()
        for mid,(at,size,limits) in bodies.items():
            nat,nsize,nlimits=self.bodies[mid]
            if oldabc[at:at+size]!=self.abc[nat:nat+nsize] or limits!=nlimits:changed.add(mid)
        self.assertEqual(changed,{18617,19911})
        self.assertEqual(patch_swf(oldswf),self.swf)
        self.assertEqual(patch_swf(self.swf),self.swf)


SETUP = r'''
PROP_ACTOR_CIRCLE='circle';PROP_CREATURE_LEVEL='level';PROP_ACTOR_YUANSHEN_EXP='exp'
PROP_ACTOR_WARPATH_ID='warpath';PROP_ENTITY_ID='id';ttFlyTip=1
state={circle=4,level=120,exp=10000000,warpath=0,id=1};days={};tips={};logs={};replies={}
openDay=8;recalculated=0
Actor={getIntProperty=function(_,p)return state[p]end,getUIntProperty=function(_,p)return state[p]end,
 setIntProperty=function(_,p,v)state[p]=v end,setUIntProperty=function(_,p,v)state[p]=v end,
 getStaticVar=function()return {days=days}end,sendTipmsg=function(_,s)tips[#tips+1]=s end,
 getName=function()return '角色'end,collectOperate=function()recalculated=recalculated+1 end}
System={getDaysSinceOpenServer=function()return openDay end,
 getIntByte=function(v,slot)return math.floor(v/2^(slot*8))%256 end,
 setIntByte=function(v,slot,n)return v-math.floor(v/2^(slot*8))%256*2^(slot*8)+n*2^(slot*8)end,
 sendCommonLog=function(...)logs[#logs+1]={...}end,broadcastTipmsg=function()end,
 rankingUpdateValue=function()return 0,0 end}
DataPack={readByte=function(p)return p.kind end,
 allocPacket=function()local p={};replies[#replies+1]=p;return p end,
 writeByte=function(p,v)p[#p+1]=v end,flush=function()end}
LogIds={yuanshenUpgrade=1,yuanshenExchange=2};LogicCmd={miscSysEx={sub={sYuanshen=56}}}
'''


class ServerTests(unittest.TestCase):
    def runtime(self,day=8):
        lua=LuaRuntime(unpack_returned_tuples=True)
        lua.execute(SETUP);lua.globals().openDay=day
        for path in ('config/modules/yuanshen_cfg.lua','functions/modules/yuanshen.lua'):
            lua.execute((ROOT/'Server/S1001/data'/path).read_text('utf-8-sig'))
        return lua

    def request(self,lua,kind):
        lua.globals().yuanshen_main(1,151,lua.table_from({'kind':kind}))

    def test_upgrade_and_exchange_are_blocked_before_day_eight(self):
        for day in (1,7):
            for kind in (2,3):
                lua=self.runtime(day);self.request(lua,kind);g=lua.globals()
                self.assertEqual(g.state.exp,10000000)
                self.assertEqual(g.state.level,120)
                self.assertEqual(g.state.warpath,0)
                self.assertEqual(len(g.logs),0)
                self.assertIn('第8天',g.tips[1])

    def test_upgrade_and_exchange_open_on_day_eight(self):
        for day in (8,9,14):
            lua=self.runtime(day);self.request(lua,2);g=lua.globals()
            self.assertEqual(g.state.exp,10000000-60000)
            self.assertEqual(g.state.warpath,2**24)
            self.assertEqual(len(g.logs),1)
            lua=self.runtime(day);self.request(lua,3);g=lua.globals()
            self.assertEqual(g.state.level,119)
            self.assertEqual(g.state.exp,10000000+93600)
            self.assertEqual(g.days.yuanshenExchangeCount,1)
            self.assertEqual(g.replies[1][2],2)

    def test_original_upgrade_and_exchange_rejections_are_preserved(self):
        for kind,change in ((2,'state.circle=3'),(3,'state.circle=3'),(2,'state.exp=59999'),
                            (2,'state.warpath=60*2^24'),(3,'state.level=119'),
                            (3,'days.yuanshenExchangeCount=3')):
            lua=self.runtime();lua.execute(change)
            before=dict(lua.globals().state.items());self.request(lua,kind)
            self.assertEqual(dict(lua.globals().state.items()),before)
            self.assertEqual(len(lua.globals().logs),0)


if __name__=='__main__':
    unittest.main()
