--#include "data\config\activity\XianGongZhuanPan.lua" once

--消费转盘
handXianGongZhuanPan =function(sysarg,msgid,packet)	
	
	local optType = DataPack.readByte(packet) --操作类型
	if optType==1 then --请求抽奖次数
		AskXGZP_canRunTime(sysarg)
	elseif optType==2 then --请求奖品信息
		AskXGZP_awardInfo(sysarg)
	elseif optType==3 then --抽奖全部记录
		AskXGZP_logInfo(sysarg)
	elseif optType==4 then --请求抽奖
		AskXGZP_lotteryDraw(sysarg,DataPack.readByte(packet)) --抽1次还是抽10次
	elseif optType==6 then --请求刷新奖品
		--判断钱够不够
		if Actor.changeMoney(sysarg, 3, -XianGongZhuanPan.refRandNeedYB, LogIds.XianGongZhuanPan, "刷新奖品") == false then
			Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
			return -- 元宝不足
		end
		AskXGZP_RefawardInfo(sysarg)
		Actor.sendTipmsg(sysarg,"奖品刷新成功", ttFlyTip);
	elseif optType==7 then --每抽完一次请求刷新奖品
		
		local dVar = Actor.getDyanmicVar(sysarg)
		if dVar.canshuanXianGong ~=nil and dVar.canshuanXianGong==1 then 
			dVar.canshuanXianGong = nil
			AskXGZP_RefawardInfo(sysarg)
		end
	end
end


------------------------------------------------------------仙宫转盘系统---------------------------------------
--获得可以抽奖的次数
function AskXGZP_canRunTime(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	local onlineTime = Actor.getTodayOnlineTime(sysarg)
	if var.days.getRunFreeTime_XGZP ==nil then 
		var.days.getRunFreeTime_XGZP = 0
	end
	
	local canFreeRunTime = math.floor(onlineTime /3600)
	if canFreeRunTime>XianGongZhuanPan.topfreetime then	
		canFreeRunTime =XianGongZhuanPan.topfreetime
	end
	
	local leftTime = canFreeRunTime-var.days.getRunFreeTime_XGZP
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXianGongZhuanPan)
	DataPack.writeByte(netPack,1)
	DataPack.writeUInt(netPack,onlineTime)
	DataPack.writeByte(netPack,leftTime) --剩下多少次是免费的
	DataPack.writeByte(netPack,var.days.getRunFreeTime_XGZP) --已经转了多少次
	DataPack.flush(netPack)

end

--请求奖品信息
function AskXGZP_awardInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.days.XGZP_awardInfo==nil then 
		AskXGZP_RefawardInfo(sysarg) --刷新奖品列表
		return 
	end
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXianGongZhuanPan)
	DataPack.writeByte(netPack,2)
	for i=1,#var.days.XGZP_awardInfo do 
		DataPack.writeByte(netPack,var.days.XGZP_awardInfo[i])
		--print("var.days.XGZP_awardInfo[i]="..var.days.XGZP_awardInfo[i])
	end
	DataPack.flush(netPack)
end

--获得记录信息
function AskXGZP_logInfo(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXianGongZhuanPan)
	DataPack.writeByte(netPack,3)
	
	local svar = System.getStaticVar()
	
	if svar.Luckly_XGZPLog ==nil then 	
		DataPack.writeByte(netPack,0)
	else 
		
		local logs = lua_string_split(svar.Luckly_XGZPLog,"|")
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
function AskXGZP_lotteryDraw(sysarg,types)


	local dVar = Actor.getDyanmicVar(sysarg)
		
	--是否有抽奖次数
	local svar = System.getStaticVar()
	
	local var = Actor.getStaticVar(sysarg)
	if var.days.XGZP_awardInfo==nil then 
		AskXGZP_RefawardInfo(sysarg) 
	end
	
	if types==1 then 
		local onlineTime = Actor.getTodayOnlineTime(sysarg)
		if var.days.getRunFreeTime_XGZP ==nil then 
			var.days.getRunFreeTime_XGZP = 0
		end
		
		local canFreeRunTime = math.floor(onlineTime /3600)
		if canFreeRunTime>XianGongZhuanPan.topfreetime then	
			canFreeRunTime =XianGongZhuanPan.topfreetime
		end
		
		
	
		local useYb =false
		local leftTime = canFreeRunTime-var.days.getRunFreeTime_XGZP --免费的次数
		if leftTime==0 then --没有了免费的次数
			local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
			if myYb<XianGongZhuanPan.runNeedYB then --没有次数也没有钱
				local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXianGongZhuanPan)
				DataPack.writeByte(netPack,4)
				DataPack.writeByte(netPack,0)
				DataPack.flush(netPack)
				Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
				return
			end
			useYb =true
		else
			useYb =false
		end
		
		--背包不足
		local bagIdxs = Item.getBagEmptyGridCount( sysarg )
		if	bagIdxs<1 then 
			local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXianGongZhuanPan)
			DataPack.writeByte(netPack,4)
			DataPack.writeByte(netPack,0)
			DataPack.flush(netPack)
			Actor.sendTipmsg(sysarg,"背包不足",ttFlyTip)
			return
		end
		
		if useYb==false then  --免费
			var.days.getRunFreeTime_XGZP = var.days.getRunFreeTime_XGZP + 1
			AskXGZP_canRunTime(sysarg) --把免费的次数下发一下
		else
			Actor.changeMoney(sysarg, mtYuanbao, -XianGongZhuanPan.runNeedYB, LogIds.DEggBuyItemConsume, "仙宫转盘")
		end
		
		local hasAward =DoRunXGZP(sysarg)
		
		--告诉前端抽中哪个
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXianGongZhuanPan)
		DataPack.writeByte(netPack,4)
		DataPack.writeByte(netPack,1)
		DataPack.writeByte(netPack,hasAward)
		--print("抽到:"..hasAward)
		DataPack.flush(netPack)
		dVar.canshuanXianGong = 1
		
		AskXGZP_getAward(sysarg,hasAward)
		System.broadcastTipmsg(string.format("玩家<(n%s)>玩家财大气粗,通过仙宫转盘转出%s,<我也要参与/@@showWin,262,1>",Actor.getName(sysarg),XianGongZhuanPan.award[hasAward].name),ttChatWindow)
	elseif types==2 then 
			
		local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
		if myYb<XianGongZhuanPan.runTenNeedYB then --没有次数也没有钱
			local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXianGongZhuanPan)
			DataPack.writeByte(netPack,4)
			DataPack.writeByte(netPack,0)
			DataPack.flush(netPack)
			Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
			return
		end
		
		local bagIdxs = Item.getBagEmptyGridCount( sysarg )
		if	bagIdxs<10 then 
			local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXianGongZhuanPan)
			DataPack.writeByte(netPack,4)
			DataPack.writeByte(netPack,0)
			DataPack.flush(netPack)
			Actor.sendTipmsg(sysarg,"背包请预留10个格子",ttFlyTip)
			return
		end
		
		Actor.changeMoney(sysarg, mtYuanbao, -XianGongZhuanPan.runTenNeedYB, LogIds.DEggBuyItemConsume, "仙宫转盘")
		
		local allGet ={}
		local allNoCheckGet ={}
		for i=1,10 do 
			local hasAward =DoRunXGZP(sysarg)
			AskXGZP_getAward(sysarg,hasAward)
			
			table.insert(allNoCheckGet,hasAward)
			if  canaddXGZP_Table(allGet,hasAward) ==true then 
				table.insert(allGet,hasAward)
				--print("抽到:"..hasAward)
			end
		end
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXianGongZhuanPan)
		DataPack.writeByte(netPack,4)
		DataPack.writeByte(netPack,#allGet)
		for i=1,#allGet do
			DataPack.writeByte(netPack,allGet[i])
		end
		DataPack.flush(netPack)
		
		dVar.canshuanXianGong = 1
		System.broadcastTipmsg(string.format("玩家<(n%s)>玩家财大气粗,通过仙宫转盘10连抽依次转出%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,<我也要参与/@@showWin,262,1>",Actor.getName(sysarg)
		,XianGongZhuanPan.award[allNoCheckGet[1]].name
		,XianGongZhuanPan.award[allNoCheckGet[2]].name
		,XianGongZhuanPan.award[allNoCheckGet[3]].name
		,XianGongZhuanPan.award[allNoCheckGet[4]].name
		,XianGongZhuanPan.award[allNoCheckGet[5]].name
		,XianGongZhuanPan.award[allNoCheckGet[6]].name
		,XianGongZhuanPan.award[allNoCheckGet[7]].name
		,XianGongZhuanPan.award[allNoCheckGet[8]].name
		,XianGongZhuanPan.award[allNoCheckGet[9]].name
		,XianGongZhuanPan.award[allNoCheckGet[10]].name),ttChatWindow)
	end
	

	
end
function canaddXGZP_Table(allGet,index)
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


function DoRunXGZP(sysarg)
	--开始抽奖
	local var = Actor.getStaticVar(sysarg)
	
	local cgf= XianGongZhuanPan.award
	local hasAward = 0
	for i=1,#var.days.XGZP_awardInfo do 
		if System.getRandomNumber(cgf[var.days.XGZP_awardInfo[i]].rate) + 1 ==1 then 
			hasAward = var.days.XGZP_awardInfo[i]
		end
	end
	
	--如果是0，那就取最低概率的那一个
	if hasAward==0 then 
		local minRate =100000
		local minIndex = 100000
		for i=1,#var.days.XGZP_awardInfo do 
			if cgf[var.days.XGZP_awardInfo[i]].rate <minRate then 
				minRate =cgf[var.days.XGZP_awardInfo[i]].rate
				minIndex = var.days.XGZP_awardInfo[i]
			end
		end
		hasAward = minIndex
	end
	
	return  hasAward
end

--请求得到抽奖奖励
function AskXGZP_getAward(sysarg,hasAward)
	local var = Actor.getStaticVar(sysarg)
	
	local cgf= XianGongZhuanPan.award
		
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
			Awards.Give(sysarg, {cgf[hasAward]}, LogIds.XianGongZhuanPan, "消费转盘")
		end

		--写log
		if svar.Luckly_XGZPLog ==nil then 	
			--svar.Luckly_XGZPLog ={} --把之前的记录都清了
			svar.Luckly_XGZPLog =""..Actor.getName(sysarg)..","..hasAward
		else 
			svar.Luckly_XGZPLog = svar.Luckly_XGZPLog .."|"..Actor.getName(sysarg)..","..hasAward
		end
		
		--print("svar.Luckly_XGZPLog="..svar.Luckly_XGZPLog)
	
		--优化代码，把多于50条的截掉
		local logs = lua_string_split(svar.Luckly_XGZPLog,"|")
		
			
		if #logs>50 then 
			local pos = string.find(svar.Luckly_XGZPLog, "|")
			if (not pos) then
			else 
				svar.Luckly_XGZPLog = string.sub(svar.Luckly_XGZPLog, pos + 1, #svar.Luckly_XGZPLog);
			end
		end
		
		
		--System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家通过消费转盘获得%s,拿到就是赚到!<我也要去/@@showWin,246,2>",Actor.getName(sysarg),cgf[hasAward].name),ttChatWindow)
		
		
		local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
		for k, plyPtr in ipairs(playerList or {}) do
			local netPack = DataPack.allocPacket(plyPtr,151,LogicCmd.miscSysEx.sub.sXianGongZhuanPan)
			DataPack.writeByte(netPack,5)
			DataPack.writeByte(netPack,hasAward)
			--print("hasAward="..hasAward)
			DataPack.writeString(netPack,Actor.getName(sysarg))
			--print("Actor.getName(sysarg)="..Actor.getName(sysarg))
			DataPack.flush(netPack)
		end	
		
		hasAward =nil
	end
	
end

--是否在奖励tables里面
function IsIn_XGZPawardTable(tables,index)
	for i=1,#tables do 
		if tables[i] == index then 
			return true
		end
	end
	
	return false
end

--请求刷新奖品
function AskXGZP_RefawardInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	--if var.days.XGZP_awardInfo==nil then 
	var.days.XGZP_awardInfo ={}
	--end
	
	local i=1
	local cgf= XianGongZhuanPan.award
	--轮一遍概率
	while i<=#cgf and  #var.days.XGZP_awardInfo<8 do 
		if System.getRandomNumber(cgf[i].rate) + 1 ==1 then --被选中了
			var.days.XGZP_awardInfo[#var.days.XGZP_awardInfo+1]=i
		end
		i = i + 1
	end
	
	--如果不够8个，那就把概率高的塞进去
	for i=1,#cgf do 
		if  #var.days.XGZP_awardInfo<8 and  IsIn_XGZPawardTable(var.days.XGZP_awardInfo,i)==false then 
			var.days.XGZP_awardInfo[#var.days.XGZP_awardInfo+1]=i
		end
	end
	--for i=1,#var.days.XGZP_awardInfo do 
	--	print(""..var.days.XGZP_awardInfo[i])
	--end 
	--把奖品信息发给前端
	AskXGZP_awardInfo(sysarg)
end
	