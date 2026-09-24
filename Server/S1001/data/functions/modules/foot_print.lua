-- 足迹
--#include "data\config\modules\foot_print_cfg.lua" once -- 足迹配置

-- 玩家充值
function foot_print_OnActorPayMoney(sysarg, args)
	local yuanBao = args[1]
	-- 足迹本周累计充值
	local var = Actor.getStaticVar(sysarg)
	local FootPrintPayMoney = var.FootPrintPayMoney
	if FootPrintPayMoney == nil then
		FootPrintPayMoney = yuanBao
	else
		FootPrintPayMoney = FootPrintPayMoney + yuanBao
	end

	var.FootPrintPayMoney = FootPrintPayMoney

	-- 前端需要是否可领取的标志，所以这里下发数据给前端
	send_foot_print_pay_data(sysarg)
end

-- 仅用于击杀Boss模拟充值时，增加足迹/神盾每周累计充值
function foot_print_add_weekly_pay_money_by_killboss(sysarg, yuanBao)
	yuanBao = tonumber(yuanBao) or 0
	if yuanBao <= 0 then
		return
	end

	local var = Actor.getStaticVar(sysarg)
	local FootPrintPayMoney = var.FootPrintPayMoney
	if FootPrintPayMoney == nil then
		FootPrintPayMoney = yuanBao
	else
		FootPrintPayMoney = FootPrintPayMoney + yuanBao
	end

	var.FootPrintPayMoney = FootPrintPayMoney
	send_foot_print_pay_data(sysarg)
end

-- 在线跨天
function foot_print_OnExactNewDayArrive(sysarg)
	if System.getDayOfWeek() == 1 then -- 周一清0
		foot_print_clear_pay_gift_data(sysarg)
	end
end

-- 玩家登陆
function foot_print_OnPlayerLogin(sysarg, args)
	local isCrossDay = args[1]
	if not isCrossDay then return end
	
	local isCrossWeek = false -- 跨周
	local logoutTime = Actor.getLastLogoutTime(sysarg)
	local curTime = System.getCurrMiniTime()
	if (curTime - logoutTime) >= (7 * 86400) then
		isCrossWeek = true
	else
		local day1_of_week = System.getMiniTimeDayOfWeek(0, 1) -- 本周一时间
		if logoutTime < day1_of_week then
			isCrossWeek = true
		end
	end
	
	if isCrossWeek then
		foot_print_clear_pay_gift_data(sysarg)
	end
end

function foot_print_clear_pay_gift_data(sysarg)
	local var = Actor.getStaticVar(sysarg)
	var.FootPrintPayMoney = nil
	var.footPrintGiftFlags = nil
	var.shendunGiftFlags = nil 
end

-- 发送足迹充值数据
function send_foot_print_pay_data(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sFootPrint)
	DataPack.writeByte(netPack, 1) -- 足迹充值数据数据	
	
	-- 足迹本周累计充值
	local var = Actor.getStaticVar(sysarg)
	local FootPrintPayMoney = var.FootPrintPayMoney
	if FootPrintPayMoney == nil then FootPrintPayMoney = 0 end	
	
	local footPrintGiftFlags = var.footPrintGiftFlags
	if footPrintGiftFlags == nil then footPrintGiftFlags = 0 end	
	
	if var.shendunGiftFlags==nil then var.shendunGiftFlags=0 end 
	
	DataPack.writeUInt(netPack, FootPrintPayMoney)
	DataPack.writeUInt(netPack, footPrintGiftFlags)
	DataPack.writeUInt(netPack, var.shendunGiftFlags)
	
	DataPack.flush(netPack)
end

-- 领取足迹充值大礼包
function get_foot_print_pay_gift(sysarg, packet)
	-- 礼包索引（从1开始）
	local gift_idx = DataPack.readByte(packet)
	if gift_idx < 1 or gift_idx > 32 then
		return
	end
	
	local giftCfg = foot_print_cfg.gift_list[gift_idx]
	if giftCfg == nil then return end	
	
	local var = Actor.getStaticVar(sysarg)
	local FootPrintPayMoney = var.FootPrintPayMoney
	if FootPrintPayMoney == nil then FootPrintPayMoney = 0 end
	
	if FootPrintPayMoney < giftCfg.needPay then
		Actor.sendTipmsg(sysarg, "本周累计充值达到 "..giftCfg.needPay.." 元宝才可以领取该礼包", ttFlyTip)
		return
	end
	
	local footPrintGiftFlags = var.footPrintGiftFlags
	if footPrintGiftFlags == nil then footPrintGiftFlags = 0 end
	
	local f = System.getIntBit(footPrintGiftFlags, gift_idx - 1)
	if f ~= 0 then
		Actor.sendTipmsg(sysarg, "该礼包您已经领取了", ttFlyTip)
		return
	end
	
	if not Awards.CheckBagGridCount(sysarg, giftCfg.award) then
		return
	end

	if Awards.GiveNoCheck(sysarg, giftCfg.award, LogIds.footPrintPayPift, tostring(gift_idx)) == false then
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("Awards.Give error, get_foot_print_pay_gift actorid="..actorId..",gift_idx="..gift_idx)
	end
	
	footPrintGiftFlags = System.setIntBit(footPrintGiftFlags, gift_idx - 1, true)
	var.footPrintGiftFlags = footPrintGiftFlags
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sFootPrint)
	DataPack.writeByte(netPack, 2) -- 领取足迹充值大礼包	
	DataPack.writeByte(netPack, gift_idx)	
	DataPack.flush(netPack)
	
	Actor.sendTipmsg(sysarg, "您成功领取了足迹充值大礼包", ttFlyTip)
end

--领取神盾充值大礼包
function get_shendun_pay_gift(sysarg, packet)
	-- 礼包索引（从1开始）
	local gift_idx = DataPack.readByte(packet)
	if gift_idx < 1 or gift_idx > 32 then
		return
	end
	
	local giftCfg = foot_print_cfg.shendun_gift_list[gift_idx]
	if giftCfg == nil then return end	
	
	local var = Actor.getStaticVar(sysarg)
	local FootPrintPayMoney = var.FootPrintPayMoney
	if FootPrintPayMoney == nil then FootPrintPayMoney = 0 end
	
	if FootPrintPayMoney < giftCfg.needPay then
		Actor.sendTipmsg(sysarg, "本周累计充值达到 "..giftCfg.needPay.." 元宝才可以领取该礼包", ttFlyTip)
		return
	end
	
	local shendunGiftFlags = var.shendunGiftFlags
	if shendunGiftFlags == nil then shendunGiftFlags = 0 end
	
	local f = System.getIntBit(shendunGiftFlags, gift_idx - 1)
	if f ~= 0 then
		Actor.sendTipmsg(sysarg, "该礼包您已经领取了", ttFlyTip)
		return
	end
	
	if not Awards.CheckBagGridCount(sysarg, giftCfg.award) then
		return
	end

	if Awards.GiveNoCheck(sysarg, giftCfg.award, LogIds.shendunPayPift, tostring(gift_idx)) == false then
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("Awards.Give error, shendunPayPift actorid="..actorId..",gift_idx="..gift_idx)
	end
	
	shendunGiftFlags = System.setIntBit(shendunGiftFlags, gift_idx - 1, true)
	var.shendunGiftFlags = shendunGiftFlags
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sFootPrint)
	DataPack.writeByte(netPack, 3) -- 领取足迹充值大礼包	
	DataPack.writeByte(netPack, gift_idx)	
	DataPack.flush(netPack)
	
	Actor.sendTipmsg(sysarg, "您成功领取了神盾充值大礼包", ttFlyTip)
end


function foot_print_main(sysarg, sysid, packet)
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 获得足迹充值数据
		send_foot_print_pay_data(sysarg)
	elseif msgid == 2 then -- 领取足迹充值大礼包
		get_foot_print_pay_gift(sysarg, packet)
	elseif msgid ==3 then --领取神盾充值大礼包
		get_shendun_pay_gift(sysarg, packet)
	else
		print("error foot_print_main, unknown msgid="..msgid)
		return
	end
end

registerLuaEventCallback(LuaEventId.ActorPayMoney, foot_print_OnActorPayMoney)
registerLuaEventCallback(LuaEventId.ActorExactNewDayArrive, foot_print_OnExactNewDayArrive)
registerLuaEventCallback(LuaEventId.PlayerLogin, foot_print_OnPlayerLogin)