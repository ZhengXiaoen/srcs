--元旦活动
--#include "data\config\activity\NeujahrCfg.lua" once

-- 是否在父情节活动时间内
function is_Neujahr_time()	
	local time = NeujahrCfg.time
	return System.isInDateRange(time[1], time[2], time[3], 0, 0, 0, time[4], time[5], time[6], 23, 59, 59)
end

NeujahrActivityHandle = function (sysarg, sysid, packet)

	--是否在元旦活动时间内
	if is_Neujahr_time()==false then 	
		return 
	end
	
	local msgid = DataPack.readByte(packet)
	
	if msgid == 0 then	--获取数据
		GetTheNeujahrActivityInfo(sysarg,DataPack.readByte(packet))
	elseif msgid == 1 then --登录礼包
		GetNeujahrActivityLoginGift(sysarg)
	elseif msgid == 2 then --充值礼包
		GetNeujahrActivityChongZhiGift(sysarg)
	elseif msgid == 4 then --兑换灯笼
		GetNeujahrActivityDuiHuan(sysarg,DataPack.readByte(packet))
	end
end

GetNeujahrActivityLoginGift = function (sysarg)

	--是否在元旦活动时间内
	if is_Neujahr_time()==false then 	
		return 
	end
	--没有配置
	local award = NeujahrCfg.LoginGift.award
	if not award then 
		print("The NeujahrCfg Login Award Config is nil ,Read file error")
		return  
	end
	
	--判断是否领取过
	local var = Actor.getStaticVar(sysarg)
	if var.days.YDLoginGift ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.NeujahrActivitys,"元旦活动登录奖励")
	if bResult == false then
		print("Neujahr Login Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.YDLoginGift = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)

	--提示
	System.sendCommonLog(LogIds.NeujahrActivitys,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"元旦活动登录奖励")

	GetTheNeujahrActivityInfo(sysarg,1)
	--和前端对接
end

GetNeujahrActivityChongZhiGift= function (sysarg)
	--是否在元旦活动时间内
	if is_Neujahr_time()==false then 	
		return 
	end
	
	--没有配置
	local award = NeujahrCfg.ChongZhiGift[1].award
	if not award then 
		print("The NeujahrCfg ChongZhi Award Config is nil ,Read file error")
		return  
	end
	
	--充值不够
	local var = Actor.getStaticVar(sysarg)
	local nPeyCount = var.days.PeyNum
	if not nPeyCount then 
		Actor.sendTipmsg(sysarg,string.format("你今天充值不足%s元宝，无法领取奖励",NeujahrCfg.ChongZhiGift[1].needChongzhiYB),ttFlyTip)
		return
	elseif nPeyCount < NeujahrCfg.ChongZhiGift[1].needChongzhiYB then
		Actor.sendTipmsg(sysarg,string.format("你今天充值不足%s元宝，无法领取奖励",NeujahrCfg.ChongZhiGift[1].needChongzhiYB),ttFlyTip)
		return
	end
	
	
	--判断是否领取过
	if var.days.YDChongZhiGift ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.NeujahrActivitys,"元旦充值礼包")
	if bResult == false then
		print("Neujahr ChongZhi Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.YDChongZhiGift = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	--System.broadcastTipmsg(string.format("玩家<(n%s)>领取合服活动的登陆礼包,<我也要领取/@@showWin,197,0>",Actor.getName(sysarg)),ttChatWindow)
	--提示
	System.sendCommonLog(LogIds.NeujahrActivitys,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"元旦充值礼包")

	GetTheNeujahrActivityInfo(sysarg,2)
	--和前端对接
end


--兑换灯笼
GetNeujahrActivityDuiHuan = function(sysarg,index)
	--是否在元旦活动时间内
	if is_Neujahr_time()==false then 	
		return 
	end
			
	--判断index是否合法
	if index<1 or index>#NeujahrCfg.JiYanHua then 
		return 
	end
	
	--判断是否有足够的位置容纳奖品
	if not Awards.CheckBagGridCount(sysarg, NeujahrCfg.JiYanHua[index].award) then
		return 
	end
	
	
	--判断所需的烟花是否足够
	if Actor.getItemCount(sysarg,NeujahrCfg.JiYanHua[index].YanHuaId)<NeujahrCfg.JiYanHua[index].needItemCount then  
		Actor.sendTipmsg(sysarg,"灯笼不够",ttFlyTip)
		return 
	end
	
	--判断是否已经兑换过
	local var = Actor.getStaticVar(sysarg)
	if var.days.YDDengLong==nil then var.days.YDDengLong={} end
	if var.days.YDDengLong[index]~=nil and var.days.YDDengLong[index]==1 then 
		Actor.sendTipmsg(sysarg,"一天只能兑换一次",ttFlyTip)
		return 
	end
	
	var.days.YDDengLong[index]=1
    
	--扣除烟花
	Actor.removeItem(sysarg,NeujahrCfg.JiYanHua[index].YanHuaId,NeujahrCfg.JiYanHua[index].needItemCount)
	
	--给奖励
	Awards.Give(sysarg, NeujahrCfg.JiYanHua[index].award, LogIds.NeujahrActivitys,index.."兑换灯笼")
	--记录下来
	System.sendCommonLog(LogIds.NeujahrActivitys,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,index.."兑换灯笼")
	
	--发协议给前端
	GetTheNeujahrActivityInfo(sysarg,4)
    
	System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家集齐了<(c0xFFff0900)灯笼*%s>兑换获得<(c0xFFff0900)%s>大奖!<我也要领取/@@showWin,199,3>",Actor.getName(sysarg),NeujahrCfg.JiYanHua[index].needItemCount,NeujahrCfg.JiYanHua[index].txt), ttChatWindow)
	
	--第4个全平台更新
	if index==4 then 
		local szLocalServer=""
		local nLocalServerId = System.getLocalServerId()
								
		if  nLocalServerId >= 50000 and nLocalServerId <= 59999 then
			szLocalServer = "不删档"..(nLocalServerId - 50000)
		else
			szLocalServer = nLocalServerId
		end
		System.SendPlatformMsg(string.format("恭喜<(c0xFF00c0ff)%s区>玩家<(n%s)>集齐了<(c0xFFff0900)灯笼*%s>兑换获得<(c0xFFff0900)%s>大奖!",szLocalServer,Actor.getName(sysarg),NeujahrCfg.JiYanHua[index].needItemCount,NeujahrCfg.JiYanHua[index].txt), ttMousePosTip)
	end
end

GetTheNeujahrActivityInfo = function(sysarg,index)
	local var = Actor.getStaticVar(sysarg)
	if index== 1 then
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNeujahrActivity)
        DataPack.writeByte(netPack,1)
		if (var.days.YDLoginGift ==nil) then 
			DataPack.writeByte(netPack,1)
		else 
			DataPack.writeByte(netPack,0)
		end
        DataPack.flush(netPack)
	elseif index== 2 then
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNeujahrActivity)
        DataPack.writeByte(netPack,2)
		if (var.days.YDChongZhiGift ==nil) then 
			DataPack.writeByte(netPack,1)
		else 
			DataPack.writeByte(netPack,0)
		end
        DataPack.flush(netPack)
	elseif index== 4 then
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sNeujahrActivity)
		DataPack.writeByte(netPack,4)
		
		local var = Actor.getStaticVar(sysarg)
		if var.days.YDDengLong==nil then var.days.YDDengLong={} end
		for i=1,#NeujahrCfg.JiYanHua do 
			if var.days.YDDengLong[i]~=nil and var.days.YDDengLong[i]==1 then 
				DataPack.writeByte(netPack,1)
			else 
				DataPack.writeByte(netPack,0)
			end
		end
		DataPack.flush(netPack)
		
	end	
end




NeujahrActivityQuanFuShuangbei_OPEN = function()
	if is_Neujahr_time()==false then 	
		return 
	end
	
	local RwData = {"我要挂机", "威龙城", 131,134, "我要挂机"}
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg("元旦双倍经验活动已经开启",ttChatWindow )
	System.broadcastTipmsg("元旦双倍经验活动已经开启",ttScreenCenter )
	System.setActivtyExpRate(1, 0)
	
end

NeujahrActivityQuanFuShuangbei_CLOSE = function()
	if is_Neujahr_time()==false then 	
		return 
	end
	
	System.broadcastTipmsg("元旦双倍经验活动已经结束。", ttScreenCenter)
	System.broadcastTipmsg("元旦双倍经验活动已经结束。", ttChatWindow)
	System.setActivtyExpRate(0, 0)
	--告诉前端
end




MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cNeujahrActivity,NeujahrActivityHandle) --元旦活动