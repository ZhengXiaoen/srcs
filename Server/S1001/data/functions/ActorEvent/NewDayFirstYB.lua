--7日首冲（每日首冲）
--#include "data\config\ActorEvent\NewDayYBAwards.lua" once
function GetNewDayFirstYB(sysarg, sysid, packet)
	--local nType = tonumber(packet) --方便后端测试用的
	
	local nType = DataPack.readByte(packet)
	if nType == 1 then  --获取是否已经领取奖励的信息
		SendNewDayFirstYBInfo(sysarg)
	elseif nType == 2 then --领取奖励
		--local openday = System.getDaysSinceOpenServer()
		--if not (openday>=NewDayYBAwards.startDay and openday<=NewDayYBAwards.endDay ) then 
		--	Actor.sendTipmsg(sysarg,"超过开服可领取天数，不能领取", ttFlyTip) 
		--	return 
		--end
		
		local var = Actor.getStaticVar(sysarg)
		if var.days == nil then var.days = {} end
		if var.days.LivenessData ==nil then 
			var.days.LivenessData={}
		end
		
		--allmeirishouchong要改变，以后就不以这个判断，以开服天数。
		--if var.allmeirishouchong ~=nil and var.allmeirishouchong>=7 then --次数大于7
		--	return 
		--end
		local openServerDay = System.getDaysSinceOpenServer() --开服第8天不能领取
		if openServerDay==1 or openServerDay>7 then 
			return 
		end
		
		if var.days.TodayIsFisrtYb ~=nil and var.days.TodayIsFisrtYb ==1 then  --今日是首冲日，不能领取
			return 
		end
		
		if var.days.LivenessData.meirishouchong == nil or var.days.LivenessData.meirishouchong == 0 then 	
			Actor.sendTipmsg(sysarg,"您今天还没有首充，请充值完再来领取吧", ttFlyTip) 
			return 
		end
		
		if var.days.getND_YBAward ~=nil and var.days.getND_YBAward== 1 then 
			Actor.sendTipmsg(sysarg,"您已经领取了奖励，不能再重复领取", ttFlyTip) 
			return 
		end
		
		--特殊处理跨天问题，不能重复领取奖励，开服有1分钟左右的个人数据不精确跨天
		if var.getND_YBAwards~=nil and var.getND_YBAwards==openServerDay then 
			Actor.sendTipmsg(sysarg,"您已经领取了奖励，不能再重复领取", ttFlyTip) 
			return 
		end
		
		
		--if var.allmeirishouchong ==nil then 
		--	var.allmeirishouchong =0
		--end
	
		--if not Awards.CheckBagGridCount(sysarg, NewDayYBAwards.Awards[var.allmeirishouchong+1]) then
		--	return
		--end
		
		if not Awards.CheckBagGridCount(sysarg, NewDayYBAwards.Awards[openServerDay-1]) then
			return
		end
		
		
		--if var.allmeirishouchong ==nil then --领取的总次数
		--	var.allmeirishouchong =1
		--else 
		--	var.allmeirishouchong = 1 + var.allmeirishouchong 
		--end
				
		var.days.getND_YBAward = 1
		var.getND_YBAwards=openServerDay
		SendNewDayFirstYBInfo(sysarg)
		Awards.Give(sysarg, NewDayYBAwards.Awards[openServerDay-1], LogIds.meirishouchong, openServerDay.."每日首冲礼包")
		
		--Awards.Give(sysarg, NewDayYBAwards.Awards[var.allmeirishouchong], LogIds.meirishouchong, var.allmeirishouchong.."每日首冲礼包")
	end
end

function SendNewDayFirstYBInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.days == nil then var.days = {} end
	if var.days.getND_YBAward ==nil then 
		var.days.getND_YBAward = 0
	end
	
	--if var.allmeirishouchong ==nil then 
	--	var.allmeirishouchong =0
	--end
	
	local needXianShi = 0
	--if var.allmeirishouchong<7 then --少于7次
	--	needXianShi =1
	--end
	
	local openServerDay = System.getDaysSinceOpenServer() 
	if openServerDay~=1 and openServerDay<=7 then --显示状态为1
		needXianShi =1
	end
	
	if var.days.TodayIsFisrtYb ~=nil and var.days.TodayIsFisrtYb ==1 then  --今日是首冲日，不能领取
		needXianShi = 2
	end
	
	if Actor.getActorFlag(sysarg,14) < 1 then  --还没有首冲，不显示
		needXianShi = 0
	end
	local netPack = DataPack.allocPacket(sysarg, 139, 231)
	DataPack.writeByte(netPack,needXianShi)       --第一个参数 按钮是否显示 0，不显示。1显示，2显示出来不可以领取
	DataPack.writeByte(netPack,var.days.getND_YBAward)  --第二个参数 是否领取了 0 未领取， 1已经领取了
	--DataPack.writeByte(netPack,var.allmeirishouchong+1)  --要领取第几次
	DataPack.flush(netPack)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetNewDayFirstYB, GetNewDayFirstYB)