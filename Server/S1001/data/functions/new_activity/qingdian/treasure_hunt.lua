-- 庆典活动--寻宝
--#include "data\config\new_activity\qingdian\treasure_hunt_cfg.lua" once

-- 当天时否在庆典活动期间
function qd_is_qingdian_open_time()
	local svar = System.getStaticVar()
	if svar.QingDian_openDay == nil then 
		return false
	end
	
	local curOpenDay = svar.isDringQingDianActivity
	if curOpenDay == nil or curOpenDay < 1 or curOpenDay > svar.QingDian_openDay then 
		return false
	end
	
	return true
end

-- 下发中秋月饼收集活动数据
function qd_send_moon_activity_data(sysarg)
	-- 检查是否在活动期间
	local open_time = treasure_hunt_cfg.moon_activity.open_time
	if not System.isInDateRange(open_time[1], open_time[2], open_time[3], 0, 0, 0, open_time[4], open_time[5], open_time[6], 23, 59, 59) then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local qd_moon_flags = var.days.qd_moon_flags
	if qd_moon_flags == nil then qd_moon_flags = 0 end
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
	DataPack.writeByte(netPack, 16) -- 中秋月饼收集活动类型为 16	
	DataPack.writeUInt(netPack, qd_moon_flags)		
	DataPack.flush(netPack)	
end

--中秋月饼兑换
function qd_moon_exchange(sysarg, packet)
	-- 检查是否在活动期间
	local open_time = treasure_hunt_cfg.moon_activity.open_time
	if not System.isInDateRange(open_time[1], open_time[2], open_time[3], 0, 0, 0, open_time[4], open_time[5], open_time[6], 23, 59, 59) then
		return
	end
	
	local index = DataPack.readByte(packet)
	if index < 1 or index > 10 then return end -- 3 x 10 < 32
	
	local activity_cfg = treasure_hunt_cfg.moon_activity
	local item_cfg = activity_cfg.list[index]
	if item_cfg == nil then return end
	
	local var = Actor.getStaticVar(sysarg)
	local qd_moon_flags = var.days.qd_moon_flags
	if qd_moon_flags == nil then qd_moon_flags = 0 end
	
	-- 每日每人每档最多可兑换3次
	local start_bit = (index - 1) * 3
	if start_bit > 30 then return end
	
	local cur_bit = -1
	for i = start_bit, start_bit + 2 do
		local f = System.getIntBit(qd_moon_flags, i)
		if (f == 0) then
			cur_bit = i
			break
		end
	end
	
	if cur_bit == -1 then
		Actor.sendTipmsg(sysarg, "今天的兑换次数已用完，请您明天再来", ttFlyTip)
		return
	end
	
	if Actor.getItemCount(sysarg, activity_cfg.moon_id) < item_cfg.moon_count then
		local moon_name = Item.getItemName(activity_cfg.moon_id)
		Actor.sendTipmsg(sysarg, string.format("需要收集%d个%s", item_cfg.moon_count, moon_name), ttFlyTip)
		return
	end
	
	if Awards.CheckBagGridCount(sysarg, item_cfg.award) ~= true then
		return 
	end
	
	if Actor.removeItem(sysarg, activity_cfg.moon_id, item_cfg.moon_count, -1,-1,-1, "扣月饼", LogIds.QdMoonExchange) < item_cfg.moon_count then			
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("delete item error, qd_moon_exchange actorid="..actorId)
		return
	end
	
	if Awards.GiveNoCheck(sysarg, item_cfg.award, LogIds.QdMoonExchange, "月饼兑换") == false then
		Actor.sendTipmsg(sysarg, "给奖励失败!", ttFlyTip)
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("Awards.Give fail, qd_moon_exchange actorid="..actorId..",index="..index)
		return
	end
	
	qd_moon_flags = System.setIntBit(qd_moon_flags, cur_bit, true)
	var.days.qd_moon_flags = qd_moon_flags
	
	Actor.sendTipmsg(sysarg, "月饼兑换奖励成功", ttFlyTip)
	
	qd_send_moon_activity_data(sysarg)
end

-- 下发寻宝赠送豪礼活动数据
function qd_send_hunt_times_activity_data(sysarg)
	if treasure_hunt_cfg.hunt_times.isOpen == false then return end
	if not qd_is_qingdian_open_time() then return end	
	
	local var = Actor.getStaticVar(sysarg)	
	if var.newdays == nil then var.newdays = {} end
		
	local XunBaoTime = var.newdays.XunBaoTime
	if XunBaoTime == nil then XunBaoTime = 0 end
		
	local qd_hunt_times_flags = var.newdays.qd_hunt_times_flags
	if qd_hunt_times_flags == nil then qd_hunt_times_flags = 0 end
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
	DataPack.writeByte(netPack, 17) -- 寻宝赠送豪礼活动类型为 17
	DataPack.writeUInt(netPack, XunBaoTime)	-- 寻宝次数
	DataPack.writeUInt(netPack, qd_hunt_times_flags)		
		
	DataPack.flush(netPack)	
end

--寻宝赠送豪礼
function qd_get_hunt_times_award(sysarg, packet)
	if treasure_hunt_cfg.hunt_times.isOpen == false then return end
	if not qd_is_qingdian_open_time() then return end
	
	local var = Actor.getStaticVar(sysarg)
	if var.newdays == nil then var.newdays = {} end
	
	local XunBaoTime = var.newdays.XunBaoTime
	if XunBaoTime == nil then XunBaoTime = 0 end
	
	local index = DataPack.readByte(packet)
	if index < 1 or index > 32 then return end
	
	local item_cfg = treasure_hunt_cfg.hunt_times[index]
	if item_cfg == nil then return end
	
	if XunBaoTime < item_cfg.times then
		Actor.sendTipmsg(sysarg, "您今天的寻宝次数不足"..item_cfg.times.."次", ttFlyTip)
		return
	end
	
	local qd_hunt_times_flags = var.newdays.qd_hunt_times_flags
	if qd_hunt_times_flags == nil then qd_hunt_times_flags = 0 end
	
	local f = System.getIntBit(qd_hunt_times_flags, index-1)
	if (f ~= 0) then
		Actor.sendTipmsg(sysarg, "该奖励已经领取", ttFlyTip)
		return
	end
	
	if Awards.CheckBagGridCount(sysarg, item_cfg.award) ~= true then
		return 
	end
	
	if Awards.GiveNoCheck(sysarg, item_cfg.award, LogIds.QdHuntTimesAward, tostring(index)) == false then
		Actor.sendTipmsg(sysarg, "赠送豪礼失败!", ttFlyTip)
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("Awards.Give fail, qd_get_hunt_times_award actorid="..actorId..",index="..index)
		return
	end
	
	qd_hunt_times_flags = System.setIntBit(qd_hunt_times_flags, index-1, true)
	var.newdays.qd_hunt_times_flags = qd_hunt_times_flags
	
	Actor.sendTipmsg(sysarg, "赠送豪礼成功!", ttFlyTip)
	
	qd_send_hunt_times_activity_data(sysarg)
end

-- 下发珍宝阁活动数据
function qd_send_shop_activity_data(sysarg)
	if treasure_hunt_cfg.shop.isOpen == false then return end
	if not qd_is_qingdian_open_time() then return end
	
	local var = Actor.getStaticVar(sysarg)
	local dmkj_qingdian_point = var.dmkj_qingdian_point
	if dmkj_qingdian_point == nil then dmkj_qingdian_point = 0 end	
	
	local treasureHuntValue = var.TreasureHuntValue
	if treasureHuntValue == nil then treasureHuntValue = 0 end
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
	DataPack.writeByte(netPack, 18) -- 珍宝阁活动类型为 18		
	DataPack.writeUInt(netPack, dmkj_qingdian_point) -- 珍宝积分
	DataPack.writeUInt(netPack, treasureHuntValue) -- 宝藏积分
	DataPack.flush(netPack)	
end

--购买珍宝阁物品
function qd_buy_shop_item(sysarg, packet)
	if treasure_hunt_cfg.shop.isOpen == false then return end
	if not qd_is_qingdian_open_time() then return end
	
	local var = Actor.getStaticVar(sysarg)
	local dmkj_qingdian_point = var.dmkj_qingdian_point
	if dmkj_qingdian_point == nil or dmkj_qingdian_point <= 0 then
		Actor.sendTipmsg(sysarg, "珍宝积分不足，可通过寻宝获得噢！", ttFlyTip)
		return
	end
	
	local index = DataPack.readByte(packet)	
	local item_cfg = treasure_hunt_cfg.shop[index]
	if item_cfg == nil then return end
	
	if dmkj_qingdian_point < item_cfg.price then
		Actor.sendTipmsg(sysarg, "珍宝积分不足，可通过寻宝获得噢！", ttFlyTip)
		return
	end
	
	local isBind = item_cfg.bind ~= 0 and true or false		
	if not Actor.canAddItem(sysarg, item_cfg.itemId, item_cfg.count, 0, 0, isBind) then
		Actor.sendTipmsg(sysarg, "背包空格不足，还请进行清理后购买", ttFlyTip)
		return
	end
	
	local new_point = dmkj_qingdian_point - item_cfg.price
	local logComment = string.format("%d,%d", index, new_point)
	if Actor.addItem(sysarg, item_cfg.itemId, 0, 0, item_cfg.count, item_cfg.bind, 0, logComment, LogIds.QdBuyShopItem) <= 0 then
		return
	end
	
	var.dmkj_qingdian_point = new_point
	
	-- 下发珍宝阁活动数据
	qd_send_shop_activity_data(sysarg)
end

--珍宝积分兑换为宝藏积分
function qd_qingdian_point_exchange(sysarg, value)
	if treasure_hunt_cfg.shop.isOpen == false then return end
	if value <= 0 then return end
	
	-- 庆典活动期间才能兑换
	if not qd_is_qingdian_open_time() then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local dmkj_qingdian_point = var.dmkj_qingdian_point
	if dmkj_qingdian_point == nil or dmkj_qingdian_point == 0 then
		Actor.sendTipmsg(sysarg, "珍宝积分不足，可通过寻宝获得噢！", ttFlyTip)
		return
	end
	
	if dmkj_qingdian_point < value then
		Actor.sendTipmsg(sysarg, "珍宝积分不足，无法兑换！", ttFlyTip)
		return
	end
	
	var.dmkj_qingdian_point = dmkj_qingdian_point - value
	
	-- 增加宝藏积分
	local oldTreasureHuntValue = var.TreasureHuntValue
	if oldTreasureHuntValue == nil then
		var.TreasureHuntValue = value
	else
		var.TreasureHuntValue = oldTreasureHuntValue + value
	end
	
	-- 下发珍宝阁活动数据
	qd_send_shop_activity_data(sysarg)
end