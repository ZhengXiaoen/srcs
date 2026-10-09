"""Verify every BOSS, native migration, exact rates, failure cleanup and previews."""
import argparse, collections, itertools, math, re, subprocess, sys, unittest
from pathlib import Path
from patch_boss_equipment_drop import ROOT,DATA,load,build,equipment,probabilities,generate
from patch_guild_quest_config import read_cbp,read_pack

class EquipmentTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.lua,cls.items,cls.meta,cls.monsters=load()
        cls.cfg,cls.audit=build(cls.lua,cls.items,cls.meta,cls.monsters)

    def runtime(self):
        from lupa.lua51 import LuaRuntime
        lua=LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''
LocalDT={};drops={};released=0;errors=0;broadcasts=0;notices=0
LogIds={BossEquipmentDrop=2826};PROP_ACTOR_VOCATION=1;ttChatWindow=128;ttScreenCenter=2
Lang={ScriptTips={zf560="%s %s %s %s %s"}}
System={getRandomNumber=function(n) if queue and #queue>0 then local v=table.remove(queue,1);assert(v>=0 and v<n);return v end;return value or 0 end,
 trace=function() errors=errors+1 end,getDaysSinceOpenServer=function() return 1 end,
 broadcastTipmsg=function() broadcasts=broadcasts+1 end}
Actor={getEntityType=function(a) return a.kind or 0 end,getMonsterOwner=function(a) return a.owner end,
 getIntProperty=function(a) return a.job or 1 end,getName=function() return 'name' end,getSceneName=function() return 'map',10,20 end}
Item={createItem=function(id,count,strong,quality,bind) assert(count==1 and strong==0 and quality==0);if failCreate then return nil end;return {id=id,count=count,bind=bind} end,
 createDropItem=function(m,item,log,name,owner) assert(log==2826 and name=='BossEquipmentDrop' and owner==nil);if failDrop then return false end;table.insert(drops,item);return true end,
 releaseItemPtr=function() released=released+1 end,getItemLinkMsg=function(id) return tostring(id) end}
OnMonsterDropNotice=function() notices=notices+1 end
''')
        lua.execute((DATA/'config/monster/BossEquipmentDropCfg.lua').read_text('utf8'))
        lua.execute((DATA/'functions/BossEquipmentDrop.lua').read_text('utf8'))
        return lua

    def test_generated_data_is_current(self):
        generate(self.cfg,self.audit,self.lua,True)

    def test_native_tables_only_disable_authorized_rows(self):
        source=(DATA/'config/monster/StdMonster.txt').read_bytes()
        baseline=subprocess.check_output(['git','show','122628a:Server/S1001/data/config/monster/StdMonster.txt'],cwd=ROOT)
        self.assertTrue(source.startswith(baseline))
        expanded=re.sub(rb'--#include "drops\\([^"\r\n]+)"',lambda m:(DATA/'config/monster/drops'/m[1].decode()).read_bytes(),source)
        expanded=expanded.replace(b'--#include "BossEquipmentDropCfg.lua"',(DATA/'config/monster/BossEquipmentDropCfg.lua').read_bytes())
        self.lua.execute(expanded)
        actual={int(m[b'entityid']):[{k.decode():int(v) for k,v in r.items()} for _,r in sorted(m[b'drops'].items())] for _,m in self.lua.globals().StdMonster.items()}
        for mid,m in self.monsters.items():
            disabled=set(self.cfg['monsters'].get(mid,{}).get('disabled',[]))
            expected=[dict(r,propability=0) if i in disabled else r for i,r in enumerate(m['rows'],1)]
            self.assertEqual(expected,actual[mid],mid)
            if mid in self.cfg['monsters']:
                self.assertFalse(any(equipment(r,self.meta) and self.meta[r['id']]['kind'] in (1,2) and r['propability']>0 for r in actual[mid]),mid)
        # Shared template files and all non-target monsters are untouched.
        changed=subprocess.check_output(['git','diff','--name-only','122628a','--','Server/S1001/data/config/monster/drops'],cwd=ROOT)
        self.assertEqual(b'',changed)

    def test_all_weights_and_real_candidate_items(self):
        self.assertEqual(540,len(self.cfg['monsters']))
        self.assertFalse({592,596,600,604,608,612}&self.cfg['monsters'].keys())
        for mid,weights in self.audit.items():
            for job,rows in enumerate(weights,1):
                self.assertAlmostEqual(1,sum(r['weight'] for r in rows),places=13,msg=str(mid))
                for row in rows:
                    for field,kind in [('weapons',1),('clothes',2)]:
                        self.assertEqual(len(row[field]),len(set(row[field])))
                        for iid in row[field]:
                            self.assertEqual(kind,self.meta[iid]['kind'])
                            self.assertNotEqual(b'null',self.lua.globals().Item[('n'+str(iid)).encode()])
                            self.assertIn(self.meta[iid]['tier'],[row['tier'],row['tier']-1])
                            self.assertGreater(self.items[iid][b'icon'],0)
                    self.assertEqual(len(row['weapons'])*2,len(row['clothes']))
        self.assertEqual([1,2,3,4,5,6,7,9,11],[r['tier'] for r in self.audit[95][0]])
        self.assertEqual([1,2,3,4,5,6,7,9,11,13],[r['tier'] for r in self.audit[1343][0]])
        self.assertAlmostEqual(.008391089283794984,self.audit[95][0][0]['weight']*.03,places=15)
        self.assertAlmostEqual(.008027212612823448,self.audit[1343][0][0]['weight']*.03,places=15)
        for mid in (696,697,698,705,706,707):self.assertIn(mid,self.cfg['monsters'])

    def test_exact_rate_for_all_bosses_and_jobs(self):
        lua=self.runtime()
        lua.execute('''
for mid,entry in pairs(LocalDT.BossEquipmentDrop.monsters) do
 for job=1,3 do
  local weights=LocalDT.BossEquipmentDrop.profiles[entry.profile].weights[job]
  for _,test in ipairs({{300,'weapons'},{500,'clothes'}}) do
   local total=0
   for roll=0,9999 do
    queue={roll,0,0};drops={}
    LocalDT.RollBossEquipment({}, {}, weights, test[1], test[2])
    assert(#drops<=1)
    total=total+#drops
   end
   assert(total==test[1],mid..':'..job)
  end
 end
end
''')

    def test_weight_boundaries_and_all_candidates(self):
        lua=self.runtime();g=lua.globals()
        for profile in self.cfg['profiles']:
            for rows in profile['weights']:
                cumulative=0
                for row in rows:
                    draw=int((cumulative+row['weight']/2)*1e9)
                    for field,rate in [('weapons',300),('clothes',500)]:
                        for index,iid in enumerate(row[field]):
                            g.queue=lua.table_from([0,draw,index]);g.drops=lua.table()
                            g.LocalDT.RollBossEquipment(lua.table(),lua.table(),lua.table_from(rows,recursive=True),rate,field)
                            self.assertEqual(iid,g.drops[1].id)
                            self.assertEqual(row['bind'],g.drops[1].bind)
                    cumulative+=row['weight']

    def test_independent_rolls_pet_kills_and_cleanup(self):
        lua=self.runtime();g=lua.globals()
        for queue,expected in [([299,0,0,499,0,0],2),([300,499,0,0],1),([299,0,0,500],1),([300,500],0)]:
            g.queue=lua.table_from(queue);g.drops=lua.table()
            g.LocalDT.DropBossEquipment(lua.table(),lua.table_from({'kind':0,'job':1}),95)
            self.assertEqual(expected,len(g.drops))
        for kind in [0,1,2,4]:
            g.queue=lua.table_from([0,0,0,0,0,0]);g.drops=lua.table()
            g.LocalDT.DropBossEquipment(lua.table(),lua.table_from({'kind':kind,'owner':lua.table_from({'job':2})}),95)
            self.assertEqual(2,len(g.drops))
        g.drops=lua.table();g.LocalDT.DropBossEquipment(None,lua.table(),95);g.LocalDT.DropBossEquipment(lua.table(),None,95);g.LocalDT.DropBossEquipment(lua.table(),lua.table(),592)
        self.assertEqual(0,len(g.drops))
        g.failDrop=True;g.queue=lua.table_from([0,0,0,0,0,0]);g.LocalDT.DropBossEquipment(lua.table(),lua.table(),95)
        self.assertEqual(2,g.released);self.assertEqual(2,g.errors)
        g.failDrop=False;g.failCreate=True;g.queue=lua.table_from([0,0,0,0,0,0]);g.LocalDT.DropBossEquipment(lua.table(),lua.table(),95)
        self.assertEqual(2,g.released);self.assertEqual(4,g.errors)

    def test_mixed_groups_preserve_rows_probability_and_stopping(self):
        for mid,entry in self.cfg['monsters'].items():
            m=self.monsters[mid];groups=collections.defaultdict(list)
            for row in m['rows']:
                if row['group']>0:groups[row['group']].append(row)
            expected=[]
            for rows in groups.values():
                old=any(equipment(r,self.meta) and self.meta[r['id']]['kind']<3 and r['propability']>0 for r in rows)
                others=any(not(equipment(r,self.meta) and self.meta[r['id']]['kind']<3) and r['propability']>0 for r in rows)
                if old and others:expected.append(rows)
            actual=self.cfg['profiles'][entry['profile']-1]['mixed']
            self.assertEqual(len(expected),len(actual))
            for old,new in zip(expected,actual):
                self.assertEqual([r['id'] for r in old],[r['id'] for r in new])
                self.assertEqual([r['propability'] for r in old],[r['propability'] for r in new])
                self.assertEqual([r['bind'] for r in old],[r['bind'] for r in new])
                self.assertEqual(probabilities(old,1),probabilities(new,1))
        lua=self.runtime();g=lua.globals()
        lua.execute('''
LocalDT.BossEquipmentDrop.profiles[1]={mixed={{{id=430,propability=2,bind=0,omit=true},{id=433,propability=4,bind=1,omit=false}}},weights={{{weight=1,bind=0,weapons={430},clothes={431}}}}}
LocalDT.BossEquipmentDrop.monsters[99999]={profile=1}
''')
        counts=0
        for draws in itertools.product(range(8),repeat=2):
            queue=[]
            for draw in draws:queue.extend([draw//4,draw%4 % (2 if draw//4==0 else 4)])
            # Native rolls map to a common denominator of 4: 0 and 2 succeed for D=2.
            queue+= [9999,9999]
            g.queue=lua.table_from(queue);g.drops=lua.table()
            # Random queue needs unused draws skipped when group succeeds; use separate channels below.
            lua.execute('nativeQueue=queue;System.getRandomNumber=function(n) if n==10000 then return 9999 end;return table.remove(nativeQueue,1) end')
            g.LocalDT.DropBossEquipment(lua.table(),lua.table(),99999)
            counts+=len(g.drops)
        self.assertAlmostEqual(probabilities([{'propability':2},{'propability':4}],1)[1],counts/64,places=14)

    def test_preview_client_pack_only_changes_awards(self):
        path=ROOT/'web/v2/lang/zh-cn/AdvanceMonsterEquipCfg.cbp'
        baselinepack=read_pack(subprocess.check_output(['git','show','122628a:web/v2/lang/zh-cn/zh-cn.dat'],cwd=ROOT))
        before=next(v for n,v in baselinepack if n.lower()=='advancemonsterequipcfg.cbp')
        old=read_cbp(before)[1];current=read_cbp(path.read_bytes())[1]
        self.assertEqual(len(old.children),len(current.children))
        for a,b in zip(old.children,current.children):
            mid=int(a.child('id').number())
            for c,d in zip(a.children,b.children):
                if c.name!='awards':self.assertEqual(c,d)
            for c,d in zip(a.child('awards').children,b.child('awards').children):
                self.assertEqual(c.children,d.children[:len(c.children)])
                if mid not in self.cfg['monsters']:self.assertEqual(c,d)
                for item in d.children[len(c.children):]:
                    self.assertIn(int(item.child('id').number()),self.meta)
                    self.assertEqual(1,item.child('count').number())
        packpath=path.parent/'zh-cn.dat'
        oldpack=read_pack(subprocess.check_output(['git','show','122628a:'+packpath.relative_to(ROOT).as_posix()],cwd=ROOT))
        newpack=read_pack(packpath.read_bytes())
        self.assertEqual([n for n,_ in oldpack],[n for n,_ in newpack])
        self.assertEqual({'advancemonsterequipcfg.cbp'},{n.lower() for (n,a),(_,b) in zip(oldpack,newpack) if a!=b})
        self.assertEqual(path.read_bytes(),next(v for n,v in newpack if n.lower()=='advancemonsterequipcfg.cbp'))

    def test_server_and_client_preview_item_ids_match(self):
        from compile_boss_drop_lua import expand
        from lupa.lua51 import LuaRuntime
        lua=LuaRuntime(encoding=None)
        lua.execute(expand(DATA/'config/monster/AdvanceMonsterEquipCfg.lua'))
        client=read_cbp((ROOT/'web/v2/lang/zh-cn/AdvanceMonsterEquipCfg.cbp').read_bytes())[1]
        server={int(row[b'id']):row for _,row in lua.globals().AdvanceMonsterEquipCfg.items()}
        for row in client.children:
            mid=int(row.child('id').number())
            if mid not in self.cfg['monsters']:continue
            for job,awards in enumerate(row.child('awards').children,1):
                ids=[int(v.child('id').number()) for v in awards.children]
                actual=[int(v[b'id']) for _,v in sorted(server[mid][b'awards'][job].items())]
                self.assertEqual(ids,actual,mid)
                self.assertLess(len(ids),256)

    def test_candidate_client_icons_match_server_and_pack(self):
        client=ROOT/'web/v2/lang/zh-cn'
        packed=dict(read_pack((client/'zh-cn.dat').read_bytes()))
        candidates={iid for rows in self.audit.values() for row in rows[0] for iid in row['weapons']+row['clothes']}
        found={}
        for path in client.glob('stditems*.cbp'):
            self.assertEqual(path.read_bytes(),packed[path.name])
            for row in read_cbp(path.read_bytes())[1].children:
                iid=int(row.child('id').number())
                if iid in candidates:found[iid]=row
        self.assertEqual(candidates,found.keys())
        for iid,row in found.items():
            self.assertEqual(self.meta[iid]['kind'],row.child('type').number())
            self.assertEqual(int(self.items[iid][b'icon']),row.child('icon').number())

    def test_callback_first_kill_guard(self):
        lua=self.runtime();g=lua.globals()
        lua.execute('''
OneTimesDropMonsters={[95]=true};ZhuanShengAccessoryDropCfg={tiers={}}
Actor.getSceneId=function() return 0 end
Actor.getStaticVar=function(a) a.state=a.state or {};return a.state end
OnMonsterByKilled=function() end;MonDieDispatcher={CommonDieFunc=function() end}
MonsterForQuest={};ShareHitMonsterForQuest={}
''')
        lua.execute((DATA/'functions/MonsterFunction.lua').read_text('utf8'))
        lua.execute('LocalDT.DropBossMaterials=function() end;testMonster={};testKiller={job=1}')
        g.queue=lua.table_from([0,0,0,0,0,0])
        self.assertTrue(g.HandlerMonsterByKilled(g.testMonster,g.testKiller,95,0,0,None))
        self.assertEqual(2,len(g.drops))
        self.assertFalse(g.HandlerMonsterByKilled(g.testMonster,g.testKiller,95,0,0,None))
        self.assertEqual(2,len(g.drops))

    def test_real_boss_previews_keep_wings_and_add_equipment(self):
        from lupa.lua51 import LuaRuntime
        lua=LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''
LocalDT={};state={};vocation=1;PROP_ACTOR_VOCATION=1
System={getDyanmicVar=function() return state end,getMonsterNameById=function(id) return 'BOSS'..id end}
Actor={getIntProperty=function() return vocation end}
Fuben={getSceneNameById=function(id) return 'map'..id end}
''')
        for path in ['config/BossListInfo/BossListInfo.lua','config/monster/SRRefreshMonster.lua','config/monster/BossEquipmentPreviewCfg.lua','functions/BossListInfo/BossEquipmentPreview.lua','functions/BossListInfo/BossListInfoEx.lua']:
            lua.execute((DATA/path).read_text('utf-8-sig'))
        lua.execute('ShowRightBossListInfo=function(_,kind,text) assert(kind==1);preview=text end')
        g=lua.globals();info=g.GetBoosListInfoForSceneName('\u86a9\u5c24\u5730\u5bab')
        for job in (1,2,3):
            g.vocation=job
            for mid in (None,*range(1279,1288)):
                g.HandleTestBoos(1,info.args,'map',mid)
                ids=[int(i) for i in re.findall(r'<\(iitem#(\d+)#1\)>',g.preview)]
                from patch_chiyou_wing_descriptions import ITEMS
                self.assertEqual(list(ITEMS),[i for i in ids if i in ITEMS])
                if mid:
                    for _,iid in g.LocalDT.BossEquipmentPreview[mid].items():self.assertEqual(1,ids.count(iid))

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--lua-path');args,remaining=parser.parse_known_args()
    if args.lua_path:sys.path.insert(0,args.lua_path)
    unittest.main(argv=[sys.argv[0]]+remaining)
