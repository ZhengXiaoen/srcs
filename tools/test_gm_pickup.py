"""Check actual Lua map pickup filtering, snapshots and batched lifecycle."""
from pathlib import Path
import sys
import unittest

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools/fixtures/pickup-test-deps'))
from lupa.lua51 import LuaRuntime


class MapPickupTests(unittest.TestCase):
    def setUp(self):
        self.lua=LuaRuntime(unpack_returned_tuples=True)
        source=(ROOT/'Server/S1001/data/functions/player.lua').read_text('utf-8-sig')
        self.lua.execute('''
LocalDT={};ttFlyTip=1;scene={};otherScene={};var={};drops={};picked={};messages={};timers={}
player={entityType=0,gm=1,scene=scene};all=string.rep('16,',21)..'16';enums=0;queries=0
Actor={
 getEntityType=function(p) return p.entityType end,getGMLevel=function(p) return p.gm end,
 isDeath=function(p) return p.dead end,getScenePtr=function(p) return p.scene end,
 getSceneHandle=function(p) return 321 end,getDyanmicVar=function(p) return var end,
 sendTipmsg=function(p,t) table.insert(messages,t) end,
 regScriptCallback=function() error("current server callback API is a no-op") end,
 regScriptTimer=function(p,obj,delay,interval,repeats,name)
  assert(p==player and obj==0 and delay==100 and interval==5000 and repeats==1 and name=='GmPickupTick')
  timers[name]=true;return 123
 end,
 unregScriptCallback=function(p,name) timers[name]=nil end,
 gmDropPickup=function(p,drop,recog)
  assert(p==player)
  if recog==0 then
   queries=queries+1;assert(#picked==0,'pickup before complete metadata snapshot')
   if drop.scene==scene and not drop.removed then return drop.id,drop.money,drop.recog end
   return false
  end
  table.insert(picked,drop)
  if drop.onPickup then drop.onPickup() end
  if drop.scene~=p.scene or drop.removed or drop.recog~=recog or drop.blocked then return false end
  drop.removed=true;return true
 end,
}
Fuben={getSceenWidth=function(h) assert(h==321);return 1000 end,
 getScenHeight=function(h) assert(h==321);return 800 end}
LuaHelp={getNearEntityListFromRange=function(s,x,y,w,h,t)
 assert(s==scene and x==0 and y==0 and w==1000 and h==800 and t==3)
 enums=enums+1;return drops
end}
function tick()
 timers.GmPickupTick=nil;GmPickupTick(player)
end
function drop(id,options)
 local d={id=id or 85,money=-1,recog=#drops+1,scene=scene,x=999,y=777}
 for k,v in pairs(options or {}) do d[k]=v end
 table.insert(drops,d);return d
end
''')
        self.lua.execute((ROOT/'Server/S1001/data/config/help/SystemConfig.lua').read_text('utf-8-sig'))
        self.lua.execute(source[source.index('-- GM 面板统一入口：'):])

    def check(self,text):self.lua.execute(text)

    def test_full_instance_outside_view_and_default_selected_items(self):
        self.check('''
a=drop(85);b=drop(41);c=drop(9999);d=drop(85,{scene=otherScene});e=drop(85,{money=-2})
gmCommand(player,'gmPickupAll',all)
assert(enums==1 and queries==5 and #picked==2 and a.removed and b.removed)
assert(not c.removed and not d.removed and not e.removed and var.gmPickup==nil)
assert(string.find(messages[#messages],'2'))
''')

    def test_disabled_money_selected_gear_tier_and_overlap_order(self):
        self.check('''
p=LocalDT.GmPickupProfile(player,all)
p[4]=25 -- non-rebirth tier 9
assert(not LocalDT.GmPickupSelected(p,41,-1))
assert(LocalDT.GmPickupSelected(p,423,-1))
p[4]=31 -- illegal index: original client skips this category
assert(not LocalDT.GmPickupSelected(p,423,-1))
p[12]=0;p[13]=16 -- 5165 is in both; first matched category decides
assert(not LocalDT.GmPickupSelected(p,5165,-1))
p[12]=16;assert(LocalDT.GmPickupSelected(p,5165,-1))
p[12]=31;assert(LocalDT.GmPickupSelected(p,85,-1)) -- single choice ignores index
p[1]=0
assert(not LocalDT.GmPickupSelected(p,0,0))
assert(LocalDT.GmPickupSelected(p,0,1))
assert(not LocalDT.GmPickupSelected(p,9999,-1))
''')

    def test_profile_invalid_extras_permissions_and_missing_api_are_rejected(self):
        self.check('''
for _,v in ipairs({'',all..',16',string.rep('16,',20)..'16',all..',',','..all,
 '16,,16',string.rep('32,',21)..'32',string.rep('16,',21)..'-1',string.rep('16,',21)..'1.5'}) do
 gmCommand(player,'gmPickupAll',v)
end
gmCommand(player,'gmPickupAll',all,'extra');gmCommand(player,'gmPickupAll')
player.gm=0;gmCommand(player,'gmPickupAll',all);gmPickupAll(player,all)
player.gm=1;player.entityType=1;gmCommand(player,'gmPickupAll',all)
player.entityType=0;player.dead=true;gmCommand(player,'gmPickupAll',all)
player.dead=false;Actor.gmDropPickup=nil;gmCommand(player,'gmPickupAll',all)
assert(enums==0 and queries==0 and #picked==0)
''')

    def test_snapshot_deduplicated_recog_reuse_and_protected_drops_remain(self):
        self.check('''
a=drop();table.insert(drops,a);b=drop(85,{blocked=true});c=drop()
a.onPickup=function() c.recog=c.recog+999 end
gmCommand(player,'gmPickupAll',all)
assert(#picked==3 and a.removed and not b.removed and not c.removed)
assert(string.find(messages[#messages],'1'))
''')

    def test_large_map_batches_and_repeated_clicks(self):
        self.check('''
for i=1,121 do drop() end
gmCommand(player,'gmPickupAll',all)
assert(#picked==50 and var.gmPickup.next==51 and timers.GmPickupTick)
gmCommand(player,'gmPickupAll',all);assert(enums==1 and #picked==50)
tick();assert(#picked==100 and var.gmPickup.next==101)
tick();assert(#picked==121 and var.gmPickup==nil and not timers.GmPickupTick)
tick();assert(#picked==121)
''')

    def test_stalled_legacy_job_can_restart_after_script_reload(self):
        self.check('''
for i=1,121 do drop() end
var.gmPickup={scene=scene,drops={},next=51,picked=0}
gmCommand(player,'gmPickupAll',all)
assert(#picked==50 and var.gmPickup.version==1 and var.gmPickup.timer==123)
tick();tick();assert(#picked==121 and var.gmPickup==nil)
''')

    def test_failed_timer_registration_clears_job_and_reports_stop(self):
        self.check('''
for i=1,51 do drop() end
Actor.regScriptTimer=function() return 0 end
gmCommand(player,'gmPickupAll',all)
assert(#picked==50 and var.gmPickup==nil and not timers.GmPickupTick)
assert(string.find(messages[#messages],'已停止'))
''')

    def test_invalid_map_reports_failure_instead_of_silent_return(self):
        self.check('''
player.scene=nil;gmCommand(player,'gmPickupAll',all)
assert(string.find(messages[#messages],'当前地图'))
player.scene=scene;Fuben.getSceenWidth=function() return 0 end
gmCommand(player,'gmPickupAll',all)
assert(string.find(messages[#messages],'地图范围') and enums==0)
''')

    def test_scene_change_death_and_permission_loss_cancel_pending_batches(self):
        for change in ['player.scene=otherScene','player.dead=true','player.gm=0']:
            self.setUp()
            self.check('for i=1,101 do drop() end;gmCommand(player,"gmPickupAll",all)')
            self.check(change+';tick();assert(#picked==50 and var.gmPickup==nil and not timers.GmPickupTick)')
        self.setUp()
        self.check('''
a=drop();a.onPickup=function() player.scene=otherScene end;drop()
gmCommand(player,'gmPickupAll',all)
assert(#picked==1 and var.gmPickup==nil and not timers.GmPickupTick)
''')


if __name__=='__main__':unittest.main()
