--lua script
--副本怪物通用的死亡处理函数，一般来说，所有以杀怪为目的的副本的怪物都注册成这个函数即可，包括boss和小怪
--这里会判断副本的通关条件是否已经杀死要求的boss或小怪

--#include "data\envir\FuBenTongGuan.lua" once		--这里是副本通过的条件配置
--#include "data\functions\FuBenNpcFunc\OnFubenReward.lua" once  --副本通关奖励
--#include "data\functions\Systems\PaTaSystem\PaTaCommon.lua" once
--#include "data\config\activityconfig\Festival\Demons.lua" once

MonDieDispatcher.CommonDieFunc = function (monster,sysarg,monId)

	--判断副本的通关条件是否达到
	local fbid = Actor.getFubenId(sysarg)
	if fbid == 0 then return end	
	
	-- -----------------------
	-- 修改BUG：玩家在场景1对怪放毒，然后进副本2，副本2还没来得久刷怪时，场景1中有个怪被毒死了，
	-- 这时玩家在副本2中一个怪都还没杀就说副本通关了，所以要检查一下是否在同一场景	
	
	-- 如果不在同一场景
	if Fuben.IsInSameScene(monster, sysarg) == false then
		return
	end
	-- -----------------------

	local conds = TongGuanCondition[fbid]
	if conds == nil then
		return
	end
	local isFinish = true		--判断副本是否达到完成条件

	for i = 1,#conds do
		local condItem = conds[i]
		if condItem then
			if condItem.type == 2 then	--杀掉所有怪物
				if not Actor.isKillAllMonster(sysarg) then			
					isFinish = false
				end
				break			--如果是以杀死所有怪物为目的的，不用判断其他条件了
			elseif condItem.type == 1 then	--杀死某个boss
				local rest = Actor.isKillAllMonster(sysarg,condItem.monsterid)
				if not rest then
					isFinish = false
					break			
				end
			end
		end
	end

	if isFinish then
		--通关条件都达到
		OnFubenPass(sysarg, fbid)
	else
		--print("has not finish")
	end
	return
end                             

MonDieDispatcher.PataFubenMonsterDie = function (monster,sysarg,monId)
	OnKillPaTaMonster(sysarg, monster, mondId)
end

--[[MonDieDispatcher.DemonsBossDie = function( monster, sysarg, monId)
	local sceneId = Actor.getSceneId(monster)
	local pos = DemonsConfig.BossDiedOpenTel[sceneId]
	if pos then
		local hScene = Actor.getSceneHandle(monster)
		Fuben.setTelportVisible(hScene, pos[1], pos[2], true)
	end
end]]

MonDieDispatcher.DemonsCollMonsDie = function( monster, sysarg, monId)
	local info = DemonsConfig.MonsDiedBuff
	Actor.addBuff(sysarg,info.buffType, info.buffGroup, info.value ,info.times,info.interval,info.buffName,info.timeOverlay)
end

--for sceneId, v in pairs(DemonsConfig.BossList) do
--	MonDieDispatcher.register(v.bossId, MonDieDispatcher.DemonsBossDie )
--end
MonDieDispatcher.register(766, MonDieDispatcher.DemonsCollMonsDie )
