--秘境之旅
--#include "data\functions\Systems\ActivitySystem\MiJingZhiLv.lua" once
local t = {}
t.main = function(sysarg)
	--//主显示内容
	local strRewardicon = string.format("<(%s)>","iaward#10#1")
	local str = "<#BN进入下一层/@NextLayer>"
	if Actor.getSceneId(sysarg) -219 ==  10 then --获得当前的层数
		str = "<#BN离开/@NextLayer>"
	end
	local echo = [[
<(idecoLine#350)>
		      <(c0xFF00c0ff)秘境之旅传送员>
     <(ifragments#16#18)><(c0xFF00FF00)击败所有怪物的人才能进入下一层>
     <(ifragments#16#18)><(c0xFF00FF00)通关奖励:>]]..strRewardicon..[[



	<#BN进入下一层/@NextLayer>
]]
	 return echo;
end


t.NextLayer = function (sysarg)
	local numberofplies =Actor.getSceneId(sysarg) -219--获得当前的层数
    local cfg = StdActivityCfg.MiJingZhiLv
	local svar = Actor.getStaticVar(sysarg)
	local nHandle = Fuben.getSceneHandleById(Actor.getSceneId(sysarg), 0)
	if Fuben.getLiveMonsterCount(nHandle) == 0 then  
		if svar.days.MiJingZhiLvHighestLayer <= numberofplies then --判断今天是否是第一次通过

			cfg.Awards[numberofplies].count = math.random(cfg.Awards[numberofplies].mincount,cfg.Awards[numberofplies].maxcount)
			local tItems = {cfg.Awards[numberofplies]}
			if Awards.Give(sysarg, tItems,2619,"秘境之旅奖励") ~= true then
				--Actor.sendTipmsg(sysarg, "背包空间不足以容纳奖品", ttFlyTip)
				--return
			end
			svar.days.MiJingZhiLvHighestLayer = svar.days.MiJingZhiLvHighestLayer + 1
		end

		if numberofplies == 10 then --已经是最高层了
				exit_MiJingZhiLv(sysarg)
				--退出活动
				--print("提前结束活动")
				return
		else
			Actor.enterScene(sysarg, cfg.scenes[numberofplies+1], -1, -1)
			updateAndsendActivityData_mjzl(sysarg, cfg.scenes[numberofplies+1])
		end
	else 
		Actor.sendTipmsg(sysarg, "当前场景的怪物没有清理干净，请清理完再来", ttFlyTip)
	end

	
end


function GetNpcMJZLChuanSongYuan() return t end