-- 后台命令
--#include "data\functions\IdentifyCodeFunc.lua" once
BackStageCmd = {
}

function DoBackStageCmd(cmd, ...)
	if cmd == nil then return false end
	local func = BackStageCmd[cmd]
	if func == nil then
    
		print("DoBackStageCmd no exist cmd="..cmd)
		return false
	end
	
	local ret = func(arg)
	if ret == nil then ret = true end

	print("DoBackStageCmd do cmd="..cmd..",ret="..tostring(ret))
	return ret
end

function RegisterBackCmd(cmd, func)
	if cmd == nil or func == nil then
		return false
	end
	
	if BackStageCmd[cmd] ~= nil then
		return false
	end
	
	BackStageCmd[cmd] = func
	return true
end
function InitBackStageCallBack()
   
end

function UnregisterBackCmd(cmd)
	if cmd == nil then
		return
	end
	
	BackStageCmd[cmd] = nil
end



function LoadAllCaptchaInfo(arg)
    System.loadAllCaptchaInfo()
    return true
end

function ReloadCaptchaConfig(arg)
    System.reloadCaptchaConfig()
    return true
end
 RegisterBackCmd("1",removeIdentifyCodeDay)
 RegisterBackCmd("loadAllCaptcha",LoadAllCaptchaInfo)
 RegisterBackCmd("reloadCaptcha",ReloadCaptchaConfig)