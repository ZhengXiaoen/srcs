-- 	春节活动--新春充值 8
--#include "data\functions\Activity\SpringFestivalActivity.lua" once

-- 获得数据
function spring_pay_get_data(sysarg)
--	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
--	DataPack.writeByte(netPack, 8) -- 8 新春充值
--	DataPack.writeByte(netPack, 1) -- 1 下发数据
--	
--	local var = Actor.getStaticVar(sysarg)
--		
--	local flags = var.days.spring_pay_flags
--	if flags == nil then flags = 0 end
--		
--	DataPack.writeByte(netPack, flags)
--	
--	DataPack.flush(netPack)
end

-- 领取奖励
function spring_pay_get_awards(sysarg, packet)
--	local idx = DataPack.readByte(packet) -- 从1开始
--	if idx < 1 or idx > 8 then return end
--	
--	local cfg = SpringFestivalCfg.payMoney.payAwards[idx]
--	if cfg == nil then return end
--	
--	local var = Actor.getStaticVar(sysarg)
--	local payNum = var.days.PeyNum
--	if not payNum or payNum < cfg.payCount then
--		Actor.sendTipmsg(sysarg, "您今天的充值还没到" .. cfg.payCount .. "元宝", ttFlyTip)
--		return -- 当天还没有充够钱
--	end
--	
--	-- 检查是否已经领取了
--	local flags = var.days.spring_pay_flags
--	if flags == nil then flags = 0 end
--	
--	if System.getIntBit(flags, idx-1) ~= 0 then
--		Actor.sendTipmsg(sysarg, "不能重复领取", ttFlyTip)
--		return
--	end
--	
--	if Awards.Give(sysarg, cfg.award, LogIds.SpringPayAwards, tostring(idx)) == false then        
--		return	
--   	end
--	
--	flags = System.setIntBit(flags, idx-1, true)
--	var.days.spring_pay_flags = flags
--	
--	Actor.sendTipmsg(sysarg, "领取新春充值奖励成功", ttFlyTip)
--	
--	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
--	DataPack.writeByte(netPack, 8) -- 8 新春充值
--	DataPack.writeByte(netPack, 2) -- 2 领取奖励成功
--	DataPack.writeByte(netPack, idx)
--	DataPack.flush(netPack)
--
end

function spring_pay_main(sysarg, packet)
	
	--local msgId = DataPack.readByte(packet)
	--
	--if msgId == 1 then -- 获得数据
	--	spring_pay_get_data(sysarg)	
	--elseif msgId == 2 then -- 领取奖励
	--	spring_pay_get_awards(sysarg, packet)	
	--else
	--	print("error spring_pay_main, unknown msgId="..msgId)
	--end
end

register_spring_festival_func(8, spring_pay_main)