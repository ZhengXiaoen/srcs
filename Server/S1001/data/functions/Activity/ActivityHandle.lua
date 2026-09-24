--#include "data\functions\Activity\ActScriptFunc.lua" once
--#include "data\functions\Activity\NewActorHelp.lua" once
--#include "data\functions\Activity\BateActivity.lua" once
--#include "data\functions\Activity\UpdateNotices.lua" once

function OnActivityScriptFunc(sysarg,funcName, ...)
	--print("funcName arg=======================",funcName,arg)
	local func = ActivityFunc[funcName]
	if func then
		--print("OnActivityScriptFunc")
		return func(sysarg, unpack(arg))
	end
end

function OnNewActorHelpScriptFunc(sysarg,funcName, ...)
	
	--print("funcName arg=======================",funcName,arg)	
	local func = NewActorHelpFunc[funcName]
	--print(func)
	if func then
		--print("OnNewActorHelpScriptFunc")
		if func(sysarg, unpack(arg)) ~=nil then  
			return funcName.."$"..func(sysarg, unpack(arg))
		end
	end
end

function OnBateActivityScriptFunc(sysarg,funcName, ...)
	
	--print("funcName arg=======================",funcName,arg)	
	local func = BateActivityFunc[funcName]
	--print(func)
	if func then
		--print("OnBateActivityScriptFunc")
		return func(sysarg, unpack(arg))
	end
end

function OnUpdateNoticesScriptFunc(sysarg,funcName, ...)
	
	--print("funcName arg=======================",funcName,arg)	
	local func = UpdateNoticesFunc[funcName]
	--print(func)
	if func then
		--print("OnUpdateNoticesScriptFunc")
		return func(sysarg, unpack(arg))
	end
end