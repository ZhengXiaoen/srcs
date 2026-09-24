--lua script
--本脚本实现了死亡后选择复活模式的功能
--先执行OnKillByActor 再执行defaultHandlerPlayerDie

--#include "data\functions\ExpandFunc\ActorReliveCommon.lua" once
--#include "data\config\pk\PVPQuest.lua" once 
--#include "data\functions\guildOperate\CallGuildBossEnvent.lua" once
--#include "data\functions\Activity\Arena\Arena_common.lua" once
--#include "data\functions\Activity\PKChallenge\PKChallengeCommon.lua" once
--#include "data\functions\Activity\CorpsBattle\CorpsBattleCommon.lua" once
--#include "data\functions\Activity\WeekEnd\HuntingCommon.lua" once
--#include "data\functions\Activity\CrossWorldNumOne\CrossWorldOneCommon.lua" once
--#include "data\functions\player.lua" once -- 角色处理
--#include "data\functions\Activity\Dart\ApplyDartCommon.lua"
--#include "data\functions\ActorEvent\ActorFoeHandle.lua"
--#include "data\config\activity\YuanGuZhanChangCfg.lua" once --远古战场0
--#include "data\config\item\NormalItemDatas.lua" once 

-- 判断杀人者是否是玩家
-- incself: 杀人者是否可以是自己。如果为true，杀人者是自己也返回true；否则返回false
EventCallDispatcher.IsKillerActor = function (sysarg, killer, incself)	
	incself = incself or false
	local entity_type = Actor.getEntityType(killer)	
	if (entity_type ~= 0) then
		return false
	end
	
	if ((not incself) and (sysarg == killer)) then		
		return false		
	end
	return true
end


--[[
    函数名称：EventCallDispatcher.OnKillByActor
    函数描述：玩家被玩家杀死调用
    参数 sysarg 的描述：  被杀玩家对象指针 
    参数 killer 的描述：杀死该玩家的对象的指针
    参数 ... 的描述：
]]
EventCallDispatcher.OnKillByActor = function (sysarg, killer)
	--[[
	if (not sysarg or not killer) then return end 
	if (not EventCallDispatcher.IsKillerActor(sysarg, killer[1])) then 
		print("----killed by non actor-----")
		return 
	end
	--]]
	local killerPtr = killer[1]
	if not killerPtr or not sysarg then return end 
	
	local svar = Actor.getStaticVar(sysarg)
	local data = svar.killerData	--被击杀者记录被杀信息
	if not data then 
		svar.killerData = {}
		data = svar.killerData
	end	
	local entity_type = Actor.getEntityType(killerPtr)
	if entity_type == 0 then
		data[1] = Actor.getIntProperty(killerPtr, PROP_CREATURE_LEVEL)	--击杀者等级
		data[2] = Actor.getCampId(killerPtr)	--击杀者阵营ID
		data[3] = Actor.getName(killerPtr)	--击杀者名字
		data[6] = entity_type --击杀者类型
		if sysarg ~= killerPtr then	
			--AwardScoreKillActor(sysarg,killerPtr)
			OnPKChallengePlyDeath( sysarg, killerPtr )		--Pk挑战
			OnKilledInHunting(sysarg, killerPtr)			--狩猎大会
			
			ActorKillOtherGetScore(sysarg,killerPtr)		--战队竞技

			if System.isCommonServer() == true then			--如果是公共服 天下第一战场
				OnKillInCrossWorld(sysarg,killerPtr)
			end

			local sceneId = Actor.getSceneId(killerPtr)
			local questEventId = PVPQuest[sceneId]
			if questEventId then
				if Actor.getCampId(killerPtr) ~= Actor.getCampId(sysarg) then
					Actor.triggerQuestEvent(killerPtr, 127, questEventId, 1)
				end
			end
			
			--处理下仇人列表
			OnKillActor(sysarg, killerPtr)
		end
		
	elseif entity_type == 1 then
		data[3] = Actor.getName(killerPtr)	--击杀者名字
		data[6] = entity_type  --击杀者类型
	else
		data[6] = 2  --击杀者类型 其他类型
	end
	
	-- 处理玩家死亡
	OnPlayerDie(sysarg, killerPtr)
end

--[[
    函数名称：EventCallDispatcher.defaultHandlerPlayerDie
    函数描述：角色死亡调用
    参数 sysarg 的描述：杀死该玩家的对象的指针
    参数 ... 的描述：
]]
EventCallDispatcher.defaultHandlerPlayerDie = function (sysarg, arg)
	if OnKilledInCrossWorld(sysarg) == true then		--在天下第一场景被杀
		return
	end
--    if Actor.getIntProperty(sysarg,PROP_ENTITY_ID) == 84108150 then
--        System.trace("defaultHandlerPlayerDie__hp:"..Actor.getIntProperty(sysarg,PROP_CREATURE_HP))
--    end
    
    local nReliveTime = tonumber(arg[1])
     if nReliveTime == 0 or nReliveTime == nil then
        nReliveTime = ReliveConfig.reliveTime
    end
	--判断玩家是否在擂台 没有则返回0
	local ChallengeId = Actor.getChallenge(sysarg)
	if (ChallengeId ~= 0) then 
		local Status = ChallengeFun.getChallengeStatus(ChallengeId)
		if (Status == csReady or Status == csFight or Status == csEnd) then 
			OnKillPlayerChallenge( sysarg, arg, ChallengeId ) 
		else
			Actor.setReliveTimeOut(sysarg,nReliveTime)
			OpenReliveDialog(sysarg, nReliveTime)
		end
	else
		
		CleanGuildBossOp(sysarg)
	
		
		local sceneId = Actor.getSceneId(sysarg)
		
		--远古战场死亡
		--local inYuanGuZhanChang = false
       
--        if Actor.getEnterCrossType(sysarg) == 0 then
--            inYuanGuZhanChang = true
--        end
--		for i=1,#YuanGuZhanChangCfg.RefMonsters do 
--			if sceneId==YuanGuZhanChangCfg.RefMonsters[i].mapId then 
--				inYuanGuZhanChang = true
--				break
--			end
--		end

		if sceneId==110 then
			Actor.setReliveTimeOut(sysarg,15)
			OpenReliveDialog(sysarg, 15)
		elseif sceneId==564 and Actor.hasMapAreaAttri(sysarg,80) then --如果有不爆装备的地图属性，就是在小房间内，否则在大厅then 
			Actor.setReliveTimeOut(sysarg,30)
			OpenReliveDialog(sysarg, 30)
		elseif Actor.getEnterCrossType(sysarg) == 0  then --远古战场 --跨服类型为远古战场- 
			Actor.setReliveTimeOut(sysarg,30)
			OpenReliveDialog(sysarg, 30)
		else 
			Actor.setReliveTimeOut(sysarg,nReliveTime)
			OpenReliveDialog(sysarg, nReliveTime)
		end
		-- if Actor.hasMapAreaAttri(sysarg,44) then		--要判断是否禁止原地复活
			-- safeResurrection(sysarg)	--直接安全复活
		-- else
			-- OpenReliveDialog(sysarg, ReliveConfig.reliveTime)
		-- end
		--OpenReliveDialog(sysarg, ReliveConfig.reliveTime)
	end
	
	local var = Actor.getStaticVar(sysarg);
	if var.ybstate == 1 then
		OnActorDartFailed(sysarg, StdActivityCfg.DuoBeiYaSong.DartSetup.CampDartFailBeLoot)
		Quest_ShuaXin(sysarg);
	end

    --取消幻形
   local nMagicShapeId = Actor.getMagicShapeId(sysarg)
   if nMagicShapeId > 0 then
        for i = 1,#MagicShapeItem do
            if MagicShapeItem[i].shapeid == nMagicShapeId then
                for j =1,#MagicShapeItem[i].addbuffid do
                    Actor.delBuffById(sysarg,MagicShapeItem[i].addbuffid[j])
                end
                Actor.setMagicShapeId(sysarg,0)
                Actor.collectOperate(sysarg,1)
                break
            end
        end
   end
end
EventCallDispatcher.defaultHandlerBuffRemoved  = function (sysarg, arg)
    local nBuffId = tonumber(arg[1])
    local nIndex = 0
    if nMagicShapeId > 0 then
        for i = 1,#MagicShapeItem do
            for j =1,#MagicShapeItem[i].addbuffid do
                if MagicShapeItem[i].addbuffid[j] == nBuffId then
                    nIndex = i
                    break
                end  
            end
            if nIndex > 0 then break end
               
            break
        end
   end
   if nIndex > 0 then
        for j =1,#MagicShapeItem[nIndex].addbuffid do
            Actor.delBuffById(sysarg,MagicShapeItem[nIndex].addbuffid[j])
        end
        Actor.setMagicShapeId(sysarg,0)
        Actor.collectOperate(sysarg,1)
   end
   
end



EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeOnActorBeKilled, EventCallDispatcher.OnKillByActor)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeOnActorDeath, EventCallDispatcher.defaultHandlerPlayerDie)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeReliveTimeOut, safeResurrection)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeRelive,EventCallDispatcher.OnPlayerRelive )
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeBuffRemoved, EventCallDispatcher.defaultHandlerBuffRemoved)