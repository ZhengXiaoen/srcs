--#include "data\config\new_activity\festival\activity_jingji.lua" once --竞技活动

--消费转盘
handJingjiZhuanPan =function(sysarg,msgid,packet)
	if GetJingjiActivityType() == 0 then return end

	local optType = DataPack.readByte(packet) --操作类型
	if optType==1 then --请求抽奖次数
		AskJJZP_canRunTime(sysarg)
	elseif optType==2 then --请求奖品信息
		AskJJZP_awardInfo(sysarg)
	elseif optType==3 then --抽奖全部记录
		--AskJJZP_logInfo(sysarg)
	elseif optType==4 then --请求抽奖
		AskJJZP_lotteryDraw(sysarg) --抽1次还是抽10次
	end
end


------------------------------------------------------------竞技转盘系统---------------------------------------
--获得可以抽奖的次数
function AskJJZP_canRunTime(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	local onlineTime = Actor.getTodayOnlineTime(sysarg)
	if var.days.getRunFreeTime_JJZP ==nil then 
		var.days.getRunFreeTime_JJZP = 0
	end
	if var.days.PeyNum==nil then 
		var.days.PeyNum =0
	end
	
	local canFreeRunTime1 = math.floor(onlineTime /3600)
	
	local canFreeRunTime2 =math.floor(var.days.PeyNum/5000)
	
	local canFreeRunTime =canFreeRunTime1 +canFreeRunTime2
	
	if canFreeRunTime> activity_jingji.JingjiZhuanPan.toptime then	
		canFreeRunTime = activity_jingji.JingjiZhuanPan.toptime
	end
	
	local leftTime = canFreeRunTime-var.days.getRunFreeTime_JJZP
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sJingJIZhuanPan)
	DataPack.writeByte(netPack,1)
	DataPack.writeUInt(netPack,onlineTime)
	DataPack.writeByte(netPack,leftTime) --剩下多少次是免费的
	DataPack.writeByte(netPack,var.days.getRunFreeTime_JJZP) --已经抽了多少次
	DataPack.flush(netPack)

end

--请求奖品信息
function AskJJZP_awardInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.days.JJZP_awardInfo==nil then 
		AskJJZP_RefawardInfo(sysarg) --刷新奖品列表
		return 
	end
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sJingJIZhuanPan)
	DataPack.writeByte(netPack,2)
	for i=1,#var.days.JJZP_awardInfo do 
		DataPack.writeByte(netPack,var.days.JJZP_awardInfo[i])
		--print("var.days.JJZP_awardInfo[i]="..var.days.JJZP_awardInfo[i])
	end
	DataPack.flush(netPack)
end

--获得记录信息
function AskJJZP_logInfo(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sJingJIZhuanPan)
	DataPack.writeByte(netPack,3)
	
	local svar = System.getStaticVar()
	
	if svar.Luckly_JJZPLog ==nil then 	
		DataPack.writeByte(netPack,0)
	else 
		
		local logs = lua_string_split(svar.Luckly_JJZPLog,"|")
		--print(0)
		if #logs>0 then 
			if #logs>=50 then 
				DataPack.writeByte(netPack,50)
				local count = #logs-49
				for i=count,#logs do 
					local nameAnditem = lua_string_split(logs[i],",")
					DataPack.writeByte(netPack,tonumber(nameAnditem[2]))
					DataPack.writeString(netPack,nameAnditem[1])
					--print((logs[i]))
				end
			else 
				DataPack.writeByte(netPack,#logs)
				for i=1,#logs do 
					local nameAnditem = lua_string_split(logs[i],",")
					DataPack.writeByte(netPack,tonumber(nameAnditem[2]))
					DataPack.writeString(netPack,nameAnditem[1])
					--print((logs[i]))
				end
			end
			
		else 
			DataPack.writeByte(netPack,0)
		end
	end
	
	DataPack.flush(netPack)
end

--抽奖
function AskJJZP_lotteryDraw(sysarg)

	--是否有抽奖次数
	local svar = System.getStaticVar()
	
	local var = Actor.getStaticVar(sysarg)
	
	local onlineTime = Actor.getTodayOnlineTime(sysarg)
	if var.days.getRunFreeTime_JJZP ==nil then 
		var.days.getRunFreeTime_JJZP = 0
	end
	
	local canFreeRunTime1 = math.floor(onlineTime /3600)
	
	if var.days.PeyNum==nil then var.days.PeyNum =0 end
	local canFreeRunTime2 =math.floor(var.days.PeyNum/activity_jingji.JingjiZhuanPan.needPay)
	
	local canFreeRunTime =canFreeRunTime1 +canFreeRunTime2
	
	if canFreeRunTime>activity_jingji.JingjiZhuanPan.toptime then	
		canFreeRunTime =activity_jingji.JingjiZhuanPan.toptime
	end
	
	local leftTime = canFreeRunTime-var.days.getRunFreeTime_JJZP --免费的次数
	if leftTime==0 then --没有了免费的次数
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sJingJIZhuanPan)
		DataPack.writeByte(netPack,4)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
		Actor.sendTipmsg(sysarg,"没有抽奖次数",ttFlyTip)
		return
	end
	
	--背包不足
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if	bagIdxs<1 then 
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sJingJIZhuanPan)
		DataPack.writeByte(netPack,4)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
		Actor.sendTipmsg(sysarg,"背包不足",ttFlyTip)
		return
	end
	
	var.days.getRunFreeTime_JJZP = var.days.getRunFreeTime_JJZP + 1
	
	AskJJZP_canRunTime(sysarg) --把免费的次数下发一下

	
	local hasAward =DoRunJJZP(sysarg)
	
	--告诉前端抽中哪个
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sJingJIZhuanPan)
	DataPack.writeByte(netPack,4)
	DataPack.writeByte(netPack,hasAward)
	DataPack.flush(netPack)
	
	AskJJZP_getAward(sysarg,hasAward)
	
end
function canaddJJZP_Table(allGet,index)
	if #allGet ==0 then 
		return true 
	else
		for i=1,#allGet do 
			if allGet[i] ==index then 
				return false
			end
		end
	end
	return true
end


function DoRunJJZP(sysarg)
	--开始抽奖
	
	local var = Actor.getStaticVar(sysarg)
	
	if var.days.JJZP_awardInfo ==nil then 
		AskJJZP_RefawardInfo(sysarg)
	end
	
	
	local cgf= activity_jingji.JingjiZhuanPan.award
	local hasAward = 0
	for i=1,#var.days.JJZP_awardInfo do 
		if System.getRandomNumber(cgf[var.days.JJZP_awardInfo[i]].rate) + 1 ==1 then 
			hasAward = var.days.JJZP_awardInfo[i]
		end
	end
	
	--如果是0，那就取最低概率的那一个
	if hasAward==0 then 
		local minRate =100000
		local minIndex = 100000
		for i=1,#var.days.JJZP_awardInfo do 
			if cgf[var.days.JJZP_awardInfo[i]].rate <minRate then 
				minRate =cgf[var.days.JJZP_awardInfo[i]].rate
				minIndex = var.days.JJZP_awardInfo[i]
			end
		end
		hasAward = minIndex
	end
	
	return  hasAward
end

--请求得到抽奖奖励
function AskJJZP_getAward(sysarg,hasAward)
	local var = Actor.getStaticVar(sysarg)
	
	local cgf= activity_jingji.JingjiZhuanPan.award
		
	local svar = System.getStaticVar()

	
	--有奖励没领取（这个防止断线重连）
	if hasAward ~=nil and hasAward~=0 then 
		--给奖励
		--local bagIdxs = Item.getBagEmptyGridCount( sysarg )
		--if	bagIdxs<1 then 
		if not Awards.CheckBagGridCount(sysarg, {cgf[hasAward]}) then
			--return
			Actor.sendTipmsg(sysarg,"奖品已经发到邮件",ttFlyTip)
			local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
			System.AddMail(nActorId,6,0,"消费转盘奖品","消费转盘奖励",0,0,cgf[hasAward].id..","..cgf[hasAward].count..","..cgf[hasAward].bind)
		else
			Awards.Give(sysarg, {cgf[hasAward]}, LogIds.JingJiActivity, "充值转盘")
		end

		--写log
		if svar.Luckly_JJZPLog ==nil then 	
			--svar.Luckly_JJZPLog ={} --把之前的记录都清了
			svar.Luckly_JJZPLog =""..Actor.getName(sysarg)..","..hasAward
		else 
			svar.Luckly_JJZPLog = svar.Luckly_JJZPLog .."|"..Actor.getName(sysarg)..","..hasAward
		end
		
		--print("svar.Luckly_JJZPLog="..svar.Luckly_JJZPLog)
	
		--优化代码，把多于50条的截掉
		local logs = lua_string_split(svar.Luckly_JJZPLog,"|")
		--print("#logs="..#logs)
			
		if #logs>50 then 
			local pos = string.find(svar.Luckly_JJZPLog, "|")
			if (not pos) then
			else 
				svar.Luckly_JJZPLog = string.sub(svar.Luckly_JJZPLog, pos + 1, #svar.Luckly_JJZPLog);
			end
		end
		
		local actType = GetJingjiActivityType()
		if actType==1 then 
			System.broadcastTipmsg(string.format("<(n%s)>玩家圣诞来袭充值转盘中获得%s，超级丰盛<我也要领取/@@showWin,264,0>",Actor.getName(sysarg),cgf[hasAward].name), ttChatWindow)
		elseif actType==2 then 
			System.broadcastTipmsg(string.format("<(n%s)>玩家竞技大赛充值转盘中获得%s，超级丰盛<我也要领取/@@showWin,264,0>",Actor.getName(sysarg),cgf[hasAward].name), ttChatWindow)
		end
		--System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家通过消费转盘获得%s,拿到就是赚到!<我也要去/@@showWin,246,2>",Actor.getName(sysarg),cgf[hasAward].name),ttChatWindow)
		
		
		local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
		for k, plyPtr in ipairs(playerList or {}) do
			local netPack = DataPack.allocPacket(plyPtr,151,LogicCmd.miscSysEx.sub.sJingJIZhuanPan)
			DataPack.writeByte(netPack,5)
			DataPack.writeByte(netPack,hasAward)
			DataPack.writeString(netPack,Actor.getName(sysarg))
			DataPack.flush(netPack)
		end	
		
		hasAward =nil
	end
	
end

--是否在奖励tables里面
function IsIn_JJZPawardTable(tables,index)
	for i=1,#tables do 
		if tables[i] == index then 
			return true
		end
	end
	
	return false
end

--请求刷新奖品
function AskJJZP_RefawardInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	--if var.days.JJZP_awardInfo==nil then 
	var.days.JJZP_awardInfo ={}
	--end
	
	local i=1
	local cgf= activity_jingji.JingjiZhuanPan.award
	--轮一遍概率
	while i<=#cgf and  #var.days.JJZP_awardInfo<12 do 
		if System.getRandomNumber(cgf[i].rate) + 1 ==1 then --被选中了
			var.days.JJZP_awardInfo[#var.days.JJZP_awardInfo+1]=i
		end
		i = i + 1
	end
	
	--如果不够8个，那就把概率高的塞进去
	for i=1,#cgf do 
		if  #var.days.JJZP_awardInfo<12 and  IsIn_JJZPawardTable(var.days.JJZP_awardInfo,i)==false then 
			var.days.JJZP_awardInfo[#var.days.JJZP_awardInfo+1]=i
		end
	end
	--for i=1,#var.days.JJZP_awardInfo do 
	--	print(""..var.days.JJZP_awardInfo[i])
	--end 
	--把奖品信息发给前端
	AskJJZP_awardInfo(sysarg)
end
