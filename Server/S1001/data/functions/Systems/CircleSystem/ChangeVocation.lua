--NPC执行：欲青峰（咒泉乡）

--#include "data\config\circle\ChgVocationAndSex.lua" once	--转职转性配置
--#include "data\config\item\EquipChange.lua" once --套装装备转换


--#include "data\functions\Activity\Common\Consumes.lua" once --
--#include "data\functions\GlobalDefine.lua" once
--#include "data\functions\Activity\Common\Scene.lua" once


--[[
    函数名称：传送
    函数描述：NPC交互入口
    参数 sysarg 的描述：
]]
function ChangeVocation_Main(sysarg)
	local config = ChgVocationAndSex
	if (not config) then return "" end
	
	local str = ""
	str = str.."\\<#BL"..Lang.ScriptTips.c000130.."/@ChangeVocation>"  --<转换职业>
	str = str.."\\<#BL"..Lang.ScriptTips.c000131.."/@AbouChangeVocation>"  --<转职说明>
	str = str.."\\<#BL"..Lang.ScriptTips.c000155.."/@@showEquipConvertWin>"  --<装备转换>
	str = str.."\\<#BL"..Lang.ScriptTips.c000147.."/@AskExitToReloadMap, "..Lang.ScriptTips.c000148..">"  --<离开活动>
	return str
end


--转换职业
function ChangeVocation(sysarg)
	local config = ChgVocationAndSex.vocation
	if not config then return end
	
	if System.getDaysSinceOpenServer() < ChgVocationAndSex.openDay then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.c000150,ChgVocationAndSex.openDay), ttFlyTip)
		return
	end
	
	local str = Lang.ScriptTips.c000132
	
	local vocation = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	
	for i = 1, 3 do 
		if i ~= vocation then
			str = str.."<#BL"..Job_cn[i].."/@AskChangeVocation,"..i..">"
		end
	end
	str = str.."\\<#BL"..Lang.Activity.a00101.."/@main>"  --<返回>
	return str
end

function AskChangeVocation(sysarg, idx)
	local idx = tonumber(idx)
	local config = ChgVocationAndSex.vocation
	
	local sAskMsg = string.format(Lang.ScriptTips.c000133, Consumes.ParseConsumesStr(config.consumes), Job_cn[idx])
	local NPChandle = Actor.getHandle(thisNPC)
	Actor.messageBox(sysarg,NPChandle,0,sAskMsg,Lang.ScriptTips.c000134.."/OnChangeVocation,"..idx,Lang.ScriptTips.c000135.."/Cancel",nil)
end



function OnChangeVocation(sysarg, idx)
	local idx = tonumber(idx)
	
	local config = ChgVocationAndSex.vocation
	if Actor.checkActorLevel(sysarg, config.reqLevel, config.reqCircle) ~= true then 
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.c000136,config.reqCircle, config.reqLevel), ttFlyTip)
		return 
	end

	
	local vocation = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	if not idx or vocation == idx then
		return
	end
	
	local consumes = config.consumes
	if Consumes.Check(sysarg, consumes, Lang.ScriptTips.c000137) ~= true then
		return 
	end
	
	
	local dvar = Actor.getDyanmicVar(sysarg)
	dvar.changeVocation = idx
	
	local svar = Actor.getStaticVar(sysarg)
	svar.changeVocationFlag = 1
	svar.changeEquipCount = 0
	
	Actor.triggerPictureGuide(sysarg, config.guideId)
	
	
	Actor.closeNPCDialog(sysarg)
	
end

function Cancel()

end

function AbouChangeVocation(sysarg)
	local str = Lang.ScriptTips.c000138
	str = str.."\\<#BL"..Lang.Activity.a00101.."/@main>"  --<返回>
	return str
end

table.insert(MainFnTable, ChangeVocation_Main)