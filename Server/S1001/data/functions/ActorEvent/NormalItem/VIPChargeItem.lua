--VIP道具，使用后延长VIP有效时间

--#include "data\language\LangCode.txt" once  --语言包
--#include "data\config\vip\VipConfig.lua" once
--#include "data\config\item\SkillBookItemData.lua" once


VIPNotices = {
	Lang.Misc.m000439,
	Lang.Misc.m000440,
	Lang.Misc.m000441,
}

function CumulationSendTime( sysarg, vipType )
	local svar = Actor.getStaticVar(sysarg)
	svar.days.VipFreeTelCnt = 0
end

function SetExperienceVipDate( sysarg, addTime )
	local sVar = Actor.getStaticVar(sysarg)
	if addTime == nil then
		sVar.VipExperienceDate = nil
	else
		local nNowDt = System.getCurrMiniTime()
		sVar.VipExperienceDate = nNowDt + addTime
	end	
end

function ChargeVipItem( sysarg, itemIdx, itemPtr, ItemConf )
	if Actor.removeItemByPtr(sysarg, itemPtr, 1, true, Lang.LogTips.l00110, 71) > 0 then
		local addTimes = ItemConf.time * 86400		
		Actor.addVIP( sysarg, ItemConf.vipType, addTimes, ItemConf.grade)		
		CumulationSendTime(sysarg, ItemConf.vipType)
		if ItemConf.vipType == enVIPSupremacy then
			local myLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
			local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
			for k, v in ipairs(SkillBoolConfig) do
				if v.vipActorLv and v.jop_id == myJob and myLevel >= v.vipActorLv then
					local curLevel = Actor.getSkillLevel(sysarg, v.skill_id)
					if curLevel == 0 then
						Actor.startLearnSkill(sysarg, v.skill_id, v.vip_level)
					elseif curLevel <= v.vip_level then
						Actor.setSkillProperty(sysarg, v.skill_id, 1, v.vip_level)
					end
				end
			end
		end

		local tipId = VIPNotices[ItemConf.tip]
		System.broadcastTipmsg(string.format(tipId, Actor.getName(sysarg)), ttScreenCenter + ttChatWindow)

		local sVar = Actor.getStaticVar(sysarg)
		local vipAwardFlag = 0
		if sVar.days.VipRewardDate and sVar.days.VipRewardDate == 1 then
			vipAwardFlag = sVar.days.VipRewardDate
		end
		local netPack = DataPack.allocPacket(sysarg, 139, 61)
		if netPack then
			DataPack.writeByte(netPack, vipAwardFlag)
			DataPack.flush(netPack)
		end
	end
end

-- @brief: 注册VIP道具物品使用Handler
function VIPChargeItemInit(sysarg)
	-- VIP功能物品相关的初始化
	for i = 1, table.getn(VIPChargeItem) do
		local conf = VIPChargeItem[i]
		GlobalItemFn[conf.item_id] = { func = ChargeVipItem, params = conf, }
	end
	
	-- VIP相关数据的初始化
end

table.insert(InitFnTable, VIPChargeItemInit)
