--lua script
--处理商城相关的操作

--#include "data\language\LangCode.txt" once   --语言包
--#include "data\config\quest\StoreQuest.lua" once --任务相关的配置
--#include "data\config\activityconfig\YbConsume\ConsumeConfig.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once
--#include "data\functions\player.lua" once -- 角色处理
--#include "data\config\store\ShangPu\DiscountStoreItemCfg.lua"  --每日打折商品配置

local StoreOpId = 
{  
	enStoreBuy 	= 1,	--购买物品	
	enGetConsumeAwards = 2,	--领取奖励
	enSendToClientTips = 3,	--给予提示
	enBuyRandomItem = 4,	--购买每日打折商品
}

StoreOpFuncList = {}

EventCallDispatcher.HandlerStoreOp = function (sysarg, args)
  if args[1] == nil then return end   --
  local func = StoreOpFuncList[args[1]]
  if func ~= nil then
    func(sysarg, args) 
  end
end

--购买某个物品
StoreOpFuncList[StoreOpId.enStoreBuy] = function (sysarg,args)
	--完成相关的任务
	local qData = StoreQuestData[args[2]]
	if qData then
		for idx, curData in ipairs(qData) do
			Actor.setQuestValue(sysarg, curData.qid, curData.tid, curData.count)
		end
	end
	
	-- 处理玩家商城购买物品
	OnStoreBuyItem(sysarg, args[2], args[3])
end

--领取奖励
StoreOpFuncList[StoreOpId.enGetConsumeAwards] = function (sysarg,args)
	local avr = Actor.getStaticVar(sysarg)
	if avr.days.getConsumeAwardFlag == nil then
		avr.days.getConsumeAwardFlag = 0
	end

	if avr.days.getConsumeAwardFlag == 1 then
		Actor.sendTipmsg(sysarg,Lang.Activity.w00017,1)
		return
	end
	
	local nCount = args[2]
	ConsumeConfig.awards[1].count = math.floor(nCount * ConsumeConfig.nRate /100)
	if Awards.CheckBagGridCount(sysarg,ConsumeConfig.awards) then
		Awards.Give(sysarg,ConsumeConfig.awards,822,Lang.Activity.w00015)
		local str = string.format(Lang.Activity.w00016,Actor.getName(sysarg))
		System.broadcastTipmsg(str,2+128)

		avr.days.getConsumeAwardFlag = 1
	end
end

--下发提示
StoreOpFuncList[StoreOpId.enSendToClientTips] = function (sysarg,args)
	local avr = Actor.getStaticVar(sysarg)
	if avr.days.getConsumeAwardFlag == nil then
		avr.days.getConsumeAwardFlag = 0
	end

	local nState = 1
	if avr.days.getConsumeAwardFlag == 1 then
		nState = 0
	end

	local nPoint = args[2]
	local nAwards = math.floor(nPoint * 10 / 100)

	local pack = DataPack.allocPacket(sysarg,12,8)

	if(pack==nil) then return end
	DataPack.writeByte(pack,nState) --压入一个Byte
	DataPack.writeInt(pack, nPoint)  
	DataPack.writeInt(pack, nAwards)  
	DataPack.flush(pack) --向客户端发送

end

--下发提示
StoreOpFuncList[StoreOpId.enBuyRandomItem] = function (sysarg,args)

	local config = DiscountStoreItemCfg
	if not config then return end

	local sVar = System.getStaticVar()
	local nType = args[2]
	if nType == 0 then
		if not sVar.RandomItemStore then
			InitRandomItemInfo()
		end
		UpdataItemInfo(sysarg,sVar.RandomItemStore[1],sVar.RandomItemStore[2])
		return
	end
	
	if not sVar.RandomItemStore or not sVar.RandomItemStore[1] or not sVar.RandomItemStore[2] then
		return
	end
	
	if sVar.RandomItemStore[2] and sVar.RandomItemStore[2] <= 0 then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf361, config.item),ttFlyTip)
		UpdataItemInfo(sysarg,sVar.RandomItemStore[1],sVar.RandomItemStore[2])
		return 
	end
	
	config = config[sVar.RandomItemStore[1]]
	if not config then return end
	
	if not Actor.changeMoney(sysarg,config.price[1].type,-config.price[1].price,GameLog.cBuyStoreRandomItemConsume,"购买商场特价商品") then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf362,ttFlyTip)
		return
	end
	
	Actor.giveAward(sysarg,0,config.item,1,0,0,0,0,GameLog.cGiveStoreRandomItem,"Successful Give Store Random Item")
	sVar.RandomItemStore[2] = sVar.RandomItemStore[2] - 1
	
	UpdataItemInfo(sysarg,sVar.RandomItemStore[1],sVar.RandomItemStore[2])
end

function InitRandomItemInfo()
	
	local sVar = System.getStaticVar()
	if not sVar.RandomItemStore then
		sVar.RandomItemStore = {}
	end
	
	local config = DiscountStoreItemCfg
	if not config then return end
	
	local nId = math.random(1,#config)
	
	sVar.RandomItemStore[1] = nId
	sVar.RandomItemStore[2] = config[nId].maxTimes
	
	if System.getDisCountItemFlag() then   
		sVar.RandomItemStore[2] = config[nId].maxTimes * 2
	end
end

function Open_DiscountsItem(nState)
	
	local sVar = System.getStaticVar()
	if not sVar.RandomItemStore then
		InitRandomItemInfo()
	end

	local nId = sVar.RandomItemStore[1]
	local config = DiscountStoreItemCfg[nId]
	if not config then return end

	if nState == 0 then
		if sVar.RandomItemStore[2] > config.maxTimes then
			sVar.RandomItemStore[2] = config.maxTimes
		end
	elseif nState == 1 then
		sVar.RandomItemStore[2] = config.maxTimes * 2
	end
end

function UpdataItemInfo(sysarg,index,times)
	
	local pack = DataPack.allocPacket(sysarg,12,14)

	if(pack==nil) then return end
	DataPack.writeByte(pack,index) 
	DataPack.writeInt(pack, times)  
	DataPack.flush(pack) 
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeStore, EventCallDispatcher.HandlerStoreOp)

