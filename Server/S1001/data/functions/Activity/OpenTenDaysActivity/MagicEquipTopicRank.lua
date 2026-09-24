--lua script
--#include "data\language\LangCode.txt" once   --语言包
--#include "data\config\item\MagicEquip.lua" once

--新区活动第六天 第一法宝

--23结算
function OnAccountMagicTopicRank()
	--System.broadSwingTopicMsg(1)
	local var = System.getStaticVar()
	if not var.TopMagicEquip then return end
	local nActorId = var.TopMagicEquip.actorid
	System.sendTopOfflineAward(OpenServerConfig.activitys[6].openDays,OpenServerConfig.activitys[6].needValue,nActorId,1187,39)
	System.onAccountAllActivity(OpenServerConfig.activitys[6].openDays,OpenServerConfig.activitys[6].needValue)		--全民活动结算
	System.broadcastTipmsg(Lang.Activity.k00023,2+128)
	System.finishTenDaysToFile(6)
	BroadBrationEffect()
end

--法宝等级提升给提示
function UpMagicEquipLevelGiveTips(sysarg)
	--新区第6天第一法宝活动
	if System.getActivityFinishDays(6) > 0 then return end
	if System.getDaysSinceOpenServer() > 6 then return end
	
	local var = System.getStaticVar()
	local sName = Actor.getName(sysarg)
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local nMagicEquipId = Actor.getIntProperty(sysarg,PROP_ACTOR_MAGIC_EQUIPID)
	local nCurMagicLevel = GetCurMagicEquipLevel(nMagicEquipId)
	local nCurMagicExp = Actor.getIntProperty(sysarg,PROP_ACTOR_MAGIC_EQUIPEXP)
	if not var.TopMagicEquip then
		var.TopMagicEquip = {}		
	end
	local nFlag = 0
	local nTopMagicEquipConfig = var.TopMagicEquip
	if nTopMagicEquipConfig and nTopMagicEquipConfig.magicEquipLevel and nTopMagicEquipConfig.magicEquipExp then
		
		if nCurMagicLevel <= nTopMagicEquipConfig.magicEquipLevel and nCurMagicLevel < 7 then 
			return
		elseif nCurMagicLevel >= 7 and nCurMagicLevel == nTopMagicEquipConfig.magicEquipLevel and nCurMagicExp <= nTopMagicEquipConfig.magicEquipExp then
			return
		end
		
		if sName == nTopMagicEquipConfig.name then
			nFlag = 1
		end
	end
	var.TopMagicEquip.actorid = nActorId
	var.TopMagicEquip.name = sName
	var.TopMagicEquip.magicEquipLevel = nCurMagicLevel
	var.TopMagicEquip.magicEquipExp = nCurMagicExp
	if nFlag == 0 then
		System.broadcastTipmsg(string.format("<(c0xFF00cbff)%s><(c0xFF00ffae)玩家><(c0xFF00ffae)把法宝等级提升到了><(c0xFF00cbff)%d级><(c0xFF00ffae),大家赶紧来超越他吧.>",sName,nCurMagicLevel),2)
		System.broadcastTipmsg(string.format("<(c0xFF00cbff)%s><(c0xFF00ffae)玩家><(c0xFF00ffae)把法宝等级提升到了><(c0xFF00cbff)%d级><(c0xFF00ffae),大家赶紧来超越他吧.><#B活动详情点击此处/@@showWin,106>",sName,nCurMagicLevel),128)		
	end
end

--获取当前法宝等级
function GetCurMagicEquipLevel(id)
	for i1, v1 in ipairs(MagicEquipCfg.MagicEquips) do
		for i2, v2 in ipairs(v1) do
			if v2.id == id then
				return i2
			end
		end
	end
end	
