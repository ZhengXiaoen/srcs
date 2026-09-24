-- 屏蔽双蛋活动
--[[
--#include "data\config\activity\DoubleEggCfg.lua" once

DEggMsgS2C = {
	GetData = 1, --获取活动信息
}

-- var.degg.flags
--0:是否领取了每日登录奖励
--1:是否领取了每日寻宝100次奖励
--2:是否领取了每日寻宝200次奖励
--3:是否领取了每日寻宝500次奖励
--4:是否领取了每日充值礼包
--5:是否购买了超值礼包1
--6:是否购买了超值礼包2
--7:是否购买了超值礼包3

-- var.degg.wishFlags 每个物品占5位
--0:是否购买过
--1:许愿是否失败过
--2:第1次许愿
--3:第2次许愿
--4:第3次许愿

function IsDoubleEggTime()	
	local time = DoubleEggCfg.time
	return System.isInDateRange(time[1], time[2], time[3], 0, 0, 0, time[4], time[5], time[6], 23, 59, 59)
end

function GetActorDEggFlag(sysarg, flag)
	if flag < 0 or flag > 31 then
		print("----error! GetActorDEggFlag flag="..flag)
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.degg == nil then return false end
	
	local flags = var.degg.flags
	if flags == nil then return false end
		
	local f = System.getIntBit(flags, flag)
	if (f ~= 0) then return true 
	else return false end
end

function SetActorDEggFlag(sysarg, flag, true_or_false)
	if flag < 0 or flag > 31 then
		print("----error! SetActorDEggFlag flag="..flag)
		return
	end	
	
	local var = Actor.getStaticVar(sysarg)
	
	local flags = 0	
	if var.degg == nil then
		var.degg = {}
	else
		flags = var.degg.flags
		if flags == nil then flags = 0 end
	end
			
	flags = System.setIntBit(flags, flag, true_or_false)
	var.degg.flags = flags
end

function SendDoubleEggData(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sDoubleEgg)
	DataPack.writeByte(netPack, DEggMsgS2C.GetData)	
	
	local sVar = System.getStaticVar()	
	local refreshTime = sVar.DEggRefresh
	local DEggItem1 = sVar.DEggItem1
	local DEggItem2 = sVar.DEggItem2
	
	local var = Actor.getStaticVar(sysarg)
	local degg = var.degg
	
	local flags	
	local buyShop -- 以商店的刷新时间做为购买的商店标识，不同就表示商店刷新了
	local wishFlags
	
	if degg ~= nil then
		flags = degg.flags
		buyShop = degg.buyShop
		wishFlags = degg.wishFlags		
		
		if wishFlags ~= nil then
			if buyShop == nil or refreshTime == nil or buyShop ~= refreshTime then
				-- 如果商店已经刷新则清除上个商店的许愿购买标志
				degg.wishFlags = nil
				wishFlags = nil
			end
		end
	end
	
	DataPack.writeUInt(netPack, flags and flags or 0)
		
	local dmkjTimes = var.days.dmkjTimes
	DataPack.writeUInt(netPack, dmkjTimes and dmkjTimes or 0)
	
	-- -------------- shop	
	DataPack.writeUInt(netPack, refreshTime and refreshTime or 0)
	DataPack.writeUInt(netPack, DEggItem1 and DEggItem1 or 0)
	DataPack.writeUInt(netPack, DEggItem2 and DEggItem2 or 0)	
	
	DataPack.writeUInt(netPack, wishFlags and wishFlags or 0)	
	-- ------------------
	
	DataPack.flush(netPack)
end

-- 领取每日登陆奖励
function GetDEggEveryDayLoginAward(sysarg, packet)		
	local myLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if myLevel < DoubleEggCfg.Login.needLevel then
		Actor.sendTipmsg(sysarg, "您的等级不足" .. DoubleEggCfg.Login.needLevel..",无法领取登陆奖励", ttFlyTip);
		return
	end
	
	if GetActorDEggFlag(sysarg, 0) then
		Actor.sendTipmsg(sysarg, "不能重复领取", ttFlyTip)
		return
	end
	
	if Awards.Give(sysarg, DoubleEggCfg.Login.award, LogIds.DEggEveryDayLoginAward, "") == false then		
		return
	end
	
	SetActorDEggFlag(sysarg, 0, true)
	
	Actor.sendTipmsg(sysarg, "您成功领取了今天的双旦登陆奖励", ttFlyTip)
	SendDoubleEggData(sysarg)
end

-- 领取每日寻宝奖励
function GetDEggEveryDayDmkjAward(sysarg, packet)	
	-- 从1开始
	local idx = DataPack.readByte(packet)
	if idx ~= 1 and idx ~= 2 and idx ~= 3 then return end
	
	local needTimes = DoubleEggCfg.Dmkj.needTimes
	
	local var = Actor.getStaticVar(sysarg)
	local dmkjTimes = var.days.dmkjTimes
	if dmkjTimes == nil or dmkjTimes < needTimes[idx] then
		Actor.sendTipmsg(sysarg, "请您寻宝到 " .. needTimes[idx] .. " 次后再来领取该奖励吧", ttFlyTip)
		return
	end
	
	local flagVals = { 1, 2, 3 }
	if GetActorDEggFlag(sysarg, flagVals[idx]) then
		Actor.sendTipmsg(sysarg, "您已经领取了该奖励", ttFlyTip)
		return
	end
	
	local awardCfg = DoubleEggCfg.Dmkj.items[idx]
	if not awardCfg then return end
	
	if Awards.Give(sysarg, awardCfg, LogIds.DEggEveryDayDmkjAward, tostring(idx)) == false then		
		return
	end
	
	SetActorDEggFlag(sysarg, flagVals[idx], true)
	
	Actor.sendTipmsg(sysarg, "您成功领取了寻宝"..needTimes[idx].."次礼包", ttFlyTip)
	SendDoubleEggData(sysarg)
end

-- 购买超值礼包
function BuyDEggSuperBag(sysarg, packet)
	-- 从1开始
	local idx = DataPack.readByte(packet)
	if idx ~= 1 and idx ~= 2 and idx ~= 3 then return end
	
	local flagVals = { 5, 6, 7 }
	if GetActorDEggFlag(sysarg, flagVals[idx]) then
		Actor.sendTipmsg(sysarg, "您已经购买了该礼包", ttFlyTip)
		return
	end
	
	local cfg = DoubleEggCfg.SuperBag[idx]
	if not cfg then return end
	
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	if myYb < cfg.money then
		SendRecommendTips(sysarg,"1")
		return
	end
	
	if not Awards.CheckBagGridCount(sysarg,cfg.items) then
		return
	end
	
	if Actor.changeMoney(sysarg, mtYuanbao, -cfg.money, LogIds.DEggBuySuperBagConsume, tostring(idx)) == false then
		print("error BuyDEggSuperBag changeMoney actorId="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID)..",idx="..idx)
		return
	end	
	
	if Awards.GiveNoCheck(sysarg,cfg.items,LogIds.DEggBuySuperBag,tostring(idx)) == false then
		print("error BuyDEggSuperBag Awards.Give actorId="..Actor.getIntProperty(sysarg, PROP_ENTITY_ID)..",idx="..idx)
	end
	
	SetActorDEggFlag(sysarg, flagVals[idx], true)
	
	local msg = string.format("玩家<(c0xFF00FF00)%s>花费了<(c0xFF00FF00)%d元宝>购买了超值大礼包", Actor.getName(sysarg), cfg.money)	
	System.broadcastTipmsg(msg, ttScreenCenterBigNotice)
	
	SendDoubleEggData(sysarg)
end

-- 领取每日充值礼包
function GetDEggEveryDayPayGift(sysarg, packet)
	local var = Actor.getStaticVar(sysarg)
	local payNum = var.days.PeyNum
	if not payNum or payNum < DoubleEggCfg.PayGift.needMoney then
		return -- 当天还没有充够钱
	end
	
	if GetActorDEggFlag(sysarg, 4) then
		Actor.sendTipmsg(sysarg, "您已经领取了该礼包", ttFlyTip)
		return
	end	
		
	if Awards.Give(sysarg,DoubleEggCfg.PayGift.award,LogIds.DEggEveryDayPayAward,"") == false then
		return
	end
	
	SetActorDEggFlag(sysarg, 4, true)
	Actor.sendTipmsg(sysarg, "您成功领取了每日充值礼包", ttFlyTip)
	SendDoubleEggData(sysarg)
end

-- 购买或许愿物品
function DEggBuyOrWishItem(sysarg, packet, isBuy)
	-- 许愿的物品索引（1 到 6）
	local idx = DataPack.readByte(packet)
	if idx < 1 or idx > 6 then return end	
	
	-- 用于校验
	local checkItemIdx = DataPack.readByte(packet)
	
	local sVar = System.getStaticVar()	
	local refreshTime = sVar.DEggRefresh
	if refreshTime == nil then return end
	
	local itemIdx = 0
	if idx >= 1 and idx <= 4 then
		itemIdx = System.getIntByte(sVar.DEggItem1, idx - 1)
	else
		itemIdx = System.getIntByte(sVar.DEggItem2, idx - 5)
	end
	
	if itemIdx ~= checkItemIdx then
		Actor.sendTipmsg(sysarg,"物品可能已经刷新了，请您重新打开界面再试下",ttFlyTip)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local degg = var.degg
	
	local buyShop -- 以商店的刷新时间做为购买的商店标识，不同就表示商店刷新了
	local wishFlags
	
	if degg ~= nil then
		buyShop = degg.buyShop
		wishFlags = degg.wishFlags		
		
		if wishFlags ~= nil then
			if buyShop == nil or refreshTime == nil or buyShop ~= refreshTime then
				-- 如果商店已经刷新则清除上个商店的许愿购买标志
				degg.wishFlags = nil
				wishFlags = nil
			end
		end
	end
	
	if wishFlags == nil then wishFlags = 0 end
	
	local bitBegin = 5 * (idx - 1) -- 每个物品占5位
	
	local f = System.getIntBit(wishFlags, bitBegin)
	if f ~= 0 then
		if isBuy then
			Actor.sendTipmsg(sysarg,"刷新时间还没过，不能重复购买同一物品",ttFlyTip)
		else
			Actor.sendTipmsg(sysarg,"您已经购买了该物品，许愿已经没有什么效果了",ttFlyTip)
		end
		
		return
	end
	
	local itemCfg = DoubleEggCfg.Shop.items[itemIdx]
	if itemCfg == nil then return end	
	
	local wishCount = 0
	f = System.getIntBit(wishFlags, bitBegin + 1)
	if f == 0 then -- 没有许愿或者许愿没有失败过
		for i = 2, 4 do -- 第1到第3次许愿
			f = System.getIntBit(wishFlags, bitBegin + i)
			if f == 0 then
				break
			else
				wishCount = wishCount + 1
			end
		end
	else
		if not isBuy then
			Actor.sendTipmsg(sysarg,"该物品您许愿失败过，不允许再许愿了",ttFlyTip)
			return
		end
	end
	
	if isBuy == false and wishCount >= 3 then
		Actor.sendTipmsg(sysarg,"每个物品最多允许有 3 次许愿的机会",ttFlyTip)
		return
	end
	
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	
	local price = 0
	if isBuy then
		price = itemCfg.price
		if wishCount >= 1 and wishCount <= 3 then
			price = math.floor(price * DoubleEggCfg.Shop.wish[wishCount][2] / 10) -- 折扣
			
			if price <= 0 then price = 1 end
		end
	else
		price = DoubleEggCfg.Shop.wish[wishCount + 1][1]
	end
		
	if myYb < price then
		SendRecommendTips(sysarg,"1")
		return
	end
	
	if isBuy then
		local award = {	{type = 0, id = itemCfg.id, count = itemCfg.count, bind = itemCfg.bind} }
		
		if not Awards.CheckBagGridCount(sysarg, award) then
			return
		end
		
		if Actor.changeMoney(sysarg, mtYuanbao, -price, LogIds.DEggBuyItemConsume, tostring(itemCfg.id)) == false then
			return -- 元宝不足
		end
		
		if Awards.GiveNoCheck(sysarg, award, LogIds.DEggBuyItem, tostring(itemCfg.id)) == false then	
			print("DEggBuyOrWishItem Awards.GiveNoCheck error, actor name = "..Actor.getName(sysarg)..",buyItemIdx="..itemIdx)
		end
		
		wishFlags = System.setIntBit(wishFlags, bitBegin, true) -- 设置购买标志
		if var.degg == nil then
			var.degg = {}
		end
		var.degg.wishFlags = wishFlags
			
		-- 保存购买的是哪个商店
		var.degg.buyShop = refreshTime
		
		-- 提示
		local itemName = Item.getItemName(itemCfg.id)
		local msg
		if wishCount == 0 then
			msg = string.format("您以原价：%d元宝 购买了<(c0xFF00ff00)%s>", price, itemName)	
		else
			msg = string.format("您以<(c0xFF00ff00)%d折>的价格：%d元宝 购买了<(c0xFF00ff00)%s>", DoubleEggCfg.Shop.wish[wishCount][2], price, itemName)	
		end	
				
		Actor.sendTipmsg(sysarg,msg,2048)
	else
		if Actor.changeMoney(sysarg, mtYuanbao, -price, LogIds.DEggWishItemConsume, tostring(itemCfg.id)) == false then
			return -- 元宝不足
		end	
		
		local wishSuccess = false
		local rnd = System.getRandomNumber(10000)
		if rnd <= itemCfg.rnd[wishCount + 1] then -- 中		
			wishSuccess = true
			wishFlags = System.setIntBit(wishFlags, bitBegin + 1 + wishCount + 1, true) -- 设置许愿标志
		else
			wishFlags = System.setIntBit(wishFlags, bitBegin + 1, true) -- 设置许愿失败标志
		end
		
		if var.degg == nil then
			var.degg = {}
		end
		var.degg.wishFlags = wishFlags
		
		-- 保存许愿的是哪个商店
		var.degg.buyShop = refreshTime
		
		-- 提示
		local msg
		if wishSuccess then
			local itemName = Item.getItemName(itemCfg.id)
			msg = string.format("您花费了<(c0xFF00ff00)%d元宝>第 %d 次许愿<(c0xFF00ff00)%s>成功", price, wishCount + 1, itemName)		
		else
			msg = "许愿还价失败，恢复原价"
		end
		
		Actor.sendTipmsg(sysarg,msg,2048)
	end
		
	SendDoubleEggData(sysarg)	
end

-- 许愿物品
function WishDEggItem(sysarg, packet)
	DEggBuyOrWishItem(sysarg, packet, false)
end

-- 购买许愿物品
function BuyDEggWishItem(sysarg, packet)
	DEggBuyOrWishItem(sysarg, packet, true)
end

--清除标志
function ClearActorDEggFlags(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.degg == nil then return end
	
	local flags = var.degg.flags
	if flags == nil then return end
		
	for i = 0, 4 do
		flags = System.setIntBit(flags, i, false)
	end
	
	var.degg.flags = flags
end

function OnDEggDmkjTimesChanged(sysarg, dmkjTimes)
	local needTimes = DoubleEggCfg.Dmkj.needTimes
	if dmkjTimes == needTimes[1] or dmkjTimes == needTimes[2] or dmkjTimes == needTimes[3] then
		if IsDoubleEggTime() then
			SendDoubleEggData(sysarg)
		end
	end
end

--登陆
function OnDEggPlayerLogin(sysarg, isCrossDay)
	if not IsDoubleEggTime() then return end
	
	if isCrossDay ~= 0 then
		ClearActorDEggFlags(sysarg) --清除标志
	end
		
	AllActivityButtonState(sysarg,78,1) -- 显示 icon	
end

--在线跨天
function OnDEggPlayerOnlineCrossDay(sysarg)
	if IsDoubleEggTime() then
		ClearActorDEggFlags(sysarg) --清除标志
		
		AllActivityButtonState(sysarg,78,1) -- 显示 icon
	else
		AllActivityButtonState(sysarg,78,0) -- 隐藏 icon			
	end
end

function RandDEggShopItems()		
	local totalCount = #DoubleEggCfg.Shop.items
	if totalCount > 255 then totalCount = 255 end
	
	local items = {0,0,0,0,0,0}
	local i = 1
	while true do
		local item_idx = System.getRandomNumber(totalCount) + 1
		if item_idx >= 1 and item_idx <= 255 then
			if item_idx ~= items[1] and item_idx ~= items[2] and item_idx ~= items[3] and item_idx ~= items[4] and item_idx ~= items[5] then
				items[i] = item_idx
				i = i + 1
				if i >= 7 then
					break
				end
			end
		end
	end
	
	local itemsValue1 = 0
	local itemsValue2 = 0
	for i = 1, 4 do
		itemsValue1 = System.setIntByte(itemsValue1, i - 1, items[i])
	end
	
	itemsValue2 = System.setIntByte(itemsValue2, 0, items[5])
	itemsValue2 = System.setIntByte(itemsValue2, 1, items[6])
	
	return itemsValue1, itemsValue2
end

-- 双蛋活动刷新物品
function OnDEggActivityRefreshItems(isStartServer)
	if not IsDoubleEggTime() then
		return
	end
	
	local sVar = System.getStaticVar()	
	local refreshTime = sVar.DEggRefresh	
	local curTime = System.getCurrMiniTime()
	
	if isStartServer ~= nil and isStartServer == true then -- 是启动服务器
		if refreshTime ~= nil then
			local diffTime = curTime - refreshTime
			if diffTime > 0 and diffTime < (1 * 3600) then -- 没有过1个小时则不刷新物品	
				return
			end
		end
	end
	
	-- 刷新物品
	local nYear,nMonth,nDay,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(curTime)
		
	local h = nHour
	
	refreshTime = System.encodeNumTime(nYear,nMonth,nDay,h,0,0)	
	sVar.DEggRefresh = refreshTime -- 双蛋商店刷新时间
	
	local itemsValue1, itemsValue2 = RandDEggShopItems()
	sVar.DEggItem1 = itemsValue1
	sVar.DEggItem2 = itemsValue2
	
	print("------双蛋活动刷新物品-------- itemsValue1="..itemsValue1..",itemsValue2="..itemsValue2)
end

-- 客户端消息-双蛋(圣诞 元旦)
function OnMsgDoubleEgg(sysarg, sysid, packet)

	if sysid ~= LogicCmd.miscSys.sub.cChristmasAndNewYear then
		print("error OnMsgDoubleEgg, sysid="..sysid)
		return
	end
	
	if not IsDoubleEggTime() then
		return
	end
	
	local msgId = DataPack.readByte(packet)
		
	if msgId == 1 then -- 获取活动信息
		SendDoubleEggData(sysarg)
	elseif msgId == 2 then -- 领取每日登陆奖励
		GetDEggEveryDayLoginAward(sysarg, packet)
	elseif msgId == 3 then -- 领取每日寻宝奖励
		GetDEggEveryDayDmkjAward(sysarg, packet)
	elseif msgId == 4 then -- 购买超值礼包
		BuyDEggSuperBag(sysarg, packet)
	elseif msgId == 5 then -- 领取每日充值礼包
		GetDEggEveryDayPayGift(sysarg, packet)
	elseif msgId == 6 then -- 许愿物品
		WishDEggItem(sysarg, packet)
	elseif msgId == 7 then -- 购买许愿物品
		BuyDEggWishItem(sysarg, packet)
	else
		print("error OnMsgDoubleEgg, unknown msgId="..msgId)
		return
	end

end

--]]