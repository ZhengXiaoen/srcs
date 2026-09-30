--#include "data\config\activity\XiaoFeiZhuanPan.lua" once

--消费转盘
handXiaoFeiZhuanPanEx =function(sysarg,msgid,packet)	

	local optType = DataPack.readByte(packet) --操作类型
	if optType==1 then --请求抽奖次数
		AskLucklyZP_canRunTime(sysarg)
	elseif optType==2 then --请求奖品信息
		AskLucklyZP_awardInfo(sysarg)
	elseif optType==3 then --抽奖全部记录
		AskLucklyZP_logInfo(sysarg)
	elseif optType==4 then --请求抽奖
		AskLucklyZP_lotteryDraw(sysarg)
	elseif optType==5 then --领取奖励
		AskLucklyZP_getAward(sysarg)
	elseif optType==6 then --请求刷新奖品
		--判断钱够不够
		if Actor.changeMoney(sysarg, 3, -XiaoFeiZhuanPan.refRandNeedYB, LogIds.xiaofeizhuanpan, "刷新奖品") == false then
			Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
			return -- 元宝不足
		end
		AskLucklyZP_RefawardInfo(sysarg)
		Actor.sendTipmsg(sysarg,"奖品刷新成功", ttFlyTip);
	elseif optType==7 then --十连抽（消耗10次抽奖机会）
		AskLucklyZP_multiDraw(sysarg, 10)
	elseif optType==8 then --百连抽（消耗100次抽奖机会）
		AskLucklyZP_multiDraw(sysarg, 100)
	end
end


------------------------------------------------------------消费转盘系统---------------------------------------
--获得可以抽奖的次数
function AskLucklyZP_canRunTime(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	if var.newdays == nil then var.newdays = {} end
	--消费
	local dayConsumeYB_WUYI = var.dayConsumeYB_WUYI
	if dayConsumeYB_WUYI == nil then
		dayConsumeYB_WUYI = 0
	end
	local Yb = XiaoFeiZhuanPan.cosumeEveryYB
	
	if ZP_IsUseOld() then 
	
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXiaoFeiZhuanPan)
		DataPack.writeByte(netPack,1)
		if var.newdays.ZPcanDoTime ==nil then 
			DataPack.writeInt(netPack,0)
			--print("var.newdays.ZPcanDoTime=0")
		else 
			DataPack.writeInt(netPack,var.newdays.ZPcanDoTime ) --一共有多少次转的机会
			--print("var.newdays.ZPcanDoTime="..var.newdays.ZPcanDoTime)
		end
		DataPack.writeUInt(netPack,dayConsumeYB_WUYI) --今天消费了多少
		--print("dayConsumeYB_WUYI="..dayConsumeYB_WUYI)
		DataPack.flush(netPack)
	else 
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXiaoFeiZhuanPan)
		DataPack.writeByte(netPack,1)
		if var.newdays.ZPhasDoTime ==nil then 
			DataPack.writeInt(netPack,math.floor(dayConsumeYB_WUYI/Yb))
		else
			DataPack.writeInt(netPack,math.floor(dayConsumeYB_WUYI/Yb)-var.newdays.ZPhasDoTime)
		end
		DataPack.writeUInt(netPack,dayConsumeYB_WUYI)
		DataPack.flush(netPack)
	end
	
end

--请求奖品信息
function AskLucklyZP_awardInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.days == nil then var.days = {} end
	if var.days.Luckly_ZPawardInfo==nil then 
		AskLucklyZP_RefawardInfo(sysarg)
		return 
	end
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXiaoFeiZhuanPan)
	DataPack.writeByte(netPack,2)
	for i=1,#var.days.Luckly_ZPawardInfo do 
		DataPack.writeByte(netPack,var.days.Luckly_ZPawardInfo[i])
		--print("var.days.Luckly_ZPawardInfo[i]="..var.days.Luckly_ZPawardInfo[i])
	end
	DataPack.flush(netPack)
end

--获得记录信息
function AskLucklyZP_logInfo(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXiaoFeiZhuanPan)
	DataPack.writeByte(netPack,3)
	
	local svar = System.getStaticVar()
	
	if svar.Luckly_ZPLog ==nil then 	
		DataPack.writeByte(netPack,0)
	else 
		
		local logs = lua_string_split(svar.Luckly_ZPLog,"|")
		--print(0)
		if #logs>0 then 
			if #logs>=50 then 
				DataPack.writeByte(netPack,50)
				local count = #logs-49
				for i=count,#logs do 
					local nameAnditem = lua_string_split(logs[i],",")
					DataPack.writeByte(netPack,tonumber(nameAnditem[2]))
					DataPack.writeString(netPack,nameAnditem[1])
					--print(tonumber(logs[i]))
				end
			else 
				DataPack.writeByte(netPack,#logs)
				for i=1,#logs do 
					local nameAnditem = lua_string_split(logs[i],",")
					DataPack.writeByte(netPack,tonumber(nameAnditem[2]))
					DataPack.writeString(netPack,nameAnditem[1])
					--print(tonumber(logs[i]))
				end
			end
			
		else 
			DataPack.writeByte(netPack,0)
		end
	end
	
	DataPack.flush(netPack)
end

--抽奖
function AskLucklyZP_lotteryDraw(sysarg)

	local Yb = XiaoFeiZhuanPan.cosumeEveryYB
	--是否有抽奖次数
	local svar = System.getStaticVar()
	
	local var = Actor.getStaticVar(sysarg)
	if var.days == nil then var.days = {} end
	if var.newdays == nil then var.newdays = {} end

	
	if var.days.Luckly_ZPawardInfo==nil then 
		AskLucklyZP_RefawardInfo(sysarg) 
	end
		
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXiaoFeiZhuanPan)
	DataPack.writeByte(netPack,4)
	
	if ZP_IsUseOld() then
		if var.newdays.ZPcanDoTime==nil or var.newdays.ZPcanDoTime<1 then 
			DataPack.writeByte(netPack,0)
			DataPack.flush(netPack)
			Actor.sendTipmsg(sysarg,"没有抽奖次数",ttFlyTip)
			return 
		end
	else 	
		if var.newdays.ZPhasDoTime==nil then 
			var.newdays.ZPhasDoTime=0
		end
		
		local dayConsumeYB_WUYI = var.dayConsumeYB_WUYI
		if dayConsumeYB_WUYI == nil then
			dayConsumeYB_WUYI = 0
		end
	
		if math.floor(dayConsumeYB_WUYI/Yb)-var.newdays.ZPhasDoTime<1 then 
			DataPack.writeByte(netPack,0)
			DataPack.flush(netPack)
			Actor.sendTipmsg(sysarg,"没有抽奖次数",ttFlyTip)
			return 
		end
	end
		
	--如果没有空位，就不让他抽奖(让前端这样做一下)
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if	bagIdxs<1 then 
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
		Actor.sendTipmsg(sysarg,"背包不足",ttFlyTip)
		return
	end
	
	--开始抽奖
	local cgf= XiaoFeiZhuanPan.award
	local hasAward = 0
	for i=1,#var.days.Luckly_ZPawardInfo do 
		if System.getRandomNumber(cgf[var.days.Luckly_ZPawardInfo[i]].rate) + 1 ==1 then 
			hasAward = var.days.Luckly_ZPawardInfo[i]
		end
	end

	--如果是0，那就取最低概率的那一个
	if hasAward==0 then 
		local minRate =100000
		local minIndex = 100000
		for i=1,#var.days.Luckly_ZPawardInfo do 
			if cgf[var.days.Luckly_ZPawardInfo[i]].rate <minRate then 
				minRate =cgf[var.days.Luckly_ZPawardInfo[i]].rate
				minIndex = var.days.Luckly_ZPawardInfo[i]
			end
		end
		hasAward = minIndex
	end
	
	--告诉前端抽中哪个
	DataPack.writeByte(netPack,hasAward)
	DataPack.flush(netPack)
	
	--先扣次数，不然可以无限抽奖了
	if ZP_IsUseOld() then
		var.newdays.ZPcanDoTime = var.newdays.ZPcanDoTime -1
	else	
		if var.newdays.ZPhasDoTime==nil then 
			var.newdays.ZPhasDoTime=1
			
		else	
			var.newdays.ZPhasDoTime= 1 + var.newdays.ZPhasDoTime
		end
	end
	
	var.QD_ZPgetAwardIndex = hasAward
	
end

--请求得到抽奖奖励
function AskLucklyZP_getAward(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	local cgf= XiaoFeiZhuanPan.award
		
	local svar = System.getStaticVar()

	
	--有奖励没领取（这个防止断线重连）
	if var.QD_ZPgetAwardIndex ~=nil and var.QD_ZPgetAwardIndex~=0 then 
		--给奖励
		--local bagIdxs = Item.getBagEmptyGridCount( sysarg )
		--if	bagIdxs<1 then 
		if not Awards.CheckBagGridCount(sysarg, {cgf[var.QD_ZPgetAwardIndex]}) then
			--return
			Actor.sendTipmsg(sysarg,"奖品已经发到邮件",ttFlyTip)
			local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
			System.AddMail(nActorId,6,0,"消费转盘奖品","消费转盘奖励",0,0,cgf[var.QD_ZPgetAwardIndex].id..","..cgf[var.QD_ZPgetAwardIndex].count..","..cgf[var.QD_ZPgetAwardIndex].bind)
		else
			Awards.Give(sysarg, {cgf[var.QD_ZPgetAwardIndex]}, LogIds.xiaofeizhuanpan, "消费转盘")
		end

		--写log
		if svar.Luckly_ZPLog ==nil then 	
			--svar.Luckly_ZPLog ={} --把之前的记录都清了
			svar.Luckly_ZPLog =""..Actor.getName(sysarg)..","..var.QD_ZPgetAwardIndex
		else 
			svar.Luckly_ZPLog = svar.Luckly_ZPLog .."|"..Actor.getName(sysarg)..","..var.QD_ZPgetAwardIndex
		end
		
		--print("svar.Luckly_ZPLog="..svar.Luckly_ZPLog)
	
		--优化代码，把多于50条的截掉
		local logs = lua_string_split(svar.Luckly_ZPLog,"|")
		--print("#logs="..#logs)
			
		if #logs>50 then 
			local pos = string.find(svar.Luckly_ZPLog, "|")
			if (not pos) then
			else 
				svar.Luckly_ZPLog = string.sub(svar.Luckly_ZPLog, pos + 1, #svar.Luckly_ZPLog);
			end
		end
		
		
		System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家通过消费转盘获得%s,拿到就是赚到!<我也要去/@@showWin,246,2>",Actor.getName(sysarg),cgf[var.QD_ZPgetAwardIndex].name),ttChatWindow)
		
		
		local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
		for k, plyPtr in ipairs(playerList or {}) do
			local netPack = DataPack.allocPacket(plyPtr,151,LogicCmd.miscSysEx.sub.sXiaoFeiZhuanPan)
			DataPack.writeByte(netPack,5)
			DataPack.writeByte(netPack,var.QD_ZPgetAwardIndex)
			DataPack.writeString(netPack,Actor.getName(sysarg))
			DataPack.flush(netPack)
		end	
		
		var.QD_ZPgetAwardIndex =nil
	end
	
end

--是否在奖励tables里面
function IsIn_ZPawardTable(tables,index)
	for i=1,#tables do 
		if tables[i] == index then 
			return true
		end
	end
	
	return false
end

--请求刷新奖品
function AskLucklyZP_RefawardInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.days == nil then var.days = {} end
	--if var.days.Luckly_ZPawardInfo==nil then 
	var.days.Luckly_ZPawardInfo ={}
	--end
	
	local i=1
	local cgf= XiaoFeiZhuanPan.award
	--轮一遍概率
	while i<=#cgf and  #var.days.Luckly_ZPawardInfo<8 do 
		if System.getRandomNumber(cgf[i].rate) + 1 ==1 then --被选中了
			var.days.Luckly_ZPawardInfo[#var.days.Luckly_ZPawardInfo+1]=i
		end
		i = i + 1
	end
	
	--如果不够8个，那就把概率高的塞进去
	for i=1,#cgf do 
		if  #var.days.Luckly_ZPawardInfo<8 and  IsIn_ZPawardTable(var.days.Luckly_ZPawardInfo,i)==false then 
			var.days.Luckly_ZPawardInfo[#var.days.Luckly_ZPawardInfo+1]=i
		end
	end
	--for i=1,#var.days.Luckly_ZPawardInfo do 
	--	print(""..var.days.Luckly_ZPawardInfo[i])
	--end 
	--把奖品信息发给前端
	AskLucklyZP_awardInfo(sysarg)
end


--转盘是否用旧方式
function ZP_IsUseOld()
	local nNowDt = System.getCurrMiniTime()
	local y,m,d,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(nNowDt)
	if y==2018 and m==4 and d==27 then 
		return true
	end
	return false
end

------------------------------------------------------------消费转盘系统-----------------------------------------------------		

--十连抽/百连抽通用实现
--drawCount: 抽奖次数(10=十连 100=百连)
function AskLucklyZP_multiDraw(sysarg, drawCount)

	local Yb   = XiaoFeiZhuanPan.cosumeEveryYB
	local var  = Actor.getStaticVar(sysarg)
	if var.days == nil then var.days = {} end
	if var.newdays == nil then var.newdays = {} end
	local svar = System.getStaticVar()

	if var.days.Luckly_ZPawardInfo == nil then
		AskLucklyZP_RefawardInfo(sysarg)
	end

	-- 计算当前剩余抽奖次数
	local availTimes = 0
	if ZP_IsUseOld() then
		availTimes = var.newdays.ZPcanDoTime or 0
	else
		local dayConsumeYB_WUYI = var.dayConsumeYB_WUYI or 0
		local hasDoTime         = var.newdays.ZPhasDoTime or 0
		availTimes = math.floor(dayConsumeYB_WUYI / Yb) - hasDoTime
	end

	if availTimes < drawCount then
		Actor.sendTipmsg(sysarg, string.format("抽奖次数不足，需要%d次，当前剩余%d次", drawCount, availTimes), ttFlyTip)
		return
	end

	-- 背包检查：至少有1格才受理
	if Item.getBagEmptyGridCount(sysarg) < 1 then
		Actor.sendTipmsg(sysarg, "背包已满，无法进行多连抽", ttFlyTip)
		return
	end

	local cgf     = XiaoFeiZhuanPan.award
	local results = {}

	-- 抽奖循环：每次复用槽位概率，未命中则保底最稀有奖励
	for n = 1, drawCount do
		local hasAward = 0
		for i = 1, #var.days.Luckly_ZPawardInfo do
			if System.getRandomNumber(cgf[var.days.Luckly_ZPawardInfo[i]].rate) + 1 == 1 then
				hasAward = var.days.Luckly_ZPawardInfo[i]
			end
		end
		if hasAward == 0 then
			local minRate  = 100000
			local minIndex = 1
			for i = 1, #var.days.Luckly_ZPawardInfo do
				if cgf[var.days.Luckly_ZPawardInfo[i]].rate < minRate then
					minRate  = cgf[var.days.Luckly_ZPawardInfo[i]].rate
					minIndex = var.days.Luckly_ZPawardInfo[i]
				end
			end
			hasAward = minIndex
		end
		results[#results + 1] = hasAward
	end

	-- 扣除抽奖次数
	if ZP_IsUseOld() then
		var.newdays.ZPcanDoTime = (var.newdays.ZPcanDoTime or 0) - drawCount
	else
		var.newdays.ZPhasDoTime = (var.newdays.ZPhasDoTime or 0) + drawCount
	end

	-- 逐一发放奖励；背包不足时改发邮件
	local mailItems = {}
	local tipStr    = string.format("%d连抽结果：", drawCount)

	for i = 1, #results do
		local awardIdx = results[i]
		local awardCfg = cgf[awardIdx]

		if not Awards.CheckBagGridCount(sysarg, {awardCfg}) then
			mailItems[#mailItems + 1] = awardCfg.id .. "," .. awardCfg.count .. "," .. awardCfg.bind
		else
			Awards.Give(sysarg, {awardCfg}, LogIds.xiaofeizhuanpan, string.format("消费转盘%d连抽", drawCount))
		end

		tipStr = tipStr .. awardCfg.name .. " "

		-- 写全局滚动日志
		if svar.Luckly_ZPLog == nil then
			svar.Luckly_ZPLog = Actor.getName(sysarg) .. "," .. awardIdx
		else
			svar.Luckly_ZPLog = svar.Luckly_ZPLog .. "|" .. Actor.getName(sysarg) .. "," .. awardIdx
		end
		local logs = lua_string_split(svar.Luckly_ZPLog, "|")
		if #logs > 50 then
			local pos = string.find(svar.Luckly_ZPLog, "|")
			if pos then svar.Luckly_ZPLog = string.sub(svar.Luckly_ZPLog, pos + 1) end
		end
	end

	-- 补发背包不足的物品
	if #mailItems > 0 then
		local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		System.AddMail(nActorId, 6, 0, string.format("消费转盘%d连抽奖品", drawCount),
			"背包不足，奖励已补发到邮件", 0, 0, table.concat(mailItems, "/"))
	end

	Actor.sendTipmsg(sysarg, tipStr, ttFlyTip)
	System.broadcastTipmsg(string.format(
		"<(n%s)>玩家进行了消费转盘%d连抽，获得了丰厚奖励！<我也要去/@@showWin,246,2>",
		Actor.getName(sysarg), drawCount), ttChatWindow)

	-- 刷新剩余次数给客户端
	AskLucklyZP_canRunTime(sysarg)
end

--@func xfzp10 消费转盘十连抽（GM命令）
function xfzp10(sysarg)
	AskLucklyZP_multiDraw(sysarg, 10)
end

--@func xfzp100 消费转盘百连抽（GM命令）
function xfzp100(sysarg)
	AskLucklyZP_multiDraw(sysarg, 100)
end
