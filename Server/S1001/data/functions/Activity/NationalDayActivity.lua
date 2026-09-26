--#include "data\config\NationalDayActivityCfg.lua" once

--国庆活动
NationalDayActivitys = function (sysarg, sysid, packet)
--	--是否在开关时间内
--	local svar = System.getStaticVar()
--	if svar.National_openDay ==nil or svar.National_openDay==0 then 
--		return 
--	end
--	
--	if svar.isDringNational ==nil or svar.isDringNational<1 or svar.isDringNational>svar.National_openDay then 
--		return 
--	end
--	
--	local msgid = DataPack.readByte(packet)
--	if msgid == 0 then	--获取数据
--		GetNationalDayInfo(sysarg,DataPack.readByte(packet))
--	elseif msgid == 1 then --登录礼包
--		GetNationalDayLoginGift(sysarg)
--	elseif msgid == 2 then --充值礼包
--		GetNationalDayChongZhiGift(sysarg)
--	elseif msgid ==3 then --集字活动礼包
--		GetNationalDayJiZiGift(sysarg,DataPack.readByte(packet))--第几个礼包
--	elseif msgid ==4 then --金币富翁摇号
--		GetNalDayActivityJinQianFuWen(sysarg)
--	elseif msgid ==5 then --绝版称号
--		GetJueBanTitle(sysarg,DataPack.readByte(packet))
--	end
end

--得到登录礼包
GetNationalDayLoginGift = function (sysarg)
--
--	--没有配置
--	local award = NationalDayActivityCfg.LoginGift.award
--	if not award then 
--		print("The NationalDayActivityCfg Login Award Config is nil ,Read file error")
--		return  
--	end
--	
--	--判断是否领取过
--	local var = Actor.getStaticVar(sysarg)
--	if var.days.NalDayLoginGift ~=nil then 
--		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
--		return 
--	end
--	
--	--背包不足
--	if not Awards.CheckBagGridCount(sysarg, award) then
--		return 
--	end
--	
--	--给奖励
--	local bResult = Awards.Give(sysarg, award, LogIds.NationalDays,"国庆登录礼包")
--	if bResult == false then
--		print("NationalDayActivityCfg Login Gift error, actor name = "..Actor.getName(sysarg))
--		return 
--	end
--	var.days.NalDayLoginGift = 1
--	
--	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
--	
--	System.sendCommonLog(LogIds.NationalDays,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"国庆登录礼包")
--
--	GetNationalDayInfo(sysarg,1)
--	--和前端对接
end

GetNationalDayChongZhiGift= function (sysarg)
--	
--	--没有配置
--	local award = NationalDayActivityCfg.ChongZhiGift[1].award
--	if not award then 
--		print("The NationalDayActivityCfg ChongZhi Award Config is nil ,Read file error")
--		return  
--	end
--	
--	--充值不够
--	local var = Actor.getStaticVar(sysarg)
--	local nPeyCount = var.days.PeyNum
--	if not nPeyCount then 
--		Actor.sendTipmsg(sysarg,string.format("你今天充值不足%s元宝，无法领取奖励",NationalDayActivityCfg.ChongZhiGift[1].needChongzhiYB),ttFlyTip)
--		return
--	elseif nPeyCount < NationalDayActivityCfg.ChongZhiGift[1].needChongzhiYB then
--		Actor.sendTipmsg(sysarg,string.format("你今天充值不足%s元宝，无法领取奖励",NationalDayActivityCfg.ChongZhiGift[1].needChongzhiYB),ttFlyTip)
--		return
--	end
--	
--	
--	--判断是否领取过
--	if var.days.NalDayChongZhiGift ~=nil then 
--		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
--		return 
--	end
--	
--	--背包不足
--	if not Awards.CheckBagGridCount(sysarg, award) then
--		return 
--	end
--	
--	--给奖励
--	local bResult = Awards.Give(sysarg, award, LogIds.NationalDays,"国庆充值礼包")
--	if bResult == false then
--		print("NationalDayActivityCfg ChongZhi Gift error, actor name = "..Actor.getName(sysarg))
--		return 
--	end
--	var.days.NalDayChongZhiGift = 1
--	
--	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
--	
--	System.sendCommonLog(LogIds.NationalDays,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"国庆充值礼包")
--
--	GetNationalDayInfo(sysarg,2)
--	--和前端对接
end

--领取集字活动奖励
GetNationalDayJiZiGift= function(sysarg,index)
--	--判断物品是否足够
--	local cfg =NationalDayActivityCfg.JiZiActivity
--	for i=1,#cfg.needCollect[index] do 
--		local idindex = cfg.needCollect[index][i].id-5445
--		if Actor.getItemCount(sysarg,cfg.JiZiId[idindex])<=0 then  
--			Actor.sendTipmsg(sysarg,"道具不足，无法兑换",ttFlyTip)
--			return 
--		end
--	end
--	--背包不足
--	if not Awards.CheckBagGridCount(sysarg, cfg.award[index]) then
--		return 
--	end
--    
--	--扣除物品
--	for i=1,#cfg.needCollect[index] do 
--		local idindex = cfg.needCollect[index][i].id -5445
--		Actor.removeItem(sysarg,cfg.JiZiId[idindex],1)
--	end
--		
--	--给奖励
--	local bResult = Awards.Give(sysarg, cfg.award[index], LogIds.NationalDays,"国庆集字礼包")
--	if bResult == false then
--		print("NationalDayActivityCfg Collect Zi Gift error, actor name = "..Actor.getName(sysarg))
--		return 
--	end
--	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
--	GetNationalDayInfo(sysarg,3)
--	------------------------------------------------------------------------------------------------------------------
--	System.broadcastTipmsg(string.format("玩家<(n%s)>在集字送礼活动中兑换了%s,<我也要领取/@@showWin,155,2>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg.award[index][1].id)),ttChatWindow)
--	
--	System.sendCommonLog(LogIds.NationalDays,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,index.."国庆集字礼包")
end


--金钱富翁，摇号
GetNalDayActivityJinQianFuWen = function(sysarg)
--
--	--判断今天充值的钱数,	--判断今天摇号的次数
--	local var = Actor.getStaticVar(sysarg)
--	local onlineTime = Actor.getTodayOnlineTime(sysarg)
--	local cgf = NationalDayActivityCfg.JinBiFuWeng
--
--	local canYaoHaoTime = 0
--
--	for i=1,#cgf.YaoJiang do
--		if onlineTime >= cgf.YaoJiang[i].online then
--			canYaoHaoTime = canYaoHaoTime + cgf.YaoJiang[i].canRunTime
--		end
--	end
--
--	if var.days.NalDayYaoHaoTime ==nil then 
--		var.days.NalDayYaoHaoTime = 0
--	end	
--	
--	if var.days.NalDayYaoHaoTime>=canYaoHaoTime then 
--		Actor.sendTipmsg(sysarg,string.format("没有摇奖次数或次数用完"),ttFlyTip)
--		return 
--	end
--	
--	--开始摇号1~9
--	local randNumber=1
--	for i=1,#cgf.rands do 
--		if System.getRandomNumber(cgf.rands[i][2])==0 then  --产生0~n的随机
--			randNumber= cgf.rands[i][1]
--		end
--	end
--	
--	--把号码记录下来
--	if var.days.NalYaoHao ==nil then 
--		var.days.NalYaoHao = {}
--	end
--	
--	var.days.NalYaoHao[var.days.NalDayYaoHaoTime+1] =randNumber
--	
--	local addmoney=0
--	for i=1,var.days.NalDayYaoHaoTime+1 do 
--		addmoney = addmoney + var.days.NalYaoHao[i]* Ten_n(i-1)
--	end
--	
--	--给钱
--	Actor.changeMoney(sysarg,0,addmoney,LogIds.NationalDays,(var.days.NalDayYaoHaoTime+1).."国庆摇奖")
--	--改变摇号记录
--	var.days.NalDayYaoHaoTime = var.days.NalDayYaoHaoTime + 1
--	--记录下来
--	System.sendCommonLog(LogIds.NationalDays,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,var.days.NalDayYaoHaoTime.."国庆摇奖")
--	--发协议给前端
--	GetNationalDayInfo(sysarg,4)
--	
--	--把摇号动画停止下来----------------------------------------------------------------------------------
--	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNatDayActivity)
--	DataPack.writeByte(netPack,100) --特定写一个数，让前端区分
--	DataPack.flush(netPack)
--	--------------------------------------------------------------------------------------------------------
--	if var.days.NalDayYaoHaoTime>=6 then 
--		System.broadcastTipmsg(string.format("<(n%s)>玩家通过金币富翁获得绑金*%s<我也要获取/@@showWin,155,4>",Actor.getName(sysarg),addmoney), ttChatWindow)
--	end
end

--10的n次方
local function Ten_n(n)
	n = tonumber(n)
	local s=1
	if n~=0 then 
		for i=1,n do 
			s = s *10
		end
	end
	return s
end


GetJueBanTitle = function(sysarg,index)
--	index = tonumber(index)
--	
--	--非法封包
--	if (index~=1 and index~=2) then 
--		return 
--	end
--	
--	
--	--判断是否买过
--	local var = Actor.getStaticVar(sysarg)
--	if var.buyNDTitle==nil then 
--		var.buyNDTitle={}
--	end
--
--	if var.buyNDTitle[index]~=nil then 
--		Actor.sendTipmsg(sysarg,"不能重复购买",ttFlyTip)
--		return 
--	end
--	
--	if (index==1)then 
--		--判断钱够不够
--		if Actor.changeMoney(sysarg, 3, -NationalDayActivityCfg.OnlyTitle[index].needMoney, LogIds.NationalDays, "国庆购买称号") == false then
--			Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
--			return -- 元宝不足
--		end
--	elseif (index==2)then	
--		--扣除物品
--		local cfg = NationalDayActivityCfg.OnlyTitle[index]
--		if Actor.getItemCount(sysarg,cfg.needItem) < cfg.needItemCount then
--			Actor.sendTipmsg(sysarg,"所需物品不足", ttFlyTip);
--			return 
--		end
--		Actor.removeItem(sysarg, cfg.needItem, cfg.needItemCount, -1, -1, -1, "国庆兑换称号")
--	end
--	
--	Actor.sendTipmsg(sysarg,"操作成功",ttFlyTip)
--	--给称号
--	Actor.setTopTitle(sysarg,NationalDayActivityCfg.OnlyTitle[index].titleId,true)
--	
--	var.buyNDTitle[index]=1
--	--记录下来
--	--System.sendCommonLog(LogIds.NationalDays,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"")
--	--给前端发协议
--	GetNationalDayInfo(sysarg,5)
--	
--	--System.broadcastTipmsg(string.format("<(n%s)>玩家财大气粗购买%s.<我也要购买/@@showWin,216,7>",Actor.getName(sysarg),Item.getItemLinkMsg(QingDianActivityCfg.BuySwing[index].award[1].id)), ttChatWindow)
--end
--
--
----得到国庆活动信息
--GetNationalDayInfo = function(sysarg,index)
--	local var = Actor.getStaticVar(sysarg)
--	
--	if index ==0 then --国庆活动是否开启
--		NationalDayActivityIsOpen(sysarg)
--	elseif index== 1 then
--		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNatDayActivity)
--        DataPack.writeByte(netPack,1)
--		if (var.days.NalDayLoginGift ==nil) then 
--			DataPack.writeByte(netPack,1)
--		else 
--			DataPack.writeByte(netPack,0)
--		end
--        DataPack.flush(netPack)
--	elseif index== 2 then
--		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNatDayActivity)
--        DataPack.writeByte(netPack,2)
--		if (var.days.NalDayChongZhiGift ==nil) then 
--			DataPack.writeByte(netPack,1)
--		else 
--			DataPack.writeByte(netPack,0)
--		end
--        DataPack.flush(netPack)
--	elseif index== 3 then
--		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNatDayActivity)
--        DataPack.writeByte(netPack,3)
--        DataPack.flush(netPack)
--	elseif index == 4 then 
--		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNatDayActivity)
--		DataPack.writeByte(netPack,4)
--		if var.days.NalDayYaoHaoTime ==nil then 
--			var.days.NalDayYaoHaoTime = 0
--		end	
--		DataPack.writeByte(netPack,var.days.NalDayYaoHaoTime) --一共摇号多少次
--		if var.days.NalDayYaoHaoTime~=0 then 
--			for i=1,var.days.NalDayYaoHaoTime do 
--				DataPack.writeByte(netPack,var.days.NalYaoHao[i])--摇号的数据全部发下去
--			end
--		end
--		DataPack.flush(netPack)
--	elseif index ==5 then 
--		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNatDayActivity)
--		DataPack.writeByte(netPack,5)
--		if var.buyNDTitle==nil then 
--			var.buyNDTitle={}
--		end
--		for i=1,#NationalDayActivityCfg.OnlyTitle do 
--			if var.buyNDTitle[i]==nil then 
--				DataPack.writeByte(netPack,1)  --可以购买
--			else
--				DataPack.writeByte(netPack,0) --已经购买了
--			end
--		end
--		DataPack.flush(netPack)
--	end	
end


--开始国庆活动
SatrtNationalDayActivity = function(openday , nowOpenday, startTime)
	local svar = System.getStaticVar()
	if nowOpenday == nil or nowOpenday == 0 then
		svar.isDringNational = 1
	else
		nowOpenday = tonumber(nowOpenday)
		svar.isDringNational = nowOpenday or 1
	end

	-- 国庆送礼只有七档奖励，每轮固定七天。
	svar.National_openDay = #NationalDayActivityCfg.NationalDayNew

	if startTime ~= nil or svar.isDringNational <= 1 or svar.StartNational_Year == nil or svar.StartNational_Month == nil or svar.StartNational_Day == nil then
		local y, m, d
		if startTime ~= nil then
			y, m, d = System.GetSystemTimeInMiniTime(startTime)
		else
			y, m, d = System.getDate()
		end
		svar.StartNational_Year = y
		svar.StartNational_Month = m
		svar.StartNational_Day = d
	end
	System.saveStaticVar()

	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end

	--旧国庆活动入口已停用，只清理旧入口图标；国庆送礼走 sNationalDayActivityNew。
	for i, player in ipairs(playerList) do
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sNatDayActivity)
		DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
	end
end

--结束国庆活动
EndNationalDayActivity = function()
	local svar = System.getStaticVar()
	svar.isDringNational = nil
	svar.StartNational_Year = nil
	svar.StartNational_Month = nil
	svar.StartNational_Day = nil
	svar.National_openDay = #NationalDayActivityCfg.NationalDayNew
	System.saveStaticVar()

	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end

	--告诉所有人关闭活动
	for i, player in ipairs(playerList) do
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sNatDayActivity)
		DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
	end
end
	
--国庆活动是否开启
NationalDayActivityIsOpen = function (sysarg)
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNatDayActivity)
	DataPack.writeByte(netPack,0) --返回类型为0
    DataPack.writeByte(netPack,0)
	DataPack.writeByte(netPack,0)
	DataPack.flush(netPack)
end

-- 按自然日推进七天一轮；停服跨过多天时仍保持原有轮次节奏。
EnsureNationalDayActivity = function()
	if System.getCurrMiniTime() < System.getServerOpenTime() then return 0 end

	local svar = System.getStaticVar()
	local y, m, d = System.getDate()
	local today = System.encodeNumTime(y, m, d, 0, 0, 0)
	local startDate
	local hasStart = svar.StartNational_Year ~= nil and svar.StartNational_Month ~= nil and svar.StartNational_Day ~= nil
	if hasStart then
		startDate = System.encodeNumTime(svar.StartNational_Year, svar.StartNational_Month, svar.StartNational_Day, 0, 0, 0)
	end
	local resetStart = not hasStart or startDate > today or svar.isDringNational == nil or svar.isDringNational == 0
	if resetStart then
		startDate = today
	end

	local duration = #NationalDayActivityCfg.NationalDayNew
	local elapsedDays = math.floor((today - startDate) / 86400)
	local cycleStart = startDate + math.floor(elapsedDays / duration) * duration * 86400
	local day = elapsedDays % duration + 1
	if resetStart or svar.isDringNational < 1 or cycleStart ~= startDate then
		SatrtNationalDayActivity(duration, day, cycleStart)
	elseif svar.isDringNational ~= day or svar.National_openDay ~= duration then
		svar.isDringNational = day
		svar.National_openDay = duration
		System.saveStaticVar()
	end
	return day
end

-- 领取位按活动轮次保存，避免上一轮的达标和已领取状态挡住新一轮。
EnsureNationalDayRewardCycle = function(sysarg)
	local svar = System.getStaticVar()
	if svar.StartNational_Year == nil or svar.StartNational_Month == nil or svar.StartNational_Day == nil then return end
	local cycleStart = System.encodeNumTime(svar.StartNational_Year, svar.StartNational_Month, svar.StartNational_Day, 0, 0, 0)
	local var = Actor.getStaticVar(sysarg)
	if var.nationalDayInfoNewCycle ~= cycleStart then
		var.nationalDayInfoNew = 0
		var.nationalDayInfoNewCycle = cycleStart
		local day = svar.isDringNational
		if day ~= nil and day >= 1 and day <= #NationalDayActivityCfg.NationalDayNew and
			var.days ~= nil and (var.days.PeyNum or 0) >= NationalDayActivityCfg.NationalDayNew[day].needYB then
			var.nationalDayInfoNew = System.setIntBit(var.nationalDayInfoNew, day, true)
		end
	end
end

--MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cNatDayActivity, NationalDayActivitys)



--国庆活动
NationalDayActivitysNew =function (sysarg, sysid, packet)
	--是否在开关时间内
	local msgid = DataPack.readByte(packet)
	if msgid ==1 then --请求当前是第几天
		SentNationalDayIndex(sysarg)
	elseif msgid==2 then --请求数据
		SentNationalDayInfoNew(sysarg)
	elseif msgid==3 then --请求领取
		GetNationalDayAwardNew(sysarg,DataPack.readByte(packet))
	end
end

--领取第几天的奖励
function GetNationalDayAwardNew(sysarg,index)
	local NowDayIndex = GetNationalIndexDay()
	if NowDayIndex<1 or NowDayIndex>7 then
		return
	end
	EnsureNationalDayRewardCycle(sysarg)
	
	if index<1 or index>7 then 
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	
	--充值是否足够
	local cfg = NationalDayActivityCfg.NationalDayNew
	if var.nationalDayInfoNew==nil or System.getIntBit(var.nationalDayInfoNew,index)==0 then 
		if NowDayIndex==index then 
			Actor.sendTipmsg(sysarg,"充值不足",ttFlyTip)
		elseif NowDayIndex<index then 
			Actor.sendTipmsg(sysarg,"未到天数,不能领取",ttFlyTip)
		elseif NowDayIndex>index then 
			Actor.sendTipmsg(sysarg,"活动时间已过，领取失败",ttFlyTip)
		end
		return 
	end
	
	--是否已经领取过
	if var.nationalDayInfoNew~=nil and System.getIntBit(var.nationalDayInfoNew,index+7)==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	--槽位是否足够
	if not Awards.CheckBagGridCount(sysarg, cfg[index].award) then
		return 
	end
	
	--设置已经领取过
	var.nationalDayInfoNew = System.setIntBit(var.nationalDayInfoNew,index+7,true)
	
	--给奖品
	local bResult = Awards.Give(sysarg, cfg[index].award, LogIds.NationalDays,cfg[index].name)
	if bResult == false then
		print("NationalDayActivityCfg ChongZhi2 Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	--给前端发协议
	SentNationalDayInfoNew(sysarg)
end



--请求国庆节index
function SentNationalDayIndex(sysarg)
	local NowDayIndex = GetNationalIndexDay()
	if NowDayIndex<0 or NowDayIndex>7 then 
		NowDayIndex=0
	end
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNationalDayActivityNew)
	DataPack.writeByte(netPack,1)
	DataPack.writeByte(netPack,NowDayIndex)
	DataPack.flush(netPack)
end

--请求国庆节数据
function SentNationalDayInfoNew(sysarg)
	GetNationalIndexDay()
	EnsureNationalDayRewardCycle(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNationalDayActivityNew)
	DataPack.writeByte(netPack,2)
	if var.nationalDayInfoNew==nil then 
		DataPack.writeInt(netPack,0)
	else 
		DataPack.writeInt(netPack,var.nationalDayInfoNew) --1~7是否已经充值足够的标记(1可以领取，0不可以)，8~14是都已经领取的标记（1已经领取了，0还没领取s）
	end
	DataPack.flush(netPack)
	--发送可以的标记
	--发送是否已经领取的标记
end

--当前的国庆节的第几天
GetNationalIndexDay = function()
	return EnsureNationalDayActivity()
end


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cNationalDayActivityNew, NationalDayActivitysNew)