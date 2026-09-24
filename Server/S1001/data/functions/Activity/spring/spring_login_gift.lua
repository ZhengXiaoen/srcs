-- 	春节活动--开门送礼 2
--#include "data\functions\Activity\SpringFestivalActivity.lua" once

function spring_login_gift_get_data(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack, 2) -- 2 开门送礼
	DataPack.writeByte(netPack, 1) -- 1 下发数据
	
	local var = Actor.getStaticVar(sysarg)
	ClearAllSpringData(sysarg)
	
	local login_count = var.spring_login_count
	if login_count == nil then login_count = 0 end
	
	-- 0 到 23 为登录奖励领取标志
	-- 24 到 31 为累计登录奖励领取标志
	local flags = var.spring_login_flags
	if flags == nil then flags = 0 end	
		
	DataPack.writeUInt(netPack, login_count)
	DataPack.writeUInt(netPack, flags)
	
	DataPack.flush(netPack)
end

-- 领取登陆奖励
function spring_login_gift_get_login_awards(sysarg, packet)
		
	local day = get_spring_festival_day_count()
	if day < 1 or day > 24 then return end
	
	local award = SpringFestivalCfg.LoginGift.loginAwards[day]
	if award == nil then return end
	
	ClearAllSpringData(sysarg)
	
	local var = Actor.getStaticVar(sysarg)	
		
	-- 检查是否已经领了
	local flags = var.spring_login_flags
	if flags == nil then flags = 0 end
	
	if System.getIntBit(flags, day-1) ~= 0 then
		Actor.sendTipmsg(sysarg, "不能重复领取该奖励", ttFlyTip)
		return
	end
	
	if Awards.Give(sysarg, award, LogIds.SpringLoginAwards, tostring(day)) == false then        
		return	
   	end
	
	flags = System.setIntBit(flags, day-1, true)
	var.spring_login_flags = flags
	
	Actor.sendTipmsg(sysarg, "领取开门送礼奖励成功", ttFlyTip)
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack, 2) -- 2 开门送礼
	DataPack.writeByte(netPack, 2) -- 2 领取奖励成功
	DataPack.writeUInt(netPack, flags)
	DataPack.flush(netPack)
end

-- 领取累计登陆奖励
function spring_login_gift_get_addup_login_awards(sysarg, packet)
	local idx = DataPack.readByte(packet) -- 领取奖励的索引，从1开始
	if idx < 1 or idx > 8 then return end
	ClearAllSpringData(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	local login_count = var.spring_login_count
	if login_count == nil then login_count = 0 end
		
	local cfg = SpringFestivalCfg.LoginGift.addupLoginAwards[idx]
	if cfg == nil then return end
	
	if login_count < cfg.needCount then
		Actor.sendTipmsg(sysarg, "要累计登陆"..cfg.needCount.."天才能领取该奖励", ttFlyTip)
		return
	end
	
	-- 检查是否已经领了
	local flags = var.spring_login_flags
	if flags == nil then flags = 0 end
	
	if System.getIntBit(flags, 24 + idx-1) ~= 0 then
		Actor.sendTipmsg(sysarg, "不能重复领取该奖励", ttFlyTip)
		return
	end
	
	if Awards.Give(sysarg, cfg.award, LogIds.SpringAddupLoginAwards, tostring(idx)) == false then        
		return	
   	end
	
	flags = System.setIntBit(flags, 24 + idx-1, true)
	var.spring_login_flags = flags
	
	Actor.sendTipmsg(sysarg, "领取累计登陆奖励成功", ttFlyTip)
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack, 2) -- 2 开门送礼
	DataPack.writeByte(netPack, 3) -- 3 领取累计登陆奖励
	DataPack.writeByte(netPack, idx)
	DataPack.writeUInt(netPack, flags)
	DataPack.flush(netPack)
end

function spring_login_gift_add_login_count(sysarg)
	ClearAllSpringData(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local login_count = var.spring_login_count
	if login_count == nil then
		var.spring_login_count = 1
	else
		var.spring_login_count = login_count + 1
	end
end

function on_spring_login_gift_player_login(sysarg, isCrossDay)
	if isCrossDay then
		spring_login_gift_add_login_count(sysarg)
	end
end

function on_spring_login_gift_online_cross_day(sysarg)
	spring_login_gift_add_login_count(sysarg)
end

function spring_login_gift_main(sysarg, packet)
	local msgId = DataPack.readByte(packet)
	
	if msgId == 1 then -- 获取数据
		spring_login_gift_get_data(sysarg)
	elseif msgId == 2 then -- 领取登陆奖励
		spring_login_gift_get_login_awards(sysarg, packet)
	elseif msgId == 3 then -- 领取累计登陆奖励
		spring_login_gift_get_addup_login_awards(sysarg, packet)
	else
		print("error spring_login_gift_main, unknown msgId="..msgId)
	end
end

register_spring_festival_func(2, spring_login_gift_main)
register_spring_festival_login_func(on_spring_login_gift_player_login)
register_spring_festival_online_cross_day_func(on_spring_login_gift_online_cross_day)