--月末活动(和父亲节活动一样，就是全服双倍是一天的)
--#include "data\config\activity\FatherDay.lua" once
--#include "data\config\activity\EndMonthActivity.lua" once

EndMonthActivitys = function (sysarg, sysid, packet)
	if EndMonthActivityDisabled == true then
		return
	end

	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.EndMonth_openDay ==nil or svar.EndMonth_openDay==0 then 
		return 
	end
	
	if svar.isDringEndMonth ==nil or svar.isDringEndMonth<1 or svar.isDringEndMonth>svar.EndMonth_openDay then 
		return 
	end
	
	local msgid = DataPack.readByte(packet)
	
	if msgid == 0 then	--获取数据
		GetEndMonthInfo(sysarg,DataPack.readByte(packet))
	elseif msgid == 1 then --登录礼包
		GetEndMonthLoginGift(sysarg)
	elseif msgid == 2 then --充值礼包
		GetEndMonthChongZhiGift(sysarg)
	elseif msgid ==3 then --集字活动礼包
		GetEndMonthJiZiGift(sysarg,DataPack.readByte(packet))--第几个礼包
	end
end

GetEndMonthLoginGift = function (sysarg)

	--没有配置
	local award = FatherDayConfig.LoginGift.award
	if not award then 
		print("The endMonth Login Award Config is nil ,Read file error")
		return  
	end
	
	--判断是否领取过
	local var = Actor.getStaticVar(sysarg)
	if var.days.EMLoginGift ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.EndMonthActivity,"月末登录礼包")
	if bResult == false then
		print("endMonth Login Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.EMLoginGift = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.EndMonthActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"月末登录礼包")

	GetEndMonthInfo(sysarg,1)
	--和前端对接
end

GetEndMonthChongZhiGift= function (sysarg)
	
	--没有配置
	local award = FatherDayConfig.ChongZhiGift[1].award
	if not award then 
		print("The endMonth ChongZhi Award Config is nil ,Read file error")
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
	if var.days.EMChongZhiGift ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.EndMonthActivity,"月末充值礼包")
	if bResult == false then
		print("endMonth ChongZhi Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.EMChongZhiGift = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.EndMonthActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"月末充值礼包")

	GetEndMonthInfo(sysarg,2)
	--和前端对接
end

--领取集字活动奖励
GetEndMonthJiZiGift= function(sysarg,index)
	if EndMonthActivity.JiZiOpen == false then
		Actor.sendTipmsg(sysarg,"集字活动已关闭",ttFlyTip)
		return
	end
	if EndMonthActivity.needCollect == nil or EndMonthActivity.needCollect[index] == nil then
		return
	end
	--判断物品是否足够
	--if index == 1 then --需要12
	--	if Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[1])<=0 or  
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[2])<=0 or
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[3])<=0 or
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[4])<=0 
	--	then 
	--		Actor.sendTipmsg(sysarg,"道具不足，无法兑换",ttFlyTip)
	--		return 
	--	end	
	--elseif  index == 2 then --需要1234
	--	if Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[1])<=0 or  
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[2])<=0 or 
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[3])<=0 or 
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[4])<=0 or
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[6])<=0 or 
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[7])<=0 
	--	then 
	--		Actor.sendTipmsg(sysarg,"道具不足，无法兑换",ttFlyTip)
	--		return 
	--	end
	--	
	--elseif  index == 3 then --需要1234567
	--	if Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[1])<=0 or 
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[2])<=0 or 
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[3])<=0 or 
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[4])<=0 or 
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[5])<=0 or 
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[6])<=0 or 
	--	Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[7])<=0 
	--	then 
	--		Actor.sendTipmsg(sysarg,"道具不足，无法兑换",ttFlyTip)
	--		return 
	--	end
	--end
	for i=1,#EndMonthActivity.needCollect[index] do 
		local idindex = EndMonthActivity.needCollect[index][i].id-5445
		if Actor.getItemCount(sysarg,EndMonthActivity.JiZiId[idindex])<=0 then  
			Actor.sendTipmsg(sysarg,"道具不足，无法兑换",ttFlyTip)
			return 
		end
	end
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, EndMonthActivity.award[index]) then
		return 
	end
    
	--扣除物品
	for i=1,#EndMonthActivity.needCollect[index] do 
		local idindex = EndMonthActivity.needCollect[index][i].id -5445
		Actor.removeItem(sysarg,EndMonthActivity.JiZiId[idindex],1)
	end
		
	--if index == 1 then --需要12
	--	for i=1,#EndMonthActivity.needCollect[index] do 
	--		local idindex = #EndMonthActivity.needCollect[index].id
	--		Actor.removeItem(sysarg,EndMonthActivity.JiZiId[idindex],1)
	--	end
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[1],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[2],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[3],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[4],1)
	--elseif index == 2 then --需要1234
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[1],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[2],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[3],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[4],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[6],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[7],1)
	--elseif index == 3 then --需要123456
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[1],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[2],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[3],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[4],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[5],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[6],1)
	--	--Actor.removeItem(sysarg,EndMonthActivity.JiZiId[7],1)
	--end
	--给奖励
	local bResult = Awards.Give(sysarg, EndMonthActivity.award[index], LogIds.EndMonthActivity,"月末集字礼包")
	if bResult == false then
		print("endMonth Collect Zi Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	GetEndMonthInfo(sysarg,3)
	System.broadcastTipmsg(string.format("玩家<(n%s)>在集字送礼活动中兑换了%s,<我也要领取/@@showWin,212,2>",Actor.getName(sysarg),Item.getItemLinkMsg(EndMonthActivity.award[index][1].id)),ttChatWindow)
	
	System.sendCommonLog(LogIds.EndMonthActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,index.."月末集字礼包")
end


GetEndMonthInfo = function(sysarg,index)

	local var = Actor.getStaticVar(sysarg)
	if index== 1 then
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sEndMonthActivity)
        DataPack.writeByte(netPack,1)
		if (var.days.EMLoginGift ==nil) then 
			DataPack.writeByte(netPack,1)
		else 
			DataPack.writeByte(netPack,0)
		end
        DataPack.flush(netPack)
	elseif index== 2 then
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sEndMonthActivity)
        DataPack.writeByte(netPack,2)
		if (var.days.EMChongZhiGift ==nil) then 
			DataPack.writeByte(netPack,1)
		else 
			DataPack.writeByte(netPack,0)
		end
        DataPack.flush(netPack)
	elseif index== 3 then
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sEndMonthActivity)
        DataPack.writeByte(netPack,3)
        DataPack.flush(netPack)
	end	
end

EndMonthQuanFuShuangbei_OPEN = function()
	
	--local RwData = {"我要挂机", "威龙城", 131,134, "我要挂机"}
	--local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	--
	--System.broadcastTipmsg("月末活动双倍经验活动已经开启",ttChatWindow )
	--System.broadcastTipmsg("月末活动双倍经验活动已经开启",ttScreenCenter )
	--System.setActivtyExpRate(1, 0)
	
end

EndMonthQuanFuShuangbei_CLOSE = function()
	
	--System.broadcastTipmsg("月末活动双倍经验活动已经结束。", ttScreenCenter)
	--System.broadcastTipmsg("月末活动双倍经验活动已经结束。", ttChatWindow)
	--System.setActivtyExpRate(0, 0)
	----告诉前端
end

--开始月末活动
StartEndMonthActivity = function(openday , nowOpenday)
	if EndMonthActivityDisabled == true then
		local svar = System.getStaticVar()
		svar.isDringEndMonth = nil
		System.saveStaticVar()
		local playerList = LuaHelp.getAllActorList()
		if not playerList then return end
		for i, player in ipairs(playerList) do
			local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sEndMonthActivityIsOpen)
			DataPack.writeByte(netPack,0)
			DataPack.writeByte(netPack,0)
			DataPack.flush(netPack)
		end
		return
	end

	local svar = System.getStaticVar()
	svar.isDringEndMonth = 1
	
	local svar = System.getStaticVar()
	if nowOpenday==nil or nowOpenday==0 then 
		svar.isDringEndMonth = 1
	else 
		nowOpenday = tonumber(nowOpenday)
		svar.isDringEndMonth = nowOpenday
	end

	
	if openday~=nil then 
		openday =tonumber(openday)
		svar.EndMonth_openDay = openday
	end
	if svar.EndMonth_openDay==nil then --默认开启为3天
		svar.EndMonth_openDay=3
	end
	System.saveStaticVar()
	
	
	EndMonthQuanFuShuangbei_OPEN()
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sEndMonthActivityIsOpen)
		DataPack.writeByte(netPack,svar.isDringEndMonth)	--开启第几天
		DataPack.writeByte(netPack,svar.EndMonth_openDay)	--一共开启几天
		DataPack.flush(netPack)
	end
end

--结束月末活动
EndEndMonthActivity = function()
	local svar = System.getStaticVar()
	svar.isDringEndMonth = nil
	System.saveStaticVar()
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sEndMonthActivityIsOpen)
		DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
	end
end
	

EndMonthActivityIsOpen = function (sysarg, sysid, packet)
	if EndMonthActivityDisabled == true then
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sEndMonthActivityIsOpen)
    	DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
		return
	end

	local svar = System.getStaticVar()
	if svar.isDringEndMonth==nil then 
		svar.isDringEndMonth = 0
	end
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sEndMonthActivityIsOpen)
    DataPack.writeByte(netPack,svar.isDringEndMonth)
	if svar.EndMonth_openDay==nil then 
		DataPack.writeByte(netPack,0)
	else 
		DataPack.writeByte(netPack,svar.EndMonth_openDay)
	end
	DataPack.flush(netPack)
end



MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cEndMonthActivity, EndMonthActivitys)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cEndMonthActivityIsOpen, EndMonthActivityIsOpen)