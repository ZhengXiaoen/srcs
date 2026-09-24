--#include "data\config\SavvySysCfg.lua" once
--#include "data\functions\ActorEvent\Utils.lua" once

local ErrorCodeTable = {
	nil, -- Lang.ScriptTips.zf530, -- 0 成功
	Lang.ScriptTips.zf523, -- 1 参数错误
	Lang.ScriptTips.zf521, -- 2 还没到激活等级
	nil, -- 3 角色数据出错
	Lang.ScriptTips.zf522, -- 4 界表配置出错
	Lang.ScriptTips.zf520, -- 5 下一级配置出错
	nil, -- 6 消耗条件不满足
	nil, -- 7 扣除消耗出错
	Lang.ScriptTips.zf211, -- 8 修炼需要等级不足或转数不足
}

local function TooltipMsg(sysarg, optType, optResult, p1, p2, p3)
	local msg = ErrorCodeTable[optResult + 1]
	if msg == nil then return end
	if p1 ~= nil then
		if p2 ~= nil then
			if p3 ~= nil then
				msg = string.format(msg, p1, p2, p3)
			else
				msg = string.format(msg, p1, p2)
			end
		else
			msg = string.format(msg, p1)
		end
	end
	Actor.sendTipmsg(sysarg, msg, ttFlyTip)
end

--下发通灵操作结果
local function SendOptResult(sysarg, optType, optResult)
	-- 53	--通灵子系统
	local netPack = DataPack.allocPacket(sysarg, 53, optType)
	DataPack.writeByte(netPack, optResult)
	DataPack.flush(netPack)
end

local function HandleOptResult(sysarg, args, optType, optResult, p1, p2, p3, cfg)
	SendOptResult(sysarg, optType, optResult)
	TooltipMsg(sysarg, optType, optResult, p1, p2, p3)
	
	-- 概率加 buf
--	if optResult == 0 then
--		RandomAddBuffsToActor(sysarg, cfg.buff)
--	end
end

--修炼, 改为16阶，每阶12级，按顺序升级
local function HandleSavvyPractice(sysarg, args)	
	local actorLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if actorLevel < SavvySysCfg.activeLevel then
		return 2, SavvySysCfg.activeLevel
	end
	
	local soul1 = Actor.getUIntProperty(sysarg, PROP_ACTOR_SOUL1)
	local nextSoul1 = soul1 + 1
	
	local soul = math.floor((nextSoul1 - 1) / 12)
	local level = nextSoul1 - soul * 12
	
	if soul > 15 or level > 12 then
		return 5
	end
	
	local soulTable = SavvySysCfg.soulLayers[soul + 1]
	if soulTable == nil then return 4 end		
	
	local nextLevelCfg = soulTable[level]
	if nextLevelCfg == nil or nextLevelCfg.consumeEnergy == nil then	
		return 5
	end

	if Actor.checkActorLevel(sysarg,nextLevelCfg.level,nextLevelCfg.circle) == false then
		return 8,nextLevelCfg.circle,nextLevelCfg.level
	end
	
	local consume = { {type=36, count=nextLevelCfg.consumeEnergy,logs = {1042,Lang.LogTips.l00195}} }
				
	--检查消耗
	local consumeData = {}
	local isok = CheckAllConsume(sysarg, false, consume, true, consumeData)				
	if not isok then return 6 end	
	
	--扣除消耗
	isok = DeductAllConsume(sysarg, false, consume, GameLog.cNewSavvyConsume)		
	if not isok then return 7 end	
		
	--扣除成功处理
	Actor.setUIntProperty(sysarg, PROP_ACTOR_SOUL1, nextSoul1)
	Actor.collectOperate(sysarg,0) -- 重新计算角色属性
	Actor.triggerAchieveEvent(sysarg, 103, nextSoul1)

	local savvyName = "savvy00" .. (soul+1)

	local ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	local ActorName = Actor.getName(sysarg)
	System.sendCommonLog(GameLog.cAllOpenSavvy,ActorId,ActorName,soul+1,level,nextSoul1,"","",Lang.ScriptTips[savvyName])
		
	if level == 1 then
		if soul == 0 then
			Actor.sendTipmsg(sysarg,string.format("恭喜您进阶至<(c0xFF00ff00)%s>",Lang.ScriptTips[savvyName]), ttFlyTip)
		else
			local prevName = "savvy00" .. soul
			Actor.sendTipmsg(sysarg,string.format("恭喜您将<(c0xFF00ff00)%s>进阶至<(c0xFF00ff00)%s>",Lang.ScriptTips[prevName], Lang.ScriptTips[savvyName]), ttFlyTip)
		end
	else
		Actor.sendTipmsg(sysarg,string.format("恭喜您将<(c0xFF00ff00)%s>升级至%d级",Lang.ScriptTips[savvyName],level), ttFlyTip)
	end

	--if level == 1 then
	--	local msg = string.format(Lang.ScriptTips.zf567,ActorName,Lang.ScriptTips[savvyName])
	--	System.broadcastTipmsg(msg,ttScreenCenter+ ttChatWindow)		
	--end
	
	return 0, level, nil, nil, nextLevelCfg --成功
end

local function SavvyPractice(sysarg, args)
	local optType = args[1]
	local result, p1, p2, p3, cfg = HandleSavvyPractice(sysarg, args)
	HandleOptResult(sysarg, args, optType, result, p1, p2, p3, cfg)	
	return result == 0
end

--兑换圣魂值
local function ExChangeEnery(sysarg, nIsProtection)

	local dataConfig = SavvySysCfg.ExChangeEneryCfg.DataConfig
	if not dataConfig then return end

	local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if level < dataConfig[1].level then
		return 
	end
	
	local dataCfgCount = #dataConfig
	local allInterval = dataConfig[dataCfgCount].level - dataConfig[1].level
	local curInterval = dataConfig[dataCfgCount].level - level
	local interval = allInterval - curInterval
	local config = dataConfig[interval+1]
	if not config or config.level ~= level then return end

	local var = Actor.getStaticVar(sysarg)
	local exChangeEneryTimes = var.days.ExChangeEneryTimes
	if exChangeEneryTimes == nil then exChangeEneryTimes = 0 end
	
	if exChangeEneryTimes >= SavvySysCfg.ExChangeEneryCfg.everyDayTims then		
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf183, ttFlyTip)
		return
	end
	if nIsProtection == 1 then
		local consumeData = {}
		local isok = CheckOneConsume(sysarg, false, config.Ybconsume, true, consumeData)				
		if not isok then
			return
		end
		--扣除消耗
		isok = DeductOneConsume(sysarg, false, config.Ybconsume, GameLog.cNewExChangeEneryConsume)		
		if not isok then
			return
		end
	else
		-- 去掉概率
		--if math.random(config.Probability) >= config.Probability then
		--	
		--	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf181,SavvySysCfg.ExChangeEneryCfg.everyDayTims - exChangeEneryTimes),ttFlyTip)
		--	return
		--end
	end
	
	Actor.setLevel(sysarg,level-1)
	exChangeEneryTimes = exChangeEneryTimes + 1
	var.days.ExChangeEneryTimes = exChangeEneryTimes
	local Energy = Actor.getUIntProperty(sysarg, PROP_ACTOR_ENERGY)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_ENERGY, Energy+config.giveEnery)
	local leftTimes = SavvySysCfg.ExChangeEneryCfg.everyDayTims - exChangeEneryTimes
	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf182,config.giveEnery,leftTimes),ttFlyTip)
	
	local actorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	local nName = Actor.getName(sysarg)
	System.sendCommonLog(GameLog.cExChangeEneryConsume,actorId,nName,Energy,(Energy+config.giveEnery),0,"","","ExChangeEnery")
	
	-- 下发兑换次数
	SendOptResult(sysarg, 3, exChangeEneryTimes)
end

function handleGetSavvyData(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local exChangeEneryTimes = var.days.ExChangeEneryTimes
	if exChangeEneryTimes == nil then exChangeEneryTimes = 0 end
	
	-- 下发兑换次数
	SendOptResult(sysarg, 3, exChangeEneryTimes)
end

EventCallDispatcher.handleSavvyOp = function (sysarg, args)
	Actor.sendTipmsg(sysarg, "BOSS兽魂功能暂时未开放", ttFlyTip)
	return false
	
--[[
	if not args then return false end
	local optType = args[1]
	if optType == 1 then -- OptType_Practice
		return SavvyPractice(sysarg, args)
	elseif optType == 2 then -- OptType_BuyEnergy
		local nIsProtection = args[2]
		ExChangeEnery(sysarg, nIsProtection)
	elseif optType == 3 then -- OptType_GetData
		handleGetSavvyData(sysarg)
	end
	
	return false
--]]
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeSavvyOp, EventCallDispatcher.handleSavvyOp)  

