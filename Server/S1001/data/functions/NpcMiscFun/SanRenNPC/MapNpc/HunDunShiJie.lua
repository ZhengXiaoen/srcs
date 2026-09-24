--#include "data\functions\Systems\ActivitySystem\jumozhichaoHandle.lua" once
--#include "data\config\NpcMiscCfg\HunDunShiJieCfg.lua" once
-- local t = {}
NpcDialog[389] = {}
NpcDialog[389].main = function(sysarg)
	--//主显示内容
	local echo = [[

  <(c0xFF00c0ff)混沌地界简单介绍:><(idecoLine#350)>

    <(ifragments#16#18)><(c0xFFb6946c)1.混沌地界一共有><(c0xFF00FF00)四层><(c0xFFb6946c)，进入每层需消耗><(c0xFF00FF00)5000元宝>
    <(ifragments#16#18)><(c0xFFb6946c)2.进入每层只可在地图内停留> <(c0xFF00FF00)60分钟><(c0xFFb6946c),过时移出.>
    <(ifragments#16#18)><(c0xFFb6946c)3.1-4层分别会刷新><(c0xFF00FF00)4转><(c0xFFb6946c).><(c0xFF00FF00)5转><(c0xFFb6946c).><(c0xFF00FF00)6转><(c0xFFb6946c).><(c0xFF00FF00)7转><(c0xFFb6946c).><(c0xFF00FF00)9转.><(c0xFF00FF00)11转.>
    <(ifragments#16#18)><(c0xFFb6946c)4.层数越高BOSS越强,极品BOSS越多哦!>
    <(ifragments#16#18)><(c0xFFb6946c)5.BOSS刷新时间:\          4转BOSS:><(c0xFF00FF00)1小时刷新><(c0xFFb6946c) \          5转BOSS:><(c0xFF00FF00)2小时刷新><(c0xFFb6946c) \          6转BOSS:><(c0xFF00FF00)3小时刷新><(c0xFFb6946c)      \          7转BOSS:><(c0xFF00FF00)4小时刷新><(c0xFFb6946c) \          9转BOSS:><(c0xFF00FF00)5小时刷新><(c0xFFb6946c) \          11转BOSS:><(c0xFF00FF00)6小时刷新>

]]
    local map =HunDunShiJieCfg.MapId
	if Actor.getSceneId(sysarg) == 83 then
		echo = echo.."<#BN进入"..Fuben.getSceneNameById(map[1]).."/@tEnterHunDunScene,"..map[1]..">   "
	end
	if Actor.getSceneId(sysarg) == map[1] then
		echo = echo.."<#BN进入"..Fuben.getSceneNameById(map[2]).."/@tEnterHunDunScene,"..map[2]..">   "
	end
	if Actor.getSceneId(sysarg) == map[2] then
		echo = echo.."<#BN进入"..Fuben.getSceneNameById(map[3]).."/@tEnterHunDunScene,"..map[3]..">   "
	end
	
	if Actor.getSceneId(sysarg) == map[3] then
		echo = echo.."<#BN进入"..Fuben.getSceneNameById(map[4]).."/@tEnterHunDunScene,"..map[4]..">   "
	end

	
    --for i = 1,table.getn(map) do
    --    echo = echo.."<进入"..Fuben.getSceneNameById(map[i]).."/@tEnterHunDunScene,"..map[i]..">   "
    --end
	 return echo;
end

NpcDialog[389].tEnterHunDunScene = function(sysarg,mapId)
    mapId = tonumber(mapId)
    local nNeedMoney = HunDunShiJieCfg.Money
    if(Actor.getMoneyCount(sysarg,mtYuanbao) < nNeedMoney) then
        Actor.sendTipmsg(sysarg,"元宝不足"..nNeedMoney..",进入失败。",ttFlyTip)
            return 
    end
    Actor.changeMoney(sysarg,mtYuanbao,-nNeedMoney,LogIds.hundunshijie,"进入混沌地界")
    Actor.telportSceneRandPos(sysarg,Fuben.getSceneNameById(mapId))
	Actor.deleteTimer(sysarg,HunDunShiJieCfg.TimeId)
    Actor.addTimer(sysarg,HunDunShiJieCfg.TimeId,HunDunShiJieCfg.Time)
    local dVar = Actor.getDyanmicVar(sysarg) 
    dVar.hdCountDown = HunDunShiJieCfg.Time / 1000
	Actor.deleteTimer(sysarg,HunDunShiJieCfg.CountDownId)
    Actor.addTimer(sysarg,HunDunShiJieCfg.CountDownId,HunDunShiJieCfg.CountdownTime)
    local NpcName = Actor.getTalkNpcName(sysarg); --取出正在对话的NPC名字
	local StrNpcE = string.format("<%s/M沙漠土城:165:120:%s><(x沙漠土城:165:120:%s)>",NpcName,NpcName,NpcName);
    local str = string.format("<(n%s)>通过%s进入了%s",Actor.getName(sysarg),StrNpcE,Fuben.getSceneNameById(mapId) )
    System.broadcastTipmsg(str,ttChatWindow)

    local pack = DataPack.allocPacket(sysarg,139,237)
    DataPack.writeInt(pack,HunDunShiJieCfg.Time / 1000)
    DataPack.flush(pack)
  
end
-- function GetNpcHunDunShiJie() return t end