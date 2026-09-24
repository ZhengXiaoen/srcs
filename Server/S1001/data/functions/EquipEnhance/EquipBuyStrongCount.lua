
--购买强化次数
function EquipBuyStrongCount(sysarg, args)  	--19 购买强化次数
	local itemPtr = args[2]
	if (itemPtr == nil) then return end
		
	local nLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemActorLevel, 0) 
	if nLevel < EquipBuyStrongCountConfig.levelLimit then
		return
	end	
	
	local itemType = Item.getItemProperty(sysarg, itemPtr, Item.ipItemType, 0)
	--不是装备或者是翅膀则不能强化
	if not IsEquipByItemType(itemType) or itemType == Item.itSwing then		
		return
	end		
	
	local strongMax = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrongMax, 0)		
	if strongMax <= 0 then return end
	
	local strongLimit = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrongLimit, 0)
	local strongLevel = Item.getItemProperty( sysarg, itemPtr, Item.ipItemStrong, 0)	
	if strongLimit >= strongMax or strongLevel >= strongMax or (strongLimit + strongLevel) >= strongMax then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf585, ttFlyTip)
		return
	end	
	
	local cfg = EquipBuyStrongCountConfig.consume[strongLevel + 1]
	if (cfg == nil) then
		--print("config error, EquipBuyStrongCountConfig.consume[" .. (strongLevel + 1) .. "] == nil")
		return
	end
	
	local itemGuid = Item.getItemGuid(itemPtr)
	
	-- 检查
	local consumeData = {}
	local ret = CheckOneConsume(sysarg, false, cfg, true, consumeData)
	if not ret then
		SendEquipOptResult(sysarg, itemGuid, itEquipBuyStrongCount, 1)
		return
	end
	
	--扣费
	ret = DeductOneConsume(sysarg, false, cfg, GameLog.cNewBuyStrongCountConsume)
	if not ret then
		SendEquipOptResult(sysarg, itemGuid, itEquipBuyStrongCount, 2)
		return
	end
		
	Item.setItemProperty(sysarg, itemPtr, Item.ipItemStrongLimit, strongLimit + 1)		
	SendEquipOptResult(sysarg, itemGuid, itEquipBuyStrongCount, 1)
	return true	
end

--读取装备购买强化次数数据
function EquipBuyStrongCountConsume(sysarg, args)
	local ptrCount = args[1]
	local itemPtr = args[2]
	if not itemPtr then
		return
	end
	local opType = args[ptrCount+2]		--操作类型
			
	local strongMax = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrongMax, 0)		
	if strongMax <= 0 then return end
		
	local strongLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrong, 0)		
	local cfg = EquipBuyStrongCountConfig.consume[strongLevel + 1]	
	if (cfg == nil) then return end
	
	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
--[[
	DataPack.writeByte(netPack, #EquipBuyStrongCountConfig.consume)
	for k, curTab in ipairs(EquipBuyStrongCountConfig.consume) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack,curTab.id or 0)
		DataPack.writeInt(netPack,curTab.count)
		DataPack.writeByte(netPack, curTab.usetype or 0)
	end
--]]
	DataPack.writeByte(netPack, 1)
	DataPack.writeByte(netPack,cfg.type)
	DataPack.writeInt(netPack,cfg.id or 0)
	DataPack.writeInt(netPack,cfg.count)
	DataPack.writeByte(netPack, cfg.usetype or 0)

	DataPack.flush(netPack)
end