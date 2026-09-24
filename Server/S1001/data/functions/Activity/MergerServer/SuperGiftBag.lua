--#include "data\functions\Activity\Common\Awards.lua" once

function GetSuperGiftBag(sysarg,packet)
	
	local nGetId = DataPack.readByte(packet) 	--领取的ID
	
	local config = MergerServerCfg.SuperBag[nGetId]
	
	if not config then return false end

	local var = Actor.getStaticVar(sysarg)
	
	if not var.SuperBagGift then
		var.SuperBagGift = {}
	end

	if var.SuperBagGift[nGetId] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf616,ttFlyTip)
		return false 
	end

	if not Awards.CheckBagGridCount(sysarg, config.items) then
		return false
	end
	
	if not Actor.changeMoney(sysarg,3,-config.money,GameLog.cSceneConsum,"") then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf613,ttFlyTip)
		return false
	end
	
	Awards.Give(sysarg, config.items, GameLog.cBuyCombineSuperGift, "合服超值礼包")
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf617,ttFlyTip)
	var.SuperBagGift[nGetId] = 1
	
	SendCombineData(sysarg)
	
	System.sendCommonLog(1079,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),3,nGetId)
	
	return true
end