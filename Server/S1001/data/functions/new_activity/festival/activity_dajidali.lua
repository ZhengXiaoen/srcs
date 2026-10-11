--#include "data\config\new_activity\festival\activity_DaJiDaLi.lua" once --大吉大利活动


--大吉大利协议派发
handleDaJiDaLi = function(sysarg, sysid, packet)
    if not LocalDT.IsAnniversaryActivityOpen() then return end
    LocalDT.ClearAnniversaryMergedData(sysarg)
    local msgid = DataPack.readByte(packet)
    if msgid == 0 then
        if DataPack.readByte(packet) == 6 then GetDaJiDaLiInfo(sysarg, 6) end
    elseif msgid == 6 then
        GetConsumeGift(sysarg, DataPack.readByte(packet))
    end
end

--1登录礼包
GetDaJiDaLiLoginGift = function(sysarg,index)
	
	local svar = System.getStaticVar()
	
	local var = Actor.getStaticVar(sysarg)
	if var.DJDL_Data.login ==nil then 
		var.DJDL_Data.login = 1
	end
	
	if var.DJDL_Data.loginflag ==nil then
		var.DJDL_Data.loginflag={}
	end
	
	
	--没有配置
	local cfg = activity_DaJiDaLi.loginGiveAward.Info[index]
	if not cfg then 
		print("The dajidali Login Award Config is nil ,Read file error")
		return  
	end
	
	--防止0点，连续领取
	if svar.isDringDaJiDaLi < index then
		Actor.sendTipmsg(sysarg,"还没达到领取条件",ttFlyTip)
		return 
	end
	
	if var.DJDL_Data.login<index then 
		Actor.sendTipmsg(sysarg,"还没达到领取条件",ttFlyTip)
		return 
	end
	
	if var.DJDL_Data.loginflag[index]~=nil and var.DJDL_Data.loginflag[index]==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	local award = cfg.award
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	var.DJDL_Data.loginflag[index] = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.dajidaliActivity,cfg.name)
	if bResult == false then
		print("dajidali Login Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetDaJiDaLiInfo(sysarg,1)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了大吉大利%s奖励,超级丰盛<我也要领取/@@showWin,251,0>",Actor.getName(sysarg),cfg.name), ttChatWindow)

	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)


end

--2充值赠送
GetChongzhiGift_dajidali = function(sysarg,index)
	
	local svar = System.getStaticVar()
	
	local isOpen = false
	for i=1,#activity_DaJiDaLi.payGiveAward.openDay do 
		if svar.isDringDaJiDaLi==activity_DaJiDaLi.payGiveAward.openDay[i] then 
			isOpen =true
		end
	end
	if isOpen==false then 
		Actor.sendTipmsg(sysarg,"今天不开启",ttFlyTip)
		return 
	end
	
	local cfg =activity_DaJiDaLi.payGiveAward.Info
	
	if not cfg then 
		return  
	end
	
	local itemCfg = cfg[index]
	if not itemCfg then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	--充值不够
	--local nPeyCount = var.days.PeyNum
	local nPeyCount = var.DJDL_Data.chongzhi
	if not nPeyCount then 
		return
	elseif nPeyCount < itemCfg.needMoney then
		Actor.sendTipmsg(sysarg,string.format("充值不足%s元宝，无法领取奖励",itemCfg.needMoney),ttFlyTip)
		return
	end
	
	if var.DJDL_Data.dajidaliCZ==nil then 
		var.DJDL_Data.dajidaliCZ={}
	end
	
	--判断是否领取过
	if var.DJDL_Data.dajidaliCZ[index] ~=nil then 
		Actor.sendTipmsg(sysarg,"你已经领取过该奖励，无法再次领取",ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, itemCfg.award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, itemCfg.award, LogIds.dajidaliActivity, cfg.name)
	if bResult == false then
		print("dajidali chongzhi award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.DJDL_Data.dajidaliCZ[index] = 1
	
	GetDaJiDaLiInfo(sysarg,2)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	System.broadcastTipmsg(string.format("玩家<(n%s)>领取大吉大利的%s,<我也要领取/@@showWin,251,1>",Actor.getName(sysarg),itemCfg.name),ttChatWindow)
	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,itemCfg.name)
	

	
	--System.broadcastTipmsg(string.format("玩家<(n%s)>领取了节日活动-充值奖励,<我也要领取/@@showWin,248,0>",Actor.getName(sysarg)),ttChatWindow)
end

--3为民除害（杀boss）
GetWeiMingChuHaiGift = function(sysarg,index)

	
	local var = Actor.getStaticVar(sysarg)

	
	local cfg = activity_DaJiDaLi.killBoss.Info[index]
	
	if not cfg then 
		return  
	end
	
	
	local needKillCount =cfg.needKillCount
	local award = cfg.award
	
	--print("var.DJDL_Data.killBoss="..var.DJDL_Data.killBoss)
	
	if var.DJDL_Data.killBoss==nil or var.DJDL_Data.killBoss< needKillCount then 
		Actor.sendTipmsg(sysarg,"领取条件不满足",ttFlyTip)
		return 
	end
	
	--判断是否领取过
	if var.DJDL_Data.KBgive==nil then 
		var.DJDL_Data.KBgive={}
	end
	
	if var.DJDL_Data.KBgive[index] ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg,award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.dajidaliActivity, cfg.name)
	if bResult == false then
		print("dajidali weilingchuhai award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.DJDL_Data.KBgive[index] = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	GetDaJiDaLiInfo(sysarg,3)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>领取大吉大利的%s,<我也要领取/@@showWin,251,1>",Actor.getName(sysarg),cfg.name),ttChatWindow)
	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
end


--4激情pk
GetJiQingPkGift = function(sysarg,index)	
	
	
	local var = Actor.getStaticVar(sysarg)
	local cfg = activity_DaJiDaLi.happyPK.Info[index]
	
	if not cfg then 
		return  
	end
	
	local killcount = nil
	local award = cfg.award
	local needKillCount = cfg.needKillCount
	
	
	if cfg.killInScene ==110 then 
		killcount = var.DJDL_Data.killIn110
	elseif cfg.killInScene ==234 then 
		killcount = var.DJDL_Data.killIn234
	end
	
	if killcount==nil or killcount<needKillCount then 
		Actor.sendTipmsg(sysarg,"不满足领取条件",ttFlyTip)
		return 
	end
	
	
	--判断是否领取过
	if var.DJDL_Data.PKgive==nil then 
		var.DJDL_Data.PKgive={}
	end
	
	if var.DJDL_Data.PKgive[index] ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg,award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.dajidaliActivity, cfg.name)
	if bResult == false then
		print("dajidali jiqingpk award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.DJDL_Data.PKgive[index] = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	GetDaJiDaLiInfo(sysarg,4)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>领取大吉大利的%s,<我也要领取/@@showWin,251,1>",Actor.getName(sysarg),cfg.name),ttChatWindow)
	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
	
end

--5每日限购礼包
function GetMeiRiXianGouGift(sysarg,index)
	--是否在开关时间内
	
	local var = Actor.getStaticVar(sysarg)
	local cfg = activity_DaJiDaLi.buyGiveAward.Info[index]
	if cfg==nil then 
		return 
	end

	if var.days.buyDaJiDaLi~=nil and var.days.buyDaJiDaLi[index]==1 then 
		Actor.sendTipmsg(sysarg,"每天只能买一次",ttFlyTip)
		return 
	end
	
	--随机给一个
	local _awardListSize = #cfg.award
	local awardIdx = System.getRandomNumber(_awardListSize) + 1
	if awardIdx < 1 or awardIdx > _awardListSize then
		awardIdx = 1
	end
	
	local award = {cfg.award[awardIdx]}

	--判断是否够位置
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end

	--判断钱够不够
	if Actor.changeMoney(sysarg, 3, -cfg.needMoney, LogIds.dajidaliActivity, cfg.name) == false then
		Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
		return -- 元宝不足
	end
	

	if var.days.buyDaJiDaLi==nil then 
		var.days.buyDaJiDaLi={}
	end
	
	var.days.buyDaJiDaLi[index] =1
		
	Actor.sendTipmsg(sysarg,"购买成功",ttFlyTip)
	--给东西
	Awards.Give(sysarg,award,LogIds.dajidaliActivity,cfg.name)

	GetDaJiDaLiInfo(sysarg,5)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>购买了大吉大利的%s,<我也要领取/@@showWin,251,1>",Actor.getName(sysarg),cfg.name),ttChatWindow)
	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
end

--6消费赠送
function GetConsumeGift(sysarg,index)
	local svar = System.getStaticVar()
	
	if not LocalDT.IsAnniversaryActivityOpen() then return end
	LocalDT.ClearAnniversaryMergedData(sysarg)

	local var = Actor.getStaticVar(sysarg)
	--local dayConsumeYB_WUYI = var.dayConsumeYB_WUYI  --通用的每日消费
	local dayConsumeYB_WUYI = var.OneYearAct_Data.consumeGift.Consume --大吉大利累计消费
	if dayConsumeYB_WUYI == nil then
		dayConsumeYB_WUYI = 0
	end

	
	local cfg = activity_DaJiDaLi.comsumeGiveAward.Info[index]

	--判断参数
	if cfg==nil then 
		return 
	end

	if dayConsumeYB_WUYI == 0 then
		Actor.sendTipmsg(sysarg,string.format("消费不足%s元宝，无法领取奖励",cfg.needMoney),ttFlyTip)
		return 
	elseif dayConsumeYB_WUYI < cfg.needMoney then 
		Actor.sendTipmsg(sysarg,string.format("消费不足%s元宝，无法领取奖励",cfg.needMoney),ttFlyTip)
		return
	end

	--消费领取标记
	if var.OneYearAct_Data.consumeGift.dajidaliConsume==nil then
		var.OneYearAct_Data.consumeGift.dajidaliConsume={}
	end
	
	--判断是否领取过
	if var.OneYearAct_Data.consumeGift.dajidaliConsume[index] ~=nil then
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, cfg.award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, cfg.award, LogIds.dajidaliActivity, cfg.name)
	if bResult == false then
		print("give dajidali consume award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.OneYearAct_Data.consumeGift.dajidaliConsume[index] = 1

	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	GetDaJiDaLiInfo(sysarg,6)
	
	--System.broadcastTipmsg(string.format("玩家<(n%s)>领取了节日活动-消费豪礼,<我也要领取/@@showWin,248,2>",Actor.getName(sysarg)),ttChatWindow)
	System.broadcastTipmsg(string.format("玩家<(n%s)>购买了周年庆典的%s,<我也要领取/@@showWin,254,14>",Actor.getName(sysarg),cfg.name),ttChatWindow)
	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
	
end

--7多倍副本
function GetDuoBeiFUBenGift(sysarg,index)
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg)
	
	local isOpen = false
	for i=1,#activity_DaJiDaLi.duobeiGiveAward.openDay do 
		if svar.isDringDaJiDaLi==activity_DaJiDaLi.duobeiGiveAward.openDay[i] then 
			isOpen =true
		end
	end
	if isOpen==false then 
		Actor.sendTipmsg(sysarg,"今天不开启",ttFlyTip)
		return 
	end
	
	if var.DJDL_Data.getduobeifuben ==nil then 
		Actor.sendTipmsg(sysarg,"领取条件不满足",ttFlyTip)
		return 
	end
	
	local cfg = activity_DaJiDaLi.duobeiGiveAward.Info[index]
	
	if not cfg then 
		return  
	end
	
	if cfg.needTime>var.DJDL_Data.getduobeifuben then 
		Actor.sendTipmsg(sysarg,"领取条件不满足",ttFlyTip)
		return 
	end
	
	--领取标记
	if var.DJDL_Data.dajidaliFB==nil then 
		var.DJDL_Data.dajidaliFB={}
	end
	
	--判断是否领取过
	if var.DJDL_Data.dajidaliFB[index] ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, cfg.award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, cfg.award, LogIds.dajidaliActivity,cfg.name)
	if bResult == false then
		print("give dajidali fubenDuoBei award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.DJDL_Data.dajidaliFB[index] = 1

	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	GetDaJiDaLiInfo(sysarg,7)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>购买了大吉大利的%s,<我也要领取/@@showWin,251,1>",Actor.getName(sysarg),cfg.name),ttChatWindow)
	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
end

--8跨服的
function GetEnterCrossGift(sysarg,packet)
	local index1 =DataPack.readByte(packet)
	local index2 =DataPack.readByte(packet)
	
	--print("index1="..index1)
	--print("index2="..index2)
	
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg)
	
	local isOpen = false
	for i=1,#activity_DaJiDaLi.enterCross.openDay do 
		if svar.isDringDaJiDaLi==activity_DaJiDaLi.enterCross.openDay[i] then 
			isOpen =true
		end
	end
	if isOpen==false then 
		Actor.sendTipmsg(sysarg,"今天不开启",ttFlyTip)
		return 
	end
	
	local cfg =nil 
	local needCount =0
	local hasCount = 0
	if index1==1 then 
		cfg = activity_DaJiDaLi.enterCross.enter3V3
		needCount = cfg.enterTime
		hasCount =var.days.enter3V3Count
	elseif index1==2 then 
		cfg = activity_DaJiDaLi.enterCross.consumeTuMoDian[index2]
		if cfg == nil then return end
		
		needCount = cfg.spend
		hasCount =var.days.spendTuMoDianCount
	elseif index1==3 then 
		cfg = activity_DaJiDaLi.enterCross.enterYuanGuYaBiao
		needCount = cfg.enterTime
		hasCount =var.days.enterYuanGuYaBiao
	end
	if cfg==nil then 
		return 
	end
	
	if hasCount==nil or hasCount<needCount then 
		Actor.sendTipmsg(sysarg,"领取条件不满足",ttFlyTip)
		return 
	end

	--领取标记
	if var.days.dajidaliCross==nil then 
		var.days.dajidaliCross={}
	end
	if var.days.dajidaliCross[index1]==nil then 
		var.days.dajidaliCross[index1]={}
	end
	
	--判断是否领取过
	if var.days.dajidaliCross[index1][index2] ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, cfg.award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, cfg.award, LogIds.dajidaliActivity, cfg.name)
	if bResult == false then
		print("give dajidali cross award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.dajidaliCross[index1][index2] = 1

	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	GetDaJiDaLiInfo(sysarg,8)
	
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>购买了大吉大利的%s,<我也要领取/@@showWin,251,1>",Actor.getName(sysarg),cfg.name),ttChatWindow)
	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
end

--9寻宝
function GeXunBaoGift_dajidali(sysarg,index)
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg)
	
	local isOpen = false
	for i=1,#activity_DaJiDaLi.xunbaoGiveAward.openDay do 
		if svar.isDringDaJiDaLi==activity_DaJiDaLi.xunbaoGiveAward.openDay[i] then 
			isOpen =true
		end
	end
	if isOpen==false then 
		Actor.sendTipmsg(sysarg,"今天不开启",ttFlyTip)
		return 
	end
	
	if var.newdays==nil then 
		var.newdays={}
	end
	if var.newdays.XunBaoTime==nil then var.newdays.XunBaoTime=0 end
		
	local cfg = activity_DaJiDaLi.xunbaoGiveAward.Info[index]
	
	if not cfg then 
		return  
	end
	
	if cfg.times>var.newdays.XunBaoTime then 
		Actor.sendTipmsg(sysarg,"领取条件不满足",ttFlyTip)
		return 
	end
	
	--领取标记
	if var.days.dajidaliXunBao==nil then 
		var.days.dajidaliXunBao={}
	end
	
	--判断是否领取过
	if var.days.dajidaliXunBao[index] ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, cfg.award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, cfg.award, LogIds.dajidaliActivity, cfg.name)
	if bResult == false then
		print("give dajidali xunbao award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.dajidaliXunBao[index] = 1

	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	GetDaJiDaLiInfo(sysarg,9)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>购买了大吉大利的%s,<我也要领取/@@showWin,251,1>",Actor.getName(sysarg),cfg.name),ttChatWindow)
	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
end

--10闯地图
function GetChuangDiTuGift_dajidali(sysarg,index)
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg)
	
	local isOpen = false
	for i=1,#activity_DaJiDaLi.chuangdituGiveAward.openDay do 
		if svar.isDringDaJiDaLi==activity_DaJiDaLi.chuangdituGiveAward.openDay[i] then 
			isOpen =true
		end
	end
	if isOpen==false then 
		Actor.sendTipmsg(sysarg,"今天不开启",ttFlyTip)
		return 
	end
	
	local cfg = activity_DaJiDaLi.chuangdituGiveAward.Info[index]
	
	if not cfg then 
		return  
	end
	
	local award = cfg.award
	if var.days.djdl_ChuangCount==nil or var.days.djdl_ChuangCount[index]==nil then 
		Actor.sendTipmsg(sysarg,"没有满足领取条件",ttFlyTip)
		return 
	end
	
	if var.days.djdl_ChuangCount[index]<cfg.times then 
		Actor.sendTipmsg(sysarg,"没有满足领取条件",ttFlyTip)
		return 
	end
	

	--判断是否领取过
	if var.days.djdl_ChuangFlag==nil then 
		var.days.djdl_ChuangFlag={}
	end
	
	if var.days.djdl_ChuangFlag[index] ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg,award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.dajidaliActivity, cfg.name)
	if bResult == false then
		print("dajidali chuangditu award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.djdl_ChuangFlag[index] = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	GetDaJiDaLiInfo(sysarg,10)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>购买了大吉大利的%s,<我也要领取/@@showWin,251,1>",Actor.getName(sysarg),cfg.name),ttChatWindow)
	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
end

--11杀小怪
function GetkillMonster_dajidali(sysarg,index)
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg)
	
	local isOpen = false
	for i=1,#activity_DaJiDaLi.killMonsterGiveAward.openDay do 
		if svar.isDringDaJiDaLi==activity_DaJiDaLi.killMonsterGiveAward.openDay[i] then 
			isOpen =true
		end
	end
	if isOpen==false then 
		Actor.sendTipmsg(sysarg,"今天不开启",ttFlyTip)
		return 
	end
	
	local cfg = activity_DaJiDaLi.killMonsterGiveAward.Info[index]
	
	if not cfg then 
		return  
	end
	
	local award = cfg.award
	if var.days.djdl_killMonsters==nil or var.days.djdl_killMonsters< cfg.needKill then 
		Actor.sendTipmsg(sysarg,"没有满足领取条件",ttFlyTip)
		return 
	end
	

	--判断是否领取过
	if var.days.djdl_killMonsterFlag==nil then 
		var.days.djdl_killMonsterFlag={}
	end
	
	if var.days.djdl_killMonsterFlag[index] ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg,award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.dajidaliActivity, cfg.name)
	if bResult == false then
		print("killmonster award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.djdl_killMonsterFlag[index] = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	GetDaJiDaLiInfo(sysarg,11)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>购买了大吉大利的%s,<我也要领取/@@showWin,251,1>",Actor.getName(sysarg),cfg.name),ttChatWindow)
	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
end

--12新的累计充值
GetChongzhiGift_dajidaliNew =function(sysarg,dang,index) --第几档，第几个
	dang= tonumber(dang)
	index= tonumber(index)
	
	--判断参数是否非法
	if dang<=0 or dang>#activity_DaJiDaLi.payGiveAwardNew.needMoney then 
		return 
	end
	
	local cfg = activity_DaJiDaLi.payGiveAwardNew.Info[dang]
	if cfg==nil or index<=0 or cfg[index]==nil  then 
		return 
	end
	
	--判断是否领取过
	local var = Actor.getStaticVar(sysarg)
	if var.DJDL_Data.chongzhiflagNew ==nil then 
		var.DJDL_Data.chongzhiflagNew = {}
	end
	
	if var.DJDL_Data.chongzhiflagNew[dang]==nil then 
		var.DJDL_Data.chongzhiflagNew[dang]={}
	end
	
	if var.DJDL_Data.chongzhiflagNew[dang][index]~=nil and var.DJDL_Data.chongzhiflagNew[dang][index]==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	--判断是否足够
	if var.DJDL_Data.chongzhiDataNew ==nil or var.DJDL_Data.chongzhiDataNew[dang]==nil or var.DJDL_Data.chongzhiDataNew[dang]< index then
		Actor.sendTipmsg(sysarg,"未到领取条件",ttFlyTip)
		return 
	end
	
	
	local award = cfg[index].award
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	--记录已经领取过奖励
	--if var.DJDL_Data.chongzhiflagNew==nil then 
	--	var.DJDL_Data.chongzhiflagNew={}
	--end
	--if var.DJDL_Data.chongzhiflagNew[dang]==nil then 
	--	var.DJDL_Data.chongzhiflagNew[dang]={}
	--end
	var.DJDL_Data.chongzhiflagNew[dang][index] = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.dajidaliActivity,cfg[index].name)
	if bResult == false then
		print("dajidali chongzhiNew Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetDaJiDaLiInfo(sysarg,12)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了大吉大利%s奖励,超级丰盛<我也要领取/@@showWin,251,0>",Actor.getName(sysarg),cfg[index].name), ttChatWindow)

	System.sendCommonLog(LogIds.dajidaliActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg[index].name)

end

--得到所有的信息
GetDaJiDaLiInfo = function(sysarg,index)
	--是否在开关时间内
	local var = Actor.getStaticVar(sysarg)
	if index == 6 then LocalDT.ClearAnniversaryMergedData(sysarg) else ClearDaJiDaLi_Data(sysarg,5) end
	
	if index== 1 then --1登录礼包
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack,1)
		if var.DJDL_Data.login ==nil then 
			var.DJDL_Data.login = 1
		end
        DataPack.writeByte(netPack,var.DJDL_Data.login)
		local cfg =activity_DaJiDaLi.loginGiveAward.Info
		for i=1,#cfg do 
			if var.DJDL_Data.loginflag==nil then 
				DataPack.writeByte(netPack,0)
			else 
				if var.DJDL_Data.loginflag[i]==nil then 
					DataPack.writeByte(netPack,0)
				else 
					DataPack.writeByte(netPack,1)
				end
			end
		end
        DataPack.flush(netPack)
	elseif index== 2 then --2充值赠送
		local cfg =activity_DaJiDaLi.payGiveAward.Info
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack, 2) 
		if var.DJDL_Data.dajidaliCZ==nil then 
			var.DJDL_Data.dajidaliCZ={}
		end
		for i=1,#cfg do 	
			if var.DJDL_Data.dajidaliCZ[i] ~=nil and var.DJDL_Data.dajidaliCZ[i]==1 then 
				DataPack.writeByte(netPack, 1)
			else
				DataPack.writeByte(netPack, 0)
			end
		end
		if var.DJDL_Data.chongzhi==nil then
			DataPack.writeUInt(netPack, 0)
		else 
			DataPack.writeUInt(netPack, var.DJDL_Data.chongzhi)
		end
		DataPack.flush(netPack)
		
		
	elseif index==3 then --3为民除害（杀boss）
		local cfg =activity_DaJiDaLi.killBoss.Info
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack, 3) 
		if var.DJDL_Data.killBoss==nil then 
			DataPack.writeUInt(netPack, 0)
			for i=1,#cfg do 	
				DataPack.writeByte(netPack, 0)
			end
			DataPack.flush(netPack)
			return 
		else 
			DataPack.writeUInt(netPack,var.DJDL_Data.killBoss)
		end

		for i=1,#cfg do 	
			if var.DJDL_Data.KBgive==nil then --表全为空的
				DataPack.writeByte(netPack,0)
			else 
				if var.DJDL_Data.KBgive[i] ~=nil  and var.DJDL_Data.KBgive[i] ==1 then --只是一个为空的
					DataPack.writeByte(netPack, 1)
				else
					DataPack.writeByte(netPack, 0)
				end
			end
		end
		DataPack.flush(netPack)
		
	elseif index ==4 then --4激情pk
		local cfg =activity_DaJiDaLi.happyPK.Info
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack, 4) 
		
		--杀了多少个人在110
		if var.DJDL_Data.killIn110==nil  then 
			DataPack.writeUInt(netPack, 0) 
		else
			DataPack.writeUInt(netPack, var.DJDL_Data.killIn110) 
		end
		--杀了多少个人在234
		if var.DJDL_Data.killIn234==nil  then 
			DataPack.writeUInt(netPack, 0) 
		else
			DataPack.writeUInt(netPack, var.DJDL_Data.killIn234) 
		end
		
		--是否有获取过奖励
		if var.DJDL_Data.PKgive==nil then 
			var.DJDL_Data.PKgive={}
		end
	
		for i=1,#cfg do 	
			if var.DJDL_Data.PKgive[i] ~=nil and var.DJDL_Data.PKgive[i]==1 then 
				DataPack.writeByte(netPack, 1)
			else
				DataPack.writeByte(netPack, 0)
			end
		end
		DataPack.flush(netPack)
		
	elseif index ==5 then --5每日限购礼包
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack, 5) 
		local cfg =activity_DaJiDaLi.buyGiveAward.Info
		if var.days.buyDaJiDaLi==nil  then 
			for i=1,#cfg do 	--全部都没有购买的
				DataPack.writeByte(netPack, 0)
			end
			DataPack.flush(netPack)
			return 
		end
		
		for i=1,#cfg do 	
			if var.days.buyDaJiDaLi[i]~=nil and var.days.buyDaJiDaLi[i]==1 then 
				DataPack.writeByte(netPack, 1)
			else 
				DataPack.writeByte(netPack, 0)
			end
		end
		DataPack.flush(netPack)
	elseif index==6 then  --6消费赠送
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack, 6) 
		
		local cfg =activity_DaJiDaLi.comsumeGiveAward.Info
		--local dayConsumeYB_WUYI = var.dayConsumeYB_WUYI  --通用的每日消费
		local dayConsumeYB_WUYI = var.OneYearAct_Data.consumeGift.Consume
		if dayConsumeYB_WUYI == nil then
			dayConsumeYB_WUYI = 0
		end
		DataPack.writeUInt(netPack, dayConsumeYB_WUYI)
		
		if var.OneYearAct_Data.consumeGift.dajidaliConsume==nil then
			for i=1,#cfg do 	--全部都没有购买的
				DataPack.writeByte(netPack, 0)
			end
			DataPack.flush(netPack)
			return 
		end
		
		for i=1,#cfg do 	
			if var.OneYearAct_Data.consumeGift.dajidaliConsume[i]~=nil and var.OneYearAct_Data.consumeGift.dajidaliConsume[i]==1 then
				DataPack.writeByte(netPack, 1)
			else 
				DataPack.writeByte(netPack, 0)
			end
		end
		DataPack.flush(netPack)
		
	elseif index==7 then  --7副本多倍领取
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack, 7) 
		
		local cfg =activity_DaJiDaLi.duobeiGiveAward.Info
		if var.DJDL_Data.getduobeifuben==nil then 
			DataPack.writeByte(netPack, 0)
		else 
			DataPack.writeByte(netPack, var.DJDL_Data.getduobeifuben)
		end
		
		
		if var.DJDL_Data.dajidaliFB==nil then 
			for i=1,#cfg do 	--没有一次多倍
				DataPack.writeByte(netPack, 0)
			end
			DataPack.flush(netPack)
			return 
		end
		
		for i=1,#cfg do 
			if var.DJDL_Data.dajidaliFB[i]~=nil and var.DJDL_Data.dajidaliFB[i]==1 then 
				DataPack.writeByte(netPack, 1)
			else 
				DataPack.writeByte(netPack, 0)
			end
		end
		DataPack.flush(netPack)
	elseif index ==8 then 
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack, 8) 
	
		if var.days.enter3V3Count==nil then  --进入3v3的次数
			DataPack.writeByte(netPack, 0)
		else 
			DataPack.writeByte(netPack, var.days.enter3V3Count)
		end
		
		if var.days.spendTuMoDianCount==nil then  --使用屠魔点
			DataPack.writeUInt(netPack, 0)
		else 
			DataPack.writeUInt(netPack, var.days.spendTuMoDianCount)
		end
		
		
		if var.days.enterYuanGuYaBiao==nil then  --进行押镖的次数
			DataPack.writeByte(netPack, 0)
		else 
			DataPack.writeByte(netPack, var.days.enterYuanGuYaBiao)
		end


		if var.days.dajidaliCross==nil then 
			var.days.dajidaliCross ={}
		end
		for i=1,3 do 
			if var.days.dajidaliCross[i]==nil then 
				var.days.dajidaliCross[i]={}
			end
		end
		
		--3v3
		--for i=1,#activity_DaJiDaLi.enterCross.enter3V3 do	
			if var.days.dajidaliCross[1][1]~=nil and var.days.dajidaliCross[1][1]==1 then 
				DataPack.writeByte(netPack,1)
			else 
				DataPack.writeByte(netPack,0)
			end
		--end
		--屠魔点
		for i=1,#activity_DaJiDaLi.enterCross.consumeTuMoDian do	
			if var.days.dajidaliCross[2][i]~=nil and  var.days.dajidaliCross[2][i]==1 then 
				DataPack.writeByte(netPack,1)
			else 
				DataPack.writeByte(netPack,0)
			end
		end
		
		--远古押镖
		--for i=1,#activity_DaJiDaLi.enterCross.enterYuanGuYaBiao do	
			if var.days.dajidaliCross[3][1]~=nil and  var.days.dajidaliCross[3][1]==1 then 
				DataPack.writeByte(netPack,1)
			else 
				DataPack.writeByte(netPack,0)
			end
		--end
		
		DataPack.flush(netPack)
		
	elseif index==9 then 
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack, 9) 
		
		if var.newdays==nil then 
			var.newdays={}
		end
	
		local cfg =activity_DaJiDaLi.xunbaoGiveAward.Info
		if var.newdays.XunBaoTime==nil then 
			DataPack.writeUInt(netPack, 0)
		else 
			DataPack.writeUInt(netPack, var.newdays.XunBaoTime)
		end
		
		
		if var.days.dajidaliXunBao==nil then 
			for i=1,#cfg do 	--没有一次寻宝
				DataPack.writeByte(netPack, 0)
			end
			DataPack.flush(netPack)
			return 
		end
		
		for i=1,#cfg do 
			if var.days.dajidaliXunBao[i]~=nil and var.days.dajidaliXunBao[i]==1 then 
				DataPack.writeByte(netPack, 1)
			else 
				DataPack.writeByte(netPack, 0)
			end
		end
		DataPack.flush(netPack)
	elseif index==10 then 
		local cfg =activity_DaJiDaLi.chuangdituGiveAward.Info
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack, 10) 
		if var.days.djdl_ChuangCount==nil then
			for i=1,#cfg do 
				DataPack.writeUInt(netPack, 0)
			end
		else 
			for i=1,#cfg do 
				if var.days.djdl_ChuangCount[i]~=nil  then 
					DataPack.writeUInt(netPack, var.days.djdl_ChuangCount[i])
					--print("var.days.djdl_ChuangCount[i]="..var.days.djdl_ChuangCount[i])
				else 
					DataPack.writeUInt(netPack, 0)
					--print("0000000000")
				end
			end
		end
		
		if var.days.djdl_ChuangFlag==nil then 
			for i=1,#cfg do 
				DataPack.writeByte(netPack, 0)
			end
		else 
			for i=1,#cfg do 
				if var.days.djdl_ChuangFlag[i]~=nil and var.days.djdl_ChuangFlag[i]==1 then 
					DataPack.writeByte(netPack, 1)
				else 
					DataPack.writeByte(netPack, 0)
				end
			end
		end
		DataPack.flush(netPack)
	elseif index==11 then 
		local cfg =activity_DaJiDaLi.killMonsterGiveAward.Info
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack, 11) 
		if var.days.djdl_killMonsters==nil then
			DataPack.writeUInt(netPack, 0)
			--print("0000000")
		else 
			DataPack.writeUInt(netPack, var.days.djdl_killMonsters)
			--print("var.days.djdl_killMonsters="..var.days.djdl_killMonsters)
		end
		
		if var.days.djdl_killMonsterFlag==nil then 
			for i=1,#cfg do 
				DataPack.writeByte(netPack, 0)
			end
		else 
			for i=1,#cfg do 
				if var.days.djdl_killMonsterFlag[i]~=nil and var.days.djdl_killMonsterFlag[i]==1 then 
					DataPack.writeByte(netPack, 1)
				else 
					DataPack.writeByte(netPack, 0)
				end
			end
		end
		DataPack.flush(netPack)
	elseif index==12 then 
		local cfg =activity_DaJiDaLi.payGiveAwardNew
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sDaJiDaLi_Acts)
		DataPack.writeByte(netPack, 12) 
		for i=1,#cfg.needMoney do  --两档，各累计了多少次
			if var.DJDL_Data.chongzhiDataNew==nil or var.DJDL_Data.chongzhiDataNew[i]==nil  then 
				DataPack.writeByte(netPack, 0) 
				--print("var.DJDL_Data.chongzhiDataNew[i]=0")
			else
				DataPack.writeByte(netPack, var.DJDL_Data.chongzhiDataNew[i]) 
				--print("var.DJDL_Data.chongzhiDataNew[i]="..var.DJDL_Data.chongzhiDataNew[i])
			end
		end
		
		for i=1,#cfg.needMoney do  --两档，各累计了多少次
			for j=1,#cfg.Info[i] do 
				if var.DJDL_Data.chongzhiflagNew==nil or var.DJDL_Data.chongzhiflagNew[i]==nil or var.DJDL_Data.chongzhiflagNew[i][j]==nil  then 
					DataPack.writeByte(netPack, 0) 
					--print("var.DJDL_Data.chongzhiflagNew[i][j]=0")
				else
					DataPack.writeByte(netPack, var.DJDL_Data.chongzhiflagNew[i][j]) 
					--print("var.DJDL_Data.chongzhiflagNew[i][j]="..var.DJDL_Data.chongzhiflagNew[i][j])
				end
			end
		end
		DataPack.flush(netPack)
	end
end



-- 旧存档可能在正式开服前启动了活动；按开服日修正活动日期和天数。
function RepairDaJiDaLiOpenDate()
	local svar = System.getStaticVar()
	local now = System.getCurrMiniTime()
	local openTime = System.getServerOpenTime()
	if now < openTime then
		if svar.isDringDaJiDaLi ~= nil then EndDaJiDaLi() end
		return false
	end
	if svar.isDringDaJiDaLi == nil or svar.isDringDaJiDaLi < 1 or svar.isDringDaJiDaLi > 3 then
		return true
	end

	local oy, om, od = System.GetSystemTimeInMiniTime(openTime)
	local openDate = System.encodeNumTime(oy, om, od, 0, 0, 0)
	local sy, sm, sd = svar.StartDaJiDaLiYear, svar.SpringDaJiDaLiMonth, svar.StartDaJiDaLiDay
	local startDate = svar.DaJiDaLiCycleStart
	if startDate == nil and sy ~= nil and sm ~= nil and sd ~= nil then
		startDate = System.encodeNumTime(sy, sm, sd, 0, 0, 0)
	end
	local y, m, d = System.GetSystemTimeInMiniTime(now)
	local today = System.encodeNumTime(y, m, d, 0, 0, 0)
	if startDate ~= nil and startDate > today then
		startDate = today - (svar.isDringDaJiDaLi - 1) * 86400
	end
	local rebased = startDate == nil or startDate < openDate
	if rebased then
		startDate = openDate
	end
	if svar.DaJiDaLiCycleStart ~= startDate then
		svar.DaJiDaLiCycleStart = startDate
		System.saveStaticVar()
	end

	local expectedDay = math.floor((today - startDate) / 86400) + 1
	if expectedDay < 1 or expectedDay > 3 then
		EndDaJiDaLi()
	elseif rebased or expectedDay ~= svar.isDringDaJiDaLi then
		-- 只校正活动日期和天数，保留已产生的玩家领取记录。
		svar.isDringDaJiDaLi = expectedDay
		System.saveStaticVar()
		local playerList = LuaHelp.getAllActorList()
		for _, player in ipairs(playerList or {}) do
			local netPack = DataPack.allocPacket(player, 151, LogicCmd.miscSysEx.sub.sDaJiDaLi_isOpen)
			DataPack.writeByte(netPack, expectedDay)
			DataPack.flush(netPack)
		end
	end
	return true
end

--开始大吉大利活动
StartDaJiDaLi = function(nowOpenday, cycleStart)
    -- 原活动已关闭，消费豪礼由周年庆典提供。
end

--结束春季活动
EndDaJiDaLi = function()
	--print("22222")
	local svar = System.getStaticVar()
	svar.isDringDaJiDaLi = nil
	System.saveStaticVar()
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		--是否开启庆典活动
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sDaJiDaLi_isOpen)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
	end
end

-- 兼容旧查询，清除原活动开启状态。
function EnsureDaJiDaLiActivity()
    if System.getStaticVar().isDringDaJiDaLi ~= nil then EndDaJiDaLi() end
    return false
end
	
--是否是春节活动中
handleDaJiDaLiIsOpen = function (sysarg, sysid, packet)
	EnsureDaJiDaLiActivity()
	local svar = System.getStaticVar()

	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sDaJiDaLi_isOpen)
	if svar.isDringDaJiDaLi==nil then 
		DataPack.writeByte(netPack,0)
		--print("0000000")
	else 
		DataPack.writeByte(netPack,svar.isDringDaJiDaLi)
		--print("svar.isDringDaJiDaLi:"..svar.isDringDaJiDaLi)
	end
	DataPack.flush(netPack)
end





--后台命令开启
function backcmd_DaJiDaLiActs(args)

	local Type = tonumber(args[1])
	if Type==1 then 
		local Year = tonumber(args[2])
		local Month = tonumber(args[3])
		local Day = tonumber(args[4])
		--local openDay = tonumber(args[5])
		local openDay = 3

		if Year~=nil and Month~=nil and Day~=nil and openDay~=nil then
			local refreshTime = System.encodeNumTime(Year,Month,Day,0,0,0) --写当天的更新日期
			local oy, om, od = System.GetSystemTimeInMiniTime(System.getServerOpenTime())
			if refreshTime < System.encodeNumTime(oy,om,od,0,0,0) then return end
			
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
					svar.StartDaJiDaLiYear = Year 
					svar.SpringDaJiDaLiMonth = Month
					svar.StartDaJiDaLiDay = Day
				
					--print("eeeeeee")
					StartDaJiDaLi(nowDay)   --今天就是
				end
			else		--还没到（未来会到） （在跨天的时候检测一下）
				local svar = System.getStaticVar()
				svar.StartDaJiDaLiYear = Year 
				svar.SpringDaJiDaLiMonth = Month
				svar.StartDaJiDaLiDay = Day
				--print("llllllllll")
			end
		end
		
		
	elseif Type==0 then --关闭
		EndDaJiDaLi()
	end
end

-- 后台命令(节日活动): DaJiDaLiActs|1|2018|4|18|开启天数
RegisterBackCmd("DaJiDaLiActs", backcmd_DaJiDaLiActs)
