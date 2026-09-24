--#include "data\config\activity\SanRenHongLiCfg.lua" once
--#include "data\functions\modules\daily_pay_ranking.lua" once -- 活动:每日充值排行榜

handleSanRenHongLi= function (sysarg, sysid, packet)
	local msgid = DataPack.readByte(packet)
	if msgid == 0 then
		local actIdx = DataPack.readByte(packet)
		local isActTime = false -- 是否在活动时间内
		
		local svar = System.getStaticVar()
		if svar.isDringSanRenHongLi ~=nil and svar.isDringSanRenHongLi>=1 and svar.isDringSanRenHongLi<=3 then 
			isActTime = true 
			ClearSanRenHongLi_Data(sysarg)	
		end
		
		if isActTime == false and actIdx == 6 then -- 6每日充值排行榜
			if SRHL_isDringJingjiActivity(svar) then -- 是否是在圣诞活动或竞技活动中
				isActTime = true 
			end
		end
		
		if isActTime then
			GetSanRenHongLiInfo(sysarg, actIdx)
		end
		
		return
	end
	
	
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.isDringSanRenHongLi ==nil or svar.isDringSanRenHongLi<1 or svar.isDringSanRenHongLi>3 then 
		return 
	end
	
	ClearSanRenHongLi_Data(sysarg)	
	
	if msgid == 0 then	--获取数据
		GetSanRenHongLiInfo(sysarg,DataPack.readByte(packet))
	elseif msgid == 1 then --1充值返利
		SRHL_EveryDaysPay(sysarg,DataPack.readByte(packet),DataPack.readByte(packet))
	elseif msgid == 2 then --2每日登录
		SRHL_EveryDaysLogin(sysarg)
	elseif msgid == 3 then --3每日首充
		SRHL_EveryDaysFirst(sysarg)
	elseif msgid ==4 then --4幸运转盘	
		SRHL_LuckeyZhuanPan(sysarg)
	elseif msgid ==5 then --5限时礼包
		SRHL_XinShiGift(sysarg,DataPack.readByte(packet),DataPack.readByte(packet)) --第几个，第几档
	elseif msgid == 6 then --6每日充值排行榜
	end
end

-- 是否是在圣诞活动或竞技活动中
function SRHL_isDringJingjiActivity(svar)	
	if svar.JingJiOpenDay==nil then return false end
	
	if svar.isDringJingJi ==nil or svar.isDringJingJi<1 or svar.isDringJingJi>svar.JingJiOpenDay then 
		return false
	end
	
	local activityType = svar.JingJiActivityTypes
	if activityType ~= nil and (activityType == 1 or activityType == 2) then
		return true
	end
	
	return false
end

--1累计充值
function SRHL_EveryDaysPay(sysarg,x,y)
	local cfg = SanRenHongLiCfg.EveryTotalPay
	if x<1 or x>#cfg then 
		return 
	end
	
	if y<1 or y>#cfg[x].days then 
		return 
	end
	local var = Actor.getStaticVar(sysarg)
	
	ClearSanRenHongLi_Data(sysarg)
	
	if var.SRHL_Data.payTotal  == nil then 
		var.SRHL_Data.payTotal = {}
	end
	
	if var.SRHL_Data.payTotalFalg  == nil then 
		var.SRHL_Data.payTotalFalg = {}
	end
	
	if var.SRHL_Data.payTotalFalg[x]==nil then 
		var.SRHL_Data.payTotalFalg[x] ={}
	end
		
	if var.SRHL_Data.payTotalFalg[x][y] ~=nil and var.SRHL_Data.payTotalFalg[x][y]==1 then	
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	if var.SRHL_Data.payTotal[x]==nil or var.SRHL_Data.payTotal[x]<y then 
		Actor.sendTipmsg(sysarg,"累计达到充值金额的天数不足",ttFlyTip)
		return 
	end
	
	
	
	local award = cfg[x].days[y].award
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	var.SRHL_Data.payTotalFalg[x][y] = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.sanrenhongli,"连续累计充值")
	if bResult == false then
		print("sanrenhongli leijipay Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetSanRenHongLiInfo(sysarg,1)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	--System.sendCommonLog(LogIds.sanrenhongli,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,x.."档"..y.."天")
    --
	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了散人红利的累计充值大奖<我也要领取/@@showWin,259,2>",Actor.getName(sysarg)), ttChatWindow)
end


--2每日登录
function SRHL_EveryDaysLogin(sysarg)
	local svar = System.getStaticVar()
	
	local var = Actor.getStaticVar(sysarg)
	
	--没有配置
	local cfg = SanRenHongLiCfg.EveryDaysLogin.Award[svar.isDringSanRenHongLi]
	if not cfg then 
		print("The sanrenhongli Login Award Config is nil ,Read file error")
		return  
	end
	
	if var.days.sanrenhongliLogin ~=nil and var.days.sanrenhongliLogin==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, cfg) then
		return 
	end
	
	var.days.sanrenhongliLogin = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, cfg, LogIds.sanrenhongli,"散人红利登录")
	if bResult == false then
		print("sanrenhongli Login Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetSanRenHongLiInfo(sysarg,2)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	--System.broadcastTipmsg(string.format("<(n%s)>玩家领取了大吉大利%s奖励,超级丰盛<我也要领取/@@showWin,251,0>",Actor.getName(sysarg),cfg.name), ttChatWindow)
	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了散人红利的每日登录大奖<我也要领取/@@showWin,259,2>",Actor.getName(sysarg)), ttChatWindow)
	--System.sendCommonLog(LogIds.sanrenhongli,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
end


--3每日首充
function SRHL_EveryDaysFirst(sysarg)
	local svar = System.getStaticVar()
	
	local var = Actor.getStaticVar(sysarg)
	
	--没有配置
	local cfg = SanRenHongLiCfg.EveryDaysFirst.Award[svar.isDringSanRenHongLi]
	if not cfg then 
		print("The sanrenhongli firstPay Award Config is nil ,Read file error")
		return  
	end
	
	--不能重复领取
	if var.days.sanrenhongliFirstPay ~=nil and var.days.sanrenhongliFirstPay==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	--判断是否有首充
	local nPeyCount = var.days.PeyNum
	if nPeyCount==nil or nPeyCount<=0 then 
		Actor.sendTipmsg(sysarg,"不满足领取条件",ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, cfg) then
		return 
	end
	
	var.days.sanrenhongliFirstPay = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, cfg, LogIds.sanrenhongli,"散人红利首充")
	if bResult == false then
		print("sanrenhongli Login Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetSanRenHongLiInfo(sysarg,3)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	--System.broadcastTipmsg(string.format("<(n%s)>玩家领取了大吉大利%s奖励,超级丰盛<我也要领取/@@showWin,251,0>",Actor.getName(sysarg),cfg.name), ttChatWindow)
	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了散人红利的充值特惠大奖<我也要领取/@@showWin,259,2>",Actor.getName(sysarg)), ttChatWindow)
	--System.sendCommonLog(LogIds.sanrenhongli,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
end

--4幸运转盘	
function SRHL_LuckeyZhuanPan(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.days.PeyNum==nil or var.days.PeyNum==0 then 
		Actor.sendTipmsg(sysarg,"请先充值",ttFlyTip)
		SendSRHL_LucklyDraw(sysarg,0)
		return 
	end
	
	--检查是抽第几次
	local cfg = SanRenHongLiCfg.LuckeyZhuanPan
	local totalTime =0
	for i=1,#cfg.needPay do 
		if var.days.PeyNum<cfg.needPay[i] then 
			break 
		else 
			totalTime=i
		end
	end

	if totalTime==0 then 
		Actor.sendTipmsg(sysarg,"充值元宝不足",ttFlyTip)
		SendSRHL_LucklyDraw(sysarg,0)
		return 
	end

	
	if var.days.sanrenhongliDraw == nil then
		var.days.sanrenhongliDraw=0 --今天已经抽了多少次
	end
	
	--没有抽奖次数了
	if totalTime<=var.days.sanrenhongliDraw or (var.days.sanrenhongliDraw + 1) >#cfg.needYB then 
		--今天已经没有抽奖次数了
		Actor.sendTipmsg(sysarg,"次数不足",ttFlyTip)
		SendSRHL_LucklyDraw(sysarg,0)
		return 
	end

	--元宝不足
	local needYB = cfg.needYB[var.days.sanrenhongliDraw + 1]
	local myYb = Actor.getIntProperty( sysarg, PROP_ACTOR_YUANBAO)
	if myYb < needYB then
		Actor.sendTipmsg(sysarg, "元宝不足", ttFlyTip)
		SendSRHL_LucklyDraw(sysarg,0)
		return
	end
	

	--扣元宝
	if Actor.changeMoney(sysarg, mtYuanbao, -needYB, LogIds.sanrenhongli, "幸运转盘扣除")==false then 
		Actor.sendTipmsg(sysarg,"扣除元宝失败",ttFlyTip)
		SendSRHL_LucklyDraw(sysarg,0)
		return
	end

	var.days.sanrenhongliDraw = var.days.sanrenhongliDraw +1
	
	--开始抽奖
	local index =0
	local randNumber = math.random(1,10000)
	for i=1,#cfg.rate do 
		if randNumber>=cfg.rate[i][2] and randNumber<=cfg.rate[i][3] then 
			index=i
		end
	end

	if index==0 then
		Actor.sendTipmsg(sysarg,"抽奖配置出错",ttFlyTip)
		SendSRHL_LucklyDraw(sysarg,0)
		return 
	end

	--扣元宝
	if Actor.changeMoney(sysarg, mtYuanbao, needYB*cfg.rate[index][1], LogIds.sanrenhongli, "幸运转盘奖励")==false then 
		Actor.sendTipmsg(sysarg,"扣除元宝失败",ttFlyTip)
		return
	end
	
	SendSRHL_LucklyDraw(sysarg,index)
	GetSanRenHongLiInfo(sysarg,4)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家运气太好了,在幸运转盘里抽中了%s倍率元宝返还<我也要抽奖/@@showWin,259,2>",Actor.getName(sysarg),cfg.rate[index][1]), ttChatWindow)
	
end

function SendSRHL_LucklyDraw(sysarg,index)
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSanRenHongLi)
	DataPack.writeByte(netPack,4)
	DataPack.writeByte(netPack,1)
	DataPack.writeByte(netPack,index)
	--print("index="..index)
	DataPack.flush(netPack)
end


function SRHL_XinShiGift(sysarg,x,y) --第几个，第几档
	local svar = System.getStaticVar()
	
	local var = Actor.getStaticVar(sysarg)
	local cfg = SanRenHongLiCfg.XinShiGift[svar.isDringSanRenHongLi]
	
	if cfg==nil then 
		return 
	end
	
	if x<1 or x>#cfg then 	
		return 
	end
	
	if y<1 or x>#cfg[x]then 	
		return 
	end
	
	if var.days.SRHL_XinShi==nil then 
		var.days.SRHL_XinShi={}
	end
	
	if var.days.SRHL_XinShi[x]==nil then 
		var.days.SRHL_XinShi[x]={}
	end
	
	if var.days.SRHL_XinShi[x][y]~=nil and var.days.SRHL_XinShi[x][y]==1 then 
		Actor.sendTipmsg(sysarg,"不能重复购买",ttFlyTip)
		return 
	end
	
	
	local myYb = Actor.getIntProperty( sysarg, PROP_ACTOR_YUANBAO)
	if myYb < cfg[x][y].needYB then
		Actor.sendTipmsg(sysarg, "元宝不足", ttFlyTip)
		return
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, cfg[x][y].Award) then
		return 
	end
	
	--扣元宝
	if Actor.changeMoney(sysarg, mtYuanbao, -cfg[x][y].needYB, LogIds.sanrenhongli, "限时购买")==false then 
		Actor.sendTipmsg(sysarg,"扣除元宝失败",ttFlyTip)
		return
	end
	
	
	var.days.SRHL_XinShi[x][y] = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, cfg[x][y].Award, LogIds.sanrenhongli,"限时购买")
	if bResult == false then
		print("sanrenhongli xianshi Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetSanRenHongLiInfo(sysarg,5)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家购买了散人红利限购道具,超低折扣不容错过<我也要购买/@@showWin,259,2>",Actor.getName(sysarg)), ttChatWindow)
	
end

--得到所有的信息
GetSanRenHongLiInfo = function(sysarg,index)
	--是否在开关时间内
	local var = Actor.getStaticVar(sysarg)
	local svar = System.getStaticVar()
	
	ClearSanRenHongLi_Data(sysarg)
	
	if index== 1 then --1累计充值
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSanRenHongLi)
		DataPack.writeByte(netPack,1)
		
		local cfg =SanRenHongLiCfg.EveryTotalPay
		
		if var.SRHL_Data.payTotal  == nil then 
			var.SRHL_Data.payTotal = {}
		end
		
		if var.SRHL_Data.payTotalFalg  == nil then 
			var.SRHL_Data.payTotalFalg = {}
		end
		
		for i=1,#cfg do 
			if var.SRHL_Data.payTotal[i]~=nil then 
				DataPack.writeByte(netPack,var.SRHL_Data.payTotal[i])
				--print("var.SRHL_Data.payTotal[i]="..var.SRHL_Data.payTotal[i])
			else 
				DataPack.writeByte(netPack,0)
				--print("var.SRHL_Data.payTotal[i]=0")
			end
		end
		
		--是否领取了
		for i=1,#cfg do 
			for j=1,#cfg[i].days do 
				if var.SRHL_Data.payTotalFalg[i]==nil then 
					DataPack.writeByte(netPack,0)
				else 
					if var.SRHL_Data.payTotalFalg[i][j]==nil then 
						DataPack.writeByte(netPack,0)
					else
						DataPack.writeByte(netPack,1)
					end
				end
			end
		end
        DataPack.flush(netPack)
	elseif index== 2 then --2登录奖励
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSanRenHongLi)
		DataPack.writeByte(netPack,2)
		if var.days.sanrenhongliLogin ~=nil and var.days.sanrenhongliLogin==1 then 
			DataPack.writeByte(netPack,1)
		else
			DataPack.writeByte(netPack,0)
		end
		DataPack.flush(netPack)
	elseif index ==3 then --3每日首充
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSanRenHongLi)
		DataPack.writeByte(netPack,3)
		if var.days.sanrenhongliFirstPay ==nil or var.days.sanrenhongliFirstPay==0 then 
			DataPack.writeByte(netPack,0)
		else 
			DataPack.writeByte(netPack,1)
		end
		DataPack.flush(netPack)
	elseif index==4 then --抽奖
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSanRenHongLi)
		DataPack.writeByte(netPack,4)
		DataPack.writeByte(netPack,2)
		if var.days.sanrenhongliDraw==nil then 
			DataPack.writeByte(netPack,0)
			--print("var.days.sanrenhongliDraw=0")
		else
			DataPack.writeByte(netPack,var.days.sanrenhongliDraw)
			--print("var.days.sanrenhongliDraw="..var.days.sanrenhongliDraw)	
		end
		DataPack.flush(netPack)
	elseif index ==5 then --5限时礼包
	
		local cfg = SanRenHongLiCfg.XinShiGift[svar.isDringSanRenHongLi]
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSanRenHongLi)
		DataPack.writeByte(netPack,5)
	
		if var.days.SRHL_XinShi==nil then 
			var.days.SRHL_XinShi={}
		end
		for i=1,#cfg do 
			if var.days.SRHL_XinShi[i]==nil then 
				var.days.SRHL_XinShi[i]={}
			end
		
			for j=1,#cfg[i] do 
				if var.days.SRHL_XinShi[i][j]~=nil and var.days.SRHL_XinShi[i][j]==1 then 
					DataPack.writeByte(netPack,1)
					--print("1")
				else
					DataPack.writeByte(netPack,0)
					--print("0")
				end
			end
			
		end
		DataPack.flush(netPack)
	elseif index == 6 then --6活动:每日充值排行榜
		daily_pay_ranking_send_data(sysarg)
	end
	
end


--开始散人红利活动
StartSanRenHongLi = function(nowOpenday) --开几天，当前是第几天
	--print("111111")
	--以免活动期间挂机了，这个挺麻烦的。。
	local svar = System.getStaticVar()
	if nowOpenday==nil or nowOpenday==0 then --默认当天是第1天
		svar.isDringSanRenHongLi = 1
	else 
		nowOpenday = tonumber(nowOpenday)
		if nowOpenday>3 then 
			return 
		end
		svar.isDringSanRenHongLi = nowOpenday
	end
	
	
	svar.StartSRHL_MiNitime = System.getCurrMiniTime()
		
	System.saveStaticVar()
	
	-- 散人红利每日充值排行榜
	daily_pay_ranking_start(svar.isDringSanRenHongLi, 3, 0)
	
	--print("开始散人红利活动,StartDJDLtime="..svar.StartDJDLtime)
	System.trace("start SanRenHongLi, StartSRHL_MiNitime ="..svar.StartSRHL_MiNitime)
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		--是否开启庆典活动
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sSanRenHongLi_IsOpen)
		DataPack.writeByte(netPack,svar.isDringSanRenHongLi)	--开启第几天(0,1,2,3)
		DataPack.flush(netPack)
	end	
	
end

--结束散人红利活动
EndSanRenHongLi = function()
	--print("22222")
	local svar = System.getStaticVar()
	svar.isDringSanRenHongLi = nil
	System.saveStaticVar()
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		--是否开启庆典活动
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sSanRenHongLi_IsOpen)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
	end
end


--散人红利是否开启
handleSanRenHongLiIsOpen = function (sysarg, sysid, packet)
	local svar = System.getStaticVar()

	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSanRenHongLi_IsOpen)
	if svar.isDringSanRenHongLi==nil then 
		DataPack.writeByte(netPack,0)
		--print("0000000")
	else 
		DataPack.writeByte(netPack,svar.isDringSanRenHongLi)
		--print("svar.isDringSanRenHongLi:"..svar.isDringSanRenHongLi)
	end
	DataPack.flush(netPack)
end



--后台命令开启
function backcmd_SanRenHongLiActs(args)

	local Type = tonumber(args[1])
	if Type==1 then 
		local Year = tonumber(args[2])
		local Month = tonumber(args[3])
		local Day = tonumber(args[4])
		--local openDay = tonumber(args[5])
		local openDay = 3

		if Year~=nil and Month~=nil and Day~=nil and openDay~=nil then 
			local refreshTime = System.encodeNumTime(Year,Month,Day,0,0,0) --写当天的更新日期
			
			local y,m,d,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(System.getCurrMiniTime())	
			local nNowDt = System.encodeNumTime(y,m,d,0,0,0)
			
			local diffTime = nNowDt-refreshTime


			if diffTime>=0 then 
				local nowDay = (math.floor(diffTime/86400)+1)
				if nowDay>openDay then 			--已经过期
					--print("ppppppp")
					return 
				else	
					local svar = System.getStaticVar()
					svar.StartSanRenHongLiYear = Year 
					svar.StartSanRenHongLiMonth = Month
					svar.StartSanRenHongLiDay = Day
				
					--print("eeeeeee")
					StartSanRenHongLi(nowDay)   --今天就是
				end
			else		--还没到（未来会到） （在跨天的时候检测一下）
				local svar = System.getStaticVar()
				svar.StartSanRenHongLiYear = Year 
				svar.StartSanRenHongLiMonth = Month
				svar.StartSanRenHongLiDay = Day
				--print("llllllllll")
			end
		end
		
		
	elseif Type==0 then --关闭
		EndSanRenHongLi()
	end
end

-- 后台命令(节日活动): SanRenHongLiActs|1|2018|4|18|开启天数
RegisterBackCmd("SanRenHongLiActs", backcmd_SanRenHongLiActs)