--lua script
--#include "data\language\LangCode.txt" once   --语言包

--第二天 第一神器 （烟花）
--结束活动 23点结算
function EndFirstWeaponActivty()
	local var = System.getStaticVar()
	if not var.NewServerTopWeapon then	return end	
	for i=1,2 do
		local nActorId = var.NewServerTopWeapon[i].actorid
		System.sendTopOfflineAward(OpenServerConfig.activitys[2].openDays,OpenServerConfig.activitys[2].needValue,nActorId,1183,39)
	end
	System.onAccountAllActivity(OpenServerConfig.activitys[2].openDays,OpenServerConfig.activitys[2].needValue)
	System.broadcastTipmsg(Lang.Activity.k00023,2+128)
	System.finishTenDaysToFile(2)
	BroadBrationEffect()
end

--新区第二天活动,nType:1 时装 2 神器,nLevel 对应的等级
function UpdateNewServerTwoDay(sysarg,nType,nLevel)
	if System.getActivityFinishDays(2) > 0 then return end
	if System.getDaysSinceOpenServer() > 2 then return end
	if nType > 2 then return end
	local name = Actor.getName(sysarg)
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local var = System.getStaticVar()
	if not var.NewServerTopWeapon then
		var.NewServerTopWeapon = {}
		var.NewServerTopWeapon[1] = {}
		var.NewServerTopWeapon[2] = {}
	end
	local nFlag = true
	
	if var.NewServerTopWeapon and var.NewServerTopWeapon[nType] then		
		if var.NewServerTopWeapon[nType].shape then
			if nLevel > var.NewServerTopWeapon[nType].shape then
				if name ~= var.NewServerTopWeapon[nType].name then
					var.NewServerTopWeapon[nType].name = name
					var.NewServerTopWeapon[nType].actorid = nActorId
					nFlag = true
				else
					nFlag = false
				end
				var.NewServerTopWeapon[nType].shape = nLevel
			else
				nFlag = false
			end
		else
			var.NewServerTopWeapon[nType].type = nType
			var.NewServerTopWeapon[nType].name = name
			var.NewServerTopWeapon[nType].actorid = nActorId
			var.NewServerTopWeapon[nType].shape = nLevel
			var.NewServerTopWeapon[nType].state = 0
		end
	end

	local nTagFlag = true
	if nLevel >= OpenServerConfig.activitys[2].needValue then
		local OneDayServerActivityConfig = OpenServerConfig.activitys[2]
		local sRankName = OneDayServerActivityConfig.rankName
		local sRankFileText = OneDayServerActivityConfig.fileName
		local RankNameList = Ranking.getRanking(sRankName)

		if RankNameList ~= nil then			
			local nCount = Ranking.getRankItemCount(RankNameList)			
			for i=0,nCount do
				local pItem = Ranking.getItemFromIndex(RankNameList,i)			
				if pItem then
					nTagId = tonumber(Ranking.getId(pItem))
					if nTagId == nActorId then
						nTagFlag = false
					end
				end	
			end
		else	
			RankNameList = Ranking.add(sRankName,1000,0)		--创建排行榜
			if RankNameList ~= nil then
				local isLoad = Ranking.load(RankNameList,sRankFileText)
			else
				nTagFlag = false
			end
		end
		if nTagFlag == true then
			Ranking.addItem(RankNameList, nActorId, 0)
		end
	end

	

	if nFlag == true then
		local typeName = "时装"
		if nType > 1 then
			typeName = "神器"
		end
		local sName = Actor.getName(sysarg)
		System.broadcastTipmsg(string.format("<(c0xFF00cbff)%s><(c0xFF00ffae)玩家><(c0xFF00ffae)将%s等级提升到了><(c0xFF00cbff)%s级><(c0xFF00ffae),赶紧来超越他吧.>",sName,typeName,nLevel),2)
		System.broadcastTipmsg(string.format("<(c0xFF00cbff)%s><(c0xFF00ffae)玩家><(c0xFF00ffae)将%s等级提升到了><(c0xFF00cbff)%s级><(c0xFF00ffae),赶紧来超越他吧.><#B活动详情点击此处/@@showWin,106>",sName,typeName,nLevel),128)
		
	end
end

--播放庆典烟花
function BroadBrationEffect()
	System.broadcastTipmsg(Lang.Activity.t00068,2+128)
	local playerList = LuaHelp.getAllActorList()		
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then
				Actor.playScrEffectCode(player,OpenServerConfig.activitys[2].effectId,OpenServerConfig.activitys[2].lastTime)
			end
		end
	end
end