--#include "data\config\item\MagicEquip.lua" once
--#include "data\functions\ActorEvent\Utils.lua" once

local ErrorCodeTable = {
	nil, -- 0 成功
	Lang.ScriptTips.zf521, -- 1 还没到激活等级
	Lang.ScriptTips.zf524, -- 2 玩家没有魔法装备，不能进阶
	Lang.ScriptTips.zf522, -- 3 配置出错，没有找到这件装备
	Lang.ScriptTips.zf520, -- 4 不能再进阶了
	nil, -- 5 消耗条件不满足
	nil, -- 6 扣除消耗出错
	Lang.ScriptTips.zf559, -- 7转生后等级不足
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

--下发魔法装备操作结果
local function SendOptResult(sysarg, optType, optResult)
	-- 50	--魔法装备子系统
	local netPack = DataPack.allocPacket(sysarg, 50, optType)
	DataPack.writeByte(netPack, optResult)
	DataPack.flush(netPack)
end

local function GetCurAndNextMagicEquip(id)
	for i1, v1 in ipairs(MagicEquipCfg.MagicEquips) do
		for i2, v2 in ipairs(v1) do
			if v2.id == id then
				return i2, v2, v1[i2+1]
			end
		end
	end
	
	return nil, nil, nil
end

local function HandleOptResult(sysarg, optType, optResult, p1, p2, p3)
	SendOptResult(sysarg, optType, optResult)
	TooltipMsg(sysarg, optType, optResult, p1, p2, p3)
	
	-- 概率加 buf
--	if optResult == 0 then
--		local magicEquipId = Actor.getUIntProperty(sysarg, PROP_ACTOR_MAGIC_EQUIPID)
--		local equipLevel, equipCfg, nextEquipCfg = GetCurAndNextMagicEquip(magicEquipId)
--		if equipCfg ~= nil then
--			RandomAddBuffsToActor(sysarg, equipCfg.buff)
--		end
--	end
end

local function HandleUpMagicEquip(sysarg, args)
	local optType = args[1]
	
	--local circle = Actor.getUIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	--local actorLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	--if actorLevel < MagicEquipCfg.activeLevel and circle > 0 then
	if Actor.checkActorOnceLevel(sysarg, MagicEquipCfg.activeLevel) == false then
		return 1, MagicEquipCfg.activeLevel
	end	
	
	local magicEquipId = Actor.getUIntProperty(sysarg, PROP_ACTOR_MAGIC_EQUIPID)
	if magicEquipId == 0 then
		return 2
	end
	
	
	
	local equipLevel, equipCfg, nextEquipCfg = GetCurAndNextMagicEquip(magicEquipId)
	if not equipCfg then
		print("config error, UpMagicEquip() MagicEquip[" .. magicEquipId .. "]不存在!")
		return 3
	end
	
	if not nextEquipCfg or not nextEquipCfg.id then		
		return 4
	end

	--检查消耗
	local consumeData = {}
	local logs = {974,Lang.LogTips.l00190}
	table.insert(equipCfg.consume[1],logs)
	local isok = CheckAllConsume(sysarg, false, equipCfg.consume, true, consumeData)				
	if not isok then return 5 end	

	--扣除消耗
	isok = DeductAllConsume(sysarg, false, equipCfg.consume, GameLog.cNewUpMagicEquipUpConsume)		
	if not isok then return 6 end	
	
	--扣除消耗成功处理
	local equipExp = Actor.getUIntProperty(sysarg, PROP_ACTOR_MAGIC_EQUIPEXP)
	equipExp = equipExp + equipCfg.addExp

	Actor.addExp(sysarg,equipCfg.addActorExp,204)
	
	local msg
	if equipExp < equipCfg.maxExp then --加经验
		local nlevel = equipCfg.id-459
		if nlevel >= 7 and nlevel < 10 then
			local nCurLevel = 0
			if nlevel == 8 then 
				nCurLevel = 10
			elseif nlevel == 9 then
				nCurLevel = 20
			end
			
			local nCurOneExp = equipCfg.maxExp/10
			nCurLevel = math.floor(equipExp/nCurOneExp) + nCurLevel
			
			local var = Actor.getStaticVar(sysarg)
			if not var.MagicFlag then
				var.MagicFlag = 0
			end
			
			local nLevelFlag = Actor.getAnyActorFlag(sysarg,var.MagicFlag,nCurLevel)
			if nLevelFlag == 0 and nLevelFlag ~= -1 then
				local nBitMove = Actor.setAnyActorFlag(sysarg,var.MagicFlag,nCurLevel)
				var.MagicFlag = nBitMove
				Actor.collectOperate(sysarg,0) -- 重新计算角色属性
				UpMagicEquipLevelGiveTips(sysarg)
			end
		end
		Actor.setUIntProperty(sysarg, PROP_ACTOR_MAGIC_EQUIPEXP, equipExp)
		msg = string.format(Lang.ScriptTips.zf526, equipCfg.addExp,equipCfg.addActorExp)
	else --进阶	
		Actor.setUIntProperty(sysarg, PROP_ACTOR_MAGIC_EQUIPEXP, 0)
		Actor.setUIntProperty(sysarg, PROP_ACTOR_MAGIC_EQUIPID, nextEquipCfg.id)
		Actor.collectOperate(sysarg,0) -- 重新计算角色属性
		UpMagicEquipLevelGiveTips(sysarg)
		local name1 = Item.getItemName(magicEquipId)
		local name2 = Item.getItemName(nextEquipCfg.id)
		msg = string.format(Lang.ScriptTips.zf527, name1, name2)
		
		local broadmsg = string.format(Lang.ScriptTips.zf565,Actor.getName(sysarg),nextEquipCfg.id-459,name2)
		System.broadcastTipmsg(broadmsg,ttScreenCenter+ ttChatWindow)
		
		local ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		local ActorName = Actor.getName(sysarg)
		System.sendCommonLog(942,ActorId,ActorName,equipCfg.id,nextEquipCfg.id,0,name1,name2,Lang.ScriptTips.zf577)
	end
	
	Actor.sendTipmsg(sysarg, msg, ttFlyTip)
	return 0 --成功
end

--进阶魔法装备
local function UpMagicEquip(sysarg, args)
	local optType = args[1]
	local result, p1, p2, p3 = HandleUpMagicEquip(sysarg, args)
	HandleOptResult(sysarg, optType, result, p1, p2, p3)	
	return result == 0
end

local function BuyMagicEquip(sysarg)
	
	local config = MagicEquipCfg.BuyMagicEquipCfg
	--print(config.id)
	--检查消耗
	local consumeData = {}
	local isok = CheckAllConsume(sysarg, false, config.consume, true, consumeData)				
	if not isok then return end	
	
	--扣除消耗
	isok = DeductAllConsume(sysarg, false, config.consume, GameLog.cNewBuyMagicEquipConsume)		
	if not isok then return end	
	
	--购买成功，直接穿上
	Actor.setUIntProperty(sysarg, PROP_ACTOR_MAGIC_EQUIPID, config.id)
	Actor.collectOperate(sysarg,0) -- 重新计算角色属性
	--Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf555, ttFlyTip)
	local name1 = Item.getItemName(config.id)
	local broadmsg = string.format(Lang.ScriptTips.zf566,Actor.getName(sysarg),config.id-459,name1)
	System.broadcastTipmsg(broadmsg,ttScreenCenter+ ttChatWindow)
end

EventCallDispatcher.handleMagicEquipOp = function (sysarg, args)
	if not args then return false end
	local opType = args[1]
	
	if opType == 1 then -- OpType_UpMagicEquip
		return UpMagicEquip(sysarg, args)
	end
	
	return false
end

EventCallDispatcher.handleBuyMagicEquip = function(sysarg, args)
	if not args then return false end
	local opType = args[1]
	
	if opType == 2 then
		BuyMagicEquip(sysarg)
	end
end

EventCallDispatcher.HandleActorLevelUp = function(sysarg,args)
	
	local magicId = Actor.getUIntProperty(sysarg, PROP_ACTOR_MAGIC_EQUIPID)	
	if magicId > 0 then	return end --有法宝了
	local level = args[1]
	if level < 71 then
		return --还没到激活等级
	end
	local config = MagicEquipCfg.MagicEquips
	Actor.setUIntProperty(sysarg, PROP_ACTOR_MAGIC_EQUIPID, config[1][1].id)
	Actor.collectOperate(sysarg,0) -- 重新计算角色属性
	
	local npack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sSendRecommendTips)  --申请一个数据包
	if npack == nil then
		print("allocPacket is nil!")
		return
	end
	DataPack.writeString(npack,Lang.ScriptTips.zf587)
	DataPack.flush(npack)
	--System.broadcastTipmsg(string.format("恭喜玩家<(n%s)>升到了71级,获得了系统赠送的法宝！",Actor.getName(sysarg)),2);

end

--玩家登陆
EventCallDispatcher.HandleActorLogin = function(sysarg,args)
	--等级判断
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if pLv < 71 then return end
	
	--是否已经有法宝判断
	local magicId = Actor.getUIntProperty(sysarg, PROP_ACTOR_MAGIC_EQUIPID)	
	if magicId > 0 then	return end
	
	local config = MagicEquipCfg.MagicEquips
	Actor.setUIntProperty(sysarg, PROP_ACTOR_MAGIC_EQUIPID, config[1][1].id)
	Actor.collectOperate(sysarg,0) -- 重新计算角色属性
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeMagicEquipOp, EventCallDispatcher.handleMagicEquipOp)  
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeBuyMagicEquip, EventCallDispatcher.handleBuyMagicEquip) 
--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeLevel, EventCallDispatcher.HandleActorLevelUp)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogin, EventCallDispatcher.HandleActorLogin)