--#include "data\config\OneYearActivity.lua" once

--周年活动

-- 合并玩法共用周年周期，独立保存进度，旧活动数据不再参与领奖。
LocalDT.IsAnniversaryActivityOpen = function()
    local svar = System.getStaticVar()
    return svar.StartOneYear_OpenDay ~= nil and svar.isDringOneYearAct ~= nil and
        svar.isDringOneYearAct >= 1 and svar.isDringOneYearAct <= svar.StartOneYear_OpenDay
end

LocalDT.ClearAnniversaryMergedData = function(sysarg)
    ClearOneYear_Data(sysarg)
    local var = Actor.getStaticVar(sysarg)
    if var.OneYearAct_Data == nil then var.OneYearAct_Data = {} end
    if var.OneYearAct_Data.material == nil then var.OneYearAct_Data.material = {} end
    if var.OneYearAct_Data.consumeGift == nil then var.OneYearAct_Data.consumeGift = {} end
    if var.OneYearAct_Data.recharge == nil then var.OneYearAct_Data.recharge = {} end
    if var.days == nil then var.days = {} end
    if var.days.AnniversaryMergedCycle ~= System.getStaticVar().StartOneYear_Minitime then
        var.days.AnniversaryMergedCycle = System.getStaticVar().StartOneYear_Minitime
        var.days.AnniversaryPayTime = {}
    end
end

--信息派发
handleOneYearAct = function (sysarg, sysid, packet)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.StartOneYear_OpenDay==nil then 
		return 
	end
	if svar.isDringOneYearAct ==nil or svar.isDringOneYearAct<1 or svar.isDringOneYearAct>svar.StartOneYear_OpenDay then 
		return 
	end
	
	local msgid = DataPack.readByte(packet)
	if msgid == 1 or msgid == 3 or msgid == 4 or msgid == 9 then return end
	if msgid == 0 then	--获取数据
		GetOneYearActInfo(sysarg,DataPack.readByte(packet))
	elseif msgid == 1 then --全服双倍
	elseif msgid ==2 then --累计登录奖励
		GetOneYearLoginGift(sysarg,DataPack.readByte(packet))
	elseif msgid ==3 then --每日首次
		GetOneYearEveryDayFirstPay(sysarg)
	elseif msgid ==4 then --每日累计充值
		GetOneYearEveryDayTotalPay(sysarg,DataPack.readByte(packet))
	elseif msgid ==5 then --每日充值排行（查询沿用散人红利协议6）
	elseif msgid ==6 then --写配置就好
	elseif msgid ==7 then --买水晶
		BuyOneYearShuiJing(sysarg) 
	elseif msgid ==8 then --购买其他东西
		BuyOneYearSomething(sysarg,DataPack.readByte(packet)) 
	elseif msgid ==9 then --限时抢购
		GetOneYearXianShiQiangGou(sysarg,DataPack.readByte(packet))
	elseif msgid ==10 then --鸿运当头
		if OneYearActivityCfg.HongYunDangTou.isOpen == false then return end
		local optType = DataPack.readByte(packet) --操作类型
		if optType==1 then --购买特惠
			BuyOneYearHongYunDangTouTeHui(sysarg)
		elseif optType==2 then --请求个人数数据
			SendOneYearHongYunDangTouUserData(sysarg)
		end
	elseif msgid ==11 then --消费转盘
		GetOneYearXiaoFeiZhuanPan(sysarg)
	elseif msgid ==12 then  --集字
		GetOneYearJiZiGift(sysarg,DataPack.readByte(packet))
	end
end

--2登录奖励
function GetOneYearLoginGift(sysarg,index)
	
	
	local svar = System.getStaticVar()
	if svar.isDringOneYearAct ==nil or svar.isDringOneYearAct<index then 
		return 
	end
	
	
	local level= Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if level<80 then 
		Actor.sendTipmsg(sysarg,"不够80级",ttFlyTip)
		return 
	end
	
	ClearOneYear_Data(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	if var.OneYearAct_Data.login ==nil then 
		var.OneYearAct_Data.login = 1
	end
	
	if var.OneYearAct_Data.loginflag ==nil then
		var.OneYearAct_Data.loginflag={}
	end
	
	
	--没有配置
	local cfg = OneYearActivityCfg.LoginAward[index]
	if not cfg then 
		print("The oneyear Login Award Config is nil ,Read file error")
		return  
	end
	
	if var.OneYearAct_Data.login<index then 
		Actor.sendTipmsg(sysarg,"还没达到领取条件",ttFlyTip)
		return 
	end
	
	if var.OneYearAct_Data.loginflag[index]~=nil and var.OneYearAct_Data.loginflag[index]==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	
	local award = cfg.award
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	var.OneYearAct_Data.loginflag[index] = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.oneyearactivity,cfg.name)
	if bResult == false then
		print("oneyear Login Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetOneYearActInfo(sysarg,2)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.oneyearactivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)

	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了周年庆典登录奖励,超级丰盛<我也要领取/@@showWin,254,1>",Actor.getName(sysarg)), ttChatWindow)
end


--3每日首充
function GetOneYearEveryDayFirstPay(sysarg)

	local var = Actor.getStaticVar(sysarg)
	--充值不够
	local nPeyCount = var.days.PeyNum
	if nPeyCount==nil or nPeyCount<1000 then 
		Actor.sendTipmsg(sysarg,"不满足领取条件",ttFlyTip)
		return 
	end
	
	if var.days.OY_FirstPayFlag ~=nil and var.days.OY_FirstPayFlag==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	local cfg = OneYearActivityCfg.EveryDayPay
	local award = cfg.award
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	var.days.OY_FirstPayFlag = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.oneyearactivity,cfg.name)
	if bResult == false then
		print("oneyear first pay error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetOneYearActInfo(sysarg,3)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.oneyearactivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了周年庆典首充奖励,超级丰盛<我也要领取/@@showWin,254,2>",Actor.getName(sysarg)), ttChatWindow)
end


--4每日累计充值
function GetOneYearEveryDayTotalPay(sysarg,index)
	
	local cfg = OneYearActivityCfg.EveryDayTotalPay
	if index<1 or index>#cfg then 
		return 
	end
	
	local needPay = cfg[index].needPay
	
	local var = Actor.getStaticVar(sysarg)
	--充值不够
	local nPeyCount = var.days.PeyNum
	if nPeyCount==nil or nPeyCount< needPay then 
		Actor.sendTipmsg(sysarg,"不满足领取条件",ttFlyTip)
		return 	
	end
	
	if var.days.OY_TotalPayFlag==nil then 
		var.days.OY_TotalPayFlag={}
	end
	
	if var.days.OY_TotalPayFlag[index] ~=nil and var.days.OY_TotalPayFlag[index]==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	local award = cfg[index].award
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	var.days.OY_TotalPayFlag[index] = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.oneyearactivity,cfg.name)
	if bResult == false then
		print("oneyear total pay error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetOneYearActInfo(sysarg,4)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.oneyearactivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了周年庆典累计充值奖励,超级丰盛<我也要领取/@@showWin,254,3>",Actor.getName(sysarg)), ttChatWindow)
	

end

--7买水晶
function BuyOneYearShuiJing(sysarg)

	local svar = System.getStaticVar()
	if svar.isDringOneYearAct ==nil then 
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	
	if var.days.OY_BuyShuiJingFlag ~=nil and var.days.OY_BuyShuiJingFlag==1 then  --每日每天只能购买一次
		Actor.sendTipmsg(sysarg,"不能重复购买",ttFlyTip)
		return 
	end
	
	local cfg = OneYearActivityCfg.BuyShuiJing[svar.isDringOneYearAct]
	if cfg == nil then return end
	
	local award = cfg.award
	
	local myYb = Actor.getIntProperty( sysarg, PROP_ACTOR_YUANBAO)
	if myYb < cfg.needYB then
		Actor.sendTipmsg(sysarg, "元宝不足", ttFlyTip)
		return
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end	
	
	var.days.OY_BuyShuiJingFlag = 1
	
	if Actor.changeMoney(sysarg, mtYuanbao, -cfg.needYB, LogIds.oneyearactivity, "购买水晶")==false then 
		Actor.sendTipmsg(sysarg,"扣除元宝失败",ttFlyTip)
		return
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.oneyearactivity,cfg.name)
	if bResult == false then
		print("oneyear buy shuijing  error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetOneYearActInfo(sysarg,7)
		
	Actor.sendTipmsg(sysarg,"购买成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.oneyearactivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家购买了周年庆%s<我也要购买/@@showWin,254,6>",Actor.getName(sysarg),cfg.name), ttChatWindow)
end

--8购买其他东西
function BuyOneYearSomething(sysarg,index)
	
	local cfg = OneYearActivityCfg.BuySomething
	if index<1 or index>#cfg then 
		return 
	end
	
	ClearOneYear_Data(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	if var.OneYearAct_Data.buyST ==nil then 
		var.OneYearAct_Data.buyST = {}
	end
	
	if var.OneYearAct_Data.buyST[index] ~=nil and var.OneYearAct_Data.buyST[index]==1 then  --每日每天只能购买一次
		Actor.sendTipmsg(sysarg,"不能重复购买",ttFlyTip)
		return 
	end

	cfg =cfg[index]
	local award = cfg.award	
	local needYB = cfg.needYB
	
	
	local myYb = Actor.getIntProperty( sysarg, PROP_ACTOR_YUANBAO)
	if myYb < needYB then
		Actor.sendTipmsg(sysarg, "元宝不足", ttFlyTip)
		return
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	var.OneYearAct_Data.buyST[index] = 1
	
	if Actor.changeMoney(sysarg, mtYuanbao, -cfg.needYB, LogIds.oneyearactivity, "周年庆购买")==false  then 
		Actor.sendTipmsg(sysarg,"扣除元宝失败",ttFlyTip)
		return
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.oneyearactivity,cfg.name)
	if bResult == false then
		print("oneyear buy something  error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetOneYearActInfo(sysarg,8)
		
	Actor.sendTipmsg(sysarg,"购买成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.oneyearactivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家购买了周年庆典%s<我也要购买/@@showWin,254,7>",Actor.getName(sysarg),cfg.name), ttChatWindow)
	
	
end


--9限时抢购
function GetOneYearXianShiQiangGou(sysarg,index)
	-- 周年庆典限时抢购已下架，保留旧调用接口。
end
--10鸿运当头-----------------------
--购买鸿运当头特惠
BuyOneYearHongYunDangTouTeHui= function(sysarg)
	if OneYearActivityCfg.HongYunDangTou.isOpen == false then return end
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.isDringOneYearAct ==nil then 
		return 
	end
	
	--只个配置只有6天
	if svar.isDringOneYearAct>6 then 
		return 
	end
	
	--如果数据还没有初始化，那就初始化数据
	if svar.OneYear_HYDT_data.days==nil then 
		ClearOneYearHongYunDangTouSystemData()
	end
	
	
	local cfg  = OneYearActivityCfg.HongYunDangTou[svar.isDringOneYearAct]
	if cfg == nil then return end	
	
	--检查总数量是否已经卖完了
	if svar.OneYear_HYDT_data.TeHuiTotal[svar.isDringOneYearAct] ==nil then 
		svar.OneYear_HYDT_data.TeHuiTotal[svar.isDringOneYearAct] =0
	end
	if svar.OneYear_HYDT_data.TeHuiTotal[svar.isDringOneYearAct]>=100 then 
		Actor.sendTipmsg(sysarg,"今日特惠的剩余数量为0",ttFlyTip)
		return 
	end

	--检查金钱是否足够
	if Actor.getMoneyCount(sysarg,3) <cfg.TeHui.needMoney then
		Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
		return 
	 end
	 
	--检查背包空间是否满足
	if not Awards.CheckBagGridCount(sysarg,cfg.TeHui.award) then
		return 
	end
	
	--扣金钱
	Actor.changeMoney( sysarg, 3, -cfg.TeHui.needMoney, LogIds.oneyearactivity, cfg.TeHui.award[1].txt)
	--给奖励
	Awards.Give(sysarg,cfg.TeHui.award,LogIds.oneyearactivity,cfg.TeHui.award[1].txt)
	--扣除特惠的总次数
	svar.OneYear_HYDT_data.TeHuiTotal[svar.isDringOneYearAct] = svar.OneYear_HYDT_data.TeHuiTotal[svar.isDringOneYearAct]+1 
	
	
	------------------------------------虚线以内，是要在21点前才会有用21点后点击就没有用了-----------------------------------------------------
	local hour,mins,secs = System.getTime()
	
	---改了时间，几点开奖，必须改这里
	if hour<21 then 
		--随机数字
		local s=#svar.OneYear_HYDT_data.leftTable[svar.isDringOneYearAct]
		if s==0 then 
			Actor.sendTipmsg(sysarg,"参数错误",ttFlyTip)
			System.trace("hongyundangtou,has error")
			return 
		end
		local randNumber = System.getRandomNumber(s)+1 --产生1~s的 在未抽中的表中随机抽中一个
		local thisNumber = svar.OneYear_HYDT_data.leftTable[svar.isDringOneYearAct][randNumber] --拿出这个号码
		
		--把这个幸运数字抽出来
		--不能直接remove svar.OneYear_HYDT_data.leftTable,所以找个中间表
		local tempTable ={}
		for i=1,s do 
			tempTable[i] = svar.OneYear_HYDT_data.leftTable[svar.isDringOneYearAct][i]
		end
		
		table.remove(tempTable,randNumber) --在未抽的表中删除这个号码
		
		svar.OneYear_HYDT_data.leftTable[svar.isDringOneYearAct] ={}
		for i=1,s-1 do 
			svar.OneYear_HYDT_data.leftTable[svar.isDringOneYearAct][i] = tempTable[i]
		end
		
		--记录自己得到的数字
		local var = Actor.getStaticVar(sysarg)
		if var.newdays==nil then 
			var.newdays={}
		end
	
		if var.newdays.HYDT_LuckNumber ==nil then var.newdays.HYDT_LuckNumber = {} end
		var.newdays.HYDT_LuckNumber[#var.newdays.HYDT_LuckNumber+1] = thisNumber
		
		--系统要记录这个数字的主人的姓名和id
		svar.OneYear_HYDT_data.NumberData[thisNumber] ={}
		svar.OneYear_HYDT_data.NumberData[thisNumber].name = Actor.getName(sysarg)
		svar.OneYear_HYDT_data.NumberData[thisNumber].userID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		svar.OneYear_HYDT_data.NumberData[thisNumber].sex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
		
		System.broadcastTipmsg(string.format("<(n%s)>玩家购买了鸿运当头今日特惠,获得一个幸运数字,祝福他拿大奖吧,<我也要购买/@@showWin,254,9>",Actor.getName(sysarg)),ttChatWindow)
	end
	----------------------------------------------------------------------------------------------
	--给前端发协议
	SendOneYearHongYunDangTouUserData(sysarg)
end

--发送鸿运当头的常变的个人数据
SendOneYearHongYunDangTouUserData=function(sysarg)
	if OneYearActivityCfg.HongYunDangTou.isOpen == false then return end
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.isDringOneYearAct ==nil then 
		return 
	end
	--只个配置只有3天
	if svar.isDringOneYearAct>6 then 
		return 
	end
	
	--如果数据还没有初始化，那就初始化数据
	if svar.OneYear_HYDT_data.days==nil then 
		ClearOneYearHongYunDangTouSystemData()
	end
	
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_Acts)
	DataPack.writeByte(netPack,10)
	DataPack.writeByte(netPack,1)
	
	--发送剩余的特惠数量
	local totalNumber = svar.OneYear_HYDT_data.TeHuiTotal[svar.isDringOneYearAct]
	if totalNumber ==nil then 
		DataPack.writeByte(netPack,100)
	else 
		DataPack.writeByte(netPack,100-totalNumber)
	end
	--发送我所拥有的幸运号码
	local var = Actor.getStaticVar(sysarg)
	if var.newdays==nil then 
		var.newdays={}
	end
	if var.newdays.HYDT_LuckNumber ==nil then var.newdays.HYDT_LuckNumber = {} end
	local myTable = var.newdays.HYDT_LuckNumber
	DataPack.writeByte(netPack,#myTable)
	if #myTable~=0 then
		for i=1,#myTable do 
			DataPack.writeByte(netPack,myTable[i])
		end
	end
	DataPack.flush(netPack)
end

--鸿运当头开奖
OneYearHongYunDangTou_Run =function()
	if OneYearActivityCfg.HongYunDangTou.isOpen == false then return end
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringOneYearAct ==nil then 
		return 
	end
	
	--只个配置只有3天
	if svar.isDringOneYearAct>6 then 
		return 
	end
	
	--如果数据还没有初始化，那就初始化数据
	if svar.OneYear_HYDT_data.days==nil then 
		ClearOneYearHongYunDangTouSystemData()
	end
	
	local randNumber = System.getRandomNumber(100)+1 --产生1~s的
	local svar = System.getStaticVar()
	
	
	local cfg  = OneYearActivityCfg.HongYunDangTou[svar.isDringOneYearAct]
	if cfg == nil then return end
	
	--保存幸运号码
	svar.OneYear_HYDT_data.days[svar.isDringOneYearAct].luckNumber = randNumber
	
	local  luckUser= svar.OneYear_HYDT_data.NumberData[randNumber]
	if luckUser ~=nil then 
		svar.OneYear_HYDT_data.days[svar.isDringOneYearAct].luckUser = luckUser.name 
		--广播，发邮件
		--luckUser.userID 
		local nSex = luckUser.sex
		for i=1,#cfg.HongYun_Award do
			--如果是用-1就都给，否则分性别改
			if cfg.HongYun_Award[i].sex == nSex or cfg.HongYun_Award[i].sex==-1 then 
				local strAward = cfg.HongYun_Award[i].id..","..cfg.HongYun_Award[i].count..","..cfg.HongYun_Award[i].bind
				System.AddMail(luckUser.userID,6,0,"鸿运当头大奖","尊敬的玩家您好,\\\\恭喜您在今日的鸿运当头中荣获大奖"..cfg.HongYun_Award[i].txt..",现奖励在邮件附件中,请及时领取!\\\\祝您游戏愉快!",0,0,strAward)
				System.broadcastTipmsg("鸿运当头今日幸运数字为：<(c0xFF00FF00)"..randNumber..string.format(">,恭喜<(n%s)>",luckUser.name).."获得今天的鸿运大奖",ttChatWindow)
			end 
		end
		System.trace("hongyundangtou,randNumber="..randNumber..",userID="..luckUser.userID)
	else 
		--广播
		 System.broadcastTipmsg("鸿运当头今日幸运数字为：<(c0xFF00FF00)"..randNumber..">,很遗憾,鸿运大奖将无人获得",ttChatWindow)
		 System.trace("hongyundangtou,randNumber="..randNumber..",userID=wu")
	end
	
	--要把今天的什么人拿了什么数据清空
	svar.OneYear_HYDT_data.NumberData={}
	
	--给前端发消息
	GetOneYearActInfo(sysarg,10)
end

--把鸿运当头的系统数据给清除了
ClearOneYearHongYunDangTouSystemData =function()
	if OneYearActivityCfg.HongYunDangTou.isOpen == false then return end
	local svar = System.getStaticVar()
	svar.OneYear_HYDT_data = {}
	
	--清空全部的幸运号码和幸运儿
	svar.OneYear_HYDT_data.days = {}
	svar.OneYear_HYDT_data.days[1] = {}
	svar.OneYear_HYDT_data.days[2] = {}
	svar.OneYear_HYDT_data.days[3] = {}
	svar.OneYear_HYDT_data.days[4] = {}
	svar.OneYear_HYDT_data.days[5] = {}
	svar.OneYear_HYDT_data.days[6] = {}
	
	for i=1,6 do
		svar.OneYear_HYDT_data.days[i].luckNumber = 0
		svar.OneYear_HYDT_data.days[i].luckUser = "无"
	end
	
	--初始化一下剩余未抽中的号码
	svar.OneYear_HYDT_data.leftTable ={}
	svar.OneYear_HYDT_data.leftTable[1]={}
	svar.OneYear_HYDT_data.leftTable[2]={}
	svar.OneYear_HYDT_data.leftTable[3]={}
	svar.OneYear_HYDT_data.leftTable[4]={}
	svar.OneYear_HYDT_data.leftTable[5]={}
	svar.OneYear_HYDT_data.leftTable[6]={}
	for j=1,6 do
		for i=1,100 do 
			svar.OneYear_HYDT_data.leftTable[j][i]=i
		end
	end
	

	--清空特惠总数控制表
	svar.OneYear_HYDT_data.TeHuiTotal ={}
	
	--把什么人拿了什么数字给清空的了
	svar.OneYear_HYDT_data.NumberData={}
end



---------------鸿运当头-----------------------










--11消费转盘
function GetOneYearXiaoFeiZhuanPan(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	local svar = System.getStaticVar()
	if OneYearActivityCfg.XiaoFeiZhuanPan[1]==nil then 
		Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
		return
	end
	
	--初始化
	ClearOneYear_Data(sysarg)
	if var.OneYearAct_Data.XFZP ==nil then
		var.OneYearAct_Data.XFZP=1
	end
	
	
	local cfg = OneYearActivityCfg.XiaoFeiZhuanPan[1]
	
	if var.OneYearAct_Data.XFZP>#cfg then
		Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
		return
	end
	
	cfg = cfg[var.OneYearAct_Data.XFZP]
	
	-- 门槛按本轮活动总天数缩放，向上取整，末档恰为天数×300万元宝。
	local needSpend = math.ceil(cfg.needPay * (svar.StartOneYear_OpenDay or 7) / 7)
	
	if var.OneYearAct_Data.XFZPCosume==nil or needSpend>var.OneYearAct_Data.XFZPCosume then 
		Actor.sendTipmsg(sysarg,"消费不足",ttFlyTip)
		return 
	end
	
	
	
	if not Awards.CheckBagGridCount(sysarg, cfg.award) then
		--return
		Actor.sendTipmsg(sysarg,"奖品已经发到邮件",ttFlyTip)
		local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		System.AddMail(nActorId,6,0,"周年庆消费转盘奖品","周年庆消费转盘奖励",0,0,cfg.award[1].id..","..cfg.award[1].count..","..cfg.award[1].bind)
	else
		Awards.Give(sysarg,cfg.award,LogIds.oneyearactivity,"周年消费转盘")
	end
		
	
	--改记录买了是多少次
	var.OneYearAct_Data.XFZP = var.OneYearAct_Data.XFZP +1
	--记录下来
	--System.sendCommonLog(LogIds.oneyearactivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"","",cfg.award[1].txt)
	--给前端发协议
	GetOneYearActInfo(sysarg,11)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家通过消费转盘领取了%s,<我也要领取/@@showWin,254,10>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg.award[1].id)), ttChatWindow)

end

--12集字
function GetOneYearJiZiGift(sysarg,index)
	--判断index是否合法
	if index<1 or index>#OneYearActivityCfg.OneYearJiZi.needCollect then 
		return 
	end
	
	--判断今天是否兑换过
	local var = Actor.getStaticVar(sysarg)

	for i=1,#OneYearActivityCfg.OneYearJiZi.needCollect[index] do 
		local idindex = OneYearActivityCfg.OneYearJiZi.needCollect[index][i].id-5648
		if idindex<=0 or OneYearActivityCfg.OneYearJiZi.JiZiId[idindex]==nil then 
			Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
			return 
		end
		
		if Actor.getItemCount(sysarg,OneYearActivityCfg.OneYearJiZi.JiZiId[idindex])<=0 then  
			Actor.sendTipmsg(sysarg,"道具不足，无法兑换",ttFlyTip)
			return 
		end
	end
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, OneYearActivityCfg.OneYearJiZi.award[index]) then
		return 
	end
    
	--扣除物品
	for i=1,#OneYearActivityCfg.OneYearJiZi.needCollect[index] do 
		local idindex = OneYearActivityCfg.OneYearJiZi.needCollect[index][i].id -5648
		Actor.removeItem(sysarg,OneYearActivityCfg.OneYearJiZi.JiZiId[idindex],1)
	end
		
	local bResult = Awards.Give(sysarg, OneYearActivityCfg.OneYearJiZi.award[index], LogIds.oneyearactivity,"庆典集字")
	if bResult == false then
		print("oneyear Collect Zi Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	--var.days.qingdianjizhi[index]=1
	
	GetOneYearActInfo(sysarg,12)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>玩家集齐了[%s] ,兑换了%s大奖<我也要领取/@@showWin,254,11>",Actor.getName(sysarg),OneYearActivityCfg.OneYearJiZi.award[index][1].txt,OneYearActivityCfg.OneYearJiZi.award[index][1].name),ttChatWindow)
	System.sendCommonLog(LogIds.oneyearactivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,index.."庆典集字")
end

--得到所有的信息
GetOneYearActInfo = function(sysarg,index)
	if index == 1 or index == 3 or index == 4 or index == 9 then return end
	
	local var = Actor.getStaticVar(sysarg)
	local svar = System.getStaticVar()
	if index== 2 then --2登录礼包
		ClearOneYear_Data(sysarg)
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_Acts)
		DataPack.writeByte(netPack,2)
		if var.OneYearAct_Data.login ==nil then 
			var.OneYearAct_Data.login = 1
		end
        DataPack.writeByte(netPack,var.OneYearAct_Data.login)
		local cfg =OneYearActivityCfg.LoginAward
		for i=1,#cfg do 
			if var.OneYearAct_Data.loginflag==nil then 
				DataPack.writeByte(netPack,0)
			else 
				if var.OneYearAct_Data.loginflag[i]==nil then 
					DataPack.writeByte(netPack,0)
				else 
					DataPack.writeByte(netPack,1)
				end
			end
		end
        DataPack.flush(netPack)
	elseif index ==3 then --3每日首充	
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_Acts)
		DataPack.writeByte(netPack,3)
		if var.days.OY_FirstPayFlag ==nil or var.days.OY_FirstPayFlag==0 then 
			DataPack.writeByte(netPack,0)
		else 
			DataPack.writeByte(netPack,1)
		end
		DataPack.flush(netPack)
		
	elseif index==4 then --4累计充值
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_Acts)
		DataPack.writeByte(netPack,4)
		if var.days.OY_TotalPayFlag==nil then 
			var.days.OY_TotalPayFlag={}
		end
		
		local cfg = OneYearActivityCfg.EveryDayTotalPay
		for i=1,#cfg  do 
			if var.days.OY_TotalPayFlag[i] ==nil or var.days.OY_TotalPayFlag[i]==0 then 
				DataPack.writeByte(netPack,0)
			else 
				DataPack.writeByte(netPack,1)
			end
		end
		DataPack.flush(netPack)
	elseif index==7 then --7购买水晶
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_Acts)
		DataPack.writeByte(netPack,7)
		if var.days.OY_BuyShuiJingFlag ==nil or var.days.OY_BuyShuiJingFlag==0 then 
			DataPack.writeByte(netPack,0)
		else 
			DataPack.writeByte(netPack,1)
		end
		DataPack.flush(netPack)
		
	elseif index==8 then --8周年庆购买
		ClearOneYear_Data(sysarg)
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_Acts)
		DataPack.writeByte(netPack,8)
		
		local cfg = OneYearActivityCfg.EveryDayTotalPay
		if var.OneYearAct_Data.buyST==nil then 
			for i=1,#cfg  do 
				DataPack.writeByte(netPack,0)
			end
		else
			for i=1,#cfg  do 
				if var.OneYearAct_Data.buyST[i] ==nil or var.OneYearAct_Data.buyST[i]==0 then 
					DataPack.writeByte(netPack,0)
				else 
					DataPack.writeByte(netPack,1)
				end
			end
		end

		DataPack.flush(netPack)
	elseif index ==9 then --9限时抢购	
		--超出了天数，没有配置就不做处理
		if OneYearActivityCfg.XianShiQiangGou[svar.isDringOneYearAct]==nil then 
			return 
		end
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_Acts)
		DataPack.writeByte(netPack,9)
		if var.days.OneYearXSQG==nil then 
			var.days.OneYearXSQG={}
		end
				
		for i=1,#OneYearActivityCfg.XianShiQiangGou[svar.isDringOneYearAct] do 
			if var.days.OneYearXSQG[i]==nil then 
				DataPack.writeByte(netPack,0)	
			else 
				DataPack.writeByte(netPack,var.days.OneYearXSQG[i])	--把代码今天买了多少次发下去。。。
			end
		end
		DataPack.flush(netPack)
	elseif index ==10 then 
		if OneYearActivityCfg.HongYunDangTou.isOpen == false then return end
		--只个配置只有3天
		if svar.isDringOneYearAct>6 then 
			return 
		end
	
		--如果数据还没有初始化，那就初始化数据
		if svar.OneYear_HYDT_data==nil or svar.OneYear_HYDT_data.days==nil then 
			ClearOneYearHongYunDangTouSystemData()
		end
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_Acts)
		DataPack.writeByte(netPack,10)
		DataPack.writeByte(netPack,0)
		--把三期的信息全都发出来
		for i=1,6 do 
			DataPack.writeByte(netPack,svar.OneYear_HYDT_data.days[i].luckNumber)
			DataPack.writeString(netPack,svar.OneYear_HYDT_data.days[i].luckUser)
		end
		DataPack.flush(netPack)
		
	elseif index ==11 then 	
		ClearOneYear_Data(sysarg)

	
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_Acts)
		DataPack.writeByte(netPack,11)
		if var.OneYearAct_Data.XFZPCosume ==nil then
			DataPack.writeUInt(netPack,0)
		else	
			DataPack.writeUInt(netPack,var.OneYearAct_Data.XFZPCosume) --消费额度
		end
		
		if var.OneYearAct_Data.XFZP ==nil then
			DataPack.writeByte(netPack,0)
		else
			DataPack.writeByte(netPack,var.OneYearAct_Data.XFZP-1) --已经转到第几个
		end
		DataPack.flush(netPack)
	elseif index ==12 then 
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_Acts)
		DataPack.writeByte(netPack,12) --告诉前端兑换成功
		DataPack.flush(netPack)
	end
	
	
end



--开始周年活动
StartOneYearActivity = function(openday , nowOpenday) --开几天，当前是第几天
	
	local svar = System.getStaticVar()
	--已经在活动中
	if (svar.StartOneYear_OpenDay==nil or svar.isDringOneYearAct ==nil or svar.isDringOneYearAct<1 or svar.isDringOneYearAct>svar.StartOneYear_OpenDay)==false then 
		System.trace("please end the oneyear activity first")
		return 
	end


	if openday==nil or openday<1 then 
		openday =7
	end
	
	openday = tonumber(openday)
	
	svar.StartOneYear_OpenDay =openday
	
	if nowOpenday==nil or nowOpenday==0 then --默认当天是第1天
		svar.isDringOneYearAct = 1
	else 
		nowOpenday = tonumber(nowOpenday)
		if nowOpenday>7 then 
			return 
		end
		svar.isDringOneYearAct = nowOpenday
	end
	
	
	--计算一种开启了多少次周年活动，下一次开的时候，数据是要清空的
	if svar.StartOneYearActtime ==nil or svar.StartOneYearActtime==0 then 
		svar.StartOneYearActtime = 1
	else
		svar.StartOneYearActtime = 1 + svar.StartOneYearActtime
	end
	
	svar.StartOneYear_Minitime = System.getCurrMiniTime()
	
	ClearOneYearHongYunDangTouSystemData()
		
	System.saveStaticVar()
	
	--开启排行
	daily_pay_ranking_start(svar.isDringOneYearAct, svar.StartOneYear_OpenDay, 2)
	OnYbConsumeRanking_ActivityStart(1, svar.isDringOneYearAct, svar.StartOneYear_OpenDay)
	System.trace("one year activity start")
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		--是否开启庆典活动
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sOneYearAct_isOpen)
		DataPack.writeByte(netPack,svar.StartOneYear_OpenDay) --开启几天
		DataPack.writeByte(netPack,svar.isDringOneYearAct)	--当前第几天(0,~7)，0代表关闭
		DataPack.flush(netPack)
	end
end

--结束周年活动
EndOneYearActivity = function()
	daily_pay_ranking_end()
	OnYbConsumeRanking_ActivityEnd(1)
	--print("22222")
	local svar = System.getStaticVar()
	svar.isDringOneYearAct = nil
	svar.StartOneYear_OpenDay=nil
	
	--把鸿运的数据清空
	svar.OneYear_HYDT_data = {}
	
	System.saveStaticVar()
	
	
	--结束排行
	-- 当日充值排行已保留至零点结算。
	System.trace("one year activity end")
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		--是否开启庆典活动
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sOneYearAct_isOpen)
		DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
	end
end
	
--是否是周年活动中
handleOneYearActIsOpen = function (sysarg, sysid, packet)
	local svar = System.getStaticVar()

	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_isOpen)
	if svar.StartOneYear_OpenDay==nil then 
		DataPack.writeByte(netPack,0)
		--print("0000000")
	else 
		DataPack.writeByte(netPack,svar.StartOneYear_OpenDay)
		--print("svar.StartOneYear_OpenDay:"..svar.StartOneYear_OpenDay)
	end
	
	if svar.isDringOneYearAct==nil then 
		DataPack.writeByte(netPack,0)
		--print("0000000")
	else 
		DataPack.writeByte(netPack,svar.isDringOneYearAct)
		--print("svar.isDringOneYearAct:"..svar.isDringOneYearAct)
	end
	DataPack.flush(netPack)
end





--后台命令开启
function backcmd_OneYearActs(args)
	local Type = tonumber(args[1])
	if Type==1 then 
		local Year = tonumber(args[2])
		local Month = tonumber(args[3])
		local Day = tonumber(args[4])
		local openDay = tonumber(args[5])
		--local openDay = 3

		if Year~=nil and Month~=nil and Day~=nil and openDay~=nil then 
			local refreshTime = System.encodeNumTime(Year,Month,Day,0,0,0) --写当天的更新日期
			
			local y,m,d,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(System.getCurrMiniTime())	
			local nNowDt = System.encodeNumTime(y,m,d,0,0,0)
			
			local diffTime = nNowDt-refreshTime


			if diffTime>=0 then 
				local nowDay = (math.floor(diffTime/86400)+1)
				if nowDay>openDay then 			--已经过期
					System.trace("开启周年庆活动失败，时间已经过期")
					return 
				else	
					local svar = System.getStaticVar()
					svar.StartOneYear_Year = Year 
					svar.StartOneYear_Month = Month
					svar.StartOneYear_Day = Day
					svar.StartOneYear_OpenDay =openDay
				
					System.trace(string.format("开启周年庆活动成功，开始时间为现在, 开启%d天，当前是第%d天",openDay,nowDay))
					StartOneYearActivity(openDay,nowDay)   --今天就是
				end
			else		--还没到（未来会到） （在跨天的时候检测一下）
				local svar = System.getStaticVar()
				svar.StartOneYear_Year = Year 
				svar.StartOneYear_Month = Month
				svar.StartOneYear_Day = Day
				svar.StartOneYear_OpenDay =openDay
				
				System.trace(string.format("开启周年庆活动成功，开始时间为[%d-%d-%d], 开启%d天",Year,Month,Day,openDay))
			end
		else
			System.trace("开启周年庆活动失败，传入的参数错误")
		end
		
		
	elseif Type==0 then --关闭
		EndOneYearActivity()
	end
end


-- 后台命令(周年活动): OneYearActs|1|2018|4|18|开启天数
RegisterBackCmd("OneYearActs", backcmd_OneYearActs)