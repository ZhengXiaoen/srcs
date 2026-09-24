-- 装备槽注魂
--#include "data\config\item\EquipSlotSoulCfg.lua" once

-- 随机一个升级的槽位, 返回(槽索引(从1开始), 当前等级, 是否升完这级就到下一阶)
function EquipSlotSoul_RandSlot(sysarg)
	local levels = {0,0,0,0,0,0,0,0}
	local minLevel = 99999999
	for i = 1, 8 do
		local isok, level, exp = Actor.getSoulSlotData(sysarg, i-1)
		if not isok then
			return -1, 0, false
		end
		
		levels[i] = level				
		if level < minLevel then
			minLevel = level
		end	
	end

	local maxLevel = math.floor(minLevel/10) * 10 + 10
		
	local randList = {}
	for i = 1, 8 do
		if levels[i] < maxLevel then
			table.insert(randList, i)		
		end
	end
	
	local slotIdx = 1
	local count = #randList
	-- 是否升完这级就到下一阶
	local isLastLevel = false
	
	if count == 1 then
		local _idx = randList[1]
		if levels[_idx] + 1 == maxLevel then
			isLastLevel = true
		end
	end
	
	if count == 0 then
		slotIdx = System.getRandomNumber(8) + 1
	else	
		local idx = System.getRandomNumber(count) + 1
		slotIdx = randList[idx]
	end
	
	return slotIdx, levels[slotIdx], isLastLevel
end

-- 注入一个装备槽注魂值
function InjectEquipSlotSoulValue(sysarg)
	
	local slotIdx, slotLevel, isLastLevel = EquipSlotSoul_RandSlot(sysarg)
	if slotIdx == -1 then return -1, 0, 0, false end

	local idx = math.floor(slotLevel/10) + 1
	local consume = EquipSlotSoulCfg.upgradeConsumes[idx]
	if consume == nil then return -1, 0, 0, false end
	
	local curSoul = Actor.getSoulValue(sysarg)
	if curSoul < consume then
		return -2, 0, 0, false -- 注魂值不足
	end
	
	curSoul = curSoul - consume
	Actor.setSoulValue(sysarg, curSoul)
		
	if Actor.addSoulValue(sysarg, slotIdx-1, consume) then -- 有升级		
		Actor.collectOperate(sysarg, 0)
	end
	
	local isok, newLevel, exp = Actor.getSoulSlotData(sysarg, slotIdx-1)
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
    System.sendCommonLog(LogIds.AddSlotSoulValue,actorId,Actor.getName(sysarg),slotIdx,newLevel, curSoul, "", "注入注魂值")
    
    return slotIdx, newLevel, slotLevel, isLastLevel, consume
end

-- 提示
function EquipSlotSoul_sendTipmsg(sysarg, slotIdx, newLevel, oldLevel, isLastLevel, addExp)
	local n = math.floor(newLevel/10) + 1
	local lvl = math.mod(newLevel, 10)
	if lvl == 0 and newLevel > 0 then
		if n > 1 then n = n - 1 end
		
		lvl = 10
	end
		
	local classNames = {"黄阶", "玄阶", "地阶", "天阶", "神阶"}
	local nName = classNames[n]
	if nName == nil then nName = n .. "阶" end

	-- 提示
	--if isLastLevel and newLevel > oldLevel then -- 升阶		
	--	Actor.sendTipmsg(sysarg, "注魂升至"..n.."阶", ttFlyTip)		
	--	
	--	local msg = string.format("[%s]将注魂成功升至%s！<我也要去/@@showWin,1,5>", Actor.getName(sysarg), nName)
	--	System.broadcastTipmsg(msg, ttChatWindow)
	--else
		local slotNames = {"武器", "衣服", "头盔", "项链", "手镯", "戒指", "腰带", "鞋子"}		
		if newLevel == oldLevel then
			local msg1 = string.format("成功为[%s]注入%d注魂", slotNames[slotIdx], addExp)
			Actor.sendTipmsg(sysarg, msg1, ttFlyTip)
		else -- 有升级
			local msg1 = string.format("成功为[%s]注入%d注魂，升至%s%d星", slotNames[slotIdx], addExp, nName, lvl)
			Actor.sendTipmsg(sysarg, msg1, ttFlyTip)
			
			if lvl >= 5 then
				local msg2 = string.format("[%s]将[%s]成功升至%s%d星！<我也要去/@@showWin,5,4>", Actor.getName(sysarg), slotNames[slotIdx], nName, lvl)
				System.broadcastTipmsg(msg2, ttChatWindow)
			end
		end		
	--end
end

-- 注入
function handleEquipSlotSoul_Inject(sysarg)
	local slotIdx, newLevel, oldLevel, isLastLevel, addExp = InjectEquipSlotSoulValue(sysarg)
	if slotIdx <= 0 then
		if slotIdx == -2 then
			Actor.sendTipmsg(sysarg, "注魂值不足", ttFlyTip)
		end
		return
	end
	
	-- 提示
	EquipSlotSoul_sendTipmsg(sysarg, slotIdx, newLevel, oldLevel, isLastLevel, addExp)
	
	-- 发送给前端
	local isok, level, exp = Actor.getSoulSlotData(sysarg, slotIdx-1)
	if not isok then return end

	local netPack = DataPack.allocPacket(sysarg, 66, 3) -- 下发槽数据
	DataPack.writeByte(netPack, 1) -- 数量为1
				
	DataPack.writeByte(netPack, slotIdx-1) -- 从0开始
	DataPack.writeByte(netPack, level)
	DataPack.writeUInt(netPack, exp)

	DataPack.flush(netPack)	
end

-- 前端实现了
-- 自动注入(直到下一阶)
--[[
function handleEquipSlotSoul_AutoInject(sysarg)
	
	local slotFlags = {false, false, false, false, false, false, false, false}
	local changeCount = 0
	
	while true do		
		local slotIdx, newLevel, oldLevel, isLastLevel, addExp = InjectEquipSlotSoulValue(sysarg)
		if slotIdx <= 0 then break end
		
		-- 提示
		EquipSlotSoul_sendTipmsg(sysarg, slotIdx, newLevel, oldLevel, isLastLevel, addExp)
		
		if slotFlags[slotIdx] == false then
			slotFlags[slotIdx] = true
			changeCount = changeCount + 1
		end
		
		if isLastLevel and newLevel > oldLevel then -- 到了下一阶则返回
			break
		end
	end
	
	if changeCount == 0 then return end
	
	-- 发送给前端
	local netPack = DataPack.allocPacket(sysarg, 66, 3) -- 下发槽数据
	DataPack.writeByte(netPack, changeCount)	
	
	for i, v in ipairs(slotFlags) do
		if v == true then
			local isok, level, exp = Actor.getSoulSlotData(sysarg, i-1)
			DataPack.writeByte(netPack, i-1) -- 从0开始
			DataPack.writeByte(netPack, level)
			DataPack.writeUInt(netPack, exp)
		end
	end
			
	DataPack.flush(netPack)	
	
end
--]]

-- 等级兑换注魂值
function handleEquipSlotSoul_Exchange(sysarg)
	
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if actorLevel < EquipSlotSoulCfg.exchangeLevel then
		Actor.sendTipmsg(sysarg, string.format("需要等级达到%d",EquipSlotSoulCfg.exchangeLevel), ttFlyTip)
		return
	end
	
	local idx = actorLevel - EquipSlotSoulCfg.exchangeLevel + 1
	local addSoul = EquipSlotSoulCfg.exchangeSoulList[idx]
	if addSoul == nil then
		print("config error EquipSlotSoulCfg.exchangeSoulList["..idx.."]==nil")
		return
	end
	
	Actor.setIntProperty(sysarg, PROP_CREATURE_LEVEL, actorLevel-1)
	
	local curSoul = Actor.getSoulValue(sysarg)
	curSoul = curSoul + addSoul
	Actor.setSoulValue(sysarg, curSoul)
	
	Actor.collectOperate(sysarg, 0) -- 等级改变要重新计算属性
	
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
    System.sendCommonLog(LogIds.LevelExchangeSoul,actorId,Actor.getName(sysarg),0,curSoul-addSoul, curSoul, "等级兑换注魂")
	System.sendCommonLog(500,actorId,Actor.getName(sysarg),0,actorLevel,actorLevel-1, "等级兑换注魂")
            
	Actor.sendTipmsg(sysarg, "兑换成功，获得注魂"..addSoul, ttFlyTip)
	
	-- 发送给前端
	local netPack = DataPack.allocPacket(sysarg, 66, 2) -- 下发当前魂值	
	DataPack.writeUInt(netPack, curSoul)		
	DataPack.flush(netPack)	
        --更新排行榜
	local newpos, oldpos = System.rankingUpdateValue(0, sysarg, actorLevel-1, actorLevel)
end

function handleEquipSlotSoulOp(sysarg,args)
	local opType = args[1]
	
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if actorLevel < EquipSlotSoulCfg.openLevel then
		Actor.sendTipmsg(sysarg, string.format("等级不足%d，未开启此系统",EquipSlotSoulCfg.openLevel), ttFlyTip)
		return
	end
	
	if opType == 1 then
		handleEquipSlotSoul_Inject(sysarg)
	elseif opType == 2 then
		--handleEquipSlotSoul_AutoInject(sysarg) -- 前端实现了
	elseif opType == 3 then
		handleEquipSlotSoul_Exchange(sysarg)
	end
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEquipSlotSoulOp,handleEquipSlotSoulOp)