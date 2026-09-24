--#include "data\config\activity\StdActivityCfg.lua" once


--获得押镖状态(0：没有押镖；1：正在押镖；2：押镖成功且没有领取奖励；3：押镖超时)
function GetCrossYaBiaoState(sysarg)
	local dVar = Actor.getDyanmicVar(sysarg)
	
	-- YuanGuYBstart: nil没有开始押镖；0押镖成功且没有领取奖励；>0 押镖开始时间
	if dVar.YuanGuYBstart == nil then
		return 0
	elseif dVar.YuanGuYBstart == 0 then
		return 2
	end
	
	local now = System.getCurrMiniTime()
	if dVar.YuanGuYBstart > now or (now - dVar.YuanGuYBstart) > StdActivityCfg.KuafuYaSong.biaoCheLiveTime then 
		-- 这里不要清空dVar.YuanGuYBstart
		
		if Actor.getIsDartFlag(sysarg) == 3 then -- 跨服押镖
    		Actor.setDartFlag(sysarg, 0) --设置不在押镖状态
		end

		return 3
	end
	
	return 1
end

-- 是否能跨服押镖
function IsCanCrossYaBiao(sysarg, isCheckYabiaoCount)
	if not System.isCrossServer() then -- 在跨服中就不需要判断了
		if System.getDaysSinceOpenServer() < 5 then
			Actor.sendTipmsg(sysarg, "远古押镖活动开服五天后才开启", ttFlyTip)
			return false
		end
	end
	
	if StdActivityCfg.KuafuYaSong.isDelete == true then
		Actor.sendTipmsg(sysarg, "活动入口已关闭", ttFlyTip)
		return false
	end
	
	-- 活动已经结束
	local nIdx = checkActivityTime(StdActivityCfg.KuafuYaSong.tOpenTime.times)
	if nIdx==0 then 
		Actor.sendTipmsg(sysarg, "活动时间未到", ttFlyTip)
		return false
	end
	
	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	if nCircle < 3 then 
		Actor.sendTipmsg(sysarg, "转身等级不足", ttFlyTip)
		return false
	end
	
	--押镖次数用完
	if isCheckYabiaoCount == nil or isCheckYabiaoCount == true then -- 如果要检查押镖次数
		local var = Actor.getStaticVar(sysarg)
		local yuanGuYabiaoCount = var.days.yuanGuYabiaoCount
		if yuanGuYabiaoCount ~= nil and yuanGuYabiaoCount >= StdActivityCfg.KuafuYaSong.maxYabiaoCount then		
			Actor.sendTipmsg(sysarg, "押镖次数用完", ttFlyTip)
			return false 
		end
	end
			
	local battle_power = Actor.getMyTopBattle(sysarg)
	if battle_power==-1 or battle_power==0 then 
		Actor.sendTipmsg(sysarg, string.format("战力有误", needYb), ttFlyTip)
		return false
	end
	--print("battle_power="..battle_power)
	local cfgidx, needYb = System.getCrossBiaoCheSceneCfgIdxByBattlePower(battle_power)
	if cfgidx < 0 then return false end	
		
	if needYb > 0 and Actor.getMoneyCount(sysarg, mtYuanbao) < needYb then 
		Actor.sendTipmsg(sysarg, string.format("元宝数额不足%d进入失败", needYb), ttFlyTip)
		return false
	end
	
	return true
end

function DestroyCrossBiaoChe(sysarg)
	Actor.deleteTimer(sysarg, ActorTimerIds.CrossYaBiao)
	Actor.deleteTimer(sysarg, ActorTimerIds.CrossDartFollow)
	
	local dVar = Actor.getDyanmicVar(sysarg)
	if dVar.YuanGuBCHandle == nil then
		return
	end
	
	Fuben.clearMonster(dVar.YuanGuBCHandle, false)
	dVar.YuanGuBCHandle = nil
end

-- 通知前端跨服押镖状态
--[[
state:
nil 或 0 正常退出
1 活动结束退出
2 放弃远古押镖退出
3 元宝不足退出
4 玩家死亡押镖失败
5 押镖超时
--]]
function SendCrossYaBiaoState(sysarg, state)
	if state == nil then state = 0 end
	
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sCrossYaBiao)
	DataPack.writeByte(netPack, 2) -- 押镖状态
	DataPack.writeByte(netPack, state)
	DataPack.flush(netPack)
end

function SendCrossYaBiaoInfo(sysarg, msgType)
	-- 下发接镖数据给前端
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sCrossYaBiao)
	DataPack.writeByte(netPack, 0) -- 下发接镖数据
	
	DataPack.writeByte(netPack, msgType)
	
	local var = Actor.getStaticVar(sysarg)
	
	local leftCount = 0	
	local yuanGuYabiaoCount = var.days.yuanGuYabiaoCount
	if yuanGuYabiaoCount == nil then
		leftCount = StdActivityCfg.KuafuYaSong.maxYabiaoCount
	elseif yuanGuYabiaoCount < StdActivityCfg.KuafuYaSong.maxYabiaoCount then
		leftCount = StdActivityCfg.KuafuYaSong.maxYabiaoCount - yuanGuYabiaoCount
	end		
	
	DataPack.writeByte(netPack, leftCount) --剩余次数
	
	-- 获得押镖状态(0：没有押镖；1：正在押镖；2：押镖成功且没有领取奖励；3：押镖超时)
	local ybState = GetCrossYaBiaoState(sysarg)
	if ybState == 1 or ybState == 2 then
		DataPack.writeByte(netPack, 1) --正在押镖
	else
		DataPack.writeByte(netPack, 0) --没在押镖
	end
	
	DataPack.flush(netPack)	
end

-- 继续护送
function ContinueYuanGuYaBiao(sysarg, isTip)
	--获得押镖状态(0：没有押镖；1：正在押镖；2：押镖成功且没有领取奖励；3：押镖超时)
	local ybState = GetCrossYaBiaoState(sysarg)
	if ybState == 0 then
		if isTip then
			Actor.sendTipmsg(sysarg, "请先接镖", ttFlyTip)
		end
		return 0
	elseif ybState == 3 then
		if isTip then
			Actor.sendTipmsg(sysarg, "押镖超时", ttFlyTip)
		end
		return 0
	elseif ybState == 2 then	
		if isTip then	
			Actor.sendTipmsg(sysarg, "您已成功押镖", ttFlyTip)	
		end	
		return 0
	elseif ybState ~= 1 then
		return 0
	end
	
	local dVar = Actor.getDyanmicVar(sysarg)
	
	local bcHandle = dVar.YuanGuBCHandle
	if not bcHandle then return 0 end
	
	local bcptr = Actor.getEntity(bcHandle)
	if not bcptr then return 0 end
	
	local sceneid = Actor.getSceneId(bcptr)
	local sceneName, x, y = Actor.getSceneName( bcptr, 0, 0 )
	
	--取距离- 如果距离在镖车附近，就不下发跟随到镖车了
    local nx,ny = Actor.getEntityPosition(sysarg)
    local dis = math.max(math.abs(x -nx),math.abs(y - ny))
   
    --与镖车距离相近，则继续寻路到目标NPC  
    if dis <= 6 then
        --把客户端的GameData.AUTO_ESCORTCAR 设置为押镖状态
        local packEx = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sMoveToDartPos)
        DataPack.writeInt(packEx, 0)
        DataPack.flush(packEx)
        
        -- 改为手动押镖
        --Actor.autoFindPathToNpc(sysarg, sceneid, StdActivityCfg.KuafuYaSong.destNPCName)

        return 1
    end
    
	-- 与镖车距离太远则回头找镖车
	local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sMoveToDartPos)
	DataPack.writeInt(pack, sceneid)
	DataPack.writeString(pack, sceneName)
	DataPack.writeInt(pack, x)
	DataPack.writeInt(pack, y -1 )
	DataPack.flush(pack)
	
		
	--[[
	--判断与npc的距离,近的话就打开提交窗口
	local NpcPtr = Fuben.getNpcPtrByName(sceneid, "豹头镖局")
	local	npcx, npcy	=	Actor.getEntityPosition(NpcPtr,0,0)
	local dis2 = math.max(math.abs(x -npcx),math.abs(y - npcx))
	if dis2<4 then 
		Actor.npcTalkByNameEx(sysarg,"豹头镖局")
		dVar.crossAutoYB = 0 --和npc谈话，然后停止自动押镖
		return 
	end
	--]]
	
	return 2
end

function CrossYaBiaoTimeout(sysarg)
	--获得押镖状态(0：没有押镖；1：正在押镖；2：押镖成功且没有领取奖励；3：押镖超时)
	--local state = GetCrossYaBiaoState(sysarg)
	
	DestroyCrossBiaoChe(sysarg)
	
	local dVar = Actor.getDyanmicVar(sysarg)		
	dVar.YuanGuYBstart = nil
	dVar.YuanGuSceneId = nil
	
	if Actor.getIsDartFlag(sysarg) == 3 then -- 跨服押镖
    	Actor.setDartFlag(sysarg, 0) --设置不在押镖状态
	end
		
	--发送信息给前端 押镖超时
	SendCrossYaBiaoState(sysarg, 5)
end

-- 跨服镖车跟随失败时定时器 返回 0 则删除定时器
function CrossDartFollowFail(sysarg)
	local ret = ContinueYuanGuYaBiao(sysarg, false)
	if ret ~= 2 then
		-- 返回 0 则删除定时器
		return 0
	end
end