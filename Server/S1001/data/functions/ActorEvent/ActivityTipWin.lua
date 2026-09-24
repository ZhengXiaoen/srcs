--#include "data\config\activity\ActivityPanelCfg.lua" once

TipWinOpFuncList = {}

EventCallDispatcher.onHandleActivityTipWin = function(sysarg,args)

	local nType = args[1]
	local func = TipWinOpFuncList[nType]
	if func ~= nil then
		func(sysarg, args) 
	end
end


function checkActivityCondition(sysarg,needLevel)
	if needLevel == nil then needLevel = 1 end
	
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
	
	if Actor.checkActorLevel(sysarg,needLevel) == false then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf147,needLevel),ttFlyTip)
		return false
	end
		
	return true
end

TipWinOpFuncList[1] = function(sysarg, args)
	
	local config = {needLevel = 65,scene = 62}
	
	if checkActivityCondition(sysarg,config.needLevel) == false then
		return
	end
	
	Actor.enterScene(sysarg,config.scene)
end


TipWinOpFuncList[2] = function(sysarg, args)
	
	local nId = args[2]
	if not ActivityPanel then return end
	
	local nSceneId = Actor.getSceneId(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local config = ActivityPanel[nSceneId]
	if not config then return end

	if not config.ButtonParam[nId] then
		print("find buttonparam error")
		return
	end
	
	if config.Id == 1 then
		DoubleWaterSpring(sysarg,config,nId)
	elseif config.Id == 2 then
		DoubleFoGuang(sysarg,config,nId)
	end
end

function DoubleWaterSpring(sysarg,config,nId)
	
	local var = Actor.getStaticVar(sysarg)
	
	if nId == 1 then
		if not Actor.canAddItem(sysarg,config.ButtonParam[nId],1) then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf317,ttFlyTip)
			return
		end

		if not var.FreeWaterBottleTime then
			var.FreeWaterBottleTime = 0
		end
		
		if not var.FreeWaterBottle then
			var.FreeWaterBottle = 0
		elseif var.FreeWaterBottle >= config.MaxFreeBottle then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf318,config.MaxFreeBottle),ttFlyTip)
			return
		end
		Actor.addItem(sysarg,config.ButtonParam[nId],0,0,1,1,0,"quan shui",1)
		var.FreeWaterBottle = var.FreeWaterBottle + 1
		var.FreeWaterBottleTime = System.getCurrMiniTime()
		
	elseif nId == 2 then
		
		local nCurMiniTime = System.getCurrMiniTime()		
		if var.DoubleWaterSpringTime then
			if nCurMiniTime > var.DoubleWaterSpringTime[2] then
				var.DoubleWaterSpringTime = nil
			else
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf316,ttFlyTip)
				return
			end
		end

		local str = "购买双倍接泉水"
		if not Actor.changeMoney(sysarg,config.Consume.type,-config.Consume.count,GameLog.cDailyActivtyPanel,str) then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf315,config.Consume.count),ttFlyTip)
			return 
		end

		if not var.DoubleWaterSpringTime then
			var.DoubleWaterSpringTime = {}
			var.DoubleWaterSpringTime[1] = config.ButtonParam[nId]
			var.DoubleWaterSpringTime[2] = System.getCurrMiniTime()+config.LeftTime
		end
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf317,ttFlyTip)
	end
end

function DoubleFoGuang(sysarg,config,nId)
	
	local var = Actor.getStaticVar(sysarg)
	
	if nId == 1 then
		local nCurMiniTime = System.getCurrMiniTime()
		
		if var.DoubleFoGuangTime then
			if nCurMiniTime > var.DoubleFoGuangTime[2] then
				var.DoubleFoGuangTime = nil
			else
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf316,ttFlyTip)
				return
			end
		end	

		local str = "购买双倍佛光普照"
		if not Actor.changeMoney(sysarg,config.Consume.type,-config.Consume.count,GameLog.cDailyActivtyPanel,str) then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf315,config.Consume.count),ttFlyTip)
			return 
		end	
		
		if not var.DoubleFoGuangTime then
			var.DoubleFoGuangTime = {}
			var.DoubleFoGuangTime[1] = config.ButtonParam[nId]
			var.DoubleFoGuangTime[2] = System.getCurrMiniTime()+config.LeftTime
		end
		
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf317,ttFlyTip)		
	end
end

TipWinOpFuncList[3] = function(sysarg, args)

-- 双蛋活动：天天有鱼 已经屏蔽
--[[
	-- 配置是
	DoubleEggBossInfo = 
	{
		sceneId = 4,
		needLevel = 60,
		winTitle = "天天有鱼",
		tipString = "王城出现一批鱼神,可爆出高级装备和特殊材料",
		buttonName = "确定参与",
		posX = {25,200},
		posY = {45,200},
		monsterInfo = 
		{
			{monsterId = 517,count = 150,liveTime = 3600},
			{monsterId = 518,count = 20,liveTime = 3600},
		}
	},
	-----------------
	
	local config = DoubleEggCfg.DoubleEggBossInfo
	if not config then return false end
			
	if checkActivityCondition(sysarg,config.needLevel) == false then
		return
	end
	
	Actor.enterScene(sysarg,config.sceneId,math.random(unpack(config.posX)),math.random(unpack(config.posY)))
	--]]
end

TipWinOpFuncList[4] = function(sysarg, args)

	local config = OneHundredActivityCfg.BossRaid
	if not config then return false end
			
	if not checkActivityCondition(sysarg,config.needLevel) then
		return
	end
	
	Actor.enterScene(sysarg,config.BossSceneId,math.random(unpack(config.ActorPosX)),math.random(unpack(config.ActorPosY)))
end

TipWinOpFuncList[5] = function(sysarg, args)

	local config = LaborActivityCfg.LaborBoss
	if not config then return false end
				
	if not checkActivityCondition(sysarg,config.needLevel) then
		return
	end
	
	Actor.enterScene(sysarg,config.SceneId,math.random(unpack(config.EnterPosX)),math.random(unpack(config.EnterPosY)))
end

function EnterDemonInvadeScene(sysarg)	
	local nSceneId = Actor.getSceneId(sysarg)
	if nSceneId == DemonInvadeCfg.sceneId then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf406,ttFlyTip)
		return
	end
	
	local cfg1 = EnterActivityScene[18]
	local cfg2 = EnterActivityScene[19]
	if cfg1 == nil or cfg2 == nil then return end
	
	if (System.isInTimeRange(cfg1.startHour,cfg1.startMin,0,cfg1.endHour,cfg1.endMin,0) == false) and (System.isInTimeRange(cfg2.startHour,cfg2.startMin,0,cfg2.endHour,cfg2.endMin,0) == false) then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf405,ttFlyTip)
		return
	end
	
	if not checkActivityCondition(sysarg,DemonInvadeCfg.needLevel) then
		return
	end
	
	Actor.enterScene(sysarg,DemonInvadeCfg.sceneId,math.random(unpack(DemonInvadeCfg.enterPosX)),math.random(unpack(DemonInvadeCfg.enterPosY)))
end

-- 魔族入侵活动
TipWinOpFuncList[6] = function(sysarg, args)			
	EnterDemonInvadeScene(sysarg)
end

--进入神威幻境活动场景
function EnterSWHJScene(sysarg)	
	local nSceneId = Actor.getSceneId(sysarg)
	if nSceneId >= 83 and nSceneId <= 89 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf406,ttFlyTip)
		return
	end
	
	local canEnter = false
	
	local cfg = EnterActivityScene[20]
	if (System.isInTimeRange(cfg.startHour,cfg.startMin,0,cfg.endHour,cfg.endMin,0)) then
		canEnter = true
	end
	
	if canEnter == false then
		cfg = EnterActivityScene[21]
		if (System.isInTimeRange(cfg.startHour,cfg.startMin,0,cfg.endHour,cfg.endMin,0)) then
			canEnter = true
		end
	end
	
	if canEnter == false then
		cfg = EnterActivityScene[22]
		if (System.isInTimeRange(cfg.startHour,cfg.startMin,0,cfg.endHour,cfg.endMin,0)) then
			canEnter = true
		end
	end	
	
	if canEnter == false then
		Actor.sendTipmsg(sysarg,Lang.Activity.swhj03,ttFlyTip)
		return
	end
	
	if not checkActivityCondition(sysarg,Activity_SWHJ_Cfg.needLevel) then
		return
	end
	
	Actor.enterScene(sysarg,Activity_SWHJ_Cfg.sceneId,math.random(unpack(Activity_SWHJ_Cfg.enterPosX)),math.random(unpack(Activity_SWHJ_Cfg.enterPosY)))
end

-- 神威幻境活动
TipWinOpFuncList[7] = function(sysarg, args)			
	EnterSWHJScene(sysarg)
end

-- 元宝嘉年华活动
TipWinOpFuncList[8] = function(sysarg, args)			
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeActivityTipWin, EventCallDispatcher.onHandleActivityTipWin)