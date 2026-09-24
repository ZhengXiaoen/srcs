-- 公测活动(改为月度庆典)，公测活动过后“绝版称号活动”和“投资活动(按等级)”依然有效
--#include "data\config\activity\PublicTestCfg.lua" once
--#include "data\functions\modules\YbConsumeRanking.lua" once
--#include "data\config\dmkj\CharItemActivity.lua" once -- for CharItemActivityCfg.time

S2C_PublicTestMsgId = {
	GetData = 1, --获取活动信息
	TitleOver = 2, --称号过期
	MyYbRankData = 3, -- 月度活动获取我的元宝消耗数据
	YbRankData = 4, -- 月度活动获取排行榜数据
}

-- var.ptest.flags
--0:是否购买了绝版称号
--1:是否购买了投资活动(按等级)
--2到8:投资活动(按等级)是否已领取
--9到15:投资活动(按天)是否已领取
--16到19:团购领取状态标志
--20到23:团购购买标志
--24:是否购买了投资活动(按等级)(公测活动过后)
--25:是否已经下发过协议：S2C_PublicTestMsgId.TitleOver
--26 是否领取了每日充值礼包
	
-- 是否在月度活动时间内
function IsMonthActivityTime()	
	if PublicTestCfg.isOpen == false then return false end	
	--if PublicTestCfg.time == nil then return true end
	
	if PublicTestCfg.gameIndex ~= 0 and System.GetGameIndex() ~= PublicTestCfg.gameIndex then
		return false -- 月度活动不是该平台
	end
	
	local time = PublicTestCfg.time
	return System.isInDateRange(time[1], time[2], time[3], 0, 0, 0, time[4], time[5], time[6], 23, 59, 59)
end

function GetActorPublicTestFlag(sysarg, flag)
	if flag < 0 or flag > 31 then
		print("----error! GetActorPublicTestFlag flag="..flag)
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.ptest == nil then return false end
	
	local flags = var.ptest.flags
	if flags == nil then return false end
		
	local f = System.getIntBit(flags, flag)
	if (f ~= 0) then return true 
	else return false end
end

function SetActorPublicTestFlag(sysarg, flag, true_or_false)
	if flag < 0 or flag > 31 then
		print("----error! SetActorPublicTestFlag flag="..flag)
		return
	end	
	
	local var = Actor.getStaticVar(sysarg)
	
	local flags = 0
	if var.ptest == nil then
		var.ptest = {}
	else
		flags = var.ptest.flags
		if flags == nil then flags = 0 end
	end
			
	flags = System.setIntBit(flags, flag, true_or_false)
	var.ptest.flags = flags
end

-- 返回-1则没有购买过
function GetPublicTestTitleValidTime(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.ptest == nil or var.ptest.buyTitle == nil then
		return -1 -- 没有购买过
	end
	
	local curTime = System.getCurrMiniTime()
	local endTime = var.ptest.buyTitle + PublicTestCfg.TitleCfg.validDay * 86400
	if curTime >= endTime then return 0 end
		
	return (endTime - curTime)
end

function _PublicTestBuyTitleGift(sysarg, packet)
	-- 公测活动过后一直有效
	--if not IsMonthActivityTime() then
	--	Actor.sendTipmsg(sysarg, "非公测活动期间不可购买。", ttFlyTip)
	--	return
	--end
	
	local cfg = PublicTestCfg.TitleCfg
	
	-- 前端说不能用这个作是否购买了的标志，所以另开字段吧	
	--if Actor.hasTopTitle(sysarg, cfg.titleId) then
	--if GetActorPublicTestFlag(sysarg, 0) then
	--	Actor.sendTipmsg(sysarg, "您已经购买了该称号，不能重复购买。", ttFlyTip)
	--	return
	--end
	
	local leftTime = GetPublicTestTitleValidTime(sysarg)
	if leftTime > 0 then
		Actor.sendTipmsg(sysarg, "购买失败，该称号还没过期", ttFlyTip)
		return
	end

	-- 检查
	local consumeData = {}
	local ret = CheckOneConsume(sysarg, false, cfg.consume, true, consumeData)
	if not ret then	return end

	if not Awards.CheckBagGridCount(sysarg, cfg.award) then
		return
	end

	--扣费
	ret = DeductOneConsume(sysarg, false, cfg.consume, GameLog.cPublicTestBuyTitle)
	if not ret then	return end
	
	SetActorPublicTestFlag(sysarg, 0, true)
	SetActorPublicTestFlag(sysarg, 25, false) -- 重置为没有下发过称号过期协议（前端要显示续费界面）
	
	local var = Actor.getStaticVar(sysarg)
	if var.ptest == nil then
		var.ptest = {}
	end
	var.ptest.buyTitle = System.getCurrMiniTime()	
	
	Actor.setTopTitle(sysarg,cfg.titleId,true)
	
	local leftTime = GetPublicTestTitleValidTime(sysarg)
	if leftTime > 0 then
		Actor.deleteTimer(sysarg,ActorTimerIds.PublicTestTitle)
		Actor.addTimer(sysarg,ActorTimerIds.PublicTestTitle,leftTime*1000)
	end
	
	if Awards.Give(sysarg, cfg.award, GameLog.cPublicTestBuyTitle, "") == false then
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("Awards.Give error, PublicTestBuyTitleGift actorid="..actorId)
		return
	end
	
	SendPublicTestData(sysarg)

	local actorName = Actor.getName(sysarg)
	local msg = string.format("<(c0xff00ff00)%s>购买了绝版称号 <(c0xffffff00)霸者天下>", actorName)
	System.broadcastTipmsg(msg, 2+128+2048)	
end

function PublicTestBuyTitleGift(sysarg, packet)
	_PublicTestBuyTitleGift(sysarg)
end

function SendPublicTestTitleOver(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sPublicTest)
	DataPack.writeByte(netPack, S2C_PublicTestMsgId.TitleOver) -- 称号过期
	
	DataPack.flush(netPack)
	
	SetActorPublicTestFlag(sysarg, 25, true) -- 窗口弹过了
end

function SendPublicTestData(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sPublicTest)
	DataPack.writeByte(netPack, S2C_PublicTestMsgId.GetData) -- 获取活动信息
	
	local var = Actor.getStaticVar(sysarg)
	local flags = 0
	--local buytime = 0
	local buyTitleTime = 0 -- 购买称号时间
	--local yb = 0 -- 公测期间充值的元宝数
	
	local ptest = var.ptest
	if ptest then
		flags = ptest.flags
		--buytime = ptest.buytime
		--yb = ptest.yb
		buyTitleTime = ptest.buyTitle		
	end	

	DataPack.writeUInt(netPack, flags and flags or 0)
	--DataPack.writeUInt(netPack, buytime and buytime or 0)
	--DataPack.writeUInt(netPack, yb and yb or 0)	
	DataPack.writeUInt(netPack, buyTitleTime and buyTitleTime or 0)
	--[[
	local svar = System.getStaticVar()
	local groupBuyCounts = svar.PTestGBCounts -- 团购人数表
	if groupBuyCounts then
		DataPack.writeUInt(netPack, groupBuyCounts[1])
		DataPack.writeUInt(netPack, groupBuyCounts[2])
		DataPack.writeUInt(netPack, groupBuyCounts[3])
		DataPack.writeUInt(netPack, groupBuyCounts[4])
	else
		DataPack.writeUInt(netPack, 0)
		DataPack.writeUInt(netPack, 0)
		DataPack.writeUInt(netPack, 0)
		DataPack.writeUInt(netPack, 0)
	end
	--]]
			
	DataPack.flush(netPack)
end

-- 获得公测试活动数据
function PublicTestGetData(sysarg, packet)	
	SendPublicTestData(sysarg)
end

function PublicTestInvestment(sysarg, packet)
	-- 公测活动过后一直有效
	--if not IsMonthActivityTime() then
	--	Actor.sendTipmsg(sysarg, "非公测活动期间不可进行投资。", ttFlyTip)
	--	return
	--end
		
	local time
	
	-- 0 为按天，1 为按等级
	local _type = 1 --DataPack.readByte(packet) -- 公测活动过后按等级
	
	--[[
	if _type == 0 then
		time = PublicTestCfg.InvestmentByDayCfg.buyTime
	elseif _type == 1 then
		time = PublicTestCfg.InvestmentByLevelCfg.buyTime
	else
		return
	end
	
	if not System.isInDateRange(time[1], time[2], time[3], 0, 0, 0, time[4], time[5], time[6], 23, 59, 59) then
		Actor.sendTipmsg(sysarg, "不在投资的有效时间段内，不能进行投资。", ttFlyTip)
		return
	end
	--]]
		
	local var = Actor.getStaticVar(sysarg)
	local isBuyed = false
	if _type == 0 then
		if var.ptest ~= nil and var.ptest.buytime ~= nil then
			isBuyed = true
		end
	else
		--if GetActorPublicTestFlag(sysarg, 1) then
		if GetActorPublicTestFlag(sysarg, 24) then --24:是否购买了投资活动(按等级)(公测活动过后)
			isBuyed = true
		end
	end
	
	if isBuyed then
		Actor.sendTipmsg(sysarg, "不能重复购买该投资。", ttFlyTip)
		return
	end
	
	local needYb = (_type == 0) and PublicTestCfg.InvestmentByDayCfg.investmentCount or PublicTestCfg.InvestmentByLevelCfg.investmentCount	
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)	
	if myYb < needYb then
		SendRecommendTips(sysarg, "1")
		return
	end
	
	local curTime = System.getCurrMiniTime()	
	if not Actor.changeMoney(sysarg, mtYuanbao, -needYb, (_type == 0) and GameLog.cPublicTestInvestmentDay or GameLog.cPublicTestInvestmentLevel, tostring(curTime)) then
		return
	end			
		
	if _type == 0 then
		if var.ptest == nil then
			var.ptest = {}
		end		
		var.ptest.buytime = curTime -- 记下购买时间
	else
		--SetActorPublicTestFlag(sysarg, 1, true)
		SetActorPublicTestFlag(sysarg, 24, true)
	end
	
	--2到8:投资活动(按等级)是否已领取
	--清除公测期间的领取标志
	for i=2, 8 do		
		SetActorPublicTestFlag(sysarg, i, false)
	end
	
	-- 下发结果
	SendPublicTestData(sysarg)
	
	-- 提示	
	local actorName = Actor.getName(sysarg)
	local str = string.format("<(c0xff00ff00)%s>投资了<(c0xff00ff00)%d>元宝", actorName, needYb)
	System.broadcastTipmsg(str, 2+128+2048)	
end

-- 投资返还
function PublicTestInvestmentReturn(sysarg, packet)
	-- 公测活动过后一直有效
	--if not IsMonthActivityTime() then
	--	Actor.sendTipmsg(sysarg, "非公测活动期间不可领取。", ttFlyTip)
	--	return
	--end
			
	-- 0 为按天，1 为按等级
	local _type = 1 --DataPack.readByte(packet) -- 公测活动过后按等级
	
	-- 领取哪一个（从 1 开始）
	local index = DataPack.readByte(packet)
	if index < 1 or index > 7 then
		return
	end
	
	--2到8:投资活动(按等级)是否已领取
	--9到15:投资活动(按天)是否已领取
	local bit = (_type == 0) and 9 or 2
	bit = bit + index - 1	
	if GetActorPublicTestFlag(sysarg, bit) then
		Actor.sendTipmsg(sysarg, "不能重复领取", ttFlyTip)
		return
	end
		
	local returnCfg
	if _type == 0 then
		returnCfg = PublicTestCfg.InvestmentByDayCfg.returnTable[index]
	else
		returnCfg = PublicTestCfg.InvestmentByLevelCfg.returnTable[index]
	end
	
	if returnCfg == nil then return end
	
	-- 检查是否有投资
	local var = Actor.getStaticVar(sysarg)
	if _type == 0 then
		if var.ptest == nil or var.ptest.buytime == nil then
			Actor.sendTipmsg(sysarg, "您还没有投资元宝，请先投资", ttFlyTip)
			return
		end
	else
		--if GetActorPublicTestFlag(sysarg, 1) == false then
		if GetActorPublicTestFlag(sysarg, 24) == false then
			Actor.sendTipmsg(sysarg, "您还没有投资元宝，请先投资", ttFlyTip)
			return
		end
	end
	
	if _type == 0 then
		local y,m,d,H,M,S = System.GetSystemTimeInMiniTime(var.ptest.buytime)
		local t = System.encodeNumTime(y,m,d,0,0,0)
		local curTime = System.getCurrMiniTime()
		t = curTime - t
		if t <= 0 then return end
		
		local day = math.floor(t / 86400) -- 相隔天数
		if (index - 1) > day then
			Actor.sendTipmsg(sysarg, "领取时间还没到", ttFlyTip)
			return
		end		
	else
		if not Actor.checkActorLevel(sysarg, returnCfg[2], returnCfg[1]) then
			Actor.sendTipmsg(sysarg, "领取条件还没达到", ttFlyTip)
			return
		end
	end
	
	local returnBindYB = (_type == 0) and returnCfg or returnCfg[3]	
	if not Actor.changeMoney(sysarg, mtBindYuanbao, returnBindYB, (_type == 0) and GameLog.cPublicTestInvestmentDayReturn or GameLog.cPublicTestInvestmentLevelReturn, tostring(index)) then
		return
	end
	
	SetActorPublicTestFlag(sysarg, bit, true)
	SendPublicTestData(sysarg)
	
	Actor.sendTipmsg(sysarg, "成功返还绑定元宝<(c0xff00ff00)"..returnBindYB..">", ttFlyTip)	
end

--[[
-- 领取团购奖励
function PublicTestGetGroupBuyAward(sysarg, packet)
	if not IsMonthActivityTime() then
		Actor.sendTipmsg(sysarg, "非公测活动期间不可领取。", ttFlyTip)
		return
	end
	
	-- 领取哪一个（1到4）
	local index = DataPack.readByte(packet)
	if index < 1 or index > 4 then
		return
	end
		
	--20到23:团购购买标志
	local bit = 20 + index - 1
	if not GetActorPublicTestFlag(sysarg, bit) then
		Actor.sendTipmsg(sysarg, "该团购您还没有购买，不能领取", ttFlyTip)
		return
	end
	
	local svar = System.getStaticVar()
	if svar.PTestGBCounts == nil then -- 团购人数表
		return
	end
	local buyCount = svar.PTestGBCounts[index]
	local cfg = PublicTestCfg.GroupBuyCfg[index]
	if buyCount < cfg.buyCount then
		Actor.sendTipmsg(sysarg, "团购人数还没满，现在还不能领取", ttFlyTip)
		return
	end
	
	--16到19:团购领取状态标志
	bit = 16 + index - 1
	if GetActorPublicTestFlag(sysarg, bit) then
		Actor.sendTipmsg(sysarg, "不能重复领取", ttFlyTip)
		return
	end
	
	if Awards.Give(sysarg, cfg.award, GameLog.cPublicTestGroupBuyAward, tostring(index)) == false then
		Actor.sendTipmsg(sysarg, "给奖励失败!", ttFlyTip)
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("Awards.Give fail, PublicTestGetGroupBuyAward actorid="..actorId..",index="..index)
		return
	end
	
	SetActorPublicTestFlag(sysarg, bit, true)
	SendPublicTestData(sysarg)
	
	Actor.sendTipmsg(sysarg, "成功领取团购奖励", ttFlyTip)
end
--]]

-- 购买烟花礼包
function PublicTest_buy_firework_item(sysarg, packet)
	-- 在活动其间每天都可以无限次购买
	
	if IsMonthActivityTime() == false then
		return
	end
	
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)	
	if myYb < PublicTestCfg.FireworkGift.buyNeedYb then
		SendRecommendTips(sysarg, "1")
		return
	end
	
	local firework_item = { {type=0, id=PublicTestCfg.FireworkGift.item_id, count=1, bind=1}, }
		
	if not Awards.CheckBagGridCount(sysarg, firework_item) then
		return
	end
	
	if Actor.changeMoney(sysarg, mtYuanbao, -PublicTestCfg.FireworkGift.buyNeedYb, LogIds.SpringFireworkConsume, "") == false then
		return
	end	
	
	if Awards.GiveNoCheck(sysarg, firework_item, LogIds.SpringBuyFirework, "") == false then
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("Awards.Give error, PublicTest_buy_firework_item actorid="..actorId)
		return
	end

	Actor.sendTipmsg(sysarg, "您成功购买了烟花礼包", ttFlyTip)
end

-- 领取每日充值礼包
function PublicTest_get_daily_pay_gift(sysarg, packet)
	local var = Actor.getStaticVar(sysarg)
	local payNum = var.days.PeyNum
	if not payNum or payNum < PublicTestCfg.PayGift.needMoney then
		Actor.sendTipmsg(sysarg, "您今天的充值还没到" .. PublicTestCfg.PayGift.needMoney .. "元宝", ttFlyTip)
		return -- 当天还没有充够钱
	end
	
	if GetActorPublicTestFlag(sysarg, 26) then
		Actor.sendTipmsg(sysarg, "您已经领取了该礼包", ttFlyTip)
		return
	end	
		
	if Awards.Give(sysarg,PublicTestCfg.PayGift.award,LogIds.SpringDayPayAward,"") == false then
		return
	end
	
	SetActorPublicTestFlag(sysarg, 26, true)
	Actor.sendTipmsg(sysarg, "您成功领取了月度活动每日充值礼包", ttFlyTip)
	SendPublicTestData(sysarg)
end

--在线跨天或跨天登陆
function OnPublicTestPlayerCrossDay(sysarg, var)
	if IsMonthActivityTime() then
		local time = PublicTestCfg.time
		local datetime = string.format("%d-%d-%d %d-%d-%d",time[1], time[2], time[3], time[4], time[5], time[6])
		AllActivityButtonState(sysarg,101,1,datetime) -- 显示 icon
	else
		AllActivityButtonState(sysarg,101,0) -- 隐藏 icon			
	end	
	
	if var.ptest ~= nil then
		local flags = var.ptest.flags
		if flags ~= nil then
			var.ptest.flags = System.setIntBit(flags, 26, false)	
		end
	end
end

function OnPublicTestPlayerLogin(sysarg, isCrossDay)

	if IsMonthActivityTime() then
		local time = PublicTestCfg.time
		local datetime = string.format("%d-%d-%d %d-%d-%d",time[1], time[2], time[3], time[4], time[5], time[6])
		AllActivityButtonState(sysarg,101,1,datetime) -- 显示 icon		
	end

	local leftTime = GetPublicTestTitleValidTime(sysarg)
	if leftTime > 0 then
		Actor.setTopTitle(sysarg, PublicTestCfg.TitleCfg.titleId, true)
		Actor.addTimer(sysarg,ActorTimerIds.PublicTestTitle,leftTime*1000)		
	elseif leftTime == 0 then
		if GetActorPublicTestFlag(sysarg, 25) == false then -- 没有下发过称号过期协议（前端要显示续费界面）
			SendPublicTestTitleOver(sysarg)
		end
	end
	
end

--[[
-- 公测充值
function OnPublicTestWithDrawYB(sysarg, yuanBao)
	if not IsMonthActivityTime() then
		return
	end

	local var = Actor.getStaticVar(sysarg)
	
	local yb = 0
	if var.ptest == nil then
		var.ptest = {}
	else
		yb = var.ptest.yb
		if yb == nil then yb = 0 end
	end			
	
	yb = yb + yuanBao
	var.ptest.yb = yb
	
	local isModified = false
	
	--20到23:团购购买标志
	local count = #PublicTestCfg.GroupBuyCfg
	if count > 4 then
		count = 4
		print("---------#PublicTestCfg.GroupBuyCfg > 4")
	end
	for i = 1, count do
		if yb >= PublicTestCfg.GroupBuyCfg[i].ybCount then
			if not GetActorPublicTestFlag(sysarg, 19 + i) then -- 如果没有加次数则加充值人数
				SetActorPublicTestFlag(sysarg, 19 + i, true)
				
				local svar = System.getStaticVar()
				if svar.PTestGBCounts == nil then -- 团购人数表
					--svar.PTestGBCounts = {0,0,0,0} -- System.getStaticVar() 的变量不支持这样写
					svar.PTestGBCounts = {}
					svar.PTestGBCounts[1] = 0
					svar.PTestGBCounts[2] = 0
					svar.PTestGBCounts[3] = 0
					svar.PTestGBCounts[4] = 0		
				end				
								
				svar.PTestGBCounts[i] = svar.PTestGBCounts[i] + 1
				
				isModified = true
			end
		else
			break
		end
	end
		
	if isModified then
		SendPublicTestData(sysarg)
	end
end
--]]

-- 修改月度活动时间时间 @gfunc _MonthATime 2015 11 11 2015 11 20
-- 聊天窗口有字符限制，改短点，_MonthATime = ChangePublicTestActivityTime
function _MonthATime(begin_year, begin_month, begin_day, end_year, end_month, end_day)
	local cfgtime = PublicTestCfg.time
	cfgtime[1] = begin_year
	cfgtime[2] = begin_month
	cfgtime[3] = begin_day
	
	cfgtime[4] = end_year
	cfgtime[5] = end_month
	cfgtime[6] = end_day
	
	-- 集字送元宝活动
	cfgtime = CharItemActivityCfg.time
	cfgtime[1] = begin_year
	cfgtime[2] = begin_month
	cfgtime[3] = begin_day
	
	cfgtime[4] = end_year
	cfgtime[5] = end_month
	cfgtime[6] = end_day
	
	-- 同一个活动，元宝消耗排行榜 也要重新检查下
	OnYbConsumeRankingNewDayArrive()
	
	local msg = string.format("月度活动时间已经改为：%d年%d月%d日 到 %d年%d月%d日", begin_year, begin_month, begin_day, end_year, end_month, end_day)
	--print(msg)
end

--公测活动消息
function OnMsgPublicTest(sysarg, sysid, packet)
	if sysid ~= LogicCmd.miscSys.sub.cPublicTest then
		print("error OnMsgPublicTest, sysid="..sysid)
		return
	end
	
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 活动字帖对换
		--PublicTestCharItemsExchange(sysarg, packet)
	elseif msgid == 2 then -- 购买绝版称号礼包
		--PublicTestBuyTitleGift(sysarg, packet)
	elseif msgid == 3 then -- 获得公测试活动数据
		PublicTestGetData(sysarg, packet)
	elseif msgid == 4 then -- 投资
		PublicTestInvestment(sysarg, packet)
	elseif msgid == 5 then -- 投资返还
		PublicTestInvestmentReturn(sysarg, packet)
	elseif msgid == 6 then -- 领取团购奖励
		--PublicTestGetGroupBuyAward(sysarg, packet)
	elseif msgid == 7 then -- 月度活动获取我的元宝消耗数据
		YbConsumeRanking_SendMyData(sysarg)
	elseif msgid == 8 then -- 月度活动获取排行榜数据
		local rankBegin = DataPack.readByte(packet)
		local count = DataPack.readByte(packet)
		YbConsumeRanking_SendRankingData(sysarg, rankBegin, count)
	elseif msgid == 9 then -- 购买烟花礼包		
		PublicTest_buy_firework_item(sysarg, packet)
	elseif msgid == 10 then -- 领取每日充值礼包
		PublicTest_get_daily_pay_gift(sysarg, packet)
	else
		print("error OnMsgPublicTest, unknown msgid="..msgid)
		return
	end
	
end