--元宝嘉年华活动
--#include "data\config\activity\StdActivityCfg.lua" once
--#include "data\functions\Systems\ActivitySystem\ActivityUtils.lua" once


--预告
function StartActivity_YBJNHBefore5_New()
	if System.isCrossServer() ==true then
		return 
	end
	print("天天打豆豆 预告")
	local cfg = StdActivityCfg.YuanBaoJiaNianHuaNew	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启,请大家踊跃参加.%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启,请大家踊跃参加.%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
end

-- 开始元宝嘉年华活动
function StartActivity_YBJNH_New(sysarg, startTime, endTime)
	if System.isCrossServer() ==true then
		return 
	end
	local dVar = System.getDyanmicVar()
	dVar.yuanbaojianianhuaTimeNew=startTime or System.getCurrMiniTime()
	print("天天打豆豆 开始")
	local cfg = StdActivityCfg.YuanBaoJiaNianHuaNew
		
	--刷怪
	local liveTime = endTime and (endTime - System.getCurrMiniTime()) or 30 * 60 -- 使用本场剩余时间
	local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)
	local wave = math.min(#cfg.refresh, math.floor((System.getCurrMiniTime() - dVar.yuanbaojianianhuaTimeNew) / cfg.refreshTime) + 1)
	for i=1,#cfg.refresh[wave] do
		--Fuben.createMonster(hScene, cfg.refresh[1][i], cfg.bossPos[1], cfg.bossPos[2], liveTime)

		local sceneId = 10
		local mapname = Fuben.getSceneNameById(sceneId)
		
		local h=0
		local w=0
		for j=1,10000 do --循环1万次找随机点
			local bHandle = Fuben.getSceneHandleById(sceneId,0)
			
			h = System.getRandomNumber(Fuben.getScenHeight(bHandle)) + 1
			w = System.getRandomNumber(Fuben.getSceenWidth(bHandle)) + 1
			Fuben.onCanMove(bHandle,h,w)
			if Fuben.onCanMove(bHandle,h,w)== true then
				if Fuben.createMonster(hScene, cfg.refresh[wave][i], h, w, liveTime)~=nil then
					break
				end
			end
		end

	end
	
	--定时器
	dVar.YBJNH_rf_Index = wave
	System.deleteTimer("YBJNHNew_on_timer")
	System.deleteTimer("YBJNHNew_resume_timer")
	if wave < #cfg.refresh then
		System.addTimer("YBJNHNew_resume_timer", (dVar.yuanbaojianianhuaTimeNew + wave * cfg.refreshTime - System.getCurrMiniTime()) * 1000, 1)
	end
	
	--让已经在场景的人参加活动，并且下发消息
	local playerList = LuaHelp.getSceneActorListById(cfg.sceneId)		
	for i, v in ipairs(playerList or {}) do
		sendJoinActivity(v, cfg.id, liveTime)
			
		local netPack = DataPack.allocPacket(v, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
		DataPack.writeByte(netPack, cfg.id) -- 活动类型
		DataPack.writeByte(netPack, dVar.YBJNH_rf_Index) -- 当前第几波,说一下
		DataPack.flush(netPack)
		
		local msg = string.format("玩家<(n%s)>参加了元宝嘉年华,<我要参加/M热血王城:93:86:>", Actor.getName(v))
		System.broadcastTipmsg(msg, ttChatWindow + ttScreenCenter)
	end
	
	
	local msg = string.format("<(c0xFFFFF200)第><(c0xFFFF0000) %d ><(c0xFFFFF200)波><(c0xFFFF0000)珍宝猪><(c0xFFFFF200)出现在><(c0xFF0080FF)热血王城>,<(c0xFFFFF200)携带宝藏的它们满地图逃窜~><(c0xFFFFF200),请勇士们火速前往! ><我要前往/M热血王城:93:86:>", wave)
	System.broadcastTipmsg(msg, ttChatWindow + ttScreenCenter)
	
end

--结束元宝嘉年华活动
function EndActivity_YBJNH_New()
	local dVar = System.getDyanmicVar()
	dVar.yuanbaojianianhuaTimeNew=nil
	System.deleteTimer("YBJNHNew_on_timer")
	System.deleteTimer("YBJNHNew_resume_timer")
	print("天天打豆豆 结束")	
	--把所有怪物都清掉
	
	local cfg = StdActivityCfg.YuanBaoJiaNianHuaNew
	local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)
	for i=1,#cfg.hasMonster do
		Fuben.clearMonster(hScene,cfg.hasMonster[i])
	end
end

--定时刷怪
function YBJNHNew_resume_timer()
	YBJNHNew_on_timer()
	local cfg = StdActivityCfg.YuanBaoJiaNianHuaNew
	local dVar = System.getDyanmicVar()
	if dVar.yuanbaojianianhuaTimeNew ~= nil and dVar.YBJNH_rf_Index < #cfg.refresh then
		System.addTimer("YBJNHNew_on_timer", cfg.refreshTime * 1000, #cfg.refresh - dVar.YBJNH_rf_Index)
	end
end

function YBJNHNew_on_timer()
	local dVar = System.getDyanmicVar()
	local cfg = StdActivityCfg.YuanBaoJiaNianHuaNew
	if dVar.yuanbaojianianhuaTimeNew == nil then return end
	local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)
	if hScene == 0 then print("error! RefreshMonster_YBJNH hScene == 0") return end
	if dVar.YBJNH_rf_Index ==nil then 
		dVar.YBJNH_rf_Index = 2
	else 
		dVar.YBJNH_rf_Index = dVar.YBJNH_rf_Index + 1
	end
	
	local liveTime = 30 * 60 -- 最长30分钟
	if dVar.YBJNH_rf_Index > #cfg.refresh then
        System.trace("YBJNHNew_on_timer YBJNH_rf_Index"..dVar.YBJNH_rf_Index)
        return
    end
	for i=1,#cfg.refresh[dVar.YBJNH_rf_Index] do 
		--Fuben.createMonster(hScene, cfg.refresh[dVar.YBJNH_rf_Index][i], cfg.bossPos[1], cfg.bossPos[2], liveTime)

		local sceneId = 10
		local mapname = Fuben.getSceneNameById(sceneId)
		
		local h=0
		local w=0
		for j=1,10000 do --循环1万次找随机点
			local bHandle = Fuben.getSceneHandleById(sceneId,0)
			
			h = System.getRandomNumber(Fuben.getScenHeight(bHandle)) + 1
			w = System.getRandomNumber(Fuben.getSceenWidth(bHandle)) + 1
			Fuben.onCanMove(bHandle,h,w)
			if Fuben.onCanMove(bHandle,h,w)== true then
				if Fuben.createMonster(hScene, cfg.refresh[dVar.YBJNH_rf_Index][i], h, w, liveTime)~=nil then 
					break
				end
			end
		end
				
		
	end
	
	
	--广播提示刷怪
	local msg = string.format("<(c0xFFFFF200)第><(c0xFFFF0000) %d ><(c0xFFFFF200)波><(c0xFFFF0000)珍宝猪><(c0xFFFFF200)出现在><(c0xFF0080FF)热血王城>,<(c0xFFFFF200)携带宝藏的它们满地图逃窜~><(c0xFFFFF200),请勇士们火速前往! ><我要前往/M热血王城:93:86:>", dVar.YBJNH_rf_Index)
	System.broadcastTipmsg(msg, ttChatWindow + ttScreenCenter)
	
	
	--广播给玩家波数变了(更新活动信息)
	local playerList = LuaHelp.getSceneActorListById(cfg.sceneId)		
	for i, v in ipairs(playerList or {}) do
		local netPack = DataPack.allocPacket(v, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
		DataPack.writeByte(netPack, cfg.id) -- 活动类型
		DataPack.writeByte(netPack, dVar.YBJNH_rf_Index) -- 当前第几波,说一下
		DataPack.flush(netPack)
	end
	
end

--进入场景的时候给前端发东西
function EnterYuanBaoJiaNianHuaScene(sysarg)
	
	--判断是不是活动时间
	local dVar = System.getDyanmicVar()
	if dVar.yuanbaojianianhuaTimeNew == nil then  --不在活动时间内，所以不下发东西了
		return
	end
	
	if dVar.YBJNH_rf_Index ==nil then 	
		return 
	end
	
	
	local cfg = StdActivityCfg.YuanBaoJiaNianHuaNew
		
	--计算剩余时间
	local leftSecond = cfg.tOpenTime.lefttime-(System.getCurrMiniTime() - dVar.yuanbaojianianhuaTimeNew)
	if leftSecond<=0 then 
		leftSecond =0
	end
	
	--下发参加活动
	sendJoinActivity(sysarg, cfg.id, leftSecond)
	
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, cfg.id) -- 活动类型
	DataPack.writeByte(netPack, dVar.YBJNH_rf_Index) -- 当前第几波,说一下
	DataPack.flush(netPack)

	local msg = string.format("玩家<(n%s)>参加了元宝嘉年华,<我要参加/M热血王城:93:86:>", Actor.getName(sysarg))
	System.broadcastTipmsg(msg, ttChatWindow + ttScreenCenter)
end
