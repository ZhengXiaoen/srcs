--#include "data\functions\Activity\YuanGuBiaoCheUtils.lua" once
--#include "data\config\CrossServerConfig.lua" once

-- 下发给前端的消息类型：
-- 0 下发接镖数据
-- 1 开始押镖
-- 2 押镖状态
-- 3 领取奖励成功
-- 4 交镖数据
-- 5 弹出界面

--开始远古押镖
function StartYuanGuYaBiao(sysarg)
	local ybState = GetCrossYaBiaoState(sysarg)
	if ybState == 1 then
		Actor.sendTipmsg(sysarg,"您正在押镖",ttFlyTip)
		return
	elseif ybState == 2 then
		Actor.sendTipmsg(sysarg,"押镖成功，请先领取奖励",ttFlyTip)
		return
	end
	
	if not IsCanCrossYaBiao(sysarg) then
		return
	end
	
	--如果原来是有镖车的，把他杀死
	DestroyCrossBiaoChe(sysarg)
	
	local sceneid = Actor.getSceneId(sysarg)	
	
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.YuanGuYBstart = nil
	dVar.YuanGuSceneId = nil
	
	if Actor.getIsDartFlag(sysarg) == 3 then -- 跨服押镖
    	Actor.setDartFlag(sysarg, 0) --设置不在押镖状态
	end
		
	local var = Actor.getStaticVar(sysarg)
	var.yuanGuYabiaoExitReason = nil
	
	-- 创建镖车
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local x, y = Actor.getEntityPosition(sysarg, 0, 0) --获取实体X Y坐标	
	
	-- 远古镖车为无敌状态(配置 DenyBeAttack, DenyAttackedByActo)
    local biaochePtr = Actor.createMonster(sysarg, StdActivityCfg.KuafuYaSong.biaoCheId, x, y, StdActivityCfg.KuafuYaSong.biaoCheLiveTime + 5, true, sceneid)
	if biaochePtr == nil then return end -- 创建镖车失败
	
	Actor.followActor(biaochePtr, sysarg, 2, 12, true) --跟随某个玩家(跟随保持最小距离，最大距离)	
    Actor.setMonsterStrEx(biaochePtr, Actor.getName(sysarg))
    Actor.setBCMonsterOwnerId(biaochePtr, actorId)
	Actor.setEntityTelByOwnderAttr(biaochePtr, true)   --设置实体是否跟着归属者传送
	--Actor.setEntityLazyFollow(biaochePtr, true)        --设置实体是否惰性跟随。惰性跟随距离远了会自动拉到被跟随者；非惰性跟随会检测跟随距离，距离符合会传送。（部分实现）
	Actor.setDenyAttackedByActor(biaochePtr, true)     --设置实体是否可被玩家攻击
	Actor.refreshActorObserveList(sysarg)     --刷新观察者，防止客户端延迟 

		
	dVar.YuanGuBCHandle = Actor.getHandle(biaochePtr) --怪物句柄
	
	local now = System.getCurrMiniTime()
	dVar.YuanGuYBstart = now
	dVar.YuanGuSceneId = sceneid -- 保存一下，避免领到不是本场景的奖励	
	Actor.setDartFlag(sysarg, 3) --设置远古押镖
	Actor.onTakeOffRide(sysarg)
	
	if Actor.existTimer(sysarg, ActorTimerIds.CrossDartFollow) then
		Actor.deleteTimer(sysarg, ActorTimerIds.CrossDartFollow)
	end
	
	if Actor.existTimer(sysarg, ActorTimerIds.CrossYaBiao) then
		Actor.deleteTimer(sysarg, ActorTimerIds.CrossYaBiao)
	end
	Actor.addTimer(sysarg, ActorTimerIds.CrossYaBiao, StdActivityCfg.KuafuYaSong.biaoCheLiveTime * 1000)
	
	-- 只广播给远古战场的玩家
	--local RwData = StdActivityCfg.KuafuYaSong.RwData	
	--local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	--local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])  
	local tipmsg = string.format(Lang.ScriptTips.bc00018, Actor.getName(sysarg))
	
	for i =1,#CrossServerConfig.BiaoCheEnterScene do
        local cfg = CrossServerConfig.BiaoCheEnterScene[i]
        local cfgScene = cfg.nSceneId
        for j =1,#cfgScene do
            local nSceneId = cfgScene[j]
            System.broadcastCrossAreaTipmsg(tipmsg, ttChatWindow, nSceneId)            
        end
    end
		
	-- 通知前端押镖成功
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sCrossYaBiao)
	DataPack.writeByte(netPack, 1) -- 开始押镖
	DataPack.flush(netPack)
	
	SendCrossYaBiaoInfo(sysarg, 1) -- 0 代表 NPC 界面
	
	--大吉大利活动消耗屠魔点
	--if (svar.isDringDaJiDaLi ==nil or svar.isDringDaJiDaLi<2 or svar.isDringDaJiDaLi>3)==false then 
		--ClearDaJiDaLi_Data(sysarg)
		if var.days.enterYuanGuYaBiao==nil then 
			var.days.enterYuanGuYaBiao = 1
		else 
			var.days.enterYuanGuYaBiao = var.days.enterYuanGuYaBiao +1
		end

	--end
end

-- 结束远古押镖并退出游戏(state 为 nil 或 0 则回到本服后不弹出界面提示)
--[[
state:
nil 或 0 正常退出
1 活动结束退出
2 放弃远古押镖退出
3 元宝不足退出
4 玩家死亡押镖失败
5 押镖超时
--]]
function EndYuanGuYaBiaoAndExit(sysarg, state)
	--如果原来是有镖车的，把他杀死
	DestroyCrossBiaoChe(sysarg)
	
	local dVar = Actor.getDyanmicVar(sysarg)		
	dVar.YuanGuYBstart = nil
	dVar.YuanGuSceneId = nil
	
	if Actor.getIsDartFlag(sysarg) == 3 then -- 跨服押镖
    	Actor.setDartFlag(sysarg, 0) --设置不在押镖状态
	end
	
	local var = Actor.getStaticVar(sysarg)
	if state == nil or state == 0 then
		var.yuanGuYabiaoExitReason = nil
	else
		var.yuanGuYabiaoExitReason = state
	end
	
	--发送信息给前端以便连接到普通服
	SendCrossYaBiaoState(sysarg, state)
		
	-- 踢出玩家
	Actor.exitCrossServer(sysarg)
end

-- 放弃远古押镖
function GiveupYuanGuYaBiao(sysarg)
	EndYuanGuYaBiaoAndExit(sysarg, 2)
end

--领取奖励
function GetCrossYaBiaoAward(sysarg, index, isLogout)
	
	--获得押镖状态(0：没有押镖；1：正在押镖；2：押镖成功且没有领取奖励；3：押镖超时)
	local ybState = GetCrossYaBiaoState(sysarg)
	if ybState == 0 then
		if not isLogout then
			Actor.sendTipmsg(sysarg, "请先接镖", ttFlyTip)
		end
		return
	elseif ybState == 1 then
		if not isLogout then
			Actor.sendTipmsg(sysarg, "请先交镖", ttFlyTip)
		end
		return
	elseif ybState == 3 then
		if not isLogout then
			Actor.sendTipmsg(sysarg, "押镖超时", ttFlyTip)
		end
		return	
	elseif ybState ~= 2 then
		return
	end
	
	local sceneid = Actor.getSceneId(sysarg)
	
	local dVar = Actor.getDyanmicVar(sysarg)
	if dVar.YuanGuSceneId == nil or dVar.YuanGuSceneId ~= sceneid then -- 校验一下
		if not isLogout then
			Actor.sendTipmsg(sysarg, "非远古押镖场景", ttFlyTip)
		end
		return
	end
	
	if index == 2 then -- 双倍领取
		if Actor.getMoneyCount(sysarg, mtYuanbao) < StdActivityCfg.KuafuYaSong.doubleAwardYb then 
			if not isLogout then
				Actor.sendTipmsg(sysarg, "元宝不足", ttFlyTip)
			end
			return 
		end
	end
		
	local cfgidx, needYb = System.getCrossBiaoCheSceneCfgIdxBySceneId(sceneid)
	if cfgidx < 0 then
		if not isLogout then
			Actor.sendTipmsg(sysarg, "该场景没有奖励", ttFlyTip)
		end
		return
	end 
	
	-- 远古积分奖励
	local yuanguPoint = StdActivityCfg.KuafuYaSong.yuanguPointAwards[cfgidx + 1]
	if yuanguPoint == nil then
		print("config error, StdActivityCfg.KuafuYaSong.yuanguPointAwards["..(cfgidx + 1).."] == nil")
		return
	end
	
	if index == 2 then -- 双倍领取
		if not Actor.changeMoney(sysarg, mtYuanbao, -StdActivityCfg.KuafuYaSong.doubleAwardYb, LogIds.YGYBDoubleAwardYb, "") then
			return
		end
		
		yuanguPoint = yuanguPoint * 2
	end	
	
	local awards = { {type = 69, id = 0, count = yuanguPoint } } --远古积分
	
	if Awards.Give(sysarg, awards, LogIds.YGYBAward, tostring(index)) == false then
		print("error GetCrossYaBiaoAward actorid="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID)..",index="..index)
	end	
	
	local nActorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    System.sendCommonLog(LogIds.YGYBAward,nActorID,Actor.getName(sysarg),tostring(index))
	
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.YuanGuYBstart = nil
	dVar.YuanGuSceneId = nil
	
	if dVar.YuanGuBCHandle ~= nil then
		DestroyCrossBiaoChe(sysarg)
	end
	
	if Actor.getIsDartFlag(sysarg) == 3 then -- 跨服押镖
    	Actor.setDartFlag(sysarg, 0) --设置不在押镖状态
	end
		
	if not isLogout then
		if (index == 2) then -- 双倍领取
			Actor.sendTipmsg(sysarg, string.format("获得<(c0xFF00ff00)远古积分*%d>", yuanguPoint), ttFlyTip)
		else
			Actor.sendTipmsg(sysarg, string.format("获得<(c0xFF00ff00)远古积分*%d>", yuanguPoint), ttFlyTip)
		end	
		
		--告诉前端领取奖励成功
		local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sCrossYaBiao)
		DataPack.writeByte(netPack, 3) -- 领取奖励成功
		DataPack.flush(netPack)
	end
end

function MovetoCrossYaBiaoNPC(sysarg)
	if Actor.hasState(sysarg, esStateDeath) then
		return
	end
	
	--获得押镖状态(0：没有押镖；1：正在押镖；2：押镖成功且没有领取奖励；3：押镖超时)
	local ybState = GetCrossYaBiaoState(sysarg)
	if ybState ~= 0 and ybState ~= 3 then
		Actor.sendTipmsg(sysarg, "当前不能传送", ttFlyTip)
		return
	end
	
	local sceneid = Actor.getSceneId(sysarg)
	System.telportScene(sysarg, sceneid, 208, 160, false) -- y 减去 1
end

-- 玩家登陆
EventCallDispatcher.OnYuanGuYaBiaoActorLogin = function(sysarg,args)
	if not System.isCrossServer() then
		local var = Actor.getStaticVar(sysarg)
		if var.yuanGuYabiaoExitReason ~= nil then
			--发送信息给前端弹出界面
			local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sCrossYaBiao)
			DataPack.writeByte(netPack, 5) -- 弹出界面
			DataPack.writeByte(netPack, var.yuanGuYabiaoExitReason)
			DataPack.flush(netPack)
			
			var.yuanGuYabiaoExitReason = nil
		end
	end
end

-- 玩家登出
EventCallDispatcher.OnYuanGuYaBiaoActorLogout = function (sysarg, arg)
	if not System.isCrossServer() then return end

	if GetCrossYaBiaoState(sysarg) == 2 then -- 2：押镖成功且没有领取奖励
		GetCrossYaBiaoAward(sysarg, 1, true)
	end
	
	local dVar = Actor.getDyanmicVar(sysarg)
	if dVar.YuanGuBCHandle ~= nil then
		DestroyCrossBiaoChe(sysarg)
	end

end

EventCallDispatcher.YuanGuYuanBaoChangedEventHandler = function (sysarg, args)
	if not System.isCrossServer() then return end
	
	local nYuanBao = args[1]	--改变元宝数目
	local nLogId = args[2] --日志ID
	local isConsume = args[3]
	
	if nYuanBao >= 0 then return end
	
	local sceneid = Actor.getSceneId(sysarg)
	local cfgidx, needYb = System.getCrossBiaoCheSceneCfgIdxBySceneId(sceneid)
	if cfgidx < 0 then return end -- 不在远古押镖场景
	
	if needYb <= 0 then return end
	
	if Actor.getMoneyCount(sysarg, mtYuanbao) >= needYb then		
		return
	end		
		
	-- 元宝不足传出跨服
	EndYuanGuYaBiaoAndExit(sysarg, 3)
end

-- 在远古押镖地图中角色死亡（非安全区）会掉落元宝，其中30%元宝系统回收，70%元宝掉落， 掉落元宝为10元宝一组
function OnYuanGuDeathDropYuanbao(sysarg, dropYb)
	local myYb = Actor.getMoneyCount(sysarg, mtYuanbao)
	if dropYb > myYb then dropYb = myYb end
	
	if dropYb <= 0 then return end
	
	local saveDropYb = dropYb	
	
	dropYb = math.floor(dropYb * 0.7)
	
	local count = math.floor(dropYb/10)
	for i = 1, count do
		Item.createDropMoneyItem(sysarg, mtYuanbao, 10, LogIds.YGDeathDropYb, "远古押镖死亡", nil)
	end
	
	local leftYb = dropYb - 10 * count
	if leftYb > 0 then
		Item.createDropMoneyItem(sysarg, mtYuanbao, leftYb, LogIds.YGDeathDropYb, "远古押镖死亡", nil)
	end
	
	Actor.sendTipmsg(sysarg, string.format("损失元宝<(c0xFFFF0000)%d>", saveDropYb), ttFlyTip)
	
	-- 扣元宝放到最后，因为元宝不足时会传出跨服
	Actor.changeMoney(sysarg, mtYuanbao, -saveDropYb, LogIds.YGDeathConsumeYb, "")
end

-- 玩家死亡
EventCallDispatcher.YuanGuYuanBaoActorDie = function (sysarg, args)
	if not System.isCrossServer() then return end
	
	--获得押镖状态(0：没有押镖；1：正在押镖；2：押镖成功且没有领取奖励；3：押镖超时)
	local ybState = GetCrossYaBiaoState(sysarg)
	
	--如果原来是有镖车的，把他杀死
	DestroyCrossBiaoChe(sysarg)
	
	local dVar = Actor.getDyanmicVar(sysarg)		
	dVar.YuanGuYBstart = nil
	dVar.YuanGuSceneId = nil
	
	if Actor.getIsDartFlag(sysarg) == 3 then -- 跨服押镖
    	Actor.setDartFlag(sysarg, 0) --设置不在押镖状态
	end
	
	--非安全区死亡则掉元宝(不一定开始了押镖)
	if not Actor.hasMapAreaAttri(sysarg, aaSaft) then
		local cfgidx, needYb = System.getCrossBiaoCheSceneCfgIdxBySceneId(Actor.getSceneId(sysarg))
		if cfgidx >= 0 and needYb > 0 then
			OnYuanGuDeathDropYuanbao(sysarg, needYb)
		end
	end
	
	if ybState == 1 then
		-- 4 玩家死亡押镖失败
		SendCrossYaBiaoState(sysarg, 4)
	end
end

EventCallDispatcher.YuanGuYuanBaoActorReliveHandler = function (sysarg, args)
	if not System.isCrossServer() then return end
	
	local sceneid = Actor.getSceneId(sysarg)
	local cfgidx, needYb = System.getCrossBiaoCheSceneCfgIdxBySceneId(sceneid)
	if cfgidx < 0 then return end -- 不在远古押镖场景
	
	if needYb <= 0 then return end
	
	if Actor.getMoneyCount(sysarg, mtYuanbao) >= needYb then		
		return
	end		
		
	-- 元宝不足传出跨服
	EndYuanGuYaBiaoAndExit(sysarg, 3)
end

--请求远古押镖的信息
CrossYaBiaoHandle = function (sysarg, sysid, packet)
	if not System.isCrossServer() then return end
		
	local msgid = DataPack.readByte(packet)
	
	if (msgid == 1) then  --请求远古押镖了
		StartYuanGuYaBiao(sysarg)
	elseif (msgid == 2) then --继续/放弃押镖
		local types = DataPack.readByte(packet)
		
		if types == 1 then --继续护送
			local ret = ContinueYuanGuYaBiao(sysarg, true)
			local hasTimer = Actor.existTimer(sysarg, ActorTimerIds.CrossDartFollow)
			if ret == 2 then
				if not hasTimer then
					Actor.addTimer(sysarg, ActorTimerIds.CrossDartFollow, 1000)
				end
			else
				if hasTimer then
					Actor.deleteTimer(sysarg, ActorTimerIds.CrossDartFollow)
				end
			end
		elseif types == 0 then --放弃护送
			GiveupYuanGuYaBiao(sysarg)
		end
	elseif (msgid==3) then --领取奖励
		local types = DataPack.readByte(packet)
		GetCrossYaBiaoAward(sysarg, types, false)
	elseif (msgid==4) then --请求远古押镖信息
		local msgType = DataPack.readByte(packet)
		SendCrossYaBiaoInfo(sysarg, msgType)
	elseif (msgid==5) then --请求传送到押镖NPC处
		MovetoCrossYaBiaoNPC(sysarg)
	end
end

function YuanGuYaBiaoYuGao()
     if System.isCrossServer() then return end     
     if StdActivityCfg.KuafuYaSong.isDelete == true then return end
     
     if System.getDaysSinceOpenServer() < CrossServerConfig.YuanGuYaBiAoOpenDay and CanPassCrossServer()==false then		
		return false
	 end
	
     local str ="远古押镖活动5分钟之后开启，请大家踊跃参加。<我要参加/@@showWin,222,3>"
    System.broadcastTipmsg(str, ttChatWindow)
end

function YuanGuYaBiaoStart()
    if System.isCrossServer() then return end
    if StdActivityCfg.KuafuYaSong.isDelete == true then return end
    local sysVar = System.getDyanmicVar()
    sysVar.crossyabiaoactivity = 1
    if System.getDaysSinceOpenServer() < CrossServerConfig.YuanGuYaBiAoOpenDay and CanPassCrossServer()==false then		
		return 
	end
	local playerList = LuaHelp.getAllActorList()		--获取某场景玩家对象列表
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then	
				SendCrossActivityFlag(player)
			end
		end
	end 
    local str ="远古押镖活动已经开启，请大家踊跃参加。<我要参加/@@showWin,222,3>"
    System.broadcastTipmsg(str, ttChatWindow)
end

function YuanGuYaBiaoEnd()
    --if not System.isCrossServer() then
	--	
	--	if System.getDaysSinceOpenServer() < CrossServerConfig.YuanGuYaBiAoOpenDay then		
	--		return 
	--	end
    --    System.broadcastTipmsg("远古押镖活动已经结束", ttChatWindow)
    --
    --end
    local sysVar = System.getDyanmicVar()
    sysVar.crossyabiaoactivity = nil
    if System.isCrossServer() then
        for i =1,#CrossServerConfig.BiaoCheEnterScene do
            local cfg = CrossServerConfig.BiaoCheEnterScene[i]
            local cfgScene = cfg.nSceneId
            for j =1,#cfgScene do
                local nSceneId = cfgScene[j]
                local playerList = LuaHelp.getSceneActorListById(nSceneId) 
	            if playerList ~= nil then
		            for k = 1, #playerList do
			            local player = playerList[k]
			            if player then		
				           EndYuanGuYaBiaoAndExit(player,1)
			            end
		            end
	            end
            end

        end
    else
        local playerList = LuaHelp.getAllActorList()		--获取某场景玩家对象列表
	    if playerList ~= nil then
		    for j = 1, #playerList do
			    local player = playerList[j]
			    if player then	
				    SendCrossActivityFlag(player)
			    end
		    end
	    end 
    end
end


--3v3竞技开始
function MateRankStart(nType)
    local sysVar = System.getDyanmicVar()
    nType = tonumber(nType)
    if nType == 0 then
       	if System.getDaysSinceOpenServer() <CrossServerConfig.ThreeVThreeOpenDay and CanPassCrossServer()==false then 
		    return 
	    end
        
        sysVar.rankmateactivity = 1

        local str = "3v3竞技场已开启！参与活动即可获得远古积分奖励！<我也要参加/@@showWin,222>"
        System.broadcastTipmsg(str,ttChatWindow) 
    elseif nType == 1 then
         local dayofMonth = {31,28,31,30,31,30,31,31,30,31,30,31}
         local nYear,nMonth,nDay = System.getDate(0,0,0)
         if nDay == dayofMonth[nMonth] then
            if nHour >= 12 then
                return
            end
        end
        sysVar.singlerankactivity = 1
        local str = "1v1竞技场已开启！提高个人竞技排行赢得丰厚奖励！<我也要参加/@@showWin,222>"
        System.broadcastTipmsg(str,ttChatWindow) 
    end

    local playerList = LuaHelp.getAllActorList()		--获取某场景玩家对象列表
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then	
                SendCrossActivityFlag(player)

			end
		end
	end
end
--3v3竞技结束
function MateRankEnd(nType)
    nType = tonumber(nType)
    local sysVar = System.getDyanmicVar()
    if nType == 0 then
        if System.getDaysSinceOpenServer() <CrossServerConfig.ThreeVThreeOpenDay and CanPassCrossServer()==false then 
            return
        end
		
        sysVar.rankmateactivity = nil
    elseif nType == 1 then
        sysVar.singlerankactivity = nil

	end
	

    
	

    local playerList = LuaHelp.getAllActorList()		--获取某场景玩家对象列表
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then	
			    SendCrossActivityFlag(player)
			end
		end
	end
end
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cCrossYaBiao, CrossYaBiaoHandle)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogin, EventCallDispatcher.OnYuanGuYaBiaoActorLogin)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogout, EventCallDispatcher.OnYuanGuYaBiaoActorLogout)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeYuanbaoChangedEvent, EventCallDispatcher.YuanGuYuanBaoChangedEventHandler)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeOnActorDeath, EventCallDispatcher.YuanGuYuanBaoActorDie)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeRelive, EventCallDispatcher.YuanGuYuanBaoActorReliveHandler)