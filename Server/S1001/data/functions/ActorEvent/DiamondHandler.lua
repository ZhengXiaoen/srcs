--lua script
--处理盗梦空间相关的操作

--#include "data\config\diamond\DiamondConfig.lua" once --宝石常规配置
--#include "data\config\item\itemEnhance\CommonConfig.lua" once --宝石通用配置
--#include "data\functions\Activity\Common\Consumes.lua" once

DiamondOpId = {
	enUpgrade = 1,		--升级
}

DiamondOpFuncList = {}

EventCallDispatcher.HandlerDiamondOp = function (sysarg, args)
	if args[1] == nil then return end   --
	local func = DiamondOpFuncList[args[1]]
	if func ~= nil then
		func(sysarg, args) 
	end
end

--升级宝石
DiamondOpFuncList[DiamondOpId.enUpgrade] = function (sysarg,args)
	local nOwnerType = args[2]	--所属实体类型
	local nEquipPos = args[3]	--装备槽
	local nSlotIdx = args[4]	--宝石槽
	local wItemId = args[5]		--当前宝石ID
	local nHeroPos = args[6]	--英雄pos
	if wItemId <= 0 then
		return
	end
	
	local diamondId = Actor.getDiamond(sysarg, nOwnerType, nEquipPos, nSlotIdx)
	
	local config = DiamondConfig
	
	if not config then return end
	
	local level, type = GetDiamondLevelAndType(diamondId)
	
	if level == 0 or level >= table.getn(DiamondLevelConfig) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.c000100, ttFlyTip)
		return
	end
	
	if type == 0 or type > table.getn(DiamondLevelConfig[1]) then return end
	
	local itemId = DiamondLevelConfig[level+1][type]
	
	if not itemId then return end
	
	local consumes = config.upgradeConsumes
	if not consumes or not consumes[level] then return end
	
	if Consumes.Check(sysarg, consumes[level]) ~= true then
		return
	end
	
	if level >= 10 then
		return
	end
	
	if Consumes.Remove(sysarg, consumes[level], 174, string.format(Lang.LogTips.l00095, nEquipPos, nSlotIdx)) ~= true then
		return
	end
	
	Actor.setDiamond(sysarg, nOwnerType, nEquipPos, nSlotIdx, itemId, nHeroPos)
	
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeDiamondOp, EventCallDispatcher.HandlerDiamondOp)
