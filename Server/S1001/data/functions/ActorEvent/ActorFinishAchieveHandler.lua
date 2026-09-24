
EventCallDispatcher.ActorFinishAchieveFunc = function (sysarg,arg)
	--[[
	if arg == nil then return end                                           
	local Achieveid = arg[1]
	if Achieveid == 9 then                              --如果是完成第一次跳跃的话就判断他有没有跳跃这个任务。有就给他完成
		if Actor.hasQuest(sysarg,780) then 
			Actor.setQuestValue(sysarg,780,30010,1)
		end
  end
  --]]
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeActorFinishAchieve, EventCallDispatcher.ActorFinishAchieveFunc)