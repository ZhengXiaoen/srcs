-- 阵营战活动
--#include "data\config\activity\StdActivityCfg.lua" once

-- 开始阵营战活动
function StartActivity_camp_battle()
	print("阵营战活动 开始")	
	--[[	
	local dVar = System.getDyanmicVar()
	dVar.campBattleTime = System.getCurrMiniTime()
	dVar.campBattleA = 0
	dVar.campBattleB = 0
	
	System.addTimer("camp_battle_on_timer", 8000, -1)	
	Ranking.clear_ranking(1, true)
	--]]
end

-- 结束阵营战活动
function EndActivity_camp_battle()
	print("阵营战活动 结束")	
	--[[
	System.deleteTimer("camp_battle_on_timer")
	local dVar = System.getDyanmicVar()		
	dVar.campBattleTime = nil
	
	local cfg = StdActivityCfg.ZhenYingZhan	
	local playerList = LuaHelp.getSceneActorListById(cfg.sceneId)		
	for i, v in ipairs(playerList or {}) do
		exit_camp_battle(v)
	end	
	
	Ranking.save_ranking(1, true)
	--]]
end

function camp_battle_on_timer(leftTimes)
	local dVar = System.getDyanmicVar()
	if dVar.campBattleTime == nil then return end
	
	local cfg = StdActivityCfg.ZhenYingZhan		
	local playerList = LuaHelp.getSceneActorListById(cfg.sceneId)
	if playerList == nil then return end

	for i, v in ipairs(playerList) do
		camp_battle_give_reward(v, cfg.pdAward)
	end
end

-- 计算经验奖励
function camp_battle_calc_exp_award(sysarg, award_list)
	local exp = 0
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	
	for i, v in ipairs(award_list) do
		if level >= v.minlv and (level <= v.maxlv or v.maxlv == -1) then
			exp = v.exp
			break
		end
	end
	
	return exp
end

-- 每8秒发一次奖励
function camp_battle_give_reward(sysarg, award_list)		
	-- 是否还活着
	if Actor.isDeath(sysarg) then return end
	
	local addexp = camp_battle_calc_exp_award(sysarg, award_list)
	
	local var = Actor.getStaticVar(sysarg)
	local campBattleExp = var.days.campBattleExp
	if campBattleExp == nil then
		campBattleExp = addexp
	else
		campBattleExp = campBattleExp + addexp
	end
	var.days.campBattleExp = campBattleExp	
	
	Actor.addExp(sysarg, addexp, LogIds.campBattleAddExp, 0)	
end

function can_enter_camp_battle(sysarg, isTip)
	local dVar = System.getDyanmicVar()
	if dVar.campBattleTime == nil then -- 活动还没开始
		if isTip then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		end
		return false
	end
	
	local cfg = StdActivityCfg.ZhenYingZhan	
	
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
	
	if curSceneId == cfg.sceneId then
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

	if checkActivityTime(cfg.tOpenTime.times) == 0 then
		if isTip then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		end
		return false
	end
	
	return true
end

-- 进入阵营战
function enter_camp_battle(sysarg)
--[[
	if not can_enter_camp_battle(sysarg, true) then
		return
	end
	
	local cfg = StdActivityCfg.ZhenYingZhan
	
	local times = cfg.tOpenTime.times
	local timeIdx = checkActivityTime(times)
	if timeIdx == 0 then	
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		return
	end
	
	local endHour = times[timeIdx][3]
	local endMin = times[timeIdx][4]
	local endSec = 0
	if endHour == 0 and endMin == 0 then
		endHour = 23
		endMin = 59
		endSec = 59
	end
	
	local leftSecond = System.ResidualTime(endHour, endMin, endSec)
	if leftSecond == 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		return
	end	
	
	local zyId = 1
	local dVar = System.getDyanmicVar()
	local campACount = dVar.campBattleA
	local campBCount = dVar.campBattleB
	if campACount == nil then campACount = 0 end
	if campBCount == nil then campBCount = 0 end
	
	if campACount > campBCount then
		zyId = 2
	elseif campACount == campBCount then
		if math.random(1000) >= 500 then
			zyId = 2
		end
	end
	
	local x,y = -1,-1
	if zyId == 1 then
		x = math.random(zyzCfg.ACampPos[1],zyzCfg.ACampPos[2])
		y = math.random(zyzCfg.ACampPos[3],zyzCfg.ACampPos[4])
		campACount = campACount + 1
		dVar.campBattleA = campACount
	else
		x = math.random(zyzCfg.BCampPos[1],zyzCfg.BCampPos[2])
		y = math.random(zyzCfg.BCampPos[3],zyzCfg.BCampPos[4])
		campBCount = campBCount + 1
		dVar.campBattleB = campBCount
	end
					
	if Actor.enterScene(sysarg, cfg.sceneId, x, y) == false then
		return
	end
	
	Actor.setCampId(sysarg, zyId)
	local svar = Actor.getStaticVar(sysarg)
	svar.days.campBattlePoint = 0 -- 积分
	
	sendJoinActivity(sysarg, cfg.id, leftSecond)
	--]]
end

-- 退出阵营战
function exit_camp_battle(sysarg)
	Actor.setCampId(sysarg, 0)
	Actor.exitActivityScene(sysarg)	
	sendExitActivity(sysarg, 11)
end

--领取奖励
function get_camp_battle_award(sysarg)
	local var = Actor.getStaticVar(sysarg)	
	if svar.days.campBattlePoint == nil or svar.days.campBattlePoint == 0 then 
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.wl00007, ttFlyTip)
		return
	end
	
	var.days.campBattlePoint = nil -- 奖励已领
end

function camp_battle_OnPlayerDie(sysarg, killer, killerType)
	if killer == nil or killerType ~= 0 then return end	
	
end

function camp_battle_OnMonsterByKilled(monster, sysarg, monId, monsterType)	
	
end