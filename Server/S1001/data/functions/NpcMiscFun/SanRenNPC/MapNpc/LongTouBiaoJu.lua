--跨服龙头镖局（接镖NPC）
--#include "data\functions\Activity\YuanGuBiaoCheUtils.lua" once

local t = {}

t.main = function(sysarg)
	--print("打开接镖NPC界面")
	
	-- 下发接镖数据给前端
	SendCrossYaBiaoInfo(sysarg, 0) -- 0 代表 NPC 界面
end


function GetNpcLongTouBiaoJu() return t end