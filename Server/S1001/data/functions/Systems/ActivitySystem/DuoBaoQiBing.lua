-- 夺宝奇兵
--#include "data\config\activity\StdActivityCfg.lua" once
--#include "data\functions\Systems\ActivitySystem\ActivityUtils.lua" once

-- 开始夺宝奇兵活动
function StartActivity_duobaoqibingBefore5()
	if System.isCrossServer() ==true then
		return 
	end
	
	local cfg = StdActivityCfg.DiXiaDuoBao	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
end

function StartActivity_duobaoqibing(sysarg, startTime, endTime)
	if System.isCrossServer() ==true then
		return 
	end
	print("夺宝奇兵活动 开始")	
	local dVar = System.getDyanmicVar()
	dVar.duobaoqibingTime = startTime or System.getCurrMiniTime()
    local cfg = StdActivityCfg.DiXiaDuoBao

     local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)  --获得场景句柄 普通场景0
	
	local pPtr = Fuben.createMonster(hScene, cfg.monster.id, cfg.monster.x, cfg.monster.y, endTime and (endTime - System.getCurrMiniTime()) or 20 * 60)
end

-- 结束夺宝奇兵活动
function EndActivity_duobaoqibing()
	if System.isCrossServer() ==true then
		return 
	end
	print("夺宝奇兵活动 结束")	
	

	local dVar = System.getDyanmicVar()		
	dVar.duobaoqibingTime = nil
    
	local cfg = StdActivityCfg.DiXiaDuoBao	
	local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)  --获得场景句柄 普通场景0
	Fuben.clearMonster(hScene,cfg.monster.id)
	local playerList = LuaHelp.getSceneActorListById(cfg.sceneId)	
	if playerList~=nil then 
		for i, v in ipairs(playerList or {}) do
			exit_duobaoqibing(v)
			Actor.sendTipmsg(v, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
		end	
	end

end

function can_enter_duobaoqibing(sysarg, isTip)		
	local dVar = System.getDyanmicVar()
	if dVar.duobaoqibingTime == nil then -- 活动还没开始
		if isTip then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		end
		return false
	end
	
	local cfg = StdActivityCfg.DiXiaDuoBao	
	
	if Actor.checkActorLevel(sysarg, cfg.level, 0) ~= true then
		if isTip then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.wl00005, cfg.level), ttFlyTip)
		end
		return
	end
	
	--在武林争霸中
	local curSceneId = Actor.getSceneId(sysarg)
	if curSceneId == 58 then
		if isTip then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf138, ttFlyTip)
		end
		return false
	end
	
	if curSceneId == cfg.sceneid then
		if isTip then
			Actor.sendTipmsg(sysarg, "您已经在活动中了", ttFlyTip)
		end
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	--运镖中
	if var.ybstate ~= nil and var.ybstate == 1 then
		if isTip then
			Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip)
		end
		return false
	end
	
	-- 在副本中
	local fubenId = Actor.getFubenId(sysarg)
	if fubenId > 0 then
		if isTip then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf568, ttFlyTip) 
		end
		return false
	end

	--if checkActivityTime(cfg.tOpenTime.times) == 0 then
	--	if isTip then
	--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	end
	--	return false
	--end
	
	return true
end


function enter_duobaoqibing(sysarg)
	if not can_enter_duobaoqibing(sysarg, true) then
		return
	end
	
	local cfg = StdActivityCfg.DiXiaDuoBao	
	--判断是否有散人宝箱，有则不让他进入
    if Actor.getItemCount(sysarg,304) > 0 then
        Actor.sendTipmsg(sysarg, "包裹里有散人宝藏箱，请先使用后再进入！", ttFlyTip)
        return
    end
	--local times = cfg.tOpenTime.times
	--local timeIdx = checkActivityTime(times)
	--if timeIdx == 0 then	
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	return
	--end
	--
	--local endHour = times[timeIdx][3]
	--local endMin = times[timeIdx][4]
	--local endSec = 0
	--if endHour == 0 and endMin == 0 then
	--	endHour = 23
	--	endMin = 59
	--	endSec = 59
	--end
	--
	--local leftSecond = System.ResidualTime(endHour, endMin, endSec)
	--if leftSecond == 0 then
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	return
	--end
	local dVar = System.getDyanmicVar()
	local leftSecond = cfg.tOpenTime.lefttime-(System.getCurrMiniTime() - dVar.duobaoqibingTime)
	local sSceneName = Fuben.getSceneNameById(cfg.sceneId)
	--if Actor.enterScene(sysarg, cfg.sceneId, -1, -1) == false then
    if Actor.telportSceneRandPos(sysarg,sSceneName) == false then
		return
	end

			
	local RwData = cfg.RwData
	local name = Actor.getName(sysarg)
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])

	System.broadcastTipmsg(string.format(Lang.ScriptTips.wl00001, name, RwData[1]), ttScreenCenter)
	System.broadcastTipmsg(string.format(Lang.ScriptTips.wl00002, name, RwData[1], NpcName, NpctFly), ttChatWindow)
	
	sendJoinActivity(sysarg, cfg.id, leftSecond)

	local sVar=Actor.getStaticVar(sysarg)
	if sVar.days.DBQBAB1==nil then 
		sVar.days.DBQBAB1 =0
	end
	if sVar.days.DBQBAB2==nil then 
		sVar.days.DBQBAB2 =0
	end
	
	SendMsg(sysarg,1)
	SendMsg(sysarg,2)
end

function SendMsg(sysarg,index)
	index = tonumber(index)
	local sVar=Actor.getStaticVar(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, 219)
	DataPack.writeByte(netPack, index) 
	local tosend =nil 
	if index ==1 then 
		DataPack.writeByte(netPack, sVar.days.DBQBAB1) 
	elseif index ==2 then 
		DataPack.writeByte(netPack, sVar.days.DBQBAB2) 
	end
	DataPack.flush(netPack)

end



function exit_duobaoqibing(sysarg)
    if Actor.hasTopTitle(sysarg, 25) then
        Actor.setTopTitle(sysarg,25,false)
    end
     
	Actor.exitActivityScene(sysarg)	
	sendExitActivity(sysarg, 10)
end

