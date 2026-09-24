-- 时装
--#include "data\config\modules\fashion_dress_cfg.lua" once

function FashionDress_GetDressConfig(itemId, job)
	for i, dressCfg in ipairs(fashion_dress_cfg.dress_list) do
		if dressCfg[job].itemId == itemId then
			return dressCfg[job]
		end
	end
	
	return nil
end

-- 升级时装, level 等于 -1 则激活
function handleFashionDress_Upgrade(sysarg, itemId, level, bindFlag)	
	if bindFlag == nil then bindFlag = -1 end
	local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)	
	local dressCfg = FashionDress_GetDressConfig(itemId, job)
	if dressCfg == nil or dressCfg.upgradeItemCounts == nil then return -1 end
	
	local nextLevel = level + 1
	local upgradeCount = dressCfg.upgradeItemCounts[nextLevel + 1]
	if upgradeCount == nil then return -1 end
	
	-- 时装时否到了升阶
	local isUpgradeClass = false
	if level < 0 or math.mod(level, 11) == 10 then
		isUpgradeClass = true
	end
	
	local upgradeItemId = 0	
	if isUpgradeClass then -- 升阶
		upgradeItemId = dressCfg.itemId
	else -- 升星
		upgradeItemId = dressCfg.upgradeItemId
	end
	
	local itemCount = Actor.getItemCount(sysarg, upgradeItemId)
	if itemCount < upgradeCount then		
		Actor.sendTipmsg(sysarg, "需要"..Item.getItemName(upgradeItemId).."*"..upgradeCount,ttFlyTip)
		return
	end
	
	local classNumber = math.floor(nextLevel/11) + 1 -- 几阶
	local startNumber = math.mod(nextLevel, 11) -- 几星
	
	local logComment = tostring(itemId)
	logComment = logComment .. "," .. tostring(classNumber) .. "," .. tostring(startNumber)
	local removeCount = Actor.removeItem(sysarg, upgradeItemId, upgradeCount,-1,-1,bindFlag,logComment,LogIds.FashionDressUpgrade)
	if removeCount < upgradeCount then
		return -1
	end	
	
	-- 提示
	local dressName = Item.getItemName(itemId)	
	
	if level < 0 then
		Actor.sendTipmsg(sysarg, dressName .. "激活成功", ttFlyTip)
		
		local noticeStr = string.format("<(n%s)>成功激活%s！<我也要去/@@showWin,1,5>",Actor.getName(sysarg),dressName)
		System.broadcastTipmsg(noticeStr, ttChatWindow)	
	else
		Actor.sendTipmsg(sysarg, string.format("%s升至%d阶%d星", dressName, classNumber, startNumber), ttFlyTip)

		if isUpgradeClass then
			local noticeStr = string.format("恭喜<(n%s)>玩家将<(c0xFFFF0000)%s>突破至%d阶！<我也要突破/@@showWin,1,5>",Actor.getName(sysarg),dressName,classNumber)
			--print(noticeStr)
			System.broadcastTipmsg(noticeStr, ttChatWindow)	
		end
	end
	
	return nextLevel
end

function handleFashionDressOp(sysarg,args)
	local opType = args[1]
	
	local nCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
	if nCircle < 1 then
		Actor.sendTipmsg(sysarg, string.format("转数不足1，未开启此系统"), ttFlyTip)
		return
	end
	
	if opType == 1 then
		return handleFashionDress_Upgrade(sysarg, args[2], args[3], args[4])	
	end
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeFashionDressOp,handleFashionDressOp)