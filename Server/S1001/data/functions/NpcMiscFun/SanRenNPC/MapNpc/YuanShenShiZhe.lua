
-- local t = {}
NpcDialog[400] = {
	data = {
		{mapid = 569, mapname = "出世之境", yuanshenLevel = 1, yuanshenName = "出世1重"},
		{mapid = 570, mapname = "练气之境", yuanshenLevel = 7, yuanshenName = "练气1重"},
		{mapid = 571, mapname = "固本之境", yuanshenLevel = 13, yuanshenName = "固本1重"},
		{mapid = 572, mapname = "培元之境", yuanshenLevel = 19, yuanshenName = "培元1重"},
		{mapid = 573, mapname = "红尘之境", yuanshenLevel = 25, yuanshenName = "红尘1重"},
		{mapid = 574, mapname = "明心之境", yuanshenLevel = 31, yuanshenName = "明心1重"},
		{mapid = 666, mapname = "小悟之境", yuanshenLevel = 37, yuanshenName = "小悟1重"},
		{mapid = 667, mapname = "大悟之境", yuanshenLevel = 43, yuanshenName = "大悟1重"},
	},
}
	
NpcDialog[400].main = function(sysarg)
	--//主显示内容
	local echo =""
	echo = [[<(c0xFFeabc78)元神境界：>
      <(c0xFFeabc78)1. 通过在角色-元神系统中提升元神等级.> 
      <(c0xFFeabc78)2. 元神等级达到要求便可随意进入对应元神地图.> 
      <(c0xFFeabc78)3. 元神装备产出唯一途径！更有高转装备掉落.>
<(idecoLine#330)>]]

	local val = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARPATH_ID)
	local curLevel = System.getIntByte(val, 3)

	for i, v in ipairs(NpcDialog[400].data) do
		local str
		if curLevel >= v.yuanshenLevel then
			str = string.format("\\                <%s/@enterMap,%d> <(c0xFFeabc78)（元神境界达到 %s）>", v.mapname, i, v.yuanshenName)
		else
			str = string.format("\\                <%s/@enterMap,%d> <(c0xFF888888)（元神境界达到 %s）>", v.mapname, i, v.yuanshenName)
		end
		
		echo = echo .. str
	end

echo = echo .. [[
<(idecoLine#330)>
<(c0xFFeabc78)掉落显示：>
]]

	local smbl = {6347,6348,6349,6350,6351,6352,7006,7007,7008,7009,7010,7011,7015,7016,7017,7018,7019,7020};
	for i =1, #smbl do
		
		if i % 6 == 0 then
			echo = echo .. string.format("<(iitem#%d#1)>\\",smbl[i])
		else
			echo = echo .. string.format("<(iitem#%d#1)> ",smbl[i])		
		end
	
	end

  

	 return echo;
end


NpcDialog[400].enterMap = function(sysarg, idx)
    idx = tonumber(idx)
    
    local dataCfg = NpcDialog[400].data[idx]
    if dataCfg == nil then return end
    
    local val = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARPATH_ID)
	local curLevel = System.getIntByte(val, 3)
	
	if curLevel < dataCfg.yuanshenLevel then
		Actor.sendTipmsg(sysarg, "元神境界等级不足,无法进入!", ttFlyTip)
		return
	end	
	
	local sceneId = Actor.getSceneId(sysarg)
	if sceneId >= 569 and sceneId <= 574 then -- 已经是在元神场景了
		return
	end
     
    local var = Actor.getStaticVar(sysarg)
	local enterCount = var.days.yuanshenEnterCount
	if enterCount == nil then enterCount = 0 end
	
	if enterCount >= 99999 then
		Actor.sendTipmsg(sysarg,"每日3次数已用完,无法进入,次日0点更新!",ttFlyTip)
        return
	end
	
    Actor.enterScene(sysarg, dataCfg.mapid, -1, -1)

	enterCount = enterCount + 1
	var.days.yuanshenEnterCount = enterCount
	
	-- 只能待60分钟
	Actor.deleteTimer(sysarg, ActorTimerIds.yuanshenMap)
	Actor.addTimer(sysarg, ActorTimerIds.yuanshenMap, 600000 * 600000)
    
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local actorName = Actor.getName(sysarg)	
	System.sendCommonLog(LogIds.enterYuanshenMap, actorId, actorName, enterCount, 0, 0, "进入次数", "", "")
end

