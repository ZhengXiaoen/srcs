"""Exercise unmerged accessory recipes, forging, navigation and opening days."""
from pathlib import Path
import argparse
import subprocess
import sys
import unittest

from patch_merge_feature_gates import CLIENT, MODULE, ROOT, METHODS, patch_main, patch_module, instructions as library_instructions
from patch_bag_client import ABCReader
from patch_appearance_upgrade import inspect_abc, pools
from patch_activity_reminders import relocate
from patch_drop_pickup_retry import abc_section, instructions
from patch_guild_quest_config import read_cbp, read_pack
from test_activity_reminders import execute, config_value

BASELINE='5b0d26a'
FUNCTIONS=ROOT/'Server/S1001/data/functions'


def load_abc(path):
    data,(_,_,a,b)=abc_section(path.read_bytes());return data[a:b]


def numbers(abc):
    reader=ABCReader(abc);reader.skip(4);result={}
    for key in (0x2d,0x2e):result[key]=[0]+[reader.u30() for _ in range(reader.u30()-1)]
    import struct
    result[0x2f]=[0.0]
    for _ in range(reader.u30()-1):
        result[0x2f].append(struct.unpack('<d',abc[reader.pos:reader.pos+8])[0]);reader.skip(8)
    return result




class Vector(list):
    """Model AVM2 Vector length and indexed writes with the shared executor."""
    def get(self, name, default=None):
        return default

    def __setitem__(self, key, value):
        if key == 'length':
            del self[value:]
            self.extend([None] * max(0, value - len(self)))
        else:
            super().__setitem__(key, value)


class ClientTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.abc=load_abc(CLIENT)
        cls.names,cls.classes,cls.bodies=inspect_abc(cls.abc)
        cls.strings=pools(cls.abc)['strings'][3]

    def run_method(self,mid,obj,globals_,args=(),stop=None):
        start,size,limits=self.bodies[mid];code=self.abc[start:start+size]
        # The shared executor predates nop instructions; remove them only from
        # this execution copy while relocating all branch destinations.
        code,moved=relocate(code,[(o.start,o.end,b'') for o in instructions(code) if o.opcode==2])
        def invoke(target,name,values):
            if name in ('reverse','push','unshift','indexOf'):
                if isinstance(target, Vector):
                    if name=='indexOf':return target.index(values[0]) if values[0] in target else -1
                    if name=='reverse':target.reverse()
                    elif name=='push':target.extend(values)
                    else:target[:0]=values
                    return len(target)
                items=[target[i] for i in range(target['length'])]
                if name=='indexOf':return items.index(values[0]) if values[0] in items else -1
                if name=='reverse':items.reverse()
                elif name=='push':items.extend(values)
                else:items=values+items
                target.clear();target.update(enumerate(items));target['length']=len(items)
                return len(items)
            if name=='removePageAt':target['pageCount']-=1;return
            return None
        return execute(code,self.names,self.strings,{0:obj,**dict(enumerate(args,1))},globals_,invoke,
                       end=moved(stop) if stop is not None else None)

    def catalog(self,day,circle,level):
        obj={'m_pageControl':{'pageCount':0},'m_pageCaptions':Vector(),
             'm_pageClass':Vector()}
        globals_={'GlobalFunc':{'sectionOpenDays':day,'combineDay':0},
                  'GlobalData':{'role':{'actorCircle':circle,'level':level}},
                  'GameConst':{'ZHULING_OPEN_LEVEL':80}}
        start,size,_=self.bodies[6166];code=self.abc[start:start+size]
        # Stop after catalog construction, before page objects are instantiated.
        stop=next(o.start for o in instructions(code) if o.start>405 and o.opcode==0x10)
        self.run_method(6166,obj,globals_,stop=stop)
        return obj,globals_

    def test_forge_ornament_entry_for_all_open_days_levels_and_circles(self):
        for day in (1,6,7,8,30):
            for circle in (0,3,5):
                for level in (1,80):
                    with self.subTest(day=day,circle=circle,level=level):
                        obj,globals_=self.catalog(day,circle,level)
                        classes=obj['m_pageClass'];captions=obj['m_pageCaptions']
                        entries=[entry['class'] for entry in classes]
                        self.assertEqual(entries.count('EquipBoostOrnamentPage'),1)
                        self.assertEqual(entries[-1],'EquipBoostOrnamentPage')
                        self.assertEqual(captions[0],
                                         "<textformat leading='7'>饰<BR>品</textformat>")
                        expected=['EquipBoostStrengthenPage2','EquipBoostCombinPage']
                        if day>=7:expected.append('EquipSlotNestPage')
                        if day>=8:expected.append('NoteSoulPage')
                        if level>=80:expected.append('EquipBoostZhuLingPage')
                        if circle>=3:expected.append('EquipBoostWuXingPage')
                        if circle>=5:expected.append('EquipBoostFuHunPage')
                        expected.append('EquipBoostOrnamentPage')
                        self.assertEqual(entries,expected)
                        obj['m_navBar']={'buttonCount':len(classes)}
                        self.run_method(6173,obj,globals_,(10000,))
                        self.assertEqual(obj['selectedIndex'],entries.index('EquipBoostOrnamentPage'))

    def test_ordinary_navigation_indices_are_preserved(self):
        obj,globals_=self.catalog(1,0,1);obj['m_navBar']={'buttonCount':10}
        for index in range(8):
            self.run_method(6173,obj,globals_,(index,))
            self.assertEqual(obj['selectedIndex'],index)

    def test_only_feature_and_reminder_methods_change_and_graphics_are_preserved(self):
        source=subprocess.check_output(['git','show',BASELINE+':web/GameFrame.swf'],cwd=ROOT)
        data,(tag,_,a,b)=abc_section(source);old=data[a:b];names,classes,bodies=inspect_abc(old)
        new,(newtag,_,na,nb)=abc_section(CLIENT.read_bytes())
        self.assertEqual(data[8:tag],new[8:newtag]);self.assertEqual(data[b:],new[nb:])
        self.assertEqual(names,self.names[:len(names)])
        changed=set()
        for mid,(s,n,limits) in bodies.items():
            ns,nn,nl=self.bodies[mid]
            if limits!=nl or old[s:s+n]!=self.abc[ns:ns+nn]:changed.add(mid)
        self.assertEqual(changed,METHODS | {24442})
        self.assertEqual(patch_main(CLIENT.read_bytes()),CLIENT.read_bytes())
        self.assertEqual(patch_module(MODULE.read_bytes()),MODULE.read_bytes())

    def test_imported_page_code_and_resources_match_the_shipped_module(self):
        module=load_abc(MODULE);n,c,b=inspect_abc(module)
        for name in ('EquipBoostOrnamentPage','EquipBoostOrnamentRender'):
            for method,(mid,_) in c[name]['instance'].items():
                target=self.classes[name]['instance'][method][0]
                s,size,limits=b[mid];ns,nn,nl=self.bodies[target]
                oldops=library_instructions(module[s:s+size]);newops=library_instructions(self.abc[ns:ns+nn])
                self.assertEqual(limits,nl)
                def canonical(ops,names,strings,constants):
                    result=[]
                    for op in ops:
                        args=op.operands
                        if args and op.opcode in (5,0x60,0x66,0x46,0x4f,0x61,0x5d,0x4a,0x80,0x68,0x5e):
                            args=(names[args[0]],*args[1:])
                        elif op.opcode==0x2c:args=(strings[args[0]],)
                        elif op.opcode==0x40:args=('module callback',)
                        elif op.opcode in constants:args=(constants[op.opcode][args[0]],)
                        result.append((op.opcode,args))
                    return result
                self.assertEqual(canonical(oldops,n,pools(module)['strings'][3],numbers(module)),
                                 canonical(newops,self.names,self.strings,numbers(self.abc)))


def runtime():
    lua=LuaRuntime(encoding=None,unpack_returned_tuples=True)
    lua.execute(b'''
System={getDaysSinceCombineServer=function()error('permanent feature read merge days')end,
 getDaysSinceOpenServer=function()return openDay end,
 getIntByte=function(_,slot)return level end,setIntByte=function(_,slot,n)return n end,
 broadcastTipmsg=function()end}
MainFnTable={};ttFlyTip=1;PROP_ACTOR_SOUL2=1
itEarringPos=1;itShoulderPadsPos=2;itElbowPadsPos=3;itKneecapPos=4
LogIds={exHeChengZhuangBei=1,OrnamentUpgrade=2};mtCoin=0;mtBindCoin=1
PROP_ENTITY_ID=1;PROP_ACTOR_VOCATION=2;PROP_ACTOR_SEX=3
Item={ipItemType=1,ipItemUseType=2,
 getEquipByPos=function()return equipped and {} or nil end,
 getItemProperty=function(_,_,p)return p==1 and 20 or tier end,
 getItemName=tostring}
Actor={getItemCount=function(_,id)return bag[id] or 0 end,
 removeItem=function(_,id,n)bag[id]=(bag[id] or 0)-n;return n end,
 addItem=function(_,id,a,b,n)bag[id]=(bag[id] or 0)+n;return n end,
 getMoneyCount=function(_,t)return money[t] or 0 end,
 changeMoney=function(_,t,n)money[t]=(money[t] or 0)+n;return true end,
 sendTipmsg=function(_,s)tips[#tips+1]=s end,
 getUIntProperty=function()return level end,setUIntProperty=function(_,_,n)level=n end,
 collectOperate=function()end,getName=function()return 'actor' end,
 getIntProperty=function()return 1 end,getFubenId=function()return fuben end,
 getHandle=function()return 0 end,messageBox=function()dialog=true end}
Awards={CheckBagGridCount=function()return not fullBag end}
DataPack={readByte=function()packetpos=packetpos+1;return packet[packetpos]end,
 allocPacket=function()return {}end,flush=function()end}
LogicCmd={miscSysEx={sub={cHeCheng=1,sHeCheng=2}}}
MiscsImplementEx={registerMsgHandler=function()end}
Lang={ScriptTips=setmetatable({c000141='%s %s',c000149='sex:%d',c000150='job:%d'},
 {__index=function(_,k)return k end}),Activity={a00101='back'}}
Consumes={ParseConsumesStr=function()return '' end};Sex_cn={[0]='male',[1]='female'}
Job_cn={[1]='one',[2]='two',[3]='three'}
''')
    for p in ['config/ActorEvent/HeChengCfg.lua','config/item/OrnamentCfg.lua',
              'config/circle/ChgVocationAndSex.lua','functions/ActorEvent/HeChengShiPing.lua',
              'functions/EquipEnhance/Ornament.lua','functions/Systems/FlowerSystem/Rose_Main.lua',
              'functions/Systems/CircleSystem/ChangeSex.lua','functions/Systems/CircleSystem/ChangeVocation.lua']:
        lua.execute((ROOT/'Server/S1001/data'/p).read_bytes().removeprefix(b'\xef\xbb\xbf'))
    return lua


class ServerTests(unittest.TestCase):
    def test_complete_global_include_chunk_compiles(self):
        import re
        root=ROOT/'Server/S1001';loaded=set();defines={b'LANGUAGE':b'zh-CN'}
        def expand(path):
            # The engine supplies Lang userdata independently of each NPC chunk.
            if path.name=='LangCode.txt':return b'\n'
            raw=path.read_bytes().removeprefix(b'\xef\xbb\xbf').rstrip(b'\0')
            out=[];conditions=[];active=True
            for line in raw.splitlines(keepends=True):
                match=re.match(rb'^--#(\w+)(.*)',line)
                if not match:out.append(line if active else b'\n');continue
                command,arg=match[1],match[2].strip()
                if command in (b'if',b'ifdef',b'ifndef'):
                    if command==b'if':
                        tokens=arg.split();condition=len(tokens)>=3 and defines.get(tokens[0])==tokens[2]
                    else:
                        condition=arg.split()[0] in defines
                        if command==b'ifndef':condition=not condition
                    conditions.append((active,condition));active=active and condition
                elif command==b'else':parent,condition=conditions[-1];active=parent and not condition
                elif command==b'endif':active=conditions.pop()[0]
                elif active and command==b'define':
                    tokens=arg.split();defines[tokens[0]]=tokens[1] if len(tokens)>1 else b'1'
                elif active and command==b'include':
                    include=re.match(rb'"([^"\r\n]+)"(.*)',arg)
                    if not include:out.append(line);continue
                    relative=include[1].decode().replace('\\','/')
                    target=next((p.resolve() for p in (path.parent/relative,root/relative) if p.exists()),None)
                    self.assertIsNotNone(target,relative)
                    if target in loaded and b'once' in include[2]:continue
                    loaded.add(target);out.append(expand(target)+b'\n')
                else:out.append(b'\n')
            return b''.join(out)
        source=expand(FUNCTIONS/'GlobalFunction.lua')
        # Normalize two legacy GBK smart-quote empty strings in verification only.
        source=re.sub(rb'desc\s*=\s*\xa1\xb0\xa1\xb1',b'desc=""',source)
        lua=LuaRuntime(encoding=None,unpack_returned_tuples=True)
        self.assertEqual(lua.eval(b'function(s)local f,e=loadstring(s);return f~=nil,e end')(source),(True,None))

    def test_all_twelve_unmerged_accessory_recipes_and_rejections(self):
        lua=runtime();g=lua.globals()
        for tier in range(1,4):
            for slot in range(1,5):
                cfg=g.HeChengCfg[4][tier][slot]
                count=cfg[b'needcount1']+cfg[b'needcount2'];id_=cfg[b'id1'];gold=cfg[b'neeMoney']
                for available,full,success in [(count,False,True),(count-1,False,False),(count,True,False)]:
                    lua.execute(b'bag={};money={[0]=0};tips={};packetpos=0')
                    g.packet=lua.table_from([4,tier,slot]);g.bag[id_]=available
                    g.money[0]=gold;g.fullBag=full;g.HeChengHandle(0,0,lua.table())
                    self.assertEqual(g.bag[cfg[b'id3']] or 0,int(success))
                    self.assertEqual(g.bag[id_],0 if success else available)
                    self.assertEqual(g.money[0],0 if success else gold)

    def test_unmerged_forging_all_slots_and_tiers_and_boundaries(self):
        lua=runtime();g=lua.globals()
        for tier in (1,2,3):
            for slot in (1,2,3,4):
                for level in (0,g.OrnamentCfg[b'MaxLevels'][tier]-1,g.OrnamentCfg[b'MaxLevels'][tier]):
                    lua.execute(b'bag={[5648]=100000};money={[1]=100000000};tips={};equipped=true')
                    g.tier=tier;g.level=level
                    g.OrnamentUpgrade(0,lua.table_from([0,29,1,slot]))
                    self.assertEqual(g.level,min(level+1,g.OrnamentCfg[b'MaxLevels'][tier]))
        for equipped,stone,gold in [(False,99999,999999),(True,0,999999),(True,99999,0)]:
            lua.execute(b'bag={};money={};tips={};level=0;tier=1')
            g.equipped=equipped;g.bag[5648]=stone;g.money[1]=gold
            g.OrnamentUpgrade(0,lua.table_from([0,29,1,1]));self.assertEqual(g.level,0)

    def test_open_day_six_and_rose_entry(self):
        lua=runtime();g=lua.globals()
        for day in (1,5,6,10):
            g.openDay=day;g.dialog=False;g.tips=lua.table();g.AskChangeSex(0,0)
            self.assertEqual(g.dialog,day>=6)
            g.tips=lua.table();self.assertEqual(g.ChangeVocation(0) is not None,day>=6)
        for fuben in (0,1):
            g.fuben=fuben
            self.assertEqual(b'BuyRedRose' in g.Rose_Main(0),fuben==0)

    def test_item_counts_and_forge_costs_match_client_and_packed_copy(self):
        lua=runtime();g=lua.globals();folder=ROOT/'web/v2/lang/zh-cn'
        for filename in ('heChengCfg.cbp','ornamentCfg.cbp'):
            _,node=read_cbp((folder/filename).read_bytes());client=config_value(node)
            if filename.startswith('he'):
                for tier in range(3):
                    for slot in range(4):
                        server=g.HeChengCfg[4][tier+1][slot+1];recipe=client[3][tier][slot]
                        for key in ('id1','id2','id3','needcount1','needcount2','neeMoney','isbind'):
                            self.assertEqual(recipe[key],server[key.encode()])
            else:
                self.assertEqual(client['consumeItemId'],g.OrnamentCfg[b'consumeItemId'])
                for slot in range(4):
                    for i,level in enumerate(client['Slots'][slot]['Levels']):
                        self.assertEqual(level['consumes'],
                                         list(g.OrnamentCfg[b'Slots'][slot+1][b'Levels'][i+1][b'consumes'].values()))
            copies=[data for name,data in read_pack((folder/'zh-cn.dat').read_bytes()) if name.lower()==filename.lower()]
            self.assertEqual(copies,[(folder/filename).read_bytes()])


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--lua-path',type=Path);args=parser.parse_args()
    if args.lua_path:sys.path.insert(0,str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]],verbosity=2)
