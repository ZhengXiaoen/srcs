--lua script

--全民活动的奖励

--#include "data\language\LangCode.txt" once   --语言包
--#include "data\config\activityconfig\OpenServerTenDays\OpenServerConfig.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once
--#include "data\config\activity\OpenServerAwardCfg.lua" once

EventCallDispatcher.HandlerWholeAwardOp = function (sysarg, args)
	Actor.sendTipmsg(sysarg,"由于版本更新，该奖励已经取消了！",ttFlyTip)
	return true
	
--[[
	if args[1] == nil then return false end   --第1个参数 
	local nDays = args[1]
	local nLevel = args[2]

	if nDays < 1  then return false end
			
	local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	
	if nDays >= 1 and nDays <= 3 then
		return LevelAward(sysarg,nActorId,nDays)
	elseif nDays >= 4 and nDays <= 6 then
		return ChopAward(sysarg,nActorId,nDays)
	elseif nDays >= 7 and nDays <= 9 then
		return RideAward(sysarg,nActorId,nDays)
	elseif nDays >= 10 and nDays <= 12 then
		return SwingAward(sysarg,nActorId,nDays)
	end
	
	return false
	--]]
end

--[[
function LevelAward(sysarg,nActorId,nDays)
	
	local sVar = System.getStaticVar()
	local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	if not sVar.TopLevel then
		sVar.TopLevel = {}
		for i = 1,3 do
			sVar.TopLevel[i] = {}
			for j = 1,4 do
				sVar.TopLevel[i][j] = {}
			end
		end
	end
	
	local nJobTopLevel = sVar.TopLevel[nJob]
	for i = 1,3 do
		if nJobTopLevel[i].id then			
			if nJobTopLevel[i].id == nActorId then
				Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf269,i),2048) 
				return true
			end
		end
	end
	
	local config = OpenServerAward.LevelTournament
	local award 
	if nDays == 1 then
		award = config[6].award
	elseif nDays == 2 then
		award = config[5].award
	elseif nDays == 3 then
		award = config[4].award
	end
	if not award then return end
	
	if Awards.CheckBagGridCount(sysarg,award) then
		if Awards.Give(sysarg,award,1008,"开服全名竞技奖励") == true then
			return true
		end
	else
		return false
	end
	
	return false
end

function ChopAward(sysarg,nActorId,nDays)
	
	local sVar = System.getStaticVar()
	if not sVar.TopChop then
		sVar.TopChop = {}
		for i = 1,4 do
			sVar.TopChop[i] = {actorid=0,name="",value=0}
		end
	end
	
	for i = 1, 3 do
		if sVar.TopChop[i].actorid then
			if nActorId == sVar.TopChop[i].actorid then
				Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf270,i),2048) 
				return true
			end
		end
	end
	
	local config = OpenServerAward.ChopTournament
	local award 
	if nDays == 4 then
		award = config[6].award
	elseif nDays == 5 then
		award = config[5].award
	elseif nDays == 6 then
		award = config[4].award
	end
	if not award then return end
	
	if Awards.CheckBagGridCount(sysarg,award) then
		if Awards.Give(sysarg,award,1008,"开服全名竞技奖励") == true then
			return true
		end
	else
		return false
	end
	
	return false
end

function RideAward(sysarg,nActorId,nDays)
	
	local sVar = System.getStaticVar()
	if not sVar.TopMount then
		sVar.TopMount = {}
		for i = 1,4 do
			sVar.TopMount[i] = {actorid=0,name="",ridelevel=0,rideExp=0}
		end
	end
	
	for i = 1, 3 do
		if sVar.TopMount[i].actorid then
			if nActorId == sVar.TopMount[i].actorid then
				Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf271,i),2048)
				return true
			end
		end
	end
	
	local config = OpenServerAward.RideTournament
	local award 
	if nDays == 7 then
		award = config[6].award
	elseif nDays == 8 then
		award = config[5].award
	elseif nDays == 9 then
		award = config[4].award
	end
	if not award then return end
	
	if Awards.CheckBagGridCount(sysarg,award) then
		if Awards.Give(sysarg,award,1008,"开服全名竞技奖励") == true then
			return true
		end
	else
		return false
	end
	
	return false
end

function SwingAward(sysarg,nActorId,nDays)
	
	local sVar = System.getStaticVar()
	if not sVar.TopSwing then
		sVar.TopSwing = {}
		for i = 1,4 do
			sVar.TopSwing[i] = {actorid=0,name="",swingLevel=0,swingExp=0}
		end
	end
	
	for i = 1, 3 do
		if sVar.TopSwing[i].actorid then
			if nActorId == sVar.TopSwing[i].actorid then
				Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf272,i),2048)
				return true
			end
		end
	end
		
	local config = OpenServerAward.SwingTournament
	local award 
	if nDays == 10 then
		award = config[6].award
	elseif nDays == 11 then
		award = config[5].award
	elseif nDays == 12 then
		award = config[4].award
	end
	if not award then return end
	
	if Awards.CheckBagGridCount(sysarg,award) then
		if Awards.Give(sysarg,award,1008,"开服全名竞技奖励") == true then
			return true
		end
	else
		return false
	end
	
	return false
end
--]]

--八天开服活动奖励
EventCallDispatcher.HandlerNewServerEightDayActivity = function (sysarg, args)
	if args[1] == nil then return false end   --第1个参数 
	local nDays = args[1]
	local nLevel = args[2]
	if nDays < 1  then return false end
	if Awards.CheckBagGridCount(sysarg,OpenServerConfig.activitys[nDays].firstAwards) then
		local sActivityTips = Lang.Activity.nsed0001
		if nDays == 2 then			
			sActivityTips = Lang.Activity.nsed0002
		elseif nDays == 3 then
			sActivityTips = Lang.Activity.nsed0003
		elseif nDays == 4 then
			sActivityTips = Lang.Activity.nsed0004
		elseif nDays == 5 then
			sActivityTips = Lang.Activity.nsed0005
		elseif nDays == 6 then
			sActivityTips = Lang.Activity.nsed0006
		elseif nDays == 7 then
			sActivityTips = Lang.Activity.nsed0007
		elseif nDays == 8 then
			sActivityTips = Lang.Activity.nsed0008
		end
		if Awards.Give(sysarg,OpenServerConfig.activitys[nDays].firstAwards,57,sActivityTips) == true then
			return true
		end
	end

	return false
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeNewServerEightDayActivity, EventCallDispatcher.HandlerNewServerEightDayActivity)

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeWholeActivityAwards, EventCallDispatcher.HandlerWholeAwardOp)