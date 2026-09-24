-- 全服双倍经验活动
--#include "data\config\activity\StdActivityCfg.lua" once
-- 开始全服双倍经验活动
function StartActivity_DoubleExp(timeIdx)
	print("怒刷白猪活动 开始")
	
	local dVar = System.getDyanmicVar()
	dVar.QFDoubleExpTime = System.getCurrMiniTime()
	
--	System.broadcastTipmsg("全服双倍经验活动已经开启", ttScreenCenter)
--	System.broadcastTipmsg("全服双倍经验活动已经开启", ttChatWindow)
--	System.setActivtyExpRate(1, 0)

	local cfg = StdActivityCfg.QuanFuShuangBei	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动已经开启,请大家踊跃参加.", RwData[1]), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动已经开启,请大家踊跃参加.%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
	
	--System.broadcastTipmsg("怒刷白猪活动已经开启", ttScreenCenter)
	--System.broadcastTipmsg("怒刷白猪活动已经开启", ttChatWindow)

    --创建白猪
    local cfg = StdActivityCfg.QuanFuShuangBei.refresh
    local hScene = Fuben.getSceneHandleById(cfg.sceneid, 0)
    dVar.baizhuHandle ={}
    for i=1,table.getn(cfg.point) do
        local pMonster = Fuben.createMonster(hScene, cfg.monid, cfg.point[i].x, cfg.point[i].y, 0)
        dVar.baizhuHandle[i] = {}
        dVar.baizhuHandle[i].handle = Actor.getHandle(pMonster)
        dVar.baizhuHandle[i].index = i
    end
    
end

-- 结束全服双倍经验活动
function EndActivity_DoubleExp(timeIdx)
	print("怒刷白猪活动 结束")	
	
	local dVar = System.getDyanmicVar()
	dVar.QFDoubleExpTime = nil
	System.broadcastTipmsg("怒刷白猪活动已经结束。", ttScreenCenter)
	System.broadcastTipmsg("怒刷白猪活动已经结束。", ttChatWindow)
--	System.broadcastTipmsg("全服双倍经验活动已经结束。", ttScreenCenter)
--	System.broadcastTipmsg("全服双倍经验活动已经结束。", ttChatWindow)
--	System.setActivtyExpRate(0, 0)
	
	-- 时间到双倍经验BUF会自动删除
    --删除白猪
    --local cfg = StdActivityCfg.QuanFuShuangBei.refresh
    --local hScene = Fuben.getSceneHandleById(cfg.sceneid, 0)
    --Fuben.clearMonster(hScene,cfg.monid)
    if dVar.baizhuHandle ~= nil then
         local cfg = StdActivityCfg.QuanFuShuangBei.refresh
        for i =1,table.getn(cfg.point) do
            Fuben.clearMonster(dVar.baizhuHandle[i].handle,false)
        end
    end
    dVar.baizhuHandle = nil
end

function JoinDoubleExpActivity(sysarg)
	local dVar = System.getDyanmicVar()
	if dVar.QFDoubleExpTime == nil then -- 活动还没开始
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		return
	end
	
	local cfg = StdActivityCfg.QuanFuShuangBei
	local Var = Actor.getStaticVar(sysarg)
	--运镖中
	if Var.ybstate ~= nil and Var.ybstate == 1 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.sb00001, ttFlyTip) 
		return
	end
	
	--在副本中
	local fubenId = Actor.getFubenId(sysarg)
	if fubenId > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.sb00002, ttFlyTip) 
		return
	end
	
	if Actor.hasBuffById(sysarg, cfg.buffid) then -- 已经参加了这个活动了
		Actor.sendTipmsg(sysarg, "您已经参加了全服双倍经验活动", ttFlyTip)
		return
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
	local leftSecond =0
	
	local tTelport = cfg.tTelport
	-- 第5个参数nType后端没有用到, 只是用传给前端
	local Fesult = System.telportSceneByName(sysarg, tTelport[2], tTelport[3], tTelport[4], 1)	

	Actor.addBuffById(sysarg, cfg.buffid, leftSecond) -- 增加双倍经验Buff
		
	sendJoinActivity(sysarg, cfg.id, leftSecond)	
end
