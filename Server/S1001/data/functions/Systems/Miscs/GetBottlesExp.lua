--    --#include "data\config\item\BottlesExpCfg.lua" once

--屏蔽经验瓶
--[[
MiscsImplement.GetBottlesExp = function(sysarg, msgid, packet)
	
	local chooseType = DataPack.readByte(packet) --1: 金币 2：元宝
	local chooseId = DataPack.readByte(packet) --1: 领取倍数

	if chooseType < 3 then
		GiveBottlesExps(sysarg,chooseType,chooseId)
	elseif chooseType == 3 then
		EnterBottlesExpsMap(sysarg,chooseId)
	end
	
	return
end

function GiveBottlesExps(sysarg,giveType,giveId)
	
	local config = BottlesExpConfig
	if not config then return end
		
	if giveType <= 0 or giveType > table.getn(config.consume) then return end 
	if giveId <= 0 or giveId > table.getn(config.consume[giveType]) then return end 
	
	if not Actor.checkActorLevel(sysarg,GlobalConfig.nOpenBottlesLevel) then
		return
	end

	--if System.getDaysSinceOpenServer() < 3 then
	--	return
	--end

	local var = Actor.getStaticVar(sysarg)
	if not var.days.UseBottesNum then
		var.days.UseBottesNum = 0
	end
		
	if var.days.UseBottesNum >= config.MaxUse then 
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf185,ttFlyTip)	
		return
	end
	
	local maxBottlesExp = GlobalConfig.nMaxBottlesExp
	if not maxBottlesExp then return end
	-- PROP_ACTOR_BOTTLESEXP 属性已经挪为它用
	local nCurExp = Actor.getIntProperty(sysarg,PROP_ACTOR_BOTTLESEXP)
	if nCurExp < maxBottlesExp then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf184,ttFlyTip)
		return
	end
	
	if Actor.checkActorLevel(sysarg,config.consume[giveType][giveId].needLevel) == false then
		local needLevel = config.consume[giveType][giveId].needLevel
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf198,needLevel),ttFlyTip)
		return
	end
	
	--扣除消耗
	if not config.consume[giveType][giveId] then return end
	local consumeData = {}
	local isok = CheckOneConsume(sysarg, false, config.consume[giveType][giveId], true, consumeData)				
	if not isok then return end	

	isok = DeductOneConsume(sysarg, false, config.consume[giveType][giveId], GameLog.cGetBottlesExpConsume)		
	if not isok then return end
	
	var.days.UseBottesNum = var.days.UseBottesNum + 1
	-- PROP_ACTOR_BOTTLESEXP 属性已经挪为它用
	Actor.addExp(sysarg,nCurExp*giveId)
	Actor.setIntProperty(sysarg,PROP_ACTOR_BOTTLESEXP,0)
	
	local nSurplus = config.MaxUse - var.days.UseBottesNum
	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf186,nSurplus),ttFlyTip)
	
	local netPack = DataPack.allocPacket(sysarg, 139,124)
	DataPack.writeByte(netPack, nSurplus)
	DataPack.flush(netPack)
end

function EnterBottlesExpMapCondition(sysarg)
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

	return true
end


function EnterBottlesExpsMap(sysarg,sceneType)

	local config = BottlesExpConfig
	if not config then return end

	if EnterBottlesExpMapCondition(sysarg) == false then
		return
	end

	local var = Actor.getStaticVar(sysarg)
	if var.days.UseBottesNum and var.days.UseBottesNum > 0 then
		return
	end
	
	if sceneType <= 0 or sceneType > #config.BottlesExpMap then
		return
	end

	local nMap = config.BottlesExpMap[sceneType]
	if not nMap then return end

	if not Actor.checkActorLevel(sysarg,nMap.level) then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf364,nMap.level),ttFlyTip)
		return
	end
	
	if Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE) < nMap.vip then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf365,nMap.vip),ttFlyTip)
		return
	end

	local consumeData = {}
	local ret = CheckOneConsume(sysarg, false, nMap.consume, true, consumeData)
	if not ret then return false end
	
	ret = DeductOneConsume(sysarg, false, nMap.consume, GameLog.cEnterBottlesExpMapConsume)
	if not ret then return false end

	Actor.enterScene(sysarg,nMap.sceneId,nMap.scenePosX,nMap.scenePosY)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetBottlesExp, MiscsImplement.GetBottlesExp)
--]]