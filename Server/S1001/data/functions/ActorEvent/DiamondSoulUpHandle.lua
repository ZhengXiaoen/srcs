
-- 已经屏蔽
--[[
----#include "data\config\ActorEvent\DiamondSoulConfig.lua" once

local DiamondName = {"绿钻之灵","紫钻之灵","红钻之灵","金钻之灵"}

--根据钻石之灵等级加BUFF
 function addDiamondLevelBuff(sysarg)
 	-- body
 	local diamondLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_DIAMOND_LEVEL)
 	local config = DiamondSoulConfig.DiamondSoulLevel[diamondLevel]
 	if config == nil or config.buff == nil then
 		return false
 	end
 	Actor.delBuff(sysarg,config.buff.type,config.group)
	Actor.addBuff(sysarg,config.buff.type,config.buff.group,config.buff.value,-1,config.buff.name,false,0,0,0,0,config.buff.icon)
 end

local function UpDiamondLevel(sysarg,level)

	local diamondSoulLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_DIAMOND_LEVEL)

	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)

	if diamondSoulLevel >= DiamondSoulConfig.MaxLevel then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf643,ttFlyTip)
		return false
	end

	if diamondSoulLevel ~= level - 1 then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf644,DiamondName[level-1]),ttFlyTip)
		return false
	end

	local config = DiamondSoulConfig.DiamondSoulLevel[level]
	if config == nil then
		return
	end

	if actorLevel < config.exchangeLevel then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf652,ttFlyTip)
		return
	end

	local consumeData = {}
	local ret = CheckAllConsume(sysarg, false, config.consume, true, consumeData)
	if ret == false or not ret then return false end
	--扣费
	ret = DeductAllConsume(sysarg, false, config.consume, GameLog.cNewDiamondLevelBuffConsume)
	if ret == false or not ret then return false end
	if level > DiamondSoulConfig.MaxLevel then
		return false
	end
	Actor.setIntProperty(sysarg,PROP_CREATURE_LEVEL,actorLevel-5)
	Actor.setIntProperty(sysarg,PROP_ACTOR_DIAMOND_LEVEL,level)
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf642,ttFlyTip)
	Actor.collectOperate(sysarg,0)
end

MiscsImplement.handleDiamondUpHandle = function( sysarg, msgid, packet )
	if packet == nil then
		return false
	end
	local upLevel = DataPack.readByte(packet)  
	UpDiamondLevel(sysarg,upLevel)
end

MiscsImplement.registerMsgHandler(120, MiscsImplement.handleDiamondUpHandle)

--]]