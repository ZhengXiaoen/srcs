--#include "data\functions\Activity\Common\Awards.lua" once

--合服登录豪礼礼包
function GetCommonLoginGift(sysarg,packet)

	local nType = DataPack.readByte(packet)   --合服活动类型

	local config = MergerServerCfg.LoginAward.award[nType]
	if not config then 
		print("The CombineSever Login Award Config is nil ,Read file error")
		return false 
	end

	local var = Actor.getStaticVar(sysarg)
	if nType > var.CombineLoginDay then
		return false
	end

	if not var.CombineLoginGift then
		var.CombineLoginGift = {}
	elseif var.CombineLoginGift[nType] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.tf00041,ttFlyTip)
		return false
	end

	if not Actor.checkActorLevel(sysarg,config.needLevel,config.needCircle) then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf310,config.needCircle,config.needLevel),ttFlyTip)
		return false 
	end

	if not Awards.CheckBagGridCount(sysarg, config) then
		return false
	end

	local bResult = Awards.Give(sysarg, config, 817, "合服每日奖励")
	if bResult == false then
		print("give award error, actor name = "..Actor.getName(sysarg))
		return false
	end
	var.CombineLoginGift[nType] = 1
	SendCombineData(sysarg)

	System.sendCommonLog(1079,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),1,nType)
	
	return true
end
