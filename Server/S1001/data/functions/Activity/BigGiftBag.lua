--#include "data\config\activity\BigGiftBagConfig.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once

MiscsImplement.handleGetBigGiftBag = function( sysarg, msgid, packet )
	
	if not packet or not BigGiftBagConfig then return false end
	local Gifttype = DataPack.readByte(packet)
	
	if Gifttype < 1 or Gifttype > #BigGiftBagConfig then return end
	local GiftBagconfig = BigGiftBagConfig[Gifttype]
	
	local itemCount = Actor.getItemCount(sysarg,GiftBagconfig.itemId)
	
	if itemCount < 1 then
		return false
	end
	
	local isok = CheckAllConsume(sysarg, false, GiftBagconfig.consume, true, expendData)
	
	if not isok then
		return false
	end	

	local nJob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)
	
	local GiftConfig 
	if Gifttype == 1 then
		GiftConfig = GiftBagconfig.reward[nSex+1]
	else
		GiftConfig = GiftBagconfig.reward
	end
	
	local hasCount = Item.getBagEmptyGridCount(sysarg)
	if hasCount < GiftBagconfig.BagCount then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mt00001, GiftBagconfig.BagCount), ttFlyTip)
		return false
	end
	
	--扣除消耗
	isok = DeductAllConsume(sysarg, false, GiftBagconfig.consume, GameLog.cGetBigGiftBagConsume)		
	if not isok then
		--扣除消耗出错		
		return false
	end	
	    
	--奖品一个物品给玩家
	Awards.Give(sysarg, GiftConfig, GameLog.cBigGift, "领取大礼包")

	Actor.removeItem(sysarg,GiftBagconfig.itemId,1)
	local name = Actor.getName(sysarg)
	local msg = ""
	if Gifttype == 1 then
		msg = string.format(Lang.ScriptTips.zf573,name,GiftBagconfig.consume[1].count,GiftBagconfig.name)
	elseif Gifttype == 2 then
		msg = string.format(Lang.ScriptTips.zf574,name,GiftBagconfig.consume[1].count,GiftBagconfig.name)
	elseif Gifttype == 3 then
		msg = string.format(Lang.ScriptTips.zf575,name,GiftBagconfig.consume[1].count,GiftBagconfig.name)
	end
	Actor.sendTipmsg(sysarg,msg,128+2)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetGiveBigGift, MiscsImplement.handleGetBigGiftBag)