
--装备强化
function EquipStrong( sysarg, args)  	--2 装备强化
	print("强化")
	local itemCount = args[1]
	local itemPtr = args[2]
	local paramCount = args[itemCount+3]
	local isProtect = args[itemCount+4] > 0
	local isYbExchange = args[itemCount+5] > 0
	--local nEntityId = 0		--装备所属ID  id=0：玩家 id>0:英雄ID
	
	local itemType = Item.getItemProperty(sysarg, itemPtr, Item.ipItemType, 0)
	--不是装备或者是翅膀则不能强化
	if not IsEquipByItemType(itemType) or itemType == Item.itSwing then		
		return
	end
		
	local nLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemActorLevel, 0) 
	if nLevel < EquipStrongCond.minItLv then
		return
	end
	
--	local actorLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
--	if actorLevel < nLevel then
--		return
--	end

	local itemGuid = Item.getItemGuid(itemPtr)
	local nItemStrong = Item.getItemProperty( sysarg, itemPtr, Item.ipItemStrong, 0)
	
	local strongLimit = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrongLimit, 0)
	local strongMax = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrongMax, 0)
	local oldItemStrong = nItemStrong
	local oldStrongLimit = strongLimit
	local strongCfg = EquipStrongConfig[nItemStrong + 1]
	if not strongCfg then
		SendEquipOptResult(sysarg, itemGuid, itEquipStrong, 2 )
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf024, ttFlyTip)
		return
	end	
	
	if nItemStrong >= strongMax or strongLimit < 0 then
		SendEquipOptResult(sysarg, itemGuid, itEquipStrong, 2 )
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf024, ttFlyTip)
		return
	end
	
	if strongLimit <= 0 then -- 剩余强化次数沒有了
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf501, ttFlyTip)
		SendEquipOptResult(sysarg, itemGuid, itEquipStrong, 2)
		return
	end
	
	local strongRate = strongCfg.rate
	
	-- 检查
	local consumeData = {}
	local ret = CheckAllConsume(sysarg, isYbExchange, strongCfg.strong, true, consumeData)
	
	if ret and isProtect and strongCfg.protect then
		ret = CheckAllConsume(sysarg, isYbExchange, strongCfg.protect, true, consumeData)
		if ret then
			strongRate = RandomBase
		end
	end
	
	if not ret then
		SendEquipOptResult(sysarg, itemGuid, itEquipStrong, 2)
		return
	end	
	
	--扣费
	ret = DeductAllConsume(sysarg, isYbExchange, strongCfg.strong, GameLog.cNewEquipStrongConsume)
	
	if ret and isProtect and strongCfg.protect then
		ret = DeductAllConsume(sysarg, isYbExchange, strongCfg.protect, GameLog.cNewEquipStrongConsume)
	end
	
	if not ret then
		SendEquipOptResult(sysarg, itemGuid, itEquipStrong, 2)
		return
	end
					
	local optResult = 1 --默认失败
	local nCurSharp = Item.getItemProperty( sysarg, itemPtr, Item.ipItemSharp, 0)
	local nSetSharpVal = 0
	if math.random(RandomBase) <= strongRate then
		nItemStrong = nItemStrong + 1
		optResult = 0
	else
		if nItemStrong >= EquipStrongCond.MinStrongSharp then
			nSetSharpVal = nCurSharp + math.random(EquipStrongCond.RandSharp[1], EquipStrongCond.RandSharp[2])
			local nMaxSharpVal = EquipStrongCond.MaxSharp[nItemStrong - EquipStrongCond.MinStrongSharp + 1] or 250		--这里写一个很大的值，防配置有错会刷
			if nSetSharpVal >= nMaxSharpVal then
				nItemStrong = nItemStrong + 1
				optResult = 0
				nSetSharpVal = 0
			end
		end
		
		-- 强化失败不降级
		--[[
		if optResult ~= 0 then			
			local nMin = strongCfg.failDownIdx[1]
			local nMax = strongCfg.failDownIdx[2]
			if nMax > nItemStrong then
				nMax = nItemStrong
			end
			if nMin > nMax then
				nItemStrong = math.random(nMax, nMin)
			else
				nItemStrong = math.random(nMin, nMax)
			end			
		end
		--]]
	end
	
	-- 成功或失败物品的当前强化等级上限都要 -1
	strongLimit = strongLimit - 1
	
	--if nCurSharp > 0 or nSetSharpVal > 0 then
	--	Item.setItemProperty( sysarg, itemPtr, Item.ipItemSharp, nSetSharpVal)
	--end	
	if optResult == 0 and nItemStrong >= EquipStrongCond.UpToBuildAttr then
		local initSmith = Item.getItemProperty( sysarg, itemPtr, Item.ipItemSpecSmith, 0)
		if initSmith == 0 then
			Item.initEquipBaseAttr(sysarg, itemPtr, bawEquipStrong)
			local newInitSmith = Item.getItemProperty( sysarg, itemPtr, Item.ipItemSpecSmith, 0)
			if newInitSmith > 0 then   --如果产生了极品，就公告
				local itemId = Item.getItemId(itemPtr)
				local noticeStr = string.format(Lang.ScriptTips.q00098, Actor.getName(sysarg), Item.getItemLinkMsg(itemId,itemPtr))
				System.broadcastTipmsg(noticeStr, ttScreenCenter+ ttChatWindow)
			end
		end
	end
	
	if oldItemStrong ~= nItemStrong then
		Item.setItemProperty( sysarg, itemPtr, Item.ipItemStrong, nItemStrong)
	end
	if oldStrongLimit ~= strongLimit then
		Item.setItemProperty( sysarg, itemPtr, Item.ipItemStrongLimit, strongLimit)
	end
	SendEquipOptResult(sysarg, itemGuid, itEquipStrong, optResult )
	--强化到了一定等级公告
	if optResult == 0 and nItemStrong >= EquipStrongConfig.notice then
		local itemId = Item.getItemId(itemPtr)
		local itemName = Item.getItemName(itemId)
		local itemCircle = Item.getItemProperty(sysarg,itemPtr,Item.ipItemCircleFor)
		local strName
		if itemCircle > 0 then
			strName = tostring(itemCircle .. Lang.ScriptTips.other001 .. itemName)
		else
			strName = nil
		end
		local noticeStr = string.format(Lang.ScriptTips.c000088,Actor.getName(sysarg),Item.getItemLinkMsg(itemId,itemPtr,strName),nItemStrong)

		System.broadcastTipmsg(noticeStr, ttScreenCenter+ ttChatWindow)
	end

	local actorFlag = Actor.getActorFlag(sysarg,17)
	if actorFlag == 0 and nItemStrong >= 3 then
		local itemGuid = Item.getItemGuid(itemPtr)
		local item = Item.getEquipPtrByGuid(sysarg,itemGuid)
		local itemCount = Actor.getItemCount(sysarg,650)
		if itemCount > 0 and item then
			local netPack = DataPack.allocPacket(sysarg, 26, 65)
			DataPack.writeByte(netPack, 3)
			DataPack.writeInt(netPack, 650)
			DataPack.flush(netPack)
			Actor.setActorFlag(sysarg,17)
		end
	end
	
	--强化+5有支线任务需刷新
	if nItemStrong == 5 then
		Quest_ShuaXin(sysarg)
	end

	return true
end



--读取强化数据
function EquipStrongConsume( sysarg, args )
	local ptrCount = args[1]
	local itemPtr = args[2]
	if not itemPtr then
		return
	end
	local opType = args[ptrCount+2]		--操作类型
	local nLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemActorLevel, 0) 
	if nLevel < EquipStrongCond.minItLv then
		return
	end
	local nItemStrong = Item.getItemProperty( sysarg, itemPtr, Item.ipItemStrong, 0)
	local strongCfg = EquipStrongConfig[nItemStrong+1]
	if not strongCfg then
		return
	end

	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	DataPack.writeByte(netPack, #strongCfg.strong + #strongCfg.protect)
	
	for k, curTab in ipairs(strongCfg.strong) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack,curTab.id or 0)
		DataPack.writeInt(netPack,curTab.count)
		DataPack.writeByte(netPack, curTab.type == 6 and Any_Silver or Any_Stuff)
	end

	for k, curTab in ipairs(strongCfg.protect) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack,curTab.id or 0)
		DataPack.writeInt(netPack,curTab.count)
		DataPack.writeByte(netPack, Any_Protect)

	end
	
	DataPack.writeInt(netPack, strongCfg.rate)
	
	--local ResetStrong = 
	DataPack.flush(netPack)
end