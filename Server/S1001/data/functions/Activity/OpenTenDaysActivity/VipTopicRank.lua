--lua script
--#include "data\language\LangCode.txt" once   --语言包

--新区第八天活动	第一会员

--23结算
function OnAccountVipTopicRank()
	--System.broadSwingTopicMsg(1)
	local var = System.getStaticVar()
	if not var.TopVip then return end
	local nActorId = var.TopVip.actorid
	System.sendTopOfflineAward(OpenServerConfig.activitys[8].openDays,OpenServerConfig.activitys[8].needValue,nActorId,1189,39)
	System.onAccountAllActivity(OpenServerConfig.activitys[8].openDays,OpenServerConfig.activitys[8].needValue)		--全民活动结算
	System.broadcastTipmsg(Lang.Activity.k00023,2+128)
	System.finishTenDaysToFile(8)
	BroadBrationEffect()
end

--VIP等级提升给提示
function UpVipLevelGiveTips(sysarg)
	if System.getActivityFinishDays(8) > 0 then return end
	if System.getDaysSinceOpenServer() > 8 then return end
	
	local var = System.getStaticVar()
	local sName = Actor.getName(sysarg)
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local nVipLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)
	if not var.TopVip then
		var.TopVip = {}
	end
	local nFlag = 0
	local nTopTopVIPConfig = var.TopVip
	if nTopTopVIPConfig and nTopTopVIPConfig.vipLevel then
		if nVipLevel <= nTopTopVIPConfig.vipLevel then return end
		if sName == nTopTopVIPConfig.name then
			nFlag = 1
		end				
	end
	var.TopVip.actorid = nActorId
	var.TopVip.name = sName
	var.TopVip.vipLevel = nVipLevel
	if nFlag == 0 then
		System.broadcastTipmsg(string.format("<(c0xFF00cbff)%s><(c0xFF00ffae)玩家><(c0xFF00ffae)把VIP等级提升到了><(c0xFF00cbff)%d级><(c0xFF00ffae),大家赶紧来超越他吧.>",sName,nVipLevel),2)
		System.broadcastTipmsg(string.format("<(c0xFF00cbff)%s><(c0xFF00ffae)玩家><(c0xFF00ffae)把VIP等级提升到了><(c0xFF00cbff)%d级><(c0xFF00ffae),大家赶紧来超越他吧.><#B活动详情点击此处/@@showWin,106>",sName,nVipLevel),128)		
	end
end
