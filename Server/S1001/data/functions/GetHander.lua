--#include "data\functions\ActorFlags.lua" once


-- 领取经验灵珠
function OnGetExpBead(sysarg, packet)
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if actorLevel < 68 then
		-- 等级不足
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198,68), ttFlyTip)
		return
	end
	
	if get_extflags(sysarg, actor_extflags.gave_exp_bead) then
		-- 已经领过了
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf620, ttFlyTip)
		return
	end
	
	-- 68级送5颗经验灵珠
	local award = {{type=0, id=479, count=5, bind=1}}
	if Awards.Give(sysarg,award,GameLog.cGiveExpBead,"ExpBead") == false then
		return
	end
	
	set_extflags(sysarg, actor_extflags.gave_exp_bead, true)
	SendActorExtflags(sysarg)
end

-- 领取每日充值大礼包
function OnGetDayPayGift(sysarg, packet)
--屏蔽
--[[
	local idx = #EveryDayPayGiftCfg -- 最后一个为特别的礼包
	local cfg = EveryDayPayGiftCfg[idx][1]
	
	local var = Actor.getStaticVar(sysarg)
	if var.days.PeyNum == nil or var.days.PeyNum < cfg.needPayMoney then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf549, ttFlyTip)
		return
	end
	
	local openServerDay = System.getDaysSinceOpenServer()
	if openServerDay < cfg.openSeverDay then
		return
	end
	
	if get_dayflags(sysarg, actor_dayflags.gave_pay_gift) then
		-- 已经领过了
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf620, ttFlyTip)
		return
	end
	
	if Awards.Give(sysarg,cfg.award,GameLog.cGiveNewEverydayAward,cfg.name) == false then
		return
	end
	
	set_dayflags(sysarg, actor_dayflags.gave_pay_gift, true)
	SendActorExtflags(sysarg)
	
	local msg = string.format(Lang.ScriptTips.b001, Actor.getName(sysarg), cfg.worth)
	System.broadcastTipmsg(msg,2048)
--]]
end

--[[
function _GetOneLevelGift(sysarg, index)
	local bit = 0
	
	if index == 1 then
		bit = actor_extflags.gave_wing_gift
	elseif index == 2 then
		bit = actor_extflags.gave_stone_gift
	elseif index == 3 then
		bit = actor_extflags.gave_bead_gift
	else		
		return false
	end	
	
	-- 从1开始
	local cfg = YuanbaoGiftUseTable.giveItem[index]
	if cfg == nil then return false end
	
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if actorLevel < cfg[1] then
		-- 等级不足
		--Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198,cfg[1]), ttFlyTip)
		return false
	end
		
	-- 送物品
	local award = {{type=0, id=cfg[2], count=1, bind=1}}
	if Awards.Give(sysarg,award,GameLog.cGetLevelGift,tostring(cfg[2])) == false then
		return false
	end
	
	set_extflags(sysarg, bit, true)
	return true
end

-- 领取等级礼包
function OnGetLevelGift(sysarg, packet)
	
	local canUse, canDelete = useYuanbaoGiftTimeCheck(sysarg)
	if not canUse then return end	
		
	local isSend = false
	if get_extflags(sysarg, actor_extflags.gave_wing_gift) == false then
		if _GetOneLevelGift(sysarg, 1) == false then
			return
		else
			isSend = true
		end
	end
	
	if get_extflags(sysarg, actor_extflags.gave_stone_gift) == false then
		if _GetOneLevelGift(sysarg, 2) == false then
			if isSend then
				SendActorExtflags(sysarg)
			end
			return
		else
			isSend = true
		end
	end
	
	if get_extflags(sysarg, actor_extflags.gave_bead_gift) == false then
		if _GetOneLevelGift(sysarg, 3) == false then
			if isSend then
				SendActorExtflags(sysarg)
			end
			return
		else
			isSend = true
		end
	end
	
	if isSend then
		SendActorExtflags(sysarg)
	--else
		-- 已经都领过了
		--Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf620, ttFlyTip)
	end

end
--]]

--玩家请求获取操作
function HandleGetOperation(sysarg, msgid, packet)
	if msgid ~= LogicCmd.miscSys.sub.cGetOperation then
		print("error HandleGetOperation, msgid="..msgid)
		return
	end
	
	local _type = DataPack.readByte(packet)
	if _type == 1 then -- 领取经验灵珠
		OnGetExpBead(sysarg, packet)
	elseif _type == 2 then -- 领取每日充值大礼包
		OnGetDayPayGift(sysarg, packet)
	elseif _type == 3 then -- 领取每日充值大礼包
		--OnGetLevelGift(sysarg, packet) -- 领取等级礼包
	else
		print("error HandleGetOperation, unknown type=".._type)
		return
	end
	
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetOperation, HandleGetOperation)

