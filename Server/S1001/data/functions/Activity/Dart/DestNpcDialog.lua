--lua script
--交送美女的对话

--#include "data\language\LangCode.txt" once --语言包 
--#include "data\config\activityconfig\Dart\DartConfig.lua"  once  --基本设置
--#include "data\functions\Activity\Common\Awards.lua" once
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "ApplyDartCommon.lua" once
--#include "..\CombineActivity\MysiticShopOp.lua" once

--交送
function FinishDartDialog(sysarg)
	local str = ""
	--系统级静态变量
	local dVar = Actor.getStaticVar(sysarg)
	
	if dVar.ybstate == nil then
		dVar.ybstate = 0
	end

	if dVar.ybstate == 1 then
		str = str .. "\\".."<#BL"..Lang.Activity.t00076.."/@FinishActorDart>"
	end

	return str
end

--护送美女 完成
function FinishActorDart(sysarg)
	--判断是否有镖车
	local svar = Actor.getStaticVar(sysarg)
	if svar.bcHandle == nil or svar.bcHandle == 0 then
		Actor.sendTipmsg( sysarg, Lang.Activity.t00077,ttFlyTip)
		return
	end
	
	local ActorDartMon = Actor.getEntity(svar.bcHandle)
	if (ActorDartMon == nil or ActorDartMon == 0) then 
		Actor.sendTipmsg( sysarg, Lang.Activity.t00078,ttFlyTip)
		return
	end

	local monPosX, monPosY = Actor.getEntityPosition(ActorDartMon, 0, 0)
	local selfPosX, selfPosY = Actor.getEntityPosition(thisNPC, 0, 0)
	local succFollowDist = EscortDartConfig.FinishsuccDist

	if (math.abs(monPosX-selfPosX) > succFollowDist or math.abs(monPosY-selfPosY) > succFollowDist) then
		Actor.sendTipmsg( sysarg, Lang.Activity.t00079,ttFlyTip)
		return
	else		
		local hasCount = Item.getBagEmptyGridCount(sysarg)
		local needCount = 2
		if hasCount < needCount then
			Actor.sendTipmsg( sysarg, string.format(Lang.Activity.t00088,needCount),ttFlyTip)
			return
		end

		OnActorDartFinished(sysarg)
	end

	Actor.closeNPCDialog( sysarg )
end

-- @brief: 交付镖车，护送镖车完毕
function OnActorDartFinished(sysarg)
	local svar = Actor.getDyanmicVar(sysarg)
	local dVar = Actor.getStaticVar(sysarg)

	if dVar.bcHandle == nil then
		return
	end

	if dVar.bcpz == nil or dVar.bcpz == 0 then 
		return 
	end

	local pack = DataPack.allocPacket(sysarg, 139, 13)
	if (pack ~= nil) then
		DataPack.writeInt64(pack,dVar.bcHandle)    --下属句柄
		DataPack.flush(pack)
	end

	GiveActorDartAward(sysarg,dVar.bcpz)

	
	if dVar.days.darttms == nil then
		dVar.days.darttms = 0 
	end
	
	local nTimes = EscortDartConfig.OpenTimes		--能护送的次数
	if Actor.isVip(sysarg) == true then
		nTimes = EscortDartConfig.VipOpenTimes
	end

	dVar.ybstate = EscortDartConfig.DartSetup.CampDartStatusFinished
	ResetActorDartInfo(sysarg, false, true)
	Actor.triggerQuestEvent(sysarg, 127, 50094, 1)

	if dVar.days.darttms < nTimes then			--护送的次数
		local str = string.format(Lang.Activity.t00089,nTimes-dVar.days.darttms)
		Actor.messageBox(sysarg,0,0,str,Lang.Activity.t00090.."/GoonApplyDart",Lang.Activity.w00011.."/CancleApply",NULL)
	else
		OpenGuideUi(sysarg)
	end
end

--发送奖励
function GiveActorDartAward(sysarg,nIndex)
	--print("GiveActorDartAward:"..nIndex)
	local str = ""
	if nIndex == nil or nIndex == 0 then return end

	local nHour,nMinu,nSec = System.getTime(0,0,0)
	
	local nrate = 1
	if nHour == EscortDartConfig.AwardTime and nMinu >= EscortDartConfig.AwardTimeMut then
		nrate = EscortDartConfig.AwardsRate
	end
	
	local rRate = GetCombineActivityRate()

	local  nExp = Actor.getActivityExp(sysarg,EscortDartConfig.DartHorse[nIndex].Awards[1].id,EscortDartConfig.DartHorse[nIndex].Awards[1].count * nrate * rRate,EscortDartConfig.DartHorse[nIndex].Awards[1].quality)

	for i=1,table.getn(EscortDartConfig.DartHorse[nIndex].Awards) do
		Actor.giveAward(sysarg,EscortDartConfig.DartHorse[nIndex].Awards[i].type,EscortDartConfig.DartHorse[nIndex].Awards[i].id,EscortDartConfig.DartHorse[nIndex].Awards[i].count * nrate * rRate,EscortDartConfig.DartHorse[nIndex].Awards[i].quality,EscortDartConfig.DartHorse[nIndex].Awards[i].strong,EscortDartConfig.DartHorse[nIndex].Awards[i].bind)
	end
	--Awards.Give(sysarg,EscortDartConfig.DartHorse[nIndex].Awards,201,"Actor dart")

	local nCoin = EscortDartConfig.DartHorse[nIndex].Awards[2].count * nrate

	local dVar = Actor.getStaticVar(sysarg)
	if dVar.ThisDartFreshAward == nil then
		dVar.ThisDartFreshAward = 0
	end
	str = string.format(Lang.Activity.g00049,nExp,nCoin)
	local tmpStr = ""

	if dVar.ThisDartFreshAward == 1 then
		Awards.Give(sysarg,EscortDartConfig.DartHorse[nIndex].AwardsMore,822,"Actor dart")
		local sname = Item.getItemName(EscortDartConfig.DartHorse[nIndex].AwardsMore[1].id)
		tmpStr = string.format(Lang.Activity.g00050,sname)
	end

	str = str..tmpStr
	Actor.sendTipmsg( sysarg, str,ttFlyTip)
end

table.insert(MainFnTable, FinishDartDialog)
