-- 勇者闯关
--#include "data\config\modules\challenge_fuben_cfg.lua" once

-- 下发到前端协议
-- 1 下发闯关数据
-- 2 当前关结束
-- 3 退出天关, 关闭界面

-- 下发闯关数据
function send_challenge_fuben_data(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local chllfbFlags = var.chllfbFlags
	if chllfbFlags == nil then chllfbFlags = 0 end
	
	local chllfbCount = var.chllfbCount -- 第几关
	if chllfbCount == nil then chllfbCount = 0 end
	
	local chllfbAwardCount = System.getIntByte(chllfbCount, 1) -- 奖励已经领到第几关	
	chllfbCount = System.getIntByte(chllfbCount, 0)

	local saodang = var.days.saodang -- 扫荡次数
	if saodang == nil then saodang = 0 end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sChallengeFubenModule)
	DataPack.writeByte(netPack, 1) -- 下发闯关数据
	DataPack.writeByte(netPack, chllfbCount) -- 完成的关卡数
	DataPack.writeUint64(netPack, chllfbFlags) -- 主关奖励领取标志(0 到 39 位)
	DataPack.writeByte(netPack, saodang) -- 当天扫荡次数

	DataPack.flush(netPack)
end

-- 下发当前关结束
function send_challenge_fuben_round_end(sysarg, challenge_state)		
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sChallengeFubenModule)
	DataPack.writeByte(netPack, 2) -- 下发当前关结束
	DataPack.writeByte(netPack, challenge_state) -- 状态:0闯关失败(玩家死亡); 1:闯关失败(超时); 2:闯关成功; 3:闯关成功(完成了所以关)
	
	DataPack.flush(netPack)
end

-- 下发退出闯关副本
function send_exit_challenge_fuben(sysarg)		
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sChallengeFubenModule)
	DataPack.writeByte(netPack, 3) -- 下发给前端关闭界面
	
	DataPack.flush(netPack)
end

function show_challenge_fuben_wnd(sysarg)
	local var = Actor.getStaticVar(sysarg)	
	
	local chllfbCount = var.chllfbCount -- 第几关
	if chllfbCount == nil then chllfbCount = 0 end
	
	local chllfbAwardCount = System.getIntByte(chllfbCount, 1) -- 奖励已经领到第几关	
	local passCount = System.getIntByte(chllfbCount, 0) -- 通关数	
	
	local totalItemCount = 0
	for i = chllfbAwardCount+1, passCount do
		local roundCfg = challenge_fuben_cfg.RoundList[i]
		if roundCfg == nil then break end
		
		totalItemCount = totalItemCount + roundCfg.awardItemCount
	end
		
	local title1 = "<(c0xFFCBBC97)闯关数>"
	
	local roundCfg = challenge_fuben_cfg.RoundList[passCount + 1]
	if roundCfg == nil then return end
	
	local title2 = "<(c0xFF2B7FA1)完成条件:>击杀怪物"..roundCfg.monsterCount.."个"	
	local title3 = "<(c0xFF2B7FA1)本关奖励:><(iitem#"..challenge_fuben_cfg.awardItemId.."#0#)>"
	local title4 = "<(c0xFF2B7FA1)已累积奖励:><(iitem#"..challenge_fuben_cfg.awardItemId.."#0#)>"
	
	Actor.initActivityWind(sysarg, "勇者闯关", challenge_fuben_cfg.time, "", title1, passCount + 1, title2, 0, title3, roundCfg.awardItemCount, title4, totalItemCount)
end

-- 开始闯关
function start_challenge_fuben(sysarg, packet)
	if Actor.getFubenId(sysarg) > 0 then
		Actor.sendTipmsg(sysarg, "您已经在副本中了", ttFlyTip)
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
		
	local chllfbCount = var.chllfbCount -- 第几关
	if chllfbCount == nil then chllfbCount = 0 end
	chllfbCount = System.getIntByte(chllfbCount, 0)
	
	if chllfbCount >= challenge_fuben_cfg.totalRound then
		Actor.sendTipmsg(sysarg, "您已经闯完所有关卡了", ttFlyTip)
		return
	end	
	
	local hfb = Fuben.createFuBen(challenge_fuben_cfg.fubenId)
	if hfb <= 0 then
		Actor.sendTipmsg(sysarg,"创建天关副本失败",ttFlyTip)
		return
	end
	
	local ret = Actor.enterFuBen(sysarg,hfb,challenge_fuben_cfg.fubenSceneId,challenge_fuben_cfg.enterX,challenge_fuben_cfg.enterY)
	if ret == false then
		Actor.sendTipmsg(sysarg,"进入天关副本失败",ttFlyTip)
		return
	end

	Actor.addTimer(sysarg, ActorTimerIds.challenge_fuben, challenge_fuben_cfg.time*1000)
	Actor.addTimer(sysarg, ActorTimerIds.challenge_fuben_refresh, 5*1000)
	
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.chfbMonstCount = nil -- 清空天关杀怪数
	
	show_challenge_fuben_wnd(sysarg)
	--Actor.showExitActivityButton(sysarg, true)
end

-- 领取奖励
function get_challenge_fuben_award(sysarg)
	local var = Actor.getStaticVar(sysarg)
	--local chllfbFlags = var.chllfbFlags
	--if chllfbFlags == nil then chllfbFlags = 0 end
	
	local chllfbCount = var.chllfbCount -- 第几关
	if chllfbCount == nil then chllfbCount = 0 end
	
	local chllfbAwardCount = System.getIntByte(chllfbCount, 1) -- 奖励已经领到第几关	
	local passCount = System.getIntByte(chllfbCount, 0) -- 通关数
	
	if chllfbAwardCount >= passCount then
		return 0 -- 奖励已经领完了
	end
	
	local award = { {type=0, id=challenge_fuben_cfg.awardItemId, count=0, bind=1} }
	
	local has_fail = false
	for i = chllfbAwardCount+1, passCount do
		local roundCfg = challenge_fuben_cfg.RoundList[i]
		if roundCfg == nil then break end
		
		award[1].count = roundCfg.awardItemCount
		if not Awards.CheckBagGridCount(sysarg, award) then
			has_fail = true
			break
		end
	
		if Awards.GiveNoCheck(sysarg, award, LogIds.ChallengeFubenAward, tostring(i)) == false then
			has_fail = true
			break
		end
		
		chllfbAwardCount = chllfbAwardCount + 1
		
		chllfbCount = System.setIntByte(chllfbCount, 1, chllfbAwardCount)
		var.chllfbCount = chllfbCount
	end	
	
	if has_fail then return 1 end
	
	return 0
end

-- 退出副本
function exit_challenge_fuben(sysarg, packet)
	if Actor.getFubenId(sysarg) ~= challenge_fuben_cfg.fubenId then
		return -- 不在天关副本
	end
	
	Actor.deleteTimer(sysarg, ActorTimerIds.challenge_fuben)
	Actor.deleteTimer(sysarg, ActorTimerIds.challenge_fuben_refresh)
	
	-- 收走怪物
	local hfb = Actor.getFubenHandle(sysarg)
	Fuben.clearAllMonster(hfb)
		
	local ret = get_challenge_fuben_award(sysarg)
	if ret == 0 then -- 成功
		Actor.exitFuben(sysarg)
		--Actor.closeActivityWind(sysarg)
		send_exit_challenge_fuben(sysarg)
		
		local dVar = Actor.getDyanmicVar(sysarg)
		dVar.chfbMonstCount = nil -- 清空天关杀怪数
	
		return
	end
	
	-- 背包空间不够,奖励没有领完
	local str = "您的背包已经满，退出系统将回收奖励，是否要继续退出？"		
	local btn1 = "退出/exit_challenge_fuben_cb,1"	
	local btn2 = "返回/exit_challenge_fuben_cb,0"
	Actor.messageBox(sysarg,0,0,str, btn1, btn2, NULL, 0)
end

-- 0 : 返回；1：退出
function exit_challenge_fuben_cb(sysarg, btn)
	if btn == 0 then return end
	
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.chfbMonstCount = nil -- 清空天关杀怪数
	
	Actor.exitFuben(sysarg)	
	--Actor.closeActivityWind(sysarg)
	send_exit_challenge_fuben(sysarg)
end

-- 领取主要关卡奖励(每5关为主要关卡)
function get_challenge_fuben_main_round_award(sysarg, packet)
	-- 通关宝箱索引（从1开始）
	local boxidx = DataPack.readByte(packet)
	if boxidx < 1 or boxidx > math.floor(challenge_fuben_cfg.totalRound / 5) then
		return
	end

	local var = Actor.getStaticVar(sysarg)
	local chllfbFlags = var.chllfbFlags
	if chllfbFlags == nil then chllfbFlags = 0 end
	
	local chllfbCount = var.chllfbCount -- 第几关
	if chllfbCount == nil then chllfbCount = 0 end
	
	--local chllfbAwardCount = System.getIntByte(chllfbCount, 1) -- 奖励已经领到第几关	
	local passCount = System.getIntByte(chllfbCount, 0)

	if (boxidx * 5) > passCount then
		Actor.sendTipmsg(sysarg, "第"..(boxidx * 5).."关卡您还没有通过", ttFlyTip)
		return
	end

	if System.getInt64Bit(chllfbFlags, boxidx - 1) ~= 0 then
		Actor.sendTipmsg(sysarg, "您已领取第"..(boxidx * 5).."关卡的宝箱奖励", ttFlyTip)
		return
	end
	
	local boxCfg = challenge_fuben_cfg.BoxAwards[boxidx]
	if boxCfg == nil then
		print("config error, challenge_fuben_cfg.BoxAwards["..boxidx.."]==nil")
		return
	end

	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if actorLevel < boxCfg.needLevel then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, boxCfg.needLevel), ttFlyTip)
		return
	end
		
	if Awards.Give(sysarg, boxCfg.award, LogIds.ChallengeFubenBoxAward, tostring(boxidx)) == false then
		return
	end

	chllfbFlags = System.setInt64Bit(chllfbFlags, boxidx - 1, true)
	var.chllfbFlags = chllfbFlags
	
	Actor.sendTipmsg(sysarg, "成功领取第"..(boxidx * 5).."关卡的宝箱奖励", ttFlyTip)
	
	-- 下发闯关数据
	send_challenge_fuben_data(sysarg)
end

-- 一键扫荡
function saodang_challenge_fuben(sysarg, packet)
	local var = Actor.getStaticVar(sysarg)
	local saodang = var.days.saodang -- 当天扫荡次数
	if saodang == nil then saodang = 0 end

	if saodang >= 5 then
		Actor.sendTipmsg(sysarg, "今天的扫荡次数已用完,请你明天再来", ttFlyTip)
		return
	end
	
	if System.getDaysSinceOpenServer() <= 1 then
		Actor.sendTipmsg(sysarg, "开服第一天不可以扫荡", ttFlyTip)
		return
	end

	local chllfbCount = var.chllfbCount -- 第几关
	if chllfbCount == nil then chllfbCount = 0 end	
	local passCount = System.getIntByte(chllfbCount, 0)
	if passCount <= 0 then return end

	local roundCfg = challenge_fuben_cfg.RoundList[passCount]
	if roundCfg == nil then return end

	local saodangCount = saodang + 1
	if saodangCount < 1 then saodangCount = 1
	elseif saodangCount > 5 then return end

	local countRates = {1, 1.5, 2, 3, 4}
	local ybRates = {0, 0.8, 0.7, 0.6, 0.5}

	local awardCount = roundCfg.saodangItemCount * countRates[saodangCount]
	local needYb = 0
	if saodangCount ~= 1 then
		needYb = math.floor(awardCount * 10 * ybRates[saodangCount])
	end

	if needYb > 0 then
		local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
		if myYb < needYb then
			SendRecommendTips(sysarg,"1")
			return
		end		
	end

	local award = { {type=0, id=challenge_fuben_cfg.awardItemId, count=awardCount, bind=1} }
	if Awards.CheckBagGridCount(sysarg, award) == false then
		return
	end

	if needYb > 0 then
		if not Actor.changeMoney(sysarg, mtYuanbao, -needYb, LogIds.ChallengeFubenSaodang, tostring(saodangCount)) then
			return
		end
	end

	if Awards.GiveNoCheck(sysarg, award, LogIds.ChallengeFubenSaodang, tostring(saodangCount)) == false then
		print("error saodang_challenge_fuben actorid="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID)..",count="..saodangCount)
	end

	var.days.saodang = saodangCount
end

-- 刷怪
function challenge_fuben_refresh_monsters(sysarg)	
	if Actor.getFubenId(sysarg) ~= challenge_fuben_cfg.fubenId then
       return
  	end
  	
  	local hfb = Actor.getFubenHandle(sysarg)
  	if hfb == 0 then return end
  	
  	local var = Actor.getStaticVar(sysarg)		
	local chllfbCount = var.chllfbCount -- 第几关
	if chllfbCount == nil then chllfbCount = 0 end	
	local count = System.getIntByte(chllfbCount, 0)	+ 1 -- 刷第几关的怪
	
	local roundCfg = challenge_fuben_cfg.RoundList[count]
	if roundCfg == nil then
		print("config error, challenge_fuben_cfg.RoundList["..count.."]==nil")
		return
	end
  	
  	local hScene = Fuben.getSceneHandleById(challenge_fuben_cfg.fubenSceneId, hfb)
  	if hScene <= 0 then return end
  	
  	Fuben.createMonstersInRange(hScene, roundCfg.monsterId, challenge_fuben_cfg.monsterX1, challenge_fuben_cfg.monsterY1, challenge_fuben_cfg.monsterX1, challenge_fuben_cfg.monsterY2, roundCfg.monsterCount, challenge_fuben_cfg.time)
  
end

-- 副本通关回调
function on_challenge_fuben_pass(sysarg)
	local var = Actor.getStaticVar(sysarg)
		
	local chllfbCount = var.chllfbCount -- 第几关
	if chllfbCount == nil then chllfbCount = 0 end
	
	local passCount = System.getIntByte(chllfbCount, 0)	+ 1
	chllfbCount = System.setIntByte(chllfbCount, 0, passCount)
	var.chllfbCount = chllfbCount
		
	Actor.deleteTimer(sysarg, ActorTimerIds.challenge_fuben)
	Actor.deleteTimer(sysarg, ActorTimerIds.challenge_fuben_refresh)

	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.chfbMonstCount = nil -- 清空天关杀怪数
	
	show_challenge_fuben_wnd(sysarg)
	
	if passCount >= challenge_fuben_cfg.totalRound then
		-- 由前端提示
		--Actor.sendTipmsg(sysarg,"恭喜您闯完了所有关",ttScreenCenter)
		send_challenge_fuben_round_end(sysarg, 3)
		return
	end	
	
	Actor.addTimer(sysarg, ActorTimerIds.challenge_fuben, challenge_fuben_cfg.time*1000)
	Actor.addTimer(sysarg, ActorTimerIds.challenge_fuben_refresh, 5*1000)
	
	-- 由前端提示
	--Actor.sendTipmsg(sysarg,"恭喜成功闯关,5 秒后进入一下关",ttScreenCenter)	
	send_challenge_fuben_round_end(sysarg, 2)
end

-- 返回下次回调的间隔，返回 0 则删除定时器
function on_challenge_fuben_timer_cb(sysarg)	
	-- 时间到,挑战失败
	Actor.deleteTimer(sysarg, ActorTimerIds.challenge_fuben_refresh)
	
	-- 收走怪物
	if Actor.getFubenId(sysarg) == challenge_fuben_cfg.fubenId then
		local hfb = Actor.getFubenHandle(sysarg)
		Fuben.clearAllMonster(hfb)
	end
	
	-- 由前端提示
	--Actor.sendTipmsg(sysarg,"很遗憾,闯关失败",ttScreenCenter)
	send_challenge_fuben_round_end(sysarg, 1)
	
	return 0
end

-- 返回下次回调的间隔，返回 0 则删除定时器
function on_challenge_fuben_refresh_monsters_timer_cb(sysarg)	
	challenge_fuben_refresh_monsters(sysarg)
	return 0
end

-- 玩家死亡, 挑战失败
function on_challenge_fuben_player_die(sysarg, killer)
	-- 调用前已经检查了,这里就不检查了吧
	--if Actor.getFubenId(sysarg) ~= challenge_fuben_cfg.fubenId then
	--	return
	--end
	
	local hfb = Actor.getFubenHandle(sysarg)
	Fuben.clearAllMonster(hfb)
	
	Actor.deleteTimer(sysarg, ActorTimerIds.challenge_fuben)
	Actor.deleteTimer(sysarg, ActorTimerIds.challenge_fuben_refresh)

	-- 由前端提示
	--Actor.sendTipmsg(sysarg,"很遗憾,闯关失败",ttScreenCenter)
	send_challenge_fuben_round_end(sysarg, 0)
end

function challenge_fb_OnMonsterByKilled(monster, sysarg)
	local dVar = Actor.getDyanmicVar(sysarg)
	
	local chfbMonstCount = dVar.chfbMonstCount -- 天关杀怪数加 1
	if chfbMonstCount == nil then
		chfbMonstCount = 1
	else
		chfbMonstCount = chfbMonstCount + 1
	end
	
	dVar.chfbMonstCount = chfbMonstCount
	
	Actor.changeActivityProgress(sysarg,-1,chfbMonstCount)
end

-- 客户端消息
function on_msg_challenge_fuben(sysarg, sysid, packet)
	--if sysid ~= LogicCmd.miscSys.sub.cChallengeFubenModule then
	--	print("error on_msg_challenge_fuben, sysid="..sysid)
	--	return
	--end
	--
	--local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	--if actorLevel < challenge_fuben_cfg.needLevel then
	--	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, challenge_fuben_cfg.needLevel), ttFlyTip)
	--	return
	--end
	--
	--local msgid = DataPack.readByte(packet)
	--	
	--if msgid == 1 then -- 获得闯关数据
	--	send_challenge_fuben_data(sysarg)
	--elseif msgid == 2 then -- 开始闯关
	--	start_challenge_fuben(sysarg, packet)
	--elseif msgid == 3 then -- 退出副本
	--	exit_challenge_fuben(sysarg, packet)
	--elseif msgid == 4 then -- 领取主要关卡奖励(每5关为主要关卡)
	--	get_challenge_fuben_main_round_award(sysarg, packet)
	--elseif msgid == 5 then -- 一键扫荡
	--	saodang_challenge_fuben(sysarg, packet)	
	--else
	--	print("error on_msg_challenge_fuben, unknown msgid="..msgid)
	--	return
	--end
end