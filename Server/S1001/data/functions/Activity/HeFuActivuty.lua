--新的合服活动
--2017/6/6
--#include "data\config\activity\HeFuconfig.lua" once

handleHeFuActivity = function(sysarg, msgid, packet)
	-- 是否在合服时间内
	local CombineDays = System.getDaysSinceCombineServer()
	if CombineDays > 5 or CombineDays <= 0 then 	
		return 
	end
	
	local nMergerType = DataPack.readByte(packet)   --合服活动类型
	if nMergerType == 0 then --请求数据
		SendHFTheInfo(sysarg,DataPack.readByte(packet))
	elseif nMergerType == 1 then  --登录的数据
		GetHeFuLoginGift(sysarg)
	elseif nMergerType ==4 then   --每日充值的数据
		HeFuMeiRiChongZhi(sysarg,DataPack.readByte(packet))
	elseif nMergerType ==7 then   --特惠的数据
		HeFuTeHuiLiBao(sysarg,DataPack.readByte(packet),DataPack.readByte(packet))
	elseif nMergerType ==8 then   --寻宝返利
		XunBaoFanLiHandle(sysarg,DataPack.readByte(packet))
	end

end

--合服登录豪礼礼包
function GetHeFuLoginGift(sysarg)
	--print("合服天数:"..System.getDaysSinceCombineServer())
	
	--是否在合服时间内
	local CombineDays = System.getDaysSinceCombineServer()
	if CombineDays > 5 or CombineDays <= 0 then 	
		return 
	end

	--没有配置
	local award = HeFuConfig.LoginAward.award[CombineDays]
	if not award then 
		print("The CombineSever Login Award Config is nil ,Read file error")
		return  
	end

	--等级不够
	if not Actor.checkActorLevel(sysarg,HeFuConfig.LoginAward.needLevel,HeFuConfig.LoginAward.needCircle) then
		Actor.sendTipmsg(sysarg,string.format("等级不够%s级,无法领取",HeFuConfig.LoginAward.needLevel),ttFlyTip)
		return  
	end
	
	--判断是否领取过
	local var = Actor.getStaticVar(sysarg)
	if var.days.CombineLoginGift ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, 1079, CombineDays.."合服登录奖励")
	if bResult == false then
		print("give 合服登录奖励 award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.CombineLoginGift = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	System.broadcastTipmsg(string.format("玩家<(n%s)>领取合服活动的登陆礼包,<我也要领取/@@showWin,197,0>",Actor.getName(sysarg)),ttChatWindow)
	--XX玩家领取合服活动的登陆礼包！我也要领取
	--提示
	System.sendCommonLog(1079,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,CombineDays.."合服登录奖励")
	SendHFTheInfo(sysarg,1)
	--和前端对接
end

--合服充值礼包
function HeFuMeiRiChongZhi(sysarg,index)

	--判断参数
	if index<1 or  index>#HeFuConfig.CumulativeAward then 
		return 
	end
	
	--是否在合服时间内
	local CombineDays = System.getDaysSinceCombineServer()
	if CombineDays > 5 or CombineDays <= 0 then 	
		return 
	end
	local var = Actor.getStaticVar(sysarg)
	
	--充值不够
	local nPeyCount = var.days.PeyNum
	if not nPeyCount then 
		return
	elseif nPeyCount < HeFuConfig.CumulativeAward[index].needCumulative then
		Actor.sendTipmsg(sysarg,string.format("你今天充值不足%s元宝，无法领取奖励",HeFuConfig.CumulativeAward[index].needCumulative),ttFlyTip)
		return
	end
	
	if var.days.HFMeiRiChongZhi2==nil then 
		var.days.HFMeiRiChongZhi2={}
	end
	--判断是否领取过
	if var.days.HFMeiRiChongZhi2[index] ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, HeFuConfig.CumulativeAward[index].award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, HeFuConfig.CumulativeAward[index].award, 1079, CombineDays.."合服充值奖励")
	if bResult == false then
		print("give 合服充值奖励 award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	var.days.HFMeiRiChongZhi2[index] = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	System.broadcastTipmsg(string.format("玩家<(n%s)>领取合服活动的充值礼包,<我也要领取/@@showWin,197,1>",Actor.getName(sysarg)),ttChatWindow)
	System.sendCommonLog(1079,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),index,0,0,CombineDays.."合服充值奖励")
	--提示
	--玩家XXX领取了价值xxx元宝的充值礼包！我也要领取
	
	--和前端对接
	SendHFTheInfo(sysarg,4)
end

--合服特惠礼包
function HeFuTeHuiLiBao(sysarg,index,number)
	local config = HeFuConfig.TeHuiLiBao
	if index<1 or index > #config then return end --没有这个配置
	if number<1 or number > #config[index].award then return end --没有这个配置
	
	
	--是否在合服时间内
	local CombineDays = System.getDaysSinceCombineServer()
	if CombineDays > 5 or CombineDays <= 0 then 	
		return 
	end
		
	
	--初始化记录
	local var = Actor.getStaticVar(sysarg)
	if var.HFTeHuiLiBao ==nil then 
		var.HFTeHuiLiBao ={}
	end
	for i=1,#config do 
		if var.HFTeHuiLiBao[i] == nil then 
			var.HFTeHuiLiBao[i] = {}
		end
	end
	
	
	--看看是否前一档已经买了
	if index~=1 then 
		if var.HFTeHuiLiBao[index-1][number] ==nil or var.HFTeHuiLiBao[index-1][number] ==0 then
			Actor.sendTipmsg(sysarg,"请先购买前一档",ttFlyTip)
			return 
		end
	end
	
		
	--判断是否购买过
	if var.HFTeHuiLiBao[index][number] ~=nil then 
		Actor.sendTipmsg(sysarg,string.format("每天只能购买一次,您已经购买过了,不能重复购买"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, config[index].award[number]) then
		return 
	end
	
	local needMoneyType = config[index].moneyType

	if Actor.changeMoney(sysarg,needMoneyType,-config[index].award[number][1].needMoney,1079, config[index].award[number][1].txt)==false then 
		Actor.sendTipmsg(sysarg, "元宝不足，无法购买", ttFlyTip)
		return 
	end
	
	
	--给奖励
	local bResult = Awards.Give(sysarg, config[index].award[number] ,1079, "合服特惠礼包")
	if bResult == false then
		print("give 合服特惠礼包 award error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	var.HFTeHuiLiBao[index][number] = 1
	
	Actor.sendTipmsg(sysarg,"购买成功",ttFlyTip)
	System.broadcastTipmsg(string.format("玩家<(n%s)>购买了合服活动的特惠礼包,<我也要领取/@@showWin,197,6>",Actor.getName(sysarg)),ttChatWindow)
	System.sendCommonLog(1079,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"","",config[index].award[number][1].txt)

	SendHFTheInfo(sysarg,7)

end


--寻宝返利
function XunBaoFanLiHandle(sysarg,index)
	index= tonumber(index)
	
	local var = Actor.getStaticVar(sysarg)
	
	local config = HeFuConfig.XunBaoFanLi
	if index<1 or index > #config then return end --没有这个配置
	
	--是否在合服时间内
	local CombineDays = System.getDaysSinceCombineServer()
	if CombineDays > 5 or CombineDays <= 0 then 	
		return 
	end
	
	if var.newdays==nil then 
		var.newdays={}
	end
	if var.newdays.XunBaoTime==nil then var.newdays.XunBaoTime=0 end
	
	if  var.newdays.XunBaoTime<config[index].needTime then 
		Actor.sendTipmsg(sysarg,"今天的寻宝次数不足",ttFlyTip)
		return 
	end
	
	if var.newdays.HFXunBanFL==nil then var.newdays.HFXunBanFL={} end 
	if var.newdays.HFXunBanFL[index]~=nil then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, config[index].award) then
		return 
	end
	
	Awards.Give(sysarg,config[index].award ,1079, "合服寻宝返利")

	var.newdays.HFXunBanFL[index]=1

	Actor.sendTipmsg(sysarg,"领取成功",ttFlyTip)

	System.broadcastTipmsg(string.format("玩家<(n%s)>领取了价值%s元宝的探宝返利礼包！<我也要领取/@@showWin,197,7>",Actor.getName(sysarg),config[index].jiazhi),ttChatWindow)

	System.sendCommonLog(1079,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"","",index.."探宝返利")


	SendHFTheInfo(sysarg,8)

end


--开始全服经验
function StartHeFuShuangBeiExp ()
	
	--是否在合服时间内
	local CombineDays = System.getDaysSinceCombineServer()
	if CombineDays > 5 or CombineDays <= 0 then 	
		System.setActivtyExpRate(0, 0)
		return 
	end

	local RwData = {"我要挂机", "威龙城", 131,134, "我要挂机"}
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg("合服双倍经验活动已经开启"..NpctFly,ttChatWindow )
	System.broadcastTipmsg("合服双倍经验活动已经开启",ttScreenCenter )
	System.setActivtyExpRate(1, 0)
	--告诉前端
end

--结束全服双倍经验
function EndHeFuShuangBeiExp ()
	System.broadcastTipmsg("全服双倍经验活动已经结束。", ttScreenCenter)
	System.broadcastTipmsg("全服双倍经验活动已经结束。", ttChatWindow)
	System.setActivtyExpRate(0, 0)
	--告诉前端
end


function SendHFTheInfo(sysarg,index)
	local CombineDays = System.getDaysSinceCombineServer()
	if CombineDays > 5 or CombineDays <= 0 then 	
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	if index ==1 then 
		local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sHeFuActivity)
        DataPack.writeByte(netPack,1)
		if (var.days.CombineLoginGift ==nil) then 
			DataPack.writeByte(netPack,1)
		else 
			DataPack.writeByte(netPack,0)
		end
        DataPack.flush(netPack)
	elseif index ==4 then 
		local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sHeFuActivity)
        DataPack.writeByte(netPack,4)
		if var.days.HFMeiRiChongZhi2==nil then 
			var.days.HFMeiRiChongZhi2={}
		end
		for i=1,#HeFuConfig.CumulativeAward do 
			if (var.days.HFMeiRiChongZhi2[i] ==nil) then 
				DataPack.writeByte(netPack,1)
			else 
				DataPack.writeByte(netPack,0)
			end
		end
        DataPack.flush(netPack)
	elseif index ==7 then 
		
		--再次合服的时候，如果合服时间不相等,把个人数据重置--------
		local csTime = System.getServerCombineTime()
		if csTime == nil or csTime <= 0 then return end		
		if var.hfTime ==nil or  var.hfTime~=csTime then 
			var.hfTime = csTime
				var.HFTeHuiLiBao={}

		end
		--再次合服的时候，如果合服时间不相等,把个人数据重置--------
		
		
	
		if var.HFTeHuiLiBao ==nil then 
			var.HFTeHuiLiBao ={}
		end
		
		for i=1,#HeFuConfig.TeHuiLiBao do 
			if var.HFTeHuiLiBao[i] == nil then 
				var.HFTeHuiLiBao[i] = {}
			end
		end
	
		local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sHeFuActivity)
        DataPack.writeByte(netPack,7)
		local h = #HeFuConfig.TeHuiLiBao
		local w = #HeFuConfig.TeHuiLiBao[1].award
		DataPack.writeByte(netPack,h*w)
		for i=1,#HeFuConfig.TeHuiLiBao do 
			for j=1,#HeFuConfig.TeHuiLiBao[i].award do 
				if (var.HFTeHuiLiBao[i][j] ==nil) then 
					DataPack.writeByte(netPack,1)
				else 
					DataPack.writeByte(netPack,0)
				end
			end
		end
        DataPack.flush(netPack)
	elseif index ==8 then 
		if var.newdays==nil then 
			var.newdays={}
		end
		if var.newdays.XunBaoTime==nil then var.newdays.XunBaoTime=0 end
		
		local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sHeFuActivity)
        DataPack.writeByte(netPack,8)

		DataPack.writeInt(netPack,var.newdays.XunBaoTime)
		
		if var.newdays.HFXunBanFL==nil then var.newdays.HFXunBanFL={} end 
		for i=1,#HeFuConfig.XunBaoFanLi do 
			if var.newdays.HFXunBanFL[i]~=nil then 
				DataPack.writeByte(netPack,0)	--已经领取了
			else 
				DataPack.writeByte(netPack,1)	--可以领取
			end
		end
		DataPack.flush(netPack)
	end
end





MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cHeFuActivity, handleHeFuActivity)