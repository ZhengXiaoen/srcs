
--#include "HuntingCommon.lua" once

function CommonFloot_Main(sysarg)
	return CommonFloorMain(sysarg)
end

table.insert(MainFnTable, CommonFloot_Main)