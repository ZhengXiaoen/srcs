-- 新春红包 1
--#include "data\functions\Activity\SpringFestivalActivity.lua" once

function spring_redpacket_get_data(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack, 1) -- 1 新春红包
	DataPack.writeByte(netPack, 1) -- 1 下发数据
	
	ClearAllSpringData(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	local totalCount = var.spring_redpacket_totalCount -- 活动期间发送的红包数
	
	local todayCount = 0 -- 今天发送的红包数
	local actorid1 = var.days.spring_redpacket_actorid1
	local actorid2 = var.days.spring_redpacket_actorid2
	local actorid3 = var.days.spring_redpacket_actorid3
	if actorid1 ~= nil then
		todayCount = todayCount + 1
	end
	
	if actorid2 ~= nil then
		todayCount = todayCount + 1
	end
	
	if actorid3 ~= nil then
		todayCount = todayCount + 1
	end	
	
	local flags = var.spring_flags
	if flags == nil then flags = 0 end
	
	flags = System.getInt64Byte(flags, 0)
	
	DataPack.writeUInt(netPack, totalCount)
	DataPack.writeUInt(netPack, todayCount)
	DataPack.writeByte(netPack, flags)
	
	DataPack.flush(netPack)
end

-- 发红包
function spring_redpacket_send_redpacket(sysarg, packet)
	local cfg = SpringFestivalCfg.RedPacket
	
	local money = DataPack.readInt(packet)
	if money < cfg.ybmin or money > cfg.ybmax then
		Actor.sendTipmsg(sysarg, "红包金额不对", ttFlyTip)
		return
	end
	
	local destActorName = DataPack.readString(packet)
	if destActorName == "" then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	ClearAllSpringData(sysarg)
	
	local todayCount = 0 -- 今天发送的红包数
	local actorid1 = var.days.spring_redpacket_actorid1
	local actorid2 = var.days.spring_redpacket_actorid2
	local actorid3 = var.days.spring_redpacket_actorid3
	if actorid1 ~= nil then
		todayCount = todayCount + 1
	else
		actorid1 = 0
	end
	
	if actorid2 ~= nil then
		todayCount = todayCount + 1
	else
		actorid2 = 0
	end
	
	if actorid3 ~= nil then
		todayCount = todayCount + 1
	else
		actorid3 = 0
	end
		
	if todayCount >= 3 then
		Actor.sendTipmsg(sysarg, "每天最多只能发送3个红包", ttFlyTip)
		return
	end
	
	local destActor = Actor.getActorByName(destActorName)
	if destActor == nil then
		Actor.sendTipmsg(sysarg, "对方不在线或者没有该玩家", ttFlyTip)
		return
	end
	
	local myActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	local destActorId = Actor.getIntProperty(destActor,PROP_ENTITY_ID)
	if myActorId == destActorId then
		Actor.sendTipmsg(sysarg, "不能给自己发红包", ttFlyTip)
		return
	end
	
	if Actor.getIntProperty(destActor, PROP_CREATURE_LEVEL) < 80 then
		Actor.sendTipmsg(sysarg, "该玩家等级不足80级", ttFlyTip)
		return
	end
	
	if destActorId == actorid1 or destActorId == actorid2 or destActorId == actorid3 then
		Actor.sendTipmsg(sysarg, "该玩家你已经发过红包了", ttFlyTip)
		return
	end
	
	if Actor.changeMoney(sysarg, mtYuanbao, -money, LogIds.SpringSendRedpacket, "send redpacket") == false then
		return -- 元宝不足
	end
	
	if actorid1 == 0 then
		var.days.spring_redpacket_actorid1 = destActorId
	elseif actorid2 == 0 then
		var.days.spring_redpacket_actorid2 = destActorId
	else
		var.days.spring_redpacket_actorid3 = destActorId
	end
	
	local totalCount = var.spring_redpacket_totalCount -- 活动期间发送的红包数
	if totalCount ~= nil then
		var.spring_redpacket_totalCount = totalCount + 1
	else
		var.spring_redpacket_totalCount = 1
	end
	
	local myName = Actor.getName(sysarg)
	local title = string.format("%s#%d", myName, money) -- 前端特殊处理
		
	-- "新春红包" 不能改，前端跟据 btnTxt 来确定消息类型是 "新春红包"
	SendScriptOfflineMsg(destActorId, title, "新春红包", OfflineMsgIds.spring_redpacket, tostring(money))
	
	Actor.sendTipmsg(sysarg, "发放新春红包成功", ttFlyTip)
	
	local noticeStr = string.format("<(n%s)>赠送<(n%s)>新春红包！祝福他新春快乐！<赠送红包给好友！/@@showWin,243>",myName,destActorName)
	System.broadcastTipmsg(noticeStr, ttChatWindow)
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack, 1) -- 1 新春红包
	DataPack.writeByte(netPack, 2) -- 2 发送红包成功
	DataPack.flush(netPack)
end

-- 领取奖励
function spring_redpacket_get_awards(sysarg, packet)
	local idx = DataPack.readByte(packet) -- 领取奖励的索引，从1开始
	if idx < 1 or idx > 8 then return end
		
	local var = Actor.getStaticVar(sysarg)
	ClearAllSpringData(sysarg)
	
	local totalCount = var.spring_redpacket_totalCount -- 活动期间发送的红包数	
	
	local cfg = SpringFestivalCfg.RedPacket.awardList[idx]
	if cfg == nil then return end
	
	if totalCount < cfg.needCount then
		Actor.sendTipmsg(sysarg, "要发送"..cfg.needCount.."封红包才能领取该奖励", ttFlyTip)
		return
	end
	
	-- 检查是否已经领了
	local flags = var.spring_flags
	if flags == nil then flags = 0 end
	
	if System.getInt64Bit(flags, idx-1) ~= 0 then
		Actor.sendTipmsg(sysarg, "不能重复领取该奖励", ttFlyTip)
		return
	end	
		
	if Awards.Give(sysarg, cfg.award, LogIds.SpringAwards, tostring(idx)) == false then        
		return	
   	end
	
	flags = System.setInt64Bit(flags, idx-1, true)
	var.spring_flags = flags
	
	Actor.sendTipmsg(sysarg, "领取新春奖励成功", ttFlyTip)
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack, 1) -- 1 新春红包
	DataPack.writeByte(netPack, 3) -- 3 领取奖励成功
	DataPack.writeByte(netPack, idx)
	DataPack.flush(netPack)
end

-- 返回 true 则删除该消息，返回 false 则不删除
function OfflineMsg_get_spring_redpacket(sysarg, msgId, strParams)
	local money = tonumber(strParams)
	if money == nil or money == 0 then return true end

	Actor.changeMoney(sysarg, mtYuanbao, money, LogIds.SpringRecvRedpacket, "revc redpacket")
	Actor.sendTipmsg(sysarg, "你成功领取新春红包："..money.."元宝。", ttFlyTip)
	
	return true
end

function spring_redpacket_main(sysarg, packet)
	local msgId = DataPack.readByte(packet)
	
	if msgId == 1 then -- 获取数据
		spring_redpacket_get_data(sysarg)
	elseif msgId == 2 then -- 发红包
		spring_redpacket_send_redpacket(sysarg, packet)
	elseif msgId == 3 then -- 领取奖励
		spring_redpacket_get_awards(sysarg, packet)
	else
		print("error spring_redpacket_main, unknown msgId="..msgId)
	end
end

register_spring_festival_func(1, spring_redpacket_main)

-- 注册离线消息处理器
OfflineMsgFuncs[OfflineMsgIds.spring_redpacket] = OfflineMsg_get_spring_redpacket