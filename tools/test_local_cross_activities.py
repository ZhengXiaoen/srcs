"""Exercise local escort entry, battlefield respawns, and the packaged button."""
import unittest

from lupa.lua51 import LuaRuntime

from compile_boss_drop_lua import DATA
from patch_activity_entries import CLIENT
from patch_appearance_upgrade import inspect_abc, pools
from patch_drop_pickup_retry import abc_section
from test_activity_reminders import execute


def source(path):
    return (DATA / path).read_bytes().removeprefix(b'\xef\xbb\xbf').rstrip(b'\0')


class LocalCrossTests(unittest.TestCase):
    def runtime(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''
LocalDT={}; tips={}; packets={}; dead={}; spawns=0
local stateValues={}
state=setmetatable({}, {__index=stateValues, __newindex=function(_,key,value)
    assert(type(value)~='table' or stateValues[key]~=value, 'native state cannot assign a table to itself')
    stateValues[key]=value
end})
actor={scene=9, days={}, dart={}}; circle=3; power=250000; balance=999999
openDay=6; minute=11*60; now=10000; fuben=0; viewers={}; ttFlyTip=1; mtYuanbao=3
LogicCmd={miscSysEx={sysId=151, sub={sEnterCrossType=39,sCrossYaBiao=37}}}
Lang=setmetatable({}, {__index=function(t,k)
    local section=setmetatable({}, {__index=function(_, key) return key end})
    t[k]=section; return section
end})
System={isCrossServer=function() return false end, isCommonServer=function() return false end,
    getCurrMiniTime=function() return now end, getDyanmicVar=function() return state end,
    getDaysSinceOpenServer=function() return openDay end, getMonsterNameById=tostring,
    getTime=function() return math.floor(minute/60),minute%60,0 end,
    isInTimeRange=function(h,m,_,eh,em) return minute>=h*60+m and minute<eh*60+em end}
Actor={getSceneId=function(a) return a.scene end, getEntityType=function(a) return a.kind end,
    IsActorInited=function() return true end, getStaticVar=function(a) return a end,
    getDyanmicVar=function(a) return a.dart end, getIsDartFlag=function() return dartFlag or 0 end,
    getMyTopBattle=function() return power end,getIntProperty=function() return circle end,
    hasState=function() return deceased end, getFubenId=function() return fuben end,
    getMoneyCount=function() return balance end, sendTipmsg=function(_,text) tips[#tips+1]=text end,
    enterScene=function(a,scene)
        if failEntry then return false end
        local old=a.scene; a.scene=scene; LocalDT.OnLocalCrossSceneChange(a,{old,scene}); return true
    end}
Fuben={getSceneHandleById=function(scene) if not noScene then return scene end end,
    getSceneNameById=tostring, getLiveMonsterCount=function(scene,id) return dead[scene..':'..id] and 0 or 1 end,
    createMonster=function(scene,id)
        if failSpawn then return nil end
        dead[scene..':'..id]=nil; spawns=spawns+1; return 1
    end}
LuaHelp={getSceneActorListById=function(scene) return viewers[scene] end}
DataPack={readByte=function(packet) return packet end, allocPacket=function(_,system,cmd) return {system,cmd} end,
    writeByte=table.insert, writeString=table.insert, flush=function(packet) packets[#packets+1]=packet end}
CanPassCrossServer=function() return false end
GetUtf8ShowLen=string.len
''')
        for path in ('config/CrossServerConfig.lua', 'config/activity/StdActivityCfg.lua',
                     'config/activity/YuanGuZhanChangCfg.lua', 'functions/Systems/ActivitySystem/ActivityUtils.lua',
                     'functions/Activity/LocalCross.lua', 'functions/Activity/YuanGuBiaoCheUtils.lua',
                     'functions/Activity/YuanGuZhanChang.lua', 'functions/BossListInfo/BossListInfoEx.lua'):
            lua.execute(source(path))
        server = source('functions/Server.lua')
        lua.execute(server[server.index(b'function IsActorCanEnterCrossServer('):server.index(b'function setSingleRankPoint(')])
        player = source('functions/player.lua')
        start = player.index(b'function OnMonsterByKilled(')
        lua.execute(player[start:player.index(b'\r\nend\r\n', start)+5])
        return lua

    def test_open_entry_uses_current_schedule_and_sends_escort_panel(self):
        lua = self.runtime()
        g = lua.globals()
        g.minute = 21*60+25
        g.actor.days.yuanGuYabiaoCount = 3
        expected = g.CrossServerConfig.BiaoCheEnterScene[2].nSceneId[1]
        g.LocalDT.HandleLocalCrossRequest(g.actor, 101, 1)
        self.assertEqual(expected, g.actor.scene)
        self.assertEqual([[151, 39, 1], [151, 37, 0, 1, 0, 0]],
                         [list(packet.values()) for packet in g.packets.values()])
        self.assertEqual(0, len(g.tips))

    def test_blocked_escort_entry_explains_reason(self):
        for key, value, message in (
            ('minute', 21*60+24, '21:25-21:55'), ('minute', 17*60+30, '17:00-17:30'),
            ('openDay', 5, '第6天'), ('circle', 2, '3转'), ('balance', 0, '元宝'),
            ('power', 100, '战力'), ('deceased', True, '复活'), ('fuben', 1, '退出当前副本'),
            ('dartFlag', 1, '当前押镖'), ('failEntry', True, '地图暂时无法进入'),
        ):
            with self.subTest(key=key, value=value):
                g = self.runtime().globals()
                g[key] = value
                g.LocalDT.HandleLocalCrossRequest(g.actor, 101, 1)
                self.assertEqual(9, g.actor.scene)
                self.assertIn(message, g.tips[1])
                self.assertEqual(0, len(g.packets))

    def test_boss_last_hit_from_pet_starts_countdown_for_monsters_scene(self):
        lua = self.runtime()
        g = lua.globals()
        lua.execute('viewers[403]={actor}; dead["403:963"]=true')
        g.OnMonsterByKilled(lua.table_from({'scene':403}), lua.table_from({'kind':2}), 963, 0, 9, None)
        self.assertEqual(10180, g.LocalDT.GetLocalBattlefieldBossTimes(403)[963])
        self.assertEqual((139, 205, 2), tuple(g.packets[1][i] for i in (1, 2, 3)))
        self.assertIn('3分00秒后复活', g.packets[1][4])
        g.now = 10005
        g.LocalDT.RecordLocalBattlefieldBossDeath(lua.table_from({'scene':403}), 963)
        self.assertEqual(10180, g.LocalDT.GetLocalBattlefieldBossTimes(403)[963])
        self.assertEqual(1, len(g.packets))
        g.YGZC_refMonsters_Time()
        self.assertIn('2分55秒后复活', g.packets[2][4])
        g.now, g.failSpawn = 10180, True
        g.YGZC_refMonsters_Time()
        self.assertIn('等待复活', g.packets[3][4])
        g.failSpawn = False
        g.YGZC_refMonsters_Time()
        self.assertEqual(1, g.spawns)
        self.assertNotIn('后复活', g.packets[4][4])
        self.assertNotIn('等待复活', g.packets[4][4])

    def test_missing_death_callback_is_recovered_on_next_scan(self):
        lua = self.runtime()
        g = lua.globals()
        g.dead['404:973'] = True
        g.YGZC_refMonsters_Time()
        self.assertEqual(10180, g.LocalDT.GetLocalBattlefieldBossTimes(404)[973])
        self.assertIsNone(g.LocalDT.GetLocalBattlefieldBossTimes(403)[963])

    def test_cross_server_panel_uses_its_existing_native_deadlines(self):
        lua = self.runtime()
        lua.execute('System.isCrossServer=function() return true end; '
                    'LuaHelp.getAllCrossBossInfoFromSceneId=function() return {963, now+120} end')
        self.assertIn('2分钟后复活', lua.globals().BuildAllCrossBossInfoUIString(403))

    def test_installed_escort_button_sends_entry_even_with_old_time_flag(self):
        data, (_, _, start, end) = abc_section(CLIENT.read_bytes())
        abc = data[start:end]
        names, classes, bodies = inspect_abc(abc)
        strings = pools(abc)['strings'][3]

        def run(class_name, kind, method, locals_, globals_, invoke):
            mid = classes[class_name][kind][method][0]
            offset, size, limits = bodies[mid]
            _, maximum = execute(abc[offset:offset+size], names, strings, locals_, globals_, invoke)
            self.assertLessEqual(maximum, limits[0])

        for flag in (0, 1):
            commands = []

            def invoke(_, method, values):
                if method == 'sendSignUp':
                    run('ServiceWarCC', 'static', 'sendSignUp', {0:{}, 1:values[0]},
                        {'MainGameSocket':{'instance':{}}}, invoke)
                if method == '__construct__':
                    return {}
                if method in ('writeCmd', 'writeByte'):
                    commands.extend(values)

            run('ServiceWarYaSongPage', 'instance', 'onClickHandler', {0:{'_timeFlag':flag}},
                {'LocalPlayer':{'mainActor':None}}, invoke)
            self.assertEqual([151, 101, 1], commands)


if __name__ == '__main__':
    unittest.main(verbosity=2)
