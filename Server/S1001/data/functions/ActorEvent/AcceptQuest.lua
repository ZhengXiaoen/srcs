--#include "data\config\ActorEvent\AcceptQuestCfg.lua" once


--接受任务的触发其他事情
EventCallDispatcher.OnAcceptQuest = function (sysarg,args)
	
	local questId = args[1]
	
	if not questId or questId <= 0 then	return end
	if not AcceptQuestCfg then return end

	for _,QuestData in pairs(AcceptQuestCfg) do
		if QuestData.CurQuestID == questId then
			local Hfuben = Fuben.createFuBen(QuestData.FubenID)
			Actor.enterFuBen(sysarg,Hfuben,QuestData.SceneID,unpack(QuestData.Pos))
		end
	end

	---------------------接主线触发支线任务-----------------------------
	if questId == 73 or questId == 84 or questId == 92 then
		if questId == 92 then 
			SendQuestBuyExpInfo(sysarg)
		else
			SendQuestExpLink(sysarg,true)
		end
		
		Quest_ShuaXin(sysarg)
	end
end


--完成某个任务触发额外事件
--[[EventCallDispatcher.OnFinishQuest = function (sysarg,args)
	
	local questId = args[1]  --当前完成的任务ID
	if not questId or questId <= 0 then	return end
	
end--]]

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeAcceptQuest, EventCallDispatcher.OnAcceptQuest)
--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeFinishQuest, EventCallDispatcher.OnFinishQuest)