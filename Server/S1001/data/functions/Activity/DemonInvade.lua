--魔族入侵活动
--#include "data\config\activity\DemonInvadeCfg.lua" once

function GetDemonInvadeMonsterLiveTime(n, endHour)
	local curTime = System.getCurrMiniTime()
	local nYear, nMonth, nDay, nHour, nMin, nSec = System.GetSystemTimeInMiniTime(curTime, 0, 0, 0, 0, 0, 0)	
		
	local endTime = System.encodeNumTime(nYear, nMonth, nDay, endHour, 0, 0)
	local liveTime = endTime - curTime

	return liveTime
end

function BroadcastDemonInvadeActivityMsg(n, isDayActivity)
	local onlinePlayerList = LuaHelp.getAllActorList(DemonInvadeCfg.needLevel)
	if not onlinePlayerList then return end
		
	for _,player in ipairs(onlinePlayerList) do
		if player then
			local netPack = DataPack.allocPacket(player, 26, 70)
			DataPack.writeByte(netPack, 6) -- 前端通过(26,65)协议回传给后端，参考 data\functions\ActorEvent\ActivityTipWin.lua
			DataPack.writeString(netPack,DemonInvadeCfg.titleName)
			DataPack.writeString(netPack,DemonInvadeCfg.content)
			DataPack.writeByte(netPack,1)
			DataPack.writeString(netPack,DemonInvadeCfg.buttonName)
			DataPack.flush(netPack)
		end
	end
	
	local id = 19
	if isDayActivity then id = 18 end
	
	local dlgStr = "@EnterDemonInvadeScene"
	StrTipsFunc(dlgStr,activityTips[id].tips,id) 
		
	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf404,n), 2048)
end

--开始魔族入侵活动(n为第几波怪，从1开始)
function StartDemonInvadeActivity(n, endHour)
	n = tonumber(n)
	endHour = tonumber(endHour)
	
	local monsterList = DemonInvadeCfg.refreshList[n]
	if monsterList == nil then print("error! StartDemonInvadeActivity DemonInvadeCfg.refreshList["..n.."] == nil") return end
	
	local hScene = Fuben.getSceneHandleById(DemonInvadeCfg.sceneId, 0)
	if hScene == 0 then print("error! StartDemonInvadeActivity hScene == 0") return end
	
	local count = #monsterList
	if count <= 0 then return end
	
	local liveTime = GetDemonInvadeMonsterLiveTime(n, endHour)
	if liveTime <= 0 or liveTime >= 3700 then
		print("error! StartDemonInvadeActivity liveTime error")
		return
	end
	
	print("StartDemonInvadeActivity("..n..")")
	
	-- 固定位置刷boss
	Fuben.createMonster(hScene, monsterList[1], DemonInvadeCfg.bossPos[1], DemonInvadeCfg.bossPos[2], liveTime)
	
	local rc = DemonInvadeCfg.monsterRect
	for i = 2, count do
		local y = math.random(rc[2],rc[4]);
		Fuben.createMonsters(hScene, monsterList[i], rc[1], rc[3], y, 1, liveTime)
	end
	
	BroadcastDemonInvadeActivityMsg(n, endHour == 17)
	
end


--结束魔族入侵活动
--function EndDemonInvadeActivity()
--end



------------------------------
-- 神威幻境活动

function GetSWHJMonsterLiveTime(n)
	local curTime = System.getCurrMiniTime()
	local nYear, nMonth, nDay, nHour, nMin, nSec = System.GetSystemTimeInMiniTime(curTime, 0, 0, 0, 0, 0, 0)	
		
	local t = Activity_SWHJ_Cfg.openTime[n]
	local endTime = System.encodeNumTime(nYear, nMonth, nDay, t[3], t[4], 0)
	local liveTime = endTime - curTime

	return liveTime
end

function BroadcastSWHJActivityMsg(n)
	local onlinePlayerList = LuaHelp.getAllActorList(Activity_SWHJ_Cfg.needLevel)
	if not onlinePlayerList then return end
		
	for _,player in ipairs(onlinePlayerList) do
		if player then
			local netPack = DataPack.allocPacket(player, 26, 70)
			DataPack.writeByte(netPack, 7) -- 前端通过(26,65)协议回传给后端，参考 data\functions\ActorEvent\ActivityTipWin.lua
			DataPack.writeString(netPack,Activity_SWHJ_Cfg.titleName)
			DataPack.writeString(netPack,Activity_SWHJ_Cfg.content)
			DataPack.writeByte(netPack,1)
			DataPack.writeString(netPack,Activity_SWHJ_Cfg.buttonName)
			DataPack.flush(netPack)
		end
	end
	
	--id == 20,21,22	
	local id = 19 + n
	local dlgStr = "@EnterSWHJScene"
	StrTipsFunc(dlgStr,activityTips[id].tips,id) 
		
	System.broadcastTipmsg(Lang.Activity.swhj01, 2048)
end

function StartActivity_SWHJ(n)
	n = tonumber(n)
	
	print("StartActivity_SWHJ("..n..")")

	local sceneListCfg = Activity_SWHJ_Cfg.sceneList
	for _,sceneCfg in ipairs(sceneListCfg) do
		local hScene = Fuben.getSceneHandleById(sceneCfg.sceneId, 0)
		if hScene == 0 then print("error! StartActivity_SWHJ hScene == 0") return end
		
		local liveTime = GetSWHJMonsterLiveTime(n)
		if liveTime <= 0 or liveTime >= 3700 then
			print("error! StartDemonInvadeActivity liveTime error")
			return
		end
		
		Fuben.createMonster(hScene, sceneCfg.boss.id, sceneCfg.boss.pos[1], sceneCfg.boss.pos[2], liveTime)
	
	end	
	
	BroadcastSWHJActivityMsg(n)
end

function EndActivity_SWHJ(n)
	for _,sceneCfg in ipairs(Activity_SWHJ_Cfg.sceneList) do
		local playerList = LuaHelp.getSceneActorListById(sceneCfg.sceneId)
		if playerList ~= nil then
			for i = 1, #playerList do
				local player = playerList[i]
				if player ~= nil then
					Actor.exitActivityScene(player)
				end
			end
		end	
	end
	
	System.broadcastTipmsg(Lang.Activity.swhj02,2048)
end
------------------------------

