-- 战灵
--#include "data/config/modules/spirit_fighter/spirit_fighter_cfg.lua" once

-- 战灵属性计算
function OnSpiritFighterResetPropertys(sysarg, calc)
	
	local fighterLevel = Actor.getSpiritFighterLevel(sysarg)
	if fighterLevel == 0 then return end
	
	-- 战灵等级属性
	local fighterLevelCfg = spirit_fighter_cfg.levels[fighterLevel]
	if fighterLevelCfg == nil then return end
	
	LuaHelp.calcActorAttrs(sysarg, calc, fighterLevelCfg.attrs)
	
	-- 潜能属性
	local energyLevel = Actor.getSpiritFighterEnergyLevel(sysarg)
	if energyLevel > 0 then
		local energyLevelCfg = spirit_fighter_cfg.energy_level[energyLevel]
		if energyLevelCfg ~= nil then
			LuaHelp.calcActorAttrs(sysarg, calc, energyLevelCfg.attrs)
		end
	end
	
	-- 装备属性
	local minLevel = -1
	for slot = 0, 3 do		
		local isok, level, isBind, exp = Actor.getSpiritFighterEquip(sysarg, slot)
		if isok and (level > 0 or exp > 0) then -- -- 该槽位有装备
			if minLevel == -1 or level < minLevel then
				minLevel = level
			end
			
			local slotCfg = spirit_fighter_cfg.slots[slot+1]
			local equipLevelCfg = slotCfg[level+1] -- 等级是0时为基础属性
			if equipLevelCfg ~= nil then
				LuaHelp.calcActorAttrs(sysarg, calc, equipLevelCfg.attrs)
			end
		else
			minLevel = 0 -- 该槽位没有装备
		end
	end
	
	-- 装备套装属性
	if minLevel > 0 then
		local suitIdx = 0
		for i, v in ipairs(spirit_fighter_cfg.equipSuits) do
			if minLevel >= v.level then
				suitIdx = i
			elseif minLevel < v.level then
				break
			end
		end
		
		if suitIdx > 0 then
			LuaHelp.calcActorAttrs(sysarg, calc, spirit_fighter_cfg.equipSuits[suitIdx].attrs)
		end
	end
	
end

-- 升级战灵
function UpgradeSpiritFighter(sysarg, packet)
	local level = Actor.getSpiritFighterLevel(sysarg)
	local nextLevel = level + 1
	if nextLevel > 255 then return end
	
	local nextLevelCfg = spirit_fighter_cfg.levels[nextLevel]
	if nextLevelCfg == nil then
		Actor.sendTipmsg(sysarg, "您的战灵已是最高等级了!", ttFlyTip)
		return
	end
	
	local consumeData = {}
	local ret = CheckAllConsume(sysarg, false, nextLevelCfg.consume, true, consumeData)
	if not ret then return end

	ret = DeductAllConsume(sysarg, false, nextLevelCfg.consume, LogIds.SFighterUpgradeConsume)
	if not ret then return end
	
	Actor.setSpiritFighterLevel(sysarg, nextLevel)
	Actor.collectOperate(sysarg, 0) -- 0:重新计算属性
	
	System.sendCommonLog(LogIds.SFighterUpgrade,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),level,nextLevel,0,"")
	
	-- 下发给前端
	local netPack = DataPack.allocPacket(sysarg, 74, 2)
	DataPack.writeByte(netPack, nextLevel)	
	DataPack.flush(netPack)
end

-- 设置战灵外观
function SetSpiritFighterAppearance(sysarg, packet)
	local fighterLevel = Actor.getSpiritFighterLevel(sysarg)
	if fighterLevel == 0 then return end
	
	local appearance = DataPack.readByte(packet)
	if Actor.setSpiritFighterAppearance(sysarg, appearance) == false then
		return
	end
	
	-- 下发给前端
	local netPack = DataPack.allocPacket(sysarg, 74, 3)
	DataPack.writeByte(netPack, appearance)	
	DataPack.flush(netPack)
end

-- 升级战灵潜能等级
function UpgradeSpiritFighterEnergyLevel(sysarg, packet)
	local fighterLevel = Actor.getSpiritFighterLevel(sysarg)
	if fighterLevel == 0 then return end
	
	local level = Actor.getSpiritFighterEnergyLevel(sysarg)
	local nextLevel = level + 1
	if nextLevel > 255 then return end
		
	local nextLevelCfg = spirit_fighter_cfg.energy_level[nextLevel]
	if nextLevelCfg == nil then
		Actor.sendTipmsg(sysarg, "您的战灵潜能已是最高等级了!", ttFlyTip)
		return
	end
	
	local myExp = Actor.getSpiritFighterEnergyExp(sysarg)
	if myExp < nextLevelCfg.exp then
		Actor.sendTipmsg(sysarg, "您的战灵潜能经验不足!", ttFlyTip)
		return
	end
	
	local newExp = myExp - nextLevelCfg.exp
	Actor.setSpiritFighterEnergyExp(sysarg, newExp)	
	Actor.setSpiritFighterEnergyLevel(sysarg, nextLevel)
	Actor.collectOperate(sysarg, 0) -- 0:重新计算属性
	
	System.sendCommonLog(LogIds.SFighterEnergyUpgrade,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),level,nextLevel,myExp,tostring(newExp))
	
	if math.mod(nextLevel, 5) == 0 then
		local msg = string.format("恭喜玩家<(c0xFF00FF00)%s>将战灵潜能提升至%d级！<前往提升/@@showWin,89>", Actor.getName(sysarg), nextLevel)
		System.broadcastTipmsg(msg, ttScreenCenter+ttChatWindow)
	end
	
	-- 下发给前端
	local netPack = DataPack.allocPacket(sysarg, 74, 4)
	DataPack.writeByte(netPack, nextLevel)	
	DataPack.writeUInt(netPack, newExp)
	DataPack.flush(netPack)
end

-- 穿戴战灵装备
function TakeOnSpiritFighterEquip(sysarg, packet)
	local fighterLevel = Actor.getSpiritFighterLevel(sysarg)
	if fighterLevel == 0 then return end
	
	-- 槽位，从0开始
	local slot = DataPack.readByte(packet)
	if slot < 0 or slot > 3 then return end
	
	local isok, level, isBind, exp = Actor.getSpiritFighterEquip(sysarg, slot)
	if isok == false or (level > 0 or exp > 0) then -- 已经有装备了
		return
	end
	
	local equipGuid = DataPack.readUint64(packet)
	local equipPtr = Item.getBagItemPtrByGuid(sysarg, equipGuid)
	if equipPtr == nil then -- 背包中没有该装备
		return
	end
	
	local nItemType = Item.getItemProperty(sysarg, equipPtr, Item.ipItemType, 0)
	if nItemType ~= Item.itSpiritFighter then
		return -- 不是战灵装备
	end
	
	local slotItemId = 7057 + slot
	local itemId = Item.getItemProperty(sysarg, equipPtr, Item.ipItemID)
	if itemId ~= slotItemId then
		return -- 该物品不能放入这个槽位
	end
	
	local equipLevel = Item.getItemProperty(sysarg, equipPtr, Item.ipHeroDamageRate)
	if equipLevel < 0 or equipLevel > 255 then
		return
	end
	
	local isBind = Item.getItemProperty(sysarg, equipPtr, Item.ipItemBind)
	local equipExp = Item.getItemProperty(sysarg, equipPtr, Item.ipRealInjury)	
	
	if equipLevel == 0 and equipExp == 0 then -- 初始化时
		equipExp = spirit_fighter_cfg.slots[slot + 1][1].returnExp -- 0 级 (基础属性)
	end
	
	local sComment = string.format("%d,%d,%d", equipLevel, isBind, equipExp)
	if Item.removeItem(sysarg, equipPtr, 1, sComment, LogIds.SFighterDelEquipForTakeOn) < 1 then
		return
	end
	
	Actor.setSpiritFighterEquip(sysarg, slot, equipLevel, isBind, equipExp)
	Actor.collectOperate(sysarg, 0) -- 0:重新计算属性
	System.sendCommonLog(LogIds.SFighterTakeOnEquip,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),equipLevel,isBind,equipExp,tostring(slot + 1))
	
	-- 下发给前端
	local netPack = DataPack.allocPacket(sysarg, 74, 5)
	DataPack.writeByte(netPack, slot)	
	DataPack.writeByte(netPack, equipLevel)	
	DataPack.writeByte(netPack, isBind)	
	DataPack.writeUInt(netPack, equipExp)	
	DataPack.flush(netPack)
end

-- 脱下战灵装备
function TakeOffSpiritFighterEquip(sysarg, packet)
	local fighterLevel = Actor.getSpiritFighterLevel(sysarg)
	if fighterLevel == 0 then return end
	
	-- 槽位，从0开始
	local slot = DataPack.readByte(packet)
	if slot < 0 or slot > 3 then return end
	
	local isok, level, isBind, exp = Actor.getSpiritFighterEquip(sysarg, slot)
	if isok == false or (level == 0 and exp == 0) then -- 没有装备
		return
	end
	
	if Item.getBagEmptyGridCount(sysarg) <= 0 then 
        Actor.sendTipmsg(sysarg,"包裹空间不足！",ttFlyTip)
        return
    end  
    
    if not Actor.setSpiritFighterEquip(sysarg, slot, 0, 0, 0) then
    	return
    end
    
    Actor.collectOperate(sysarg, 0) -- 0:重新计算属性
    
    local itemId = 7057 + slot
    local equipPtr = Item.createItem(itemId,1,0,0,isBind)
    if equipPtr == nil then
    	Actor.setSpiritFighterEquip(sysarg, slot, level, isBind, exp)
        Actor.sendTipmsg(sysarg, "脱下战灵装备失败！", ttFlyTip)
        return
    end        
    
    local comment = string.format("%d,%d,%d,%d", slot, level, isBind, exp)
    Item.addItem(sysarg, equipPtr, comment, LogIds.SFighterTakeOffEquip)
    
    -- 要放入背包才能修改属性
    Item.setItemProperty(sysarg, equipPtr, Item.ipHeroDamageRate, level)
    Item.setItemProperty(sysarg, equipPtr, Item.ipRealInjury, exp)
    
    -- 下发给前端
	local netPack = DataPack.allocPacket(sysarg, 74, 6)
	DataPack.writeByte(netPack, slot)	
	DataPack.flush(netPack)
end

-- 回收战灵装备，返回经验值(负数为失败)
function RecoverSpiritFighterEquipReturnExp(sysarg, equipGuid)
	local equipPtr = Item.getBagItemPtrByGuid(sysarg, equipGuid)
	if equipPtr == nil then -- 背包中没有该装备
		return -1
	end
	
	local nItemType = Item.getItemProperty(sysarg, equipPtr, Item.ipItemType, 0)
	if nItemType ~= Item.itSpiritFighter then
		return -1 -- 不是战灵装备
	end
	
	-- 不同物品ID之间是可以吞噬的
	local nItemId = Item.getItemProperty(sysarg, equipPtr, Item.ipItemID)
	local itemSlot = nItemId - 7057
	if itemSlot < 0 or itemSlot > 3 then
		return -1
	end
	
	local equipLevel = Item.getItemProperty(sysarg, equipPtr, Item.ipHeroDamageRate)
	if equipLevel < 0 or equipLevel > 255 then
		return -1
	end
	
	local slotCfg = spirit_fighter_cfg.slots[itemSlot + 1]
	if slotCfg == nil then
		return -1
	end
	
	local levelCfg = slotCfg[equipLevel+1]
	if levelCfg == nil then
		return -1
	end
	
	local isBind = Item.getItemProperty(sysarg, equipPtr, Item.ipItemBind)
	local equipExp = Item.getItemProperty(sysarg, equipPtr, Item.ipRealInjury)	
		
	-- 策划说只回收等级的经验，剩下的经验不回收
	--local totalExp = levelCfg.returnExp + equipExp
	local totalExp = levelCfg.returnExp
	
	local leftExp = equipExp
	if equipLevel == 0 and equipExp == 0 then -- 初始化时
		leftExp = slotCfg[1].returnExp -- 0 级 (基础属性)
	end
	
	local sComment = string.format("%d,%d,%d,%d", nItemId, equipLevel, isBind, leftExp)
	if Item.removeItem(sysarg, equipPtr, 1, sComment, LogIds.RecoverSFighterEquip) < 1 then
		return -1
	end
	
	return totalExp
end

-- 合并战灵装备
function MergeSpiritFighterEquips(sysarg, packet)
	local fighterLevel = Actor.getSpiritFighterLevel(sysarg)
	if fighterLevel == 0 then return end
	
	-- 槽位，从0开始
	local slot = DataPack.readByte(packet)
	if slot < 0 or slot > 3 then return end
	
	local isok, level, isBind, exp = Actor.getSpiritFighterEquip(sysarg, slot)
	if isok == false or (level == 0 and exp == 0) then -- 没有装备
		return
	end
	
	local equipCount = DataPack.readByte(packet)
	if equipCount < 1 or equipCount > 4 then
		return
	end
	
	local addExp = 0
	for i = 1, equipCount do
		local equipGuid = DataPack.readUint64(packet)
		local returnExp = RecoverSpiritFighterEquipReturnExp(sysarg, equipGuid)
		if returnExp < 0 then
			break
		end
		
		addExp = addExp + returnExp		
	end
	
	if addExp == 0 then
		return
	end
	
	local newExp = exp + addExp
	local newLevel = level
	
	-- 自动升级
	while true do
		local nextLevelCfg = spirit_fighter_cfg.slots[slot + 1][newLevel + 1 + 1] -- 从 0 开始，所以要加多 1 
		if nextLevelCfg == nil or newExp < nextLevelCfg.upExp then
			break
		end
			
		newExp = newExp - nextLevelCfg.upExp
		newLevel = newLevel + 1		
	end
	
	if newExp > 2147483647 then -- 符号位用来保存是否绑定，所以最大值为 INT_MAX		
		print("error MergeSpiritFighterEquips, newExp overflow actorId="..Actor.getIntProperty(sysarg,PROP_ENTITY_ID)..",newExp="..newExp)
		newExp = 2147483647
	end
	
	Actor.setSpiritFighterEquip(sysarg, slot, newLevel, isBind, newExp)
	if level ~= newLevel then
		Actor.collectOperate(sysarg, 0) -- 0:重新计算属性
	end
	
	System.sendCommonLog(LogIds.MergeSFighterEquips,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),level,exp,newLevel,tostring(newExp),tostring(slot+1),tostring(isBind))
	
	-- 下发给前端
	local netPack = DataPack.allocPacket(sysarg, 74, 7)
	DataPack.writeByte(netPack, slot)	
	DataPack.writeByte(netPack, newLevel)	
	DataPack.writeByte(netPack, isBind)	
	DataPack.writeUInt(netPack, newExp)	
	DataPack.flush(netPack)
end
	
EventCallDispatcher.SpiritFighterOp = function (sysarg, args)
	local cmd = args[1]
	local packet = args[2]
	
	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	if nCircle < 1 then
		Actor.sendTipmsg(sysarg, string.format("转数不足1，未开启此系统"), ttFlyTip)
		return
	end
	
	if cmd == 2 then -- 升级战灵
		UpgradeSpiritFighter(sysarg, packet)
	elseif cmd == 3 then -- 设置战灵外观
		SetSpiritFighterAppearance(sysarg, packet)
	elseif cmd == 4 then -- 升级战灵潜能等级
		UpgradeSpiritFighterEnergyLevel(sysarg, packet)
	elseif cmd == 5 then -- 穿戴战灵装备
		TakeOnSpiritFighterEquip(sysarg, packet)
	elseif cmd == 6 then -- 脱下战灵装备
		TakeOffSpiritFighterEquip(sysarg, packet)
	elseif cmd == 7 then -- 合并战灵装备
		MergeSpiritFighterEquips(sysarg, packet)
	else
		print("error SpiritFighterOp, unknown cmd="..cmd)
		return
	end
	
end
