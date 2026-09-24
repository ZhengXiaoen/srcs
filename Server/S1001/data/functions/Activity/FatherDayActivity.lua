--#include "data\config\activity\FatherDay.lua" once

-- 是否在父情节活动时间内
function is_FatherDay_time()	
	local time = FatherDayConfig.time
	return System.isInDateRange(time[1], time[2], time[3], 0, 0, 0, time[4], time[5], time[6], 23, 59, 59)
end

FatherDayActivity = function (sysarg, sysid, packet)

	--是否在父情节活动时间内
	if is_FatherDay_time()==false then 	
		return 
	end
	
	local msgid = DataPack.readByte(packet)
	
	if msgid == 0 then	--获取数据
		GetTheFatherDayInfo(sysarg,DataPack.readByte(packet))
	elseif msgid == 1 then --登录礼包
		GetFatherDayLoginGift(sysarg)
	elseif msgid == 2 then --充值礼包
		GetFatherDayChongZhiGift(sysarg)
	elseif msgid == 3 then --在线奖励
		--GetFatherDayOnlineGift(sysarg,packet)
	end
end

GetFatherDayLoginGift = function (sysarg)

	--是否在父情节活动时间内
	if is_FatherDay_time()==false then 	
		return 
	end
	
	--没有配置
	local award = FatherDayConfig.LoginGift.award
	if not award then 
		print("The fatherDay Login Award Config is nil ,Read file error")
		return  
	end
	
	--判断是否领取过
	local var = Actor.getStaticVar(sysarg)
	if var.days.FDLoginGift ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.FatherDayActivity,"fatherDay Login Gift")
	if bResult == false then
		print("fatherDay Login Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.FDLoginGift = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	--System.broadcastTipmsg(string.format("玩家<(n%s)>领取合服活动的登陆礼包,<我也要领取/@@showWin,197,0>",Actor.getName(sysarg)),ttChatWindow)
	--提示
	System.sendCommonLog(LogIds.FatherDayActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"fatherDay Login Gift")

	GetTheFatherDayInfo(sysarg,1)
	--和前端对接
end

GetFatherDayChongZhiGift= function (sysarg)
	--是否在父情节活动时间内
	if is_FatherDay_time()==false then 	
		return 
	end
	
	--没有配置
	local award = FatherDayConfig.ChongZhiGift[1].award
	if not award then 
		print("The fatherDay ChongZhi Award Config is nil ,Read file error")
		return  
	end
	
	--充值不够
	local var = Actor.getStaticVar(sysarg)
	local nPeyCount = var.days.PeyNum
	if not nPeyCount then 
		Actor.sendTipmsg(sysarg,string.format("你今天充值不足%s元宝，无法领取奖励",FatherDayConfig.ChongZhiGift[1].needChongzhiYB),ttFlyTip)
		return
	elseif nPeyCount < FatherDayConfig.ChongZhiGift[1].needChongzhiYB then
		Actor.sendTipmsg(sysarg,string.format("你今天充值不足%s元宝，无法领取奖励",FatherDayConfig.ChongZhiGift[1].needChongzhiYB),ttFlyTip)
		return
	end
	
	
	--判断是否领取过
	if var.days.FDChongZhiGift ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.FatherDayActivity,"fatherDay ChongZhi Gift")
	if bResult == false then
		print("fatherDay ChongZhi Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.FDChongZhiGift = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	--System.broadcastTipmsg(string.format("玩家<(n%s)>领取合服活动的登陆礼包,<我也要领取/@@showWin,197,0>",Actor.getName(sysarg)),ttChatWindow)
	--提示
	System.sendCommonLog(LogIds.FatherDayActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"fatherDay ChongZhi Gift")

	GetTheFatherDayInfo(sysarg,2)
	--和前端对接
end

GetFatherDayOnlineGift = function(sysarg, packet)

	--是否在父情节活动时间内
	if is_FatherDay_time()==false then 	
		return 
	end
	
	--判断参数是否存在
	local index = DataPack.readByte(packet)
	
	if index<1 or index>3  then
		return 
	end
	
	local config = FatherDayConfig.OnlineGift[index]
	if config==nil then 
		print("The fatherDay online Award Config is nil ,Read file error")
		return 
	end
	
	--判断是否够时间领取
	local onlineTime = Actor.getTodayOnlineTime(sysarg)
	if onlineTime < config.OnlineTime then -- 还没到领取时间
		Actor.sendTipmsg(sysarg,"在线时间不够,不能领取",ttFlyTip)
		return
	end
	
	--判断是否领取过该奖励
	local var = Actor.getStaticVar(sysarg)
	if var.days.FDOnlineGift ==nil then var.days.FDOnlineGift={} end
	if var.days.FDOnlineGift[index] ~= nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end	
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, config.award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, config.award, LogIds.FatherDayActivity,index..":fatherDay online Gift")
	if bResult == false then
		print("fatherDay online Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.FDOnlineGift[index] = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	--System.broadcastTipmsg(string.format("玩家<(n%s)>领取合服活动的登陆礼包,<我也要领取/@@showWin,197,0>",Actor.getName(sysarg)),ttChatWindow)
	--提示
	System.sendCommonLog(LogIds.FatherDayActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,index..":fatherDay online Gift")

	GetTheFatherDayInfo(sysarg,3)
	--和前端对接
end

GetTheFatherDayInfo = function(sysarg,index)
	local var = Actor.getStaticVar(sysarg)
	if index== 1 then
		local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sFatherDayActivity)
        DataPack.writeByte(netPack,1)
		if (var.days.FDLoginGift ==nil) then 
			DataPack.writeByte(netPack,1)
		else 
			DataPack.writeByte(netPack,0)
		end
        DataPack.flush(netPack)
	elseif index== 2 then
		local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sFatherDayActivity)
        DataPack.writeByte(netPack,2)
		if (var.days.FDChongZhiGift ==nil) then 
			DataPack.writeByte(netPack,1)
		else 
			DataPack.writeByte(netPack,0)
		end
        DataPack.flush(netPack)
	elseif index== 3 then  --屏蔽在线时间领取
		--local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sFatherDayActivity)
		----local onlineTime = Actor.getTodayOnlineTime(sysarg)
        --DataPack.writeByte(netPack,3)
		----DataPack.writeUInt(npack, onlineTime)
		--DataPack.writeByte(netPack,#FatherDayConfig.OnlineGift)
		--if var.days.FDOnlineGift ==nil then var.days.FDOnlineGift={} end
		--for i=1,#FatherDayConfig.OnlineGift do
		--	if (var.days.FDOnlineGift[i] ==nil) then 
		--		DataPack.writeByte(netPack,1)
		--	else 
		--		DataPack.writeByte(netPack,0)
		--	end
		--end
		--DataPack.flush(netPack)
	end	
end

FatherDayQuanFuShuangbei_OPEN = function()
	if is_FatherDay_time()==false then 	
		return 
	end
	
	local RwData = {"我要挂机", "威龙城", 131,134, "我要挂机"}
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg("父亲节双倍经验活动已经开启",ttChatWindow )
	System.broadcastTipmsg("父亲节双倍经验活动已经开启",ttScreenCenter )
	System.setActivtyExpRate(1, 0)
	
end

FatherDayQuanFuShuangbei_CLOSE = function()
	if is_FatherDay_time()==false then 	
		return 
	end
	
	System.broadcastTipmsg("父亲节双倍经验活动已经结束。", ttScreenCenter)
	System.broadcastTipmsg("父亲节双倍经验活动已经结束。", ttChatWindow)
	System.setActivtyExpRate(0, 0)
	--告诉前端
end
	



--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cFatherDayActivity, FatherDayActivity)