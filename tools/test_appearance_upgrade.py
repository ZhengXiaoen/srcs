"""Run real Lua 5.1 recipes and check deployed Flash/CBP resources against HEAD."""
import argparse
from copy import deepcopy
from pathlib import Path
import re
import subprocess
import sys
import unittest

from patch_appearance_upgrade import (ROOT,MATERIALS,RIDES,FEET,DRESSES,inspect_abc,pools,
                                      patch_items,patch_recipes,patch_description,patch_swf)
from patch_drop_pickup_retry import abc_section,instructions
from patch_guild_quest_config import read_cbp,read_pack

BASELINE='7e4b91e'
CONFIG=ROOT/'Server/S1001/data/config/ActorEvent/HeChengCfg.lua'
SCRIPT=ROOT/'Server/S1001/data/functions/AppearanceMake.lua'


def original(path):
    return subprocess.check_output(['git','show',BASELINE+':'+path.relative_to(ROOT).as_posix()],cwd=ROOT)


def runtime():
    lua=LuaRuntime(unpack_returned_tuples=True)
    lua.execute('''
LocalDT={}; LogIds={exHeChengZhuangBei=1}; ttFlyTip=1
bag={};added={};removals={};tips={};calls=0
Actor={
 getItemCount=function(_,id,a,b,bind)
   local counts=bag[id] or {}; return counts[bind] or 0
 end,
 removeItem=function(_,id,n,a,b,bind)
   calls=calls+1
   if failRemove==calls then return 0 end
   local result=math.min(n,bag[id][bind]);if partialRemove==calls then result=1 end
   bag[id][bind]=bag[id][bind]-result
   removals[#removals+1]={id=id,count=result,bind=bind};return result
 end,
 addItem=function(_,id,a,b,n,bind)
   if failAward==id then return 0 end
   bag[id]=bag[id] or {};bag[id][bind]=(bag[id][bind] or 0)+n
   added[#added+1]={id=id,count=n,bind=bind};return n
 end,
 sendTipmsg=function(_,msg)tips[#tips+1]=msg end
}
Item={getItemName=tostring,getItemLinkMsg=function(id)return '<(itemlink#49407#v1,'..id..')ITEM'..id..'>' end}
Awards={CheckBagGridCount=function(_,award)
 assert(#award==1 and award[1].count==1);return not fullBag end}
''')
    lua.execute(CONFIG.read_text(encoding='utf-8-sig'))
    lua.execute(SCRIPT.read_text(encoding='utf-8-sig'))
    return lua


class AppearanceUpgradeTests(unittest.TestCase):
    def test_all_57_recipes_consume_three_from_stack_200_and_create_one(self):
        lua=runtime();found=set()
        for group,size in [(1,18),(2,24),(3,15)]:
            recipes=lua.globals().LocalDT.AppearanceMakeRecipes(group)
            self.assertEqual(size,len(recipes))
            for series in range(1,size//3+1):
                listing=lua.globals().AppearanceMakeList(1,group,series)
                self.assertEqual(3,listing.count('<合成/'))
                self.assertEqual([(str(group),str(index)) for index in range((series-1)*3+1,series*3+1)],
                                 re.findall(r'<合成/@AppearanceMake,(\d+),(\d+)>',listing))
            for index,recipe in recipes.items():
                item,dest=recipe.itemid,recipe.destid;found.add(item)
                lua.execute(f'bag={{[{item}]={{[0]=200,[1]=0}}}};added={{}};removals={{}}')
                result=lua.globals().AppearanceMake(1,group,index)
                self.assertIn('可合成1个高级',result)
                self.assertEqual(lua.globals().AppearanceMakeList(1,group,(index+2)//3),result)
                self.assertEqual(197,lua.globals().bag[item][0])
                self.assertEqual(1,lua.globals().bag[dest][0])
                award=lua.globals().added[1]
                self.assertEqual((dest,1,0),(award.id,award.count,award.bind))
                self.assertEqual(item+1,dest)
        self.assertEqual(MATERIALS,found)

    def test_bound_and_mixed_stacks_keep_result_bound(self):
        lua=runtime()
        for group in [1,2,3]:
            for index,recipe in lua.globals().LocalDT.AppearanceMakeRecipes(group).items():
                item,dest=recipe.itemid,recipe.destid
                for bound,unbound in [(200,0),(1,2),(2,200),(3,3)]:
                    with self.subTest(group=group,index=index,bound=bound,unbound=unbound):
                        lua.execute(f'bag={{[{item}]={{[0]={unbound},[1]={bound}}}}};added={{}};removals={{}}')
                        lua.globals().AppearanceMake(1,group,index)
                        self.assertEqual(1,lua.globals().bag[dest][1])
                        self.assertEqual(max(0,bound-3),lua.globals().bag[item][1])
                        self.assertEqual(unbound-(3-min(bound,3)),lua.globals().bag[item][0])

    def test_all_categories_fit_one_page_and_series_keep_three_recipe_details(self):
        lua=runtime()
        for group,starts,entry in [(1,RIDES,'RideAppearanceMakeInit'),(2,FEET,'FootAppearanceMakeInit'),
                                   (3,DRESSES,'FashionAppearanceMakeInit')]:
            home=lua.globals().AppearanceMakeCategory(1,group)
            self.assertEqual(home,lua.globals()[entry](1))
            self.assertEqual(home,lua.globals().AppearanceMakeList(1,group))
            self.assertIn('<(c0xFFffff00)',home)
            self.assertIn('<(idecoLine#350)>',home)
            self.assertNotIn('<合成/',home)
            self.assertNotIn('上一页',home)
            self.assertNotIn('下一页',home)
            self.assertEqual(5+len(starts),home.count('\\'))
            for page in range(1,(len(starts)+3)//4+1):
                category=lua.globals().AppearanceMakeCategory(1,group,page)
                self.assertEqual(home,category)
                series_range=range(1,len(starts)+1)
                links=re.findall(r'<(\d+)合成/@AppearanceMakeList,(\d+),(\d+)>',category)
                self.assertEqual([(str(starts[series-1]),str(group),str(series)) for series in series_range],links)
                for _,link_group,link_series in links:
                    series=int(link_series)
                    listing=lua.globals().AppearanceMakeList(1,link_group,link_series)
                    self.assertIn(f'<返回主页/@AppearanceMakeCategory,{group}>',listing)
                    self.assertIn('<(c0xFFb6946c)= ><(itemlink#',listing)
                    self.assertNotRegex(listing,r'<[^>]*<')
                    for index in range((series-1)*3+1,series*3+1):
                        recipe=lua.globals().LocalDT.AppearanceMakeRecipes(group)[index]
                        self.assertEqual(starts[series-1]+(index-1)%3,recipe.itemid)
                        self.assertIn(f'ITEM{recipe.itemid}',listing)
                        self.assertIn(f'ITEM{recipe.destid}',listing)
        for group,page in [(None,1),('bad',1),(4,1),(1,'bad'),(1,0),(1,3),(1,1.5)]:
            self.assertIsNone(lua.globals().AppearanceMakeCategory(1,group,page))
        for group,series in [(1,0),(1,7),(1,'bad'),(1,1.5),(2,9),(3,6)]:
            self.assertIsNone(lua.globals().AppearanceMakeList(1,group,series))
        root=lua.globals().AppearanceMakeInit(1)
        for group in [1,2,3]:self.assertIn(f'/@AppearanceMakeCategory,{group}>',root)

    def test_short_materials_full_bag_and_invalid_requests_do_not_consume(self):
        for bound,unbound,full in [(0,2,False),(1,1,False),(0,200,True)]:
            lua=runtime();lua.execute(f'bag={{[6888]={{[0]={unbound},[1]={bound}}}}};fullBag={str(full).lower()}')
            lua.globals().AppearanceMake(1,1,1)
            self.assertEqual(0,len(lua.globals().removals));self.assertEqual(0,len(lua.globals().added))
        lua=runtime()
        for group,index in [(None,None),('bad',1),(0,1),(4,1),(1,0),(1,19),(1,1.5),(1,'bad'),(1.5,1)]:
            lua.globals().AppearanceMake(1,group,index)
        self.assertEqual(0,len(lua.globals().removals))
        for group in [1,2,3]:
            last=max(r.itemid for r in lua.globals().LocalDT.AppearanceMakeRecipes(group).values())
            self.assertNotIn(last+1,{r.itemid for r in lua.globals().LocalDT.AppearanceMakeRecipes(group).values()})

    def test_failure_refunds_exact_bound_and_unbound_quantities(self):
        lua=runtime()
        for group in [1,2,3]:
            for index,recipe in lua.globals().LocalDT.AppearanceMakeRecipes(group).items():
                item,dest=recipe.itemid,recipe.destid
                failures=[(2,200,'failRemove=1'),(2,200,'failRemove=2'),
                          (2,200,'partialRemove=1'),(1,200,'partialRemove=2'),
                          (2,200,f'failAward={dest}'),(200,0,f'failAward={dest}'),
                          (0,200,f'failAward={dest}')]
                for bound,unbound,failure in failures:
                    with self.subTest(group=group,index=index,failure=failure,bound=bound):
                        lua.execute(f'bag={{[{item}]={{[0]={unbound},[1]={bound}}}}};added={{}};removals={{}};'
                                    f'calls=0;failRemove=nil;partialRemove=nil;failAward=nil;{failure}')
                        lua.globals().AppearanceMake(1,group,index)
                        self.assertEqual(unbound,lua.globals().bag[item][0])
                        self.assertEqual(bound,lua.globals().bag[item][1])
                        self.assertIsNone(lua.globals().bag[dest])

    def test_deployed_client_entries_recipes_and_item_links_match_server(self):
        lua=runtime();client=ROOT/'web/v2/lang/zh-cn'
        packed=dict(read_pack((client/'zh-cn.dat').read_bytes()))
        for name in ['heChengCfg.cbp','stditems4.cbp']:
            self.assertEqual((client/name).read_bytes(),packed[name])
        _,config=read_cbp(packed['heChengCfg.cbp'])
        for group in [1,2]:
            rows=[row for series in config.child(str(group+7)).children for row in series.children]
            recipes=lua.globals().LocalDT.AppearanceMakeRecipes(group)
            self.assertEqual(len(recipes),len(rows))
            for index,row in enumerate(rows,1):
                self.assertEqual((recipes[index].itemid,recipes[index].itemid,recipes[index].destid,1,2,0),
                                 tuple(row.child(name).number() for name in
                                       ['id1','id2','id3','needcount1','needcount2','neeMoney']))
        _,items=read_cbp(packed['stditems4.cbp'])
        items={int(row.child('id').number()):row for row in items.children}
        language=LuaRuntime(unpack_returned_tuples=True)
        source=(ROOT/'Server/S1001/data/language/Zh-CN/Item.lua').read_text(encoding='utf-8-sig')
        strings=dict(re.findall(r'\b([ni]\d+)="((?:\\.|[^"\\\r\n])*)"',source))
        for group in [1,2,3]:
            for recipe in lua.globals().LocalDT.AppearanceMakeRecipes(group).values():
                for item in [recipe.itemid,recipe.destid]:
                    self.assertEqual(language.eval('"'+strings['n'+str(item)]+'"'),items[item].child('name').value.decode('utf-8'))
                    self.assertEqual(language.eval('"'+strings['i'+str(item)]+'"'),items[item].child('desc').value.decode('utf-8'))
                self.assertIn('三个可合成',items[recipe.itemid].child('desc').value.decode('utf-8'))
        for file,class_name,entries in [('web/GameFrame.swf','FashionCombineWin',
                                         ['FootAppearanceMakeInit','FashionAppearanceMakeInit']),
                                        ('web/v2/modules/mount/Mount.swf','MountIllusionCombinWin',
                                         ['RideAppearanceMakeInit'])]:
            data,(_,_,start,end)=abc_section((ROOT/file).read_bytes());abc=data[start:end]
            names,catalog,bodies=inspect_abc(abc)
            method=catalog[class_name]['instance']['show'][0];start,size,_=bodies[method]
            operations=instructions(abc[start:start+size]);strings=pools(abc)['strings'][3]
            self.assertEqual(entries,[strings[operation.operands[0]] for operation in operations if operation.opcode==0x2c])
            calls=[names[operation.operands[0]] for operation in operations if operation.opcode==0x4f]
            self.assertEqual(['sendTalkToNPC']*len(entries),calls)

    def test_legacy_recipes_and_click_entry_allowlist(self):
        lua=runtime()
        for group,starts in [(9,RIDES),(10,FEET)]:
            found=set()
            for rows in lua.globals().HeChengCfg[group].values():
                for row in rows.values():
                    self.assertEqual((1,2,0,row.id1,row.id1+1),
                                     (row.needcount1,row.needcount2,row.neeMoney,row.id2,row.id3))
                    found.add(row.id1)
            self.assertEqual({x+i for x in starts for i in range(3)},found)
        source=(ROOT/'Server/S1001/data/functions/GlobalNpcFunctions.lua').read_bytes()
        for name in ['AppearanceMakeInit','AppearanceMakeCategory','AppearanceMakeList','AppearanceMake','RideAppearanceMakeInit',
                     'FashionAppearanceMakeInit','FootAppearanceMakeInit']:
            self.assertIn(name.encode()+b' =1,',source)
        self.assertNotRegex(SCRIPT.read_text(encoding='utf-8'),r'(?m)^local ')
        # Script has no per-chunk locals even when included after many modules.
        combined=';'.join('local x%d=0'%i for i in range(180))+'; local LocalDT={}; '+SCRIPT.read_text(encoding='utf-8-sig')
        self.assertTrue(lua.eval('function(source) return assert(loadstring(source)) ~= nil end')(combined))

    def test_legacy_stack_request_delegates_without_four_grid_consumption(self):
        lua=runtime()
        lua.execute('''
DataPack={readByte=function(packet) packet.index=packet.index+1;return packet[packet.index] end}
MiscsImplementEx={registerMsgHandler=function() end}
LogicCmd={miscSysEx={sub={cHeCheng=1}}}
''')
        file=ROOT/'Server/S1001/data/functions/ActorEvent/HeChengShiPing.lua'
        lua.execute(file.read_text(encoding='utf-8-sig'))
        for group in [9,10]:
            for row in [1,3,len(lua.globals().HeChengCfg[group])]:
                recipe=lua.globals().HeChengCfg[group][row][1]
                lua.execute(f'bag={{[{recipe.id1}]={{[0]=198,[1]=2}}}};calls=0;added={{}}')
                lua.globals().HeChengHandle(1,151,lua.table_from({1:group,2:row,3:1,'index':0}))
                self.assertEqual(197,lua.globals().bag[recipe.id1][0])
                self.assertEqual(0,lua.globals().bag[recipe.id1][1])
                self.assertEqual(1,lua.globals().bag[recipe.id3][1])

    def test_server_descriptions_change_only_recipe_quantity(self):
        lang=ROOT/'Server/S1001/data/language/Zh-CN/Item.lua'
        expected=original(lang)
        for item in MATERIALS:
            pattern=rb'(\bi'+str(item).encode()+rb'=\")[^\r\n]*?\"'
            expected=re.sub(pattern,lambda m:patch_description(m[0]),expected)
        self.assertEqual(expected,lang.read_bytes())
        # No attributes or stacking configuration changed this time.
        std=ROOT/'Server/S1001/data/config/item/StdItems.txt'
        self.assertEqual(original(std),std.read_bytes())
        cfg=CONFIG.read_bytes();old=original(CONFIG)
        for first in RIDES+FEET:
            for item in range(first,first+3):
                old=old.replace(f'id1={item},needcount1=2,id2={item},needcount2=2'.encode(),
                                f'id1={item},needcount1=1,id2={item},needcount2=2'.encode())
        self.assertEqual(old,cfg)

    def test_client_pack_changes_only_item_descriptions_and_matching_recipes(self):
        client=ROOT/'web/v2/lang/zh-cn';pack=client/'zh-cn.dat'
        before,after=read_pack(original(pack)),read_pack(pack.read_bytes());changed=set()
        self.assertEqual(len(before),len(after))
        for (oldname,old),(newname,new) in zip(before,after):
            self.assertEqual(oldname,newname)
            if oldname.startswith('stditems') and oldname.endswith('.cbp'):expected=patch_items(old)
            elif oldname=='heChengCfg.cbp':expected=patch_recipes(old)
            else:expected=old
            self.assertEqual(expected,new,oldname)
            if new!=old:
                changed.add(oldname);self.assertEqual(new,(client/oldname).read_bytes())
        self.assertEqual({'stditems4.cbp','heChengCfg.cbp'},changed)

    def test_flash_changes_only_two_show_methods_and_adds_public_npc_calls(self):
        for file,mount,cl in [('web/GameFrame.swf',False,'FashionCombineWin'),
                              ('web/v2/modules/mount/Mount.swf',True,'MountIllusionCombinWin')]:
            path=ROOT/file
            # The mount module was not tracked previously. Recreate its old
            # show body and remove this patch's append-only constants.
            source=original(path) if not mount else restore_mount(path.read_bytes())
            result=path.read_bytes();self.assertEqual(patch_swf(source,mount),result)
            self.assertEqual(result,patch_swf(result,mount))
            d,(_,_,s,e)=abc_section(source);old=d[s:e];oldnames,catalog,bodies=inspect_abc(old)
            d,(_,_,s,e)=abc_section(result);new=d[s:e];names,newcatalog,newbodies=inspect_abc(new)
            self.assertEqual(catalog,newcatalog);target=catalog[cl]['instance']['show'][0]
            for method,(start,size,limits) in bodies.items():
                ns,nsize,nlimits=newbodies[method]
                if method!=target:
                    self.assertEqual((size,limits),(nsize,nlimits));self.assertEqual(old[start:start+size],new[ns:ns+nsize])
            ns,nsize,_=newbodies[target];ops=instructions(new[ns:ns+nsize]);pool=pools(new)
            for op in ops:
                if op.opcode==0x4f:self.assertEqual('sendTalkToNPC',names[op.operands[0]])
                if op.opcode==0x60:
                    self.assertIn(names[op.operands[0]],['MsgSender','TYPE_FOOT_FASHION'])
            # Every branch lands on an instruction; emulate both type choices.
            boundaries={op.start for op in ops}
            for op in ops:
                for _,dest,_ in op.branches:self.assertIn(dest,boundaries)
            links=[pool['strings'][3][op.operands[0]] for op in ops if op.opcode==0x2c]
            self.assertEqual(['RideAppearanceMakeInit'] if mount else
                             ['FootAppearanceMakeInit','FashionAppearanceMakeInit'],links)


def restore_mount(source):
    import struct,zlib
    from patch_appearance_upgrade import q
    from patch_bag_client import encode_u30
    d,(tag,payload,s,e)=abc_section(source);a=d[s:e];names,catalog,bodies=inspect_abc(a)
    method=catalog['MountIllusionCombinWin']['instance']['show'][0]
    start,size,limits=bodies[method]
    code=b'\xd0\x30'+q(0x60,432)+q(0x60,196)+q(0x4f,179,1)+b'\x47'
    header=encode_u30(method)+b''.join(encode_u30(x) for x in limits)+encode_u30(size)
    begin=start-len(header)
    replacement=encode_u30(method)+b''.join(encode_u30(x) for x in (2,1,15,16))+encode_u30(len(code))+code
    a=a[:begin]+replacement+a[start+size:]
    pool=pools(a);edits=[]
    for key,count in [('strings',4),('namespaces',1),('names',2)]:
        begin,content,end,values=pool[key]
        if key=='strings':
            expected=['RideAppearanceMakeInit','Logic.Messages','MsgSender','sendTalkToNPC']
            assert values[-count:]==expected
            suffix=b''.join(encode_u30(len(x.encode()))+x.encode() for x in expected)
        elif key=='namespaces':suffix=b'\x16'+encode_u30(660)
        else:suffix=q(7,94,661)+q(7,2,662)
        assert a[end-len(suffix):end]==suffix
        edits.append((begin,end,encode_u30(len(values)-count)+a[content:end-len(suffix)]))
    for begin,end,value in sorted(edits,reverse=True):a=a[:begin]+value+a[end:]
    result=d[:tag+2]+struct.pack('<I',s-payload+len(a))+d[payload:s]+a+d[e:]
    result=result[:4]+struct.pack('<I',len(result))+result[8:]
    return result[:8]+zlib.compress(result[8:],9)


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--lua-path',type=Path)
    args=parser.parse_args()
    if args.lua_path:sys.path.insert(0,str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]],verbosity=2)
