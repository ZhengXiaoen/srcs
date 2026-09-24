-- 巨魔之巢活动(改为神威狱)
--#include "data\config\activity\StdActivityCfg.lua" once

-- 开始巨魔之巢活动
function StartActivity_JMZCBefore5(sysarg)
	if System.isCrossServer() ==true then
		return 
	end
	print("巨魔之巢活动 预告")	
	
	local cfg = StdActivityCfg.ShenWeiYu	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
end

function StartActivity_JMZC(sysarg)
	if System.isCrossServer() ==true then
		return 
	end
	print("巨魔之巢活动 开始")	
	
	local dVar = System.getDyanmicVar()
	dVar.jmzcTime = System.getCurrMiniTime()
	dVar.bgxlIfCan_broadcastTipmsg=1
	
	local sysvar = System.getStaticVar(sysarg)
	sysvar.ShenWeiYuBoss = 0 
	
	System.addTimer("swyIfCan_broadcastTipmsg_onTimer", 10000, -1)--每10秒获得
	
	createBoss()
	--local sVar = System.getStaticVar()
	--sVar.bossFlag={}
end

-- 结束巨魔之巢活动
function EndActivity_JMZC(sysarg)
	if System.isCrossServer() ==true then
		return 
	end
	print("巨魔之巢活动 结束")	
	
	System.deleteTimer("swyIfCan_broadcastTipmsg_onTimer")
	
	local dVar = System.getDyanmicVar()
	dVar.jmzcTime = nil
	dVar.bgxlIfCan_broadcastTipmsg=nil
	
	local sysvar = System.getStaticVar(sysarg)
	sysvar.ShenWeiYuBoss = 0 
	
	--local cfg = StdActivityCfg.ShenWeiYu
	
	--for _, sceneid in ipairs(cfg.scenes) do	
		--local playerList = LuaHelp.getSceneActorListById(sceneid)		
		--for i, v in ipairs(playerList or {}) do
			--exit_jmzc(v)
		--end
	--end
	if dVar.shenweiyuActorList == nil then return end
	for i=1,#dVar.shenweiyuActorList do --全部进入过活动的人都要处理
		--print(dVar.shenweiyuActorList[i])
		actor = Actor.getActorByName(dVar.shenweiyuActorList[i])
		exitClearData_ShenWeiYu(actor)--离开活动，清除数据
	end
	
	dVar.shenweiyuActorList = nil
end

-- 进入巨魔之巢
function enter_jmzc(sysarg)
	local dVar = System.getDyanmicVar()
	if dVar.jmzcTime == nil then -- 活动还没开始
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		return
	end
	
	local cfg = StdActivityCfg.ShenWeiYu;
	local Var = Actor.getStaticVar(sysarg)
	--运镖中
	if Var.ybstate ~= nil and Var.ybstate == 1 then
		Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip) 
		return
	end
	
	--在副本中
	local fubenId = Actor.getFubenId(sysarg)
	if fubenId > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf568, ttFlyTip) 
		return
	end
	
	--在武林争霸中
	local curSceneId = Actor.getSceneId(sysarg)
	if curSceneId == 58 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf138, ttFlyTip)
		return
	end
	
	local plv = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	local RwData = cfg.RwData;
	if plv < cfg.level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.bs00005, RwData[1], cfg.level), ttFlyTip)
		return;
	end
	
	--local times = cfg.tOpenTime.times
	--local timeIdx = checkActivityTime(times)
	--if timeIdx == 0 then	
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	return
	--end
	--
	--local endHour = times[timeIdx][3]
	--local endMin = times[timeIdx][4]
	--local endSec = 0
	--if endHour == 0 and endMin == 0 then
	--	endHour = 23
	--	endMin = 59
	--	endSec = 59
	--end
	--
	--local leftSecond = System.ResidualTime(endHour, endMin, endSec)
	--if leftSecond == 0 then
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	return
	--end
	local leftSecond = cfg.tOpenTime.lefttime-(System.getCurrMiniTime() - dVar.jmzcTime)
	
	if curSceneId == cfg.scenes[1] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf406,ttFlyTip)
		return
	end
	
	local curTime = System.getCurrMiniTime()
	if (curTime - dVar.jmzcTime) >= cfg.enterTimeLimit then
		Actor.sendTipmsg(sysarg, "活动入口已关闭,请您明天再来吧", ttFlyTip)
		return 
	end
	
	if Actor.enterScene(sysarg, cfg.scenes[1], -1, -1) == false then
		return
	end
	
	
	if dVar.shenweiyuActorList == nil then
		dVar.shenweiyuActorList={}
	end
	
	if Var.days.shenweiyuHighestLayer ==nil then --第一次进入活动
		local name = Actor.getName(sysarg)
		dVar.shenweiyuActorList[#dVar.shenweiyuActorList+1] = name --保存进入过活动的人的名字		
	end 

	if Var.days.shenweiyuHighestLayer ==nil then 
		Var.days.shenweiyuHighestLayer=1
	end
	
	--进入成功进行广播
	if dVar.bgxlIfCan_broadcastTipmsg==1 then --10秒才能广播一次，以免广播得太频繁
		local name = Actor.getName(sysarg)
		local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
	
		System.broadcastTipmsg(string.format(Lang.ScriptTips.jm00002, name, RwData[1]), ttScreenCenter)
		System.broadcastTipmsg(string.format(Lang.ScriptTips.jm00003, name, RwData[1], NpcName, NpctFly), ttChatWindow)
		dVar.bgxlIfCan_broadcastTipmsg = 0
	end
	
	
	
		
	sendJoinActivity(sysarg, cfg.id, leftSecond)
	updateAndsendActivityData_jmzc(sysarg,1)
	--updateActivityData_jmzc(sysarg)
	OnFinish_Liveness(sysarg,8)

	--保存一下，此次数据是第几个活动的，要是下次上线还有数据，那就删除数据。
	Var.days.SWY_dataTime = checkActivityTime(cfg.tOpenTime.times)

end

function swyIfCan_broadcastTipmsg_onTimer(sysarg)

	local dVar = System.getDyanmicVar()
	dVar.bgxlIfCan_broadcastTipmsg = 1--每隔10秒才能广播一次
	
end


-- 退出活动,不清除数据
function exitDontClearData_ShenWeiYu(sysarg)

	local sceneId = Actor.getSceneId(sysarg)
	for i=1,10 do--在神威狱中
		if sceneId == StdActivityCfg.ShenWeiYu.scenes[i] then 
			Actor.exitActivityScene(sysarg)	
		break
		end
	end
	
	sendExitActivity(sysarg, StdActivityCfg.ShenWeiYu.id)	
end

-- 退出活动，并且清除数据
function exitClearData_ShenWeiYu(sysarg)

	if sysarg == nil then return end --已经下线了
	
	local Var = Actor.getStaticVar(sysarg)
	local shenweiyuHighestLayer = Var.days.shenweiyuHighestLayer 
	--if shenweiyuHighestLayer == nil then  shenweiyuHighestLayer=1 end
	if shenweiyuHighestLayer == nil then return end --有可能他提前下线，再上线，已经发过邮件了，就不发了
	
	local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local str = string.format("您在神威狱活动中，最高达到%d层，望再接再厉!\\\\神威狱活动所到层数越高奖励越丰厚，在神威10层更有世界\\\\boss，掉落无归属装备，手快有，手慢无！\\\\祝您游戏愉快！",shenweiyuHighestLayer)
	System.AddMail(actorID, 3, 0, "神威狱", str)
		
	Var.days.shenweiyuHighestLayer  = nil
	
	local sceneId = Actor.getSceneId(sysarg)
	for i=1,10 do--在神威狱中
		if sceneId == StdActivityCfg.ShenWeiYu.scenes[i] then 
			Actor.exitActivityScene(sysarg)	
			--Actor.sendTipmsg(sysarg, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
			break
		end
	end
	
	--Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00006, ttFlyTip)
	sendExitActivity(sysarg, StdActivityCfg.ShenWeiYu.id)	
end

--已经下线的玩家，在下次上线的时候清除数据和发送邮件
function clearData_ShenWeiYu(sysarg)
	
	--跨服不清空数据
	if System.isCrossServer() ==true then
		return 
	end
	
	local cfg = StdActivityCfg.ShenWeiYu
	local Var = Actor.getStaticVar(sysarg)
	local sdVar = System.getDyanmicVar()
	if sdVar.jmzcTime == nil then	
	
		local shenweiyuHighestLayer = Var.days.shenweiyuHighestLayer 
		if shenweiyuHighestLayer == nil then return end
		local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		local str = string.format("您在神威狱活动中，最高达到%d层，望再接再厉!\\\\神威狱活动所到层数越高奖励越丰厚，在神威10层更有世界\\\\boss，掉落无归属装备，手快有，手慢无！\\\\祝您游戏愉快！",shenweiyuHighestLayer)
		System.AddMail(actorID, 3, 0, "神威狱", str)
		
		Var.days.shenweiyuHighestLayer  = nil
		
	elseif Var.days.SWY_dataTime~=nil and  Var.days.SWY_dataTime~= checkActivityTime(cfg.tOpenTime.times) then --有数据保存，并且不是当前的数据次数
		
		local shenweiyuHighestLayer = Var.days.shenweiyuHighestLayer 
		if shenweiyuHighestLayer == nil then return end
		local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		local str = string.format("您在神威狱活动中，最高达到%d层，望再接再厉!\\\\神威狱活动所到层数越高奖励越丰厚，在神威10层更有世界\\\\boss，掉落无归属装备，手快有，手慢无！\\\\祝您游戏愉快！",shenweiyuHighestLayer)
		System.AddMail(actorID, 3, 0, "神威狱", str)
		
		Var.days.shenweiyuHighestLayer  = nil
		
	end
end

-- 进入下一层
function jmzc_enter_next_layer(sysarg)
	local dVar = System.getDyanmicVar()
	if dVar.jmzcTime == nil then -- 活动还没开始
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		return
	end
	
	local curSceneId = Actor.getSceneId(sysarg)
	local cfg = StdActivityCfg.JuMoZhiChao
	
	local curSceneIdx = -1
	for i,v in ipairs(cfg.scenes) do
		if curSceneId == v then
			curSceneIdx = i
			break
		end
	end
	
	if curSceneIdx == -1 then -- 不在活动场景中
		return
	elseif curSceneIdx == #cfg.scenes then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.jm00004, ttFlyTip)
	end
	
	-- 是否要杀完所有怪才能进入下一层
	--if (curSceneIdx + 1) >= cfg.killAllSceneIdx then
		--if not Actor.isKillAllMonster(sysarg) then
			--Actor.sendTipmsg(sysarg, Lang.ScriptTips.jm00001, ttFlyTip)
			--return
		--end
	--end
	
	Actor.enterScene(sysarg, cfg.scenes[curSceneIdx + 1], -1, -1)
	
	sendActivityEnterNextLayer(sysarg, cfg.id)
	
	--updateActivityData_jmzc(sysarg)
end

function jmzc_OnMonsterByKilled(monster, sysarg, monId, monsterType)
	if monsterType ==4 then --杀死了Boss
		local hScene = Actor.getSceneId(monster)
		local sysvar = System.getStaticVar(sysarg)
		local cfg = StdActivityCfg.ShenWeiYu.ref_monster
		for _,v in pairs(cfg) do 
			if v.entityid == monId then 
				local numberofplies = NumberOfPlies(hScene)
				if numberofplies==-1 then 
					System.trace("illegal killMonsters")
					--在别的场景刷怪了,然后打死了
					return 
				end
				sysvar.ShenWeiYuBoss = numberofplies --记录boss被杀了
				System.broadcastTipmsg(string.format("神威狱活动中第%s层首领已被击败", numberofplies),ttChatWindow)
				
				--告诉本层的所有人
				local playerList = LuaHelp.getSceneActorListById(hScene)		
				for i, v in ipairs(playerList or {}) do
					updateAndsendActivityData_jmzc(v,2)-- 广播给当前场景的玩家
				end
				
				System.trace("shenweiyu kill boss"..(numberofplies))
				break
			end
		end
	end
	

	--local sceneId = Actor.getSceneId(monster)
	--local hScene = Actor.getSceneHandle(monster)
	--local monsterCount = Fuben.getLiveMonsterCount(hScene, 0) -- 获得怪物剩余数量 
      
	--local playerList = LuaHelp.getSceneActorListById(sceneId)		
	--for i, v in ipairs(playerList or {}) do
		--sendActivityData_jmzc(v, monsterCount) -- 广播给当前场景的玩家
	--end
end

function NumberOfPlies(sceneid) --由sceneid得到层数

	if sceneid >=111 and sceneid <=114 then
		return sceneid - 110
	elseif sceneid == 120 then 
		return 5
	elseif sceneid == 115 then
		return 6
	elseif sceneid == 116 then
		return 7
	elseif sceneid == 121 then
		return 8
	elseif sceneid == 117 then
		return 9
	elseif sceneid == 118 then
		return 10
	else 
		return -1
	end

end

-- 更新活动数据
--function sendActivityData_jmzc(sysarg, monsterCount)
	--local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	--DataPack.writeByte(netPack, 2) -- 活动类型	
	
	--DataPack.writeInt(netPack, monsterCount) -- 怪物剩余数量
	
	--DataPack.flush(netPack)
--end

-- 更新活动数据
--function updateActivityData_jmzc(sysarg)
	--local sceneId = Actor.getSceneId(sysarg)
	--local hScene = Actor.getSceneHandle(sysarg)
	--local monsterCount = Fuben.getLiveMonsterCount(hScene, 0) -- 获得怪物剩余数量
	--sendActivityData_jmzc(sysarg, monsterCount)
--end



-- 更新活动数据
--1个人最高层 ， 第几层的boss被击杀   (进入活动要下发)
--2第几层的boss被击杀   (杀死boss要下发 )
--3个人最高层   (进入下一层要下发)
function updateAndsendActivityData_jmzc(sysarg, types)

	local Var = Actor.getStaticVar(sysarg)
	local sysvar = System.getStaticVar(sysarg)
	
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, 17) -- 活动类型	
	DataPack.writeByte(netPack, types)-- 更新数据的类型
	if types == 1 then 
		DataPack.writeByte(netPack, Var.days.shenweiyuHighestLayer)
		DataPack.writeByte(netPack, sysvar.ShenWeiYuBoss)
		
	elseif types == 2 then 
		DataPack.writeByte(netPack, sysvar.ShenWeiYuBoss)
	
	elseif types == 3 then 
		DataPack.writeByte(netPack, Var.days.shenweiyuHighestLayer)
	end

	DataPack.flush(netPack)
end


function createBoss()
	
	local cfg = StdActivityCfg.ShenWeiYu
	for i=1,#cfg.ref_monster do 
		local sceen = Fuben.getSceneById(cfg.ref_monster[i].sceenId, 0)
		Fuben.clearSceneAllMonsters(sceen, 4)--把boss清除了
		local nHandle = Fuben.getSceneHandleById(cfg.ref_monster[i].sceenId,0)
		if Fuben.createMonster(nHandle, cfg.ref_monster[i].entityid, cfg.ref_monster[i].mapx, cfg.ref_monster[i].mapy, 10800,true)==nil then --重新刷boss
			System.trace("shenweiyu create boss failed id:"..(cfg.ref_monster[i].entityid))
			local sceneId = Actor.getSceneId(sysarg)
			local mapname = Fuben.getSceneNameById(sceneId)
		
			local h=0
			local w=0
			for j=1,10000 do --循环1万次找随机点
				local bHandle = Fuben.getSceneHandleById(sceneId,0)
				
				h = System.getRandomNumber(Fuben.getScenHeight(bHandle)) + 1
				w = System.getRandomNumber(Fuben.getSceenWidth(bHandle)) + 1
				Fuben.onCanMove(bHandle,h,w)
				if Fuben.onCanMove(bHandle,h,w)== true then
					if Fuben.createMonster(nHandle, cfg.ref_monster[i].entityid, h, w, 10800,true)~=nil then 
						break
					end
				end
			end
		else 
			System.trace("shenweiyu create boss success id:"..(cfg.ref_monster[i].entityid))
		end
	end
	
	--最近经常说有刷不出怪，这里检查一下是否有怪，没有的话再刷一遍
	for i=1,#cfg.ref_monster do 
		local nHandle = Fuben.getSceneHandleById(cfg.ref_monster[i].sceenId,0)
		if Fuben.getLiveMonsterCount(nHandle,cfg.ref_monster[i].entityid)==0 then --这个场景没有这只怪
			Fuben.createMonster(nHandle, cfg.ref_monster[i].entityid, cfg.ref_monster[i].mapx, cfg.ref_monster[i].mapy, 10800,true)
			System.trace("shenweiyu create boss again success id:"..(cfg.ref_monster[i].entityid))
		end
	end
	
	
	
	for i=1,#cfg.ref_monster2 do 
		local sceen = Fuben.getSceneById(cfg.ref_monster2[i].sceenId, 0)
		local nHandle = Fuben.getSceneHandleById(cfg.ref_monster2[i].sceenId,0)
		Fuben.createMonster(nHandle, cfg.ref_monster2[i].entityid, cfg.ref_monster2[i].mapx, cfg.ref_monster2[i].mapy, 10800,true)--重新刷boss
	end
end

