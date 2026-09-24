--秘境之旅
--#include "data\config\activity\StdActivityCfg.lua" once

-- 开始巨魔之巢活动
function StartActivity_MiJingZhiLvBefore5()
	print("秘境之旅活动 预告")	
	local cfg = StdActivityCfg.MiJingZhiLv	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
end

function StartActivity_MiJingZhiLv()
	print("秘境之旅活动 开始")	
	
	local dVar = System.getDyanmicVar()
	dVar.MiJingZhiLvTime = System.getCurrMiniTime()
	dVar.MiJingZhiLvlIfCan_broadcastTipmsg=1

	System.addTimer("MSZLIfCan_broadcastTipmsg_onTimer", 10000, -1)--每10秒获得
	
end

-- 结束巨魔之巢活动
function EndActivity_MiJingZhiLv()
	print("秘境之旅活动 结束")	
	
	System.deleteTimer("MSZLIfCan_broadcastTipmsg_onTimer")
	
	local dVar = System.getDyanmicVar()
	dVar.MiJingZhiLvTime = nil
	dVar.MiJingZhiLvlIfCan_broadcastTipmsg=nil
	
	for i=220,229 do--在神威狱中
		local playerList = LuaHelp.getSceneActorListById(i)  --获取答题场景中玩家对象列表
		if playerList ~= nil then
			for i = 1, #playerList do
				local player = playerList[i]
				if player then		--初始化玩家的答题面板
					exit_MiJingZhiLv(player)
					Actor.sendTipmsg(player, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
				end
			end
		end
	end
	
end

-- 进入秘境
function enter_MiJingZhiLv(sysarg)
	local dVar = System.getDyanmicVar()
	if dVar.MiJingZhiLvTime == nil then -- 活动还没开始
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		return
	end
	
	local cfg = StdActivityCfg.MiJingZhiLv;
	local Var = Actor.getStaticVar(sysarg)
	--运镖中
	if Var.ybstate ~= nil and Var.ybstate == 1 then
		Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip) 
		return
	elseif Actor.getGuildId(sysarg) == 0 then
		Actor.sendTipmsg(sysarg,"请加入任意一个行会!", ttFlyTip) 
		return
	end
	
	--在副本中
	local fubenId = Actor.getFubenId(sysarg)
	if fubenId > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf568, ttFlyTip) 
		return
	end
	
	--在武林争霸中
	local curSceneId = Actor.getSceneId(sysarg)
	if curSceneId == 58 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf138, ttFlyTip)
		return
	end
	
	local plv = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	local RwData = cfg.RwData;
	if plv < cfg.level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bs00005, RwData[1], cfg.level), ttFlyTip)
		return;
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
	local leftSecond = cfg.tOpenTime.lefttime-(System.getCurrMiniTime() - dVar.MiJingZhiLvTime)
	if curSceneId == cfg.scenes[1] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf406,ttFlyTip)
		return
	end
	
	local curTime = System.getCurrMiniTime()
	if (curTime - dVar.MiJingZhiLvTime) >= cfg.enterTimeLimit then
		Actor.sendTipmsg(sysarg, "活动入口已关闭,请您明天再来吧", ttFlyTip)
		return 
	end
	
	if Actor.enterScene(sysarg, cfg.scenes[1], -1, -1) == false then
		return
	end
	
	--进入成功进行广播
	if dVar.MiJingZhiLvlIfCan_broadcastTipmsg==1 then --10秒才能广播一次，以免广播得太频繁
		local name = Actor.getName(sysarg)
		local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
	
		System.broadcastTipmsg(string.format(Lang.ScriptTips.jm00002, name, RwData[1]), ttScreenCenter)
		System.broadcastTipmsg(string.format(Lang.ScriptTips.jm00003, name, RwData[1], NpcName, NpctFly), ttChatWindow)
		dVar.MiJingZhiLvlIfCan_broadcastTipmsg = 0
	end
	
	local svar = Actor.getStaticVar(sysarg)
	if svar.days.MiJingZhiLvHighestLayer ==nil then 
		svar.days.MiJingZhiLvHighestLayer =1
	end
	
	--Actor.setPkMode(sysarg,fpGuild)	--强制改为行会模式
		
	sendJoinActivity(sysarg, cfg.id, leftSecond)
	updateAndsendActivityData_mjzl(sysarg,220)
end

function MSZLIfCan_broadcastTipmsg_onTimer(sysarg)

	local dVar = System.getDyanmicVar()
	dVar.MiJingZhiLvlIfCan_broadcastTipmsg = 1--每隔10秒才能广播一次
	
end

function exit_MiJingZhiLv(sysarg)

	if sysarg ==nil then return end
	Actor.exitActivityScene(sysarg)	
	sendExitActivity(sysarg, StdActivityCfg.MiJingZhiLv.id)	
end

function MiJingZhiLv_OnMonsterByKilled(monster, sysarg, monId, monsterType,sceneid)
	
	
	--local hScene = Actor.getSceneId(monster)
	--local sysvar = System.getStaticVar(sysarg)
	--if monsterType ==4 then --杀死了Boss
	--	
	--	local numberofplies = NumberOfPlies(hScene)
	--	sysvar.ShenWeiYuBoss = numberofplies --记录boss被杀了
	--	System.broadcastTipmsg(string.format("神威狱活动中第%s层首领已被击败", numberofplies),ttChatWindow)
	--	
	--	updateAndsendActivityData_jmzc(sysarg,2)
	--end

	local sceneid = Actor.getSceneId(monster)
	local hScene = Actor.getSceneHandle(monster)
	local monsterCount = Fuben.getLiveMonsterCount(hScene, 0) -- 获得怪物剩余数量 
    
	local playerList = LuaHelp.getSceneActorListById(sceneid)		
	for i, v in ipairs(playerList or {}) do
		updateAndsendActivityData_mjzl(v, sceneid)
	end
end

function updateAndsendActivityData_mjzl(sysarg, sceneid)
	local Var = Actor.getStaticVar(sysarg)
	local sysvar = System.getStaticVar(sysarg)
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, 20) -- 活动类型	
	local nHandle = Fuben.getSceneHandleById(sceneid, 0)
	DataPack.writeByte(netPack, Fuben.getLiveMonsterCount(nHandle)) --怪物数量
	DataPack.writeByte(netPack,sceneid-219)  --第几层
	DataPack.flush(netPack)
end


