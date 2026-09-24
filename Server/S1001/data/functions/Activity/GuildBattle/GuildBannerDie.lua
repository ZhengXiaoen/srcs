--lua script

--#include "data\language\LangCode.txt" once   --ÓïÑÔ°ü
--#include "data\config\activityconfig\GuildBattle\GuildBattleConfig.lua" once
--#include "GuildBattleCommon.lua" once

MonDieDispatcher.Mon159Die = function(monster,sysarg,monId)
	OccupyBanne(sysarg,monster)
end

MonDieDispatcher.register(159, MonDieDispatcher.Mon159Die )

