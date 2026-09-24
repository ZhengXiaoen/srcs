

--装备升级
function EquipUpGrade(sysarg, args)
	local itemPtr = args[2]
	--local upProtect = args[4]
	local useGold = args[5]
	if not itemPtr then
		return false
	end
	local itemGuid = Item.getItemGuid(itemPtr)
	local equipPtr, itemPos, heroId = Item.getEquipItemPtr(sysarg, itemGuid, 0, 0, 0)
	if equipPtr ~= itemPtr or itemPos == 0 then return end
	
	local nLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemActorLevel, 0) 
	local nItemId = Item.getItemProperty( sysarg, itemPtr, Item.ipItemID, 0 )
	local nItemType = Item.getItemProperty( sysarg, itemPtr, Item.ipItemType, 0)
	local nItemStrong = Item.getItemProperty( sysarg, itemPtr, Item.ipItemStrong, 0)
	local nQuality = Item.getItemProperty( sysarg, itemPtr, Item.ipItemQuality, 0 )
	local nLuck = Item.getItemProperty( sysarg, itemPtr, Item.ipItemLuck, 0 )
	local nInsure = Item.getItemProperty( sysarg, itemPtr, Item.ipItemHole3Item, 0 )	--投保次数
	local itemName = Item.getItemName(nItemId)
	if EquipUpgradeConf.minItLv > nLevel then
		if nItemType == BaseTypes.itemTypes.itMeterial then
		else
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf014, EquipUpgradeConf.minItLv), ttFlyTip)
			return --最小等级30
		end
	end
	local GradeCfg = GetGradeConfig(nItemType, nLevel, nItemId)
	if not GradeCfg then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf015, ttFlyTip)
		return 
	end
	local newItemId = GetNewItemIdBySrcId(GradeCfg, nItemId)
	if not newItemId then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf016, ttFlyTip)
		return
	end
	if EquipUpgradeConf.notGradeTypes[nItemType] then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf017, ttFlyTip)
		return false --该类型不能升级
	end
	if GradeCfg.strongLv and nItemStrong < GradeCfg.strongLv then
		return false
	end
	local needAllYuanbao = 0
	local otherCount, otherGold = GetQualityCount(nQuality)
	if otherCount > 0 then
		local haveItemCount = Actor.getItemCount(sysarg, EquipUpgradeConf.qualityItem.id)
		if haveItemCount < otherCount then
			if useGold <= 0  then
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf056, ttFlyTip)
				return
			end
			needAllYuanbao = otherGold * (otherCount - haveItemCount)
		end
	end
	local stuffItemCount = 0	
	local propTab = {}
	for idx, tab in ipairs(GradeCfg.stuff) do
		if tab.usetype == Any_Silver then			
			local myCoin = Actor.getIntProperty( sysarg, PROP_ACTOR_COIN )
			if myCoin < tab.count then
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf018, tab.count), ttFlyTip)
				return
			end
		elseif tab.usetype == Any_Stuff then
			stuffItemCount = tab.count
			local itemType = Item.getItemProperty( sysarg, itemPtr, Item.ipItemType, 0 )
			local classRate = GradeCfg.class[itemType]
			if classRate then
				stuffItemCount = tab.count * classRate /100 
			end
			local qualityRate = GradeCfg.quality[nQuality + 1] or 100
			stuffItemCount = math.floor(stuffItemCount * qualityRate / 100)
			local nTempQuality = 0
			local id = tab.id
			if tab.id == -1 then
				id = nItemId
				nTempQuality = nQuality
			end			
			local itemCount = Actor.getItemCount(sysarg, id, nTempQuality, -1,-1,-1, itemPtr)
			if itemCount < stuffItemCount then
				if useGold <= 0  then
					Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf020,Item.getItemName(id)), ttFlyTip)
					return
				end
				if not tab.yb or tab.yb == 0 then
					local itemStr = string.format(Lang.ScriptTips.zf038, Item.getItemName(id))
					Actor.sendTipmsg(sysarg, itemStr, ttFlyTip)
					return
				end
				local needGoldCount = tab.yb * (stuffItemCount - itemCount)
				needAllYuanbao = needAllYuanbao + needGoldCount
				--[[if myGold < needGoldCount then
					Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf019, needGoldCount), ttFlyTip)
					return
				end
				myGold = myGold - needGoldCount]]
			end
		--[[elseif tab.usetype == Any_Protect then
			if upProtect <= 0 then
				nItemStrong = nItemStrong -EquipUpgradeConf.failDownLv
			else
				local itemCount = Actor.getItemCount(sysarg, tab.id)
				if itemCount < tab.count then
					if useGold <= 0 then
						Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf021, Item.getItemName(tab.id)), ttFlyTip)
						return
					end
					if not tab.yb or tab.yb == 0 then
						Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf038, ttFlyTip)
						return
					end
					local needGoldCount = tab.yb * (tab.count - itemCount)
					needAllYuanbao = needAllYuanbao + needGoldCount
				end
				local authTimes = Item.getItemProperty( sysarg, itemPtr, Item.ipItemForgeTimes, 0 )
				propTab[Item.ipItemForgeTimes] = authTimes;
				for authIdx, authVar in ipairs(AuthValTab) do
					local tempVal = Item.getItemProperty( sysarg, itemPtr, authVar, 0)
					propTab[authVar] = tempVal
				end				
			end
			Actor.saveItemSepcAttr(sysarg, itemPtr)]]
		end
	end

	--判断钱够不够	
	local myGold = Actor.getIntProperty( sysarg, PROP_ACTOR_YUANBAO)
	if myGold < needAllYuanbao then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf019, needAllYuanbao), ttFlyTip)
		return
	end
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	local needGrid = Item.getAddItemNeedGridCount(sysarg, newItemId, 1)
	if bagIdxs < needGrid then
		local noticeStr = string.format(Lang.ScriptTips.zf060, needGrid)
		Actor.sendTipmsg(sysarg, noticeStr, ttFlyTip)
		return
	end
	
	if otherCount > 0 then
		local remCount = Actor.removeItem(sysarg, EquipUpgradeConf.qualityItem.id, otherCount,-1,-1,-1,Lang.LogTips.l00070,92)
		if remCount < otherCount then
			if useGold <= 0  then
				return
			end
			local needGoldCount = otherGold * (otherCount - remCount)
			if not Actor.changeMoney(sysarg, mtYuanbao, -needGoldCount, GameLog.clEquipUpgradeLostItem, Lang.LogTips.l00070) then
				return
			end
		end
	end
	
	--属性保留
	local authTimes = Item.getItemProperty( sysarg, itemPtr, Item.ipItemForgeTimes, 0 )
	propTab[Item.ipItemForgeTimes] = authTimes
	for authIdx, authVar in ipairs(AuthValTab) do
		local tempVal = Item.getItemProperty( sysarg, itemPtr, authVar, 0)
		propTab[authVar] = tempVal
	end
	local initSmith = Item.getItemProperty( sysarg, itemPtr, Item.ipItemSpecSmith, 0)

	--删除旧物品
	local isItemInBag = true
	if Actor.removeItemByPtr(sysarg, itemPtr, 1, true, Lang.LogTips.l00107, 92) == 0 then
		if Item.removeEquip(sysarg, itemPtr, Lang.LogTips.l00107, 92, true) == 0 then
			return
		end
		isItemInBag = false
	end
	
	--扣钱和物品
	for idx, tab in ipairs(GradeCfg.stuff) do
		if tab.usetype == Any_Silver then
			if not Actor.changeMoney(sysarg, mtCoin, -tab.count, GameLog.clEquipPourMoney, Lang.LogTips.l00070) then
				return
			end
		elseif tab.usetype == Any_Stuff then
			local nTempQuality = 0
			local id = tab.id
			if tab.id == -1 then
				id = nItemId
				nTempQuality = nQuality
			end
			local remCount = Actor.removeItem(sysarg, id, stuffItemCount, nTempQuality, -1, -1, Lang.LogTips.l00070, 92)
			if remCount < stuffItemCount then
				if useGold == 0 then
					return
				end
				local needGoldCount = tab.yb * (stuffItemCount - remCount)
				if not Actor.changeMoney(sysarg, mtYuanbao, -needGoldCount, GameLog.clEquipUpgradeLostItem, Lang.LogTips.l00070) then
					return
				end
			end
		--[[elseif tab.usetype == Any_Protect then
			if upProtect > 0 then
				local remCount = Actor.removeItem(sysarg, tab.id, tab.count)
				if remCount < tab.count then
					if useGold <= 0 then
						return
					end
					local needGoldCount = tab.yb * (tab.count - remCount)
					Actor.changeMoney(sysarg, mtYuanbao, -needGoldCount, GameLog.clSkillTrainItem, Lang.LogTips.l00070)
				end
			end]]
		end
	end
	
	--todo 添加新物品和属性
	if nItemStrong <= 0 then
		nItemStrong = 0
	end
	local newItemPtr = Item.createItem(newItemId, 1, nItemStrong, nQuality)
	if newItemPtr then
		Item.addItem(sysarg, newItemPtr, Lang.LogTips.l00070, 93)
		if initSmith > 0 then
			Item.setItemProperty( sysarg, newItemPtr, Item.ipItemSpecSmith, initSmith)
		end
		if nInsure > 0 then
			Item.setItemProperty( sysarg, newItemPtr, Item.ipItemHole3Item, nInsure)
		end
		if not isItemInBag then
			Item.equipItem(sysarg, newItemPtr, heroId)
		end
		if initSmith == 0 then
			Item.initEquipBaseAttr(sysarg, newItemPtr, bawEquipUpgrade)
			local newInitSmith = Item.getItemProperty( sysarg, newItemPtr, Item.ipItemSpecSmith, 0)
			if newInitSmith > 0 then
				local noticeStr = string.format(Lang.ScriptTips.q00097, Actor.getName(sysarg), Item.getItemLinkMsg(newItemId))
				System.broadcastTipmsg(noticeStr, ttScreenCenter + ttChatWindow)
			end
		end
		for propId, propVal in pairs(propTab) do
			Item.setItemProperty( sysarg, newItemPtr, propId, propVal)
		end
		if nLuck > 0 then
			Item.setItemProperty( sysarg, newItemPtr, Item.ipItemLuck, nLuck)
		end
		local nNewLevel = Item.getItemProperty(sysarg, newItemPtr, Item.ipItemActorLevel, 0) 
		local nNewName = Item.getItemName(newItemId)
		local noticeStr = string.format(Lang.ScriptTips.c000079, Actor.getName(sysarg),nLevel, itemName, nNewLevel, nNewName)
		System.broadcastTipmsg(noticeStr, ttScreenCenter + ttChatWindow)
	end
	SendEquipOptResult(sysarg, itemGuid, itEquipUpgrade, 0)
	
	return true
end



--读取升级消耗
function EquipGradeConsume( sysarg, args )	
	local ptrCount = args[1]
	local itemPtr = args[2]
	if not itemPtr then
		return
	end
	local opType = args[ptrCount+2]		--操作类型
	local nQuality = Item.getItemProperty( sysarg, itemPtr, Item.ipItemQuality, 0 )
	local nLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemActorLevel, 0) 
	local nItemId = Item.getItemProperty( sysarg, itemPtr, Item.ipItemID, 0 )
	local nItemType = Item.getItemProperty( sysarg, itemPtr, Item.ipItemType, 0)
	local gradeCfg = GetGradeConfig(nItemType, nLevel, nItemId)
	if not gradeCfg then
		return false
	end
	
	local newItemId = GetNewItemIdBySrcId(gradeCfg, nItemId)
	if not newItemId then
		print("没有这个id")
		return
	end
	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	local otherCount, otherGold = GetQualityCount(nQuality)	
	local otherLen = 0
	if otherCount > 0 then
		otherLen = 1
	end
	DataPack.writeByte(netPack, #gradeCfg.stuff + otherLen)	
	for k, curTab in ipairs(gradeCfg.stuff) do
		DataPack.writeByte(netPack,curTab.type)
		local id = (curTab.id >= 0 ) and curTab.id or nItemId
		DataPack.writeInt(netPack, id)
		local itemCount = curTab.count
		if curTab.usetype == Any_Stuff then
			local itemType = Item.getItemProperty( sysarg, itemPtr, Item.ipItemType, 0 )
			local classRate = gradeCfg.class[itemType]
			if classRate then
				itemCount = itemCount * classRate /100
			end
			local qualityRate = gradeCfg.quality[nQuality + 1] or 100
			itemCount = math.floor(itemCount * qualityRate / 100)
		end
		DataPack.writeInt(netPack, itemCount)
		DataPack.writeByte(netPack, curTab.usetype)
	end
	if otherCount > 0 then
		DataPack.writeByte( netPack, EquipUpgradeConf.qualityItem.type)
		DataPack.writeInt(netPack, EquipUpgradeConf.qualityItem.id)
		DataPack.writeInt( netPack, otherCount)
		DataPack.writeByte( netPack, EquipUpgradeConf.qualityItem.usetype)
	end

	DataPack.writeInt(netPack, newItemId)
	DataPack.writeInt(netPack, gradeCfg.strongLv or 0)
	DataPack.flush(netPack)
end


function GetGradeConfig( itemType, level, itemId )
	for k, cfg in ipairs(DecorationUpgrade) do
		for _, itId in ipairs(cfg.sourceEquips) do
			if itId == itemId then
				return cfg
			end
		end
	end
	for idx, cfg in ipairs(EquipUpgradeConfig) do
		if cfg.level == level then
			return cfg
		end
	end
	return nil
end

function GetNewItemIdBySrcId( cfgTab, itemId )
	local index = -1
	for idx, itId in ipairs(cfgTab.sourceEquips) do
		if itId == itemId then
			index = idx
		end
	end
	if index ~= -1 then
		return cfgTab.targetEquips[index]
	end
	return nil
end

function GetQualityCount( nQuality )
	local qulLv = EquipUpgradeConf.qualityRate[nQuality + 1] or 0
	return qulLv * EquipUpgradeConf.qualityItem.count, EquipUpgradeConf.qualityItem.yb
end

EventCallDispatcher.handlerGetUpgradeConfig = function( sysarg, args )
	local tabItems = {}
	for idx, tab in ipairs(EquipUpgradeConfig) do
		for _, itId in ipairs(tab.sourceEquips) do
			table.insert(tabItems, itId)
		end
	end
	for _, cfg in ipairs(DecorationUpgrade) do
		for idx, itId in ipairs(cfg.sourceEquips) do
			table.insert(tabItems, itId)		
		end
	end
	local netPack = DataPack.allocPacket(sysarg, 8, 19)
	DataPack.writeByte(netPack, EquipStrongCond.minItLv)			--强化最低等级
	DataPack.writeByte(netPack, EquipAuthCond.minItLv)				--鉴定最低等级
	local nSize = #tabItems
	DataPack.writeInt(netPack, nSize)
	for _, itId in ipairs(tabItems) do
		DataPack.writeInt(netPack, itId)
	end
	DataPack.writeByte(netPack, EquipStrongCond.MinStrongSharp)
	local sharpLen = #EquipStrongCond.MaxSharp
	DataPack.writeByte(netPack, sharpLen)
	for k, sharpVal in ipairs(EquipStrongCond.MaxSharp) do
		DataPack.writeByte(netPack, sharpVal)
	end
	--转生的
	local circleTb = {}
	for k, v in ipairs(CircleEquipUpgradeConfig) do
		for idx, iId in ipairs(v.sourceEquips) do
			table.insert(circleTb, iId)
		end
	end
	DataPack.writeInt(netPack, #circleTb)
	for _, itId in ipairs(circleTb) do
		DataPack.writeInt(netPack, itId)
	end
	DataPack.flush(netPack)
end

function GetCircleUpgradeCfg(itemId )
	for k, v in ipairs(CircleEquipUpgradeConfig) do
		for idx, iId in ipairs(v.sourceEquips) do
			if iId == itemId then
				return v, v.targetEquips[idx]
			end
		end
	end
	return nil
end

function CircleEquipUpgradeConsumes(sysarg, args)
	local ptrCount = args[1]
	local itemPtr = args[2]
	if not itemPtr then
		return
	end
	local opType = args[ptrCount+2]		--操作类型

	local nQuality = Item.getItemProperty( sysarg, itemPtr, Item.ipItemQuality, 0 )
	local nItemId = Item.getItemProperty( sysarg, itemPtr, Item.ipItemID, 0 )
	local itemType = Item.getItemProperty( sysarg, itemPtr, Item.ipItemType, 0 )
	local circleGradeCfg, newEquipId = GetCircleUpgradeCfg(nItemId)
	if not circleGradeCfg then
		return
	end
	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	DataPack.writeByte(netPack, #circleGradeCfg.stuff)	
	for k, curTab in ipairs(circleGradeCfg.stuff) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack, curTab.id)
		local itemCount = curTab.count
		if curTab.usetype == Any_Stuff then
			
		end
		DataPack.writeInt(netPack, itemCount)
		DataPack.writeByte(netPack, curTab.usetype)
	end
	DataPack.writeInt(netPack, newEquipId)
	local partAdjust = circleGradeCfg.class[itemType]/100
	local blessMax = circleGradeCfg.blessingMax[nQuality] / partAdjust

	DataPack.writeInt(netPack, blessMax)
	DataPack.flush(netPack)
end

function CircleEquipUpgrade(sysarg, args)
	local optResult = 2		--默认失败
	local itemPtr = args[2]
	local useGold = args[5]
	if not itemPtr then
		return false
	end
	local itemGuid = Item.getItemGuid(itemPtr)
	local nItemId = Item.getItemProperty( sysarg, itemPtr, Item.ipItemID, 0 )
	local nQuality = Item.getItemProperty( sysarg, itemPtr, Item.ipItemQuality, 0 )
	local itemType = Item.getItemProperty( sysarg, itemPtr, Item.ipItemType, 0 )
	local curBlessing = Item.getItemProperty( sysarg, itemPtr, Item.ipItemHole4Item, 0)
	local nLuck = Item.getItemProperty( sysarg, itemPtr, Item.ipItemLuck, 0 )
	local circleGradeCfg, newEquipId = GetCircleUpgradeCfg(nItemId)
	if not circleGradeCfg then
		SendEquipOptResult(sysarg, itemGuid, itCircleUpgrade, optResult )
		return
	end
	local needAllYuanbao = 0
	for idx, tab in ipairs(circleGradeCfg.stuff) do
		if tab.usetype == Any_Silver then			
			local myCoin = Actor.getIntProperty( sysarg, PROP_ACTOR_COIN )
			if myCoin < tab.count then
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf018, tab.count), ttFlyTip)
				SendEquipOptResult(sysarg, itemGuid, itCircleUpgrade, optResult )
				return
			end
		elseif tab.usetype == Any_Stuff then
			local itemCount = Actor.getItemCount(sysarg, tab.id)
			if itemCount < tab.count then
				if useGold <= 0  then
					Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf020,Item.getItemName(tab.id)), ttFlyTip)
					SendEquipOptResult(sysarg, itemGuid, itCircleUpgrade, optResult )
					return
				end
				if not tab.yb or tab.yb == 0 then
					local itemStr = string.format(Lang.ScriptTips.zf038, Item.getItemName(tab.id))
					Actor.sendTipmsg(sysarg, itemStr, ttFlyTip)
					SendEquipOptResult(sysarg, itemGuid, itCircleUpgrade, optResult )
					return
				end
				local needGoldCount = tab.yb * (tab.count - itemCount)
				needAllYuanbao = needAllYuanbao + needGoldCount
			end
		end
	end
	--判断钱够不够	
	local myGold = Actor.getIntProperty( sysarg, PROP_ACTOR_YUANBAO)
	if myGold < needAllYuanbao then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf019, needAllYuanbao), ttFlyTip)
		SendEquipOptResult(sysarg, itemGuid, itCircleUpgrade, optResult )
		return
	end
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	local needGrid = Item.getAddItemNeedGridCount(sysarg, newEquipId, 1)
	if bagIdxs < needGrid then
		local noticeStr = string.format(Lang.ScriptTips.zf060, needGrid)
		Actor.sendTipmsg(sysarg, noticeStr, ttFlyTip)
		SendEquipOptResult(sysarg, itemGuid, itCircleUpgrade, optResult )
		return
	end

	--扣钱和物品
	for idx, tab in ipairs(circleGradeCfg.stuff) do
		if tab.usetype == Any_Silver then
			if not Actor.changeMoney(sysarg, mtCoin, -tab.count, GameLog.clEquipPourMoney, Lang.LogTips.l00070) then
				SendEquipOptResult(sysarg, itemGuid, itCircleUpgrade, optResult )
				return
			end
		elseif tab.usetype == Any_Stuff then
			local remCount = Actor.removeItem(sysarg, tab.id, tab.count, -1, -1, -1, string.format(Lang.LogTips.l00163,Item.getItemName(tab.id)), 92)
			if remCount < tab.count then
				if useGold == 0 then
					SendEquipOptResult(sysarg, itemGuid, itCircleUpgrade, optResult )
					return
				end
				local needGoldCount = tab.yb * (tab.count - remCount)
				if not Actor.changeMoney(sysarg, mtYuanbao, -needGoldCount, GameLog.clEquipUpgradeLostItem, Lang.LogTips.l00070) then
					SendEquipOptResult(sysarg, itemGuid, itCircleUpgrade, optResult )
					return
				end
			end
		end
	end

	local boResult = false
	local partAdjust = circleGradeCfg.class[itemType]/100
	local blessMax = circleGradeCfg.blessingMax[nQuality] / partAdjust
	if curBlessing >= blessMax then
		boResult = true
	else
		local circleAdjust = circleGradeCfg.circleMax[nQuality]/10000
		local blessVal = (circleGradeCfg.blessingconst/10000) * (curBlessing / blessMax ) * circleAdjust
		local succRate = (circleGradeCfg.baseRate/10000) * (circleGradeCfg.class[itemType]/100) * (1/circleAdjust) + blessVal
		local rate = System.getRandomNumber(100000)
		if rate < succRate*100000 then
			boResult = true
		end
	end
	if boResult then
		local propTab ={}
		for k, v in ipairs(AuthValTab) do
			local maxIdx = Item.getItemProperty( sysarg, itemPtr, v, 0)
			if maxIdx > 0 then
				table.insert(propTab, maxIdx)
			end
		end
		local nStrong = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrong, 0)
		local initSmith = Item.getItemProperty( sysarg, itemPtr, Item.ipItemSpecSmith, 0)
		if Actor.removeItemByPtr(sysarg, itemPtr, 1, true, Lang.LogTips.l00107, 92) == 0 then
			if Item.removeEquip(sysarg, itemPtr, Lang.LogTips.l00107, 92, true) == 0 then
				SendEquipOptResult(sysarg, itemGuid, itCircleUpgrade, optResult )
				return
			end
		end
		local newItemPtr = Item.createItem(newEquipId, 1, nStrong, nQuality)
		if newItemPtr then
			Item.addItem(sysarg, newItemPtr, Lang.LogTips.l00070, 93)
			if initSmith > 0 then
				Item.setItemProperty( sysarg, newItemPtr, Item.ipItemSpecSmith, initSmith)
			end
			for idx, propVal in ipairs(propTab) do
				Item.setItemProperty( sysarg, newItemPtr, AuthValTab[idx], propVal)
			end
			if nLuck > 0 then
				Item.setItemProperty( sysarg, newItemPtr, Item.ipItemLuck, nLuck)
			end
			optResult = 0
		end
	else
		local addVal = 0
		local curRate = 0
		local randBlsRate = System.getRandomNumber(10000)
		for k, v in ipairs(circleGradeCfg.failBlessingAddRate) do
			curRate = curRate + v
			if randBlsRate < curRate then
				addVal = k
				break
			end
		end
		optResult = 1
		if addVal > 0 then
			Item.setItemProperty( sysarg, itemPtr, Item.ipItemHole4Item, curBlessing + addVal)
		end
	end
	SendEquipOptResult(sysarg, itemGuid, itCircleUpgrade, optResult )
end