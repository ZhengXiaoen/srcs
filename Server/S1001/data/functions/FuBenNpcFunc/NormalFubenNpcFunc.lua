--lua script
--#include "FubenCommonFunc.lua" once

--[[键入'ss'并按分号即可按模板生成脚本]]--
function NormalNpcFubenFunc(sysarg)
	local fubenStr = ""
	for k, fbid in ipairs(NPCFubenTable or {}) do
		local level = Actor.getIntProperty( sysarg, PROP_CREATURE_LEVEL )
		local fubenCfg = FuBen[fbid]
		local circleVal = fubenCfg and fubenCfg.circle
		if fubenCfg and Actor.checkActorLevel(sysarg, fubenCfg.minLevel, circleVal or 0) then
			fubenStr = string.format("%s<#BL%s/@OnEnterFubenFunc,%d>",fubenStr,fubenCfg.fbname,fbid)
		end
	end
	return fubenStr
end


function OnEnterFubenFunc(sysarg, fbid)
	local fbid = tonumber(fbid)
	local fbdata = FuBen[fbid]
	local groupid = fbdata.groupId
	if groupid == nil then 
		return 
	end
	local teamId = Actor.getTeamId(sysarg)
	local allCount = GetFubenAllTimes(sysarg, fbid)
	local count = allCount - GetEnterFubenTimes( sysarg, fbid)
	local RecruitTmrStr = ""
	local massStr = ""
	if fbdata.maxPlayCount > 1 then
		RecruitTmrStr = string.format("<#BL%s/@RecruitTeamer,%d>", Lang.ScriptTips.fuben006, fbid)
		massStr = string.format("<#BL%s/@TeamerMass,%d>", Lang.ScriptTips.fuben010, fbid)
	end
	local buyFbTmsStr = ""
	local todayTimes = getTodayFBItemTimes( sysarg, fbid )
	if fbdata.enterTimes and fbdata.enterTimes > todayTimes then
		buyFbTmsStr = string.format("<#BL%s/@BuyEnterTimes,%d>",Lang.ScriptTips.fuben007,fbid)
	end	
	local optStr = string.format("<#BL%s(%d/%d)/@readyEnterFB,%d>%s%s%s",fbdata.fbname,count,allCount,fbid,RecruitTmrStr,massStr,buyFbTmsStr)
	return optStr .. Lang.ScriptTips.back001
end

function enterQuestFuben(sysarg, fubenId)
	local Hfuben = Fuben.createFuBen(fubenId)
	Actor.enterFuBen(sysarg,Hfuben,-1,-1,-1)
end
table.insert(MainFnTable,NormalNpcFubenFunc)