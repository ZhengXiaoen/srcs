--拾取掉落物品
--lua script

--#include "data\language\LangCode.txt" once   --语言包
--#include "data\config\activityconfig\UnusualBoss\UnusualBossConfig.lua" once
--#include "data\functions\Activity\OpenTenDaysActivity\LootRareDropItem.lua" once

EventCallDispatcher.HandlerDropItemOp = function (sysarg, args)
	if args[1] == nil then return end

	if args[1] == UnusualBossConfig.DropItemId then
		AfterLootDropItem(sysarg)
	end
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeLootDropItem, EventCallDispatcher.HandlerDropItemOp)

