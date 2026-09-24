--lua script
--To do something about Login and Logout
----#include "data\config\guild\GuildBiaoChe.lua"  once  --基本设置 
----#include "data\functions\guildOperate\guildBiaoChe\GuildDartCommon.lua" once

--#include "data\functions\AchieveEvents.lua" once
--#include "data\functions\ActorFlags.lua" once

                            
-------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------

--[[
EventCallDispatcher.LoginGuildDartTip = function(sysarg, arg)	
	local CampDartCount = GetCampDartCount(sysarg)
	if (CampDartCount < 0) then 		
		return 
	end
	
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if (level >= LocalDT.CampDartDefine.minLevelLmt and CampDartCount < LocalDT.CampDartDefine.CampDartCntLmtEveryDay) then
		-- 每天的第一次登录给出护镖提示
		local lastLogouttime = Actor.getLastLogoutTime(sysarg)
		if (lastLogouttime < System.getToday()) then
			SendLoginCampDartTip(sysarg)	
		end
	end
end
--]]

--[[
    函数名称：LogoutGuildDartHandler
    函数描述：帮派运镖 角色下线处理 
    参数 sysarg 的描述：
--]]
--[[
EventCallDispatcher.LogoutGuildDartHandler = function(sysarg, arg)	
	
	local sval = Actor.getDyanmicVar(sysarg)		
	if (sval.GuildDartMonster ~= nil) then
	
		--角色死亡下线，当镖车被劫
		if Actor.getIntProperty(sysarg, PROP_CREATURE_HP) > 0 or LootGuildDart(sysarg) ~= true then
			--print(" guarg monster=" .. sval.CampDartMonster)
			--调用运镖失败处理 删除怪物
			OnGuildDartFailed(sysarg, GuildDartConst.DartSetup.CampDartFailActorLogout)
		end
	end
end

EventCallDispatcher.OnGuildFollowedFailedHandler = function(sysarg, arg)	
	local param_count = #arg
	if (param_count > 0) then
		--print(arg[1])
	end
	
	if (arg[1] == nil) then 
		--print("!!! get follower failed, param is nil")
		return 
	end
	local svar = Actor.getDyanmicVar(sysarg)
	if (svar.GuildDartStatus ~= GuildDartConst.DartSetup.CampDartStatusIdle) then
		local followerHdl = Actor.getHandle(arg[1])
		if svar.GuildDartMonster ~= nil then
			if (svar.GuildDartMonster == followerHdl) then  -- 是跟随怪
				Actor.sendTipmsg(sysarg, Lang.TaskTalk.t0071, ttScreenCenter)
			end	
		end
	end
end
--]]

--进入皇宫
EventCallDispatcher.OnGuildEnterSbkSceneHandler = function(sysarg, arg)
	local var = Actor.getStaticVar(sysarg)

	-- 当天已经统计过了
	if get_dayflags_from_var(var, actor_dayflags.enter_sbk) == true then
		return
	end
	
	set_dayflags(sysarg, actor_dayflags.enter_sbk, true)
	
	local times = GetActorVarAchieveData(sysarg, 1, 0)
	times = times + 1
	SetActorVarAchieveData(sysarg, 1, 0, times) -- 保存次数
	
	Actor.triggerAchieveEvent(sysarg, 107, times)
end


--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogout, EventCallDispatcher.LogoutGuildDartHandler)
--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeOnFollowedFailed, EventCallDispatcher.OnGuildFollowedFailedHandler)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEnterSbkScene, EventCallDispatcher.OnGuildEnterSbkSceneHandler)