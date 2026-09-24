-- 饕餮神殿
--#include "data\config\activity\StdActivityCfg.lua" once


-- 开始饕餮神殿活动
function StartActivity_TTSDCBefore5(sysarg)
	print("饕餮神殿活动 预告")	
	
	local cfg = StdActivityCfg.TaoTieShenDian	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("<%s>活动5分钟后即将开启,请大家踊跃参加.%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	System.broadcastTipmsg(string.format("<%s>活动5分钟后即将开启,请大家踊跃参加.%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
		
end

function StartActivity_TTSD(sysarg)
	--print("饕餮神殿活动 开始")	
	--
	----保险点清空上次没有杀死，但是存活时间还在的怪物 （确保策划短时间内开两次活动）
	--local cfg = StdActivityCfg.TaoTieShenDian	
	--local sceen = Fuben.getSceneById(cfg.sceenId, 0)
	--Fuben.clearSceneAllMonsters(sceen, 4)--把boss清除了
	--
	--local dVar = System.getDyanmicVar()
	--dVar.TTSDTime = System.getCurrMiniTime()
	--dVar.TTSD_SG =nil 
end

-- 结束巨魔之巢活动
function EndActivity_TTSD(sysarg)
	
	local dVar = System.getDyanmicVar()
	dVar.TTSDTime = nil
	dVar.TTSD_SG =nil 
	
	local cfg =StdActivityCfg.TaoTieShenDian	
	
	local playerList = LuaHelp.getSceneActorListById(cfg.sceenId)
	if playerList~=nil then 
		for _,v in pairs (playerList) do 
			if v~=nil then 
				exit_TTSD(v)
				Actor.sendTipmsg(v, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
			end
		end
	end
	
end

-- 进入巨魔之巢
function enter_TTSD(sysarg)
	local dVar = System.getDyanmicVar()
	if dVar.TTSDTime == nil then -- 活动还没开始
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		return
	end
	
	local cfg = StdActivityCfg.TaoTieShenDian;
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
	
	local leftSecond = cfg.tOpenTime.lefttime-(System.getCurrMiniTime() - dVar.TTSDTime)
	
	--if curSceneId == cfg.scenes[1] then
	--	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf406,ttFlyTip)
	--	return
	--end
	
	local curTime = System.getCurrMiniTime()
	--if (curTime - dVar.TTSDTime) >= cfg.enterTimeLimit then
	--	Actor.sendTipmsg(sysarg, "活动入口已关闭,请您明天再来吧", ttFlyTip)
	--	return 
	--end
	if dVar.TTSD_SG ==26 then
		Actor.sendTipmsg(sysarg, "活动已经结束,请您明天再来吧", ttFlyTip)
		return
	end
	
	if Actor.enterScene(sysarg, cfg.sceenId, -1, -1) == false then------------------------------------
		return
	end
	
	
	local name = Actor.getName(sysarg)
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
	
	System.broadcastTipmsg(string.format("<(c0xFFe6dfb9)%s><(c0xFFffff00)参加了><(c0xFF00ccff)%s><(c0xFFffff00)活动,一共有25波怪,携带大量宝藏>", name, RwData[1]), ttScreenCenter)
	System.broadcastTipmsg(string.format("<(c0xFFe6dfb9)%s><(c0xFFffff00)参加了><(c0xFF00ccff)%s><(c0xFFffff00)活动,一共有25波怪,携带大量宝藏> %s %s", name, RwData[1], NpcName, NpctFly), ttChatWindow)

	if dVar.TTSD_SG ==nil then --如果还没有刷怪 
		dVar.TTSD_SG = 1
		--刷怪
		Shuaiguai(1)
		System.broadcastTipmsg(string.format("万众瞩目,传闻中饕餮大将家族成员将出现在饕餮神殿,携带大量宝藏,请勇士们立刻前往击杀 %s %s",NpcName, NpctFly), ttChatWindow)
		
	end
	
		--下发活动
	sendJoinActivity(sysarg, cfg.id, leftSecond)
	updateAndsendActivityData_TTSD(sysarg,1,dVar.TTSD_SG) --第几波
	
end

function exit_TTSD(sysarg)
	System.telportScene(sysarg, 83, 162, 124, true)
end

function Shuaiguai(index)
	
	index = tonumber(index)
	local monsterId= index +666
	local cfg = StdActivityCfg.TaoTieShenDian
	local nHandle = Fuben.getSceneHandleById(cfg.sceenId,0)
	Fuben.createMonster(nHandle, monsterId, 43, 37, 10800,true)--重新刷boss
	
	--全部人都更新一下第几波
	local playerList = LuaHelp.getSceneActorListById(cfg.sceenId)
	for _,v in pairs (playerList) do 
		if v~=nil then 
			local dVar = System.getDyanmicVar()
			if dVar.TTSD_SG == nil then dVar.TTSD_SG =1 end
			updateAndsendActivityData_TTSD(v,1,dVar.TTSD_SG) --第几波
		end
	end

end

--杀怪
function TTSDKillmonster()
	local dVar = System.getDyanmicVar()
	local cfg = StdActivityCfg.TaoTieShenDian
	
	--print("dVar.TTSD_SG="..dVar.TTSD_SG)
	if dVar.TTSD_SG == 25 then --最后一只怪物被杀
		--print("最后一只怪物被杀")
		--告诉前端怪物已经打完了,请求退出
		local playerList = LuaHelp.getSceneActorListById(cfg.sceenId)
		for _,v in pairs (playerList) do 
		    if v~=nil then 
				updateAndsendActivityData_TTSD(v,2)
			end
		end
		dVar.TTSD_SG = 26
		return 
	end

	System.addTimer("onShuaiguai", 10000, -1)--每10秒获得
	--广播10秒后
	
	local playerList = LuaHelp.getSceneActorListById(cfg.sceenId)
	for _,v in pairs (playerList) do 
		if v~=nil then 
			Actor.sendTipmsg(v,"10秒后将会有更强力的boss出现,请做好准备!", ttFlyTip) 
		end
	end
	
	local cfg = StdActivityCfg.TaoTieShenDian
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
	System.broadcastTipmsg(string.format("10秒后将会有更强力的<(c0xFF00ccff)%s>出现,请做好准备! %s %s",System.getMonsterNameById(dVar.TTSD_SG+1+666),NpcName, NpctFly),ttChatWindow)
end

function onShuaiguai(sysarg)
	System.deleteTimer("onShuaiguai")
	
	local dVar = System.getDyanmicVar()
	dVar.TTSD_SG = dVar.TTSD_SG +1
	Shuaiguai(dVar.TTSD_SG)
end

-- 1下发活动数据(第几波)
-- 2活动结束

function updateAndsendActivityData_TTSD(sysarg, types,index)
	--print("types="..types)
	--print("index="..index)
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, 22) -- 活动类型	
	types = tonumber(types)
	DataPack.writeByte(netPack, types)
	if types==1 then 
		index = tonumber(index)
		DataPack.writeByte(netPack, index)
	end
	DataPack.flush(netPack)
end

