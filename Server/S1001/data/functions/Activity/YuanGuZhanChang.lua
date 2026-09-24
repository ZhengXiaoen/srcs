--#include "data\config\activity\YuanGuZhanChangCfg.lua" once
--#include "data\config\GlobalConfig.lua" once
--#include "data\config\CrossServerConfig.lua" once

function YuanGuZhanChangInitServer()
	--这个服务器是不是跨服服务器，不是就不刷了
	if System.isCrossServer() ~=true then 
		print("不是跨服务器，不开启远古战场刷怪定时器")
		return 
	end
	print("是跨服务器，已经开启远古战场刷怪定时器")
	
	--先刷一波怪
	for i=1,#YuanGuZhanChangCfg.RefMonsters do
		local cfg = YuanGuZhanChangCfg.RefMonsters[i]
		local sceneId = cfg.mapId
		local hScene = Fuben.getSceneHandleById(sceneId,0) --取的secne的handle
		for j=1,#cfg.bossIds do	
			local bossId = cfg.bossIds[j]
			if Fuben.getLiveMonsterCount(hScene,bossId)==0 then --场景中没有这只怪物
				local pMonster = Fuben.createMonster(hScene, bossId, cfg.points[j][1], cfg.points[j][2], 0)
				if pMonster ~= nil then
					System.YGZC_OnBossRefreshed(sceneId, bossId, false)
				end
			end
		end
	end
	
	System.addTimer("YGZC_refMonsters_Time",30*1000,-1) --30秒定时器
end

YGZC_refMonsters_Time =function()
	--local dvar =System.getDyanmicVar()
    --
	--if dvar.YGZC_refMonsters~=nil then --不允许刷新
	--	dvar.YGZC_refMonsters = dvar.YGZC_refMonsters + 1
	--	if dvar.YGZC_refMonsters>500 then 
	--		dvar.YGZC_refMonsters=nil   --重置允许刷新(达到了时间就刷新)
	--	end
	--end
	
	--local nHour,nMin,nSec = System.getTime(0,0,0)
	--if nMin == 0 then
	--	if dvar.YGZC_refMonsters ==nil then --允许刷新
	--		dvar.YGZC_refMonsters =1		--刷新一次后重置不允许刷新
	--		
	--		--刷怪，先判断这个场景里面有没有怪物，有的话就不刷，没有的话就刷。。。
	for i=1,#YuanGuZhanChangCfg.RefMonsters do 
		local cfg = YuanGuZhanChangCfg.RefMonsters[i]
		local sceneId = cfg.mapId
		local hScene = Fuben.getSceneHandleById(sceneId,0) --取的secne的handle
		for j=1,#cfg.bossIds do	
			local bossId = cfg.bossIds[j]
			if Fuben.getLiveMonsterCount(hScene,bossId)==0 then --场景中没有这只怪物	
				
				local dVar = System.getDyanmicVar()
				if dVar.kfBossBeK==nil then 
					dVar.kfBossBeK={}
				end
				if dVar.kfBossBeK[bossId]~=nil and System.getCurrMiniTime()-dVar.kfBossBeK[bossId] >3 * 60 then  --如果10分钟的间隔超过了。。
					local pMonster = Fuben.createMonster(hScene, bossId, cfg.points[j][1],  cfg.points[j][2], 0)
					if pMonster ~=nil then 
						System.trace(string.format(sceneId.."跨服boss刷新"..bossId))
					end
					if pMonster ~= nil then
						--System.broadcastTipmsg(System.getMonsterNameById(bossId).."已在地图刷新", 128)
						System.YGZC_OnBossRefreshed(sceneId, bossId, true)
						
						local playerList = LuaHelp.getSceneActorListById(sceneId)  --只在当前场景播放
						if playerList ~= nil then
							for i = 1, #playerList do
								local player = playerList[i]
								if player then		
									Actor.sendTipmsg(player,System.getMonsterNameById(bossId).."已在地图刷新", 128)
								end
							end
						end
					end
				end
			end
		end
	end
	--	end
	--end
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
