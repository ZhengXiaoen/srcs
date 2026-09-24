
--#include "data\config\NpcMiscCfg\EquipRecyclingCfg.lua" once

--装备换金

NpcDialog[405] = {}
NpcDialog[405].main = function(sysarg)	
	 return NpcDialog[405].ShowMainUI(sysarg)
end

NpcDialog[405].ShowMainUI = function(sysarg)
	local openDay = System.getDaysSinceOpenServer()
	if openDay < 1 then return "开服第一天开启" end
	
	local echo =  [[
      <(c0xFFeabc78)装备换金可获得金票奖励，名额有限速领>
]]	
		
	if openDay <= 7 then
		echo = echo .. "\\<(c0xFFeabc78)首杀BOSS换金，奖励以邮件形式发送（新服前7天活动）>" -- 标题
		echo = echo .. "\\	<BOSS首杀 (1-2转)/@showBossFirstKillUI,1>"
		echo = echo .. "\\	<BOSS首杀 (3转)/@showBossFirstKillUI,2>"
		echo = echo .. "\\	<BOSS首杀 (4-13转)/@showBossFirstKillUI,3>"
		
		echo = echo .. "<(idecoLine#350)>"
	end
			
	for i, v in ipairs(EquipRecyclingCfg.groupList) do
		local _open_day = v.open_day
		if _open_day == nil then _open_day = -1 end
		
		if _open_day == -1 or openDay <= _open_day then
			local strItem = ""
			if i >= 1 and i <= 3 then -- 装备回收
				if i == 1 then -- 标题
					strItem = "<(c0xFFeabc78)套装换金（新服前7天活动）>"
				end
				
				strItem = strItem .. string.format("\\	<%s/@showEquipRecyclingUI,%d>", v.title, i)
								
				if i == 3 then
					strItem = strItem .. "<(idecoLine#350)>"
				end
			else
				if i == 4 then -- 标题
					strItem = "<(c0xFFeabc78)单件换金（名额领取完后结束）>"
				end
				
				local hdr
				if math.mod(i - 3, 3) == 1 then
					hdr = "\\	"
				else
					hdr = "\t"
				end
				
				strItem = strItem .. string.format("%s<%s/@showEquipRecyclingUI,%d>", hdr, v.title, i)							
			end
			echo = echo .. strItem
		end
	end

	return echo
end

-- 显示 BOSS 首杀 UI
NpcDialog[405].showBossFirstKillUI = function(sysarg, index)
	index = tonumber(index)
	
	local openDay = System.getDaysSinceOpenServer()
	if openDay < 1 or openDay > 7 then return "<返回/@ShowMainUI>" end
	
	local echo =  [[
<返回/@ShowMainUI>
<(c0xFF00c0ff)BOSS			奖励		首杀玩家>]]

	local bossList = EquipRecyclingCfg.firstKillBossList[index]
	if bossList == nil then return echo end

	local sysVar = System.getStaticVar()
	local firstKillList = sysVar.OpenSeverBossFirstKills
	if firstKillList == nil then firstKillList = {} end

	for _, v in ipairs(bossList) do
		local actorName = firstKillList[v.bossId]
		if actorName == nil then actorName = "未首杀" end
		
		local strItem = string.format("\\<(c0xFFb6946c)%s\t\t%s\t\t%s>", v.bossName, v.awardString, actorName)
		echo = echo .. strItem
	end

	return echo
end

-- 显示装备回收 UI
NpcDialog[405].showEquipRecyclingUI = function(sysarg, index)
	index = tonumber(index)
		
	local groupCfg = EquipRecyclingCfg.groupList[index]
	if groupCfg == nil then return "<返回/@ShowMainUI>" end
	
	local _open_day = groupCfg.open_day
	if _open_day ~= nil and _open_day ~= -1 then
		local openDay = System.getDaysSinceOpenServer()
		if openDay < 1 or openDay > _open_day then return "<返回/@ShowMainUI>" end
	end
		
	local echo =  [[
<返回/@ShowMainUI>
<(c0xFF00c0ff)装备		奖励		领取状态(剩余名额)>]]

	local sysVar = System.getStaticVar()	
	local quotaList = nil -- 名额列表
	if sysVar.EquipRecyclingQuotaList ~= nil then
		quotaList = sysVar.EquipRecyclingQuotaList[index]
	end
	
	local bagItems = nil
	local isContainSuit = NpcDialog[405].isContainSuit
	
	for i, v in ipairs(groupCfg.list) do
		local leftQuota = -1
		local leftQuotaStr = "不限"
		if v.quota >= 0 then
			local quota = 0
			if quotaList ~= nil then
				quota = quotaList[i]
				if quota == nil then quota = 0 end		
			end
			
			leftQuota = v.quota - quota
			if leftQuota < 0 then leftQuota = 0 end
			
			leftQuotaStr = tostring(leftQuota)
		end
		
		local getStr = nil -- 领取字符串
		if leftQuota == 0 then -- 没有名额了
			getStr = "<(c0xFF888888)领取>"
		else
			if bagItems == nil then
				bagItems = NpcDialog[405].getActorBagItems(sysarg)
			end		
		
			local hasSuit = isContainSuit(bagItems, v.itemList)			
			
			if hasSuit then		
				getStr = string.format("<领取/@recycleEquip,%d,%d>", index, i)
			else -- 不能领取
				getStr = "<(c0xFF888888)领取>"
			end	
		end
				
		local strItem = string.format("\\<(c0xFFb6946c)%s\t\t%s>\t%s<(c0xFF00ff00)(%s)>", v.name, v.awardString, getStr, leftQuotaStr) 		
		
		echo = echo .. strItem
	end

	return echo
end

NpcDialog[405].getActorBagItems = function(sysarg)
	local bagItems = {}
	
	local count = Item.getBagItemCount(sysarg)
	if count <= 0 then return bagItems end
		
	for i = 0, (count - 1) do
		local itemPtr = Item.getItemPtrByIndex(sysarg, i)
		if itemPtr ~= nil then
			local itemId = Item.getItemId(itemPtr)
			local itemCount = Item.getItemProperty(sysarg, itemPtr, Item.ipItemCount, 0)
			if itemId > 0 and itemCount > 0 then
				local oldCount = bagItems[itemId]
				if oldCount == nil then
					bagItems[itemId] = itemCount
				else
					bagItems[itemId] = oldCount + itemCount
				end
			end
		end
	end	
	
	return bagItems
end

NpcDialog[405].isContainSuit = function(bagItems, itemList)
	if next(bagItems) == nil then -- 空表
		return false
	end
	
	for _, v in ipairs(itemList) do
		local _type = type(v)
		if _type == "number" then
			if bagItems[v] == nil then
				return false
			end
		elseif _type == "table" then -- 只要一个就可以了
			local found = false
			for _, v2 in ipairs(v) do
				if bagItems[v2] ~= nil then
					found = true
					break
				end
			end
			
			if not found then
				return false
			end
		end
	end
	
	return true
end

NpcDialog[405].recycleEquip = function(sysarg, groupIndex, index)
	groupIndex = tonumber(groupIndex)
	index = tonumber(index)	
		
	local groupCfg = EquipRecyclingCfg.groupList[groupIndex]
	if groupCfg == nil then return end
	
	local _open_day = groupCfg.open_day
	if _open_day ~= nil and _open_day ~= -1 then
		local openDay = System.getDaysSinceOpenServer()
		if openDay < 1 or openDay > _open_day then return "<返回/@ShowMainUI>" end
	end
	
	local itemCfg = groupCfg.list[index]
	if itemCfg == nil then return end
	
	if not Awards.CheckBagGridCount(sysarg, itemCfg.award) then
		return 
	end
	
	if itemCfg.quota == 0 then
		return
	end
	
	local sysVar = System.getStaticVar()
	if sysVar.EquipRecyclingQuotaList == nil then
		sysVar.EquipRecyclingQuotaList = {}
	end
	
	local quotaList = sysVar.EquipRecyclingQuotaList[groupIndex] -- 名额列表		
	
	if itemCfg.quota >= 0 then	
		if quotaList ~= nil then		
			local quota = quotaList[index]
			if quota ~= nil and quota >= itemCfg.quota then	
				Actor.sendTipmsg(sysarg, "道具不足", ttFlyTip)
				return -- 没有名额了
			end
		end		
	end
	
	local canRecycle = true
	for _, v in ipairs(itemCfg.itemList) do
		local _type = type(v)
		if _type == "number" then
			if not Actor.hasItem(sysarg, v, -1, -1, -1) then
				canRecycle = false
				break
			end
		elseif _type == "table" then -- 只要一个就可以了
			local found = false
			for _, v2 in ipairs(v) do
				if Actor.hasItem(sysarg, v2, -1, -1, -1) then
					found = true
					break
				end
			end
			
			if not found then
				canRecycle = false
				break
			end
		end
	end
	
	if not canRecycle then -- 物品不足
		Actor.sendTipmsg(sysarg, "道具不足", ttFlyTip)
		return
	end
	
	for _, v in ipairs(itemCfg.itemList) do
		local _type = type(v)
		if _type == "number" then
			if Actor.removeItem(sysarg, v, 1, -1, -1, -1, tostring(index), LogIds.npcEquipRecycling) < 1 then
				print(string.format("error, NpcDialog[405].recycleEquip 1 actorId=%d, %d, %d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID), groupIndex, index))
				return
			end
		elseif _type == "table" then -- 只要一个就可以了
			local removeOk = false
			for _, v2 in ipairs(v) do
				if Actor.removeItem(sysarg, v2, 1, -1, -1, -1, tostring(index), LogIds.npcEquipRecycling) >= 1 then
					removeOk = true
					break
				end
			end
			
			if not removeOk then
				print(string.format("error, NpcDialog[405].recycleEquip 2 actorId=%d, %d, %d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID), groupIndex, index))
				return
			end
		end
	end
	
	local logStr = string.format("%d,%d", groupIndex, index)
	Awards.GiveNoCheck(sysarg, itemCfg.award, LogIds.npcEquipRecyclingAward, logStr)
	
	if itemCfg.quota >= 0 then
		if quotaList == nil then
			sysVar.EquipRecyclingQuotaList[groupIndex] = {}
			quotaList = sysVar.EquipRecyclingQuotaList[groupIndex]
		end
		
		local oldQuota = quotaList[index]
		if oldQuota == nil then	oldQuota = 0 end
		quotaList[index] = oldQuota + 1
	end
		
	Actor.sendTipmsg(sysarg, "装备回收成功", ttFlyTip)
end
