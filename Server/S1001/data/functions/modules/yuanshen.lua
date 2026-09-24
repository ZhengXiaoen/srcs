-- 元神系统
--#include "data\config\modules\yuanshen_cfg.lua" once -- 元神系统配置

-- 元神属性计算
function ResetActorYuanshenPropertys(sysarg, calc)
	local yuanshenLevel = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARPATH_ID)
	yuanshenLevel = System.getIntByte(yuanshenLevel, 3)
	if yuanshenLevel <= 0 then return end
		
	local job = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	local levelAttrsList = yuanshen_cfg.levels[job]
	if levelAttrsList == nil then return end
	
	local levelAttrs = levelAttrsList[yuanshenLevel]
	if levelAttrs == nil then
		local listSize = #levelAttrsList
		if yuanshenLevel > listSize then
			levelAttrs = levelAttrsList[listSize]
		end
	end
	
	LuaHelp.calcActorAttrs(sysarg, calc, levelAttrs)
end

-- 发送元神数据
function send_yuanshen_data(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sYuanshen)
	DataPack.writeByte(netPack, 1) -- 元神数据
	
	local var = Actor.getStaticVar(sysarg)
	local exchangeCount = var.days.yuanshenExchangeCount
	if exchangeCount == nil then exchangeCount = 0 end
	
	local leftCount = 3 - exchangeCount
	if leftCount < 0 then leftCount = 0 end
	
	DataPack.writeByte(netPack, leftCount) -- 今天剩余的兑换次数
	
	DataPack.flush(netPack)
end

-- 元神升级
function yuanshen_upgrade(sysarg, packet)
	if System.getDaysSinceOpenServer() < 14 then
		Actor.sendTipmsg(sysarg, "元神开服第14天开启", ttFlyTip)
		return
	end
	
	if Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE) < 4 then
		Actor.sendTipmsg(sysarg, "不足4转，升级失败", ttFlyTip)
		return
	end
	
	local val = Actor.getUIntProperty(sysarg, PROP_ACTOR_WARPATH_ID)
	local curLevel = System.getIntByte(val, 3)
	
	local consumeExp = yuanshen_cfg.upgradeConsume[curLevel + 1]
	if consumeExp == nil then
		Actor.sendTipmsg(sysarg, "你的元神已经达到了最高境界", ttFlyTip)
		return
	end
	
	local yuanshenExp = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANSHEN_EXP)
	if yuanshenExp < consumeExp then
		Actor.sendTipmsg(sysarg, "元神灵力值不足，升级失败！", ttFlyTip)
		return
	end
	
	yuanshenExp = yuanshenExp - consumeExp
	Actor.setUIntProperty(sysarg, PROP_ACTOR_YUANSHEN_EXP, yuanshenExp)
	
	local newLevel = curLevel + 1
	val = System.setIntByte(val, 3, newLevel)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_WARPATH_ID, val)
	Actor.collectOperate(sysarg, 0) -- 0:重新计算属性
	
	System.sendCommonLog(LogIds.yuanshenUpgrade,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),newLevel,0,0,"")
	
	if newLevel >= 20 then
		local jingjieNames = {"出世", "练气", "固本", "培元", "红尘", "明心", "小悟", "大悟", "飞升", "飞仙"}
		local chong = math.mod(newLevel, 6)		
		
		local jingjie = math.floor(newLevel / 6)
		if chong > 0 then
			jingjie = jingjie + 1
		end
		
		if chong == 0 then chong = 6 end
		
		local msg = string.format("玩家<(c0xFF00FF00)%s>升至%s%d重 <我也要去/@@showWin,1>", Actor.getName(sysarg), jingjieNames[jingjie], chong)
		System.broadcastTipmsg(msg, ttScreenCenter+ttChatWindow)
	end
	
end

-- 元神兑换
function yuanshen_exchange(sysarg, packet)
	if System.getDaysSinceOpenServer() < 14 then
		Actor.sendTipmsg(sysarg, "元神系统开服第14天开启", ttFlyTip)
		return
	end
	
	if Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE) < 4 then
		Actor.sendTipmsg(sysarg, "不足4转，兑换失败", ttFlyTip)
		return
	end
	
	local actorLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if actorLevel < 120 then
		Actor.sendTipmsg(sysarg, "等级不足120级，兑换失败", ttFlyTip)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local exchangeCount = var.days.yuanshenExchangeCount
	if exchangeCount == nil then exchangeCount = 0 end
	
	if exchangeCount >= 3 then
		Actor.sendTipmsg(sysarg, "每天只能兑换3次", ttFlyTip)
		return
	end
	
	local index = actorLevel - 120 + 1
	local addExp = yuanshen_cfg.exchangeYuanshenExp[index]
	if addExp == nil then
		print("config error. yuanshen_exchange yuanshen_cfg.exchangeYuanshenExp["..index.."]==nil")
		return
	end
	
	var.days.yuanshenExchangeCount = exchangeCount + 1
	
	Actor.setIntProperty(sysarg, PROP_CREATURE_LEVEL, actorLevel-1)
	
	local yuanshenExp = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANSHEN_EXP)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_YUANSHEN_EXP, yuanshenExp + addExp)
	
	Actor.collectOperate(sysarg, 0) -- 0:重新计算属性
	
	local newpos, oldpos = System.rankingUpdateValue(0, sysarg, actorLevel-1, actorLevel)
	
	System.sendCommonLog(LogIds.yuanshenExchange,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),actorLevel-1,yuanshenExp,yuanshenExp + addExp,"")
	
	Actor.sendTipmsg(sysarg, "兑换获得元神灵力"..addExp, ttFlyTip)
	
	send_yuanshen_data(sysarg)
end

function yuanshen_main(sysarg, sysid, packet)
	local msgid = DataPack.readByte(packet)
		
	if msgid == 1 then -- 获得元神数据
		send_yuanshen_data(sysarg)
	elseif msgid == 2 then -- 元神升级
		yuanshen_upgrade(sysarg, packet)
	elseif msgid == 3 then -- 元神兑换
		yuanshen_exchange(sysarg, packet)
	else
		print("error yuanshen_main, unknown msgid="..msgid)
		return
	end
end
