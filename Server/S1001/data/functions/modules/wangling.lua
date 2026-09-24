-- 王陵
--#include "data\config\modules\wangling_cfg.lua" once

function wangling_on_server_started()
	System.addTimer("wangling_on_timer", 60 * 1000, -1)
end

function wangling_on_timer(leftTimes)
	local players = LuaHelp.getSceneAliveActorListById(wangling_cfg.scene_id)
	if players ~= nil then	
		for k, v in ipairs(players) do
			-- 每分钟增加 1 点瘴气
			wangling_add_miasma(v, 1)
		end
	end
	
end

function wangling_on_monster_by_Killed(monster, sysarg, monId, sceneId)
	if sceneId ~= wangling_cfg.scene_id then return end
	
	for k, v in ipairs(wangling_cfg.monster_list) do
		if monId == v.monster_id then
			wangling_add_miasma(sysarg, v.miasma)
			break
		end
	end
end

function wangling_send_miasma(player, miasma)
	local netPack = DataPack.allocPacket(player, 139, LogicCmd.miscSys.sub.sWanglingMiasma)
	DataPack.writeByte(netPack, miasma > 100 and 100 or miasma)	
	DataPack.flush(netPack)
end

function wangling_send_data(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sWanglingData)
	
	local var = Actor.getStaticVar(sysarg)
	local enterTimes = var.days.wanglingTimes
	if enterTimes == nil then enterTimes = 0 end
	
	DataPack.writeByte(netPack, enterTimes)	
	
	DataPack.flush(netPack)
end

function wangling_add_miasma(player, val)
	if val <= 0 then return end
	
	local dVar = Actor.getDyanmicVar(player)			
	
	local old_miasma = dVar.miasma
	if old_miasma == nil then old_miasma = 0 end
	
	local new_miasma = old_miasma + val
	dVar.miasma = new_miasma
			
	-- 没满才下发，满了就不下发了
	if old_miasma < 100 then
		wangling_send_miasma(player, new_miasma)
	end
	
	if new_miasma >= 100 then -- 满了
		if Actor.existTimer(player, ActorTimerIds.wangling) == false then
			Actor.addTimer(player, ActorTimerIds.wangling, 30*1000) -- 30 秒倒计时
		end
	end

end

function wangling_enter_scene(sysarg)
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if level < wangling_cfg.need_level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, wangling_cfg.need_level), ttFlyTip)
		return
	end
	
	if Actor.getSceneId(sysarg) == wangling_cfg.scene_id then return end
	
	local var = Actor.getStaticVar(sysarg)
	local enterTimes = var.days.wanglingTimes
	if enterTimes == nil then enterTimes = 0 end
	
	local moneyType = mtBindYuanbao
	local money = 0
	
	if enterTimes < 3 then	
		moneyType = mtBindYuanbao
		money = wangling_cfg.bindyb_enter
		local myBindYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_BIND_YUANBAO)
		if myBindYb < money then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.BindYbNotEnough, money), ttFlyTip)
			return
		end
	else
		moneyType = mtYuanbao
		money = wangling_cfg.yb_enter_base + wangling_cfg.yb_enter_add * (enterTimes - 3)
		money = math.floor(money)
		local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
		if myYb < money then
			SendRecommendTips(sysarg,"1")
			return
		end
	end
	
	if not Actor.changeMoney(sysarg, moneyType, -money, LogIds.EnterWanglingMoney, tostring(enterTimes + 1)) then
		return
	end
				
	Actor.enterScene(sysarg, wangling_cfg.scene_id, 53, 128)
	
	if Actor.getSceneId(sysarg) ~= wangling_cfg.scene_id then -- 进入失败返回金钱
		Actor.changeMoney(sysarg, moneyType, money, LogIds.EnterWanglingFailReturnMoney, tostring(enterTimes + 1))
		return
	end
	
	var.days.wanglingTimes = enterTimes + 1
	
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.miasma = nil -- 瘴气清 0
	wangling_send_miasma(sysarg, 0)
	
	local msg = string.format("玩家<(c0xFF00FF00)%s>进入霸者王陵挑战高级BOSS  <我也要挑战/@@showWin,165>", Actor.getName(sysarg))
	System.broadcastTipmsg(msg, ttChatWindow)
end

function wangling_exit_scene(sysarg)
	if Actor.getSceneId(sysarg) == wangling_cfg.scene_id then
		Actor.exitActivityScene(sysarg)	
		
		local dVar = Actor.getDyanmicVar(sysarg)
		dVar.miasma = nil -- 瘴气清 0
		
		Actor.deleteTimer(sysarg, ActorTimerIds.wangling)
	end
end

-- 客户端消息
function on_msg_wangling(sysarg, sysid, packet)
	if sysid ~= LogicCmd.miscSys.sub.cWangling then
		print("error on_msg_wangling, sysid="..sysid)
		return
	end
	
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then
		wangling_enter_scene(sysarg)
	elseif msgid == 2 then
		wangling_exit_scene(sysarg)	
	elseif msgid == 3 then
		wangling_send_data(sysarg)	
	else
		print("error on_msg_wangling, unknown msgid="..msgid)
		return
	end
end