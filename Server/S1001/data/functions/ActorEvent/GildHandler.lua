--#include "data\config\item\Gild.lua" once
--#include "data\config\item\EquipRecycle.lua" once
--#include "data\functions\ActorEvent\Utils.lua" once

local ErrorCodeTable = {
	nil, -- 0 成功
	Lang.ScriptTips.zf521, -- 1 还没到激活等级
	Lang.ScriptTips.zf525, -- 2 玩家还没有金身
	Lang.ScriptTips.zf522, -- 3 配置出错
	Lang.ScriptTips.zf554, -- 4 没有配置下一阶金身属性，不能塑造，所以最后那一阶金身应该配置为无用的金身
	nil, -- 5 找不到该物品
	Lang.ScriptTips.zf523, -- 6 参数错误
	nil, -- 7 删除物品出错
	nil, -- 8 消耗条件不满足
	nil, -- 9 扣除消耗出错
	nil, -- 10 类型出错
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

--下发镀金身操作结果
local function SendOptResult(sysarg, optType, optResult)
	-- 51	--镀金身子系统
	local netPack = DataPack.allocPacket(sysarg, 51, optType)
	DataPack.writeByte(netPack, optResult)
	DataPack.flush(netPack)
end

local function GetGildItemById(id)
	for i, v in ipairs(GildCfg.GildItems) do
		if v.id == id then
			return v, i
		end
	end
	
	return nil, nil
end

local function HandleOptResult(sysarg, optType, optResult, p1, p2, p3)
	SendOptResult(sysarg, optType, optResult)
	TooltipMsg(sysarg, optType, optResult, p1, p2, p3)

	-- 概率加 buf
	if optResult == 0 then
		local gildId = Actor.getUIntProperty(sysarg, PROP_ACTOR_GILDID)
		local gildItemCfg, idx = GetGildItemById(gildId)
		if gildItemCfg ~= nil then				
			--RandomAddBuffsToActor(sysarg, gildItemCfg.buff)
		end
	end
end

local function CalcItemGildExp(itemptr, itemCount)
	if not itemptr or itemCount <= 0 then
		return 0
	end
	
	local itemId = Item.getItemId(itemptr)
	if itemId == 0 then return 0 end
	
	local info = EquipRecycle[itemId]
	if info == nil or info.exp == nil then
		return 0
	end
	
	return info.exp * itemCount
end

--进阶金身
local function HandleUpGild(sysarg, args)
	local optType = args[1]
	local itemType = args[2] -- 0物品塑造；1金币塑造；2元宝塑造
	local itemptr
	local itemCount
	if itemType == 0 then
		itemptr = args[3]
		itemCount = args[4]
	end
	
	if Actor.checkActorOnceLevel(sysarg, GildCfg.activeLevel) == false then
		return 1, GildCfg.activeLevel
	end	
		
	local gildId = Actor.getUIntProperty(sysarg, PROP_ACTOR_GILDID)
	if gildId == 0 then	return 2 end	
	
	local gildItemCfg, idx = GetGildItemById(gildId)
	if not gildItemCfg then	return 3 end
	
	local gildExp
	
	local nextGildItemCfg = GildCfg.GildItems[idx + 1]
	if not nextGildItemCfg or nextGildItemCfg.id == nil or nextGildItemCfg.id == 0 then	
		--print(gildId,gildItemCfg.id)
		if gildId >= gildItemCfg.id then --到顶了
			return 4
		end
		return 3
	end
	
	local addExp = 0
	if itemType == 0 then --物品塑造
		if not itemptr then	return 5 end		
		if itemCount == 0 or itemCount < -1 then return 6	end
		
		local count = Item.getItemProperty(sysarg, itemptr, Item.ipItemCount, 0)
		if itemCount == -1 then -- -1 则全部
			itemCount = count
		elseif itemCount > count then
			itemCount = count
		end
		
		local aItemId = Item.getItemProperty(sysarg, itemptr, Item.ipItemID, 0);
		local aItemtb = GildCfg.aItem;
		for i = 1,#aItemtb do
			if aItemId >= aItemtb[i][1] and aItemId <= aItemtb[i][2] then
				addExp = aItemtb[i][3];
				break;
			end
		end
		if addExp == 0 then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf519,256);
			return 8;
		end
		
		addExp = addExp * itemCount
		--addExp = CalcItemGildExp(itemptr, itemCount)
		
		local removeCount = Actor.removeItemByPtr(sysarg, itemptr, itemCount, true, "GildUp", 930)
		if removeCount < itemCount then	return 7 end
		
	elseif itemType == 1 or itemType == 2 then	--金币/元宝塑造
		local consume
		if itemType == 1 then
			consume = { {type=6, count=gildItemCfg.consumeCoin,logs = {972,Lang.LogTips.l00190}} }
			addExp = gildItemCfg.coinAddExp
		else
			consume = { {type=15, count=gildItemCfg.consumeYb,logs = {972,Lang.LogTips.l00190}} }
			addExp = gildItemCfg.ybAddExp
		end
		
		--检查消耗
		local consumeData = {}
		local isok = CheckAllConsume(sysarg, false, consume, true, consumeData)				
		if not isok then return 8	end	
		
		--扣除消耗
		isok = DeductAllConsume(sysarg, false, consume, GameLog.cAddDragonExp)		
		if not isok then return 9	end	
	else
		return 10 --类型出错
	end
	
	--扣除成功处理
	if gildExp == nil then
		gildExp = 0--Actor.getUIntProperty(sysarg, PROP_ACTOR_GILDEXP)
	end
	
	gildExp = gildExp + addExp
	local actorExp = 0
	if itemType == 1 then
		Actor.addExp(sysarg,gildItemCfg.addCoinExp,204,0)
		actorExp = gildItemCfg.addCoinExp
	elseif itemType == 2 then
		Actor.addExp(sysarg,gildItemCfg.addYbExp,204,0)
		actorExp = gildItemCfg.addYbExp
	end
	local msg
	if gildExp < gildItemCfg.maxExp then --加经验
		--Actor.setUIntProperty(sysarg, PROP_ACTOR_GILDEXP, gildExp)
		msg = string.format(Lang.ScriptTips.zf528, addExp,actorExp)
	else --进阶	
		--Actor.setUIntProperty(sysarg, PROP_ACTOR_GILDEXP, 0)
		Actor.setUIntProperty(sysarg, PROP_ACTOR_GILDID, nextGildItemCfg.id)
		Actor.collectOperate(sysarg,0) -- 重新计算角色属性
		
		local name1 = Item.getItemName(gildItemCfg.id)
		local name2 = Item.getItemName(nextGildItemCfg.id)
		msg = string.format(Lang.ScriptTips.zf529, name1, name2)
		if nextGildItemCfg.id-469 >= 3 then
			System.broadcastTipmsg(string.format(Lang.ScriptTips.zf563,Actor.getName(sysarg),nextGildItemCfg.id-469,name2),ttScreenCenter+ ttChatWindow)
		end
		
		local ActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		local ActorName = Actor.getName(sysarg)
		System.sendCommonLog(943,ActorId,ActorName,gildItemCfg.id,nextGildItemCfg.id,0,name1,name2,Lang.ScriptTips.zf578)
	end	
	
	Actor.sendTipmsg(sysarg, msg, ttFlyTip)
	return 0 --成功
end

local function UpGild(sysarg, args)
	local optType = args[1]
	local result, p1, p2, p3 = HandleUpGild(sysarg, args)
	HandleOptResult(sysarg, optType, result, p1, p2, p3)	
	return result == 0
end

EventCallDispatcher.gildHandleActorLevelUp = function (sysarg, args)
	local level = args[1]
	if GildCfg.activeLevel ~= nil and level < GildCfg.activeLevel then
		return --还没到激活等级
	end
	
	local gildId = Actor.getUIntProperty(sysarg, PROP_ACTOR_GILDID)
	if gildId > 0 then return end --已经有了
	
	--送第一个金身
	Actor.setUIntProperty(sysarg, PROP_ACTOR_GILDID, GildCfg.GildItems[1].id)
end

EventCallDispatcher.handleGildOp = function (sysarg, args)
	if not args then return false end
	local optType = args[1]
	
	if optType == 1 then -- OptType_UpGild
		return UpGild(sysarg, args)
	end
	
	return false
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGildOp, EventCallDispatcher.handleGildOp)  
--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeLevel, EventCallDispatcher.gildHandleActorLevelUp)
