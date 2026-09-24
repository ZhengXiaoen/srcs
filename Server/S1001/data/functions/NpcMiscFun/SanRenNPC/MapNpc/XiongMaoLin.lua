--熊猫林

NpcDialog[403] = {}
NpcDialog[403].main = function(sysarg)
	
	--是否在圣诞活动中
	local isChristAct = NpcDialog[403].IsInChristmasActivity()
	
	local hScene = Fuben.getSceneHandleById(668)
	-- 该场景是否有怪
	local hasMonster = Fuben.hasLiveMonster(hScene)

	local openServerDay = System.getDaysSinceOpenServer()

	if openServerDay<8 then 
		if isChristAct then -- 在圣诞活动中
			
			local echo =  [[
  	<进入圣诞地图/@enterChristmasScene>
]]

			return echo
		else
			Actor.sendTipmsg(sysarg,"开服第8天开启此功能,敬请关注", ttFlyTip) 
		end
		return 
	end
	
	local str = ""
	if hasMonster then
		str = "<(c0xFF00FF00)存活>"
	else
		str = "<未刷新>"
	end
	
	local echo =  [[
  <(c0xFF00c0ff)熊猫林描述:>
   <(c0xFFeabc78)身怀大量宝藏的国宝藏身于熊猫林中,场景内随机坐标刷新!><(idecoLine#350)>
   	<(c0xFFeabc78)每次进入所需一根><竹子><(c0xFFeabc78),每次可停留60分钟.>
   		<竹子><(c0xFFeabc78)唯一产出：《每日充值赠送》>
    		<(c0xFFeabc78)熊猫林怪物状态：>]]..str..[[
  			
			<进入熊猫林/@enterScene>
]]
	
	local smbl = {7039,6715,6719,6723,6727,6247,6248,6249,6250,6223,6224,6225,6226,6888,6892,6896,6941,7043};
	for j = 1,#smbl do
		
		if j == 6 or  j == 12 or j == 18 then
			echo = echo .. NpcDialog[403].ipk(smbl[j]) .. "\\";
		else
			echo = echo .. NpcDialog[403].ipk(smbl[j]) .. " ";
		end
	end
    
    if isChristAct then -- 在圣诞活动中
		echo = echo .. "  <(c0xFF00c0ff)圣诞地图描述:><(c0xFFeabc78)圣诞雪人2小时刷新,小雪人1小时刷新,可掉落极品装备道具！>\<(c0xFFeabc78)每次进入所需一颗><雪球><(c0xFFeabc78),每次可停留60分钟.>\\			<进入圣诞地图/@enterChristmasScene>\\   	<地图仅限活动期间进入.雪球可通过圣诞活动产出>"
	end
	
	 return echo;
end


NpcDialog[403].ipk = function(id)
    if not id then id = 1; end
    return string.format("<(iitem#%s#1)>",id);
end


NpcDialog[403].enterScene = function(sysarg)
	--摆摊
	if Actor.hasState(sysarg,esStateStall) then
		Actor.sendTipmsg(sysarg, "摆摊时不能进入", ttFlyTip)
		return
	end
	
	local sceneId = 668
	local needItemId = 7086
	
	local curSceneId = Actor.getSceneId(sysarg)
	if curSceneId == sceneId then
		return
	end
	
	if curSceneId == 731 then -- 圣诞地图
		Actor.sendTipmsg(sysarg, "不能从该地图进入熊猫林", ttFlyTip)
		return
	end
	
	if Actor.getItemCount(sysarg, needItemId) <= 0 then
		Actor.sendTipmsg(sysarg, "需要一个"..Item.getItemName(needItemId), ttFlyTip)					
		return
	end
	
	local sceneName = Fuben.getSceneNameById(sceneId)
	if Actor.removeItem(sysarg, needItemId, 1, -1, -1, -1, sceneName, GameLog.cEnterSceneConsum) < 1 then
		return
	end
	
	local hScene = Fuben.getSceneHandleById(sceneId)
	local sceneWidth = Fuben.getSceenWidth(hScene)
	local sceneHeight = Fuben.getScenHeight(hScene)
	
	local w2 = math.floor(sceneWidth/2)
	local h2 = math.floor(sceneHeight/2)
	
	-- 传入场景的随机一个点
	if Actor.enterScene(sysarg, sceneId, w2, h2, w2, h2) == false then
		Actor.addItem(sysarg, needItemId, 0, 0, 1, 1, 0, "进入熊猫林失败", GameLog.cEnterSceneConsum)
		Actor.sendTipmsg(sysarg, "进入"..sceneName.."失败", ttFlyTip)
		return
	end
end

-- 玩家进入场景
NpcDialog[403].OnPlayerEnterScene = function(sysarg, args)
	local lastSceneId = args[1] -- 上一个场景ID
	local sceneId = args[2] -- 当前场景ID
	local scenePtr = args[3] -- 当前场景指针
	
	if lastSceneId == 731 or sceneId == 731 then -- 圣诞地图
		NpcDialog[403].OnPlayerEnterChristmasScene(sysarg, sceneId, lastSceneId)
		return
	end
	
	if lastSceneId ~= 668 and sceneId ~= 668 then
		return
	end
	
	if lastSceneId == 668 and sceneId == 668 then
		if not Actor.existTimer(sysarg, ActorTimerIds.ExitXiongMaoLin) then
			Actor.addTimer(sysarg, ActorTimerIds.ExitXiongMaoLin, 3600*1000)
		end
		
		return
	end
	
	if lastSceneId == 668 then
		Actor.deleteTimer(sysarg, ActorTimerIds.ExitXiongMaoLin)
	end	
		
	if sceneId == 668 then
		Actor.addTimer(sysarg, ActorTimerIds.ExitXiongMaoLin, 3600*1000)
	end	
	
end

----------------- 圣诞地图
--是否在圣诞活动中
NpcDialog[403].IsInChristmasActivity = function()

	local svar = System.getStaticVar()
	
	if svar.JingJiOpenDay==nil then return false end
	
	if svar.isDringJingJi ==nil or svar.isDringJingJi<1 or svar.isDringJingJi>svar.JingJiOpenDay then 
		return false
	end
	
	local activityType = svar.JingJiActivityTypes
	if activityType == nil or activityType ~= 1 then
		return false
	end	

	return true
end

NpcDialog[403].enterChristmasScene = function(sysarg)
	if NpcDialog[403].IsInChristmasActivity() == false then
		Actor.sendTipmsg(sysarg, "进入圣诞地图失败，不在圣诞活动中", ttFlyTip)
		return
	end
	
	if Actor.hasState(sysarg,esStateStall) then
		Actor.sendTipmsg(sysarg, "摆摊时不能进入", ttFlyTip)
		return
	end
	
	local sceneId = 731 -- 圣诞地图
	local needItemId = 7812 -- 需要扣除的物品
	
	local curSceneId = Actor.getSceneId(sysarg)
	if curSceneId == sceneId then
		return
	end
	
	if curSceneId == 668 then -- 熊猫林
		Actor.sendTipmsg(sysarg, "不能从该地图进入圣诞地图", ttFlyTip)
		return
	end
	
	if Actor.getItemCount(sysarg, needItemId) <= 0 then
		Actor.sendTipmsg(sysarg, "需要一个"..Item.getItemName(needItemId), ttFlyTip)					
		return
	end
	
	local sceneName = Fuben.getSceneNameById(sceneId)
	if Actor.removeItem(sysarg, needItemId, 1, -1, -1, -1, sceneName, GameLog.cEnterSceneConsum) < 1 then
		return
	end
	
	local hScene = Fuben.getSceneHandleById(sceneId)
	local sceneWidth = Fuben.getSceenWidth(hScene)
	local sceneHeight = Fuben.getScenHeight(hScene)
	
	local w2 = math.floor(sceneWidth/2)
	local h2 = math.floor(sceneHeight/2)
	
	-- 传入场景的随机一个点
	if Actor.enterScene(sysarg, sceneId, w2, h2, w2, h2) == false then
		Actor.addItem(sysarg, needItemId, 0, 0, 1, 1, 0, "进入圣诞地图失败", GameLog.cEnterSceneConsum)
		Actor.sendTipmsg(sysarg, "进入"..sceneName.."失败", ttFlyTip)
		return
	end
end

NpcDialog[403].OnPlayerEnterChristmasScene = function(sysarg, sceneId, lastSceneId)
	if lastSceneId ~= 731 and sceneId ~= 731 then
		return
	end
	
	if lastSceneId == 731 and sceneId == 731 then
		if not Actor.existTimer(sysarg, ActorTimerIds.ExitChristmasScene) then
			Actor.addTimer(sysarg, ActorTimerIds.ExitChristmasScene, 3600*1000)
		end
		
		return
	end
	
	if lastSceneId == 731 then
		Actor.deleteTimer(sysarg, ActorTimerIds.ExitChristmasScene)
	end	
		
	if sceneId == 731 then
		Actor.addTimer(sysarg, ActorTimerIds.ExitChristmasScene, 3600*1000)
	end	
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEnterSceneNew, NpcDialog[403].OnPlayerEnterScene)