function OnKillActor(sysarg, killer)
	--因为没法加载离线玩家信息,只能全部保存了
	--保存姓名,头像,等级,职业,场景名字,发生时间
	local var = Actor.getStaticVar(sysarg)
	local FoeActorList = var.FoeActorList
	if nil == FoeActorList then
		var.FoeActorList = {}
		FoeActorList = var.FoeActorList
	end

	--保存十个信息
	for i = 1, 10 do
		if nil == FoeActorList[i] then
			FoeActorList[i] = {}
			FoeActorList[i].name = Actor.getName(killer)									--姓名
			FoeActorList[i].icon = Actor.getIntProperty( killer, PROP_ENTITY_ICON )			--头像
			FoeActorList[i].level = Actor.getIntProperty( killer, PROP_CREATURE_LEVEL )		--等级
			FoeActorList[i].sex = Actor.getIntProperty( killer, PROP_ACTOR_SEX )			--性别
			FoeActorList[i].job = Actor.getIntProperty( killer, PROP_ACTOR_VOCATION )		--职业
			FoeActorList[i].scenename = Actor.getSceneName(killer, 0, 0)					--击杀场景
			FoeActorList[i].killtime = System.getCurrMiniTime()								--击杀时间
			return
		end
	end

	--列表满了,那就剔除早的
	for i = 1, 10 do
		if 10 == i then
			--放到最后
			FoeActorList[i].name = Actor.getName(killer)									--姓名
			FoeActorList[i].icon = Actor.getIntProperty( killer, PROP_ENTITY_ICON )			--头像
			FoeActorList[i].level = Actor.getIntProperty( killer, PROP_CREATURE_LEVEL )		--等级
			FoeActorList[i].sex = Actor.getIntProperty( killer, PROP_ACTOR_SEX )			--性别
			FoeActorList[i].job = Actor.getIntProperty( killer, PROP_ACTOR_VOCATION )		--职业
			FoeActorList[i].scenename = Actor.getSceneName(killer, 0, 0)					--击杀场景
			FoeActorList[i].killtime = System.getCurrMiniTime()								--击杀时间
			break
		else
			--移动
			--FoeActorList[i] = FoeActorList[i + 1]			--出错...
			FoeActorList[i].name = FoeActorList[i + 1].name
			FoeActorList[i].icon = FoeActorList[i + 1].icon
			FoeActorList[i].level = FoeActorList[i + 1].level
			FoeActorList[i].sex = FoeActorList[i + 1].sex
			FoeActorList[i].job = FoeActorList[i + 1].job
			FoeActorList[i].scenename = FoeActorList[i + 1].scenename
			FoeActorList[i].killtime = FoeActorList[i + 1].killtime
		end
	end
end

--请求仇人列表
EventCallDispatcher.handleGetFoeList = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local FoeActorList = var.FoeActorList
	
	if nil == FoeActorList then
		return false
	end
	
	--申请数据包
	local netPack = DataPack.allocPacket(sysarg, 41, 16)

	for i = 1, 10 do
		if nil == FoeActorList[i] then
			break
		end
		
		--获取玩家信息, 简略的先发送姓名,头像,等级,性别,职业,杀人时间
		DataPack.writeString(netPack, FoeActorList[i].name)
		DataPack.writeByte(netPack, FoeActorList[i].icon)
		DataPack.writeByte(netPack, FoeActorList[i].level)
		DataPack.writeByte(netPack, FoeActorList[i].sex)
		DataPack.writeByte(netPack, FoeActorList[i].job)
		DataPack.writeUInt(netPack, FoeActorList[i].killtime)
	end
	
	DataPack.flush(netPack)
	return true
end

--仇人处理,包括删除和查看
EventCallDispatcher.handleFoe = function(sysarg, args)
	local type = args[1]
	local index = args[2]
	
	local var = Actor.getStaticVar(sysarg)
	local FoeActorList = var.FoeActorList
	
	local netPack
	if 2 == type then
		netPack = DataPack.allocPacket(sysarg, 41, 17)
	end
	
	if nil == FoeActorList then
		if 2 == type then
			DataPack.writeUInt(netPack, 0)
			DataPack.flush(netPack)
		end
		return false
	end
	
	--先找到这个仇人
	local findIndex = 0
	for i = 1, 10 do
		if nil == FoeActorList[i] then
			break
		end
		
		if index == FoeActorList[i].killtime then
			findIndex = i
			break
		end
	end
	
	if 0 == findIndex then
		if 2 == type then
			DataPack.writeUInt(netPack, 0)
			DataPack.flush(netPack)
		end
		return false
	end
	
	if 1 == type then			--查看
		--发回一些数据就行了
		local nYear, nMonth, nDay, nHour, nMinute, nSecond = System.GetSystemTimeInMiniTime(FoeActorList[findIndex].killtime, 0, 0, 0, 0, 0, 0)
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.foe0001, FoeActorList[findIndex].scenename, nYear, nMonth, nDay, nHour, nMinute, nSecond),ttDialog)
	elseif 2 == type then		--删除
		--要重新排序的
		for i = findIndex, 10 do
			--把最后一个删除掉
			if 10 == i or nil == FoeActorList[i + 1] then
				FoeActorList[i] = nil
				break
			end
			
			--移动
			FoeActorList[i].name = FoeActorList[i + 1].name
			FoeActorList[i].icon = FoeActorList[i + 1].icon
			FoeActorList[i].level = FoeActorList[i + 1].level
			FoeActorList[i].sex = FoeActorList[i + 1].sex
			FoeActorList[i].job = FoeActorList[i + 1].job
			FoeActorList[i].scenename = FoeActorList[i + 1].scenename
			FoeActorList[i].killtime = FoeActorList[i + 1].killtime
		end
		
		DataPack.writeUInt(netPack, index)
		DataPack.flush(netPack)
	end
	
	return true
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGetFoeActorList, EventCallDispatcher.handleGetFoeList)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeFoeHandle, EventCallDispatcher.handleFoe)
