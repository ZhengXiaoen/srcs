--#include "data\config\new_activity\festival\activity_jingji.lua" once --竞技活动
--#include "data\functions\new_activity\festival\ActivityRankFunc.lua" once 
--#include "data\functions\modules\daily_pay_ranking.lua" once -- 活动:每日充值排行榜
JingJiCompetitionDisabled = false -- 竞技大赛按活动周期自动开启；圣诞活动仍可使用共用协议

--竞技协议派发
handleJingjiActivity = function (sysarg, sysid, packet)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if GetJingjiActivityType() == 0 then return end
	
	if svar.JingJiOpenDay==nil then return end
	
	if svar.isDringJingJi ==nil or svar.isDringJingJi<1 or svar.isDringJingJi>svar.JingJiOpenDay then 
		print("活动还没没有开启")
		return 
	end
	
	ClearJingJi_Data(sysarg)
	
	local msgid = DataPack.readByte(packet)
	if msgid == 0 then	--获取数据
		GetJingjiiInfo(sysarg,DataPack.readByte(packet))
	elseif msgid == 1 then --登录礼包
		GetLoginGift_JingJi(sysarg)
	elseif msgid ==2 then	--转盘(写在别的协议里面)
		
	elseif msgid ==3 then --累计充值
		GetChongzhiGift_JingJi(sysarg,DataPack.readByte(packet),DataPack.readByte(packet))
	elseif msgid ==4 then --折扣特惠
		GetSpecialDeal_JingJi(sysarg,DataPack.readByte(packet)) --购买第几个
    elseif msgid >= 6 and msgid <= 10 then --宝石竞技、圣珠竞技、坐骑丹竞技、特戒竞技、绝版武器
        MiscHandleGetNewRankInfo(sysarg,msgid,DataPack.readByte(packet),packet)
    elseif msgid == 12 then -- 获取消费狂欢奖励：(圣诞活动)
    	GetChristmasConsumeAwards(sysarg, DataPack.readByte(packet))
	end
end


--1登录礼包
GetLoginGift_JingJi = function(sysarg,index)
	
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg)
	
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if nActorLevel<80 then 
		Actor.sendTipmsg(sysarg,"您等级不够80级，无法领取",ttFlyTip)
		return 
	end
	

	--没有配置
	local cfg = activity_jingji.loginGiveAward.Info
	if not cfg then 
		print("The jingji Login Award Config is nil ,Read file error")
		return  
	end
	

	if var.days.loginflag~=nil and var.days.loginflag==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	local award = cfg.award
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	var.days.loginflag = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.JingJiActivity,cfg.name)
	if bResult == false then
		print("jingji Login Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetJingjiiInfo(sysarg,1)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.JingJiActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
	if GetJingjiActivityType()==1 then 
		System.broadcastTipmsg(string.format("<(n%s)>玩家圣诞来袭登录奖励，超级丰盛<我也要领取/@@showWin,264,0>",Actor.getName(sysarg)), ttChatWindow)
	else
		System.broadcastTipmsg(string.format("<(n%s)>玩家竞技大赛登录奖励，超级丰盛<我也要领取/@@showWin,264,0>",Actor.getName(sysarg)), ttChatWindow)
	end
	
end


--3新的累计充值
GetChongzhiGift_JingJi =function(sysarg,dang,index) --第几档，第几个
	dang= tonumber(dang)
	index= tonumber(index)
	
	--判断参数是否非法
	if dang<=0 or dang>#activity_jingji.payGiveAwardNew.needMoney then 
		return 
	end
	
	local cfg = activity_jingji.payGiveAwardNew.Info[dang]
	if cfg==nil or index<=0 or cfg[index]==nil  then 
		return 
	end
	
	--判断是否领取过
	local var = Actor.getStaticVar(sysarg)
	if var.JingJi_Data.chongzhiflagNew ==nil then 
		var.JingJi_Data.chongzhiflagNew = {}
	end
	
	if var.JingJi_Data.chongzhiflagNew[dang]==nil then 
		var.JingJi_Data.chongzhiflagNew[dang]={}
	end
	
	if var.JingJi_Data.chongzhiflagNew[dang][index]~=nil and var.JingJi_Data.chongzhiflagNew[dang][index]==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	--print("var.JingJi_Data.chongzhiDataNew[dang]="..var.JingJi_Data.chongzhiDataNew[dang])
	--判断是否足够
	--print("22222222222")
	if var.JingJi_Data.chongzhiDataNew ==nil or var.JingJi_Data.chongzhiDataNew[dang]==nil or var.JingJi_Data.chongzhiDataNew[dang]< index then
		Actor.sendTipmsg(sysarg,"未到领取条件",ttFlyTip)
		return 
	end
	--print("33333333333333")
	
	local award = cfg[index].award
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	var.JingJi_Data.chongzhiflagNew[dang][index] = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.JingJiActivity,cfg[index].name)
	if bResult == false then
		print("jingji chongzhiNew Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetJingjiiInfo(sysarg,3)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	--System.broadcastTipmsg(string.format("<(n%s)>玩家领取了大吉大利%s奖励,超级丰盛<我也要领取/@@showWin,251,0>",Actor.getName(sysarg),cfg[index].name), ttChatWindow)

	System.sendCommonLog(LogIds.JingJiActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg[index].name)

	if GetJingjiActivityType()==1 then 
		System.broadcastTipmsg(string.format("<(n%s)>玩家圣诞来袭充值特惠奖励，超级丰盛<我也要领取/@@showWin,264,0>",Actor.getName(sysarg)), ttChatWindow)
	else
		System.broadcastTipmsg(string.format("<(n%s)>玩家竞技大赛充值特惠奖励，超级丰盛<我也要领取/@@showWin,264,0>",Actor.getName(sysarg)), ttChatWindow)
	end
end


--特价的东西
function GetSpecialDeal_JingJi(sysarg,index)
--是否在开关时间内
	
	local var = Actor.getStaticVar(sysarg)
	local cfg = activity_jingji.SpecilDeal[index]
	if cfg==nil then 
		return 
	end
	
	if var.JingJi_Data.SpecialDeal ==nil then 
		var.JingJi_Data.SpecialDeal = {}
	end

	if var.JingJi_Data.SpecialDeal[index]~=nil and var.JingJi_Data.SpecialDeal[index]>=cfg.count then 
		Actor.sendTipmsg(sysarg,"没有剩余的可购买次数",ttFlyTip)
		return 
	end
		
	local award =cfg.award

	--判断是否够位置
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end

	--判断钱够不够
	if Actor.changeMoney(sysarg, 3, -cfg.needMoney, LogIds.JingJiActivity, cfg.name) == false then
		Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
		return -- 元宝不足
	end
	

	if var.JingJi_Data.SpecialDeal[index]==nil then 
		var.JingJi_Data.SpecialDeal[index]=1
	else
		var.JingJi_Data.SpecialDeal[index] = var.JingJi_Data.SpecialDeal[index]+1
	end
		
	Actor.sendTipmsg(sysarg,"购买成功",ttFlyTip)
	--给东西
	Awards.Give(sysarg,award,LogIds.JingJiActivity,cfg.name)

	GetJingjiiInfo(sysarg,4)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>玩家财大气粗购买了%s,<我也要购买/@@showWin,264,1>",Actor.getName(sysarg),cfg.name),ttChatWindow)
	System.sendCommonLog(LogIds.JingJiActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)

end

--得到所有的信息
GetJingjiiInfo = function(sysarg,index)
	--是否在开关时间内
	local var = Actor.getStaticVar(sysarg)
	ClearJingJi_Data(sysarg)
	
	if index== 1 then --1登录礼包
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sJingJI_Acts)
		DataPack.writeByte(netPack,1)
		if var.days.loginflag==nil then	
			var.days.loginflag=0
		end
        DataPack.writeByte(netPack,var.days.loginflag)
        DataPack.flush(netPack)
	elseif index==3 then --3累计充值
		local cfg =activity_jingji.payGiveAwardNew
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sJingJI_Acts)
		DataPack.writeByte(netPack, 3) 
		for i=1,#cfg.needMoney do  --两档，各累计了多少次
			if var.JingJi_Data.chongzhiDataNew==nil or var.JingJi_Data.chongzhiDataNew[i]==nil  then 
				DataPack.writeByte(netPack, 0) 
				--print("var.JingJi_Data.chongzhiDataNew[i]=0")
			else
				DataPack.writeByte(netPack, var.JingJi_Data.chongzhiDataNew[i]) 
				--print("var.JingJi_Data.chongzhiDataNew[i]="..var.JingJi_Data.chongzhiDataNew[i])
			end
		end
		
		for i=1,#cfg.needMoney do  --两档，各累计了多少次
			for j=1,#cfg.Info[i] do 
				if var.JingJi_Data.chongzhiflagNew==nil or var.JingJi_Data.chongzhiflagNew[i]==nil or var.JingJi_Data.chongzhiflagNew[i][j]==nil  then 
					DataPack.writeByte(netPack, 0) 
					--print("var.JingJi_Data.chongzhiflagNew[i][j]=0")
				else
					DataPack.writeByte(netPack, var.JingJi_Data.chongzhiflagNew[i][j]) 
					--print("var.JingJi_Data.chongzhiflagNew[i][j]="..var.JingJi_Data.chongzhiflagNew[i][j])
				end
			end
		end
		DataPack.flush(netPack)
	elseif index==4 then 
		local cfg =activity_jingji.SpecilDeal
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sJingJI_Acts)
		DataPack.writeByte(netPack, 4) 
		if var.JingJi_Data.SpecialDeal ==nil then 
			var.JingJi_Data.SpecialDeal={}
		end
		for i=1,#cfg do  
			if var.JingJi_Data.SpecialDeal[i]==nil then 
				DataPack.writeByte(netPack,0)
			else
				DataPack.writeByte(netPack,var.JingJi_Data.SpecialDeal[i]) 
			end
		end
		DataPack.flush(netPack)
	elseif index==12 then -- 消费狂欢：(圣诞来袭)
		if GetJingjiActivityType() == 1 then		
			SendChristmasConsumeAwardsInfo(sysarg)
		end
	end
end



-- 清除旧的竞技大赛状态及排行剩余天数，保留散人红利和圣诞活动。
function DisableJingJiCompetition()
	if JingJiCompetitionDisabled ~= true then return end
	local svar = System.getStaticVar()
	local hasCompetitionState = svar.JingJiActivityTypes ~= 1 and
		(svar.isDringJingJi ~= nil or svar.JingJiOpenDay ~= nil or
		 svar.StartJingJIYear ~= nil or svar.StartJingjiMonth ~= nil or
		 svar.StartJingJiDay ~= nil or svar.JingJiActivityTypes == 2)
	local dayData = svar.daily_pay_ranking_day_data
	local hasCompetitionRanking = dayData ~= nil and System.getIntByte(dayData, 1) ~= 0
	if not hasCompetitionState and not hasCompetitionRanking then return end

	if hasCompetitionState then
		svar.isDringJingJi = nil
		svar.JingJiOpenDay = nil
		svar.JingJiActivityTypes = nil
		svar.StartJingJIYear = nil
		svar.StartJingjiMonth = nil
		svar.StartJingJiDay = nil
		svar.StartJingJi_MiNitime = nil
	end
	if hasCompetitionRanking then
		dayData = System.setIntByte(dayData, 1, 0)
		svar.daily_pay_ranking_day_data = dayData ~= 0 and dayData or nil
	end
	System.saveStaticVar()

	if hasCompetitionState then
		local playerList = LuaHelp.getAllActorList()
		for _, player in ipairs(playerList or {}) do
			local netPack = DataPack.allocPacket(player, 151, LogicCmd.miscSysEx.sub.sJingJI_isOpen)
			DataPack.writeByte(netPack, 0)
			DataPack.writeByte(netPack, 0)
			DataPack.writeByte(netPack, 0)
			DataPack.flush(netPack)
		end
	end
end

--开始竞技还是圣诞活动
StartJingJi = function(openday,nowOpenday,activityType) --开几天，当前是第几天
	if JingJiCompetitionDisabled == true and activityType ~= 1 then return end
	--print("111111")
	--以免活动期间挂机了，这个挺麻烦的。。
	local svar = System.getStaticVar()
	
	--默认开三天
	if svar.JingJiOpenDay==nil then svar.JingJiOpenDay=3 end
	if openday~=nil then svar.JingJiOpenDay =openday end
	
	
	--默认开启竞技
	if activityType~=nil then 
		svar.JingJiActivityTypes =activityType --开启的是竞技，还是圣诞
	else
		svar.JingJiActivityTypes = 2 
	end
	
	--默认是第一天
	if nowOpenday==nil or nowOpenday==0 then --默认当天是第1天
		svar.isDringJingJi = 1
	else 
		nowOpenday = tonumber(nowOpenday)
		if nowOpenday>svar.JingJiOpenDay then 
			return 
		end
		svar.isDringJingJi = nowOpenday
	end
	
	--记录开始时间戳
	svar.StartJingJi_MiNitime = System.getCurrMiniTime()
		
	System.saveStaticVar()
	
	-- 竞技大赛每日充值排行榜
	daily_pay_ranking_start(svar.isDringJingJi, svar.JingJiOpenDay, 1)
	
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		--是否开启庆典活动
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sJingJI_isOpen)
			--开的是哪一个活动
		if svar.JingJiActivityTypes==nil then 
			DataPack.writeByte(netPack,0)
		else	
			DataPack.writeByte(netPack,svar.JingJiActivityTypes)
		end
		
		if svar.JingJiOpenDay==nil then
			DataPack.writeByte(netPack,0)
		else
			DataPack.writeByte(netPack,svar.JingJiOpenDay)
		end
	
		DataPack.writeByte(netPack,svar.isDringJingJi)	--开启第几天(0,1,2,3)
		DataPack.flush(netPack)
	end	
	
end

--结束竞技活动
EndJingJi = function()
	local svar = System.getStaticVar()
	local endedType = svar.JingJiActivityTypes or 0
	svar.isDringJingJi = nil
	svar.JingJiOpenDay =nil
	svar.JingJiActivityTypes =nil
	System.saveStaticVar()

	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end

	for i, player in ipairs(playerList) do
		--是否开启庆典活动
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sJingJI_isOpen)
		DataPack.writeByte(netPack,endedType)
		DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
	end
end
	
--下发前端是否是竞技活动中
handleJingJiOpen = function (sysarg, sysid, packet)
	local svar = System.getStaticVar()

	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sJingJI_isOpen)
	if GetJingjiActivityType() == 0 then
		DataPack.writeByte(netPack, 0)
		DataPack.writeByte(netPack, 0)
		DataPack.writeByte(netPack, 0)
		DataPack.flush(netPack)
		return
	end
	
	--开的是哪一个活动
	if svar.JingJiActivityTypes==nil then 
		DataPack.writeByte(netPack,0)
		--print("0000000")
	else	
		DataPack.writeByte(netPack,svar.JingJiActivityTypes)
		--print("svar.JingJiActivityTypes="..svar.JingJiActivityTypes)
	end
	
	if svar.JingJiOpenDay==nil then
		DataPack.writeByte(netPack,0)
		--print("0000000")
	else
		DataPack.writeByte(netPack,svar.JingJiOpenDay)
		--print("svar.JingJiOpenDay:"..svar.JingJiOpenDay)
	end
	
	if svar.isDringJingJi==nil then 
		DataPack.writeByte(netPack,0)
		--print("0000000")
	else 
		DataPack.writeByte(netPack,svar.isDringJingJi)
		--print("svar.isDringJingJi:"..svar.isDringJingJi)
	end
	DataPack.flush(netPack)
end


--0不在活动中，1为圣诞活动中，2为竞技活动中
function GetJingjiActivityType()
		
	local svar = System.getStaticVar()
	
	if svar.JingJiOpenDay==nil then return  0 end
	
	if svar.isDringJingJi ==nil or svar.isDringJingJi<1 or svar.isDringJingJi>svar.JingJiOpenDay then 
		return 0
	end
	
	local activityType = svar.JingJiActivityTypes
	if JingJiCompetitionDisabled == true and activityType == 2 then return 0 end
	if activityType == nil then
		return 0
	end
	
	return activityType
end

function SendChristmasConsumeAwardsInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sJingJI_Acts)
	DataPack.writeByte(netPack, 12) 
	DataPack.writeUInt(netPack, var.dayConsumeYB_WUYI)			
	DataPack.writeUInt(netPack, var.newdays.ChristmasConsumeAwardsFlags)			
	DataPack.flush(netPack)
end

-- 获取消费狂欢奖励：(圣诞活动)
function GetChristmasConsumeAwards(sysarg, index)
	if index < 1 or index > 32 then return end
	
	if GetJingjiActivityType() ~= 1 then
		return -- 不在圣诞活动中
	end
	
	local cfg = activity_jingji.ChristmasConsume[index]
	if cfg == nil then return end
	
	local var = Actor.getStaticVar(sysarg)
	local dayConsumeYB = var.dayConsumeYB_WUYI
	if dayConsumeYB == nil or dayConsumeYB < cfg.consumeYb then
		Actor.sendTipmsg(sysarg,"今日消费需要达到"..cfg.consumeYb.."元宝才能领取该奖励",ttFlyTip)
		return
	end
	
	local flags = var.newdays.ChristmasConsumeAwardsFlags
	if flags == nil then flags = 0 end
	
	if System.getIntBit(flags, index-1) ~= 0 then
		Actor.sendTipmsg(sysarg,"您已经领取了该奖励",ttFlyTip)
		return
	end
	
	if not Awards.Give(sysarg,cfg.award,LogIds.ChristmasConsumeAwards,tostring(index)) then
		return
	end
	
	flags = System.setIntBit(flags, index-1, true)
	var.newdays.ChristmasConsumeAwardsFlags = flags
	
	Actor.sendTipmsg(sysarg,"领取圣诞活动消费狂欢奖励成功",ttFlyTip)
	
	SendChristmasConsumeAwardsInfo(sysarg)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>领取了圣诞来袭消费豪礼奖励，超级丰厚,<我也要领取/@@showWin,264,3>", Actor.getName(sysarg)), 2+128+2048)
end

-- 圣诞BOSS：(圣诞来袭)
function ChristmasBossActivity_Run()
	if GetJingjiActivityType() ~= 1 then
		return -- 不在圣诞活动中
	end
	
	local cfg = activity_jingji.ChristmasBoss
	local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)
	if hScene == nil then
		print("error, ChristmasBossActivity_Run hScene==nil")
		return
	end
	
	local range = cfg.range
	local count = Fuben.createMonstersInRange(hScene, cfg.bossId, range[1], range[2], range[3], range[4], 1, 20 * 60)
	if count ~= 1 then
		print("error, ChristmasBossActivity_Run needCount=1,count="..count)
	else
		System.sendCommonLog(LogIds.ChristmasBoss, 0, "", 0,0,0)
		System.broadcastTipmsg("王城中刷新了圣诞BOSS，大家快去抢高级装备！<我要去！/@@showWin,264,6>", 2+128+2048)
	end
end


--后台命令开启
function backcmd_JingJiActs(args)

	-- 1为开启圣诞活动，2为开启竞技活动
	local svar = System.getStaticVar()
	local activityType =tonumber(args[1])
	if JingJiCompetitionDisabled == true and activityType == 2 then
		DisableJingJiCompetition()
		return
	end
	if activityType==1 then 
		svar.JingJiActivityTypes =1
	elseif  activityType==2 then 
		svar.JingJiActivityTypes =2
	else
		return 
	end

	local Type = tonumber(args[2])
	if Type==1 then 
		local Year = tonumber(args[3])
		local Month = tonumber(args[4])
		local Day = tonumber(args[5])
		local openDay = tonumber(args[6])
		--local openDay = 3

		if Year~=nil and Month~=nil and Day~=nil and openDay~=nil then 
			local refreshTime = System.encodeNumTime(Year,Month,Day,0,0,0) --写当天的更新日期
			
			local y,m,d,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(System.getCurrMiniTime())	
			local nNowDt = System.encodeNumTime(y,m,d,0,0,0)
			
			local diffTime = nNowDt-refreshTime

			if diffTime>=0 then 
				local nowDay = (math.floor(diffTime/86400)+1)
				if nowDay>openDay then 			--已经过期

					return 
				else	
					local svar = System.getStaticVar()
					svar.StartJingJIYear = Year 
					svar.StartJingjiMonth = Month
					svar.StartJingJiDay = Day
					svar.JingJiOpenDay =openDay
				
					StartJingJi(openDay,nowDay,svar.JingJiActivityTypes)   --今天就是
				end
			else		--还没到（未来会到） （在跨天的时候检测一下）
				local svar = System.getStaticVar()
				svar.StartJingJIYear = Year 
				svar.StartJingjiMonth = Month
				svar.StartJingJiDay = Day
				svar.JingJiOpenDay =openDay
				--print("llllllllll")
			end
		end
		
		
	elseif Type==0 then --关闭
		EndJingJi()
	end
end

-- 后台命令(竞技活动): JingJiActs|activitytypes|1|2018|12|21|开启天数
-- activitytypes: 1为开启圣诞活动，2为开启竞技活动
RegisterBackCmd("JingJiActs", backcmd_JingJiActs)
