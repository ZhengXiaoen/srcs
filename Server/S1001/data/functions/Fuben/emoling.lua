--恶魔岭副本(炎龙守卫副本)
--#include "data\config\fuben\emoling.lua" once
--#include "data\functions\StdTask.lua" once
--#include "data\config\activity\StdActivityCfg.lua" once
--#include "data\config\SpecialTitleCfg.lua" once --特权
--#include "data\functions\OldPlayerReturnFunc.lua" once
-- 下发到前端协议
-- 1 下发恶魔岭副本
-- 2 下发剩余时间
-- 3 下发第几波怪
-- 4 下发累积经验
-- 5 下发守卫数
-- 6 下发守卫等级
-- 7 下发任务引导箭头
-- 8 下发结束

function emoling_send_left_time(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
	DataPack.writeByte(netPack, 2) -- 下发剩余时间	
		
	local fbptr = Actor.getFubenPrt(sysarg)
	local leftSecond = Fuben.getFbTime(fbptr)	
	
	DataPack.writeUInt(netPack, leftSecond)
	
	DataPack.flush(netPack)
end

-- 是否在恶魔岭副本中
function is_in_emoling(sysarg)
	return Actor.getFubenId(sysarg) == fuben_emoling_cfg.fubenid
end

-- 是否能进入恶魔岭副本
function can_enter_emoling(sysarg, istip)
	if is_in_emoling(sysarg) then
		if istip then
			Actor.sendTipmsg(sysarg, "您已经在威龙炼狱副本中了", ttFlyTip)
		end
		return false
	end

	if Actor.checkActorLevel(sysarg, fuben_emoling_cfg.need_level, 0) ~= true then
		if istip then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, fuben_emoling_cfg.need_level), ttFlyTip)
		end
		return false
	end

	local var = Actor.getStaticVar(sysarg)
	--运镖中
	if var.ybstate ~= nil and var.ybstate == 1 then
		if istip then
			Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip)
		end
		return false
	end

	-- 在副本中
	if Actor.getFubenId(sysarg) > 0 then
		if istip then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf568, ttFlyTip)
		end
		return false
	end

	if Actor.hasState(sysarg, esStateStall) then
		if istip then
			Actor.sendTipmsg(leaderPtr,Lang.ScriptTips.fuben036, ttFlyTip)
		end
		return false
	end

	--在武林争霸中
	if Actor.getSceneId(sysarg) == 58 then
		if istip then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf138, ttFlyTip)
		end
		return false
	end

	-- 在擂台战中
	local challengeid = Actor.getChallenge(sysarg)
	if challengeid ~= 0 then
		if istip then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00019,ttFlyTip)
		end
		return false
	end

	-- 每日进入次数
	if get_taskflags_val(sysarg) ~= 71 then
		if var.days.emolingCount ~= nil and var.days.emolingCount >= fuben_emoling_cfg.enter_count_daily then
			if istip then
				Actor.sendTipmsg(sysarg, "您今日的进入次数已经用完了,请您明天再来吧", ttFlyTip)
			end
			return false
		end
	end
	return true
end

-- 进入恶魔岭副本
function enter_emoling(sysarg)
	if not can_enter_emoling(sysarg, true) then
		return
	end

	local hfuben = Fuben.createFuBen(fuben_emoling_cfg.fubenid)
	if hfuben == 0 then
		Actor.sendTipmsg(sysarg, "创建威龙炼狱副本失败", ttFlyTip)
		return
	end

	local pos = fuben_emoling_cfg.enter_pos
	if Actor.enterFuBen(sysarg, hfuben, -1, pos[1], pos[2]) ~= true then
		Actor.sendTipmsg(sysarg, "进入威龙炼狱副本失败", ttFlyTip)
		return
	end

	Actor.closeDialogs(sysarg, diFubenTeam)
	--SetEnterFuben(sysarg)

	local var = Actor.getStaticVar(sysarg)	
	
	var.EMoLingAddUpExp = nil --清除
		
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.guarderCount = 0 --守卫数量
	dVar.emolingGuarderLevels = nil
	dVar.emolingFlags = nil
	dVar.emolingSecKill = nil
	dVar.emolingCallBoss = nil
    dVar.emolingIndex = 0 --恶魔岭第几波的波数
    dVar.emolingLiveCount = 0 --恶魔岭场景存活怪物
    dVar.emolingRefMonster = 0 --下一波刷新秒数计时
    dVar.emolingIsRef = 0 --是否每波正在刷新
	local enterCount = var.days.emolingCount
	if get_taskflags_val(sysarg) ~= 71 then --在任务状态，不增加次数
		if enterCount == nil then
			var.days.emolingCount = 1
		else
			var.days.emolingCount = enterCount + 1
			Quest_ShuaXin(sysarg)
		end
	end

	-- 准备时间
	Actor.addTimer(sysarg, ActorTimerIds.emolingReady, fuben_emoling_cfg.ready_time*1000)
	
	--------------
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
	DataPack.writeByte(netPack, 1) -- 下发恶魔岭副本
	DataPack.writeUInt(netPack, fuben_emoling_cfg.ready_time)
	DataPack.flush(netPack)
	--------------	
	
	if get_taskflags_val(sysarg) == 71 then 
		local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
		DataPack.writeByte(netPack, 7) -- 下发任务引导箭头
		DataPack.flush(netPack)
	end
end

--返回下次刷新怪物回调的时间
function on_emoling_update_timer_cb(sysarg)
    
    --如果不在恶魔岭副本了 删除定时器
    if not is_in_emoling(sysarg) then 
        Actor.deleteTimer(sysarg,ActorTimerIds.emolingUpdate)
        return 0
    end
    --场景怪物数量为0
    local dVar = Actor.getDyanmicVar(sysarg)
   
    if Fuben.getMonsterNum(sysarg) - dVar.guarderCount <= 0 then
		
		--任务波数（3）已满，传送回去领取奖励
		if get_taskflags_val(sysarg) == 71 and dVar.emolingIndex >= 3 then
            local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
	        DataPack.writeByte(netPack, 8) -- 下发第几波怪	
	        DataPack.flush(netPack)
			Actor.deleteTimer(sysarg,ActorTimerIds.emolingUpdate)
            return
        end
		
        --波数已满，传送回去领取奖励
        if dVar.emolingIndex >= table.getn(fuben_emoling_cfg.ref_monster) then
            local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
	        DataPack.writeByte(netPack, 8) -- 下发第几波怪	
	        DataPack.flush(netPack)
			Actor.deleteTimer(sysarg,ActorTimerIds.emolingUpdate)
            return
        end
       
  
        local isRef = false
        if dVar.emolingIsRef == 1 then
            dVar.emolingRefMonster = dVar.emolingRefMonster - 1
            if dVar.emolingRefMonster == 0 then
                dVar.emolingIsRef = 0
                isRef = true
            elseif dVar.emolingRefMonster < 0 then
                dVar.emolingRefMonster = 0
            end
            
        else 
            dVar.emolingRefMonster = fuben_emoling_cfg.ref_monster_time
            dVar.emolingIsRef = 1
            --倒计时
--            local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
--	        DataPack.writeByte(netPack, 9) -- 下发恶魔岭副本
--	        DataPack.writeUInt(netPack,fuben_emoling_cfg.ref_monster_time)
--	        DataPack.flush(netPack)


            --------------
	        local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
	        DataPack.writeByte(netPack, 3) -- 下发第几波怪	
	        DataPack.writeByte(netPack, dVar.emolingIndex + 1)	
	        DataPack.flush(netPack)
            local msg = string.format("第<(c0xFF00FF00)%d>波怪<(c0xFF00FF00)%d>秒后将会刷出", dVar.emolingIndex + 1, dVar.emolingRefMonster)
            Actor.sendTipmsg(sysarg, msg, ttScreenCenter)
	        --------------
        end
        if isRef == true then
            dVar.emolingIndex = dVar.emolingIndex + 1
            --创建怪物
            local cfg = fuben_emoling_cfg.ref_monster[dVar.emolingIndex]
            local nCount = 0;
            for i = 1,table.getn(cfg) do
                for j = 1,cfg[i].count do
                    local nx = cfg[i].mapx + math.random(-cfg[i].range,cfg[i].range)
                    local ny = cfg[i].mapy + math.random(-cfg[i].range,cfg[i].range)
                    Actor.createMonster(sysarg,cfg[i].entityid,nx,ny,0,false)
                   
                    nCount = nCount + 1
                end
            end
        end
        
        
    end
end
-- 返回下次回调的间隔，返回 0 则删除定时器
function on_emoling_ready_timer_cb(sysarg)	
	if not is_in_emoling(sysarg) then return 0 end

	if Fuben.getFunBenStatus(sysarg) then return 0 end -- 已经开始了

	Fuben.setFunBenStatus(sysarg)
	emoling_send_left_time(sysarg)
	return 0
end

-- 购买令牌
function emoling_buy_guarder_token(sysarg, packet)
	if not is_in_emoling(sysarg) then return end
	
	local tokenIdx = DataPack.readByte(packet)
	local guarderTkCfg = fuben_emoling_cfg.guarder_tokens[tokenIdx]
	if guarderTkCfg == nil then return end
	
	local tokenCfg = guarderTkCfg.token
	
	if Actor.canAddItem(sysarg, tokenCfg.itemid, 1) == false then
	  	Actor.sendTipmsg( sysarg,Lang.ScriptTips.n00006,ttTipmsgWindow )
   		return
  	end
	
	--检查消耗	
	local consumeData = {}
	local isok = CheckOneConsume(sysarg, false, tokenCfg.consume, true, consumeData)				
	if not isok then return end	
	
	--扣除消耗
	isok = DeductOneConsume(sysarg, false, tokenCfg.consume, LogIds.emolingBuyToken, tostring(tokenCfg.itemid))		
	if not isok then return end

	local addCount = Actor.addItem(sysarg, tokenCfg.itemid,0,0,1,1,0,"在炼狱里面购买",1)
	if addCount <= 0 then
		print("error, emoling_buy_guarder_token, actorid=" .. Actor.getIntProperty(sysarg, PROP_ENTITY_ID) .. ",itemid="..tokenCfg.itemid)
		return
	end
	
	local itemName = Item.getItemName(tokenCfg.itemid)
	Actor.sendTipmsg(sysarg, "您成功购买了一个守卫令牌:<(c0xFF00FF00)" .. itemName .. ">", ttFlyTip)
end

-- 返回守卫的类型和等级
function emoling_get_guarder_type_level(monsterid)	
	for i, v in ipairs(fuben_emoling_cfg.guarder_tokens) do
		for j, v2 in ipairs(v.guarders) do
			if v2.monsterid == monsterid then
				return i, j
			end
		end
	end
	
	return 0, 0
end

-- 升级场景中的守卫
function emoling_upgrade_scene_guarders(sysarg, level)	
	
	local scene = Actor.getScenePtr(sysarg)	
	local monsterList = LuaHelp.getSceneMonsterListByType(scene, fuben_emoling_cfg.guarder_monster_type) -- 守卫(类型为 5)
	
	-- 获得位置
	local pos_list = {}
	for i, v in ipairs(monsterList or {}) do
		local monsterId = Actor.getIntProperty(v, PROP_ENTITY_ID)
		local x = Actor.getIntProperty(v, PROP_ENTITY_POSX)
  		local y = Actor.getIntProperty(v, PROP_ENTITY_POSY)
		table.insert(pos_list, {monsterId, x, y})
	end

	--如果这个删除的场景不是在炼狱中，就返回
	if Actor.getSceneId(sysarg)~=109 then 
		return 
	end

	-- 清除
	Fuben.clearSceneAllMonsters(scene, fuben_emoling_cfg.guarder_monster_type) -- 守卫(类型为 5)
	
	-- 重新生成
	local hScene = Actor.getSceneHandle(sysarg)
	for i, v in ipairs(pos_list) do
		local mtype, mlevel = emoling_get_guarder_type_level(v[1])
		if mtype > 0 then
			local nextcfg = fuben_emoling_cfg.guarder_tokens[mtype].guarders[level]
			
			if nextcfg ~= nil then
				local pMonster = Fuben.createMonster(hScene, nextcfg.monsterid, v[2], v[3], 0,true)
				Actor.setMonsterOwer(sysarg, pMonster)
			end
		end
	end
end

-- 升级守卫
function emoling_upgrade_guarder(sysarg, packet)
	if not is_in_emoling(sysarg) then return end	
		
	local dVar = Actor.getDyanmicVar(sysarg)
	local curLevel = dVar.emolingGuarderLevels
	if curLevel == nil or curLevel == 0 then curLevel = 1 end
	
	local consume = fuben_emoling_cfg.guarder_update_consume[curLevel]	
	if consume == nil then
		Actor.sendTipmsg(sysarg, "该守卫的等级已是最高级！", ttFlyTip)
		return
	end
	
	--检查消耗	
	local consumeData = {}
	local isok = CheckOneConsume(sysarg, false, consume, true, consumeData)				
	if not isok then return end	
	
	--扣除消耗
	local strLog = string.format("%d:%d", curLevel, curLevel + 1)
	isok = DeductOneConsume(sysarg, false, consume, LogIds.emolingUpGuarder, strLog)		
	if not isok then return end
	
	dVar.emolingGuarderLevels = curLevel + 1
	Actor.sendTipmsg(sysarg, "守卫升级成功，当前等级:<(c0xFF00FF00)" .. (curLevel + 1) .. ">", ttFlyTip)
	
	-- 升级副本中的所有守卫
	emoling_upgrade_scene_guarders(sysarg, curLevel + 1)
	
	--------------
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
	DataPack.writeByte(netPack, 6) -- 下发守卫等级
	DataPack.writeByte(netPack, curLevel + 1)	
	DataPack.flush(netPack)
	--------------	
end

-- 摆放守卫
function emoling_put_guarder(sysarg, guarderIdx)	  	
  	-- 从1开始
	if guarderIdx < 1 then return false end
	
	if not is_in_emoling(sysarg) then
		Actor.sendTipmsg(sysarg, "该物品只能在炎龙守卫副本中使用", ttFlyTip)
		return false
	end
	
	local dVar = Actor.getDyanmicVar(sysarg)
	local guarderCount = dVar.guarderCount
	if guarderCount == nil then guarderCount = 0 end
	if guarderCount >= fuben_emoling_cfg.max_guarder_count then
		Actor.sendTipmsg(sysarg, "您最多只能摆放"..fuben_emoling_cfg.max_guarder_count.."个守卫", ttFlyTip)
		return false
	end
	
	local guarderTkCfg = fuben_emoling_cfg.guarder_tokens[guarderIdx]
	if guarderTkCfg == nil then	return false end
	
	local curLevel = dVar.emolingGuarderLevels
	if curLevel == nil or curLevel == 0 then curLevel = 1 end	
	
	local guarderCfg = guarderTkCfg.guarders[curLevel]
	if guarderCfg == nil then return false end
	
	if Actor.removeItem(sysarg, guarderTkCfg.token.itemid, 1) < 1 then
		Actor.sendTipmsg(sysarg, "背包中没有守卫令牌", ttFlyTip)
		return false -- 没有该令牌
	end
	
	local hScene = Actor.getSceneHandle(sysarg)
	local x = Actor.getIntProperty(sysarg, PROP_ENTITY_POSX)
  	local y = Actor.getIntProperty(sysarg, PROP_ENTITY_POSY)

	local pMonster = Fuben.createMonster(hScene, guarderCfg.monsterid, x, y, 0,true)
	Actor.setMonsterOwer(sysarg, pMonster)
	
	guarderCount = guarderCount + 1
	dVar.guarderCount = guarderCount
	
	--------------
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
	DataPack.writeByte(netPack, 5) -- 下发守卫数
	DataPack.writeByte(netPack, guarderCount)	
	DataPack.flush(netPack)
	--------------	
	
	return true
end

-- 返回 0 则无效
function emoling_get_next_auto_put_idx(tokenCounts, lastIdx)
	local item = tokenCounts[lastIdx + 1]
	if item ~= nil and item[2] > 0 then
		return lastIdx + 1
	end
	
	local count = #tokenCounts
	for i = lastIdx + 2, count do
		if tokenCounts[i][2] > 0 then
			return i
		end
	end
	
	-- 要包括 lastIdx，所以不是 (lastIdx - 1)
	for i = 1, lastIdx do
		if tokenCounts[i][2] > 0 then
			return i
		end
	end
	
	return 0
end

-- 一键排位
function emoling_auto_put_guarder(sysarg, packet)
	if not is_in_emoling(sysarg) then return end
	
	local dVar = Actor.getDyanmicVar(sysarg)
	if dVar.emolingFlags ~= nil then
		Actor.sendTipmsg(sysarg, "您已经使用过<(c0xFF00FF00)一键排位>了", ttFlyTip)
		return
	end	
	
	local guarderCount = dVar.guarderCount
	if guarderCount == nil then guarderCount = 0 end
	if guarderCount >= fuben_emoling_cfg.max_guarder_count then
		Actor.sendTipmsg(sysarg, "您最多只能摆放"..fuben_emoling_cfg.max_guarder_count.."个守卫", ttFlyTip)
		return
	end
	
	--检查消耗	
	local consumeData = {}
	local isok = CheckOneConsume(sysarg, false, fuben_emoling_cfg.auto_put_consume, true, consumeData)				
	if not isok then return end	
		
	local hasToken = false
	local tokenCounts = {}
	for i, v in ipairs(fuben_emoling_cfg.guarder_tokens) do
		local itemCount = Actor.getItemCount(sysarg, v.token.itemid)
		table.insert(tokenCounts, {v.token.itemid, itemCount})
		if itemCount > 0 then
			hasToken = true
		end
	end
	
	if not hasToken then
		Actor.sendTipmsg(sysarg, "您的背包中没有守卫令牌", ttFlyTip)
		return
	end
	
	local hScene = Actor.getSceneHandle(sysarg)
	
	local curLevel = dVar.emolingGuarderLevels
	if curLevel == nil or curLevel == 0 then curLevel = 1 end	
	
	local count = 0
	local lastTokenIdx = 0
	for i, v in ipairs(fuben_emoling_cfg.fixed_pos_list) do
		local newIdx = emoling_get_next_auto_put_idx(tokenCounts, lastTokenIdx)
		if newIdx == 0 then break end -- 没有令牌了
		
		if Actor.removeItem(sysarg, tokenCounts[newIdx][1], 1) < 1 then
			break -- 没有该令牌
		end		
			
		local gcfg = fuben_emoling_cfg.guarder_tokens[newIdx].guarders[curLevel]
		if gcfg == nil then
			break
		end
			
		local pMonster = Fuben.createMonster(hScene, gcfg.monsterid, v[1], v[2], 0,true)
		Actor.setMonsterOwer(sysarg, pMonster)
		
		tokenCounts[newIdx][2] = tokenCounts[newIdx][2] - 1 -- 令牌数减 1
		lastTokenIdx = newIdx
		count = count + 1
		
		guarderCount = guarderCount + 1
		if guarderCount >= fuben_emoling_cfg.max_guarder_count then
			break -- 守卫摆满了
		end
	end
	
	if count == 0 then return end
	
	dVar.emolingFlags = 1
	dVar.guarderCount = guarderCount
	
	--扣除消耗
	isok = DeductOneConsume(sysarg, false, fuben_emoling_cfg.auto_put_consume, LogIds.emolingAutoPut, "")		
	if not isok then
		-- 不应该扣除失败的
		print("error, emoling_auto_put_guarder DeductOneConsume fail")
	end
		
	--------------
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
	DataPack.writeByte(netPack, 5) -- 下发守卫数
	DataPack.writeByte(netPack, guarderCount)	
	DataPack.flush(netPack)
	--------------
end

-- 开始恶魔岭副本
function emoling_start(sysarg, packet)
	if not is_in_emoling(sysarg) then return end

	if Fuben.getFunBenStatus(sysarg) then return end -- 已经开始了

	Actor.deleteTimer(sysarg, ActorTimerIds.emolingReady)
    
    Actor.addTimer(sysarg,ActorTimerIds.emolingUpdate,1000)
	Fuben.setFunBenStatus(sysarg)
	
	emoling_send_left_time(sysarg)
end

-- 一键秒杀
function emoling_second_kill(sysarg, packet)
	if not is_in_emoling(sysarg) then return end
	
	local secKillCfg = fuben_emoling_cfg.second_kill
	local dVar = Actor.getDyanmicVar(sysarg)
	local emolingSecKill = dVar.emolingSecKill
	if emolingSecKill ~= nil then
		local diff = System.getCurrMiniTime() - emolingSecKill
		if diff >= 0 and diff < secKillCfg.cd then
			Actor.sendTipmsg(sysarg, "您还有" .. (secKillCfg.cd - diff) .. "秒才能再次使用 一键秒杀", ttFlyTip)
			return
		end
	end
	
	--检查消耗	
	local consumeData = {}
	local isok = CheckOneConsume(sysarg, false, secKillCfg.consume, true, consumeData)				
	if not isok then return end	
	
	--扣除消耗
	isok = DeductOneConsume(sysarg, false, secKillCfg.consume, LogIds.emolingSecKill, "")		
	if not isok then return end
	
	dVar.emolingSecKill = System.getCurrMiniTime()
	
	local hScene = Actor.getSceneHandle(sysarg)
	
	local excludeMonsterType = fuben_emoling_cfg.guarder_monster_type
	if excludeMonsterType == nil then
		excludeMonsterType = 5 -- 守卫类型为 5
	end
	
	Fuben.killAllMonsters(sysarg, hScene, true, fuben_emoling_cfg.guarder_monster_type) -- 排除守卫(类型为 5)
	
	Actor.sendTipmsg(sysarg, "您一键秒杀了所有怪物，获得了大量经验！", ttFlyTip)
end

-- 绝地反击
function emoling_call_boss(sysarg, packet)
	if not is_in_emoling(sysarg) then return end
	
	local callBossCfg = fuben_emoling_cfg.call_boss
	local dVar = Actor.getDyanmicVar(sysarg)
	local callBoss = dVar.emolingCallBoss
	if callBoss ~= nil then
		local diff = System.getCurrMiniTime() - callBoss
		if diff >= 0 and diff < callBossCfg.cd then
			Actor.sendTipmsg(sysarg, "您还有" .. (callBossCfg.cd - diff) .. "秒才能再次使用 绝地反击", ttFlyTip)
			return
		end
	end
	
	--检查消耗	
	local consumeData = {}
	local isok = CheckOneConsume(sysarg, false, callBossCfg.consume, true, consumeData)				
	if not isok then return end	
	
	--扣除消耗
	isok = DeductOneConsume(sysarg, false, callBossCfg.consume, LogIds.emolingCallBoss, "")		
	if not isok then return end
	
	dVar.emolingCallBoss = System.getCurrMiniTime()
	
	local hScene = Actor.getSceneHandle(sysarg)
	local pMonster = Fuben.createMonster(hScene, callBossCfg.bossid, callBossCfg.pos[1], callBossCfg.pos[2], callBossCfg.live_time,true)
	Actor.setMonsterOwer(sysarg, pMonster)

end

-- 退出恶魔岭副本
function exit_emoling(sysarg)
	if not is_in_emoling(sysarg) then return end
    --把守卫杀死，以免离开了副本还得经验
    local hScene = Actor.getSceneHandle(sysarg)
    Fuben.killAllMonsters(sysarg, hScene, true, fuben_emoling_cfg.guarder_monster_type)
	-- 传送到 炎龙城(sceneId=9) 的 炎龙守卫战 NPC(147, 127) 附近并打开NPC界面(传送位置:x不变，y+1才会自动打开NPC界面)
	--Actor.exitFuben(sysarg)
	System.telportScene(sysarg, 9, 147, 128, true)
	
	--任务
	if get_taskflags_val(sysarg) == 71 then 
		Actor.addTimer(sysarg,14,1000)
	else
		local dvar = Actor.getDyanmicVar(sysarg)
		dvar.HelpToStrongIndex = 2
		Actor.addTimer(sysarg,26,1000)
	end
end

-- 当 refreshXX.lua脚本的刷怪配置项中的 entityid == 0 时不刷怪, 只是用于通知下脚本, 比如要广播一下第几波怪正在到来等, curCount 从 1 开始
-- progress 表示第几波怪, mapx 表示几秒后开始刷怪, mapy 表示怪是否是BOSS, 用于提示: 第几波怪几秒后将会刷出
function emoling_OnRefreshMonsterProgressEvent(scenePtr, sceneId, fubenPtr, fubenId, curCount, progress, mapx, mapy, range)
	if fubenId ~= fuben_emoling_cfg.fubenid then
		return
	end

	local hfuben = Fuben.getFubenHandle(fubenPtr)
	-- 获得副本的第1个玩家(该副本只有一个玩家)
	local player = Fuben.getFbActorPtr(hfuben)
	if player == nil then return end
	
	-- 所有怪刷完则传送到 炎龙城(sceneId=9) 的 炎龙守卫战NPC(147, 127) 附近并打开NPC界面(传送位置:x不变，y+1才会自动打开NPC界面)
	if progress >= 100 then -- 刷完了
		exit_emoling(player)
		return
	end

	--------------
	local netPack = DataPack.allocPacket(player, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
	DataPack.writeByte(netPack, 3) -- 下发第几波怪	
	DataPack.writeByte(netPack, progress)	
	DataPack.flush(netPack)

	--------------
	
	-- 给副本内所有玩家发信息
	local msg
	if progress == 1 then -- 第 1 波(前端已经提示了)
		--msg = "第<(c0xFF00FF00)1>波入侵怪物即将来临，请勇士做好准备！"
	else
		if mapy == 1 then -- BOSS
			msg = "凶猛的异族BOSS缓缓走来，让我们拿下它！"
		else
			msg = string.format("第<(c0xFF00FF00)%d>波怪<(c0xFF00FF00)%d>秒后将会刷出", progress, mapx)
		end
	end
	
	if msg ~= nil then
		Actor.sendTipmsg(player, msg, ttScreenCenter)
	end
end

-- 怪物被杀死回调
function emoling_OnMonsterByKilledAddUpExp(sysarg, fubenid, addUpExp)

	if fubenid ~= fuben_emoling_cfg.fubenid then
		return
	end

	local var = Actor.getStaticVar(sysarg)
	var.EMoLingAddUpExp = addUpExp -- var.AddUpExp 是共用的, 转移到 var.EMoLingAddUpExp
	--print("addUpExp="..addUpExp)	
	--print("var.EMoLingAddUpExp="..var.EMoLingAddUpExp)	
	--------------
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sEMoLingFuben)
	DataPack.writeByte(netPack, 4) -- 下发累积经验
	DataPack.writeUInt(netPack, addUpExp)
	DataPack.flush(netPack)
	--------------
end

-- 退出恶魔岭副本回调
function exit_emoling_cb(sysarg, fubenptr, fubenid)
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.guarderCount = nil
	dVar.emolingGuarderLevels = nil -- 清0
	dVar.emolingFlags = nil
	dVar.emolingSecKill = nil
	dVar.emolingCallBoss = nil
	
	local var = Actor.getStaticVar(sysarg)
	-- var.AddUpExp 是共用的, 转移到 var.EMoLingAddUpExp
	--if var.AddUpExp ~= nil then
	--	var.EMoLingAddUpExp = var.AddUpExp
	--	var.AddUpExp = nil
	--end
end

-- 领取恶魔岭副本奖励
function get_emoling_reward(sysarg, rate)
	if rate > 6 then rate = 6 end

	local var = Actor.getStaticVar(sysarg)
	local addUpExp = var.EMoLingAddUpExp
	if addUpExp == nil then
		return
	elseif addUpExp <= 0 then
		var.EMoLingAddUpExp = nil
		return
	end
	local vipLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)

	--local consume = nil
	--if rate == 1 then
	--	consume = nil
	--elseif rate == 3 then
	--	-- 去掉VIP限制
	--	--if vipLevel <= 0 then
	--	--	Actor.sendTipmsg(sysarg, "您需要成为 VIP 才能领取 3 倍奖励", ttFlyTip)
	--	--	return -- 不是VIP
	--	--end
	--	consume = fuben_emoling_cfg.reward_3_consume
	--	--if get_taskflags_val(sysarg) == 71 then consume = nil end 
	--elseif rate == 5 then
	--	-- 去掉VIP限制
	--	--if vipLevel < 3 then
	--	--	Actor.sendTipmsg(sysarg, "您需要成为 VIP3 才能领取 5 倍奖励", ttFlyTip)
	--	--	return -- 需要VIP3
	--	--end
	--	consume = fuben_emoling_cfg.reward_5_consume
	--	--if get_taskflags_val(sysarg) == 71 then consume = nil end 
	--else
	--	return
	--end
	--
	--if consume ~= nil then
	--	--检查消耗	
	--	local consumeData = {}
	--	local isok = CheckOneConsume(sysarg, false, consume, true, consumeData)				
	--	if not isok then return end	
	--	
	--	--扣除消耗
	--	isok = DeductOneConsume(sysarg, false, consume, LogIds.emolingGetReward, "")		
	--	if not isok then return end
	--end
	local nowVar =get_taskflags_val(sysarg)






	if rate ~= 1 then
		addUpExp = addUpExp * rate
	end
	
	local needMoney = 600 



	if rate == 1 then
		needMoney = 0 
	elseif rate == 2 then 
		if vipLevel < 1 then
			Actor.sendTipmsg(sysarg, "您的VIP等级不够1，无法领取", ttFlyTip)
			return 
		end
		needMoney = 150;
	elseif rate == 3 and nowVar~= 71 then 
		if vipLevel < 3 then
			Actor.sendTipmsg(sysarg, "您的VIP等级不够3，无法领取", ttFlyTip)
			return 
		end
		needMoney = 300;
	elseif rate == 4 then 
		if vipLevel < 5 then
			Actor.sendTipmsg(sysarg, "您的VIP等级不够5，无法领取", ttFlyTip)
			return 
		end
		needMoney = 400;
	elseif rate == 5 then 
		if vipLevel < 7 then
			Actor.sendTipmsg(sysarg, "您的VIP等级不够7，无法领取", ttFlyTip)
			return 
		end
		needMoney = 500;
	elseif rate == 6 then 
		if vipLevel < 9 then
			Actor.sendTipmsg(sysarg, "您的VIP等级不够9，无法领取", ttFlyTip)
			return 
		end
		needMoney = 600;
	end

	
	--主线任务
	if nowVar == 71 and rate == 3 then
		needMoney = 0
	else
		addUpExp = addUpExp * 3;
	end

	
	if (needMoney~=0) then 
		if Actor.changeMoney(sysarg,3,-needMoney,LogIds.emolingGetReward, "炼狱"..(rate*3).."倍奖励")==false then 
			Actor.sendTipmsg(sysarg, "元宝不足，无法领取", ttFlyTip)
			return 
		end
	end

	
	--个人副本，经验直接加到玩家上，就不考虑组队这种情况了
	--clKillMonsterExp=202 杀死怪物获得经验（不能用202，可能会有双倍经验）
	
	--双倍炼狱奖励
	local cfg = StdActivityCfg.ShuangBeiLianYu
	--local times = cfg.tOpenTime.times
	--local timeIdx = checkActivityTime(times)
	local RwData = cfg.RwData
	--if timeIdx ~= 0 then	
	local dVar = System.getDyanmicVar()
	if dVar.shuangbeilianyuTime ~= nil then
		Actor.sendTipmsg(sysarg, string.format("恭喜您在 %s 活动时间内，奖励翻了一倍",RwData[1]), ttFlyTip)
		addUpExp=addUpExp*2
	end
	--黄金特权
	if IsSpeciaTitleVip(sysarg,3)==true then 
		addUpExp = math.floor(addUpExp *1.1)
		Actor.sendTipmsg(sysarg,string.format("黄金特权加成百分之10经验获得%s",addUpExp),ttFlyTip)
	end
	--老兵回归 双倍
    local sys = System.getStaticVar()
    if sys.oldplayer ~= nil then
        local aVar = InitOldPlayerReturnInfo(sysarg)
        if aVar.oldplayret.isold == 1 then
           addUpExp = addUpExp * OldPlayerReturnCfg[1].Daily.rate
        end
    end
	Actor.addExp(sysarg, addUpExp, GameLog.clCumulativeExp, 0,0,true)
	OnFinish_Liveness(sysarg,6)--活跃度增加
	var.EMoLingAddUpExp = nil -- 清0
	
	local name = Actor.getName(sysarg)
	local msg = string.format(Lang.ScriptTips.f00061, name, addUpExp)
	System.broadcastTipmsg(msg, ttChatWindow);

	--弹窗提示
	--local msg = string.format(Lang.ScriptTips.f00072, addUpExp)
	--Actor.sendTipmsg(sysarg, msg, ttDialog)
	
	--主线获取奖励后进行下一个任务

	local ta = task_all[nowVar]
	if ta == nil then return end
	if nowVar == 71 then 
		MasterStokeAcceptTask(sysarg,ta.npcid)	
	end
	
end

-- 客户端消息
function on_msg_emoling(sysarg, sysid, packet)
	if sysid ~= LogicCmd.miscSys.sub.cEMoLingFuben then
		print("error on_msg_emoling, sysid="..sysid)
		return
	end

	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if actorLevel < fuben_emoling_cfg.need_level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, fuben_emoling_cfg.need_level), ttFlyTip)
		return
	end

	local msgid = DataPack.readByte(packet)

	if msgid == 1 then -- 购买令牌
		emoling_buy_guarder_token(sysarg, packet)
	elseif msgid == 2 then -- 升级守卫
		emoling_upgrade_guarder(sysarg, packet)
	elseif msgid == 3 then -- 摆放守卫
		local guarderIdx = DataPack.readByte(packet) -- 从1开始
		emoling_put_guarder(sysarg, guarderIdx)
	elseif msgid == 4 then -- 一键排位
		emoling_auto_put_guarder(sysarg, packet)
	elseif msgid == 5 then -- 开始恶魔岭副本
		emoling_start(sysarg, packet)
	elseif msgid == 6 then -- 一键秒杀
		emoling_second_kill(sysarg, packet)
	elseif msgid == 7 then -- 绝地反击
		--emoling_call_boss(sysarg, packet) -- 暂时屏蔽
	elseif msgid == 8 then -- 退出恶魔岭副本
		exit_emoling(sysarg)
	else
		print("error on_msg_emoling, unknown msgid="..msgid)
		return
	end
end
function onBroadcast_ShuangBeiLianYu_StartBefore5(sysarg)
	local cfg = StdActivityCfg.ShuangBeiLianYu	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动5分钟后即将开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)	
end

function onBroadcast_ShuangBeiLianYu_Start(sysarg)
	local cfg = StdActivityCfg.ShuangBeiLianYu	
	local RwData = cfg.RwData
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])
	
	System.broadcastTipmsg(string.format("%s活动已经开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动已经开启，请大家踊跃参加。%s %s", RwData[1], NpcName, NpctFly), ttChatWindow)
	
	local dVar = System.getDyanmicVar()
	dVar.shuangbeilianyuTime=System.getCurrMiniTime()
	
end
function OnBroadcast_ShuangBeiLianYu_End(sysarg)

	local cfg = StdActivityCfg.ShuangBeiLianYu	
	local RwData = cfg.RwData
	System.broadcastTipmsg(string.format("%s活动已经结束",RwData[1]), ttScreenCenter)
	System.broadcastTipmsg(string.format("%s活动已经结束",RwData[1]), ttChatWindow)
	
	local dVar = System.getDyanmicVar()
	dVar.shuangbeilianyuTime=nil
end
