-- 武林争霸活动
--#include "data\config\activity\StdActivityCfg.lua" once

-- 场景配置以下属性:
-- aaWar = 3,			// 战斗区域, 不修改PK值
-- asNoDropEquip = 80,	// 所在场景不爆装备
-- aaNotCallHero = 85,	// 禁止召唤英雄与道士宝宝(进入区域会自动收起英雄)


function delete_old_wulin_master()
	-- 收回上一次的武林争霸称号
	local svar = System.getStaticVar()
	-- 新的武林盟主
	local newWLKingId = svar.newWLKingId
	if newWLKingId == nil then return end

	local wlKing = System.getEntityPtrByActorID(newWLKingId)
	if wlKing ~= nil then -- 在线
		Actor.setTopTitle(wlKing,Title.WuLinMaster,false)
		Actor.setSocialMask(wlKing,smIsWulinMaster,false)
	end

	svar.wulin.wulinMaster =""
	svar.newWLKingId = nil
	
	--清除上次留下来的人
	local cfg = StdActivityCfg.WuLinZhengBa
	local actId = cfg.id	
	local playerList = LuaHelp.getSceneActorListById(cfg.sceenId)	
	if playerList~=nil then 
		for i, v in ipairs(playerList or {}) do
			exit_wlzb(v, actId)
			--Actor.sendTipmsg(v, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
		end	
	end
	
end

-- 武林争霸活动开始前10分钟
function on_activity_wlzb_before10()

	if System.isCrossServer() ==true then
		return 
	end
	
	print("武林争霸活动开始前10分钟")	
	
	local cfg = StdActivityCfg.WuLinZhengBa	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启,请大家踊跃参加.%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启,请大家踊跃参加.%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
	
	
	delete_old_wulin_master()
end

-- 开始武林争霸活动
function StartActivity_wlzb()

	if System.isCrossServer() ==true then
		return 
	end
	
	print("武林争霸活动 开始")	
	
	delete_old_wulin_master()
	
	local dVar = System.getDyanmicVar()
	dVar.wlzbTime = System.getCurrMiniTime()
	
	dVar.wlzbCanPk = 0
	-- 每 3 秒加3000点经验(不分等级)
	System.addTimer("wlzb_on_timer", 3000, -1)
end

function end_wlzb_activity()

	if System.isCrossServer() ==true then
		return 
	end
	
	print("1 武林争霸活动 结束")	
	
	System.deleteTimer("wlzb_on_timer")
	local dVar = System.getDyanmicVar()		
	dVar.wlzbTime = nil
	
	--local cfg = StdActivityCfg.WuLinZhengBa
	--local actId = cfg.id	
	--local playerList = LuaHelp.getSceneActorListById(cfg.sceenId)	
	--if playerList~=nil then 
	--	for i, v in ipairs(playerList or {}) do
	--		exit_wlzb(v, actId)
	--		Actor.sendTipmsg(v, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
	--	end	
	--end
end

-- 结束武林争霸活动
function EndActivity_wlzb()
	local dVar = System.getDyanmicVar()
	if dVar.wlzbTime == nil then -- 武林争霸活动已经提前结束了
		System.deleteTimer("wlzb_on_timer")
		return
	end	
	
	print("2 武林争霸活动 结束")	
	
	System.deleteTimer("wlzb_on_timer")
	local dVar = System.getDyanmicVar()		
	dVar.wlzbTime = nil
	dVar.isGive = nil
	--local cfg = StdActivityCfg.WuLinZhengBa
	--local actId = cfg.id	
	--local aliveCount = 0
	--local firstAlivePlayer = nil
	--	
	--local playerList = LuaHelp.getSceneActorListById(cfg.sceenId)		
	--for i, v in ipairs(playerList or {}) do
	--	-- 是否还活着
	--	if Actor.isDeath(v) == false then
	--		aliveCount = aliveCount + 1
	--		if aliveCount == 1 then
	--			firstAlivePlayer = v
	--		end
	--	end
	--
	--	exit_wlzb(v, actId)
	--end
	--
	--if aliveCount == 1 and firstAlivePlayer ~= nil then
	--	-- 武林争霸决出胜负, 活动提前结束
	--	local winVar = Actor.getStaticVar(firstAlivePlayer)
	--	winVar.days.wlzbAward = 1 -- 1 为胜利者, 2 为参与者	
	--	get_wlzb_award(firstAlivePlayer)
	--end

end

function wlzb_on_timer(leftTimes)
	local dVar = System.getDyanmicVar()
	if dVar.wlzbTime == nil then return end
	
	local cfg = StdActivityCfg.WuLinZhengBa	
	
	local playerList = LuaHelp.getSceneAliveActorListById(cfg.sceenId)
	if playerList == nil then return end
	
	--local playCount = #playerList
    --
	--if playCount == 1 then
	--	local curTime = System.getCurrMiniTime()
	--	if (curTime - dVar.wlzbTime) > cfg.enterTimeLimit then
	--		-- 武林争霸决出胜负, 活动提前结束
	--		local actorPtr = playerList[1] -- 获得胜利的玩家
	--		if actorPtr ~= nil then
	--			local winVar = Actor.getStaticVar(actorPtr)
	--			winVar.days.wlzbAward = 1 -- 1 为胜利者, 2 为参与者
	--			get_wlzb_award(actorPtr)
	--		end
	--		
	--		end_wlzb_activity()
	--		return
	--	end
	--end
	
	for i, v in ipairs(playerList) do
		wlzb_give_reward(v, cfg.pdAward)
	end
	
	local curTime = System.getCurrMiniTime()
	if (curTime - dVar.wlzbTime) > cfg.protectedTime then
		dVar.wlzbCanPk = 1
	end
	
end

function can_enter_wlzb(sysarg, isTip)		
	local dVar = System.getDyanmicVar()
	local wlzbTime = dVar.wlzbTime
	if wlzbTime == nil then -- 活动还没开始
		if isTip then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		end
		return false
	end
	
	local curTime = System.getCurrMiniTime()
	if curTime < wlzbTime then
		if isTip then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		end
		return false
	end
	
	local cfg = StdActivityCfg.WuLinZhengBa
	-- 5 分钟后不能进入
	if (curTime - wlzbTime) >= cfg.enterTimeLimit then
		if isTip then
			Actor.sendTipmsg(sysarg, "活动入口已关闭,请您明天再来吧!", ttFlyTip)
		end
		return false
	end
	
	if Actor.checkActorLevel(sysarg, cfg.level, 0) ~= true then
		if isTip then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.wl00005, cfg.level), ttFlyTip)
		end
		return
	end
	
	local nSceneId = Actor.getSceneId(sysarg)
	if nSceneId == cfg.sceenId then
		if isTip then
			Actor.sendTipmsg(sysarg, "您已经在活动中了!", ttFlyTip)
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

-- 进入活动场景
function enter_wlzb(sysarg)
	if not can_enter_wlzb(sysarg, true) then
		return
	end
	
	local svar = Actor.getStaticVar(sysarg)
	if svar.days.wlzbAward ~= nil and svar.days.wlzbAward == 3 then -- 已经领过了
		return
	end
	
	local cfg = StdActivityCfg.WuLinZhengBa
	
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
	local leftSecond = cfg.tOpenTime.lefttime-(System.getCurrMiniTime() - dVar.wlzbTime)
	
	if Actor.enterScene(sysarg, cfg.sceenId, -1, -1) == false then
		return
	end
	
	
	svar.days.wlzbAward = 2 -- 1 为胜利者, 2 为参与者
	
	local RwData = cfg.RwData;
	local name = Actor.getName(sysarg)
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);

	System.broadcastTipmsg(string.format(Lang.ScriptTips.wl00001, name, RwData[1]), ttScreenCenter)
	System.broadcastTipmsg(string.format(Lang.ScriptTips.wl00002, name, RwData[1], NpcName, NpctFly), ttChatWindow)

	--OnFinish_Liveness(sysarg,4)
	sendJoinActivity(sysarg, cfg.id, leftSecond)
	
	--Actor.setPkMode(sysarg,4)	--强制改为全体模式
end

function exit_wlzb(sysarg, activityid)
	Actor.exitActivityScene(sysarg)
	
	if activityid == nil then
		activityid = StdActivityCfg.WuLinZhengBa.id
	end
	
	sendExitActivity(sysarg, activityid)
end

-- 计算经验奖励
--[[
function wlzb_calc_exp_award(sysarg, award_list)
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
--]]

-- 每3秒发一次奖励
function wlzb_give_reward(sysarg, pdAward)		
	-- 是否还活着
	if Actor.isDeath(sysarg) then return end
	
	-- 改为不分等级,固定加3000经验
	local addexp = pdAward.exp --wlzb_calc_exp_award(sysarg, pdAward)
	Actor.addExp(sysarg, addexp, LogIds.wlzbAddExp, 0)	
end

-- 领取奖励
function get_wlzb_award(sysarg)

	--检查领取奖励的时间
	local dVar = System.getDyanmicVar()
	local wlzbTime = dVar.wlzbTime
	local curTime = System.getCurrMiniTime()
	local cfg = StdActivityCfg.WuLinZhengBa
	if wlzbTime~= nil and (curTime - wlzbTime) < cfg.enterTimeLimit then
		Actor.sendTipmsg(sysarg, "入口没有关闭，还不能领取奖励", ttFlyTip)
		return 
	end
	if wlzbTime == nil then 
        Actor.sendTipmsg(sysarg,"活动已结束",ttFlyTip)
        return
    end 
    if dVar.isGive ~= nil then
        System.trace("get_wlzb_award actorid:"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID) )
        return
    end
	--检查人数
	local actId = cfg.id	
	local aliveCount = 0
	local firstAlivePlayer = nil
		
	local playerList = LuaHelp.getSceneActorListById(cfg.sceenId)		
	for i, v in ipairs(playerList or {}) do
		-- 是否还活着
		if Actor.isDeath(v) == false then
			aliveCount = aliveCount + 1
			if aliveCount == 1 then
				firstAlivePlayer = v
			end
		end
	end
    local var = Actor.getStaticVar(sysarg)
	if var.days.wlzbAward ~= nil and var.days.wlzbAward  == 3 then
        Actor.sendTipmsg(sysarg, Lang.ScriptTips.wl00007, ttFlyTip)
        return
    end
	if aliveCount == 1 and firstAlivePlayer ~= nil then
		-- 武林争霸决出胜负
		local winVar = Actor.getStaticVar(firstAlivePlayer)
		winVar.days.wlzbAward = 1 -- 1 为胜利者, 2 为参与者	
	else
		Actor.sendTipmsg(sysarg, "直至活动场景剩下一人方为王者，还是决了胜负再来领取奖励吧", ttFlyTip)
		return
	end
	
	
	
	local cfg = StdActivityCfg.WuLinZhengBa
	
	local nAwardType = var.days.wlzbAward -- 1 为胜利者, 2 为参与者
	if not nAwardType then 
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.wl00007, ttFlyTip)
		return
	end
    
	local tAwards = cfg.awardsMaster[1]
	local str = ""
	local RwData = cfg.RwData
	
	if nAwardType == 1 then -- 1 为胜利者, 2 为参与者
		-- 盟主奖
		--local tItems = {tAwards[1]}
		--if Awards.Give(sysarg, tItems, LogIds.getWuLinZhenBaAward, Lang.LogTips.wl001) ~= true then
		--	return
		--end
		Actor.changeMoney(sysarg,3,tAwards.count,2583,"武林争霸奖励元宝")
		--delete_old_wulin_master()
		local sysvar = System.getStaticVar()
		sysvar.newWLKingId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		--全局变量
		if sysvar.wulin == nil then  
			sysvar.wulin = {} 
			sysvar.wulin.wulinMoney = 0
		end
		sysvar.wulin.wulinMaster = Actor.getName(sysarg)
        sysvar.wulin.wulinId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		Actor.setTopTitle(sysarg, Title.WuLinMaster, true)
		Actor.setSocialMask(sysarg, smIsWulinMaster, true)
		
        if cfg.masterAwardsYb > 0 then
            Actor.changeMoney(sysarg, mtYuanbao, cfg.masterAwardsYb, LogIds.getWuLinZhenBaAward, Lang.LogTips.wl001)
        end
		
		--local strItem = string.format("<(c0xFFde00ff)武林争霸称号 x 1><(c0xFFde00ff)、><(c0xFFde00ff)%s x %d>", cfg.masterAwardsYb, Item.getItemName(tAwards[1].id), tAwards[1].count)
		--str = string.format(Lang.ScriptTips.wl00003, Actor.getName(sysarg), RwData[1], strItem)
		str = string.format("经过一番龙争虎斗,最终夺得武林盟主宝座的玩家便是<%s>,将获得<(c0xFFde00ff)武林争霸称号>,<(c0xFFde00ff)元宝 x %d>奖励", Actor.getName(sysarg), tAwards.count)
		
		var.days.wlzbAward = 3 -- 奖励已领
		--Actor.sendTipmsg(sysarg, str, ttScreenCenter + ttChatWindow)
		
		
		--清场
		local cfg = StdActivityCfg.WuLinZhengBa
		local actId = cfg.id	
		local playerList = LuaHelp.getSceneActorListById(cfg.sceenId)	
		if playerList~=nil then 
			for i, v in ipairs(playerList or {}) do
				exit_wlzb(v, actId)
				--Actor.sendTipmsg(v, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
			end	
		end

        dVar.isGive = 1
	else
		-- 参与奖
		--没有参与奖了
		--[[
		local tItems = {tAwards[2]}
		if Awards.Give(sysarg, tItems, LogIds.getWuLinZhenBaAward, Lang.LogTips.wl001) ~= true then
			return
		end
		
		local strItem = string.format("<(c0xFFde00ff)%s x %d>", Item.getItemName(tAwards[2].id), tAwards[2].count)
		str = string.format(Lang.ScriptTips.wl00004, Actor.getName(sysarg), RwData[1], strItem)
		--]]
		
		Actor.sendTipmsg(sysarg, "没有奖励,再接再厉啊", ttScreenCenter + ttChatWindow)
		var.days.wlzbAward = 3 -- 奖励已领
	end
	
end