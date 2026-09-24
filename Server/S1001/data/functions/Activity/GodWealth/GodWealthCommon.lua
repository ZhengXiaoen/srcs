--lua script

--#include "data\language\LangCode.txt" once   --语言包
--#include "data\config\godWealth\GodWealthConfig.lua" once
--#include "data\config\godWealth\WealthEventConfig.lua" once

OnGodWealthEventsOp = {}

--#include "WealthEventsOp.lua"

--摇骰子后的处理
function OnAfterRollResultOp(sysarg,args)
	local nNum = args[2]			--骰子的点数

	local nCurCheck = Actor.getCurCheckPointIndex(sysarg)			--当前关卡
	local nWealthConfig = GodWealthConfig.CheckPoints[nCurCheck]
	if nWealthConfig == nil then return end

	local nMaxPoint = table.getn(nWealthConfig.points)
	local nCurPoint = Actor.getCurPoint(sysarg)
	
	local nResult = nCurPoint + nNum
	if nResult < 0 then
		nResult = 0
	end
	
	if nCurPoint > nMaxPoint then return end
	
	local nCount = nMaxPoint
	if nCurCheck == table.getn(GodWealthConfig.CheckPoints) then
		nCount = nMaxPoint - 1
	end

	--print("nCurPoint:"..nCurPoint)
	--print("nMaxPoint:"..nMaxPoint)
	if nResult < nCount then
		Actor.sendMoveToDestMsg(sysarg,nCurCheck,nResult)
		if nResult == nMaxPoint - 1 then
			if nCurCheck+1 == 2 then
				local nConfig = WealthEventConfig.finishAwards[1]
				local nIndex = 1
				Actor.giveAward(sysarg,nConfig.awards[nIndex].type,nConfig.awards[nIndex].id,nConfig.awards[nIndex].count,nConfig.awards[nIndex].quality,nConfig.awards[nIndex].strong,nConfig.awards[nIndex].bind,0,189,Lang.Activity.cg0018)
			elseif nCurCheck+1 == 3 then
				local nConfig = WealthEventConfig.finishAwards[2]
				local nIndex = 1
				Actor.giveAward(sysarg,nConfig.awards[nIndex].type,nConfig.awards[nIndex].id,nConfig.awards[nIndex].count,nConfig.awards[nIndex].quality,nConfig.awards[nIndex].strong,nConfig.awards[nIndex].bind,0,189,Lang.Activity.cg0018)
			end
		end
	else
		--if nResult-nMaxPoint == 1 then
		if nCurCheck < table.getn(GodWealthConfig.CheckPoints) then
			if nCurPoint < nMaxPoint - 1 then
				if nCurCheck+1 == 2 then
					Actor.addWealthEventRecord(sysarg,1,Lang.Activity.cg0016)
					local nConfig = WealthEventConfig.finishAwards[1]
					local nIndex = 1
					Actor.giveAward(sysarg,nConfig.awards[nIndex].type,nConfig.awards[nIndex].id,nConfig.awards[nIndex].count,nConfig.awards[nIndex].quality,nConfig.awards[nIndex].strong,nConfig.awards[nIndex].bind,0,189,Lang.Activity.cg0018)
				elseif nCurCheck+1 == 3 then
					Actor.addWealthEventRecord(sysarg,1,Lang.Activity.cg0017)
					local nConfig = WealthEventConfig.finishAwards[2]
					local nIndex = 1
					Actor.giveAward(sysarg,nConfig.awards[nIndex].type,nConfig.awards[nIndex].id,nConfig.awards[nIndex].count,nConfig.awards[nIndex].quality,nConfig.awards[nIndex].strong,nConfig.awards[nIndex].bind,0,189,Lang.Activity.cg0018)
				end
			end
			Actor.sendMoveToDestMsg(sysarg,nCurCheck+1,0)
			local str = ""
		else			--到终点
			Actor.sendMoveToDestMsg(sysarg,nCurCheck,nMaxPoint-1,1)
			Actor.addWealthEventRecord(sysarg,1,Lang.Activity.cg0023)

			local nConfig = WealthEventConfig.finishAwards[3]
			local nIndex = 1
			Actor.giveAward(sysarg,nConfig.awards[nIndex].type,nConfig.awards[nIndex].id,nConfig.awards[nIndex].count,nConfig.awards[nIndex].quality,nConfig.awards[nIndex].strong,nConfig.awards[nIndex].bind,0,189,Lang.Activity.cg0018)

		end
		--else
		--	local nCount = nCurPoint - nNum
		--	if nCount < 0 then
		--		nCount = 0
		--	end
		--	Actor.sendMoveToDestMsg(sysarg,nCurCheck,nCount)
		--end
	end
end

--移动到某格的动画播放完毕
function OnMoveToDestPointOp(sysarg,args)
	local nEventId = args[2]
	local nEventConfig = WealthEventConfig.events[nEventId]
	if nEventConfig == nil then return end

	local func = OnGodWealthEventsOp[nEventId]
	if func ~= nil then
		func(sysarg, args) 
	end
	
end

--随机生成事件
function OnSetPointEvent(sysarg)
	local nCurCheck = Actor.getCurCheckPointIndex(sysarg)			--当前关卡
	local nWealthConfig = GodWealthConfig.CheckPoints[nCurCheck]
	if nWealthConfig == nil then return end

	local nMaxPoint = table.getn(nWealthConfig.points)
	if nCurCheck <= table.getn(WealthEventConfig.haveEvents) then
		Actor.clearWealthEventData(sysarg)

		local nEventCount = WealthEventConfig.haveEvents[nCurCheck][2]
		
		local nRate = System.getRandomNumber(100)
		if nRate <= WealthEventConfig.surprisedRate[1][2] then		--惊喜事件
			local nSurPoint = System.getRandomNumber(nMaxPoint)
			if nSurPoint < 1 then
				nSurPoint = 1
			end

			if nSurPoint >= nMaxPoint - 1 then
				nSurPoint = nMaxPoint - 2
			end

			if Actor.isExistEvent(sysarg,nSurPoint) == false then
				Actor.addWealthEventData(sysarg,nSurPoint,WealthEventConfig.surprisedRate[1][1],0)
				nEventCount = nEventCount - 1
			end
		end

		local nTotalNum = 0

		for k=1,table.getn(WealthEventConfig.nomalRate) do					--普通的所用的概率总和
			nTotalNum = nTotalNum + WealthEventConfig.nomalRate[k][2]
		end

		for i=1,nEventCount do
			local nPoint = 0			--随机出格子索引
			for j=1,1000 do
				nPoint = System.getRandomNumber(nMaxPoint)
				if nPoint < 1 then
					nPoint = 1
				end

				if nPoint >= nMaxPoint - 1 then
					nPoint = nMaxPoint - 2
				end

				if Actor.isExistEvent(sysarg,nPoint) == false then
					break
				end
			end
			
			local nEventId = 0				--随机给个事件
			
			if nPoint > 0 then
				for j=1,1000 do
					local nEventRand = System.getRandomNumber(nTotalNum)
					local curCount = 0
					for k=1,table.getn(WealthEventConfig.nomalRate) do
						curCount = curCount + WealthEventConfig.nomalRate[k][2]
						if nEventRand < curCount then
							nEventId = WealthEventConfig.nomalRate[k][1]
							break
						end
					end
					
					if nEventId > 0 and Actor.getSealthEventNum(sysarg,nEventId) <= WealthEventConfig.maxCount[nCurCheck][nEventId][2] then
						break
					end
				end
				
				Actor.addWealthEventData(sysarg,nPoint,nEventId,0)
			end
		end
	end
end

--随机产生事件
function OnRandProduceEvent(sysarg,args)
	OnSetPointEvent(sysarg)
end

--登陆时初始化财富事件(每次登陆现改为固定的)
function InitGodEventOnLogin(sysarg,args)
	Actor.clearWealthEventData(sysarg)
	for i=1,table.getn(WealthEventConfig.loginEvent) do
		Actor.addWealthEventData(sysarg,WealthEventConfig.loginEvent[i][1],WealthEventConfig.loginEvent[i][2],0)
	end
	
	if Actor.hasQuest(sysarg,WealthEventConfig.events[9].nQuestId[1]) == false then		--没有财神任务，状态置为1
		Actor.setFinishState(sysarg,1)
	end
end

--初始化玩家的财富闯关数据
function OnInitActorWealthInfo(sysarg,args)
	local nMaxTimes = GodWealthConfig.freeTimes
end

--增加摇骰子的次数
function OnAddRollTimesOp(sysarg,args)
	local nBindyb = Actor.getIntProperty(sysarg, PROP_ACTOR_BIND_YUANBAO)
	
	local bState = 0
	if nBindyb < GodWealthConfig.bindYb then
		--Actor.sendTipmsg(sysarg, string.format(Lang.Activity.cg0002,GodWealthConfig.bindYb), ttFlyTip)
		bState = 0
	else
		Actor.changeMoney(sysarg,2,-GodWealthConfig.bindYb,GameLog.clGodWealthAward,Lang.Activity.cg0004)
		bState = 1
	end
	
	if bState == 0 then
		local nYb = Actor.getIntProperty(sysarg, PROP_ACTOR_YUANBAO)
		if nYb < GodWealthConfig.nYb then
			Actor.sendTipmsg(sysarg, Lang.Activity.cg0003, ttFlyTip)
			return
		else
			Actor.changeMoney(sysarg,3,-GodWealthConfig.nYb,GameLog.clGodWealthAward,Lang.Activity.cg0004)
			bState = 1
		end
	end
	
	if Actor.getRollMaxTimes(sysarg) >= WealthEventConfig.maxRollTimes then
		Actor.sendTipmsg(sysarg, Lang.Activity.cg0021, ttFlyTip)
		return
	end

	if bState == 1 then
		local pack = DataPack.allocPacket(sysarg, 47, 5)
		if (pack ~= nil) then
			DataPack.writeChar(pack, 1)
			DataPack.flush(pack)
		end

		Actor.addRollTimes(sysarg,1)
	end
end

--清除摇骰子的剩余时间
function OnClearRollLeftTime(sysarg,args)
	local nBindyb = Actor.getIntProperty(sysarg, PROP_ACTOR_BIND_YUANBAO)
	
	local bState = 0
	--[[
	if nBindyb < GodWealthConfig.clearTimebindYb then
		bState = 0
	else
		Actor.changeMoney(sysarg,2,-GodWealthConfig.clearTimebindYb,GameLog.clGodWealthAward,Lang.Activity.cg0005)
		bState = 1
	end
	]]
	
	--if bState == 0 then
	local nYb = Actor.getIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	if nYb < GodWealthConfig.clearTimeNeedYb then
		Actor.sendTipmsg(sysarg, Lang.Activity.cg0020, ttFlyTip)
		return
	else
		Actor.changeMoney(sysarg,3,-GodWealthConfig.clearTimeNeedYb,GameLog.clGodWealthAward,Lang.Activity.cg0005)
		bState = 1
	end
	--end
	
	if bState == 1 then
		local pack = DataPack.allocPacket(sysarg, 47, 6)
		if (pack ~= nil) then
			DataPack.writeInt(pack, 0)
			DataPack.flush(pack)
		end

		Actor.setNextRollTime(sysarg,0)
	end

end

--翻天覆地
OnGodWealthEventsOp[11] = function (sysarg, args)
	OnSetPointEvent(sysarg)
	Actor.sendEventsList(sysarg)
	Actor.setFinishState(sysarg,1)
	Actor.addWealthEventRecord(sysarg,1,Lang.Activity.cg0022)
end

--重置财富事件
function OnResetWealthEventOp(sysarg,args)
	local nYb = Actor.getIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	if nYb < GodWealthConfig.reSetEventNeedYb then
		Actor.sendTipmsg(sysarg, Lang.Activity.cg0020, ttFlyTip)
		return
	else
		Actor.changeMoney(sysarg,3,-GodWealthConfig.reSetEventNeedYb,GameLog.clGodWealthAward,Lang.Activity.cg0019)
	end

	OnSetPointEvent(sysarg)

	Actor.sendEventsList(sysarg)
end

