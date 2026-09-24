--lua script

--幻武转换
function OnWeaponExtendChg( sysarg, args )
	local ptrCount = args[1]			--指针数量
	local srcPtr = args[2]  			--原始物品的指针
	local opPtr = args[3]				--消耗物品指针
	local opType = args[ptrCount+2]		--操作类型
	
	local config = WeaponExtendChg
	
	if not config then return end
	if (not srcPtr or not opPtr) then return false end
	
	--从物品身上取得类型
	local itemType1 = Item.getItemProperty( sysarg, srcPtr, Item.ipItemType, 0 )
	local itemType2 = Item.getItemProperty( sysarg, opPtr, Item.ipItemType, 0 )
	--是否幻武
	if itemType1 ~= Item.itWeaponExtend or itemType2 ~= Item.itWeaponExtend then
		return false
	end
	
	if Item.getBagEmptyGridCount(sysarg) < 2 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf202, ttFlyTip)
		return
	end
	
	--判断位置
	local guid1 = Item.getItemGuid(srcPtr)
	local equipPtr1, itemPos1, heroId1 = Item.getEquipItemPtr(sysarg, guid1, 0, 0, 0)
	if equipPtr1 ~= srcPtr or itemPos1 == 0 then return end
	
	local guid2 = Item.getItemGuid(opPtr)
	local equipPtr2, itemPos2, heroId2 = Item.getEquipItemPtr(sysarg, guid2, 0, 0, 0)
	if equipPtr2 ~= opPtr or itemPos2 == 0 then return end
	
	--获取属性
	local itemStrong1 = Item.getItemProperty( sysarg, srcPtr, Item.ipItemStrong, 0 )
	local itemStrong2 = Item.getItemProperty( sysarg, opPtr, Item.ipItemStrong, 0 )
	local itemQuality1 = Item.getItemProperty( sysarg, srcPtr, Item.ipItemQuality, 0 )
	local itemQuality2 = Item.getItemProperty( sysarg, opPtr, Item.ipItemQuality, 0 )
	local itemBind1 = Item.getItemProperty( sysarg, srcPtr, Item.ipItemBind, 0 )
	local itemBind2 = Item.getItemProperty( sysarg, opPtr, Item.ipItemBind, 0 )
	local itemId1 = Item.getItemProperty( sysarg, srcPtr, Item.ipItemID, 0 )
	local itemId2 = Item.getItemProperty( sysarg, opPtr, Item.ipItemID, 0 )
	
	--极品转移暂不支持
	--local initSmith1 = Item.getItemProperty( sysarg, srcPtr, Item.ipItemSpecSmith, 0)
	--local initSmith2 = Item.getItemProperty( sysarg, opPtr, Item.ipItemSpecSmith, 0)
	
	local itemGroup1, itemLevel1 = GetWeaponExtendChgConfig(itemId1, config.itemMap)
	local itemGroup2, itemLevel2 = GetWeaponExtendChgConfig(itemId2, config.itemMap)
	
	if itemGroup1 == 0 or itemLevel1 == 0 or itemGroup2 == 0 or itemLevel2 == 0 then
		System.trace(string.format("get WeaponExtend error,id1=%d,id2=%d", itemId1, itemId2))
		return
	end
	
	if itemId1 == itemId2 or itemGroup1 == itemGroup2 or itemLevel1 == itemLevel2 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf200, ttFlyTip)
		return
	end
	
	local destItem1 = config.itemMap[itemGroup2][itemLevel1]
	local destItem2 = config.itemMap[itemGroup1][itemLevel2]
	
	if destItem1 == nil or destItem2 == nil then return end
	
	--判断额外消耗
	local consumes = config.consumes
	local result = SuccessCheck(sysarg, opType, consumes, 0, 0)
	if (result ~= successCheckResult.ok) then return false end
	
	local result, isBind = EnhanceConsumes(sysarg, opType, consumes, 0, 0, 854, Lang.LogTips.l00135)
	if (result ~= successCheckResult.ok) then return false end
	
	--消耗原材料
	local bResult = true
	if itemPos1 == 1 then
		if Actor.removeItemByPtr(sysarg, srcPtr, 1, true, Lang.LogTips.l00135, 854) < 1 then
			bResult = false
		end
	elseif itemPos1 == 2 or itemPos1 == 3 then
		if Item.removeEquip(sysarg, srcPtr, Lang.LogTips.l00135, 854, true) < 1 then
			bResult = false
		end
	else
		return false
	end
	
	if bResult ~= true then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf201, ttFlyTip)
		return 
	end
	
	--消耗附属材料
	if itemPos2 == 1 then
		if Actor.removeItemByPtr(sysarg, opPtr, 1, true, Lang.LogTips.l00135, 854) < 1 then
			bResult = false
		end
	elseif itemPos2 == 2 or itemPos2 == 3 then
		if Item.removeEquip(sysarg, opPtr, Lang.LogTips.l00135, 854, true) < 1 then
			bResult = false
		end
	else
		return false
	end
	
	if bResult ~= true then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf201, ttFlyTip)
		return 
	end
	
	local bResult = false
	if Actor.addItem(sysarg, destItem1, itemQuality1, itemStrong1, 1, itemBind1, 0, Lang.LogTips.l00136, 854) < 1 then
		System.trace(string.format("Error: OnWeaponExtendChg additem error,destItem=%d,actorid=%d", destItem1, Actor.getIntProperty(sysarg,PROP_ENTITY_ID)))
		bResult = true
	end
	if Actor.addItem(sysarg, destItem2, itemQuality2, itemStrong2, 1, itemBind2, 0, Lang.LogTips.l00136, 854) < 1 then
		System.trace(string.format("Error: OnWeaponExtendChg additem error,destItem=%d,actorid=%d", destItem1, Actor.getIntProperty(sysarg,PROP_ENTITY_ID)))
		bResult = true
	end
	
	--返回客户端处理结果
	Item.sendItemProcessResult( sysarg, nil, opType, bResult)
	
	return true
end

--幻武转换消耗
function GetWeaponExtendChgConsumes( sysarg, args )
	local ptrCount = args[1]			--指针数量
	local srcPtr = args[2]  			--原始物品的指针
	local opPtr = args[3]				--消耗物品指针
	local opType = args[ptrCount+2]		--操作类型
	--local count = args[ptrCount+3]		--转化数量
	if not WeaponExtendChg then return end
	if (not srcPtr or not opPtr) then return false end
	
	--从物品身上取得类型
	local itemType1 = Item.getItemProperty( sysarg, srcPtr, Item.ipItemType, 0 )
	local itemType2 = Item.getItemProperty( sysarg, opPtr, Item.ipItemType, 0 )
	--是否幻武
	if itemType1 ~= Item.itWeaponExtend or itemType2 ~= Item.itWeaponExtend then
		return false
	end
	
	local consumes = config.consumes
	
	--返回客户端消耗结果
	SendConsumesToClient(sysarg, opType, consumes)
end

function GetWeaponExtendChgConfig(itemId,config)
	for k, v in ipairs(config) do
		for m, n in ipairs(v) do
			if n == itemId then
				return k, m
			end
		end
	end
	
	return 0, 0
end