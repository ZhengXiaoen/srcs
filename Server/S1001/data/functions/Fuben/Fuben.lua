
--灵兽献瑞副本
----#include "data\functions\Fuben\LingShouXianRui.lua" once

--恶魔岭副本(炎龙守卫副本)
--#include "data\functions\Fuben\emoling.lua" once


-- 不管以什么方式退出副本（如传送），该函数一定会被触发
function OnPlayerExitFuben(sysarg, fubenid, fubenptr)
		
	if fubenid == fuben_emoling_cfg.fubenid then
		exit_emoling_cb(sysarg, fubenptr, fubenid)
		
	else -- 调用旧的退出副本处理函数
		-- 不要调用 onExitFubenFunc()， 否则会死循环
		OnExitFubenFunc(sysarg, fubenid)
	end
end

-- 玩家退出场景
function OnPlayerExitSceneNew(sysarg, args)
	local sceneId = args[1]
	local scenePtr = args[2]
	local fubenId = args[3]
	
	if fubenId ~= 0 then -- 退出副本
		local fubenptr = args[4]
		
		OnPlayerExitFuben(sysarg, fubenId, fubenptr)
	end
end

-- 玩家进入场景
function OnPlayerEnterSceneNew(sysarg, args)
	local lastSceneId = args[1] -- 上一个场景ID
	local sceneId = args[2] -- 当前场景ID
	local scenePtr = args[3] -- 当前场景指针
	
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeExitSceneNew, OnPlayerExitSceneNew)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEnterSceneNew, OnPlayerEnterSceneNew)

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEMoLingFuben, on_msg_emoling)
