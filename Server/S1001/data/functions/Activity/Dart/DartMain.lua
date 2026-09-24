--lua script
--申请护送美女的对话

--#include "data\language\LangCode.txt" once --语言包 
--#include "data\config\activityconfig\Dart\DartConfig.lua"  once  --基本设置
--#include "ApplyDartCommon.lua"
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once

--对话npc
function ApplyDart_Main(sysarg)
	local str = ""
	if Actor.checkActorLevel(sysarg,EscortDartConfig.LevelLimit) == true then
		str = str .. "\\".."<#BL"..Lang.Activity.t00070.."/@ActorApplyDart>"
	end

	local sVar = Actor.getStaticVar(sysarg)
	if sVar.ybstate == nil then	--正在押送镖车
		sVar.ybstate = 0
	end

	if sVar.ybstate == 1 then
		str = str .. "\\".."<#BL"..Lang.Activity.t00071.."/@GiveUpApplyDart>"
	end

	return str
end

--护送美女
function ActorApplyDart(sysarg)
	local dVar = Actor.getDyanmicVar(sysarg)
	local sVar = Actor.getStaticVar(sysarg)
	if sVar.ybstate == nil then	--正在押送镖车
		sVar.ybstate = 0
	end

	if sVar.ybstate == 1 then
		Actor.sendTipmsg( sysarg, Lang.Activity.t00072,ttFlyTip)
		return
	end

	--local nLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if Actor.checkActorLevel(sysarg,EscortDartConfig.LevelLimit) == false then
		Actor.sendTipmsg( sysarg, string.format(Lang.Activity.t00073,EscortDartConfig.LevelLimit),ttFlyTip)
		return
	end

	if sVar.days.darttms == nil then
		sVar.days.darttms = 0 
	end
	
	local nTimes = EscortDartConfig.OpenTimes		--能护送的次数
	if Actor.isVip(sysarg) == true then
		nTimes = EscortDartConfig.VipOpenTimes
	end

	if sVar.days.darttms >= nTimes then		--护送的次数
		if Actor.hasQuest(sysarg, EscortDartConfig.DartQuestId) and not Actor.canFinishQuest(sysarg, EscortDartConfig.DartQuestId) then
		else
			if Actor.isVip(sysarg) == false then
				local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sDartTipsBuyVIP)
				DataPack.flush(pack)
			else
				OpenGuideUi(sysarg)
				Actor.sendTipmsg( sysarg, Lang.Activity.t00074,ttFlyTip)
			end
			return
		end
	end
	
	StartApplyActorDart(sysarg, 0)
	
	Actor.setWorkDayMask(sysarg, 0, 13, true)

	Actor.closeNPCDialog(sysarg)
end

--放弃护送
function GiveUpApplyDart(sysarg)
	local str = Lang.Activity.g00029
	str = str .. "\\".."<#BL"..Lang.Activity.g00006.."/@OnGiveUpDart>"
	str = str .. "\\".."<#BL"..Lang.Activity.g00007.."/@OnCancleGiveUp>"
	return str
end

function OnGiveUpDart(sysarg)
	ResetActorDartInfo(sysarg,false true)
	Actor.closeNPCDialog(sysarg)
end

function OnCancleGiveUp(sysarg)
	Actor.closeNPCDialog(sysarg)
end

table.insert(MainFnTable, ApplyDart_Main)
