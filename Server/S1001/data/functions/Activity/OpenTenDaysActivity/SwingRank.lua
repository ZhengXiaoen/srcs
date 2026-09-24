--lua script
--#include "data\language\LangCode.txt" once   --语言包
--#include "data\config\activityconfig\OpenServerTenDays\OpenServerConfig.lua" once
--#include "data\config\item\SwingEquip.lua" once

--第四天 第一翅膀
function PreBroadSwingNotice()
	System.broadcastTipmsg(Lang.Activity.k00001,2+128)
end

--18点前的播报
function BroadSwingTopicMsgOnTime()
	System.broadcastTipmsg(Lang.Activity.k00002,2+128)
end

--全民活动播报
function ThdWhloeActivityNotice()
	System.broadcastTipmsg(Lang.Activity.k00027,2+128)
end

--19点后的播报
function BroadLeadSwingName()
	System.broadSwingTopicMsg(0)
end

--播报信息
function OnBroadLeadSwingMsg()
	local nHoure,nMin,nSec = System.getTime(0,0,0)
	if nHoure >=23 then
		EndSwingLevelTopicMsg()
	end
	local RankNameList = Ranking.getRanking(OpenServerConfig.activitys[2].rankName)

	if RankNameList ~= nil then
		local str1 = ""
		local str2 = ""
		local str3 = ""
		
		for i=0,2 do
			local nItemId = 0
			local sName
			local pItem = Ranking.getItemFromIndex(RankNameList,i)
			local itemName
			if pItem then
				if i == 0 then
					sName = Ranking.getSub(pItem,0)
					nItemId = tonumber(Ranking.getSub(pItem,1))
					if nItemId > 0 then
						itemName = Item.getItemName(nItemId)
						str1 = "<(n"..sName..")>,"..itemName
					end
				elseif i == 1 then
					sName = Ranking.getSub(pItem,0)
					nItemId = tonumber(Ranking.getSub(pItem,1))
					if nItemId > 0 then
						itemName = Item.getItemName(nItemId)
						str2 =  " <(n"..sName..")>,"..itemName
					end
				elseif i == 2 then
					sName = Ranking.getSub(pItem,0)
					nItemId = tonumber(Ranking.getSub(pItem,1))
					if nItemId > 0 then
						itemName = Item.getItemName(nItemId)
						str3 =  " <(n"..sName..")>"..Item.getItemName(nItemId)
					end
				end
			end
		end
		local str = str1..str2..str3
		
		local tmpStr = ""
		if nHoure >= 19  and nHoure <22 then
			tmpStr = string.format(Lang.Activity.k00003,str)
			System.broadcastTipmsg(tmpStr,2+128)
		elseif nHoure < 23 then
			tmpStr = string.format(Lang.Activity.k00004,str)
			System.broadcastTipmsg(tmpStr,2+128)
		end
	end
end


--结算后处理
function AccountSwingTpoicActivity()
	--System.broadSwingTopicMsg(0)
	--[[local var = System.getStaticVar()
	if not var.TopSwing then return end
	local nActorId = var.TopSwing.actorid
	if nActorId == nil then return end--]]
	--System.sendTopOfflineAward(OpenServerConfig.activitys[4].openDays,OpenServerConfig.activitys[4].needValue,nActorId,1185,39)
	--System.onAccountAllActivity(OpenServerConfig.activitys[4].openDays,OpenServerConfig.activitys[4].needValue)		--全民活动结算
	System.onAccountAllActivity(10,0)
	System.onAccountAllActivity(11,0)
	System.onAccountAllActivity(12,0)
	System.broadcastTipmsg(Lang.Activity.k00023,2+128)
	System.finishTenDaysToFile(6)
	BroadBrationEffect()

end

--播放庆典烟花
function BroadSwingEndEffect()
	System.broadcastTipmsg(Lang.Activity.k00006,2+128)
	local playerList = LuaHelp.getAllActorList()		
	if playerList ~= nil then
		local awardConfig = OpenServerConfig.activitys[2].AddBuff[1]
		for j = 1, #playerList do
			local player = playerList[j]
			if player then
				Actor.addBuff(player,awardConfig.buffType,awardConfig.buffGroup,awardConfig.value,awardConfig.times,awardConfig.interval,awardConfig.buffName)
			end
		end
	end
end

--获取当前阶数
function GetCurSwingEquipLevel(id)
	for i1, v1 in ipairs(SwingEquipConfig.SwingEquipTable) do
		if v1.id == id then
			return i1
		end
	end
	return 0
end	

function sortSwingfunc(a, b)
	return a.swingLevel > b.swingLevel or (a.swingLevel == b.swingLevel and a.swingExp > b.swingExp)
end

function UpSwingLevelGiveTips(sysarg)
	
	if System.getActivityFinishDays(6) > 0 then return end
	if System.getDaysSinceOpenServer() > 6 then return end
	local nHour,nMin,nSec = System.getTime(0,0,0)
	if System.getDaysSinceOpenServer() == 6 and nHour >= 23 then return end

	local var = System.getStaticVar()
	local sName = Actor.getName(sysarg)
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local nCurSwingLevel = GetCurSwingEquipLevel(Actor.getIntProperty(sysarg,PROP_ACTOR_SWINGID))
	local nCurSwingExp = Actor.getIntProperty(sysarg,PROP_ACTOR_SWING_EXP)
	
	local IsInList = false
	if not var.TopSwing then
		var.TopSwing = {}
	end
	
	List = var.TopSwing
	for k = 1, 3 do
		--空位置,直接放入数据
		if not List[k] then
			List[k] = {}
			List[k].actorid = nActorId
			List[k].name = sName
			List[k].swingLevel = nCurSwingLevel
			List[k].swingExp = nCurSwingExp
			IsInList = true
			break
		end
		
		--不是空看看是不是角色
		if List[k].actorid == nActorId then
			--找到后更新数据
			List[k].swingLevel = nCurSwingLevel
			List[k].swingExp = nCurSwingExp
			
			IsInList = true
			break
		end
	end

	if not IsInList then
		--没查找到,对比最小的,如果大于,就直接替换
		--print(List[3].value, nCurChopLevel)
		if List[3].swingLevel < nCurSwingLevel or (List[3].swingLevel == nCurSwingLevel and List[3].swingExp < nCurSwingExp) then
			List[3].actorid = nActorId
			List[3].name = sName
			List[3].swingLevel = nCurSwingLevel
			List[3].swingExp = nCurSwingExp
			
			IsInList = true
		end
	end
	
	--没有变化或者数组大小为1,不用排序
	if not IsInList or 1 == #List then
		return List
	end

	--重新排序
	local Tmp = {}
	
	for k = 1, 3 do
		if nil == List[k] then
			break
		end
		
		local TmpData = {}
		TmpData.actorid = List[k].actorid
		TmpData.name = List[k].name
		TmpData.swingLevel = List[k].swingLevel
		TmpData.swingExp = List[k].swingExp

		table.insert(Tmp, TmpData)
	end

	table.sort(Tmp, sortSwingfunc)
	
	--排序完赋值回去
	for k, v in pairs(Tmp) do
		var.TopSwing[k].actorid = v.actorid
		var.TopSwing[k].name = v.name
		var.TopSwing[k].swingLevel = v.swingLevel
		var.TopSwing[k].swingExp = v.swingExp
	end	
end