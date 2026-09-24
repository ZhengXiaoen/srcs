--#include "data\config\activity\AddPayMoneyAwardCfg.lua" once

MiscsImplement.GetAddPayMoneyAward = function( sysarg, msgid, packet )
	
	local giveIndex = DataPack.readByte(packet)
	local var = Actor.getStaticVar(sysarg)
	if not var.AddPayAwardFlag then var.AddPayAwardFlag = {} end
	if var.AddPayAwardFlag[giveIndex] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf193,ttFlyTip)
		return
	end

	local grants = var.addPayAwardGrants
	local progress = grants and grants[giveIndex]
	local awards = type(progress) == "table" and progress.items or nil
	if awards == nil then
		local config
		if not PayMoneyAwardCfg then return end
		for _, value in ipairs(PayMoneyAwardCfg) do
			if value.id == giveIndex then config = value; break end
		end
		if not config then return end
		local nAllPayYb = Actor.getIntProperty(sysarg,PROP_ACTOR_DRAW_YB_COUNT)
		if nAllPayYb < config.needPayCount then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf192,config.needPayCount),ttFlyTip)
			return
		end
		awards = config.award
		if progress == nil then
			local prepared = {}
			if Awards.PrepareTracked(awards, prepared) ~= true then return end
			progress = prepared
		elseif Awards.PrepareTracked(awards, progress) ~= true then
			return
		end
		if grants == nil then
			grants = {}
			var.addPayAwardGrants = grants
		end
		grants[giveIndex] = progress
	end

	-- 旧领取凭据按冻结清单完成，不受新配置或新门槛影响。
	if Awards.GiveTracked(sysarg, awards, progress, 994, "give Accumulated top-up award") then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf194,ttFlyTip)
		var.AddPayAwardFlag[giveIndex] = 1
	end
	
	SendUpdatePacksInfo(sysarg)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetAddPayMoneyAward, MiscsImplement.GetAddPayMoneyAward)