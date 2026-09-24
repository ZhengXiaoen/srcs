--获取活动按钮光效标识

MiscsImplement.GetPanelInfo = function(sysarg, msgid, packet)

	local ActivityPanel = DataPack.readByte(packet)
	
	if ActivityPanel < 18 or ActivityPanel > 28 then
		return
	end
	
	local ActorFlag = Actor.getActorFlag(sysarg,ActivityPanel)
	
	if ActorFlag < 1 then
		 Actor.setActorFlag(sysarg,ActivityPanel)
	end
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetFirstClickPanelFlag, MiscsImplement.GetPanelInfo)