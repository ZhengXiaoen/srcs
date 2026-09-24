--跨服豹头镖局（交镖NPC）

local t = {}

t.main = function(sysarg)
	--print("打开交镖NPC界面")	
	
	--获得押镖状态(0：没有押镖；1：正在押镖；2：押镖成功且没有领取奖励；3：押镖超时)
	local ybState = GetCrossYaBiaoState(sysarg)
	if ybState == 0 then
		Actor.sendTipmsg(sysarg, "请先接镖", ttFlyTip)
		return
	elseif ybState == 3 then
		Actor.sendTipmsg(sysarg, "押镖超时", ttFlyTip)
		return
	elseif ybState == 2 then
		--发送信息给前端交镖
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sCrossYaBiao)
		DataPack.writeByte(netPack, 4) -- 交镖数据
		DataPack.writeByte(netPack, 1) -- 是否押镖成功
		DataPack.flush(netPack)
		
		return
	elseif ybState ~= 1 then
		return
	end
	
	
	local dVar = Actor.getDyanmicVar(sysarg)
	local var = Actor.getStaticVar(sysarg)
		
	local bcHandle = dVar.YuanGuBCHandle
	if not bcHandle then -- 没有镖车句柄
		Actor.sendTipmsg(sysarg,"请带上镖车来找我",ttFlyTip)
		return
	end

	local bcptr = Actor.getEntity(bcHandle)
	if not bcptr then -- 没有镖车句柄
		Actor.sendTipmsg(sysarg,"请带上镖车来找我",ttFlyTip)
		return
	end
	
	-- C++已经检查是否是在同一场景和跟NPC的距离是否有效了
	--local npcSceneId = Actor.getSceneId(thisNPC) -- 这里取出来的值不对
	local bcSceneid = Actor.getSceneId(bcptr)
	local mySceneid = Actor.getSceneId(sysarg)
	if bcSceneid ~= mySceneid then -- 不在同一场景
		Actor.sendTipmsg(sysarg,"请带上镖车来找我",ttFlyTip)
		return
	end
	
	--local npcX, npcY = Actor.getEntityPosition(thisNPC) -- 这里取出来的值不对
	local bcX, bcY = Actor.getEntityPosition(bcptr)
	local myX, myY = Actor.getEntityPosition(sysarg)
	
	--判断镖车距离, 检查人与镖车的距离
	local dis
	--[[
    dis = math.max(math.abs(npcX - myX), math.abs(npcY - myY))	
	if dis > 7 then
		Actor.sendTipmsg(sysarg, "距离NPC太远", ttFlyTip)
        return
    end
    
    dis = math.max(math.abs(npcX - bcX), math.abs(npcY - bcY))	
	if dis > 7 then
		Actor.sendTipmsg(sysarg, "镖车距离太远", ttFlyTip)
        return
    end
    --]]
    dis = math.max(math.abs(myX - bcX), math.abs(myY - bcY))	
	if dis > 7 then
		Actor.sendTipmsg(sysarg, "镖车距离太远", ttFlyTip)
        return
    end	
    
    -- 押镖成功
    
    DestroyCrossBiaoChe(sysarg)
    
    -- 0押镖成功且没有领取奖励
    dVar.YuanGuYBstart = 0    
	
	if Actor.getIsDartFlag(sysarg) == 3 then -- 跨服押镖
    	Actor.setDartFlag(sysarg, 0) --设置不在押镖状态
	end
    
    -- 增加押镖次数
	local yuanGuYabiaoCount = var.days.yuanGuYabiaoCount
	if yuanGuYabiaoCount == nil then
		yuanGuYabiaoCount = 1
	else
		yuanGuYabiaoCount = yuanGuYabiaoCount + 1
	end
	var.days.yuanGuYabiaoCount = yuanGuYabiaoCount
	
	--发送信息给前端交镖
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sCrossYaBiao)
	DataPack.writeByte(netPack, 4) -- 交镖数据
	DataPack.writeByte(netPack, 1) -- 是否成功
	DataPack.flush(netPack)
end


function GetNpcBaoTouBiaoJu() return t end