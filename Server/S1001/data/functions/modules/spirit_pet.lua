-- 灵兽
--#include "data/config/modules/spirit_pet/spirit_pet_cfg.lua" once

-- 灵兽属性计算
function OnSpiritPetResetPropertys(sysarg, calc)
	local slot_list_cfg = spirit_pet_cfg.slots
	
	for slot = 1, 6 do
		local level = Actor.getSpiritPetSlotLevel(sysarg, slot - 1)
		if level > 0 then
			local slot_cfg = slot_list_cfg[slot]
			local levelCfg = slot_cfg[level]
			if levelCfg == nil then
				local maxLevel = #slot_cfg
				levelCfg = slot_cfg[maxLevel]
			end
			
			if levelCfg ~= nil then
				LuaHelp.calcActorAttrs(sysarg, calc, levelCfg.attrs)
			end
		end
	end
end


-- 升级灵兽槽
function UpgradeSpiritPetSlot(sysarg, packet)
	-- 槽位，从1开始
	local slot = DataPack.readByte(packet)
	if slot < 1 or slot > 6 then return end
	
	local level = Actor.getSpiritPetSlotLevel(sysarg, slot - 1)
	local nextLevel = level + 1
	local nextLevelCfg = spirit_pet_cfg.slots[slot][nextLevel]
	if nextLevelCfg == nil then
		local slotNames = {"金", "木", "水", "火", "土", "阴阳"}
		
		Actor.sendTipmsg(sysarg, slotNames[slot] .. "已是最高等级!", ttFlyTip)
		return
	end
	
	local exp = Actor.getSpiritPetExp(sysarg)
	if exp < nextLevelCfg.needExp then
		local msg
		local decimal = math.mod(nextLevelCfg.needExp, 10) -- 为了避免小数位，数值乘以了10		
		if decimal == 0 then
			msg = string.format("您的献祭点数不足 %d", math.floor(nextLevelCfg.needExp/10))
		else
			msg = string.format("您的献祭点数不足 %d.%d", math.floor(nextLevelCfg.needExp/10), decimal)
		end
		
		Actor.sendTipmsg(sysarg, msg, ttFlyTip)
		return
	end
	
	local newExp = exp - nextLevelCfg.needExp
	Actor.setSpiritPetExp(sysarg, newExp)
	Actor.setSpiritPetSlotLevel(sysarg, slot - 1, nextLevel)
	
	Actor.collectOperate(sysarg, 0) -- 0:重新计算属性
	
	System.sendCommonLog(LogIds.SpiritPetSlotUpgrade,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),nextLevel,exp,newExp,tostring(slot))
	
	-- 下发给前端
	local netPack = DataPack.allocPacket(sysarg, 76, 2)
	DataPack.writeByte(netPack, slot)	
	DataPack.writeByte(netPack, nextLevel)	
	DataPack.writeUInt(netPack, newExp)
	DataPack.flush(netPack)
	
	local slotNames = {"金", "木", "水", "火", "土", "阴阳"}
	local msg
	local decimal = math.mod(nextLevelCfg.needExp, 10) -- 为了避免小数位，数值乘以了10
	if decimal == 0 then
		msg = string.format("消耗献祭值:%d, %s升级至%d级", math.floor(nextLevelCfg.needExp/10), slotNames[slot], nextLevel)
	else
		msg = string.format("消耗献祭值:%d.%d, %s升级至%d级", math.floor(nextLevelCfg.needExp/10), decimal, slotNames[slot], nextLevel)
	end
	
	Actor.sendTipmsg(sysarg, msg, ttFlyTip)
	
	local minLevel = Actor.getSpiritPetSlotMinLevel(sysarg)
	if minLevel == nextLevel then
		local rankLevel = -1 -- 等级到了，外观可能还没有
		for i, v in ipairs(spirit_pet_cfg.spirit_pet_list) do
			if minLevel == v.level then
				rankLevel = i
				break
			elseif minLevel < v.level then
				break
			end
		end
		
		if rankLevel ~= -1 then
			local petCfg = spirit_pet_cfg.spirit_pet_list[rankLevel]
			local msg = string.format("<(c0xFF00FF00)%s>将慧根全部升至%d级，获得酷炫%s！<我也要获得/@@showWin,257>", Actor.getName(sysarg), minLevel, petCfg.name)
			System.broadcastTipmsg(msg, ttScreenCenter+ttChatWindow)
		end
	end
	
end

-- 设置灵兽外观
function SetSpiritPetAppearance(sysarg, packet)
	-- 0 为没有
	local idx = DataPack.readByte(packet)
	if idx > 0 then		
		local petCfg = spirit_pet_cfg.spirit_pet_list[idx]
		if petCfg == nil then return end
		
		local minLevel = Actor.getSpiritPetSlotMinLevel(sysarg)
		if minLevel < petCfg.level then return end -- 等级不足		
		
	end
	
	local appearance = Actor.getUIntProperty(sysarg, PROP_ACTOR_SPIRIT_PET_APPEARANCE)
	appearance = System.setIntByte(appearance, 0, idx)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_SPIRIT_PET_APPEARANCE, appearance)
	
end

-- 返回 -1 则没有找到
function get_recycle_spirit_pet_exp_from_table(tbl, itemid)
	local i = 1
	while (true) do
		local id = tbl[i]
		if id == nil then return -1 end
		
		if id == itemid then
			local _exp = tbl[i + 1]
			if _exp == nil then
				return -1
			else	
				return _exp
			end
		end
		
		i = i + 2
	end
	
	return -1
end

-- 返回 -1 则没有找到
function get_recycle_spirit_pet_exp_from_itemid(itemid)
	if itemid == 0 then return -1 end
	
	for i, v in ipairs(spirit_pet_cfg.spirit_pet_recycle_item_list) do
		local _exp = get_recycle_spirit_pet_exp_from_table(v, itemid)
		if _exp >= 0 then
			return _exp
		end
	end
	
	return -1
end

-- 回收物品得到灵兽经验
function RecycleSpiritPetItems(sysarg, packet)
	-- 0:背包， 1:个人仓库， 2:寻宝仓库
	local bagType = DataPack.readByte(packet)
	if bagType ~= 0 and bagType ~= 1 and bagType ~= 2 then
		return
	end
	
	local recycleCount = DataPack.readByte(packet)
	if recycleCount == 0 then return end
			
	local addExp = 0
	
	for i = 1, recycleCount do
		local itemSec = DataPack.readInt64(packet)
		
		local itemPtr = nil
		if bagType == 0 then
			itemPtr = Item.getBagItemPtrByGuid(sysarg, itemSec)
		elseif bagType == 1 then
			itemPtr = Actor.getDepotItemByGuid(sysarg, itemSec)
		elseif bagType == 2 then
			itemPtr = Dmkj.getStoreItemByGuid(sysarg, itemSec)
		end
		
		if itemPtr ~= nil then
			local itemId = Item.getItemId(itemPtr)
			local _exp = get_recycle_spirit_pet_exp_from_itemid(itemId)
			if _exp >= 0 then -- 返回 -1 则该物品不能回收
				local itemCount = Item.getItemProperty(sysarg, itemPtr, Item.ipItemCount, 0)
				local itemExp = _exp * itemCount
				
				if bagType == 0 then
					if Item.removeItem(sysarg, itemPtr, itemCount, tostring(itemExp), LogIds.SpiritPetRecycleItems) >= itemCount then
						addExp = addExp + itemExp
					end
				elseif bagType == 1 then
					if Actor.deleteDepotItemByGuid(sysarg, itemSec, tostring(itemExp), LogIds.SpiritPetRecycleItems) == true then
						addExp = addExp + itemExp
					end
				elseif bagType == 2 then
					if Dmkj.deleteStoreItem(sysarg, itemPtr, LogIds.SpiritPetRecycleItems) == true then
						addExp = addExp + itemExp
					end
				end
			end
		end
	end
	
	addExp = math.floor(addExp)
	if addExp == 0 then return end
	
	local oldExp = Actor.getSpiritPetExp(sysarg)
	local newExp = oldExp + addExp
	if newExp > 4294967295 then
		newExp = 4294967295
	end
	
	Actor.setSpiritPetExp(sysarg, newExp)	
	System.sendCommonLog(LogIds.SpiritPetRecycleItemsAddExp,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),oldExp,newExp,addExp,"")
	
	-- 下发当前灵兽经验值
	SendSpiritPetExp(sysarg)
	
	local msg
	local decimal = math.mod(addExp, 10) -- 为了避免小数位，数值乘以了10
	if decimal == 0 then
		msg = string.format("获得献祭值:%d", math.floor(addExp/10))
	else
		msg = string.format("获得献祭值:%d.%d", math.floor(addExp/10), decimal)
	end

	Actor.sendTipmsg(sysarg, msg, ttFlyTip)
end

-- 下发当前灵兽经验值
function SendSpiritPetExp(sysarg)
	local exp = Actor.getSpiritPetExp(sysarg)
	
	local netPack = DataPack.allocPacket(sysarg, 76, 4)	
	DataPack.writeUInt(netPack, exp)	
	DataPack.flush(netPack)
end

EventCallDispatcher.SpiritPetOp = function (sysarg, args)
	local cmd = args[1]
	local packet = args[2]
	
	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	if nCircle < 3 then
		Actor.sendTipmsg(sysarg, string.format("转数不足3，未开启此系统"), ttFlyTip)
		return
	end
	
	if cmd == 2 then -- 升级灵兽槽
		UpgradeSpiritPetSlot(sysarg, packet)
	elseif cmd == 3 then -- 设置灵兽外观
		SetSpiritPetAppearance(sysarg, packet)
	elseif cmd == 4 then -- 回收物品得到灵兽经验
		RecycleSpiritPetItems(sysarg, packet)	
	elseif cmd == 5 then -- 获得当前灵兽经验值
		SendSpiritPetExp(sysarg)
	else
		print("error SpiritPetOp, unknown cmd="..cmd)
		return
	end
	
end

