--王城：伯乐
--#include "data\config\activityconfig\HorseRace\Config.lua" once	--每个楼层配置


--#include "AutoRun.lua" once --时间执行
--#include "RankInit.lua" once	--排行榜初始化

--[[
    函数名称：传送
    函数描述：NPC交互入口
    参数 sysarg 的描述：
]]
function HorseRace_Main(sysarg)	
	local config = HorseRaceConfig
	if (not config) then return "" end
	local str = Lang.Activity.t00140
	str = str.."\\<#BL"..Lang.Activity.t00141.."/@EnterHorseRace>"  --<参加热血赛马>
	str = str.."\\<#BL"..Lang.Activity.a00031.."/@AboutHorseRace>"  --<详情>
	str = str.."\\<#BL"..Lang.Activity.a00032.."/@exit>"  --<离开>
	return str
end

--参加热血赛马
function EnterHorseRace(sysarg)
	local config = HorseRaceConfig
	if not config then return end
	
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	--if level < config.limitLevel then
	if Actor.checkActorLevel(sysarg, config.limitLevel, 0) ~= true then
		Actor.sendTipmsg(sysarg, string.format(Lang.Activity.t00142,config.limitLevel), ttFlyTip)
		return
	end
	
	
	local dval = System.getDyanmicVar()
	
	if dval.HorseRaceStart ~= 1 then
		Actor.sendTipmsg(sysarg, Lang.Activity.t00143, ttFlyTip)
		return 
	end
	
	local enter = config.readyScene

	if not Actor.canTelport(sysarg, enter.sid) then
		return
	end
	if Actor.enterScene(sysarg, enter.sid, unpack(enter.range)) == true then
		--学技能
		for k, v in ipairs(config.skill) do
			if Actor.getSkillLevel(sysarg, v.id) <= 0 then
				Actor.learnSkill(sysarg, v.id, v.level)
			end
		end
		
		--提示
		local hScene = Fuben.getSceneHandleById(enter.sid, 0)
		local leftTime = Fuben.getSceneTime(hScene)
		if leftTime <= 0 then return end
		local state = Lang.Activity.t00144
		if config.actTime - leftTime > config.readyTime then
			state = Lang.Activity.t00145
		end
		Actor.initActivityWind(sysarg, Lang.Activity.t00146, leftTime, string.format(Lang.Activity.t00147, state))
	end
end

--详情
function AboutHorseRace(sysarg)
	local str = ""
	str = str..Lang.Activity.t00148
	str = str.."\\<#BL"..Lang.Activity.a00101.."/@main>"  --<返回>
	return str
end

table.insert(MainFnTable, HorseRace_Main)