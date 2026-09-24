--王城：星宫管理员

--#include "Common.lua" once	--活动通用
--#include "AutoRun.lua" once --时间执行
--#include "RankInit.lua" once	--排行榜初始化

local ThisNpc = NpcDialog[npcId] -- 别名
--[[
    函数名称：传送
    函数描述：NPC交互入口
    参数 sysarg 的描述：
]]

function ThisNpc.main(sysarg)	
	local config = FloorConfig
	if (not config) then return "" end
	local str = ""
	str = str.."\\<#BL"..Lang.Activity.a00030.."/@EnterMs>"  --<参加魔幻星宫>
	str = str.."\\<#BL"..Lang.Activity.a00031.."/@AboutMs>"  --<详情>
	str = str.."\\<#BL"..Lang.Activity.a00032.."/@exit>"  --<离开>
	return str
end

--参加魔幻星宫
function ThisNpc.EnterMs(sysarg)
	local config = FloorConfig
	if not config then return end
	
	if CheckCondition(sysarg, config[1].conds) ~= true then return end
	local dval = System.getDyanmicVar()
	
	if dval.MagicSkyStart ~= 1 then
		Actor.sendTipmsg(sysarg, Lang.Activity.a00033, ttFlyTip)
		return 
	end
	
	local enter = config[1]
	if Actor.enterScene(sysarg, enter.sid, unpack(enter.range)) == true then
		local hScene = Fuben.getSceneHandleById(enter.sid, 0)
		local leftTime = Fuben.getSceneTime(hScene)
		if leftTime <= 0 then return end
		--Actor.initActivityWind(sysarg, Lang.Activity.a00056a, leftTime, Lang.Activity.a00056b, Lang.Activity.a00056c, 1, Lang.Activity.a00056d, table.getn(config))
		UpdateMSBoard();
	end
end

--详情
function ThisNpc.AboutMs(sysarg)
	local str = ""
	str = str..Lang.Activity.a00034
	str = str.."\\<#BL"..Lang.Activity.a00030.."/@EnterMs>"  --<传送>
	str = str.."\\<#BL"..Lang.Activity.a00101.."/@main>"  --<离开>
	return str
end
