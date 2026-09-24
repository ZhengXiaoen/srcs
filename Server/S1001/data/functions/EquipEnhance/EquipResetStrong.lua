
--重置装备强化属性
function EquipResetStrong(sysarg, args)  	--17 装备重置
	local itemPtr = args[2]
	--local nEntityId = 0		--装备所属ID  id=0：玩家 id>0:英雄ID
	
	local nLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemActorLevel, 0) 
	if nLevel < EquipStrongCond.minItLv then
		return
	end	
	
	local itemType = Item.getItemProperty(sysarg, itemPtr, Item.ipItemType, 0)
	--不是装备或者是翅膀则不能强化
	if not IsEquipByItemType(itemType) or itemType == Item.itSwing then		
		return
	end		
	
	local strongMax = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrongMax, 0)		
	if strongMax <= 0 then return end
	
	--local strongLimit = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrongLimit, 0)	
	--if strongLimit >= strongMax then
	--	return
	--end
	
	local itemGuid = Item.getItemGuid(itemPtr)
	
	--获取强化等级和重置所需货币
	local itemStrong = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrong, 0)
	if itemStrong <= 0 then return end

	--if itemStrong >= 12 then
	--	SendEquipOptResult(sysarg, itemGuid, itEquipResetStrong, 2)
	--	return
	--end
	
	local addBindCoinCfg = EquipResetStrongConfig.addBindCoins[itemStrong + 1]
	
	if not addBindCoinCfg then
		return
	end
			
	local errorCode = Actor.resetEquipItemAttr(sysarg, itemPtr)
	if errorCode ~= 0 then
		SendEquipOptResult(sysarg, itemGuid, itEquipResetStrong, 2)
		return
	end
	
	local addmoney = math.random(addBindCoinCfg.min_count, addBindCoinCfg.max_count)
	Actor.changeMoney(sysarg, mtBindCoin, addmoney, GameLog.cResetStrongReturnMoney, "")
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf510, addmoney), ttFlyTip)
	
	SendEquipOptResult(sysarg, itemGuid, itEquipResetStrong, 0)
	return true	
end

--读取装备强化重置数据
function EquipResetStrongConsume(sysarg, args)
	local ptrCount = args[1]
	local itemPtr = args[2]
	if not itemPtr then
		return
	end
	local opType = args[ptrCount+2]		--操作类型
	
	--当前强化重置所需数据
	local itemStrong = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrong, 0)
	local addBindCoinCfg = EquipResetStrongConfig.addBindCoins[itemStrong + 1]
	
	if not addBindCoinCfg then
		return
	end
	
	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	DataPack.writeByte(netPack, 0) --循环个数为 0
	-- 针对该类型的特殊数据
	DataPack.writeInt(netPack, addBindCoinCfg.min_count)
	DataPack.writeInt(netPack, addBindCoinCfg.max_count)

	DataPack.flush(netPack)
end

