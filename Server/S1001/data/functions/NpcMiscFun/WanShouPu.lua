
--#include "data\config\quest\EntrustReward.lua" once

--任务公告板功能选项
local LimitLevel = 55

function RenWuGongGaoBan_Main( sysarg )	
	local dlgStr = ""
	
	if Actor.checkActorLevel(sysarg, LimitLevel, 0) then
		dlgStr = string.format("\\%s<#BL%s/@ViewWanShouPu>", dlgStr, Lang.ScriptTips.wsp001)
	end	
	return dlgStr
end

function ViewWanShouPu(sysarg)
	return Lang.ScriptTips.wsp002 .. Lang.ScriptTips.back001
end

function AcceptBookQuest(sysarg)
	Actor.sendBookQuest(sysarg, EntrustReward.BookQuestId)
	Actor.closeNPCDialog(sysarg)
end

table.insert(MainFnTable, RenWuGongGaoBan_Main)