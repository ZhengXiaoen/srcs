-- 	春节活动--绝版年货 5
--#include "data\functions\Activity\SpringFestivalActivity.lua" once

-- 获得数据
function spring_goods_get_data(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack, 5) -- 5 绝版年货
	DataPack.writeByte(netPack, 1) -- 1 下发数据
	
	local var = Actor.getStaticVar(sysarg)
	ClearAllSpringData(sysarg)	
	local flags = var.spring_flags
	if flags == nil then flags = 0 end
	
	flags = System.getInt64Byte(flags, 1)
	
	DataPack.writeByte(netPack, flags)
	
	DataPack.flush(netPack)
end

-- 购买年货
function spring_goods_buy(sysarg, packet)
	local idx = DataPack.readByte(packet) -- 从1开始
	if idx < 1 or idx > 8 then return end
	
	local cfg = SpringFestivalCfg.goods.itemList[idx]
	if cfg == nil then return end
	
	-- 检查是否已经购买了
	local var = Actor.getStaticVar(sysarg)
	ClearAllSpringData(sysarg)
	local flags = var.spring_flags
	if flags == nil then flags = 0 end
	
	if System.getInt64Bit(flags, 8 + idx-1) ~= 0 then
		Actor.sendTipmsg(sysarg, "不能重复购买", ttFlyTip)
		return
	end
	
	if Item.getBagEmptyGridCount(sysarg) <= 0 then
		Actor.sendTipmsg(sysarg,"包裹已满，请清理包裹后再试!",ttFlyTip)
		return
	end
	
	if Actor.getMoneyCount(sysarg,mtYuanbao) < cfg.yb then
         Actor.sendTipmsg(sysarg, "元宝不足,无法购买!", ttFlyTip)
        return
    end
    
    Actor.changeMoney(sysarg, mtYuanbao, -cfg.yb, LogIds.SpringBuyGoods, tostring(idx))
        
	Actor.addItem(sysarg, cfg.itemId,0,0,cfg.count,cfg.bind,0,"spring_goods")
	
	flags = System.setInt64Bit(flags, 8 + idx-1, true)
	var.spring_flags = flags
	
	Actor.sendTipmsg(sysarg, "购买年货成功", ttFlyTip)
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack, 5) -- 5 绝版年货
	DataPack.writeByte(netPack, 2) -- 2 购买年货成功
	DataPack.writeByte(netPack, idx)
	DataPack.flush(netPack)
	
	local noticeStr = string.format("<(n%s)>购买了<(c0xFF0090ff)%s>！<抢购年货！/@@showWin,243>",Actor.getName(sysarg),Item.getItemName(cfg.itemId))
	System.broadcastTipmsg(noticeStr, ttChatWindow)
end

function spring_goods_main(sysarg, packet)
	local msgId = DataPack.readByte(packet)
	
	if msgId == 1 then -- 获得数据
		spring_goods_get_data(sysarg)	
	elseif msgId == 2 then -- 购买年货
		spring_goods_buy(sysarg, packet)	
	else
		print("error spring_goods_main, unknown msgId="..msgId)
	end
end

register_spring_festival_func(5, spring_goods_main)