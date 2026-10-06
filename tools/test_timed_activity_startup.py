"""Run startup recovery and entry boundaries against actual Lua 5.1 handlers.

Uses the shipped timetable and activity configuration, with external game APIs
simulated. Does not restart the running server or change its clock/database.
"""
import argparse
import datetime as dt
import re
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / 'Server/S1001/data'


def source(path):
    return (DATA / path).read_bytes().removeprefix(b'\xef\xbb\xbf').rstrip(b'\0').decode('utf-8')


def function(path, name):
    text = source(path)
    start = text.index('function ' + name + '(')
    end = re.search(r'^end\s*$', text[start:], re.M)
    return text[start:start + end.end()]


class StartupTests(unittest.TestCase):
    def runtime(self, hour=10, minute=5, second=0, weekday=2, open_day=3):
        lua = LuaRuntime(unpack_returned_tuples=True)
        g = lua.globals()
        g.now = int(dt.datetime(2026, 10, 6, hour, minute, second, tzinfo=dt.timezone.utc).timestamp())
        g.weekday, g.openDay = weekday, open_day
        def decode(value):
            date = dt.datetime.fromtimestamp(value, dt.timezone.utc)
            return date.year, date.month, date.day, date.hour, date.minute, date.second
        def encode(y, m, d, h, minute, s):
            return int(dt.datetime(y, m, d, h, minute, s, tzinfo=dt.timezone.utc).timestamp())
        g.decode, g.encode = decode, encode
        lua.execute('''
LocalDT = {}; dvar = {}; svar = {}; player = {days={}}; calls = {}; timers = {}; tips = {}
cross, common, entered, bossCreates, monsterCreates = false, false, false, 0, 0
Lang = setmetatable({}, {__index=function(t,k)
 local v=setmetatable({}, {__index=function(_,key) return key end});rawset(t,k,v);return v
end})
System = {
 getCurrMiniTime=function() return now end, GetSystemTimeInMiniTime=decode, encodeNumTime=encode,
 getStaticVar=function() return svar end, getDyanmicVar=function() return dvar end,
 getDayOfWeek=function() return weekday end, getDaysSinceOpenServer=function() return openDay end,
 getDaysSinceCombineServer=function() return 0 end,
 isCrossServer=function() return cross end, isCommonServer=function() return common end,
 addTimer=function(name,delay,count) timers[name]={delay,count} end,
 deleteTimer=function(name) timers[name]=nil end,
 trace=function(message) table.insert(tips,message) end, broadcastTipmsg=function() end,
 getRandomNumber=function() return 0 end,
 isInTimeRange=function(h,m,s,eh,em,es)
   local _,_,_,nh,nm,ns=decode(now);local sec=nh*3600+nm*60+ns
   return sec>=h*3600+m*60+s and sec<eh*3600+em*60+es
 end,
}
Actor = {
 getStaticVar=function() return player end, getFubenId=function() return 0 end,
 getSceneId=function() return 1 end, getIntProperty=function() return 80 end,
 enterScene=function() entered=true;return true end, getName=function() return 'tester' end,
 sendTipmsg=function(_,tip) table.insert(tips,tip) end,
}
Fuben = {
 getSceneHandleById=function(id) return id end, getSceneById=function(id) return id end,
 createMonster=function(...) monsterCreates=monsterCreates+1;lastMonster={...};return 1 end,
 clearSceneAllMonsters=function() end, getSceneNameById=function() return '' end,
 getScenHeight=function() return 100 end, getSceenWidth=function() return 100 end,
 onCanMove=function() return true end,
}
Ranking={clear_ranking=function() end}
LuaHelp={getSceneActorListById=function() return {} end}
ttScreenCenter,ttChatWindow,ttFlyTip,PROP_CREATURE_LEVEL=1,2,3,1
createBoss=function() bossCreates=bossCreates+1 end
sendJoinActivity=function(_,id,left) joined={id,left} end
updateAndsendActivityData_jmzc=function() end; OnFinish_Liveness=function() end
''')
        lua.execute(source('config/activity/StdActivityCfg.lua'))
        timer = source('config/misc/ScriptTimer.lua').split('--#ifndef _COMMON_SERVER_')[1].split('--#else')[0]
        lua.execute(source('functions/Activity/TimedActivities.lua').replace(
            '--#include "data\\config\\misc\\ScriptTimer.lua" once', timer))
        lua.execute(source('functions/Systems/ActivitySystem/ActivityUtils.lua'))
        for name, path in {
            'StartActivity_JMZC': 'jumozhichaoHandle.lua',
            'enter_jmzc': 'jumozhichaoHandle.lua',
            'StartActivity_BGXL': 'BiGuanXiuLianHandle.lua',
            'StartActivity_bpbxd': 'benpaobaHandle.lua',
            'StartActivity_YBJNH_New': 'YuanBaoJiaNianHuaNew.lua',
            'YBJNHNew_resume_timer': 'YuanBaoJiaNianHuaNew.lua',
            'YBJNHNew_on_timer': 'YuanBaoJiaNianHuaNew.lua',
            'EndActivity_YBJNH_New': 'YuanBaoJiaNianHuaNew.lua',
        }.items():
            lua.execute(function('functions/Systems/ActivitySystem/' + path, name))
        lua.execute('''
print=function() end
sendJoinActivity=function(_,id,left) joined={id,left} end
monsterData={{1,1}};Fuben.clearMonster=function() end
for _,cfg in ipairs(LocalDT.TimedActivities) do
 if _G[cfg.start]==nil then
  _G[cfg.start]=function(_,startTime)
   calls[cfg.start]=(calls[cfg.start] or 0)+1
   if cfg.state then dvar[cfg.state]=startTime end
  end
 end
end
''')
        return lua

    def test_actual_startup_registers_recovery_after_system_initialization(self):
        lua = self.runtime()
        text = function('functions/Server.lua', 'OnStartedLogicServer')
        for name in set(re.findall(r'(?<![\w.])([A-Za-z_]\w*)\(', text)):
            if name not in ('OnStartedLogicServer', 'print'):
                lua.globals()[name] = lambda *args: None
        lua.execute('LuaEventId={ServerStarted=1}; print=function() end')
        lua.execute(text)
        lua.globals().OnStartedLogicServer()
        self.assertEqual(lua.globals().timers['RestoreRunningTimedActivities'][1], 1000)

    def test_shenwei_mid_session_entry_and_original_remaining_time(self):
        lua = self.runtime(); g = lua.globals()
        g.enter_jmzc(1)
        self.assertFalse(g.entered)  # reproduce the missed-start symptom first
        g.RestoreRunningTimedActivities(); g.enter_jmzc(1)
        self.assertTrue(g.entered)
        self.assertEqual(g.now - g.dvar.jmzcTime, 300)
        self.assertEqual(g.joined[2], 5100)
        self.assertEqual(g.bossCreates, 1)
        self.assertEqual(g.timers['swyIfCan_broadcastTipmsg_onTimer'][1], 10000)

    def test_shenwei_entry_limit_and_end_boundaries(self):
        for h,m,s,active,allowed in [(9,59,59,False,False),(10,0,0,True,True),
             (10,14,59,True,True),(10,15,0,True,False),(11,29,59,True,False),
             (11,30,0,False,False),(22,5,0,True,True),(23,30,0,False,False)]:
            with self.subTest(time=(h,m,s)):
                lua=self.runtime(h,m,s);g=lua.globals();g.RestoreRunningTimedActivities();g.enter_jmzc(1)
                self.assertEqual(g.dvar.jmzcTime is not None,active)
                self.assertEqual(g.entered,allowed)

    def test_duplicate_and_already_started_recovery_does_not_reset(self):
        lua=self.runtime();g=lua.globals();g.RestoreRunningTimedActivities()
        g.svar.ShenWeiYuBoss=6;g.now+=10;g.RestoreRunningTimedActivities()
        self.assertEqual(g.bossCreates,1);self.assertEqual(g.svar.ShenWeiYuBoss,6)
        lua=self.runtime();g=lua.globals();g.StartActivity_JMZC();g.svar.ShenWeiYuBoss=7
        g.RestoreRunningTimedActivities();self.assertEqual(g.bossCreates,1)
        self.assertEqual(g.svar.ShenWeiYuBoss,7)

    def test_disabled_cross_and_common_server_not_opened(self):
        for prop in ('cross','common'):
            lua=self.runtime();g=lua.globals();g[prop]=True;g.RestoreRunningTimedActivities()
            self.assertIsNone(g.dvar.jmzcTime)

    def test_week_and_open_day_constraints_from_real_timetable(self):
        for week in range(7):
            lua=self.runtime(13,25,weekday=week);g=lua.globals();g.RestoreRunningTimedActivities()
            self.assertEqual(g.dvar.wlzbTime is not None,week in (1,3,5))
        for day in (1,2,3,10):
            lua=self.runtime(16,7,open_day=day);g=lua.globals();g.RestoreRunningTimedActivities()
            self.assertEqual(g.dvar.yuanbaojianianhuaTimeNew is not None,day>=3)

    def test_running_and_disabled_activity_timetables(self):
        for hour,minute,state in [(15,5,'bgxlTime'),(14,10,'bpbxdTime'),
             (21,10,'duobaoqibingTime'),(11,5,'duobeiyabiaoTime'),
             (17,5,'duobeiyabiaoTime'),(21,30,'duobeiyabiaoTime'),
             (19,5,'PalaceFightingStart'),(19,30,'WorldBossStartTime')]:
            lua=self.runtime(hour,minute);g=lua.globals();g.RestoreRunningTimedActivities()
            self.assertIsNotNone(g.dvar[state],state)
        lua=self.runtime(20,15,weekday=1);g=lua.globals();g.RestoreRunningTimedActivities()
        self.assertIsNone(g.dvar.MiJingZhiLvTime)

    def test_race_recovery_does_not_recreate_expired_start_gate(self):
        lua=self.runtime(14,10);g=lua.globals();g.RestoreRunningTimedActivities()
        self.assertEqual(g.monsterCreates,1)  # final boss only, no starting blockers
        self.assertIsNone(g.timers['bpbxd_left0'])
        lua=self.runtime(14,0,20);g=lua.globals();g.RestoreRunningTimedActivities()
        self.assertEqual(g.timers['bpbxd_left30'][1],10000)
        self.assertEqual(g.lastMonster[1],342)

    def test_yuanbao_recovers_current_wave_without_replaying_past_waves(self):
        lua=self.runtime(16,7,30);g=lua.globals();g.RestoreRunningTimedActivities()
        self.assertEqual(g.dvar.YBJNH_rf_Index,2)
        self.assertEqual(g.timers['YBJNHNew_resume_timer'][1],150000)
        self.assertEqual(g.lastMonster[5],1350)
        g.now+=150;g.YBJNHNew_resume_timer()
        self.assertEqual(g.dvar.YBJNH_rf_Index,3)
        self.assertEqual(g.timers['YBJNHNew_on_timer'][1],300000)
        g.EndActivity_YBJNH_New();self.assertIsNone(g.timers['YBJNHNew_on_timer'])
        before=g.monsterCreates;g.YBJNHNew_resume_timer()
        self.assertEqual(g.monsterCreates,before)

    def test_all_global_includes_compile(self):
        root=DATA.parent;loaded=set();defines={b'LANGUAGE':b'zh-CN'}
        def expand(path):
            # Lang is supplied by the engine independently of each NPC chunk.
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
        text=expand(DATA/'functions/GlobalFunction.lua')
        # Normalize legacy GBK smart quotes in verification only.
        text=re.sub(rb'desc\s*=\s*\xa1\xb0\xa1\xb1',b'desc=""',text)
        lua=LuaRuntime(encoding=None,unpack_returned_tuples=True)
        self.assertEqual(lua.eval(b'function(s)local f,e=loadstring(s);return f~=nil,e end')(text),(True,None))


if __name__ == '__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--lua-path',type=Path);args=parser.parse_args()
    if args.lua_path:sys.path.insert(0,str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]],verbosity=2)
