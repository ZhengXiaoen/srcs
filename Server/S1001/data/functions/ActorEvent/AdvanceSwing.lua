-- 翅膀幻羽
--#include "data\config\item\AdvanceSwingCfg.lua" once

function ReturnAdvanceSwingOPResult(sysarg, opType, swingIdx, result, classValue, level)
	local netPack = DataPack.allocPacket(sysarg, 52, 5)
	
	DataPack.writeByte(netPack, opType) -- 1升级, 2升阶
	DataPack.writeByte(netPack, swingIdx) -- 前端传来的值
	DataPack.writeByte(netPack, result)	-- 操作结果(0为失败; 1为成功)
	DataPack.writeByte(netPack, classValue)
	DataPack.writeByte(netPack, level)
	
	DataPack.flush(netPack)
end

-- 升级
function AdvanceSwingUpgradeLevel(sysarg, swingIdx, curClass, curLevel)
	-- swingIdx 从1开始
	if swingIdx < 1 then return end
	
	if curClass == 0 then
		Actor.sendTipmsg(sysarg,"请先激活",ttFlyTip)
		return
	end
	
	-- 每一阶的最高等级
	local maxLevel = AdvanceSwingCfg.classMaxLevels[curClass]
	if maxLevel == nil or curLevel >= maxLevel then
		Actor.sendTipmsg(sysarg,"当前阶已升级到最高等级",ttFlyTip)
		return
	end
	
	local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	
	local swingCfg = AdvanceSwingCfg.swingList[swingIdx]
	if swingCfg == nil then return end
	
	-- 配置的最高等级
	maxLevel = #swingCfg.levelAttrs[job]
	if curLevel >= maxLevel then
		Actor.sendTipmsg(sysarg,"当前阶已升级到最高等级",ttFlyTip)
		return
	end
	
	local consumeItemCount = swingCfg.levelConsumeCounts[curLevel + 1]
	if consumeItemCount == nil then return end
	
	local crystalItemId = AdvanceSwingCfg.swingCrystalItemId
	
	local itemCount = Actor.getItemCount(sysarg, crystalItemId)
	if itemCount < consumeItemCount then		
		Actor.sendTipmsg(sysarg, Item.getItemName(crystalItemId).."不足",ttFlyTip)
		return
	end
	
	local logComment = swingIdx .. "," .. curClass .. "," .. (curLevel+1)
	local removeCount = Actor.removeItem(sysarg, crystalItemId, consumeItemCount,-1,-1,-1,logComment,LogIds.advanceSwingUpgradeLevel)
	if removeCount < consumeItemCount then
		return
	end	
	
	Actor.setAdvanceSwingLevel(sysarg, swingIdx, curLevel + 1)
		
	Actor.collectOperate(sysarg,0)	

	local swingName = Item.getItemName(swingCfg.itemId)
	local noticeStr = string.format("恭喜玩家<(c0xFF00FF00)%s><(c0xFFFFFF00)将羽化翅膀><(c0xFF00FF00)%s%d阶><(c0xFFFFFF00)飞升到><(c0xFF00FF00)+%d><我也去看看/@@showWin,110,1>", Actor.getName(sysarg), swingName, curClass, curLevel+1)
	System.broadcastTipmsg(noticeStr, ttChatWindow)
	
	ReturnAdvanceSwingOPResult(sysarg, 1, swingIdx, 1, curClass, curLevel + 1)
end

-- 升阶
function AdvanceSwingUpgradeClass(sysarg, swingIdx, curClass, curLevel)
	-- swingIdx 从1开始
	if swingIdx < 1 then return end	
	
	local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	
	local swingCfg = AdvanceSwingCfg.swingList[swingIdx]
	if swingCfg == nil then return end
	
	local maxClass = #swingCfg.classAttrs[job]
	if maxClass == nil or curClass >= maxClass then
		Actor.sendTipmsg(sysarg,"已升级到最高阶",ttFlyTip)
		return
	end
	
	local consumeSwingCount = swingCfg.classConsumeCounts[curClass + 1]
	if consumeSwingCount == nil then return end
	
	local itemCount = Actor.getItemCount(sysarg, swingCfg.itemId)
	if itemCount < consumeSwingCount then
		if curClass == 0 then
			Actor.sendTipmsg(sysarg, "材料不足，无法激活翅膀！",ttFlyTip)
		else
			Actor.sendTipmsg(sysarg, "材料不足，无法幻羽翅膀！",ttFlyTip)
		end
		
		return
	end
	
	local logComment = swingIdx .. "," .. (curClass+1)
	local removeCount = Actor.removeItem(sysarg, swingCfg.itemId, consumeSwingCount,-1,-1,-1,logComment,LogIds.advanceSwingUpgradeClass)
	if removeCount < consumeSwingCount then
		return
	end	
	
	Actor.setAdvanceSwingClass(sysarg, swingIdx, curClass + 1)
		
	Actor.collectOperate(sysarg,0) -- 重新计算属性
	Actor.collectOperate(sysarg,1) -- 刷新外观
	
	local noticeStr
	
	local swingName = Item.getItemName(swingCfg.itemId)
	if curClass == 0 then
		noticeStr = string.format("恭喜玩家<(c0xFF00FF00)%s><(c0xFFFFFF00)成功将幻羽><(c0xFF00FF00)%s>激活!<我也要激活/@@showWin,110,1>", Actor.getName(sysarg), swingName)
	else		
		noticeStr = string.format("恭喜玩家<(c0xFF00FF00)%s><(c0xFFFFFF00)将幻羽翅膀升至><(c0xFF00FF00)%d阶%s><我也去看看/@@showWin,110,1>", Actor.getName(sysarg), curClass+1, swingName)
	end	
	System.broadcastTipmsg(noticeStr, ttChatWindow)
	
	ReturnAdvanceSwingOPResult(sysarg, 2, swingIdx, 1, curClass + 1, curLevel)
end
