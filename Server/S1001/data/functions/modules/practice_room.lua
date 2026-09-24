-- 练功房
--#include "data\config\modules\practice_room_cfg.lua" once

s2c_practice_room_msgids = {
	send_data = 1, -- 下发练功房数据
	upgrade = 2, -- 升级
}


-- 下发练功房数据
function send_practice_room_data(sysarg)	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sPracticeRoomModule)
	DataPack.writeByte(netPack, s2c_practice_room_msgids.send_data) -- 练功房数据
	
	local var = Actor.getStaticVar(sysarg)
	local prctroom = var.days.prctroom
	if prctroom == nil then
		var.days.prctroom = {}
		prctroom = var.days.prctroom
		
		prctroom.lvl = 1 -- 练功房等级
		prctroom.time = 0 -- 当天练功时间(秒)
		prctroom.exp = 0 -- 当天练功房所得经验
	end
	
	local practice_tiem = 0 -- 当天练功时间(秒)
	if prctroom.time ~= nil then
		practice_tiem = prctroom.time
	end

	local dvar = Actor.getDyanmicVar(sysarg)
	local practicing = dvar.practicing -- 是否正在练功
	if practicing == nil then practicing = 0 end

	
	DataPack.writeByte(netPack, prctroom.lvl and prctroom.lvl or 1)
	DataPack.writeUInt(netPack, practice_tiem)
	DataPack.writeUInt(netPack, prctroom.exp and prctroom.exp or 0)	
	DataPack.writeByte(netPack, practicing)
	
	DataPack.flush(netPack)
end

-- 开始练功
function practice_room_start_practice(sysarg, packet)
	local var = Actor.getStaticVar(sysarg)
	local prctroom = var.days.prctroom
	if prctroom == nil then
		print("error, practice_room_start_practice prctroom == nil")
		return
	end
	
	local dvar = Actor.getDyanmicVar(sysarg)
	if dvar.practicing ~= nil and dvar.practicing ~= 0 then
		return -- 已经开始练功了
	end
	
	dvar.practicing = 1
			
	Actor.addTimer(sysarg, ActorTimerIds.practice_room, 60*1000)
	
	Actor.sendTipmsg(sysarg, "您已开始练功", ttFlyTip)
end

-- 停止练功
function practice_room_stop_practice(sysarg, packet)
	local var = Actor.getStaticVar(sysarg)
	local prctroom = var.days.prctroom
	if prctroom == nil then
		print("error, practice_room_stop_practice prctroom == nil")
		return
	end
	
	local dvar = Actor.getDyanmicVar(sysarg)
	if dvar.practicing == nil or dvar.practicing == 0 then
		return -- 已经停止练功了
	end
	
	dvar.practicing = nil
	Actor.deleteTimer(sysarg, ActorTimerIds.practice_room)			
	
	Actor.sendTipmsg(sysarg, "您已停止练功", ttFlyTip)
end

-- 升级练功房
function practice_room_upgrade(sysarg, packet)
	local var = Actor.getStaticVar(sysarg)
	local prctroom = var.days.prctroom
	if prctroom == nil then
		print("error, practice_room_upgrade prctroom == nil")
		return
	end
	
	local curLevel = prctroom.lvl
	if curLevel >= 3 then return end
	
	local levelcfg = practice_room_cfg.level_list[curLevel + 1]
	if levelcfg == nil then return end
	
	if levelcfg.consume ~= nil then
		--检查消耗
		local consumeData = {}
		local isok = CheckAllConsume(sysarg, false, levelcfg.consume, true, consumeData)				
		if not isok then return end	
		
		--扣除消耗
		isok = DeductAllConsume(sysarg, false, levelcfg.consume, LogIds.PracticeRoomUpgrade)		
		if not isok then return end	
	end
	
	prctroom.lvl = curLevel + 1
	Actor.sendTipmsg(sysarg, "您的练功房已成功升级到第 "..(curLevel + 1).." 级", ttFlyTip)
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sPracticeRoomModule)
	DataPack.writeByte(netPack, s2c_practice_room_msgids.upgrade) -- 升级练功房
	DataPack.writeByte(netPack, curLevel + 1)	
	DataPack.flush(netPack)
end

-- 返回下次回调的间隔，返回 0 则删除定时器
function on_practice_room_timer_cb(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local prctroom = var.days.prctroom
	if prctroom == nil then
		local dvar = Actor.getDyanmicVar(sysarg)
		dvar.practicing = nil
		print("error, on_practice_room_timer_cb prctroom == nil")
		return 0
	end
	
	local levelcfg = practice_room_cfg.level_list[prctroom.lvl]
	if levelcfg == nil then
		local dvar = Actor.getDyanmicVar(sysarg)
		dvar.practicing = nil
		print("error, on_practice_room_timer_cb levelcfg == nil,prctroom.lvl="..prctroom.lvl)
		return 0
	end
	
	local addexp = levelcfg.exp
	local oldexp = prctroom.exp
	if oldexp ~= nil then
		prctroom.exp = oldexp + addexp
	else
		prctroom.exp = addexp
	end
	
	Actor.addExp(sysarg,addexp,LogIds.PracticeRoomAddExp,0)
	
	local time = prctroom.time
	if time == nil then time = 0 end
		
	time = time + 60		
	prctroom.time = time
	if time >= levelcfg.max_practice_time then -- 当天的练功时间到了
		local dvar = Actor.getDyanmicVar(sysarg)
		dvar.practicing = nil
		Actor.sendTipmsg(sysarg, "您当天的练功时间已经用完了", ttFlyTip)
		return 0
	end
	
	return 60*1000
end

-- 客户端消息
function on_msg_practice_room(sysarg, sysid, packet)
	if sysid ~= LogicCmd.miscSys.sub.cPracticeRoomModule then
		print("error on_msg_practice_room, sysid="..sysid)
		return
	end
	
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if actorLevel < practice_room_cfg.need_level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, practice_room_cfg.need_level), ttFlyTip)
		return
	end
	
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 下发练功房数据
		send_practice_room_data(sysarg)	
	elseif msgid == 2 then -- 开始练功
		practice_room_start_practice(sysarg, packet)
	elseif msgid == 3 then -- 停止练功
		practice_room_stop_practice(sysarg, packet)	
	elseif msgid == 4 then -- 升级练功房
		practice_room_upgrade(sysarg, packet)	
	else
		print("error on_msg_practice_room, unknown msgid="..msgid)
		return
	end
end
