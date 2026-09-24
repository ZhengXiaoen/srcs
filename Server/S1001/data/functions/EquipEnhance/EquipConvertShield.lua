--#include "data\config\item\ConvertShieldCfg.lua" once

function HasLastShiled(sysarg,config)
	
	--背包是否有上一阶的盾牌
	local previous = config.successRemove
	local nCount = Actor.getItemCount(sysarg,previous.id)
	if nCount < previous.count then
		print("lase nil")
		return false,nCount,previous.id
	end
	return true,nCount,previous.id
end

local function ConvertShield(sysarg,nId,isProtect)
	
	local nConvertShieldConfig = ConvertShieldConfig
	if not nConvertShieldConfig then return false end
		
	local config = nConvertShieldConfig[nId]
	if not config then return false end
	
	-- 检查
	local consumeData = {}
	local ret = CheckAllConsume(sysarg, false, config.consume, true, consumeData)
	
	if ret and isProtect and config.protect then
		ret = CheckOneConsume(sysarg, false, config.protect, true, consumeData)
		if not ret then
			return false
		end
	end
	
	if not ret then
		return false
	end

	
	
	if config.successRemove then
		local nCount = 0
		local itemid = 0
		ret, nCount,itemid = HasLastShiled(sysarg,config)
		if not ret then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf633,Item.getItemName(itemid)), ttFlyTip)
			return false 
		end
	end
	
	--扣费
	ret = DeductAllConsume(sysarg, false, config.consume, GameLog.cNewConvertShieldConsume)
	
	if ret and isProtect and config.protect then
		ret = DeductOneConsume(sysarg, false, config.protect, GameLog.cNewConvertShieldConsume)
	end
	
	if ret == false or not ret then return false end
	
	local convertRate = config.probability
	local rate = math.random(100)
	if rate <= convertRate or isProtect then
		if config.successRemove then
			local previous = config.successRemove
			Actor.removeItem(sysarg,previous.id,previous.count,-1,-1,-1,"扣除上阶的盾牌")
		end 
		
		Actor.addItem(sysarg,config.award.id,0,0,config.award.count,0,0,"兑换了盾牌",1)
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf635,Item.getItemName(config.award.id)), ttFlyTip)
	else
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf634, ttFlyTip)
	end
	
end	
	
MiscsImplement.handleConvertShield = function (sysarg, msgid,packet)
	if not packet then return false end
	
	local nId 		 = DataPack.readByte(packet)
	local nIsProtect = DataPack.readByte(packet)
	local nProtectResult
	if nIsProtect >= 1 then
		nProtectResult = true
	else
		nProtectResult = false
	end
	
	if nId > 0 then
		ConvertShield(sysarg, nId ,nProtectResult)
	else
		return false
	end
end

--注册回调函数	
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cConvertShield, MiscsImplement.handleConvertShield)