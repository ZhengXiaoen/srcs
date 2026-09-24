--lua script
--#include "data\language\LangCode.txt" once   --语言包
--#include "data\config\activityconfig\OpenServerTenDays\OpenServerConfig.lua" once
--#include "data\config\activityconfig\OpenServerTenDays\FirstDayActivity.lua" once

--第一天 练级狂人（烟花）
--全民活动播报
function FirstWhloeActivityNotice()
	--System.broadcastTipmsg(Lang.Activity.k00022,2+128)
end

--从开服后的每个整点都进行活动宣传播报：
function LevelingNotice()
	--System.broadTopLevelMsgToClient(0)
	--System.broadcastTipmsg(Lang.Activity.w00079,2+128)
end

--19点后播报
function LevelingStartNotice()
	--System.broadTopLevelMsgToClient(1)
end

--22点后播报
function LevelingLastNotice()
	--System.broadTopLevelMsgToClient(2)
end

--更新第一天等级排名的名单
function UpdateLevelMainRank()
	--System.broadTopLevelMsgToClient(0)
end

--播报消息
function BroadLevelingMsg()
--[[	local RankNameList = Ranking.getRanking(OpenServerConfig.activitys[1].rankName)

	if RankNameList ~= nil then
		local str1 = ""
		local str2 = ""
		local str3 = ""
		
		local bBroadFlag = false
		for i=0,2 do
			local nJob = 0
			local sName
			local pItem = Ranking.getItemFromIndex(RankNameList,i)
			
			if pItem then
				if Ranking.getPoint(pItem) > 0 then
					if i == 0 then
						sName = Ranking.getSub(pItem,1)
						nJob = tonumber(Ranking.getSub(pItem,0))
						str1 =  GetJobName(nJob).."<(n"..sName..")>,"
					elseif i == 1 then
						sName = Ranking.getSub(pItem,1)
						nJob = tonumber(Ranking.getSub(pItem,0))
						str2 =  GetJobName(nJob).."<(n"..sName..")>,"
					elseif i == 2 then
						sName = Ranking.getSub(pItem,1)
						nJob = tonumber(Ranking.getSub(pItem,0))
						str3 =  GetJobName(nJob).."<(n"..sName..")>"
					end

					bBroadFlag = true
				end
			end

		end
		local str = str1..str2..str3
		
		local tmpStr = string.format(Lang.Activity.w00083,str,Item.getItemName(OpenServerConfig.activitys[1].awards[1].id))

		if bBroadFlag == true then
			System.broadcastTipmsg(tmpStr,2+128)
			BroadBrationEffect()
		else
			System.broadcastTipmsg(Lang.Activity.k00036,2+128)
		end
	end--]]
end


--获取职业名称
function GetJobName(nJob)
	if nJob == 1 then
		return Lang.Activity.w00080
	elseif nJob == 2 then
		return Lang.Activity.w00081
	elseif nJob == 3 then
		return Lang.Activity.w00082
	end
end

--结束活动 23点结算
function EndLevelingActivty()
--[[	local nDays = OpenServerConfig.activitys[1].openDays
	local nValue = OpenServerConfig.activitys[1].needValue
	local RankNameList = Ranking.getRanking(OpenServerConfig.activitys[1].rankName)
	if RankNameList ~= nil then
		for i=0,2 do
			local pItem = Ranking.getItemFromIndex(RankNameList,i)
			if pItem then
				local nActorId = Ranking.getSub(pItem,5)
				if nActorId and tonumber(nActorId) > 0 then
					System.sendTopOfflineAward(nDays,nValue,nActorId,1182,39)
				end
			end
		end
	end	--]]
	--System.accountTopLevelActivity()
	System.onAccountAllActivity(1,0)
	System.onAccountAllActivity(2,0)
	System.onAccountAllActivity(3,0)
	System.broadcastTipmsg(Lang.Activity.k00023,2+128)
	System.finishTenDaysToFile(3)
	BroadBrationEffect()
	--BroadLevelingMsg()
end

--播放庆典烟花
function BroadBrationEffect()
	System.broadcastTipmsg(Lang.Activity.t00068,2+128)
	local playerList = LuaHelp.getAllActorList()		
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then
				Actor.playScrEffectCode(player,OpenServerConfig.activitys[1].effectId,OpenServerConfig.activitys[1].lastTime)
			end
		end
	end
end

--等级提升给提示
--[[function UpLevelGiveTips(sysarg,nLevel)
	if System.getActivityFinishDays(1) > 0 then return end
	if System.getDaysSinceOpenServer() > 1 then return end
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	local pCir = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
	local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	local name = Actor.getName(sysarg)
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	if pLv < OpenServerConfig.activitys[1].minLevel and pCir == 0 then
		return
	end
	local OneDayServerActivityConfig = OpenServerConfig.activitys[1]
	local sRankName = OneDayServerActivityConfig.rankName
	local sRankFileText = OneDayServerActivityConfig.fileName
	local nFlag = 0
	local RankNameList = Ranking.getRanking(sRankName)
	if RankNameList ~= nil then
		for i=0,2 do
			local nTagJob = 0
			local pItem = Ranking.getItemFromIndex(RankNameList,i)
			
			if pItem then
				nTagJob = tonumber(Ranking.getSub(pItem,0))
				if nTagJob == nJob then
					local nTagName = Ranking.getSub(pItem,1)
					local nTagCir = tonumber(Ranking.getSub(pItem,2))
					local nTagLv = tonumber(Ranking.getSub(pItem,3))
					if pCir > nTagCir or (pCir == nTagCir and pLv > nTagLv) then
						local lastActorId = tonumber(Ranking.getSub(pItem,5))
						System.trace("last actor id"..lastActorId.."    circle = "..nTagCir.."  level = "..nTagLv)
						System.trace("cur actor id"..actorId.."    circle = "..pCir.."  level = "..pLv)
						if name ~= nTagName then							
							Ranking.setSub(pItem, 1, name)													
							nFlag = 1
						else							
							nFlag = 3
						end
						Ranking.setSub(pItem, 2, pCir)
						Ranking.setSub(pItem, 3, pLv)
						Ranking.setSub(pItem, 5, actorId)
					else
						nFlag = 3
					end					
				end
			end
		end		
	else		
		RankNameList = Ranking.add(sRankName,1000,0)		--创建排行榜
		if RankNameList ~= nil then
			local isLoad = Ranking.load(RankNameList,sRankFileText)
			
			if isLoad == false then
				for i=1, table.getn(OneDayServerActivityConfig.columnName) do
					Ranking.addColumn(RankNameList,OneDayServerActivityConfig.columnName[i].cName) --添加一个标题列  
				end
			end
		end
	end
	if nFlag == 0 then			
		if actorId > 0 then
			local lastItem = Ranking.addItem(RankNameList, actorId, 0)
			if lastItem then
				Ranking.setSub(lastItem, 0, nJob)
				Ranking.setSub(lastItem, 1, name)
				Ranking.setSub(lastItem, 2, pCir)
				Ranking.setSub(lastItem, 3, pLv)
				Ranking.setSub(lastItem, 4, "0")
				Ranking.setSub(lastItem, 5, actorId)
				nFlag = 1
			end
		end
	end
	if nFlag == 1 then
		local nJobName = GetJobName(nJob)
		System.broadcastTipmsg(string.format("<(c0xFF00cbff)%s><(c0xFF00ffae)职业第1名玩家><(n%s)><(c0xFF00ffae)等级提升到了><(c0xFF00cbff)%s转%s级><(c0xFF00ffae),各大战士们,赶紧来超越他吧.>",nJobName,name,pCir,pLv),2)
		System.broadcastTipmsg(string.format("<(c0xFF00cbff)%s><(c0xFF00ffae)职业第1名玩家><(n%s)><(c0xFF00ffae)等级提升到了><(c0xFF00cbff)%s转%s级><(c0xFF00ffae),各大战士们,赶紧来超越他吧.><#B活动详情点击此处/@@showWin,106>",nJobName,name,pCir,pLv),128)
		
		sendOnlineTopicDayRankInfo(1)
	end
end--]]


function UpLevelGiveTips(sysarg)

	if System.getActivityFinishDays(3) > 0 then return end
	if System.getDaysSinceOpenServer() > 3 then return end
	local nHour,nMin,nSec = System.getTime(0,0,0)
	if System.getDaysSinceOpenServer() == 3 and nHour >= 23 then return end

	local var = System.getStaticVar()
	local sName = Actor.getName(sysarg)
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local nJob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	local nLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)	
	
	if not var.TopLevel then
		var.TopLevel = {}
		for i = 1,3 do
			var.TopLevel[i] = {}
			for j = 1,4 do
				var.TopLevel[i][j] = {}
			end
		end
	end
	
	local nTopLevelConfig = var.TopLevel[nJob]
	if not var.TopLevel[nJob][1].id then
		var.TopLevel[nJob][1].id = nActorId
		var.TopLevel[nJob][1].name = sName
		var.TopLevel[nJob][1].level = nLevel
		var.TopLevel[nJob][1].circle = nCircle
		var.TopLevel[nJob][1].job = nJob
	else
		local nFlag = 0
		for i = 1,3 do
			if nTopLevelConfig[i].id then
				if nTopLevelConfig[i].id == nActorId then
					var.TopLevel[nJob][i].level = nLevel
					var.TopLevel[nJob][i].circle = nCircle
					break
				end
				if nCircle > nTopLevelConfig[i].circle or (nCircle == nTopLevelConfig[i].circle and nLevel > nTopLevelConfig[i].level) then
					nFlag = i
					levelSort(nFlag,nActorId,nJob)
					break
				end
			else
				var.TopLevel[nJob][i].id = nActorId
				var.TopLevel[nJob][i].name = sName
				var.TopLevel[nJob][i].level = nLevel
				var.TopLevel[nJob][i].circle = nCircle
				var.TopLevel[nJob][i].job = nJob
				break
			end
		end

		if nFlag > 0 then
			var.TopLevel[nJob][nFlag].id = nActorId
			var.TopLevel[nJob][nFlag].name = sName
			var.TopLevel[nJob][nFlag].level = nLevel
			var.TopLevel[nJob][nFlag].circle = nCircle
			var.TopLevel[nJob][nFlag].job = nJob
		end
	end
	
	--for i = 1 ,3 do
	--	print(var.TopLevel[nJob][i].name)
	--end
end

--排行榜排序
function levelSort(index,actorId,nJob)
	
	local var = System.getStaticVar()
	local nRankId = getLevelRankIndex(actorId,nJob)
	
	if nRankId >= 3 or nRankId <= 0 then
		for i = 3,index,-1 do
			var.TopLevel[nJob][i+1].id        = var.TopLevel[nJob][i].id 		   
			var.TopLevel[nJob][i+1].name      = var.TopLevel[nJob][i].name
			var.TopLevel[nJob][i+1].level = var.TopLevel[nJob][i].level 
			var.TopLevel[nJob][i+1].circle      = var.TopLevel[nJob][i].circle
			var.TopLevel[nJob][i+1].job = var.TopLevel[nJob][i].job 
		end
	else
		var.TopLevel[nJob][1].id,var.TopLevel[nJob][2].id 			= var.TopLevel[nJob][2].id,var.TopLevel[nJob][1].id
		var.TopLevel[nJob][1].name,var.TopLevel[nJob][2].name 		= var.TopLevel[nJob][2].name,var.TopLevel[nJob][1].name
		var.TopLevel[nJob][1].level,var.TopLevel[nJob][2].level 	= var.TopLevel[nJob][2].level,var.TopLevel[nJob][1].level
		var.TopLevel[nJob][1].circle,var.TopLevel[nJob][2].circle 	= var.TopLevel[nJob][2].circle,var.TopLevel[nJob][1].circle
		var.TopLevel[nJob][1].job,var.TopLevel[nJob][2].job 		= var.TopLevel[nJob][2].job,var.TopLevel[nJob][1].job		
	end
end

--查看玩家之前在不在排行榜内
function getLevelRankIndex(actorId,nJob)
	
	local var = System.getStaticVar()
	if not var.TopLevel then
		var.TopLevel = {}
	end

	for i = 1,3 do
		if var.TopLevel[nJob][i].id == actorId then
			return i
		end
	end

	return 0
end