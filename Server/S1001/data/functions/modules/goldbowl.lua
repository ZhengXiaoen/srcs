-- 聚宝盆
--#include "data\config\modules\practice_room_cfg.lua" once -- for goldbowl_cfg

s2c_goldbowl_msgids = {
	send_data = 1, -- 下发聚宝盆数据
	add_exp = 2, -- 增加经验
	get_award = 3, -- 下发领取奖励结果
}


-- 下发聚宝盆数据
function send_goldbowl_data(sysarg)	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGoldbowlModule)
	DataPack.writeByte(netPack, s2c_goldbowl_msgids.send_data) -- 聚宝盆数据
	
	local var = Actor.getStaticVar(sysarg)
	local bowlData = var.days.bowlD
	
	local bowlExp = 0 -- 我的聚宝盆经验
	local flags = 0 -- 标志
	local actorName1 = "" -- 给好友1的聚宝盆增加经验
	local actorName2 = "" -- 给好友2的聚宝盆增加经验
	local actorName3 = "" -- 给好友3的聚宝盆增加经验
	if bowlData ~= nil then
		bowlExp = bowlData[1]	
		flags = bowlData[2]		
		actorName1 = bowlData[6]		
		actorName2 = bowlData[7]
		actorName3 = bowlData[8]
		
		if bowlExp == nil then bowlExp = 0 end
		if flags == nil then flags = 0 end
		if actorName1 == nil then actorName1 = "" end
		if actorName2 == nil then actorName2 = "" end
		if actorName3 == nil then actorName3 = "" end
	end
	
	local addCount = System.getIntByte(flags, 0) -- 当天我被几位好友点击增加经验了
	local added = System.getIntBit(flags, 8) -- 当天是否给自己增加了
				
	DataPack.writeUInt(netPack, bowlExp) 
	DataPack.writeByte(netPack, added) 
	DataPack.writeByte(netPack, addCount) 	
	
	DataPack.writeString(netPack, actorName1)
	DataPack.writeString(netPack, actorName2)
	DataPack.writeString(netPack, actorName3)	
			
	DataPack.flush(netPack)
end

function goldbowl_addexp(sysarg, packet)
	local var = Actor.getStaticVar(sysarg)
	local bowlData = var.days.bowlD
	
	if bowlData == nil then
		var.days.bowlD = {}
		bowlData = var.days.bowlD
	end
	
	local flags = bowlData[2]
	if flags == nil then flags = 0 end
	local added = System.getIntBit(flags, 8) -- 当天是否给自己增加了
	
	if added ~= 0 then
		Actor.sendTipmsg(sysarg, "您的聚宝盆今天已经增加过灵气了", ttFlyTip)
		return
	end
		
	local oldExp = bowlData[1]
	if oldExp == nil then
		oldExp = 0
	end
		
	bowlData[1] = oldExp + 20 -- 我的聚宝盆经验	
	-- 我今天是否已经增加经验过了
	flags = System.setIntBit(flags, 8, true)
	bowlData[2] = flags
	
	Actor.sendTipmsg(sysarg, string.format("您的聚宝盆增加了<(c0xFF00aaff)%d灵气>,灵气达到了 %d", 20, oldExp + 20), ttFlyTip)
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGoldbowlModule)
	DataPack.writeByte(netPack, s2c_goldbowl_msgids.add_exp) -- 增加经验
	DataPack.writeUInt(netPack, oldExp + 20) 
	DataPack.flush(netPack)
end

-- 领取聚宝盆奖励
function goldbowl_get_award(sysarg, packet)
	local var = Actor.getStaticVar(sysarg)
	local bowlData = var.days.bowlD
	if bowlData == nil then
		Actor.sendTipmsg(sysarg, "您的聚宝盆还没有聚集够100点灵气，不能领取", ttFlyTip)
		return
	end
	
	local bowlExp = bowlData[1]
	if bowlExp == nil or bowlExp < 100 then
		Actor.sendTipmsg(sysarg, "您的聚宝盆还没有聚集够100点灵气，不能领取", ttFlyTip)
		return
	end
	
	local bindYb = practice_room_cfg.goldbowl_cfg.bindYb
	Actor.changeMoney(sysarg, mtBindYuanbao, bindYb, LogIds.GoldbowlAward, "")
	bowlData[1] = 0 -- 清 0
	Actor.sendTipmsg(sysarg, "您已成功领取聚宝盆的绑定元宝"..bindYb, ttFlyTip)
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGoldbowlModule)
	DataPack.writeByte(netPack, s2c_goldbowl_msgids.get_award) -- 下发领取奖励结果
	DataPack.writeByte(netPack, 1)  -- 成功
	DataPack.flush(netPack)	
end

function add_friend_goldbowl_exp(sysarg, args)
	local destActorPtr = args[2]
	-- 已经检查过了与对方是否是好友
	
	local var = Actor.getStaticVar(sysarg)
	local bowlData = var.days.bowlD
			
	local actorId1 = 0 -- 给好友1的聚宝盆增加经验
	local actorId2 = 0 -- 给好友2的聚宝盆增加经验	
	local actorId3 = 0 -- 给好友3的聚宝盆增加经验	
	if bowlData ~= nil then
		actorId1 = bowlData[3]		
		actorId2 = bowlData[4]
		actorId3 = bowlData[5]		
		if actorId1 == nil then actorId1 = 0 end
		if actorId2 == nil then actorId2 = 0 end
		if actorId3 == nil then actorId3 = 0 end
	end
	
	if actorId1 ~= 0 and actorId2 ~= 0 and actorId3 ~= 0 then
		Actor.sendTipmsg(sysarg, "每天只能给三位好友的聚宝盆增加灵气", ttFlyTip)
		return
	end
	
	local destActorId = Actor.getIntProperty(destActorPtr, PROP_ENTITY_ID)
	if actorId1 == destActorId or actorId2 == destActorId or actorId3 == destActorId then
		Actor.sendTipmsg(sysarg, "您已经给该好友的聚宝盆增加过灵气了", ttFlyTip)
		return
	end
	
	-- 给对方聚宝盆增加经验
	local dstVar = Actor.getStaticVar(destActorPtr)
	local dstBowlData = dstVar.days.bowlD
	if dstBowlData == nil then
		dstVar.days.bowlD = {}
		dstBowlData = dstVar.days.bowlD
	end
	
	local dstFlags = dstBowlData[2]
	if dstFlags == nil then dstFlags = 0 end
	
	local addCount = System.getIntByte(dstFlags, 0) -- 当天我被几位好友点击增加经验了
	if addCount >= 3 then
		Actor.sendTipmsg(sysarg, "对方的聚宝盆已经被三位好友增加过灵气了", ttFlyTip)
		return
	end
		
	-- 给对方聚宝盆增加经验	
	local oldExp = 0
	if dstBowlData == nil then
		dstVar.days.bowlD = {}
		dstVar.days.bowlD[1] = 10
		dstBowlData = dstVar.days.bowlD
	else
		oldExp = dstVar.days.bowlD[1]
		if oldExp == nil then
			oldExp = 0
		end
		
		dstVar.days.bowlD[1] = oldExp + 10		
	end
	
	if bowlData == nil then
		var.days.bowlD = {}
		bowlData = var.days.bowlD
	end
	
	local myName = Actor.getName(sysarg)
	local destName = Actor.getName(destActorPtr)
	
	if actorId1 == 0 then
		bowlData[3]	= destActorId		
	elseif actorId2 == 0 then
		bowlData[4]	= destActorId		
	elseif actorId3 == 0 then
		bowlData[5]	= destActorId		
	end
	
	-- 记录的名字是谁给我加
	if dstBowlData[6] == nil then
		dstBowlData[6] = myName
	elseif dstBowlData[7] == nil then
		dstBowlData[7] = myName
	elseif dstBowlData[8] == nil then
		dstBowlData[8] = myName
	end
	
	dstFlags = System.setIntByte(dstFlags, 0, addCount + 1)
	dstBowlData[2] = dstFlags	
	
	Actor.sendTipmsg(sysarg, string.format("您给好友<(c0xFF00ff00)%s>的聚宝盆增加了<(c0xFF00aaff)%d灵气>", destName, 10), ttFlyTip)	
	
	Actor.sendTipmsg(destActorPtr, string.format("您的好友<(c0xFF00ff00)%s>给您的聚宝盆增加了<(c0xFF00aaff)%d灵气>", myName, 10), ttFlyTip)
	
	send_goldbowl_data(sysarg)
end

-- 客户端消息
function on_msg_goldbowl(sysarg, sysid, packet)

	if sysid ~= LogicCmd.miscSys.sub.cGoldbowlModule then
		print("error on_msg_goldbowl, sysid="..sysid)
		return
	end
	
	-- 开放等级
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if actorLevel < practice_room_cfg.need_level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, practice_room_cfg.need_level), ttFlyTip)
		return
	end
	
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 下发聚宝盆数据
		send_goldbowl_data(sysarg)
	elseif msgid == 2 then -- 增加聚宝盆经验
		goldbowl_addexp(sysarg, packet)
	elseif msgid == 3 then -- 领取聚宝盆奖励
		goldbowl_get_award(sysarg, packet)
	else
		print("error on_msg_goldbowl, unknown msgid="..msgid)
		return
	end

end
