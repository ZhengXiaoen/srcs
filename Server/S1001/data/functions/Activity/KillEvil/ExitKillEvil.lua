
--#include "KillEvilCommon.lua" once
--#include "data\functions\NpcTradeEventFunc.lua" once

function ExitKillEvil_Main( sysarg )
	return Lang.Activity.a00004 .. "\\<#BL"..Lang.Activity.w00037.."/@ExitScene>"
end

table.insert(MainFnTable, ExitKillEvil_Main)