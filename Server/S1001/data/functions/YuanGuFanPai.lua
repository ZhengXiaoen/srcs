--远古翻牌
--#include "data\config\ActorEvent\YuanGuFanPaiCfg.lua" once

--这是另外一种逻辑写的翻牌，以免再改回来，就先放着吧
--YuanGuFanPaiHandle = function( sysarg, msgid, packet )
--	--三转以上才能打开面板
--	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
--	if nCircle<3 then 
--		return 
--	end
--	
--	local nType = DataPack.readByte(packet)
--	if	nType== 0 then --获得信息
--		YuanGuFanPaiInfo(sysarg)
--	elseif nType== 1 then --立即翻牌/重置翻牌
--		InitYuanGuFanPai(sysarg) 
--	elseif nType== 2 then	--翻牌
--		DoYuanGuFanPai(sysarg)
--	end
--	
--	
--end
--
----获取信息
--function YuanGuFanPaiInfo(sysarg)
--	local var = Actor.getStaticVar(sysarg)
--	if var.days.FanPaiTime==nil then  var.days.FanPaiTime=0 end	--翻牌次数，这个是要做跨服处理的 , 跨天的时候要主动/请求更新数据的
--	if var.days.FanPaiTimeDang ==nil then var.days.FanPaiTimeDang =0 end --翻牌档数
--	
--	
--	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.syuanGuFanPai)
--	DataPack.writeByte(netPack,0)	--总信息
--	DataPack.writeByte(netPack,var.days.FanPaiTime)
--	DataPack.writeByte(netPack,var.days.FanPaiTimeDang)
--	DataPack.flush(netPack)
--	
--	--print("var.days.FanPaiTime="..var.days.FanPaiTime)
--	--print("var.days.FanPaiTimeDang="..var.days.FanPaiTimeDang)
--end
--
--
----立即翻牌/重置翻牌
--function InitYuanGuFanPai(sysarg)	
--	local var = Actor.getStaticVar(sysarg)
--	if var.days.FanPaiTime==nil then  var.days.FanPaiTime=0 end	--翻牌次数，这个是要做跨服处理的 , 跨天的时候要主动/请求更新数据的
--	if var.days.FanPaiTimeDang ==nil then var.days.FanPaiTimeDang =0 end --翻牌档数
--	
--	if var.days.FanPaiTime==0 then 
--		Actor.sendTipmsg(sysarg,"没有了重置翻牌的次数",ttFlyTip)
--		return 
--	end
--	
--	var.days.FanPaiTime = var.days.FanPaiTime -1 
--	var.days.FanPaiTimeDang = 5 
--	
--	--告诉前端翻牌成功
--	YuanGuFanPaiInfo(sysarg)
--end
--
--
----翻牌
--function DoYuanGuFanPai(sysarg)
--	local var = Actor.getStaticVar(sysarg)
--	if var.days.FanPaiTimeDang ==nil then var.days.FanPaiTimeDang =0 end --翻牌档数
--	
--	if var.days.FanPaiTimeDang==0 then 
--		Actor.sendTipmsg(sysarg,"没有了翻牌的次数",ttFlyTip)
--		return 
--	end
--	
--	--当前第几档
--	local nowDang = 6-var.days.FanPaiTimeDang
--	
--	local cfg = YuanGuFanPaiCfg[nowDang]
--	
--	----判断格子是否足够(换先随机，然后给物品)
--	--local bagIdxs = Item.getBagEmptyGridCount( sysarg )
--	--if bagIdxs<1 then 
--	--	Actor.sendTipmsg(sysarg,"背包不足",ttFlyTip)
--	--	return false
--	--end
--
--	--随机，随出要给的东西
--	local luckNumber = 0
--	local randTime =0
--	while luckNumber==0 do 
--		randTime = randTime + 1
--		--死循环
--		if randTime==50 then 
--			luckNumber =1
--			break --跳出死循环，选择第一个
--		end
--		for i=1,#cfg.Award do 
--			local randNumber = System.getRandomNumber(cfg.Award[i].weight)
--			if randNumber==0 then 
--				luckNumber = i
--				break 
--			end
--		end
--	end
--	
--	--背包不足
--	if not Awards.CheckBagGridCount(sysarg,cfg.Award[luckNumber].award) then
--		return
--	end
--	
--	--判断金钱是否足够
--	if cfg.needYB~=0 then 
--		if Actor.changeMoney(sysarg, 3, -cfg.needYB, LogIds.yuangufanpai, "远古翻牌") == false then
--			Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
--			return -- 元宝不足
--		end
--	end
--	
--	--记录
--	var.days.FanPaiTimeDang = var.days.FanPaiTimeDang -1
--	
--	--发奖励
--	Awards.Give(sysarg, cfg.Award[luckNumber].award, LogIds.yuangufanpai, "远古翻牌")
--	
--	--通知前端得到了什么,停下来
--	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.syuanGuFanPai)
--	DataPack.writeByte(netPack,1)	--得到什么奖励
--	DataPack.writeUInt(netPack,cfg.Award[luckNumber].award[1].id)  --直接发得到的id
--	DataPack.flush(netPack)
--	--通知前端改变次数
--	YuanGuFanPaiInfo(sysarg)
--end
--
--MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cyuanGuFanPai, YuanGuFanPaiHandle)

YuanGuFanPaiHandle = function( sysarg, msgid, packet )
	--三转以上才能打开面板
	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	if nCircle<3 then 
		return 
	end
	
	local nType = DataPack.readByte(packet)
	if	nType== 0 then --获得信息
		YuanGuFanPaiInfo(sysarg)
	elseif nType== 1 then --立即翻牌/重置翻牌
		InitYuanGuFanPai(sysarg) 
	elseif nType== 2 then	--翻牌
		DoYuanGuFanPai(sysarg,DataPack.readByte(packet))
	elseif nType== 3 then --给奖励
		GievYuanGuFanPaiAward(sysarg)
	end
end

--获取信息
function YuanGuFanPaiInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.days.FanPaiTime==nil then  var.days.FanPaiTime=0 end	--翻牌次数，这个是要做跨服处理的 , 跨天的时候要主动/请求更新数据的
	if var.days.FanPaiTimeDang ==nil then var.days.FanPaiTimeDang =0 end --翻牌剩余档数
	
	--有剩余的档数，但是没有奖品(立即翻牌时候出错，只能写个命令，让var.days.FanPaiTimeDang=0了)
	if var.days.FanPaiTimeDang~=0 then
		for j=1,#YuanGuFanPaiCfg do 
			if var.days.randFanPaiAward==nil or var.days.randFanPaiAward[j]==nil then 
				--要是出错了，把剩余的翻牌档数清了
				var.days.FanPaiTimeDang = 0
				System.trace(string.format("nofanpaiInfo , userid=%d",Actor.getIntProperty(sysarg, PROP_ENTITY_ID)))
				return 
			end
		end
	end
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.syuanGuFanPai)
	DataPack.writeByte(netPack,0)	--总信息
	DataPack.writeByte(netPack,var.days.FanPaiTime)	--翻牌次数
	--print("var.days.FanPaiTime="..var.days.FanPaiTime)
	--print("var.days.FanPaiTimeDang="..var.days.FanPaiTimeDang)
	DataPack.writeByte(netPack,var.days.FanPaiTimeDang)	--翻牌剩余档数
	if var.days.FanPaiTimeDang~=0 then
		--print("YuanGuFanPaiCfg[6-var.days.FanPaiTimeDang].needYB="..YuanGuFanPaiCfg[6-var.days.FanPaiTimeDang].needYB)
		DataPack.writeUInt(netPack,YuanGuFanPaiCfg[6-var.days.FanPaiTimeDang].needYB)	--元宝
		
		--翻牌的奖励id
		for j=1,#YuanGuFanPaiCfg do 
			DataPack.writeUInt(netPack,YuanGuFanPaiCfg[j].Award[var.days.randFanPaiAward[j]].award[1].id)
			DataPack.writeUInt(netPack,YuanGuFanPaiCfg[j].Award[var.days.randFanPaiAward[j]].award[1].count)
			--print("YuanGuFanPaiCfg[j].Award[var.days.randFanPaiAward[j]].award[1].id="..YuanGuFanPaiCfg[j].Award[var.days.randFanPaiAward[j]].award[1].id)
		end
		
		
		--这牌是否已经翻过
		if var.days.FanPaihasOpen==nil then var.days.FanPaihasOpen={} end 
		for j=1,#YuanGuFanPaiCfg do 
			if var.days.FanPaihasOpen[j]==nil then 
				var.days.FanPaihasOpen[j] = 0
			end
		end
		
		for j=1,#YuanGuFanPaiCfg do 
			if var.days.FanPaihasOpen[j] == 0 then 
				--print("var.days.FanPaihasOpen[j]="..var.days.FanPaihasOpen[j])
				DataPack.writeByte(netPack,0)
			else 
				--print("var.days.FanPaihasOpen[j]="..var.days.FanPaihasOpen[j])
				DataPack.writeByte(netPack,var.days.FanPaihasOpen[j])
			end

			--print("var.days.FanPaihasOpen[j]="..var.days.FanPaihasOpen[j])
		end
	end
	DataPack.flush(netPack)
end


--翻牌
function DoYuanGuFanPai(sysarg,index)
	
	index = tonumber(index)
	--非法参数
	if index<0 or index>#YuanGuFanPaiCfg then
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	--不能翻同一张牌,这张已经记录翻过
	if var.days.FanPaihasOpen==nil then var.days.FanPaihasOpen={} end 
	if var.days.FanPaihasOpen[index]~=nil and var.days.FanPaihasOpen[index]~= 0 then 
		return 
	end

	if var.days.FanPaiTimeDang ==nil then var.days.FanPaiTimeDang =0 end --翻牌剩余档数

	if var.days.FanPaiTimeDang==0 then 
		Actor.sendTipmsg(sysarg,"没有了翻牌的次数",ttFlyTip)
		FanPaiIsSuccess(sysarg,0)
		return 
	end
	
	--当前第几档
	local nowDang = 6-var.days.FanPaiTimeDang
	
	--没有随机到奖励
	if var.days.randFanPaiAward==nil or var.days.randFanPaiAward[nowDang]==nil then 
		return 
	end
	
	--配置不对了
	if YuanGuFanPaiCfg[nowDang]==nil then 
		return 
	end
	
	--print("nowDang="..nowDang)
	--print("var.days.randFanPaiAward[nowDang]="..var.days.randFanPaiAward[nowDang])
	--背包不足
	if not Awards.CheckBagGridCount(sysarg,YuanGuFanPaiCfg[nowDang].Award[var.days.randFanPaiAward[nowDang]].award) then
		FanPaiIsSuccess(sysarg,0)
		return
	end
	
	--判断金钱是否足够
	if YuanGuFanPaiCfg[nowDang].needYB~=0 then 
		if Actor.changeMoney(sysarg, 3, -YuanGuFanPaiCfg[nowDang].needYB, LogIds.yuangufanpai, "远古翻牌") == false then
			Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
			FanPaiIsSuccess(sysarg,0)
			return -- 元宝不足
		end
	end
	
	--记录
	var.days.FanPaiTimeDang = var.days.FanPaiTimeDang -1
	--var.days.FanPaihasOpen[index]=YuanGuFanPaiCfg[nowDang].Award[var.days.randFanPaiAward[nowDang]].award[1].id
	var.days.FanPaihasOpen[index]=nowDang
	
	--发奖励
	var.YGFPAwardNow1 = nowDang
	var.YGFPAwardNow2 = var.days.randFanPaiAward[nowDang]
	--Awards.Give(sysarg, YuanGuFanPaiCfg[nowDang].Award[var.days.randFanPaiAward[nowDang]].award, LogIds.yuangufanpai, "远古翻牌")
	
	--翻牌成功
	FanPaiIsSuccess(sysarg,1)
end

--翻牌和奖励分开
function GievYuanGuFanPaiAward(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.YGFPAwardNow1==nil then
		return 
	end
	if var.YGFPAwardNow2==nil then
		return 
	end
	
	--print("var.YGFPAwardNow1="..var.YGFPAwardNow1)
	--print("var.YGFPAwardNow2="..var.YGFPAwardNow2)
	Awards.Give(sysarg, YuanGuFanPaiCfg[var.YGFPAwardNow1].Award[var.YGFPAwardNow2].award, LogIds.yuangufanpai, "远古翻牌")
	
	var.YGFPAwardNow1=nil
	var.YGFPAwardNow2=nil
end

--发送翻牌是否成功的信息
function FanPaiIsSuccess(sysarg,n)
	n=tonumber(n)
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.syuanGuFanPai)
	DataPack.writeByte(netPack,1)	
	DataPack.writeByte(netPack,n)
	DataPack.flush(netPack)
end


--立即翻牌/重置翻牌
function InitYuanGuFanPai(sysarg)	
	local var = Actor.getStaticVar(sysarg)
	if var.days.FanPaiTime==nil then  var.days.FanPaiTime=0 end	--翻牌次数，这个是要做跨服处理的 , 跨天的时候要主动/请求更新数据的
	if var.days.FanPaiTimeDang ==nil then var.days.FanPaiTimeDang =0 end --翻牌剩余档数
	
	--print("FanPaiTime="..var.days.FanPaiTime)
	
	if var.days.FanPaiTime==0 then 
		Actor.sendTipmsg(sysarg,"没有了重置翻牌的次数",ttFlyTip)
		return 
	end
	
	var.days.FanPaiTime = var.days.FanPaiTime -1 
	var.days.FanPaiTimeDang = 5 
	
	--随机，随5个东西(记录一个index)
	var.days.randFanPaiAward = {}  
	--记录那个牌是翻过的(记录一个index)
	var.days.FanPaihasOpen = {}

	for j=1,#YuanGuFanPaiCfg do 
		local luckNumber = 0
		local randTime =0
		while luckNumber==0 do 
			randTime = randTime + 1
			--死循环
			if randTime==50 then 
				luckNumber =1
				break --跳出死循环，选择第一个
			end
			for i=1,#YuanGuFanPaiCfg[j].Award do 
				local randNumber = System.getRandomNumber(YuanGuFanPaiCfg[j].Award[i].weight)
				if randNumber==0 then --抽到号码了
					local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX);
					if YuanGuFanPaiCfg[j].Award[i].sex ==nil or (YuanGuFanPaiCfg[j].Award[i].sex ~=nil and YuanGuFanPaiCfg[j].Award[i].sex == nSex) then --奖品分性别，并且性别相同
						luckNumber = i
						var.days.randFanPaiAward[j]=luckNumber   --记录每一个是配置中的什么
						break 
					end
				end
			end
		end
	end
	
	--没有牌是翻过的
	for j=1,#YuanGuFanPaiCfg do 
		var.days.FanPaihasOpen[j]=0
	end
	
	--告诉前端翻牌成功
	YuanGuFanPaiInfo(sysarg)
end

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cyuanGuFanPai, YuanGuFanPaiHandle)

--用于测试
function addfantai(sysarg,n)
	n = tonumber(n)
	local var = Actor.getStaticVar(sysarg)
	var.days.FanPaiTime = n
end