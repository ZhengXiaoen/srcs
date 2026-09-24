--#include "data\config\monster\ChallengeBoss.lua" once

---Boss事件
BossOpFuncList = {}

EventCallDispatcher.handleChallengeBoss = function (sysarg, args)
	--Actor.sendTipmsg(sysarg,"伏魔塔暂时不开放",ttFlyTip)
	if args[1] == nil then return end  
	local func = BossOpFuncList[args[1]]
	if func ~= nil then
		func(sysarg, args) 
	end
end

function checkChallengeBoss(sysarg,config)
	
	--护送皇杆
	local var = Actor.getStaticVar(sysarg)
	if var.ybstate == 1 then
		Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip) 
		return false
	end
	
	--摆摊
	if Actor.hasState(sysarg,esStateStall) then
		Actor.sendTipmsg(sysarg,Lang.stall001.zf137,ttFlyTip)
		return false
	end
	
	--在副本
	if Actor.getFubenId(sysarg) > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf138,ttFlyTip)
		return false 
	end

	--在武林争霸中
	if Actor.getSceneId(sysarg) == 58 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf138,ttFlyTip)
		return false
	end

	if Actor.checkActorLevel(sysarg,config.needLevel) == false then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf198,config.needLevel),ttFlyTip)
		return false
	end
	
	return true
end

function InitBossWind(sysarg,config,FbName)
	
	if not config then return false end
	
	local netPack = DataPack.allocPacket(sysarg, 26, 69)
	if (netPack ~= nil) then
		DataPack.writeString(netPack, FbName or " ")
		DataPack.writeString(netPack, config.DescriptionStr)
		DataPack.writeUInt(netPack, config.FuBenTime)
		DataPack.writeUInt(netPack,0)
		DataPack.writeByte(netPack, 0)
		DataPack.flush(netPack)
	end
end

--挑战BOSS
BossOpFuncList[1] = function(sysarg,args)
	
	local nType = args[2]
	
	if not ChallengeBossConfig then return end
	local BossConfig = ChallengeBossConfig.ChallengeBoss
	if not BossConfig then return end
	local config = BossConfig.BossInfo[nType]
	if not config then return end

	if checkChallengeBoss(sysarg,config) == false then
		return
	end

	
	local var = Actor.getStaticVar(sysarg)
	if not var.days.ChallengeBossNum then
		var.days.ChallengeBossNum = BossConfig.MaxChallengeNum
	elseif var.days.ChallengeBossNum <= 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf203,ttFlyTip)
		return 
	end
	
	if not var.days.FinishChallengeBoss then
		var.days.FinishChallengeBoss = {}
	elseif var.days.FinishChallengeBoss[nType] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf205,ttFlyTip)
		return
	end
	
	local Hfuben = Fuben.createFuBen(config.FuBenId)
	if not Actor.enterFuBen(sysarg, Hfuben,-1,-1,-1) then
		print("Enter FuBen error, Actor id = "..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
		return
	--else
	--	local nHandle = Actor.getSceneHandle(sysarg)
	--	Fuben.createMonster(nHandle,config.BossId,45,40,60)
	end
	
	var.days.ChallengeBossNum = var.days.ChallengeBossNum - 1

	sendChallengeBoss(sysarg)
	local FbName = Fuben.getFubenName(Hfuben)
	InitBossWind(sysarg,config,FbName)
end

--购买挑战BOSS次数
BossOpFuncList[2] = function(sysarg,args)
	
	local nBuyNum = args[2]
	if nBuyNum ~= 1 then return end
		
	local config = ChallengeBossConfig.BuyChallgeBoss

	local var = Actor.getStaticVar(sysarg)
	if not var.days.ChallengeBossNum then
		var.days.ChallengeBossNum = ChallengeBossConfig.ChallengeBoss.MaxChallengeNum
	end
	
	if not var.days.buyChallengeBossNum then
		var.days.buyChallengeBossNum = 0
	elseif var.days.buyChallengeBossNum >= config.MaxBuyNum then 
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf204,ttFlyTip)
		return
	end	
	
	local consumeData = {}
	local isok = CheckAllConsume(sysarg, false, config.consume, true, consumeData)				
	if not isok then return end	
	
	--扣除消耗
	isok = DeductAllConsume(sysarg, false, config.consume, GameLog.cNewBuyChallengeBossTimesConsume)		
	if not isok then return end
	
	var.days.ChallengeBossNum = var.days.ChallengeBossNum + 1   		--挑战次数+1
	var.days.buyChallengeBossNum = var.days.buyChallengeBossNum + 1	--购买次数+1
	print("var.days.ChallengeBossNum  "..var.days.ChallengeBossNum, "var.days.buyChallengeBossNum "..var.days.buyChallengeBossNum);
	sendChallengeBoss(sysarg)
end

function sendChallengeBoss(sysarg)
    if System.isCrossServer() == true then return end
	if not ChallengeBossConfig then return end
	local config = ChallengeBossConfig.ChallengeBoss.BossInfo
	
	local FinishChallengeBoss,ChallengeBossNum,buyChallengeBossNum
	local var = Actor.getStaticVar(sysarg)
	if not var.days.FinishChallengeBoss then
		var.days.FinishChallengeBoss = {}
	end

	if not var.days.ChallengeBossNum then
		var.days.ChallengeBossNum = ChallengeBossConfig.ChallengeBoss.MaxChallengeNum
	end
	
	if not var.days.buyChallengeBossNum then
		var.days.buyChallengeBossNum = 0
	end
	
	FinishChallengeBoss = var.days.FinishChallengeBoss
	ChallengeBossNum = var.days.ChallengeBossNum
	buyChallengeBossNum = ChallengeBossConfig.BuyChallgeBoss.MaxBuyNum - var.days.buyChallengeBossNum
	
	local npack = DataPack.allocPacket(sysarg,49,2)  --申请一个数据包
	if npack == nil then
		print("allocPacket is nil!")
		return
	end
	
	DataPack.writeByte(npack,ChallengeBossNum)
	DataPack.writeByte(npack,buyChallengeBossNum)
	local len = table.getn(config)
	DataPack.writeByte(npack,len)
	for i = 1,len do
		if FinishChallengeBoss[i] then
			DataPack.writeByte(npack,1)
		else
			DataPack.writeByte(npack,0)
		end
	end
	DataPack.flush(npack)
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeBossEvent, EventCallDispatcher.handleChallengeBoss) 