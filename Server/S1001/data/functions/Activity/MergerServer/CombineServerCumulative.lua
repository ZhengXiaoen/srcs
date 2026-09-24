--#include "data\config\item\MergerServerConfig.lua" once
--合服充值累计奖励

function CumulativeRecharge(sysarg,packet)
	
	local nType = DataPack.readByte(packet)   --合服活动类型
	local nCumulativeAward = MergerServerCfg.CumulativeAward
	local config = nCumulativeAward[nType]
	if not config then
		print("The CombineSever Login Award Config is nil ,Read file error")
		return false 
	end
	
	local var = Actor.getStaticVar(sysarg)

	if not var.CombineCumulativeFlag then
		var.CombineCumulativeFlag = {}
	end
	
	if var.CombineCumulativeFlag[nType] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.n00010,ttFlyTip)
		return false
	end
	
	if not var.CombineCumulative then
		var.CombineCumulative = 0
	end
	
	local CombineCumulative = var.CombineCumulative
	if CombineCumulative < config.needCumulative then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf311,config.needCumulative),ttFlyTip)
		return false
	end
	
	if not Awards.CheckBagGridCount(sysarg, config.award) then
		return false
	end
	
	local bResult = Awards.Give(sysarg, config.award, 817, "合服累积奖励")
	if bResult == false then
		print("give award error, actor name = "..Actor.getName(sysarg))
		return false
	end
	
	var.CombineCumulativeFlag[nType] = 1
	SendCombineData(sysarg)
	
	System.sendCommonLog(1079,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),2,nType)
end

function CombineFirstPay(sysarg,packet)	
	local config = MergerServerCfg.CombineFirstPay
	if not config then
		return false 
	end
	
	-- 领取的奖励索引（从1开始）
	local idx = DataPack.readByte(packet)
	if idx <= 0 or idx > #config then return end	

	local var = Actor.getStaticVar(sysarg)	

	if var.days.PeyNum == nil or var.days.PeyNum < config[idx].needPayMoney then
		return false
	end
	
	if var.days.CombineFirstPayFlag then
		if System.getIntBit(var.days.CombineFirstPayFlag, idx - 1) > 0 then
			return false
		end
	end
	
	if not Awards.CheckBagGridCount(sysarg, config[idx].items) then
		return false
	end
	
	local bResult = Awards.Give(sysarg, config[idx].items, GameLog.clTSBKhreeDaysAward, "合服每日首冲奖励"..idx)
	if not bResult then
		print("give award error, actor name = "..Actor.getName(sysarg))
		return false
	end
	
	var.days.CombineFirstPayFlag = System.setIntBit(var.days.CombineFirstPayFlag, idx - 1, true)
	SendCombineData(sysarg)
	System.sendCommonLog(1079,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),5,1)
	
	return true
end

function RandCombineShopItems()		
--	local totalCount = #MergerServerCfg.CombineShop.itemList
--	if totalCount > 255 then totalCount = 255 end

--	local items = {0,0,0,0}
--	local i = 1
--	while true do
--		local item_idx = System.getRandomNumber(totalCount) + 1
--		if item_idx >= 1 and item_idx <= 255 then
--			if item_idx ~= items[1] and item_idx ~= items[2] and item_idx ~= items[3] then
--				items[i] = item_idx
--				i = i + 1
--				if i >= 5 then
--					break
--				end
--			end
--		end
--	end

--	local itemsValue = 0
--	for i = 1, 4 do
--		itemsValue = System.setIntByte(itemsValue, i - 1, items[i])
--	end

--	return itemsValue
end

function GetCombineShopNextRefreshTime(curTime, lastRefreshTime)
	if curTime < lastRefreshTime then return lastRefreshTime end
	
	local nYear,nMonth,nDay,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(lastRefreshTime)	
	local nYear2,nMonth2,nDay2,nHour2,nMinute2,nSecond2 = System.GetSystemTimeInMiniTime(curTime)
		
	local time = System.encodeNumTime(nYear2,nMonth2,nDay2,nHour,nMinute,nSecond)
	if time > curTime then return time end
	
	local t = math.floor((curTime - time) / (2 * 3600)) + 1
	time = time + t * 2 * 3600
	return time
end

-- 返回刷新时间和4个物品索引
function GetCombineShopCommonData()
	-- 从0点开始,2个小时刷新一次合服商店物品	
	local curTime = System.getCurrMiniTime()
	local sVar = System.getStaticVar()
	
	local refreshTime = sVar.combShopRefresh
	if refreshTime ~= nil and refreshTime > curTime then
		return refreshTime, sVar.combShopItems
	end
	
	-- 刷新合服商店物品	
	local itemsValue = RandCombineShopItems()	
	sVar.combShopItems = itemsValue		
		
	local nYear,nMonth,nDay,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(curTime)
	if math.mod(nHour, 2) == 1 then
		nHour = nHour + 1
	else
		nHour = nHour + 2
	end
	
	refreshTime = System.encodeNumTime(nYear,nMonth,nDay,nHour,0,0)
	
	sVar.combShopRefresh = refreshTime
	return refreshTime, itemsValue
end

function UpdateActorCombineShopData(var)
	
	local shopRefresh = var.days.shopRefresh
	local shopItems = var.days.shopItems
	local curTime = System.getCurrMiniTime()
	
	-- 玩家没有刷新过则用公共物品
	if shopItems == nil then
		if var.days.shopBuyFlags ~= nil then
			if shopRefresh == nil then			
				var.days.shopBuyFlags = nil -- 公共时间刷新了
			elseif curTime >= shopRefresh then			
				var.days.shopBuyFlags = nil -- 公共时间刷新了
				var.days.shopRefresh = nil
			end
		elseif shopRefresh ~= nil then
			var.days.shopRefresh = nil
		end
		
		shopRefresh, shopItems = GetCombineShopCommonData()				
	else		
		if curTime >= shopRefresh then
			shopItems = RandCombineShopItems()
			var.days.shopItems = shopItems						
			shopRefresh = GetCombineShopNextRefreshTime(curTime, shopRefresh)
			var.days.shopRefresh = shopRefresh	
			var.days.shopBuyFlags = nil
		end
	end

	return shopRefresh, shopItems
end

-- 下发合服商店数据
function SendCombineShopData(sysarg)	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendCombineShopData)
	local var = Actor.getStaticVar(sysarg)
	
	local shopRefresh, shopItems = UpdateActorCombineShopData(var)
		
	DataPack.writeUInt(netPack, shopRefresh)
	DataPack.writeUInt(netPack, shopItems)
	
	local flags = var.days.shopBuyFlags
	if flags == nil then flags = 0 end
	
	DataPack.writeUInt(netPack, flags)	
	
	DataPack.flush(netPack)
end

-- 刷新合服商店物品
function RefreshCombineShopItems(sysarg,packet)			
	--local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	--if myYb < MergerServerCfg.CombineShop.refreshNeedYb then			
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf063, ttFlyTip)
	--	return
	--end
		
	if Actor.changeMoney(sysarg, mtYuanbao, -MergerServerCfg.CombineShop.refreshNeedYb, GameLog.cCombineShopRefreshItems, "", true) == false then
		return -- 元宝不足
	end
	
	local var = Actor.getStaticVar(sysarg)
	var.days.shopRefresh = System.getCurrMiniTime() + 2 * 3600 -- 2 小时			
	var.days.shopItems = RandCombineShopItems()		
	var.days.shopBuyFlags = nil
	
	Actor.sendTipmsg(sysarg,"刷新商店物品成功",ttFlyTip)
	
	SendCombineShopData(sysarg)
end

-- 购买合服商店物品
function BuyCombineShopItem(sysarg,packet)	
	-- 购买的物品索引（1 到 4）
	local idx = DataPack.readByte(packet)
	if idx <= 0 or idx > 4 then return end	
	
	-- 用于校验
	local buyItemId = DataPack.readInt(packet)
	
	local var = Actor.getStaticVar(sysarg)
	local shopRefresh, shopItems = UpdateActorCombineShopData(var)	
	
	local flags = var.days.shopBuyFlags
	if flags == nil then flags = 0 end
	
	if System.getIntBit(flags, idx - 1) > 0 then
		Actor.sendTipmsg(sysarg,"刷新时间还没过，不能重复购买同一物品",ttFlyTip)
		return
	end
	
	local itemIdx = System.getIntByte(shopItems, idx - 1)
	local itemCfg = MergerServerCfg.CombineShop.itemList[itemIdx]
	if itemCfg == nil then return end	
	
	-- 物品可能刷新了，跟玩家要买的不一样，所以要校验一下
	if itemCfg.itemId ~= buyItemId then
		Actor.sendTipmsg(sysarg,"物品可能已经刷新了，请您重新打开界面再试下",ttFlyTip)
		return
	end
	
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	if myYb < itemCfg.curPrice then
		SendRecommendTips(sysarg,"1")
		return
	end
	
	local award = {	{type = 0, id = itemCfg.itemId, count = itemCfg.count, bind = itemCfg.bind} }
	
	if not Awards.CheckBagGridCount(sysarg, award) then
		return
	end
	
	if Actor.changeMoney(sysarg, mtYuanbao, -itemCfg.curPrice, GameLog.cCombineShopBuyItemConsume, tostring(itemCfg.itemId)) == false then
		return -- 元宝不足
	end
	
	if Awards.Give(sysarg, award, GameLog.cCombineShopBuyItem, tostring(itemCfg.itemId)) == false then	
		print("BuyCombineShopItem error, actor name = "..Actor.getName(sysarg)..",buyItemId="..buyItemId)
		return
	end
	
	flags = System.setIntBit(flags, idx - 1, true)
	var.days.shopBuyFlags = flags
	
	-- 如果买的是公共物品则保存刷新时间，以便清除购买标志 var.days.shopBuyFlags
	if var.days.shopRefresh == nil then
		var.days.shopRefresh = shopRefresh
	end
	
	SendCombineShopData(sysarg)
end
