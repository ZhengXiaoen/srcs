-- 元宝嘉年华
--打豆豆活动
--#include "data\config\activity\StdActivityCfg.lua" once
--#include "data\functions\Systems\ActivitySystem\ActivityUtils.lua" once

--进入元宝嘉年华活动场景
function EnterScene_YuanbaoJiaNianHua(sysarg)	

	--   local dVar = System.getDyanmicVar()
	--   if dVar.yuanbaojianianhuaTime == nil then 
	--   	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--   	return
	--   end
	--   
	--   --运镖中
	--   local Var = Actor.getStaticVar(sysarg)
	--   if Var.ybstate ~= nil and Var.ybstate == 1 then
	--   	Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip) 
	--   	return
	--   end
	--   
	--   --在副本中
	--   local fubenId = Actor.getFubenId(sysarg)
	--   if fubenId > 0 then
	--   	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf568, ttFlyTip) 
	--   	return
	--   end
	--   
	--   --在武林争霸中
	--   local curSceneId = Actor.getSceneId(sysarg)
	--   if curSceneId == 58 then
	--   	Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf138, ttFlyTip)
	--   	return
	--   end
	--   
    --   
	--   local cfg = StdActivityCfg.YuanBaoJiaNianHua
	--   
	--   --local times = cfg.tOpenTime.times
	--   --local timeIdx = checkActivityTime(times)
	--   --if timeIdx == 0 then	
	--   --	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--   --	return
	--   --end
	--   --
	--   --local endHour = times[timeIdx][3]
	--   --local endMin = times[timeIdx][4]
	--   --local endSec = 0
	--   --if endHour == 0 and endMin == 0 then
	--   --	endHour = 23
	--   --	endMin = 59
	--   --	endSec = 59
	--   --end
	--   
	--   --local leftSecond = System.ResidualTime(endHour, endMin, endSec)
	--   --if leftSecond == 0 then
	--   --	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--   --	return
	--   --end	
	--   local leftSecond = cfg.tOpenTime.lefttime-(System.getCurrMiniTime() - dVar.yuanbaojianianhuaTime)
	--   
	--   local dVar = System.getDyanmicVar()
	--   if dVar.yuanbaojianianhuaActorList == nil then
	--   	dVar.yuanbaojianianhuaActorList={}
	--   end
    --   
	--   local svar = Actor.getStaticVar(sysarg)
	--   if svar.days.countOfCoin== nil then --第一次进入活动
	--   	svar.days.countOfCoin=0
	--   	local name = Actor.getName(sysarg)
	--   	dVar.yuanbaojianianhuaActorList[#dVar.yuanbaojianianhuaActorList+1] = name --保存进入过活动的人的名字		
	--   end
	--   
	--   
	--   Actor.enterScene(sysarg, cfg.sceneId, 134, 123)
	--   sendJoinActivity(sysarg, cfg.id, leftSecond)
	--   getActivityDataYBJNH(sysarg,svar.days.countOfCoin)
	
end

function StartActivity_YBJNHBefore5()
	--   print("天天打豆豆 预告")
	--   local cfg = StdActivityCfg.YuanBaoJiaNianHua	
	--   local RwData = cfg.RwData
	--   local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	--   local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	--   
	--   System.broadcastTipmsg(string.format("%s活动5分钟后即将开启,请大家踊跃参加.%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	--   System.broadcastTipmsg(string.format("%s活动5分钟后即将开启,请大家踊跃参加.%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
end



-- 开始元宝嘉年华活动
function StartActivity_YBJNH()
	--   local dVar = System.getDyanmicVar()
	--   dVar.yuanbaojianianhuaTime=System.getCurrMiniTime()
    --   
	--   print("天天打豆豆 开始")
	--   local mycfg = StdActivityCfg.YuanBaoJiaNianHua
	--   
	--   -- 准备刷第1个怪物
	--   local firstMonster = mycfg.refresh[1]
	--   if firstMonster ~= nil then
	--   	System.addTimer("YBJNH_on_timer", firstMonster[1] * 1000, 1)
	--   end
end

-- 结束元宝嘉年华活动
function EndActivity_YBJNH()
	--   local dVar = System.getDyanmicVar()
	--   dVar.yuanbaojianianhuaTime=nil
	--   
	--   print("天天打豆豆 结束")	
	--   
	--   System.deleteTimer("YBJNH_on_timer")
	--   --local mycfg = StdActivityCfg.YuanBaoJiaNianHua
	--   
	--   -- 收走怪物(到目的地后怪物自动消失,所以不用收走了)
	--   --[[
	--   local hScene = Fuben.getSceneHandleById(mycfg.sceneId, 0)
	--   for i = 1, #mycfg.bossIds do
	--   	Fuben.clearMonster(hScene, mycfg.bossIds[i])
	--   end
	--   --]]
	--   
	--   local dVar = System.getDyanmicVar()
	--   dVar.YBJNHMonIdx = nil
	--   dVar.YBJNHNextRefreshTime = nil
	--   
	--   
	--   local cfg = StdActivityCfg.YuanBaoJiaNianHua
	--   --local playerList = LuaHelp.getSceneActorListById(cfg.sceneid)		
	--   --for i, v in ipairs(playerList or {}) do
	--   --	sendExitActivity(v, cfg.id)
	--   --end	
	--   
	--   if dVar.yuanbaojianianhuaActorList == nil then return end
	--   for i=1,#dVar.yuanbaojianianhuaActorList do --全部进入过活动的人都要处理
	--   	actor = Actor.getActorByName(dVar.yuanbaojianianhuaActorList[i])
	--   	if actor~=nil then --下线了不需要操作
	--   		sendExitActivity(actor, cfg.id)
	--   	end
	--   end
	
	

end
function exit_Yuanbaojianianhua(sysarg)
	--   local cfg = StdActivityCfg.YuanBaoJiaNianHua
	--   sendExitActivity(sysarg, cfg.id)
end

function BroadcastTipmsg_YBJNH(monsterIndex, broadcastPos)
	--   local idx = -1
	--   for i = 1, #broadcastPos do
	--   	if monsterIndex == broadcastPos[i] then
	--   		idx = i
	--   		break
	--   	end
	--   end
	--   
	--   if idx == -1 then return end	
	--   
	--   local msg = string.format("<(c0xFFFFF200)第><(c0xFFFF0000) %d ><(c0xFFFFF200)波><(c0xFFFF0000)兽人商队><(c0xFFFFF200)出现在><(c0xFF0080FF)热血王城>,<(c0xFFFFF200)携带宝藏的它们正在逃亡~><(c0xFFFFF200),请勇士们火速前往! ><我要前往/M热血王城:93:86:>", idx)
	--   System.broadcastTipmsg(msg, ttChatWindow + ttScreenCenter)
	--   
	--   local mycfg = StdActivityCfg.YuanBaoJiaNianHua
	--   
	--   local nextRefreshTime = 0 -- 0 为结束了
	--   if idx ~= 5 then
	--   	nextRefreshTime = System.getCurrMiniTime() + mycfg.refresh[broadcastPos[idx + 1]][1]	
	--   end
	--   
	--   local dVar = System.getDyanmicVar()
	--   dVar.YBJNHNextRefreshTime = nextRefreshTime
	--   		
	--   -- 更新数据		
	--   --local playerList = LuaHelp.getSceneActorListById(StdActivityCfg.YuanBaoJiaNianHua.sceneId)
	--   --for k, ply in ipairs(playerList or {}) do
	--   --	local svar = Actor.getStaticVar(ply)
	--   --	if svar.days.countOfCoin ==nil then return end
	--   --	sendActivityDataYBJNH(ply, idx, nextRefreshTime,svar.days.countOfCoin)
	--   --end	
	--   if dVar.yuanbaojianianhuaActorList == nil then return end
	--   for i=1,#dVar.yuanbaojianianhuaActorList do --全部进入过活动的人都要处理
	--   	actor = Actor.getActorByName(dVar.yuanbaojianianhuaActorList[i])
	--   	if actor~=nil then --下线了不需要操作
	--   		local svar = Actor.getStaticVar(actor)
	--   	    if svar.days.countOfCoin ==nil then return end
	--   	    sendActivityDataYBJNH(actor, idx, nextRefreshTime,svar.days.countOfCoin)
	--   	end
	--   end
	
end

function RefreshMonster_YBJNH()
	--   --System.deleteTimer("YBJNH_on_timer") -- 因为运行次数是1, 所以不用删除
    --   
	--   local mycfg = StdActivityCfg.YuanBaoJiaNianHua
	--   local hScene = Fuben.getSceneHandleById(mycfg.sceneId, 0)
	--   if hScene == 0 then print("error! RefreshMonster_YBJNH hScene == 0") return end
	--   
	--   local dVar = System.getDyanmicVar()
	--   local monsterIndex = dVar.YBJNHMonIdx
	--   if monsterIndex == nil then
	--   	monsterIndex = 1
	--   end
    --   
	--   local monster = mycfg.refresh[monsterIndex]
	--   if monster == nil then		
	--   	return
	--   end
	--   
	--   local liveTime = 20 * 60 -- 最长20分钟
	--   Fuben.createMonster(hScene, monster[2], mycfg.bossPos[1], mycfg.bossPos[2], liveTime)
	--   
	--   BroadcastTipmsg_YBJNH(monsterIndex, mycfg.broadcastPos)
	--   
	--   -- 下一个怪物
	--   monster = mycfg.refresh[monsterIndex + 1]
	--   if monster == nil then -- 刷完了
	--   	dVar.YBJNHMonIdx =  nil
	--   	dVar.YBJNHNextRefreshTime = 0
	--   	return
	--   end
	--   
	--   dVar.YBJNHMonIdx = monsterIndex + 1
	--   System.addTimer("YBJNH_on_timer", monster[1] * 1000, 1)	
end

function YBJNH_on_timer(leftTimes)
	--  RefreshMonster_YBJNH()
end

-- 更新活动数据
function sendActivityDataYBJNH(sysarg, n, nextRefresh,Coin)
	--   local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	--   DataPack.writeByte(netPack, 7) -- 活动类型
    --   
	--   DataPack.writeByte(netPack, n) -- 第几波
	--   --DataPack.writeInt(netPack, nextRefresh) -- 下一次刷新时间
	--   DataPack.writeUInt(netPack, Coin)
	--   
	--   DataPack.flush(netPack)
	--   --print("第几波"..n)
	--   --print("nextRefresh"..nextRefresh)
	--   --print("Coin"..Coin)
end

function addTheCoin(sysarg,types,count)
	
	--   --判断是否参加了活动.
	--   local svar = Actor.getStaticVar(sysarg)
	--   local dVar = System.getDyanmicVar()
	--   if svar.days.countOfCoin== nil or Actor.getSceneId(sysarg) ~= StdActivityCfg.YuanBaoJiaNianHua.sceneId or dVar.yuanbaojianianhuaTime==nil then 
	--   	return 
	--   end
	--   svar.days.countOfCoin= svar.days.countOfCoin+count
	--   getActivityDataYBJNH(sysarg,svar.days.countOfCoin)
	
end

function getActivityDataYBJNH(sysarg,Coin)
	--   local mycfg = StdActivityCfg.YuanBaoJiaNianHua
	--   -- 活动是否已经删除
	--   if mycfg.isDelete then return end
	--   
	--   local nSceneId = Actor.getSceneId(sysarg)
	--   if nSceneId ~= mycfg.sceneId then
	--   	return
	--   end
	--   
	--   -- 活动时间是否到了
	--   --if checkActivityTime(mycfg.tOpenTime.times) == 0 then
	--   --	return
	--   --end
	--   
	--   local dVar = System.getDyanmicVar()
	--   local monsterIndex = dVar.YBJNHMonIdx
	--   if monsterIndex == nil then
	--   	monsterIndex = 1
	--   end
	--   
	--   --print("monsterIndex="..monsterIndex)
	--   
	--   local idx = -1
	--   for i,v in ipairs(mycfg.broadcastPos) do
	--   	if monsterIndex >= v then
	--   		idx = i
	--   	else
	--   		break
	--   	end
	--   end
	--   
	--   if idx == -1 then return end
	--   local refreshTime = dVar.YBJNHNextRefreshTime
	--   if refreshTime == nil then refreshTime = 0 end
	--   if refreshTime == 0 then idx = 5 end
	--   					
	--   sendActivityDataYBJNH(sysarg, idx, refreshTime,Coin)
end
