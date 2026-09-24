--#include "data\config\item\itemEnhance\LightEquip.lua" once

--神装合成
function LightEquip(sysarg,args)

	local itemCount = args[1]
	local itemPtr = args[2]
	local paramCount = args[itemCount+3]
	local isProtect = args[itemCount+4] > 0

	local nItemId = Item.getItemId(itemPtr)
	local itemGuid = Item.getItemGuid(itemPtr)
	local itemCircle = Item.getItemProperty(sysarg,itemPtr,Item.ipItemCircleFor)
	local curCfg = nil
	local equipIndex = 0

	for i,v in pairs(LightEquipCfg) do
		if v and v.equipIds then
			for j,equipId in ipairs(v.equipIds) do
				if nItemId == equipId then
					curCfg = v
					equipIndex = j
					break
				end
			end
		end
	end
	if curCfg == nil or not curCfg.awardIds[equipIndex] then return end

	local godRate = curCfg.rate
	-- 检查
	local consumeData = {}
	local ret = CheckAllConsume(sysarg, false, curCfg.consume, true, consumeData)

	--print(isProtect)
	if ret and isProtect and curCfg.protect then
		ret = CheckAllConsume(sysarg, false, curCfg.protect, true, consumeData)
		if ret then
			godRate = RandomBase
		else
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.q00100, ttFlyTip)	
			return
		end
	end
	
	if not ret then
		SendEquipOptResult(sysarg, itemGuid, itEquipLight, 2)
		return
	end	

	--扣费
	ret = DeductAllConsume(sysarg, false, curCfg.consume, GameLog.CGodEquipConsume)
	
	if ret and isProtect and curCfg.protect then
		ret = DeductAllConsume(sysarg, false, curCfg.protect, GameLog.CGodEquipConsume)
	end
	
	if not ret then
		SendEquipOptResult(sysarg, itemGuid, itEquipLight, 2)
		return
	end
	if math.random(RandomBase) >= godRate then
		SendEquipOptResult(sysarg, itemGuid, itEquipLight, 2)
		return
	end

	local nStrong = 0
	local nBlood = 0
	local nStrongLimit = 12
	local nSuperLevel = 0
	if Item.getItemProperty(sysarg,itemPtr,Item.ipItemStrong) > nStrong then
		nStrong = Item.getItemProperty(sysarg,itemPtr,Item.ipItemStrong)
		nStrongLimit = Item.getItemProperty(sysarg,itemPtr,Item.ipItemStrongLimit)
	end
	if Item.getItemProperty(sysarg,itemPtr,Item.ipItemAppraisal) > nBlood then
		nBlood = Item.getItemProperty(sysarg,itemPtr,Item.ipItemAppraisal)
	end
	if Item.getItemProperty(sysarg,itemPtr,Item.ipItemSuperAttrLevel) > nSuperLevel then
		nSuperLevel = Item.getItemProperty(sysarg,itemPtr,Item.ipItemSuperAttrLevel)
	end

	if Actor.removeItemByPtr(sysarg,itemPtr,1) ~= 1 then
		if Item.removeEquip(sysarg,itemPtr,"神装合成物品",GameLog.CGodEquipConsume) ~= 1 then
			return
		end
	end
	
	local newItem = Item.createItem(curCfg.awardIds[equipIndex],1,nStrong,0,0,0)
	Item.addItem(sysarg,newItem,"神装合成",GameLog.CGodEquipCreate)
	Item.setItemProperty(sysarg, newItem, Item.ipItemStrongLimit, nStrongLimit)
	Item.setItemProperty(sysarg, newItem, Item.ipItemAppraisal, nBlood)
	Item.setItemProperty(sysarg, newItem, Item.ipItemSuperAttrLevel, nSuperLevel)
	
	SendEquipOptResult(sysarg, itemGuid, itEquipLight, 0)
	local itemName = Item.getItemName(curCfg.awardIds[equipIndex]);

	System.broadcastTipmsg(string.format(Lang.ScriptTips.q00101,Actor.getName(sysarg),itemName),2048+128+2)

end
--神装合成返回消耗
function LightEquipConsume(sysarg,args)
	local ptrCount = args[1]
	local itemPtr = args[2]
	if not itemPtr then
		return
	end
	local opType = args[ptrCount+2]		--操作类型
	local nItemId = Item.getItemProperty( sysarg, itemPtr, Item.ipItemID, 0 )
	local curCfg = nil
	local equipIndex = 0

	for i,v in pairs(LightEquipCfg) do
		if v and v.equipIds then
			for j,equipId in ipairs(v.equipIds) do
				if nItemId == equipId then
					curCfg = v
					equipIndex = j
					break
				end
			end
		end
	end
	if curCfg == nil or not curCfg.awardIds[equipIndex] then return end

	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	DataPack.writeByte(netPack, #curCfg.consume + #curCfg.protect + 1)
	
	for k, curTab in ipairs(curCfg.consume) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack,curTab.id or 0)
		DataPack.writeInt(netPack,curTab.count)
		DataPack.writeByte(netPack, curTab.type == 6 and Any_Silver or Any_Stuff)
	end

	for k, curTab in ipairs(curCfg.protect) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack,curTab.id or 0)
		DataPack.writeInt(netPack,curTab.count)
		DataPack.writeByte(netPack, Any_Protect)
	end

	DataPack.writeByte(netPack,0)
	DataPack.writeInt(netPack,curCfg.awardIds[equipIndex])
	DataPack.writeInt(netPack,1)
	DataPack.writeByte(netPack, Any_Silver)
	DataPack.writeInt(netPack, curCfg.rate)
	DataPack.flush(netPack)

end

--神装拆解
function ResolvingLightEquip(sysarg,args)
	local itemCount = args[1]
	local itemPtr = args[2]

	local nItemId = Item.getItemId(itemPtr)
	local curCfg = nil
	local equipIndex = 0

	for i,v in pairs(ResolvingLightEquipCfg) do
		if v and v.equipIds then
			for j,equipId in ipairs(v.equipIds) do
				if nItemId == equipId then
					curCfg = v
					equipIndex = j
					break
				end
			end
		end
	end
	if curCfg == nil or not curCfg.awardIds[equipIndex] then return end	
	-- 检查
	
	local nStrong = 0
	local nBlood = 0
	local nStrongLimit = 12
	local nSuperLevel = 0
	local nBind = 0
	if Item.getItemProperty(sysarg,itemPtr,Item.ipItemStrong) > nStrong then
		nStrong = Item.getItemProperty(sysarg,itemPtr,Item.ipItemStrong)
		nStrongLimit = Item.getItemProperty(sysarg,itemPtr,Item.ipItemStrongLimit)
	end
	if Item.getItemProperty(sysarg,itemPtr,Item.ipItemAppraisal) > nBlood then
		nBlood = Item.getItemProperty(sysarg,itemPtr,Item.ipItemAppraisal)
	end
	if Item.getItemProperty(sysarg,itemPtr,Item.ipItemSuperAttrLevel) > nSuperLevel then
		nSuperLevel = Item.getItemProperty(sysarg,itemPtr,Item.ipItemSuperAttrLevel)
	end
	if Actor.removeItemByPtr(sysarg,itemPtr,1) ~= 1 then
		if Item.removeEquip(sysarg,itemPtr,"神装材料删物品",GameLog.CGodEquipConsume) ~= 1 then
			return;
		end
	end
	
	if not Awards.CheckBagGridCount(sysarg,curCfg.material) then return	end
	
	Awards.Give(sysarg,curCfg.material,GameLog.CGodEquipCreate,"神装分解材料")

	local nNewItem = Item.createItem(curCfg.awardIds[equipIndex],1,nStrong,0,nBind,0)
	Item.addItem(sysarg,nNewItem,"神装分解",GameLog.CGodEquipCreate)
	Item.setItemProperty(sysarg, nNewItem, Item.ipItemStrongLimit, nStrongLimit)
	Item.setItemProperty(sysarg, nNewItem, Item.ipItemAppraisal, nBlood)
	Item.setItemProperty(sysarg, nNewItem, Item.ipItemSuperAttrLevel, nSuperLevel)
	
	SendEquipOptResult(sysarg, itemGuid, itEquipGod, 0)

end

--神装拆解消耗
function ResolvingLightEquipConsume(sysarg,args)
	local ptrCount = args[1]
	local itemPtr = args[2]
	if not itemPtr then
		return
	end
	local opType = args[ptrCount+2]		--操作类型
	local nItemId = Item.getItemProperty( sysarg, itemPtr, Item.ipItemID, 0 )
	local curCfg = nil
	local equipIndex = 0

	for i,v in pairs(ResolvingLightEquipCfg) do
		if v and v.equipIds then
			for j,equipId in ipairs(v.equipIds) do
				if nItemId == equipId then
					curCfg = v
					equipIndex = j
					break
				end
			end
		end
	end
	if curCfg == nil or not curCfg.awardIds[equipIndex] then return end

	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	DataPack.writeByte(netPack, #curCfg.material+1)
	
	for k, curTab in ipairs(curCfg.material) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack,curTab.id or 0)
		DataPack.writeInt(netPack,curTab.count)
		DataPack.writeByte(netPack, curTab.type == 6 and Any_Silver or Any_Stuff)
	end
	
	DataPack.writeByte(netPack,0)
	DataPack.writeInt(netPack,curCfg.awardIds[equipIndex])
	DataPack.writeInt(netPack,1)
	DataPack.writeByte(netPack, Any_Silver)

	DataPack.writeInt(netPack, curCfg.rate)
	DataPack.flush(netPack)
end