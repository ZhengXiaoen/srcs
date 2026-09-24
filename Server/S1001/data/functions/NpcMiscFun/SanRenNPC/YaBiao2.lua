--总镖头
--#include "data\functions\Activity\Dart\ApplyDartCommon.lua"

local t = {}
t.main = function(sysarg)
	local sData = SubmitDart(sysarg);
	if not sData then
		return ;
	end
	Actor.openDialogs(sysarg, diSubmitDart, sData);
     return "null"
end


function GetNpcYaBiao2() return t end