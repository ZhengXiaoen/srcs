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

-- 旧兼容入口：正常 Boss 已通过 ActorPayMoney 累计，勿同时调用两条入口。
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
	-- 保留旧周期已受理但未发完的凭据，新周期使用独立领取位。
	var.weeklyPayGiftPeriod = (var.weeklyPayGiftPeriod or 0) + 1
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

-- 补完旧周期已经受理的奖励，不占用本周领取位，也不重新核算旧周充值。
function retry_previous_weekly_pay_gifts(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local period = var.weeklyPayGiftPeriod or 0
	if var.weeklyPayGiftGrants == nil then return end
	for key, receipt in pairs(var.weeklyPayGiftGrants) do
		if receipt.period ~= period and receipt.progress and receipt.progress.items then
			local logId = receipt.kind == "foot" and LogIds.footPrintPayPift or LogIds.shendunPayPift
			if Awards.GiveTracked(sysarg, receipt.progress.items, receipt.progress, logId, "补发往期周礼包"..receipt.giftIndex) then
				var.weeklyPayGiftGrants[key] = nil
			end
		end
	end
end

local function grant_weekly_pay_gift(sysarg, packet, isShendun)
	local giftIndex = DataPack.readByte(packet)
	if giftIndex < 1 or giftIndex > 32 then return end
	local var = Actor.getStaticVar(sysarg)
	local flagName = isShendun and "shendunGiftFlags" or "footPrintGiftFlags"
	local flags = var[flagName] or 0
	if System.getIntBit(flags, giftIndex - 1) ~= 0 then
		Actor.sendTipmsg(sysarg, "该礼包您已经领取了", ttFlyTip)
		return
	end
	local period = var.weeklyPayGiftPeriod or 0
	local kind = isShendun and "shendun" or "foot"
	local key = kind..":"..period..":"..giftIndex
	local receipts = var.weeklyPayGiftGrants
	local receipt = receipts and receipts[key]
	local awards = receipt and receipt.progress and receipt.progress.items
	local giftList = foot_print_cfg and (isShendun and foot_print_cfg.shendun_gift_list or foot_print_cfg.gift_list)
	local giftCfg = giftList and giftList[giftIndex]
	if awards == nil and giftCfg == nil then return end
	if awards == nil then
		if receipt == nil and (var.FootPrintPayMoney or 0) < giftCfg.needPay then
			Actor.sendTipmsg(sysarg, "本周累计充值达到 "..giftCfg.needPay.." 元宝才可以领取该礼包", ttFlyTip)
			return
		end
		local progress = receipt and receipt.progress or {}
		if Awards.PrepareTracked(giftCfg.award, progress) ~= true then return end
		awards = progress.items
		if receipt == nil then
			if receipts == nil then
				receipts = {}
				var.weeklyPayGiftGrants = receipts
			end
			receipt = {period = period, kind = kind, giftIndex = giftIndex, progress = progress}
			receipts[key] = receipt
		else
			receipt.progress = progress
		end
	end
	local logId = isShendun and LogIds.shendunPayPift or LogIds.footPrintPayPift
	if not Awards.GiveTracked(sysarg, awards, receipt.progress, logId, tostring(giftIndex)) then return end
	var[flagName] = System.setIntBit(flags, giftIndex - 1, true)
	receipts[key] = nil
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sFootPrint)
	DataPack.writeByte(netPack, isShendun and 3 or 2)
	DataPack.writeByte(netPack, giftIndex)
	DataPack.flush(netPack)
	Actor.sendTipmsg(sysarg, isShendun and "您成功领取了神盾充值大礼包" or "您成功领取了足迹充值大礼包", ttFlyTip)
end

function get_foot_print_pay_gift(sysarg, packet)
	grant_weekly_pay_gift(sysarg, packet, false)
end

function get_shendun_pay_gift(sysarg, packet)
	grant_weekly_pay_gift(sysarg, packet, true)
end

function foot_print_main(sysarg, sysid, packet)
	local msgid = DataPack.readByte(packet)
	if msgid >= 1 and msgid <= 3 then retry_previous_weekly_pay_gifts(sysarg) end
		
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