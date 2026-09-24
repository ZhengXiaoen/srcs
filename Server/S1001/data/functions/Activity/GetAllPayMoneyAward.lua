--#include "data\config\activity\AddPayMoneyAwardCfg.lua" once

MiscsImplement.GetAddPayMoneyAward = function( sysarg, msgid, packet )

	local giveIndex = DataPack.readByte(packet)
	
	local config
	if not PayMoneyAwardCfg then return end
	for _,value in ipairs(PayMoneyAwardCfg) do
		if value.id == giveIndex then
			config = value
		end
	end
	
	if not config then return end
	local nAllPayYb = Actor.getIntProperty(sysarg,PROP_ACTOR_DRAW_YB_COUNT)

	if nAllPayYb < config.needPayCount then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf192,config.needPayCount),ttFlyTip)
		return
	else
		local var = Actor.getStaticVar(sysarg)
		if not var.AddPayAwardFlag then
			var.AddPayAwardFlag = {}
		end
		
		if var.AddPayAwardFlag[config.id] then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf193,ttFlyTip)
			return
		end
		
		if Awards.CheckBagGridCount(sysarg,config.award) then
			Awards.Give(sysarg,config.award,994,"give Accumulated top-up award")
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf194,ttFlyTip)
			var.AddPayAwardFlag[config.id] = 1
		end
	end
	
	SendUpdatePacksInfo(sysarg)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetAddPayMoneyAward, MiscsImplement.GetAddPayMoneyAward)