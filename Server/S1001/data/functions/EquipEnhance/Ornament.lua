-- 饰品锤炼
--#include "data\config\item\OrnamentCfg.lua" once

--饰品锤炼
function OrnamentUpgrade( sysarg, args )
	local ptrCount = args[1]	--指针数量(0, 不需要指针)
	local opType = args[2]		--操作类型
	local paraCount = args[3]	--参数数量	
	if paraCount ~= 1 then return end
	
	-- 从 1 开始
	local slotIdx = args[4]	
	if slotIdx < 1 or slotIdx > 4 then return end
	
	local slotCfg = OrnamentCfg.Slots[slotIdx]
	if slotCfg == nil then return end
	
	local pos_list = {itEarringPos, itShoulderPadsPos, itElbowPadsPos, itKneecapPos}
		
	local equipItem_ptr = Item.getEquipByPos(sysarg, pos_list[slotIdx])
	if equipItem_ptr == nil then
		Actor.sendTipmsg(sysarg,"请佩戴饰品锤炼",ttFlyTip)
		return
	end
	
	--local itemId = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemID)
	
	local itemType = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemType)
	if itemType < 20 or itemType > 23 then
		return
	end
	
	local useType = Item.getItemProperty(sysarg,equipItem_ptr,Item.ipItemUseType)
	if useType <= 0 then return end
	
	local maxLevel = OrnamentCfg.MaxLevels[useType]
	if maxLevel == nil then return end	
	
	local levelValue = Actor.getUIntProperty(sysarg,PROP_ACTOR_SOUL2) -- 通灵境界2(饰品锤炼)
	local curLevel = System.getIntByte(levelValue, slotIdx - 1)
		
	if curLevel >= maxLevel then
		Actor.sendTipmsg(sysarg,"佩戴的该装备已升级到最高等级",ttFlyTip)
		return
	end
	
	local newLevel = curLevel + 1
	local levelCfg = slotCfg.Levels[newLevel]
	if levelCfg == nil then
		Actor.sendTipmsg(sysarg,"已升级到最高等级",ttFlyTip)
		return
	end
	
	local consumes = levelCfg.consumes
	local money = consumes[2]
	local moneyType = nil
	
	local myMoney = Actor.getMoneyCount(sysarg, mtBindCoin)
	if myMoney >= money then
		moneyType = mtBindCoin
	else
		myMoney = Actor.getMoneyCount(sysarg, mtCoin)
		if myMoney >= money then
			moneyType = mtCoin
		end
	end
		
	if moneyType == nil then -- 金钱不足
		Actor.sendTipmsg(sysarg,"金钱不足",ttFlyTip)
		return
	end
	
	local itemCount = Actor.getItemCount(sysarg, OrnamentCfg.consumeItemId)
	if itemCount < consumes[1] then		
		Actor.sendTipmsg(sysarg, Item.getItemName(OrnamentCfg.consumeItemId).."不足",ttFlyTip)
		return
	end
	
	local slotNames = {"吊坠", "护肩", "面甲", "护膝"}
	
	local logComment = slotNames[slotIdx].."to "..newLevel
	local removeCount = Actor.removeItem(sysarg, OrnamentCfg.consumeItemId, consumes[1],-1,-1,-1,logComment,LogIds.OrnamentUpgrade)
	if removeCount < consumes[1] then
		return
	end	
	
	if not Actor.changeMoney(sysarg, moneyType, -money, LogIds.OrnamentUpgrade, logComment)	then
		return
	end
	
	levelValue = System.setIntByte(levelValue, slotIdx - 1, newLevel)
	Actor.setUIntProperty(sysarg,PROP_ACTOR_SOUL2, levelValue)
	Actor.collectOperate(sysarg,0)
	
	local fmt = "<(n%s)><(c0xFFFFFF00)将><(c0xFF00FF00)%s><(c0xFFFFFF00)锤炼至><(c0xFF00FF00)+%d><(c0xFFFFFF00)!><我也要锤炼/@@showWin,5>"	
	local actorName = Actor.getName(sysarg)		
	local noticeStr = string.format(fmt, actorName, slotNames[slotIdx], newLevel)
	System.broadcastTipmsg(noticeStr, ttChatWindow)
	
	return true
end