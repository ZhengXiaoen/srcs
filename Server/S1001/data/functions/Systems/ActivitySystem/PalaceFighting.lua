-- 皇宫大乱斗
--#include "data\config\activityconfig\PalaceFightingCfg.lua" once

-- 是否在皇宫大乱斗活动时间内
--function IsInPalaceFightingTime()
--	return System.isInTimeRange(19,0,0, 19,15,0)
--end

-- 皇宫大乱斗活动开始
function PalaceFighting_Start(sysarg, startTime, endTime)
	local dVar = System.getDyanmicVar()
	dVar.PalaceFightingStart = 1
	
	PalaceFighting_Tip() -- 皇宫大乱斗活动提示
	
	dVar.PalaceFightingCount = nil
	dVar.PalaceFightingIds = nil
	dVar.PalaceFightingTimes = nil
	
	-- 排行榜先清0
	Ranking.clear_ranking(3, true)
	
	-- 刷新所有怪
	local hScene = Fuben.getSceneHandleById(10, 0)	
	for i, v in ipairs(PalaceFightingCfg.monsters) do
		Fuben.createMonstersInRange(hScene, v[1], 0, 0, -1, -1, v[2], endTime and (endTime - System.getCurrMiniTime()) or 15 * 60)
	end
	
	--注册定时回调函数
	System.registerTimeCall(NULL, "PalaceFighting_OnTime", NULL, 1, false)
	
end

-- 皇宫大乱斗活动提示
function PalaceFighting_Tip()
	local ex = "我也要参加<(x"..Fuben.getSceneNameById(10)..":140:142:[传])>"
	local str = "皇宫活动已开启！击杀BOSS掉落稀有道具！并有机会进入神秘皇宫！"..ex
    System.broadcastTipmsg(str, ttChatWindow)
end

-- 皇宫大乱斗活动结束
function PalaceFighting_End()
	local dVar = System.getDyanmicVar()
	dVar.PalaceFightingStart = nil
	
	--删除定时器
	local timerH = System.getTimeCall(NULL, "PalaceFighting_OnTime")
	if timerH then
		System.unregisterTimeCall(timerH)
	end
	
	dVar.PalaceFightingCount = nil
	dVar.PalaceFightingIds = nil
	dVar.PalaceFightingTimes = nil
	
	local str = "皇宫大乱斗活动已经结束！击杀活动BOSS将不会获得积分！"
    System.broadcastTipmsg(str, ttChatWindow)

	local hScene = Fuben.getSceneHandleById(PalaceFightingCfg.fightingSceneId, 0)			
	local pMonster = Fuben.createMonster(hScene, PalaceFightingCfg.fightingMonsterId, 37, 33, 5 * 60 * 60 - 16 * 60)
	if pMonster == nil then
		print("error, PalaceFighting_End pMonster == nil")
	end

	-- 传送10名玩家到皇宫大乱斗地图
	Fuben.palaceFighting_End()
	
	Ranking.save_ranking(3, true)
end

function PalaceFighting_OnTime()
	local dVar = System.getDyanmicVar()
	local count = dVar.PalaceFightingCount
	if count == nil or count == 0 then return end
	
	local PalaceFightingIds = dVar.PalaceFightingIds
	local PalaceFightingTimes = dVar.PalaceFightingTimes
		
	if PalaceFightingIds == nil or PalaceFightingTimes == nil then return end
	
	local curTime = System.getCurrMiniTime()
	local hScene = 0
	
	local hasMonster = false
	for i=1, count do
		local t = PalaceFightingTimes[i]
		if t ~= nil then
			if t <= curTime then
				if hScene == 0 then
					hScene = Fuben.getSceneHandleById(10, 0)
				end
				
				local pMonster = Fuben.createMonster(hScene, PalaceFightingIds[i], -1, -1, 15 * 60)
				if pMonster ~= nil then
					--print("----refresh monster id="..PalaceFightingIds[i])
					dVar.PalaceFightingIds[i] = nil
					dVar.PalaceFightingTimes[i] = nil			
				else
					hasMonster = true
				end
			else
				hasMonster = true
			end
		end
	end
	
	if not hasMonster then
		dVar.PalaceFightingCount = nil
		dVar.PalaceFightingIds = nil
		dVar.PalaceFightingTimes = nil
	end 
end

function PalaceFighting_BossDeathDropBoxs()
	local hScene = Fuben.getSceneHandleById(PalaceFightingCfg.fightingSceneId, 0)	
	Fuben.createMonstersInRange(hScene, PalaceFightingCfg.freeBox, 0, 0, -1, -1, 7, 4 * 60 * 60)
	Fuben.createMonstersInRange(hScene, PalaceFightingCfg.ybBox, 0, 0, -1, -1, 3, 4 * 60 * 60)
end

function PalaceFighting_OnMonsterByKilled(monster, sysarg, monId, sceneId)
	if sceneId == PalaceFightingCfg.fightingSceneId and monId == PalaceFightingCfg.fightingMonsterId then
		PalaceFighting_BossDeathDropBoxs()
		return
	end
	
	local dVar = System.getDyanmicVar()
	if dVar.PalaceFightingStart == nil then -- 活动已经结束		
		return
	end
		
	local cfg
	for i, v in ipairs(PalaceFightingCfg.monsters) do
		if v[1] == monId then
			cfg = v
			break
		end
	end
	
	if cfg == nil then return end
	
	if dVar.PalaceFightingIds == nil or dVar.PalaceFightingTimes == nil then
		dVar.PalaceFightingIds = {}
		dVar.PalaceFightingTimes = {}
		dVar.PalaceFightingCount = 0
	end
		
	if dVar.PalaceFightingCount == nil then
		dVar.PalaceFightingCount = 0
	end
		
	local curTime = System.getCurrMiniTime()
	
	local _count = dVar.PalaceFightingCount
	local foundIdx = 0
	for i = 1, _count do
		if dVar.PalaceFightingIds[i] == nil then
			foundIdx = i
			break
		end
	end
	
	if foundIdx == 0 then
		foundIdx = dVar.PalaceFightingCount+1
	end
	
	dVar.PalaceFightingIds[foundIdx] = cfg[1]
	dVar.PalaceFightingTimes[foundIdx] = curTime + cfg[3]
	if foundIdx > dVar.PalaceFightingCount then
		dVar.PalaceFightingCount = foundIdx
	end
	
	-- 不足80级，打BOSS没有积分
	if Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL) < 80 then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local oldScore = var.days.PalaceFightingScore
	if oldScore == nil then	oldScore = 0 end
	
	local newScore = oldScore + cfg[4]		
	var.days.PalaceFightingScore = newScore
	
	local newpos, oldpos = Ranking.update_value(3, sysarg, newScore)
	
	PalaceFighting_SendMyScore(sysarg, newScore)
	
	if newpos < 3 then
		local hScene = Fuben.getSceneHandleById(10, 0)
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		
		local npack = DataPack.allocPacketEx()
		if (npack ~= nil) then
			DataPack.writeByte(npack, 151)
			DataPack.writeByte(npack, LogicCmd.miscSysEx.sub.sPalaceFighting)
			DataPack.writeByte(npack, 2) -- 排行榜			
	
			-- 我的排名, 从0开始, -1则不进排行榜
			local count, myRank = Ranking.packetRankingItems(npack, 3, 3, actorId)			
			
			Fuben.sceneBroadCastMsg(hScene, npack)
			DataPack.freePacketEx(npack)
		end
	end
		
	Actor.sendTipmsg(sysarg, string.format("击杀%s获得%d积分", Actor.getName(monster), cfg[4]), ttFlyTip)
end

-- 发送我的积分
function PalaceFighting_SendMyScore(sysarg, score)
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sPalaceFighting)
	DataPack.writeByte(netPack, 1) -- 发送我的积分
	
	DataPack.writeUInt(netPack, score)
		
	DataPack.flush(netPack)
end

-- 获得排行榜数据
function PalaceFighting_SendData(sysarg)
	if Actor.getSceneId(sysarg) ~= 10 then
		return
	end
	
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sPalaceFighting)
	DataPack.writeByte(netPack, 3) -- 获得排行榜数据
	
	-- 我的排名, 从0开始, -1则不进排行榜
	local count, myRank = Ranking.packetRankingItems(netPack, 3, 3, actorId)
	
	local var = Actor.getStaticVar(sysarg)
	local myScore = var.days.PalaceFightingScore
	if myScore == nil then	myScore = 0 end
	
	DataPack.writeUInt(netPack, myScore)
	
	DataPack.flush(netPack)
end

function PalaceFighting_NewDayArrive()
	local playerList = LuaHelp.getSceneActorListById(PalaceFightingCfg.fightingSceneId)		
	for i, player in ipairs(playerList or {}) do
		Actor.returnCity(player)
	end	
end

function PalaceFighting_ExitScene(sysarg)
	if Actor.getSceneId(sysarg) ~= PalaceFightingCfg.fightingSceneId then
		return
	end
	
	Actor.returnCity(sysarg)
end

function PalaceFighting_main(sysarg, sysid, packet)
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 获得排行榜数据
		PalaceFighting_SendData(sysarg)
	elseif msgid == 2 then -- 退出皇宫大乱斗场景
		PalaceFighting_ExitScene(sysarg)
	else
		print("error PalaceFighting_main, unknown msgid="..msgid)
		return
	end
end