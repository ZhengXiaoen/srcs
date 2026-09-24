--#include "data\config\activity\EnterActivitySceneCfg.lua" once

MiscsImplement.GetAddPayMoneyAward = function( sysarg, msgid, packet )
	
	local nId = DataPack.readByte(packet)

	if not EnterActivityScene[nId] then
		return
	end
	
	local config = EnterActivityScene[nId]
	
	local nResult = 0
	local nHoure,nMin,nSec = System.getTime(0,0,0)
	if nHoure == config.startHour and nMin < config.startMin then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf405,ttFlyTip)
		return
	end

	if nHoure == config.endHour and nMin >= config.endMin then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf405,ttFlyTip)
		return
	end
	
	if nId == 1 or nId == 5 or nId == 12 then
		OnEnterFuGuiShou(sysarg,config.sceneId)
	elseif nId == 2 or nId == 8 then
		OnWorship(sysarg,config.sceneId)
	elseif nId == 3 then
		TakePartToJuniorWuLin(sysarg,config.sceneId)
	elseif nId == 6 then
		OnEnterPrestige(sysarg,config.sceneId)
	elseif nId == 7 then
		OnEnterMonsterRaid(sysarg,config.sceneId)
	elseif nId == 10 then
		onEnterTreasureBoss(sysarg,config.sceneId)
	elseif nId == 11 then
		OnEnterMonsterSiege(sysarg,config.sceneId)
	elseif nId == 13 then
		WuLinSignUp(sysarg)
	elseif nId == 14 then
		OnEnterGuildCompete(sysarg,config.sceneId)
	elseif nId == 15 then
		OnEnterFountain(sysarg,config.sceneId)
	elseif nId == 16 or nId == 17 then
		onEnterFoGuang(sysarg,config.sceneId)
	elseif nId == 18 or nId == 19 then
		EnterDemonInvadeScene(sysarg)
	elseif nId == 20 or nId == 21 or nId == 22 then
		EnterSWHJScene(sysarg)
	elseif nId == 23 or nId == 24 then
		EnterYBJNHScene(sysarg)
	end
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEnterActivityScene, MiscsImplement.GetAddPayMoneyAward)