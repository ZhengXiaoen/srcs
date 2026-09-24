--封神操作
--#include "data\config\deify\DeifyConfig.lua" once	--封神配置
--#include "data\Config\property\LevelUpExp.lua" once --等级经验配置

--封神处理
MiscsImplement.DeifyHandle = function( sysarg, msgid, packet )
	local nType = DataPack.readByte(packet)	
	local nDeifyLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_APOTHEOSIZE_LEVEL)
	--Actor.setIntProperty(sysarg,PROP_ACTOR_APOTHEOSIZE_LEVEL,0)
	local nDeifyExp = Actor.getIntProperty(sysarg,PROP_ACTOR_APOTHEOSIZE_EXP)
	local nCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
	local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if nCircle < DeifyConfig.MinCircle then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.deify00009,DeifyConfig.MinCircle),ttFlyTip)
		return
	end 
	if nType == 1 then	--兑换封神经验
		if nLevel <= DeifyConfig.MinLevel then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.deify00006,DeifyConfig.MinLevel),ttFlyTip)
			return
		end	
		Actor.messageBox( sysarg, Actor.getTargetHandle(sysarg), 0, Lang.ScriptTips.deify00007, "确认/exChangeDeifyExp", "取消/Cancel", "" )
	elseif nType == 2 then--等级提升
		if nLevel < DeifyConfig.MinLevel then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.deify00008,DeifyConfig.MinLevel),ttFlyTip)
			return
		end	
		if nDeifyLevel >= #DeifyConfig.LevelConfig then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.deify00005,ttFlyTip)
			return
		end		
		local nConfig = DeifyConfig.LevelConfig[nDeifyLevel+1]
		if not nConfig then return end
		if nLevel < nConfig.reqLevel then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.deify00002,ttFlyTip)
			return
		end
		local nUpGreatCount = nConfig.expCount
		if nDeifyExp >= nUpGreatCount then
			local var = Actor.getStaticVar(sysarg)
			if not var.DeifyCount then
				var.DeifyCount = DeifyConfig.ChangeCount
			end
			nDeifyLevel = nDeifyLevel + 1
			Actor.SetDeifyLevel(sysarg,nDeifyLevel)
			Actor.SetDeifyExp(sysarg,nDeifyExp - nUpGreatCount)
			local nColor = getDeifyColor(nDeifyLevel)
			System.broadcastTipmsg(string.format(Lang.ScriptTips.c000193, Actor.getName(sysarg),nDeifyLevel,nColor, DeifyConfig.LevelConfig[nDeifyLevel].title), ttScreenCenter+ttChatWindow)
			local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sDeify)
			DataPack.writeShort(netPack, nDeifyCount)
			--nUpGreatCount = Actor.getActorLevelUpgradeExp(sysarg,nLevel)
			nUpGreatCount = LevelUpExp[nLevel]
			DataPack.writeUInt(netPack,math.floor(nUpGreatCount/DeifyConfig.Rate))
			DataPack.flush(netPack)

			System.sendCommonLog(979,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),nDeifyLevel-1,nDeifyLevel)
		else
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.deify00003,ttFlyTip)
			return
		end		
	end

end

function exChangeDeifyExp( sysarg )
	local nDeifyExp = Actor.getIntProperty(sysarg,PROP_ACTOR_APOTHEOSIZE_EXP)
	local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	local var = Actor.getStaticVar(sysarg)
	if not var.DeifyCount then
		var.DeifyCount = DeifyConfig.ChangeCount
	end

	if var.DeifyCount <= 0 then 
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.deify00001,ttFlyTip)
		return
	end		

	--local nUpGreatCount = Actor.getActorLevelUpgradeExp(sysarg,nLevel)
	local nUpGreatCount = LevelUpExp[nLevel]
	local nGetDeifyExp = math.floor(nUpGreatCount/DeifyConfig.Rate)	
	Actor.SetDeifyExp(sysarg,nDeifyExp + nGetDeifyExp)
	nLevel = nLevel - 1
	Actor.setLevel(sysarg,nLevel)
	local nDeifyCount = var.DeifyCount - 1
	Actor.SetDeifyTimes(sysarg,nDeifyCount)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sDeify)
	DataPack.writeShort(netPack, nDeifyCount)
	--nUpGreatCount = Actor.getActorLevelUpgradeExp(sysarg,nLevel)
	nUpGreatCount = LevelUpExp[nLevel]
	DataPack.writeUInt(netPack,math.floor(nUpGreatCount/DeifyConfig.Rate))
	DataPack.flush(netPack)
end

--获取不同称号颜色
function getDeifyColor( nLevel )
	local nColor = nil
	if nLevel == 2 then
		nColor = "(c0xffFFF000)"
	elseif nLevel == 3 then
		nColor = "(c0xffFF9a00)"
	elseif nLevel == 4 then
		nColor = "(c0xffFF00FE)"
	elseif nLevel == 5 then
		nColor = "(c0xffFE0000)"
	else
		nColor = "(c0xff00ff00)"
	end
	return nColor
end

--封神次数
MiscsImplement.SendDeifyTimesHandle = function( sysarg, msgid, packet )
	local var = Actor.getStaticVar(sysarg)
	if not var.DeifyCount then
		var.DeifyCount = DeifyConfig.ChangeCount
	end
	local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sDeify)
	DataPack.writeWord(netPack, var.DeifyCount)
	--nUpGreatCount = Actor.getActorLevelUpgradeExp(sysarg,nLevel)
	nUpGreatCount = LevelUpExp[nLevel]
	DataPack.writeUInt(netPack,math.floor(nUpGreatCount/DeifyConfig.Rate))
	DataPack.flush(netPack)
end

--兑换封神次数
MiscsImplement.ExchangeDeifyTimesHandle = function( sysarg, msgid, packet )
--	local nType = DataPack.readByte(packet)	
--	if nType == 1 then--绑金
--		local nBindGold = Actor.getMoneyCount(sysarg,mtBindCoin)
--		if nBindGold >= DeifyConfig.BindGold then
--			Actor.changeMoney(sysarg,mtBindCoin,-DeifyConfig.BindGold,GameLog.cFengShen,lang.LogTips.l00199)
--		else
--			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.deify00004, DeifyConfig.BindGold),ttFlyTip)
--			return
--		end
--	elseif nType == 2 then--金币

--	elseif nType == 3 then--元宝

--	end
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cDeify, MiscsImplement.DeifyHandle)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cSendDeifyTimes, MiscsImplement.SendDeifyTimesHandle)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cExchangeDeifyTimes, MiscsImplement.ExchangeDeifyTimesHandle)