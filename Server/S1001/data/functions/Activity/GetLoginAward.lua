--#include "data\config\activity\SevenDayLoginAwardCfg.lua" once

MiscsImplement.GetSevenDayLoginAward = function( sysarg, msgid, packet )
	Actor.sendTipmsg(sysarg, "7天登陆奖励暂时未开放", ttFlyTip)
	
	--[[
	local giveIndex = DataPack.readByte(packet)
	local config
	if not SevenDayAwardCfg then return end
	for _,value in ipairs(SevenDayAwardCfg) do
		if value.id == giveIndex then
			config = value
			break
		end
	end

	if not config then return end
		--当前等级不满足领取条件
	if Actor.checkActorLevel(sysarg,SevenDayAwardCfg.level) == false then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf198,SevenDayAwardCfg.level),ttFlyTip)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	if not var.SevenDayFlag then
		return
	elseif giveIndex > var.SevenDayFlag then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf195,config.id),ttFlyTip) 	--需要累积多少天才可领取
		return
	else
		if not var.SevenDayAwardFlag then
			var.SevenDayAwardFlag = {}
		elseif var.SevenDayAwardFlag[giveIndex] then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf193,ttFlyTip)		--已经领取过该奖励了，不能再重复领取
			return
		end
		
		if Awards.CheckBagGridCount(sysarg,config.award) then
			Awards.Give(sysarg,config.award,998,"领取登录7天奖励")
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf194,ttFlyTip)
			var.SevenDayAwardFlag[giveIndex] = 1
			System.broadcastTipmsg(string.format(Lang.ScriptTips.zf219,Actor.getName(sysarg),giveIndex),128+2)

			-- 记录日志
			local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
			System.sendCommonLog(GameLog.cGetSevenDayLogin,nActorId,'',config.id,0,0,'','','','','','','',"Get Seven Day LoginAward")
		end
		
		AllLoginAwardInfo(sysarg)
	end
	--]]
end

MiscsImplement.GetSevenDayLoginAwardInfo = function( sysarg, msgid, packet )
	AllLoginAwardInfo(sysarg)
end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetSevenDayLoginAward, MiscsImplement.GetSevenDayLoginAward)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetSevenDayLoginAwardInfo, MiscsImplement.GetSevenDayLoginAwardInfo)