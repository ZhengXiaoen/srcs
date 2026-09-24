--lua script
-- 人物死亡执行脚本

--#include "data\config\pk\CampMapPkConfig.lua" once --配置

--[[
    函数名称：EventCallDispatcher.OnBeKilledByActorGetExp
    函数描述：PK经验获取
    参数 beKiller 的描述：  被杀玩家对象指针 
    参数 killer 的描述：杀死该玩家的对象的指针
    参数 ... 的描述：
]]
EventCallDispatcher.OnBeKilledByActorGetExp = function (beKiller, killer)
	
	if (not EventCallDispatcher.IsKillerActor(beKiller, killer[1])) then return end
	if (not killer) or (not beKiller) then return end
	local config = CampMapPkExp
	if not config then return end
	local killerPtr = killer[1]  --杀死该玩家的对象的指针
--[[	local sid = Actor.getSceneId(killerPtr)
	--地图判断
	if CheckPkMap(config.mapId,sid) ~= true then return end
	--等级判断
	local beKillLevel = Actor.getIntProperty(beKiller, PROP_CREATURE_LEVEL)
	if beKillLevel < config.levelLimit then return end
	local killLevel = Actor.getIntProperty(killerPtr, PROP_CREATURE_LEVEL)
	if killLevel < config.levelStart then return end
	
	local baseExp = config.levelBase[beKillLevel-config.levelLimit+1]
	if not baseExp then return end
	local limitExp = config.limitExp[killLevel-config.levelStart+1]
	if not limitExp then return end

	local relation = CheckCampRelation(killerPtr, beKiller)
	local relateExp = 0
	if relation == CampRelation.Enemy then
		relateExp = config.otherParam.enemyZY
	elseif relation == CampRelation.Union then
		relateExp = config.otherParam.neutralZY
	else
		relateExp = config.otherParam.sameZY
	end
	
	local levelGap = killLevel - beKillLevel
	local GapExp = CheckExpGap(config.levelGap,levelGap)

	local addExp = math.floor(baseExp*relateExp*GapExp)
	--等级限制
	if addExp > limitExp then 
		addExp = limitExp 
	end
	if addExp > 0 then
		Actor.giveAward(killerPtr, 2,0, addExp, 0, 0, 1, 0, 502, Lang.LogTips.l00067)
		if addExp >= config.noticeLimitExp then
			local sName = Actor.getSceneName(killerPtr, 0, 0) 
			local killName = Actor.getName(killerPtr)
			local beKillName = Actor.getName(beKiller)
			local killCampName = Camp.getCampName(Actor.getCamp(killerPtr))
			local beKillCampName = Camp.getCampName(Actor.getCamp(beKiller))
			local tips = string.format(Lang.ScriptTips.x00192,killCampName,killName,sName,beKillCampName,beKillName,addExp)
			--#ifdef _COMMON_SERVER_	--公共逻辑服配置
				tips = string.format(Lang.ScriptTips.x00197,killName,sName,beKillName,addExp)
			--#endif
			System.broadcastTipmsg(tips, ttScreenCenter)
		end
	end--]]
	
	OneHundredKillActor(killerPtr,beKiller)
	
end

--百服活动PK
function OneHundredKillActor(sysarg,player)
	
	-- 获得白服活动状态（0:关闭，1:开启，2:结束且显示图标）
	if System.getHundredServerStatus() ~= 1 then
		return
	end
	
	if not OneHundredActivityCfg then return end
	local config = OneHundredActivityCfg.MissionStepGift[3]
	
	local var = Actor.getStaticVar(sysarg)
	
	if not var.MissionStep then
		return
	elseif var.MissionStep ~= 2 then 
		return
	end
	
	if not var.HundreaKillActorNum then
		var.HundreaKillActorNum = 0
	end
	
	--现在不判断等级	
	--local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	--local nCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
	--if not Actor.checkActorLevel(player,nLevel,nCircle) then
	--	return
	--end
	
	var.HundreaKillActorNum = var.HundreaKillActorNum + 1
	if var.HundreaKillActorNum >= config.finishCount then
		var.MissionStep = 3
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf356,var.MissionStep),ttDialog)
	end
end

--检测是否在PK场景
function CheckPkMap(tbMap,sid)
	for i=1, table.getn(tbMap) do
		local map = tbMap[i]
		if map == sid then
			return true
		end
	end
	return false
end

--获取两个角色阵营关系
function CheckCampRelation(user1, user2)
	local camp1 = Actor.getCamp(user1)
	local camp2 = Actor.getCamp(user2)
	local allyCamp = Camp.getAllyCamp(camp1)
	if camp1 == camp2 then
		return CampRelation.Same
	elseif allyCamp == camp2 then
		return CampRelation.Union
	else
		return CampRelation.Enemy
	end

end

--检测是否在PK场景
function CheckExpGap(config,levelGap)
	for i=1, table.getn(config) do
		local gap = config[i]
		if levelGap >= gap.start and levelGap <= gap.theEnd then
			return gap.value
		end
	end
	return 0
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeOnActorBeKilled, EventCallDispatcher.OnBeKilledByActorGetExp)