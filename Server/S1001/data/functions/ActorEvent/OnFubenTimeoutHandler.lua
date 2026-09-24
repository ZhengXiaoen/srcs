--lua script
--#include "data\functions\Activity\Toxic\ToxicMain.lua" once  
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "data\config\monster\ChallengeBoss.lua" once

function ChalengeBossFail(sysarg,FuBenId)
	
	if not ChallengeBossConfig then return end
	local config = ChallengeBossConfig.ChallengeBoss.BossInfo

	for _,BossInfo in ipairs(config) do
		if FuBenId == BossInfo.FuBenId then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf207,2048)
			return
		end
	end
	
end

EventCallDispatcher.OnFubenTimeout = function (sysarg,arg)
	--print("--------OnFubenTimeout")
	--sysarg是副本指针,获取副本所有玩家的指针，并让其退出副本
	local FuBenId = arg[1]
	ChalengeBossFail(sysarg,FuBenId)
	
	--sysarg是副本指针
	-- 通关超时则不退出
	if Fuben.getFubenProgress(sysarg) ~= FB_FS_GETAWARD then	
		local actorList = LuaHelp.getFbActorList(sysarg)
		exitToxicBossFuben(sysarg)
		for k, ptr in ipairs(actorList or {}) do
			onExitFubenFunc(ptr, true)
		end
	end
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeFubenTimeOut, EventCallDispatcher.OnFubenTimeout)
