


EventCallDispatcher.OnTelePortHandler = function (sysarg, args)
	--print("OnTelePort")
	local nPassId = args[1]	--传送ID
	
	local sTitle = ""
	if nPassId == 2 then
		sTitle = "你确定离开此副本地图吗？"
	elseif nPassId == 3 then
		sTitle = "你确定离开此活动地图吗？"
	end
	if sTitle ~= "" then
		Actor.messageBox(sysarg, 0, 0, sTitle, "确定".."/LeaveActivitySceneCallback", "取消".."/Cancel", nil)
	end
	
end



EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeTelePort, EventCallDispatcher.OnTelePortHandler)