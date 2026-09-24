--#include "data\functions\Systems\CircleSystem\Circle_main.lua" once
--#include "data\config\ActorEvent\ExChangeCircle.lua" once

--下发转身操作结果
local function SendOptResult(sysarg, msgid, optResult)
	local netPack = DataPack.allocPacket(sysarg, 139, msgid)
	DataPack.writeByte(netPack, optResult)
	DataPack.flush(netPack)
end

--转身处理
MiscsImplement.CircleHandle = function( sysarg, msgid, packet )

	local isProtect = DataPack.readByte(packet)
	isProtect = isProtect >= 1
	
	local var = Actor.getStaticVar(sysarg)

	--if not var.days.EveryDayCircleNum then
		--var.days.EveryDayCircleNum = 2
	--elseif var.days.EveryDayCircleNum <= 0 then
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.c0000143, ttFlyTip)
	--	return
--	end
	
	local level = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	local optResult = CircleHandleImpl(sysarg, level + 1, isProtect)
	SendOptResult(sysarg, msgid, optResult)
	
	local npack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sCircleSuccess)  --申请一个数据包
	DataPack.writeByte(npack,optResult)
	DataPack.flush(npack);
	if optResult == 0 then -- 成功
		level = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
		for _,levelAward in ipairs(LevelGrowthReward) do
			if levelAward.type == 1 and levelAward.Require == level then
				local npack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sLevelGrowAward)  --申请一个数据包
				DataPack.writeByte(npack,0)
				DataPack.writeByte(npack,0)
				DataPack.flush(npack);
				break
			end
		end
		
		UpLevelGiveTips(sysarg)
		local msg = string.format(Lang.ScriptTips.c000009, level)
		Actor.sendTipmsg(sysarg, msg, ttFlyTip)
			
		local name=Actor.getName(sysarg)
		local tip= string.format("恭喜<(n%s)>玩家<%d转>成功.<我要转生/@@showWin,1>",name,level)
		System.broadcastTipmsg(tip,ttChatWindow)
		Quest_ShuaXin(sysarg)
		
		--var.days.EveryDayCircleNum = var.days.EveryDayCircleNum - 1
		return
	end
end

--下发兑换转生次数结果
local function SendExChangeResult(sysarg,msgid,Extype,ExNum)
	
	local ExChangeConfig = ExChangeCircle[Extype]
	
	--重构消耗
	local name = ""
	local logid = 968
	if Extype == 1 then
		name = Lang.LogTips.l00186
		logid = 968
	elseif Extype == 2 then
		name = Lang.LogTips.l00188
		logid = 970
	elseif Extype == 3 then
		name = Lang.LogTips.l00187
		logid = 969
	end
	
	local consumes = {}
	for k, v in ipairs(ExChangeConfig.consume) do
		local consume = {type = v.type, count = v.count*ExNum*ExChangeConfig.discount,logs = {logid,name}}
		table.insert(consumes, consume)
	end
	
	--检查消耗
	local consumesdata = {}
	local result = CheckAllConsume(sysarg, false, consumes, true, consumesdata)
	if not result then return end
	
	--扣除消耗
	local ret = DeductAllConsume(sysarg, false, consumes, GameLog.cExchangeCircleConsume)
	if not ret then return end

	--给玩家增加转生次数
	local var = Actor.getStaticVar(sysarg)
	local leftCircle = var.days.leftCircle
	if leftCircle == nil then
		leftCircle = 3 + ExNum -- 今天剩余的转数(默认是3次)
	else
		leftCircle = leftCircle + ExNum
	end
	var.days.leftCircle = leftCircle	
	
	SendOptResult(sysarg,msgid,0)
	
	return true
end

function CheckCircleSoulExchange(sysarg,config)
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if level < config.reqLevel then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.c000007, config.reqLevel), ttFlyTip)
		return false, 0
	end
	
	local var = Actor.getStaticVar(sysarg)	
	local leftCircle = var.days.leftCircle
	if leftCircle ~= nil and leftCircle <= 0 then
		-- 当天的转数已经用完
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000190, ttFlyTip)
		return false, 0
	end

	local reqGold = 0
	for k, v in ipairs(config.consumes) do
		if v.type == 6 then
			reqGold = v.count
		end
	end

	local consumeData = {}
	local result = CheckAllConsume(sysarg,false, config.Gold,true,consumeData)	
	if result == true then
		return true, 1, reqGold	
	end
	
	--[[consumeData = {}
	result = CheckAllConsume(sysarg,false, config.consumes,true,consumeData)
	if result == true then
		return true, 1,reqGold
	end	--]]
	return false,0
end

function SendActorLeftCircle(sysarg, leftCircle)
	if leftCircle == nil then
		local var = Actor.getStaticVar(sysarg)
		leftCircle = var.days.leftCircle
		if leftCircle == nil then
			leftCircle = 3 -- 默认是3次
		end
	end
	
	-- 下发今天剩余转生次数(已经改为今天兑换修为剩余次数)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendLeftCircle)
	DataPack.writeByte(netPack, leftCircle)	
	DataPack.flush(netPack)
end

function ClientGetActorLeftCircle(sysarg,msgid,packet)
	SendActorLeftCircle(sysarg, nil)
end

function HandleExchangeCircleSoul(sysarg,protectedType)
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	local config = Circle.CircleSoulExchange[actorLevel - 79]
	if not config then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000194, ttFlyTip)
		System.trace("Can not find CircleSoulExchange config,actorLevel="..actorLevel)
		return 1
	end

	local bCheck,nReqGold = CheckCircleSoulExchange(sysarg,config)
	if bCheck ~= true then return 2 end 
	local  bResult = 0
	
	-- 转身次数减少1次
	if protectedType ~= nil and protectedType == 1 and Circle.Protect ~= nil then
		local consumeData = {}
		bResult = CheckAllConsume(sysarg,false,Circle.Protect,true,consumeData)
		if bResult ~= true then
			SendRecommendTips(sysarg,"1")
			return 
		end
		bResult = DeductAllConsume(sysarg, false, Circle.Protect, GameLog.cExchangeCircleConsume)
	elseif config.rate ~= nil and System.getRandomNumber(100) > config.rate then
		bResult = DeductAllConsume(sysarg,false,config.Gold, GameLog.cExchangeCircleConsume)	
		if bResult ~= true then return 3 end
		
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000195, ttFlyTip)
		
		local var = Actor.getStaticVar(sysarg)
		local leftCircle = var.days.leftCircle
		if leftCircle == nil then -- 今天剩余的转数(默认是3次)
			leftCircle = 2			
		else
			leftCircle = leftCircle - 1
		end
		var.days.leftCircle = leftCircle
		
		-- 下发今天剩余转生次数(已经改为今天兑换修为剩余次数)
		SendActorLeftCircle(sysarg, leftCircle)
		
		return 4
	end

	bResult = DeductAllConsume(sysarg,false,config.Gold, GameLog.cNewExchangeCircleConsume)	
	if bResult ~= true then return 3 end

	local var = Actor.getStaticVar(sysarg)
	local leftCircle = var.days.leftCircle
	if leftCircle == nil then -- 今天剩余的转数(默认是3次)
		leftCircle = 2			
	else
		leftCircle = leftCircle - 1
	end
	var.days.leftCircle = leftCircle
		
	local currentSoul = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE_SOUL)
	Actor.setIntProperty(sysarg,PROP_ACTOR_CIRCLE_SOUL,currentSoul + config.addSoul)
    local nOldLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	Actor.setLevel(sysarg,config.chgLevel)
    --print("兑换修为:"..config.chgLevel)
    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    System.sendCommonLog(LogIds.ExchangeCircleSoul,nActorId,Actor.getName(sysarg),0,currentSoul,currentSoul + config.addSoul,"兑换修为")
	System.sendCommonLog(500,nActorId,Actor.getName(sysarg),0,nOldLevel,config.chgLevel,"兑换修为")
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.c000196, config.addSoul, currentSoul + config.addSoul), ttFlyTip)
	
	-- 下发今天剩余转生次数(已经改为今天兑换修为剩余次数)
	SendActorLeftCircle(sysarg, leftCircle)
	
	return 0
end

MiscsImplement.ExchangeCircleSoulHandle = function(sysarg,msgid,packet)
	local protectedType = DataPack.readByte(packet) --protectedType = 0 没勾选100%成功 1勾选

	HandleExchangeCircleSoul(sysarg,protectedType)
end

--兑换转身次数处理
MiscsImplement.ExchangeCircleTimesHandle = function( sysarg, msgid, packet )
	
	ExChangeType = DataPack.readByte(packet) 	--获取类型   1： 金币兑换   2：元宝兑换  3：绑金兑换
	ExChangeNum = DataPack.readByte(packet)		--兑现转生的次数
	if ExChangeType <= 0 and ExChangeNum <= 0 and msgid <= 0 then return end
	
	SendExChangeResult(sysarg,msgid,ExChangeType,ExChangeNum)

end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cCircle, MiscsImplement.CircleHandle)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cExchangeCircleTimes, MiscsImplement.ExchangeCircleSoulHandle)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetLeftCircle, ClientGetActorLeftCircle)