--#include "data\config\activity\JingJiLiBao.lua" once

--获取信息
HandleJingjiLiBaoNew =function( sysarg, msgid, packet )
	local n = DataPack.readByte(packet)
	if n==1 then --请求前两个的信息
		sendTheJingJiInfoToClient(sysarg,1)
	elseif n==2 then --请求前后面那个的信息
		sendTheJingJiInfoToClient(sysarg,2)
	elseif n==0 then 
		--领取奖励
		-- 从 1 开始
		local awardType = DataPack.readByte(packet)
		-- 从 1 开始
		local awardIndex = DataPack.readByte(packet)
		GiveJingjiLiBaoNewAward(sysarg, awardType, awardIndex)
	end
end


function GiveJingjiLiBaoNewAward (sysarg, awardType, awardIndex)	
	--非法的
	if awardType<1 or awardType>3 then 
		return 
	end
	
	if awardIndex<1 or awardIndex>5 then 
		return 
	end
	
	--非指定时间不开启
--	local svar = System.getStaticVar()
--	if svar.tehuinewday == nil then return end
    local nDay = System.getDaysSinceOpenServer()
	if awardType==1 or awardType==2 then 
		local cfg = JingjiLiBaoAward[1]
		if nDay < cfg.openTime[1] or nDay > cfg.openTime[2] then
			return
		end
	elseif  awardType==3 then 
		local cfg = JingjiLiBaoAward[3]
		if nDay < cfg.openTime[1] or nDay > cfg.openTime[2] then
			return
		end
	end
	--数值初始化
	local sVar = System.getStaticVar()
	if sVar.allShenJingji ==nil then 
		sVar.allShenJingji ={}
	end
	--for i=1,10 do 
	--	if sVar.allShenJingji[i]==nil then 
	--		sVar.allShenJingji[i] = 0
	--	end
	--end
	for i=1,5 do 
		if sVar.allShenJingji[i]==nil then 
			sVar.allShenJingji[i] = 0
		end
	end
	
	
	if sVar.allBaoshijingji ==nil then 
		sVar.allBaoshijingji ={}
	end
	for i=1,5 do 
		if sVar.allBaoshijingji[i]==nil then 
			sVar.allBaoshijingji[i] = 0
		end
	end
	
		
	
	--剩余名额
	if awardType==1 or awardType==2 then 
		--if JingjiLiBaoAward[awardType].list[awardIndex].quota-sVar.allShenJingji[5*(awardType-1)+awardIndex]<=0  then 
		--	Actor.sendTipmsg(sysarg, "名额已经满了，无法再领取", ttFlyTip)
		--	return 
		--end
		if JingjiLiBaoAward[1].list[awardIndex].quota-sVar.allShenJingji[awardIndex]<=0  then 
			Actor.sendTipmsg(sysarg, "名额已经满了，无法再领取", ttFlyTip)
			return 
		end
		
		
	elseif  awardType==3 then 
		if JingjiLiBaoAward[3].list[awardIndex].quota-sVar.allBaoshijingji[awardIndex]<=0  then 
			Actor.sendTipmsg(sysarg, "名额已经满了，无法再领取", ttFlyTip)
			return 
		end
	end
	
	
	--是否已经领取过
	local var = Actor.getStaticVar(sysarg)
	if awardType==1 or awardType==2 then 
		--local bitIdx = (awardType - 1) * 5 + (awardIndex - 1)
		local bitIdx = awardIndex - 1
		
		local f = System.getIntBit(var.ShenJingjiFlags, bitIdx)
		if f ~= 0 then 
			Actor.sendTipmsg(sysarg, "已经领取过奖励，无法再领取", ttFlyTip)
			return 
		end
	else
		local bitIdx = awardIndex - 1
		local f = System.getIntBit(var.BaoShijingjiFlags, bitIdx)
		if f ~= 0 then 
			Actor.sendTipmsg(sysarg, "已经领取过奖励，无法再领取", ttFlyTip)
			return 
		end
	end
	
	--是否有资格领取
	if CheckEoughtCon(sysarg,awardType,awardIndex)== false then 
		Actor.sendTipmsg(sysarg, "还没达到要求，无法再领取", ttFlyTip)
		return 
	end
	
	
	--是否够背包位置领取
	if Awards.CheckBagGridCount(sysarg, JingjiLiBaoAward[awardType].list[awardIndex].award) == false then 
		return 
	end
	
	Actor.sendTipmsg(sysarg,"领取了奖励",ttFlyTip)
	--修改名额
	if awardType==1 or awardType==2 then 
		--sVar.allShenJingji[5*(awardType-1)+awardIndex]= sVar.allShenJingji[5*(awardType-1)+awardIndex]+1
		sVar.allShenJingji[awardIndex]= sVar.allShenJingji[awardIndex]+1
		
	elseif  awardType==3 then 
		sVar.allBaoshijingji[awardIndex] = sVar.allBaoshijingji[awardIndex] +1
	end
	
	--设置标记位
	if awardType==1 or awardType==2 then 
		--local bitIdx = (awardType - 1) * 5 + (awardIndex - 1) -- 每个活动预留 5 位
		local bitIdx = awardIndex - 1 -- 每个活动预留 5 位
		var.ShenJingjiFlags = System.setIntBit(var.ShenJingjiFlags, bitIdx, true)
		
	elseif  awardType==3 then 
		local bitIdx = awardIndex - 1 -- 每个活动预留 5 位
		var.BaoShijingjiFlags = System.setIntBit(var.BaoShijingjiFlags, bitIdx, true)
	end
	
	--给他奖励
	local str = "神器神甲竞技"
	if awardType==2 then	
		--str = "神甲竞技"
	elseif awardType==3 then
		str = "镶宝石竞技"
	end
	
	if Awards.Give(sysarg, JingjiLiBaoAward[awardType].list[awardIndex].award,LogIds.jingjilibaoNew,awardIndex..str) == false then 
		return 
	end
	
	--给前端发协议
	if awardType==1 or awardType==2 then
		sendTheJingJiInfoToClient(sysarg,1)
	else 	
		sendTheJingJiInfoToClient(sysarg,2)
	end
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家达成了 %s 的竞技条件,领取了丰富的奖励,<我也要领取/@@showWin,210>",Actor.getName(sysarg),JingjiLiBaoAward[awardType].list[awardIndex].name), ttChatWindow)
	
end

function CheckEoughtCon(sysarg,awardType,awardIndex)
	if awardType==1 then 
		local shenqiLv = 1 --拥有的神器等级
		for i=5172,5221 do --神器的id
			if Actor.getItemCount(sysarg,i,-1,-1,-1,-1, nil, true)>0 then 
				break
			end
			shenqiLv = shenqiLv + 1
		end
		--if shenqiLv == 51 then  --身上没有神器
		--	return false
		--else 
		--	if shenqiLv >= JingjiLiBaoAward[awardType].list[awardIndex].conditions.params[1] then 
		--		return true
		--	end
		--end
		if shenqiLv == 51 then
			shenqiLv= 0
		end
		
		
		local shenqiLv2 = 1 --拥有的神甲等级
		local a=5222
		local b=5271
		if Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)== 1 then --男女的性别不一样，神甲id不一样
			a = 5272
			b = 5321  
		end
		for i=a,b do --神甲的id
			if Actor.getItemCount(sysarg,i,-1,-1,-1,-1, nil, true)>0 then 
				break
			end
			shenqiLv2 = shenqiLv2 + 1
		end
		--if shenqiLv2 == 51 then  --身上没有神甲
		--	return false
		--else 
		--	if shenqiLv2 >= JingjiLiBaoAward[awardType].list[awardIndex].conditions.params[1] then 
		--		return true
		--	end
		--end
		if shenqiLv2 == 51 then
			shenqiLv2= 0
		end
		
		if shenqiLv+shenqiLv2 >= JingjiLiBaoAward[awardType].list[awardIndex].conditions.params[1] then --两件加起来等级超过了
			return true
		end
		
	elseif awardType==2 then 
		--local shenqiLv = 1 --拥有的神甲等级
		--local a=5222
		--local b=5271
		--if Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)== 1 then --男女的性别不一样，神甲id不一样
		--	a = 5272
		--	b = 5321  
		--end
		--for i=a,b do --神甲的id
		--	if Actor.getItemCount(sysarg,i,-1,-1,-1,-1, nil, true)>0 then 
		--		break
		--	end
		--	shenqiLv = shenqiLv + 1
		--end
		--if shenqiLv == 51 then  --身上没有神甲
		--	return false
		--else 
		--	if shenqiLv >= JingjiLiBaoAward[awardType].list[awardIndex].conditions.params[1] then 
		--		return true
		--	end
		--end
	elseif  awardType==3 then 
		if Actor.getEquipSlotGemAllLevel(sysarg)>=JingjiLiBaoAward[awardType].list[awardIndex].conditions.params[1] then 
			return true
		end
	end
	return false
end

function sendTheJingJiInfoToClient(sysarg,index)
	local svar = System.getStaticVar()
	--if svar.tehuinewday == nil then return end
	local nDay = System.getDaysSinceOpenServer()
	if index==1 then 
		local cfg = JingjiLiBaoAward[1]
		if nDay < cfg.openTime[1] or nDay > cfg.openTime[2] then
			return
		end
		
		--发送还有多少个领，和玩家的领取标记
		local sVar = System.getStaticVar()
		if sVar.allShenJingji ==nil then 
			sVar.allShenJingji ={}
		end
		
		local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sJingJiLiBao)
		DataPack.writeByte(netPack,1)

		--for i = 1, 10 do --一共有2个活动	
		--	if sVar.allShenJingji[i]==nil then sVar.allShenJingji[i]=0 end
		--	local j = 1
		--	local k = i
		--	if i>=6 then 
		--		j=2 
		--		k=i-5
		--	end
		--	if JingjiLiBaoAward[j].list[k].quota-sVar.allShenJingji[i]>0 then 
		--		DataPack.writeWord(netPack, JingjiLiBaoAward[j].list[k].quota-sVar.allShenJingji[i])  --剩余多少个
		--	else 
		--		DataPack.writeWord(netPack,0)
		--	end
		--end
		
		--因为改了需求，神器神甲合在一起了------------------------
		for i = 1, 5 do --一共有1个活动
			if sVar.allShenJingji[i]==nil then sVar.allShenJingji[i]=0 end
			if JingjiLiBaoAward[1].list[i].quota-sVar.allShenJingji[i]>0 then 
				DataPack.writeWord(netPack, JingjiLiBaoAward[1].list[i].quota-sVar.allShenJingji[i])  --剩余多少个
			else 
				DataPack.writeWord(netPack,0)
			end
		end
		--因为改了需求，神器神甲合在一起了------------------------
		
		-- 玩家领取标志
		local var = Actor.getStaticVar(sysarg)
		if var.ShenJingjiFlags == nil then 
			DataPack.writeUInt(netPack, 0)
		else 
			DataPack.writeUInt(netPack, var.ShenJingjiFlags)
		end			
		DataPack.flush(netPack)
		
	elseif index ==2 then 
	
		local cfg = JingjiLiBaoAward[3]
		if nDay < cfg.openTime[1] or nDay > cfg.openTime[2] then
			return
		end
		
		--发送还有多少个领，和玩家的领取标记
		local sVar = System.getStaticVar()
		if sVar.allBaoshijingji ==nil then 
			sVar.allBaoshijingji ={}
		end
		
		local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sJingJiLiBao)
		DataPack.writeByte(netPack,2)
		
		for i = 1, 5 do --一共有1个活动
			if sVar.allBaoshijingji[i]==nil then sVar.allBaoshijingji[i]=0 end
			if JingjiLiBaoAward[3].list[i].quota-sVar.allBaoshijingji[i]>0 then 
				DataPack.writeWord(netPack, JingjiLiBaoAward[3].list[i].quota-sVar.allBaoshijingji[i])  --剩余多少个
			else 
				DataPack.writeWord(netPack,0)
			end
		end
		
		-- 玩家领取标志
		local var = Actor.getStaticVar(sysarg)
		if var.BaoShijingjiFlags == nil then 
			DataPack.writeUInt(netPack, 0)
		else 
			DataPack.writeUInt(netPack, var.BaoShijingjiFlags)
		end			
		DataPack.flush(netPack)
	end
	
end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cJingJiLiBao, HandleJingjiLiBaoNew)

function mangbaoshi(sysarg)
	for i=1,20 do 
		for j=1,6 do 
			Actor.setEquipSlotGemLevel(sysarg,i,j,5)
		end 
	end
end