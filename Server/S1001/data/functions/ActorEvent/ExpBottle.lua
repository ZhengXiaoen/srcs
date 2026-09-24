--#include "data\config\activityconfig\ExpBottleconfig.lua" once
--经验瓶子
--配置


--前端发送消息
ExpBottle = function(sysarg, msgid, packet)
--[[   先屏蔽经验瓶，以免被刷协议

	--local types = packet
	local types = DataPack.readByte(packet)
	--请求剩余时间和第几次
	if types == 1 then  
		SendCanGetExpBottle(sysarg)
	--领取经验
	elseif types == 2 then 
		--开区时间
		--local openServerDay = System.getDaysSinceOpenServer() 
		--if openServerDay ~= ExpBottleconfig.day then 
		--	Actor.sendTipmsg(sysarg,"并不是开区第一天,领取失败", ttFlyTip) 
		--	return 
		--end
		--等级
		local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
		if pLv<ExpBottleconfig.level then 
			Actor.sendTipmsg(sysarg,"角色等级不足"..ExpBottleconfig.level.."级,领取失败", ttFlyTip) 
			return 
		end
		--领取剩余次数	
		local var = Actor.getStaticVar(sysarg)
		if var.expBottleLeft == nil then 
			var.expBottleLeft = ExpBottleconfig.giveTime 
		end
		if var.expBottleLeft == 0 then
			Actor.sendTipmsg(sysarg,"已经没有剩余次数了,领取失败", ttFlyTip) 
			return 
		end

		--空 or 过了多少时间<第n次需要多少时间 
		--print("System.getCurrMiniTime()-var.EBTime="..System.getCurrMiniTime()-var.EBTime)
		--print("(第n次需要多少时间)ExpBottleconfig.giveTime-var.expBottleLeft+1="..ExpBottleconfig.giveTime-var.expBottleLeft+1)
		--print("ExpBottleconfig.giveEveryTime[ExpBottleconfig.giveTime-var.expBottleLeft+1]="..ExpBottleconfig.giveEveryTime[ExpBottleconfig.giveTime-var.expBottleLeft+1])
		local index = ExpBottleconfig.giveTime-var.expBottleLeft+1
		if index<1 or index >6 then 
			return 
		end
		--未到领取时间
		if var.EBTime ==nil  or System.getCurrMiniTime()-var.EBTime < ExpBottleconfig.giveEveryTime[index] then
			Actor.sendTipmsg(sysarg,"还没到领取时间", ttFlyTip) 
			return 
		end
		
		local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        System.sendCommonLog(LogIds.expbottgivecount,nActorId,Actor.getName(sysarg),0,0,0,"领取次数:"..ExpBottleconfig.giveTime - var.expBottleLeft);
		
		System.broadcastTipmsg(string.format("<(n%s)>玩家领取了经验瓶在线奖励：获得%s经验，等级刷刷提升~",Actor.getName(sysarg), ExpBottleconfig.giveExp[index]),ttChatWindow);
		var.expBottleLeft = var.expBottleLeft -1
		var.EBTime=System.getCurrMiniTime()
		Actor.addExp(sysarg,ExpBottleconfig.giveExp[index])
		Actor.sendTipmsg(sysarg,"领取成功", ttFlyTip) 
		GetExpBottleSuccess(sysarg)
	end
	--]]
	
end

--后端发送消息,打开面板
SendCanGetExpBottle = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	--开始计算的时间
	if var.EBTime ==nil  then 
		return 
	end
	--剩余次数
	if var.expBottleLeft == nil then 
		var.expBottleLeft = ExpBottleconfig.giveTime
	end
	
	--第几次 = 总次数 -剩余次数 +1
	local index = ExpBottleconfig.giveTime-var.expBottleLeft+1
	if index<1 or index >6 then 
	
		local npack = DataPack.allocPacket(sysarg,139,229)
		DataPack.writeByte(npack,1)
		DataPack.writeByte(npack,var.expBottleLeft)  --剩余次数
		DataPack.writeUint64(npack,0)  --剩余时间
		DataPack.writeUInt(npack,0)  --经验
		DataPack.flush(npack)  
		
		return 
	end
	
	--剩余时间 = 第几次的时间 -  过了多长时间
	local leftTime = ExpBottleconfig.giveEveryTime[index]-(System.getCurrMiniTime()-var.EBTime)
	if leftTime<0 then 
		leftTime = 0 
	end
	
	local exps = ExpBottleconfig.giveExp[index]
	
	--print("System.getCurrMiniTime()-var.EBTime"..System.getCurrMiniTime()-var.EBTime)
	local npack = DataPack.allocPacket(sysarg,139,229)
	DataPack.writeByte(npack,1)
	DataPack.writeByte(npack,var.expBottleLeft)  --剩余次数
	DataPack.writeUint64(npack,leftTime)  --剩余时间
	DataPack.writeUInt(npack,exps)  --经验
	DataPack.flush(npack)  
end

--后端发送消息，领取成功
GetExpBottleSuccess = function(sysarg)
	local npack = DataPack.allocPacket(sysarg,139,229)
	DataPack.writeByte(npack,2)
	DataPack.flush(npack)  
end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cExpBottle, ExpBottle)