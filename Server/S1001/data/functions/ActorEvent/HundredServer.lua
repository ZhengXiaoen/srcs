
--#include "data\config\activityconfig\Festival\HundredServer.lua" once
--#include "data\config\activityconfig\Festival\CommonFestival.lua" once
--#include "data\functions\Activity\Festival\OldPlayerBack.lua" once  --ÀÏÍæ¼Ò»Ø¹é

function GetCfgFromTab(optName)
	for k, v in ipairs(CommonFestival.HundredServer.options) do
		if v.optionName == optName then
			return v
		end
	end
	return nil
end

function checkHundredGrids(sysarg, awardTab, nIndex )
	if not awardTab then
		return false
	end
	local count = 0
	local job = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	local mySex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
	local awardCfg = awardTab[nIndex]
	if not awardCfg then
		return false
	end
	for _, v in ipairs(awardCfg.awards) do
		if v.type == 0 and (not v.sex or v.sex == mySex) and (not v.job or v.job == job) then
			count = count + Item.getAddItemNeedGridCount( sysarg, v.id, v.count, v.quality, v.strong, v.bind)
		end
	end
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if bagIdxs < count then
		Actor.sendTipmsg( sysarg,string.format(Lang.ScriptTips.tf00008, count),ttFlyTip )
		return false
	end
	return true
end

function GiveHundredAward(sysarg, awardTab, nIndex, logStr)
	if not awardTab then
		return false
	end
	local awardCfg = awardTab[nIndex]
	if not awardCfg then
		return false
	end
	local job = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	local mySex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
	for _, v in ipairs(awardCfg.awards) do
		if v.type == 0 and (not v.sex or v.sex == mySex) and (not v.job or v.job == job) then
			Actor.giveAward(sysarg, v.type,v.id,v.count,v.quality,v.strong,v.bind,0,838, logStr)
		end
	end
	return true
end

function getBigGiftBag(sysarg)
	local count = 0
	local cfgInfo = GetCfgFromTab(Lang.Activity.hundred21)
	if cfgInfo then
		if not Actor.checkActorLevel(sysarg, HundredServer.BigGiftBagMinLv, 0)  then
			Actor.sendTipmsg( sysarg, string.format(Lang.Activity.hundred50, HundredServer.BigGiftBagMinLv), ttFlyTip)
			return
		end
		local sVar = Actor.getStaticVar(sysarg)
		if sVar.HundredBigGift then
			Actor.sendTipmsg( sysarg, Lang.Activity.hundred51, ttFlyTip)
			return
		end
		for k, tab in ipairs(cfgInfo.actAwardId) do
			for _, v in ipairs(tab.awards) do
				if v.type == 0 then
					count = count + Item.getAddItemNeedGridCount( sysarg, v.id, v.count, v.quality, v.strong, v.bind)
				end
			end
		end
		local bagIdxs = Item.getBagEmptyGridCount( sysarg )
		if bagIdxs < count then
			Actor.sendTipmsg( sysarg,string.format(Lang.ScriptTips.tf00008, count),ttFlyTip )
			return false
		end
		sVar.HundredBigGift = true
		for k, tab in ipairs(cfgInfo.actAwardId) do
			for _, v in ipairs(tab.awards) do
				Actor.giveAward(sysarg, v.type,v.id,v.count,v.quality,v.strong,v.bind,0,838,Lang.LogTips.l00115)
			end
		end
		Actor.sendTipmsg( sysarg, Lang.Activity.hundred52, ttFlyTip)
	end
end

function GetYestodayRank(sysarg, nIndex)
	local cfgInfo = GetCfgFromTab( Lang.Activity.hundred07)
	if cfgInfo then
		if checkHundredGrids(sysarg, cfgInfo.actAwardId, nIndex) then
			return GiveHundredAward(sysarg, cfgInfo.actAwardId, nIndex, Lang.LogTips.l00116)
		end
	end
	return false
end


function GetHundredAllRank(sysarg, nIndex)
	local cfgInfo = GetCfgFromTab( Lang.Activity.hundred07)
	if cfgInfo then
		nIndex = nIndex + 10
		if checkHundredGrids(sysarg, cfgInfo.actAwardId, nIndex) then
			return GiveHundredAward(sysarg, cfgInfo.actAwardId, nIndex, Lang.LogTips.l00117)
		end
	end
	return false
end

function EventCallDispatcher.HandleHundredServer(sysarg, args)
	local nType = args[1]
	local nIdx = args[2]
	if nType == 0 then
		getBigGiftBag(sysarg)
	elseif nType == 1 then		
		return GetYestodayRank(sysarg, nIdx)
	elseif nType == 2 then
		return GetHundredAllRank(sysarg, nIdx)
	end
end


function EventCallDispatcher.HandleOldPlayerBack(sysarg, args)
	return OnOldPlayerBackMsg(sysarg, args)	
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeHundredServer, EventCallDispatcher.HandleHundredServer)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeOldPlayerBack, EventCallDispatcher.HandleOldPlayerBack)