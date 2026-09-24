--lua script

--离开活动场景
--[[键入'ss'并按分号即可按模板生成脚本]]--

--#include "data\functions\Activity\HookMap\HookMapCommon.lua" once

--离开活动场景的回调,需要定时回调
function LeaveActivitySceneCallback(sysarg,arg)
	if IsInPkChallengeScene(sysarg) then
		ExitPKScene(sysarg)
	elseif IsInHuntScene(sysarg) then
		ExitHuntingScene(sysarg)
	elseif IsInHoopMap(sysarg) then
		ExitFromHoopMap(sysarg)
	else
		if Actor.getFubenId(sysarg) > 0 then
			onExitFubenFunc(sysarg)
		else
			local Pos = LuaHelp.getReloadMapPos(sysarg) 
			Actor.enterScene(sysarg,Pos[1],Pos[2],Pos[3])
		end		
		Actor.closeActivityWind(sysarg)
	end
end



table.insert(LocalDT.ScriptDelayConfig[14], LeaveActivitySceneCallback)