--#include "data\config\ActorEvent\UserDepotCfg.lua" once
--#include "data\config\SpecialTitleCfg.lua" once
--购买随身仓库格子
function OnEventBuyUserDepotGrid(sysarg, args)
	local pageGridCount = args[1] 	-- 每页格子数
	local gridId = args[2]	-- 格子ID,从1开始
	
	local curGridCount = Actor.getUserDepotGridCount(sysarg)
    local var = Actor.getStaticVar(sysarg)
    
    if var.isGiveDepotGrid ~= nil then
        curGridCount = curGridCount - SpecialTitleCfg.depotgridcount
        gridId = gridId - SpecialTitleCfg.depotgridcount
    end
	if curGridCount >= gridId then
		return -- 已经开启了
	end
	
	local totalYb = 0
	for i=curGridCount+1,gridId do
		local needYb = UserDepotCfg.ActivateGridsNeedYb[i-pageGridCount]
		if needYb == nil then 
            
            return
        end
		
		totalYb = totalYb + needYb
	end
	print("code:1")
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	if myYb < totalYb then
		SendRecommendTips(sysarg,"1")
        print("code:2")
		return
	end
	
	if Actor.changeMoney(sysarg, mtYuanbao, -totalYb, LogIds.BuyUserDepotGrid, "买仓库格子") == false then
		return
	end
	if var.isGiveDepotGrid ~= nil then
        gridId = gridId + SpecialTitleCfg.depotgridcount
    end
     print("code:3")
	Actor.setUserDepotGridCount(sysarg, gridId)
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeBuyUserDepotGrid, OnEventBuyUserDepotGrid) --购买随身仓库格子
