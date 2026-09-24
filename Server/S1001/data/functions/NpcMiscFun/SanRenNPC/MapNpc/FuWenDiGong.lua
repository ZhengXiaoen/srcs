--#include "data\config\NpcMiscCfg\FuWenDiGongCfg.lua" once
-- local t = {}
NpcDialog[401] = {}
NpcDialog[401].main = function(sysarg)
	--//主显示内容
	local echo = [[

  <(c0xFF00c0ff)符文密境介绍:><(idecoLine#350)>

    <(ifragments#16#18)><(c0xFFb6946c)符文密境一共有><(c0xFF00FF00)四层><(c0xFFb6946c)，进入每层需消耗><(c0xFF00FF00)峡谷召唤卷>
    <(ifragments#16#18)><(c0xFFb6946c)进入1层所需1张,2层2张,3层3张,4层5张.><购买峡谷召唤卷/@buyzm|活动赠送#也可直接进行购买>
    <(ifragments#16#18)><(c0xFFb6946c)1-4层分别会刷新><(c0xFF00FF00)3转><(c0xFFb6946c).><(c0xFF00FF00)4转><(c0xFFb6946c).><(c0xFF00FF00)5转><(c0xFFb6946c).><(c0xFF00FF00)6转><(c0xFFb6946c).><(c0xFF00FF00)7转><(c0xFFb6946c).><(c0xFF00FF00)9转.><(c0xFF00FF00)11转>
    <(ifragments#16#18)><(c0xFFb6946c)层数越高BOSS越强,极品BOSS越多哦!>
    <(ifragments#16#18)><(c0xFFb6946c)BOSS刷新时间:\          3转BOSS:><(c0xFF00FF00)30分钟刷新><(c0xFFb6946c) \          4转BOSS:><(c0xFF00FF00)1小时刷新><(c0xFFb6946c) \          5转BOSS:><(c0xFF00FF00)2小时刷新><(c0xFFb6946c) \          6转BOSS:><(c0xFF00FF00)3小时刷新><(c0xFFb6946c)      \          7转BOSS:><(c0xFF00FF00)4小时刷新><(c0xFFb6946c) \          9转BOSS:><(c0xFF00FF00)5小时刷新><(c0xFFb6946c) \          11转BOSS:><(c0xFF00FF00)6小时刷新>\    <(ifragments#16#18)><(c0xFFffff00)每层最多可停留60分钟！过时将移出场景>

]]
    local map =FuWenDiGongCfg.MapId
	if Actor.getSceneId(sysarg) == 9 then
		echo = echo.."<#BN"..Fuben.getSceneNameById(map[1]).."/@tEnterHunDunScene,"..map[1]..">   "
	end
	if Actor.getSceneId(sysarg) == map[1] then
		echo = echo.."<#BN"..Fuben.getSceneNameById(map[2]).."/@tEnterHunDunScene,"..map[2]..">   "
	end
	if Actor.getSceneId(sysarg) == map[2] then
		echo = echo.."<#BN"..Fuben.getSceneNameById(map[3]).."/@tEnterHunDunScene,"..map[3]..">   "
	end
	
	if Actor.getSceneId(sysarg) == map[3] then
		echo = echo.."<#BN"..Fuben.getSceneNameById(map[4]).."/@tEnterHunDunScene,"..map[4]..">   "
	end

	
	 return echo;
end

NpcDialog[401].buyzm = function(sysarg)
	Actor.openDialogs(sysarg,diBuyAnItem,6817);
end

NpcDialog[401].tEnterHunDunScene = function(sysarg,mapId)
    mapId = tonumber(mapId)
	
	local map =FuWenDiGongCfg.MapId
	local index =1
	for i=1,#map do 
		if map[i] ==mapId then 
			index = i
		end
	end
	
    --local nNeedMoney = FuWenDiGongCfg.Money
    --if(Actor.getMoneyCount(sysarg,mtYuanbao) < nNeedMoney) then
    --    Actor.sendTipmsg(sysarg,"元宝不足"..nNeedMoney..",进入失败。",ttFlyTip)
    --        return 
    --end
	local nNeedItem = FuWenDiGongCfg.NeedItem
	local bNeedItemCount = FuWenDiGongCfg.NeedItemCount[index]
    if Actor.getItemCount(sysarg,nNeedItem) < bNeedItemCount then
    	Actor.sendTipmsg(sysarg,"所需物品不足",ttFlyTip)
		return 
    end
	if Actor.removeItem(sysarg,nNeedItem,bNeedItemCount, -1, -1, -1,"进入符文地宫",1)~=bNeedItemCount then 
		Actor.sendTipmsg(sysarg,"所需物品不足",ttFlyTip)
		return 
	end
	
	
	
    --Actor.changeMoney(sysarg,mtYuanbao,-nNeedMoney,LogIds.hundunshijie,"进入混沌地界")
    Actor.telportSceneRandPos(sysarg,Fuben.getSceneNameById(mapId))
	Actor.deleteTimer(sysarg,FuWenDiGongCfg.TimeId)
    Actor.addTimer(sysarg,FuWenDiGongCfg.TimeId,FuWenDiGongCfg.Time)
    local dVar = Actor.getDyanmicVar(sysarg) 
    dVar.fwdgCountDown = FuWenDiGongCfg.Time / 1000
	Actor.deleteTimer(sysarg,FuWenDiGongCfg.CountDownId)
    Actor.addTimer(sysarg,FuWenDiGongCfg.CountDownId,FuWenDiGongCfg.CountdownTime)
    local NpcName = Actor.getTalkNpcName(sysarg); --取出正在对话的NPC名字
	--local StrNpcE = string.format("<%s/M沙漠土城:165:120:%s><(x沙漠土城:165:120:%s)>",NpcName,NpcName,NpcName);
    --local str = string.format("<(n%s)>通过%s进入了%s",Actor.getName(sysarg),StrNpcE,Fuben.getSceneNameById(mapId) )
    --System.broadcastTipmsg(str,ttChatWindow)

    --local pack = DataPack.allocPacket(sysarg,139,237)
    --DataPack.writeInt(pack,FuWenDiGongCfg.Time / 1000)
    --DataPack.flush(pack)
  
end
-- function GetNpcHunDunShiJie() return t end