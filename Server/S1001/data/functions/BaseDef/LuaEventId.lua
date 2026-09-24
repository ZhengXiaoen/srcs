
-- Lua事件通知ID
LuaEventId = 
{
	ServerStarted = 1, 			-- 服务器启动
	ServerStop = 2, 				-- 服务器停止
	ServerNewDayArrive = 3, 	-- 服务器跨天
	ActorExactNewDayArrive = 4, -- 精确的玩家跨天,不延迟(sysarg)
	PreReloadScript = 5, 		-- 重装脚本前(@rsf)
	PlayerLogin = 6,			-- 玩家登录(sysarg, isCrossDay)
	PlayerLogout = 7,			-- 玩家登出(sysarg)
	ActorNewDayAcrrive = 8,		-- 玩家在线跨天(sysarg)
	ActorPayMoney = 9,			-- 玩家充值(sysarg, yuanBao)
	ScriptRankingNewDayArrive = 10, -- 脚本排行榜跨天
	ActorConsumeYb = 11,		-- 玩家消费元宝(sysarg, yuanBao)
}