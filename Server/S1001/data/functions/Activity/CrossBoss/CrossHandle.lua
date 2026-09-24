--lua script
CrossOpFuncList = {}; -- 客户端网络响应函数表
--#include "CrossBoss_Main.lua" once
--#include "data\functions\Activity\CrossBattlefield\CrossBattlefield_Main.lua" once -- 跨服战场

--[[
	local cEnterCrossOp = 1,				--请求进入跨服场景
	local cGetCrossWorldState = 2,			--请求跨服天下第一的状态
	ccopCrossBattlefieldSignup = 3 -- 降魔战场报名
--]]


EventCallDispatcher.HandlerCrossOp = function (sysarg, args)
 print("EventCallDispatcher.HandlerCrossOp参数："..args[1])	
  if args[1] == nil then return end   
  local func = CrossOpFuncList[args[1]]
  if func ~= nil then
    func(sysarg, args) 
  end
end

--请求进入跨服场景 进入跨服土城
CrossOpFuncList[1] = function (sysarg, args)
	OnEnterCrossSceneOp(sysarg, args)
end

--请求进入跨服场景 "跨" 按钮
CrossOpFuncList[2] = function (sysarg, args)
	OnSendCrossWorldState(sysarg, args)
end

--降魔战场报名
CrossOpFuncList[3] = function (sysarg, args)
	OnCrossBattlefieldApply(sysarg, args)
end

-- 这里看做脚本调用入口
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeCrossOp, EventCallDispatcher.HandlerCrossOp)