
--sex服务开始
function HotSpringStart()
	local config = HotSpringConfig
	local dvar = System.getDyanmicVar()
	dvar.hotSpring = 1
	dvar.pearlCount = 0
	
	--注册个时间
	Actor.unregScriptCallback(thisNPC, "MobPearlMon")
	local pearlMon = config.flower.pearlMon
	local result = Actor.regScriptCallback(thisNPC, thisNPC, 0, pearlMon.interval*1000, pearlMon.times, "MobPearlMon")
	
	System.broadcastTipmsg(Lang.Activity.a00169, ttScreenCenter+ttChatWindow)
end

--sex服务结束
function HotSpringOver()
	local dvar = System.getDyanmicVar()
	dvar.hotSpring = nil
	dvar.pearlCount = nil
	System.broadcastTipmsg(Lang.Activity.a00170, ttScreenCenter)
end

--刷贝壳
function MobPearlMon()
	
	local config = HotSpringConfig
	local hScene = Fuben.getSceneHandleById(config.actArea.sid, 0)
	local pearlMon = config.flower.pearlMon
	Fuben.createMonstersInRange(hScene, pearlMon.mid, pearlMon.x1, pearlMon.y1, pearlMon.x2, pearlMon.y2, pearlMon.count, pearlMon.liveTime)
end


function ClearHotSpring()
	local config = HotSpringConfig
	if (not config) then return end
	-- local dval = System.getDyanmicVar()
	-- dval.HorseRaceStart = nil	--赛马 预备开始
	-- dval.HorseRaceBegin = nil	--赛马 正式开炮
	
	
	local playerList = LuaHelp.getSceneActorListById(config.actArea.sid)  --获取某场景玩家对象列表
	if playerList ~= nil then
		for i = 1, #playerList do
			local player = playerList[i]
			if player then
				--直接把玩家传出来
				ExitHotSpringMap(player)
			end
		end
	end
	
	System.broadcastTipmsg("太虚灵泉暂停开放", ttScreenCenter+ttChatWindow)
end


--离开场景
function ExitHotSpringMap(sysarg)
	--直接把玩家传出来
	--local Pos = LuaHelp.getReloadMapPos(sysarg) 
	local retScene = HotSpringConfig.returnArea
	if Actor.enterScene(sysarg, retScene.sid, retScene.x, retScene.y) == true then
		Actor.closeActivityWind(sysarg)
	end
end
