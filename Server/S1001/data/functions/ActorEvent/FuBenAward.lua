
--#include "data\config\activity\FuBenAward.lua"

EventCallDispatcher.HandleFuBenAwardEvent = function(sysarg,args)

	local nAwardType = args[1]
	
	local nMonsterNum = Fuben.getMonsterNum(sysarg)
	if nMonsterNum > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf647,ttFlyTip)
		return false
	end
	
	local fubenId = Actor.getFubenId(sysarg)
	
	if fubenId > 0 then
		local config
		for key,value in ipairs(FubenAwardCfg) do
			if value.fubenId == fubenId then
				config = value
				break
			end
		end

		if not config then return false end
		
		--//已领取了奖励
		local var = Actor.getStaticVar(sysarg)
		if not var.fuBenAwardFlag then
			var.fuBenAwardFlag = 0
		end
		if var.fuBenAwardFlag == 1 then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.c000181,ttFlyTip)
			return false
		end
	
		--检查背包
		local nBagCount = Item.getBagEmptyGridCount(sysarg)
		local nNeedCount = 0
		for key ,value in ipairs(config.award) do
			if value.type == 0 then
				if nAwardType == 1 then
					nNeedCount = nNeedCount + Item.getAddItemNeedGridCount(sysarg,value.id,value.count)
				elseif nAwardType == 2 then
					nNeedCount = nNeedCount + Item.getAddItemNeedGridCount(sysarg,value.id,value.count*2)
				end
			end
		end

		if nNeedCount > nBagCount then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf544,ttFlyTip)
			return false 
		end
		
		if nAwardType == 1 then
			for key ,value in ipairs(config.award) do	
				if Actor.giveAward(sysarg,value.type,value.id,value.count,0,0,1,0,GameLog.cGetFuBenAward,"副本领取单倍奖励") == false then
					print("give award error, the Actor ID = "..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
				end
			end
		
		elseif nAwardType == 2 then
			local consumeData = {}
			local isok = CheckOneConsume(sysarg, false, config.doubleConsume, true, consumeData)				
			if not isok then return end	

			--扣除消耗
			isok = DeductOneConsume(sysarg, false, config.doubleConsume, GameLog.cNewFuBenAwardConsume, tostring(fubenId))		
			if not isok then return end
			for key ,value in ipairs(config.award) do	
				if Actor.giveAward(sysarg,value.type,value.id,value.count*2,0,0,1,0,GameLog.cGetFuBenDoubleAward,tostring(fubenId)) == false then
					print("give award error, the Actor ID = "..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
				end
			end
		end
		var.fuBenAwardFlag = 1
	else
		return false 
	end
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGetFuBenAward, EventCallDispatcher.HandleFuBenAwardEvent)
