
--#include "data\config\activityconfig\CrossGuildSbk\CrossCommon.lua" once

function ExitCrossBossScene( sysarg )
	local dlgStr = string.format("\\<#BL%s/@OnExitCrossBoss>", Lang.Activity.ku0040)
	return dlgStr
end

function OnExitCrossBoss(sysarg)
	Actor.enterScene(sysarg, CrossCommonConig.outSceneId, CrossCommonConig.outX, CrossCommonConig.outY)
end

table.insert( MainFnTable, ExitCrossBossScene)