--勇闯天关
--#include "data\config\activity\TongTianTaCfg.lua" once

--后端下发
--1是5秒刷怪倒计时
--2是1分钟打怪的倒计时
--3是5秒进入下1关的倒计时

EnterTongTianTa = function(sysarg)
	--判断等级
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if nActorLevel<60 then 
		Actor.sendTipmsg(sysarg,"您等级不够60级，无法进入",ttFlyTip)
		return 
	end
	
	--是否已经是过了最高层了
	local var = Actor.getStaticVar(sysarg) 
	var.TTTLayer = var.days.TTTLayer
	if var.TTTLayer == nil then 
		var.TTTLayer = 1
	end
	if var.TTTLayer > 30  then 
		Actor.sendTipmsg(sysarg,"您最高层已经通关，请明天再来吧",ttFlyTip)
		return 
	end
	
	--判断背包空格
	if Item.getBagEmptyGridCount(sysarg) < 2 then
		Actor.sendTipmsg(sysarg, "背包至少有2个空位才能进入", ttFlyTip)
		return
	end
	
	--判断是否够钱 	--扣钱
	if Actor.changeMoney(sysarg,0,-100000,LogIds.TongTianTaLog, "进入通天塔")==false then 
		if Actor.changeMoney(sysarg,1,-100000,LogIds.TongTianTaLog, "进入通天塔")==false then
			Actor.sendTipmsg(sysarg,"您绑定金币/金币不足，无法进入",ttFlyTip)
			return 
		end
	end
		
	--进入副本
	local fbid = var.TTTLayer -1 + TongTiantaCfg.funbenid[1]
	local Hfuben = Fuben.createFuBen(fbid)  --1:表示副本ID
	if Hfuben == 0 then return end
	if Actor.enterFuBen(sysarg, Hfuben,-1,-1,-1) == false then return  end  --从NPC那将玩家传进副本
	
	var.days.IsHasEnterTTT = 1 --今天进入了勇闯天关
	
	Actor.addTimer(sysarg,25,TongTiantaCfg.makeMonsterTime*1000)--自动挂机
	
	--给个倒计时刷怪
	Actor.sendTipmsg(sysarg,"怪物将在"..TongTiantaCfg.makeMonsterTime.."秒后刷出",ttFlyTip)
	Actor.addTimer(sysarg,60, TongTiantaCfg.makeMonsterTime*1000)
	
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sTongTianTa) 
	DataPack.writeByte(netPack, 1) --进入的5秒倒计时
	DataPack.writeByte(netPack, var.TTTLayer) --进入第几关
	--DataPack.writeByte(netPack, var.newdays.YZCGaward[var.TTTLayer][1])
	DataPack.flush(netPack)
	
	Actor.addTimer(sysarg,63, TongTiantaCfg.makeMonsterTime*1000)
		
end

--在勇者闯关副本里面杀怪
function onKilMonsterInTongTianTa(sysarg,monId)
	local var = Actor.getStaticVar(sysarg) 
	if Actor.getSceneId(sysarg) >=TongTiantaCfg.sceneid[1] and  Actor.getSceneId(sysarg)<=TongTiantaCfg.sceneid[2]  then
		
		if monId<TongTiantaCfg.monsterid[1] or monId>TongTiantaCfg.monsterid[1]+29 then 
			--print("使用毒了，退出了")
			return 
		end
		
		--删除出去的定时器
		Actor.deleteTimer(sysarg,61)
		
		--记录通关变量
		if var.TTTLayer == nil then 
			var.TTTLayer = 1
		end
		--记录通关
		System.sendCommonLog(GameLog.TongTianTaLog,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,var.TTTLayer.."通关")

		
		--取消挂机
		--Actor.stopAutoFight(sysarg)
		
		
		--随机库的index-----------------------------------------------------------------
		--记录通过的最高关
		if var.TGtopLayer==nil or var.TGtopLayer==0 then 
			var.TGtopLayer=var.TTTLayer
		elseif var.TTTLayer>var.TGtopLayer then 
			var.TGtopLayer=var.TTTLayer
		end
		
		var.TTTLayer = 1 + var.TTTLayer
		var.days.TTTLayer = var.TTTLayer
		
		Actor.addTimer(sysarg, 62, TongTiantaCfg.goNextLayerTime*1000)
		
		local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sTongTianTa) 
		DataPack.writeByte(netPack, 3) --进入下一关倒计时
		DataPack.flush(netPack)
		
	end
end