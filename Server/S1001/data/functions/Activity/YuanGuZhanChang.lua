--#include "data\config\activity\YuanGuZhanChangCfg.lua" once
--#include "data\config\GlobalConfig.lua" once
--#include "data\functions\Activity\LocalCross.lua" once

LocalDT.LocalBattlefieldBossConfig = {}
LocalDT.LocalBattlefieldBossIds = {}
LocalDT.LocalBattlefieldRespawnDelay = 3 * 60
for _, cfg in ipairs(YuanGuZhanChangCfg.RefMonsters) do
    local scene = LocalDT.LocalCrossScenes[cfg.mapId]
    if scene and scene.activity == 0 then
        LocalDT.LocalBattlefieldBossConfig[cfg.mapId] = cfg
        for _, bossId in ipairs(cfg.bossIds) do
            LocalDT.LocalBattlefieldBossIds[bossId] = true
        end
    end
end

LocalDT.GetLocalBattlefieldBossTimes = function(sceneId, create)
    local state = System.getDyanmicVar()
    if create and not state.localBattlefieldBossTimes then
        state.localBattlefieldBossTimes = {}
    end
    local times = state.localBattlefieldBossTimes
    if create and not times[sceneId] then times[sceneId] = {} end
    return times and times[sceneId]
end

-- 刷怪状态跟随怪物实际所在场景，玩家、宠物或战将补刀都可开始计时。
LocalDT.RecordLocalBattlefieldBossDeath = function(monster, bossId)
    if not monster or not LocalDT.LocalBattlefieldBossIds[bossId] or not LocalDT.LocalCrossEnabled() then return end
    local sceneId = Actor.getSceneId(monster)
    local cfg = LocalDT.LocalBattlefieldBossConfig[sceneId]
    if not cfg then return end
    for _, id in ipairs(cfg.bossIds) do
        if id == bossId then
            local times = LocalDT.GetLocalBattlefieldBossTimes(sceneId, true)
            if not times[bossId] then
                times[bossId] = System.getCurrMiniTime() + LocalDT.LocalBattlefieldRespawnDelay
                RefreshCrossBossInfoUIToAllActor(sceneId)
            end
            return
        end
    end
end

LocalDT.UpdateLocalBattlefieldBosses = function()
    local now = System.getCurrMiniTime()
    for sceneId, cfg in pairs(LocalDT.LocalBattlefieldBossConfig) do
        local handle = Fuben.getSceneHandleById(sceneId, 0)
        if handle and handle ~= 0 then
            local times = LocalDT.GetLocalBattlefieldBossTimes(sceneId, true)
            local refresh = false
            for index, bossId in ipairs(cfg.bossIds) do
                if Fuben.getLiveMonsterCount(handle, bossId) == 0 then
                    refresh = true
                    if not times[bossId] then
                        -- 补记未收到死亡回调的首领，避免一直显示存活。
                        times[bossId] = now + LocalDT.LocalBattlefieldRespawnDelay
                    elseif now >= times[bossId] and
                        Fuben.createMonster(handle, bossId, cfg.points[index][1], cfg.points[index][2], 0) then
                        times[bossId] = nil
                        for _, actor in ipairs(LuaHelp.getSceneActorListById(sceneId) or {}) do
                            Actor.sendTipmsg(actor, System.getMonsterNameById(bossId).."已在地图刷新", 128)
                        end
                    end
                elseif times[bossId] then
                    times[bossId] = nil
                    refresh = true
                end
            end
            if refresh then RefreshCrossBossInfoUIToAllActor(sceneId) end
        end
    end
end

function YuanGuZhanChangInitServer()
	local crossServer = System.isCrossServer()
	if not crossServer and not LocalDT.LocalCrossEnabled() then return end
	
	--先刷一波怪
	for i=1,#YuanGuZhanChangCfg.RefMonsters do
		local cfg = YuanGuZhanChangCfg.RefMonsters[i]
		local sceneId = cfg.mapId
		local hScene = Fuben.getSceneHandleById(sceneId,0) --取的secne的handle
		if hScene and hScene ~= 0 and (crossServer or LocalDT.LocalBattlefieldBossConfig[sceneId]) then
			for j, bossId in ipairs(cfg.bossIds) do
				if Fuben.getLiveMonsterCount(hScene, bossId) == 0 then
					local monster = Fuben.createMonster(hScene, bossId, cfg.points[j][1], cfg.points[j][2], 0)
					if monster and crossServer then
						System.YGZC_OnBossRefreshed(sceneId, bossId, false)
					end
				end
			end
		end
	end
	
	System.addTimer("YGZC_refMonsters_Time",crossServer and 30000 or 5000,-1)
end

YGZC_refMonsters_Time = function()
    if not System.isCrossServer() then
        if LocalDT.LocalCrossEnabled() then LocalDT.UpdateLocalBattlefieldBosses() end
        return
    end
    local killed = System.getDyanmicVar().kfBossBeK
    if not killed then return end

    local now = System.getCurrMiniTime()
    for _, cfg in ipairs(YuanGuZhanChangCfg.RefMonsters) do
        local sceneId = cfg.mapId
        local handle = Fuben.getSceneHandleById(sceneId, 0)
        if handle and handle ~= 0 then
            for index, bossId in ipairs(cfg.bossIds) do
                if killed[bossId] and now - killed[bossId] >= 3 * 60
                    and Fuben.getLiveMonsterCount(handle, bossId) == 0
                    and Fuben.createMonster(handle, bossId, cfg.points[index][1], cfg.points[index][2], 0) then
                    System.YGZC_OnBossRefreshed(sceneId, bossId, true)
                    for _, actor in ipairs(LuaHelp.getSceneActorListById(sceneId) or {}) do
                        Actor.sendTipmsg(actor, System.getMonsterNameById(bossId).."已在地图刷新", 128)
                    end
                end
            end
        end
    end
end

--远古战场开始
function YuanGuZhanChangStart()

	--跨服的时候不提示这些
	if System.isCrossServer() then return end    
	
    if System.getDaysSinceOpenServer() < CrossServerConfig.YuanGuZhanChangOpenDay and CanPassCrossServer()==false then		
		return 
	end
	 

    local str = "远古战场已开启！跨服挑战远古BOSS<我也要参加/@@showWin,222>"
    System.broadcastTipmsg(str,ttChatWindow)
	local svar = System.getDyanmicVar()
    svar.yuanGuZhanChangTime = 1
	
    local playerList = LuaHelp.getAllActorList()		
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then	
				local pack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sYuanGuZhanChangStart)
				DataPack.writeByte(pack,1) --开启
				DataPack.flush(pack)
			end
		end
	end
end
--远古战场结束
function YuanGuZhanChangEnd(bForce)
    
	local svar = System.getDyanmicVar()
    svar.yuanGuZhanChangTime = nil
	if not bForce then LocalDT.ExitLocalCrossGroup(0) end
	
	if System.isCrossServer() then 
		--把人搞出来
		 for i =1,#CrossServerConfig.EnterScene do
            local cfg = CrossServerConfig.EnterScene[i]
            local cfgScene = cfg.nSceneId
            for j =1,#cfgScene do
                local nSceneId = cfgScene[j]
                local playerList = LuaHelp.getSceneActorListById(nSceneId) 
	            if playerList ~= nil then
		            for k = 1, #playerList do
			            local player = playerList[k]
			            if player then		
							Actor.exitCrossServer(player)
				           --EndYuanGuYaBiaoAndExit(player,1)
			            end
		            end
	            end
            end

        end
	else 
        if bForce ~= nil then 
          
            return 
        end
		System.broadcastTipmsg("远古战场活动已经结束", ttChatWindow)
		local playerList = LuaHelp.getAllActorList()		--获取某场景玩家对象列表
		if playerList ~= nil then
			for j = 1, #playerList do
				local player = playerList[j]
				if player then	
					local pack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sYuanGuZhanChangStart)
					DataPack.writeByte(pack,0) --开启
					DataPack.flush(pack)
				end
			end
		end
	end
end



function YuanGuZhanChangGuildStart()

	--跨服的时候不提示这些
	if System.isCrossServer() then return end    
	local week = System.getDayOfWeek()
   
    if week == 1 or week == 3 or  week == 5 or week == 0 then

    else
        
        return
    end

    local str = "龙冢禁地已开启！跨服挑战远古BOSS<我也要参加/@@showWin,222>"
    System.broadcastTipmsg(str,ttChatWindow)
	local svar = System.getDyanmicVar()
    svar.yuanGuZhanChangguildTime = 1
	svar.yuanGuZhanChangguildcd = System.getCurrMiniTime()
    local playerList = LuaHelp.getAllActorList()		
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then	
				local pack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sCrossGuildState)
				DataPack.writeByte(pack,1) --开启
				DataPack.flush(pack)
			end
		end
	end
end
--远古战场结束
function YuanGuZhanChangGuildEnd(bForce)
    
	local svar = System.getDyanmicVar()
    svar.yuanGuZhanChangguildTime = nil
	svar.yuanGuZhanChangguildcd = nil
	if not bForce then LocalDT.ExitLocalCrossGroup(4) end
	if System.isCrossServer() then 
		--把人搞出来
		 for i =1,#CrossServerConfig.GuildEnterScene do
            local cfg = CrossServerConfig.GuildEnterScene[i]
            local cfgScene = cfg.nSceneId
            for j =1,#cfgScene do
                local nSceneId = cfgScene[j]
                local playerList = LuaHelp.getSceneActorListById(nSceneId) 
	            if playerList ~= nil then
		            for k = 1, #playerList do
			            local player = playerList[k]
			            if player then		
							Actor.exitCrossServer(player)
				           --EndYuanGuYaBiaoAndExit(player,1)
			            end
		            end
	            end
            end

        end
	else 
        if bForce ~= nil then 
          
            return 
        end
		System.broadcastTipmsg("龙冢禁地活动已经结束", ttChatWindow)
		local playerList = LuaHelp.getAllActorList()		--获取某场景玩家对象列表
		if playerList ~= nil then
			for j = 1, #playerList do
				local player = playerList[j]
				if player then	
					local pack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sCrossGuildState)
					DataPack.writeByte(pack,0) --开启
					DataPack.flush(pack)
				end
			end
		end
	end
end
