-- 	春节活动--春节年兽 3
--#include "data\functions\Activity\SpringFestivalActivity.lua" once

function spring_monster_refresh_monsters()		
	local hScene = Fuben.getSceneHandleById(SpringFestivalCfg.Monsters.sceneId, 0)
	if hScene == nil then
		print("error, spring_monster_on_timer hScene==nil")
		return
	end
	
	for i, v in ipairs(SpringFestivalCfg.Monsters.monsterList) do
		local count = Fuben.createMonstersInRange(hScene, v.monsterId, v.x1, v.y2, v.x2, v.y2, v.count, v.liveTime)
		if count ~= v.count then
			print("error, spring_monster_on_timer needCount="..v.count..",count="..count)
		end
	end
end

function spring_monster_on_timer()
	if not is_spring_festival_time() then
		System.deleteTimer("spring_monster_on_timer")
		return
	end
	
	spring_monster_refresh_monsters()	
	
	local noticeStr = "年兽已在新年地图中出现，击杀年兽得新春爆竹！<立即前往/@@showWin,243>"
	System.broadcastTipmsg(noticeStr, ttChatWindow)
end

function spring_monster_enter_scene(sysarg)
	local sceneId = Actor.getSceneId(sysarg)
	if sceneId == SpringFestivalCfg.Monsters.sceneId then
		Actor.sendTipmsg(sysarg, "您已经在该场景中了", ttFlyTip)
	    return
	end
	
	if Actor.hasState(sysarg, esStateStall) then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.fuben036, ttFlyTip)
		return
	end	
	
	local var = Actor.getStaticVar(sysarg)
	
	if var.ybstate == 1 then	-- 正在押送镖车
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.fuben022, ttFlyTip)
		return
	end
	
	Actor.enterScene(sysarg, SpringFestivalCfg.Monsters.sceneId, SpringFestivalCfg.Monsters.enterX, SpringFestivalCfg.Monsters.enterY)
end

function spring_monster_exit_scene(sysarg)
	local sceneId = Actor.getSceneId(sysarg)
	if sceneId ~= SpringFestivalCfg.Monsters.sceneId then		
	    return
	end
	
	Actor.exitActivityScene(sysarg)	
end

function spring_monster_activity_start_or_end(is_start, is_started_server)
	if is_start then
		spring_monster_refresh_monsters()
		System.addTimer("spring_monster_on_timer", 18000 * 1000, -1)
	else
		System.deleteTimer("spring_monster_on_timer")
	end
end

function spring_monster_main(sysarg, packet)
	local msgId = DataPack.readByte(packet)
	
	if msgId == 1 then -- 进入场景
		spring_monster_enter_scene(sysarg)	
	elseif msgId == 2 then -- 退出场景
		spring_monster_exit_scene(sysarg)	
	else
		print("error spring_monster_main, unknown msgId="..msgId)
	end
end

register_spring_festival_func(3, spring_monster_main)
register_spring_festival_start_end_func(spring_monster_activity_start_or_end)