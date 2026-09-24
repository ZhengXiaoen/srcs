--#include "data\config\new_activity\festival\activityTotle_cfg.lua" once

-- 每日充值接受客户端消息
function festival_acts_pay_money_main(sysarg, packet)
	local types = DataPack.readByte(packet)
	
	local cfg = activityTotle_cfg.festival_acts_pay_money_cfg
			
	if types==1 then --获取信息
		sendClientpay_moneyInfo(sysarg)
	elseif types==2 then --领取第几个
		local index = DataPack.readByte(packet)
		--判断参数
		if index<1 or  index>#cfg then 
			return 
		end

		local var = Actor.getStaticVar(sysarg)
		--充值不够
		local nPeyCount = var.days.PeyNum
		if not nPeyCount then 
			return
		elseif nPeyCount < cfg[index].money then
			Actor.sendTipmsg(sysarg,string.format("你今天充值不足%s元宝，无法领取奖励",cfg[index].money),ttFlyTip)
			return
		end
		
		if var.days.WUYI_MeiRiChongZhi2==nil then 
			var.days.WUYI_MeiRiChongZhi2={}
		end
		--判断是否领取过
		if var.days.WUYI_MeiRiChongZhi2[index] ~=nil then 
			Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
			return 
		end
		
		--背包不足
		if not Awards.CheckBagGridCount(sysarg, cfg[index].award) then
			return 
		end
		
		--给奖励
		local bResult = Awards.Give(sysarg, cfg[index].award, LogIds.wuyiLianHeActivity, index.."每日充值")
		if bResult == false then
			print("give 五一联合活动充值奖励 award error, actor name = "..Actor.getName(sysarg))
			return 
		end
		var.days.WUYI_MeiRiChongZhi2[index] = 1
		
		Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
		--System.broadcastTipmsg(string.format("玩家<(n%s)>领取合服活动的充值礼包,<我也要领取/@@showWin,197,1>",Actor.getName(sysarg)),ttChatWindow)
		--System.sendCommonLog(1079,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),index,0,0,CombineDays.."合服充值奖励")
		
		sendClientpay_moneyInfo(sysarg)
		System.broadcastTipmsg(string.format("玩家<(n%s)>领取了节日活动-充值奖励,<我也要领取/@@showWin,248,0>",Actor.getName(sysarg)),ttChatWindow)
	end
end

--每日充值给前端发信息
function sendClientpay_moneyInfo(sysarg)
	
	--给前端发信息
	local var = Actor.getStaticVar(sysarg)
	local cfg = activityTotle_cfg.festival_acts_pay_money_cfg
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sFestivalActs)
	DataPack.writeByte(netPack, 1) -- 0 为活动系统本身，否则为活动ID
	if var.days.WUYI_MeiRiChongZhi2==nil then 
		var.days.WUYI_MeiRiChongZhi2={}
	end
	for i=1,#cfg do 	
		if var.days.WUYI_MeiRiChongZhi2[i] ~=nil and var.days.WUYI_MeiRiChongZhi2[i]==1 then 
			DataPack.writeByte(netPack, 1)
		else
			DataPack.writeByte(netPack, 0)
		end
	end
	DataPack.flush(netPack)
end









-- 在线抽奖客户端消息
function festival_acts_onlineGiveAward(sysarg, packet)
	----------------------------------------------是否在活动时间内
	local types = DataPack.readByte(packet)
	local cfg = activityTotle_cfg.onlineTime
	local var = Actor.getStaticVar(sysarg)

	if types==1 then --获取信息
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sFestivalActs)
		DataPack.writeByte(netPack, 2) -- 0 为活动系统本身，否则为活动ID
		if var.days.getOLtimeAward==nil then 
			var.days.getOLtimeAward = 0
		end
		DataPack.writeByte(netPack, var.days.getOLtimeAward) --领取奖励的次数
		DataPack.flush(netPack)
		
	elseif types==2 then --领取奖励
		local onlineTime = Actor.getTodayOnlineTime(sysarg)
		--print("onlineTime="..onlineTime)
		local canGetTime = math.floor(onlineTime/3600)
		if var.days.getOLtimeAward==nil then 
			var.days.getOLtimeAward = 0
		end
		--print("canGetTime="..canGetTime)
		--print("var.days.getOLtimeAward="..var.days.getOLtimeAward)
		
		--领取次数了
		if var.days.getOLtimeAward>=canGetTime or var.days.getOLtimeAward>=cfg.maxCanGet then 
			Actor.sendTipmsg(sysarg,"没有领取次数",ttFlyTip)
			return 
		end
			
		if not Actor.canAddItem(sysarg,cfg.giveId,1) then
			Actor.sendTipmsg(sysarg,"背包不足",ttFlyTip)
			return
		end

		var.days.getOLtimeAward = var.days.getOLtimeAward +1
		Actor.addItem(sysarg,cfg.giveId,0,0,1,1,0,var.days.getOLtimeAward.."在线奖励",LogIds.wuyiLianHeActivity)
		
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sFestivalActs)
		DataPack.writeByte(netPack, 2) -- 0 为活动系统本身，否则为活动ID
		DataPack.writeByte(netPack, var.days.getOLtimeAward) --领取奖励的次数
		DataPack.flush(netPack)
	
		System.broadcastTipmsg(string.format("玩家<(n%s)>领取了节日活动-在线奖励,<我也要领取/@@showWin,248,1>",Actor.getName(sysarg)),ttChatWindow)
	end
end


-- 消费客户端消息
function festival_acts_consumeGiveAward(sysarg, packet)
	local types = DataPack.readByte(packet)
	if types==1 then --获取信息
		sendClientConsumeInfo(sysarg)
	elseif types==2 then --领取第几个
		local index = DataPack.readByte(packet)
		
		local cfg = activityTotle_cfg.consume
				
		--判断参数
		if index<1 or  index>#cfg then 
			return 
		end

		local var = Actor.getStaticVar(sysarg)
		local dayConsumeYB_WUYI = var.dayConsumeYB_WUYI  --这个是新增加的东西
		if dayConsumeYB_WUYI == nil then
			dayConsumeYB_WUYI = 0
			Actor.sendTipmsg(sysarg,string.format("你今天消费不足%s元宝，无法领取奖励",cfg[index].money),ttFlyTip)
			return 
		elseif dayConsumeYB_WUYI < cfg[index].money then 
			Actor.sendTipmsg(sysarg,string.format("你今天消费不足%s元宝，无法领取奖励",cfg[index].money),ttFlyTip)
			return
		end
	
		--消费领取标记
		if var.days.WUYI_Consume==nil then 
			var.days.WUYI_Consume={}
		end
		
		--判断是否领取过
		if var.days.WUYI_Consume[index] ~=nil then 
			Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
			return 
		end
		
		--背包不足
		if not Awards.CheckBagGridCount(sysarg, cfg[index].award) then
			return 
		end
		
		--给奖励
		local bResult = Awards.Give(sysarg, cfg[index].award, LogIds.wuyiLianHeActivity, index.."消费奖励")
		if bResult == false then
			print("give 五一联合活动消费奖励 award error, actor name = "..Actor.getName(sysarg))
			return 
		end
		var.days.WUYI_Consume[index] = 1
		--print(index.."      var.days.WUYI_Consume[index]="..var.days.WUYI_Consume[index])
		
		Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
		
		sendClientConsumeInfo(sysarg)
		
		System.broadcastTipmsg(string.format("玩家<(n%s)>领取了节日活动-消费豪礼,<我也要领取/@@showWin,248,2>",Actor.getName(sysarg)),ttChatWindow)
	end
end

--消费信息发给前端
function sendClientConsumeInfo(sysarg)

	--这个消费要研究一下。。
	local cfg = activityTotle_cfg.consume
	local var = Actor.getStaticVar(sysarg)
	local dayConsumeYB_WUYI = var.dayConsumeYB_WUYI
	if dayConsumeYB_WUYI == nil then
		dayConsumeYB_WUYI = 0
	end
	
	--print("dayConsumeYB_WUYI="..dayConsumeYB_WUYI)
	
	--发送消息
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sFestivalActs)
	DataPack.writeByte(netPack, 3) -- 0 为活动系统本身，否则为活动ID
	DataPack.writeUInt(netPack,dayConsumeYB_WUYI) --消费了多少(这个并没有实时更新)
	if var.days.WUYI_Consume==nil then 
		var.days.WUYI_Consume={}
	end
	for i=1,#cfg do 
		local _temp = var.days.WUYI_Consume[i]
		if _temp~=nil and _temp==1 then 
			DataPack.writeByte(netPack,1) 
		else 
			DataPack.writeByte(netPack,0)	
		end
	end
	DataPack.flush(netPack)
		
end




-- 购买客户端消息
function festival_acts_buySomething(sysarg, packet)

	local var = Actor.getStaticVar(sysarg)
	local types = DataPack.readByte(packet)
	if types==1 then --获取信息
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sFestivalActs)
		DataPack.writeByte(netPack, 4) -- 0 为活动系统本身，否则为活动ID
		if var.days.buyWUYI==nil then 
			var.days.buyWUYI = 0
		end
		DataPack.writeByte(netPack, var.days.buyWUYI) --今天是否购买了
		DataPack.flush(netPack)
		
	elseif types==2 then --领取第几个
		local cfg = activityTotle_cfg.buySomething
		if var.days.buyWUYI==nil then 
			var.days.buyWUYI = 0
		end
		
		if var.days.buyWUYI~=0 then 
			Actor.sendTipmsg(sysarg,"每天只能买一次",ttFlyTip)
			return 
		end
		
		--判断是否够位置
		if not Awards.CheckBagGridCount(sysarg, cfg[1].award) then
			return 
		end
		
		--判断钱够不够
		if Actor.changeMoney(sysarg, 3, -cfg[1].money, LogIds.wuyiLianHeActivity, "购买绝版秀") == false then
			Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
			return -- 元宝不足
		end
		
		
		var.days.buyWUYI=1
			
		Actor.sendTipmsg(sysarg,"购买成功",ttFlyTip)
		--给东西
		Awards.Give(sysarg,cfg[1].award,LogIds.QingDianActivity,"购买绝版秀")
		
		var.days.buyWUYI=1
		
		
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sFestivalActs)
		DataPack.writeByte(netPack, 4) -- 0 为活动系统本身，否则为活动ID
		if var.days.buyWUYI==nil then 
			var.days.buyWUYI = 0
		end
		DataPack.writeByte(netPack, var.days.buyWUYI) --今天是否购买了
		DataPack.flush(netPack)
		
		System.broadcastTipmsg(string.format("玩家<(n%s)>购买超级大礼，希望他可以获得心仪道具！<我也要领取/@@showWin,248,3>",Actor.getName(sysarg)),ttChatWindow)
	end
end






































-- 玩家在线跨天
--function festival_acts_OnActorNewDayAcrrive(sysarg)
--end

-- 玩家充值
--function festival_acts_ActorPayMoney(sysarg, args)
--	local yuanBao = args[1]
--end

-- 注册玩家在线跨天事件
--registerLuaEventCallback(LuaEventId.ActorNewDayAcrrive, festival_acts_OnActorNewDayAcrrive)

--registerLuaEventCallback(LuaEventId.ActorPayMoney, festival_acts_ActorPayMoney)