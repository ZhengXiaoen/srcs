--#include "data\config\equipSynthesis\EquipBestAttributeCfg.lua" once

function EquipForgingSuperAttr(sysarg,args)
	
	local itemCount = args[1]
	local itemPtr = args[2]
	local opType = args[itemCount+2]
	local paramCount = args[itemCount+3]
	local isProtect = args[itemCount+4] > 0
	
	if not itemPtr then return false end

	local nItemId = Item.getItemId(itemPtr)
	local itemGuid = Item.getItemGuid(itemPtr)
	
 	local nIsForging = Item.getItemPropertyById(nItemId, Item.ipItemSuperAttr)
	if nIsForging <= 0 then return false end
	
	local nLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemSuperAttrLevel, 0)
	local config = BestAttribute[nLevel+1]
	if not config then return false end
	
	local nEquipLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemActorLevel, 0)
	local nEquipCircle = Item.getItemProperty(sysarg, itemPtr, Item.ipItemNeedCircle, 0)
	if nEquipCircle < config.needEquipCircle then
		SendEquipOptResult(sysarg, itemGuid, opType, 1)
		return false
	elseif nEquipLevel < config.needEquipLevel then
		SendEquipOptResult(sysarg, itemGuid, opType, 1)
		return false
	end
	
	local hammer = Actor.getUIntProperty(sysarg, PROP_ACTOR_HAMMER)	
	
	local bResult =false
	if hammer < config.consume[2].count then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf370,ttFlyTip)
		return false
	else
		if isProtect then
			local consumeData = {}
			bResult = CheckAllConsume(sysarg, false, config.luckyConsume, true, consumeData)
			if not ret then
				SendEquipOptResult(sysarg, itemGuid, opType, 1)
				return false
			end
		end
	end
	
	local nCurRate = config.rate
	if isProtect then
		bResult = DeductAllConsume(sysarg, false, config.luckyConsume, GameLog.cNewEquipSuperAttr)
		if not bResult then return false end
		nCurRate = nCurRate + config.LuckyUpRate
	end

	local nMoneyType = {[5] = 0}
	if Actor.changeMoney(sysarg,nMoneyType[config.consume[1].type],-config.consume[1].count,GameLog.cNewEquipSuperAttrConsume,"极品属性消耗金钱",true) then
		hammer = hammer - config.consume[2].count
		Actor.setUIntProperty(sysarg, PROP_ACTOR_HAMMER, hammer)
	else
		return false
	end
	
	local nRandomNum = System.getRandomNumber(10000)
	
	if nRandomNum > nCurRate then
		SendEquipOptResult(sysarg, itemGuid, opType, 1)
		return false
	end

	Item.setItemProperty(sysarg, itemPtr, Item.ipItemSuperAttrLevel, nLevel+1)
	
	SendEquipOptResult(sysarg, itemGuid, opType, 0)
	if nLevel+1 == 1 then
		refreshTaskAttr(sysarg)
	end
	
end

FristSuperAttrAward = {{type = 2, id = 0, count = 10000000}}--首次极品属性升到1

--第一次极品属性加到1 完成支线任务 赠送1000万经验
function refreshTaskAttr(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.firstUpSuperAttr == nil or var.firstUpSuperAttr == 0 then
		var.firstUpSuperAttr = 1
		Awards.Give(sysarg,FristSuperAttrAward,2300,"领取极品属性1")
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf674,2048)
		System.broadcastTipmsg(string.format(Lang.ScriptTips.zf675,Actor.getName(sysarg)),2)
		Quest_ShuaXin(sysarg)
	end
end

function EquipForgingSuperAttrConsume(sysarg,args)
	
	local ptrCount = args[1]
	local srcItemPtr = args[2]
		
	if not srcItemPtr then
		return
	end
	local opType = args[ptrCount+2]		--操作类型
	
	local nItemId = Item.getItemId(srcItemPtr)
 	local nIsForging = Item.getItemPropertyById(nItemId, Item.ipItemSuperAttr)
	if nIsForging <= 0 then return false end
	
	local nLevel = Item.getItemProperty(sysarg, srcItemPtr, Item.ipItemSuperAttrLevel, 0)
	local nConfig = BestAttribute[nLevel+1]
	if not nConfig then return false end
	
	local consumeCfg = nConfig.consume
	
	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	DataPack.writeByte(netPack, #consumeCfg)
	
	for _,consume in ipairs(consumeCfg or {}) do
		DataPack.writeByte(netPack,consume.type)
		DataPack.writeInt(netPack,consume.id or 0)
		DataPack.writeInt(netPack,consume.count)
		DataPack.writeByte(netPack, consume.usetype or 0)		
	end

	DataPack.flush(netPack)
	
	return true
end