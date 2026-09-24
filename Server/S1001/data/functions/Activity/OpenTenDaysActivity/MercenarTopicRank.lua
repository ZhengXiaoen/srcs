--lua script
--#include "data\language\LangCode.txt" once   --语言包

--第七天 第一佣兵

--23结算
function OnAccountMercenarTopicRank()
	--System.broadSwingTopicMsg(1)
	local var = System.getStaticVar()
	if not var.TopMercenar then return end
	local nActorId = var.TopMercenar.actorid
	System.sendTopOfflineAward(OpenServerConfig.activitys[7].openDays,OpenServerConfig.activitys[7].needValue,nActorId,1188,39)
	System.onAccountAllActivity(OpenServerConfig.activitys[7].openDays,OpenServerConfig.activitys[7].needValue)		--全民活动结算
	System.broadcastTipmsg(Lang.Activity.k00023,2+128)
	System.finishTenDaysToFile(7)
	BroadBrationEffect()
end

--佣兵等级提升给提示
function UpMercenarLevelGiveTips(sysarg)
	if System.getActivityFinishDays(7) > 0 then return end
	if System.getDaysSinceOpenServer() > 7 then return end
	
	local var = System.getStaticVar()
	local sName = Actor.getName(sysarg)
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local nMercenarLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_MERCENA_LEVEL)
	if not var.TopMercenar then
		var.TopMercenar = {}
	end
	local nFlag = 0
	local nTopMercenarConfig = var.TopMercenar
	if nTopMercenarConfig and nTopMercenarConfig.mercenarLevel then
		if nMercenarLevel <= nTopMercenarConfig.mercenarLevel then return end
		if sName == nTopMercenarConfig.name then
			nFlag = 1
		end	
	end
	var.TopMercenar.actorid = nActorId
	var.TopMercenar.name = sName
	var.TopMercenar.mercenarLevel = nMercenarLevel
	if nFlag == 0 then
		System.broadcastTipmsg(string.format("<(c0xFF00cbff)%s><(c0xFF00ffae)玩家><(c0xFF00ffae)把佣兵等级提升到了><(c0xFF00cbff)%d级><(c0xFF00ffae),大家赶紧来超越他吧.>",sName,nMercenarLevel),2)
		System.broadcastTipmsg(string.format("<(c0xFF00cbff)%s><(c0xFF00ffae)玩家><(c0xFF00ffae)把佣兵等级提升到了><(c0xFF00cbff)%d级><(c0xFF00ffae),大家赶紧来超越他吧.><#B活动详情点击此处/@@showWin,106>",sName,nMercenarLevel),128)		
	end
end
