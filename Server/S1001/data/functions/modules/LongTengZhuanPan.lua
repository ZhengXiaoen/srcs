-- 龙腾转盘
--#include "data\config\modules\LongTengZhuanPanCfg.lua" once -- 龙腾转盘配置

-- 获取今天能够转的次数
function LongTengZhuanPan_GetCanTurnTimes(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local pay = var.days.PeyNum
	if not pay then return 0 end
	
	local times = 0
	for i, v in ipairs(LongTengZhuanPanCfg.payGiveTimes) do
		if pay >= v[1] then
			times = times + v[2]
		else
			break
		end
	end
	
	return times
end

-- 最终奖励领完才隐藏入口；跨天清空转盘数据后恢复。
LocalDT.SendLongTengZhuanPanIconState = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local data = var.days.LongTengZhuanPanData
	local step = data and System.getInt64Byte(data.zhuanPanData or 0, 2) or 0
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sLongTengZhuanPan)
	DataPack.writeByte(netPack, 4)
	DataPack.writeByte(netPack, step)
	DataPack.writeByte(netPack, var.LongTengZhuanPanAwardData ~= nil and 1 or 0)
	DataPack.flush(netPack)
end

-- 到达终点后不再有可用次数，兼容已完成的旧数据及后续充值刷新
LocalDT.GetLongTengZhuanPanLeftTimes = function(sysarg, zhuanPanData)
	if System.getInt64Byte(zhuanPanData, 2) >= 50 then
		return 0
	end
	return math.max(0, LongTengZhuanPan_GetCanTurnTimes(sysarg) - System.getInt64Byte(zhuanPanData, 1))
end

function LongTengZhuanPan_GenerateRefreshItems(posListIdx, from, to)
	local posMarks = LongTengZhuanPanCfg.posList[posListIdx]
	local count = 0
	for i = from, to do
		if string.byte(posMarks, i) ~= 48 then -- 48 == '0'
			count = count + 1
		end
	end

	if count == 0 then return "" end
	
	local libIdx = 1
	if from == 1 then
		libIdx = 1
	elseif from == 3 then
		libIdx = 2
	elseif from == 26 then
		libIdx = 3
	elseif from == 50 then
		libIdx = 4
	else
		libIdx = 4
	end

	local itemList = LongTengZhuanPanCfg.itemList[libIdx]
	local itemListCount = #itemList
	local tbl = {}
	for i = 1, itemListCount do
		table.insert(tbl, i)
	end
	
	local itemData = ""
	for i = 1, count do
		local idx = 1
		if itemListCount > 0 then
			local _idx2 = System.getRandomNumber(itemListCount) + 1
			idx = tbl[_idx2]
			table.remove(tbl, _idx2)
			itemListCount = itemListCount - 1
		end
		
		itemData = itemData .. string.char(idx)
	end
	
	return itemData
end

function LongTengZhuanPan_RefreshItems(sysarg)	
	local posListIdx = System.getRandomNumber(#LongTengZhuanPanCfg.posList) + 1
	
	local itemData = ""
	itemData = itemData .. LongTengZhuanPan_GenerateRefreshItems(posListIdx, 1, 2)
	itemData = itemData .. LongTengZhuanPan_GenerateRefreshItems(posListIdx, 3, 25)
	itemData = itemData .. LongTengZhuanPan_GenerateRefreshItems(posListIdx, 26, 49)
	itemData = itemData .. LongTengZhuanPan_GenerateRefreshItems(posListIdx, 50, 50)
		
	local var = Actor.getStaticVar(sysarg)
	if var.days.LongTengZhuanPanData == nil then
		var.days.LongTengZhuanPanData = {}
	end
	
	var.days.LongTengZhuanPanData.zhuanPanData = System.setInt64Byte(0, 0, posListIdx)
	var.days.LongTengZhuanPanData.itemList = itemData
end

-- 下发龙腾转盘数据
function LongTengZhuanPan_SendData(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sLongTengZhuanPan)
	DataPack.writeByte(netPack, 1)	-- 龙腾转盘数据
	
	local var = Actor.getStaticVar(sysarg)
	local data = var.days.LongTengZhuanPanData
	if data == nil or data.itemList == nil then
		LongTengZhuanPan_RefreshItems(sysarg)
		data = var.days.LongTengZhuanPanData
	end
	
	-- 0：随机到的位置索引，1：抽了几次，2：当前步数，3：前25格抽中的物品数，4：后25格抽中的物品数
	local zhuanPanData = 0
	if data ~= nil and data.zhuanPanData ~= nil then
		zhuanPanData = data.zhuanPanData
	end
	
	local zhuanPanFlags = 0 -- 哪个格子领了物品则置1，前端要显示标志
	if data ~= nil and data.zhuanPanFlags ~= nil then
		zhuanPanFlags = data.zhuanPanFlags
	end
	
	local leftTimes = LocalDT.GetLongTengZhuanPanLeftTimes(sysarg, zhuanPanData)
	local curStep = System.getInt64Byte(zhuanPanData, 2)
	-- 从1开始
	if curStep == 0 then curStep = 1 end
		
	DataPack.writeByte(netPack, System.getInt64Byte(zhuanPanData, 0))
	DataPack.writeByte(netPack, leftTimes)	-- 剩余次数
	DataPack.writeByte(netPack, curStep)
	
	local dataItemList = data.itemList
	local itemCount = string.len(dataItemList)
	DataPack.writeByte(netPack, itemCount)
	
	for i = 1, itemCount do
		local itemIdx = string.byte(dataItemList, i)
		DataPack.writeByte(netPack, itemIdx)
	end
	
	DataPack.writeUint64(netPack, zhuanPanFlags)
	
	DataPack.flush(netPack)
	LocalDT.SendLongTengZhuanPanIconState(sysarg)
end

-- 获取龙腾转盘剩余次数，用于界面打开并充值时，改变剩余次数的界面显示
function LongTengZhuanPan_SendLeftTimes(sysarg)	
	
	local var = Actor.getStaticVar(sysarg)
	local data = var.days.LongTengZhuanPanData
	if data == nil or data.zhuanPanData == nil then
		-- 打开界面时，跨天了
		--Actor.sendTipmsg(sysarg, "请重新打开界面", ttFlyTip)
		LocalDT.SendLongTengZhuanPanIconState(sysarg)
		return
	end
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sLongTengZhuanPan)
	DataPack.writeByte(netPack, 3)	-- 龙腾转盘剩余次数
	
	-- 0：随机到的位置索引，1：抽了几次，2：当前步数，3：前25格抽中的物品数，4：后25格抽中的物品数
	local zhuanPanData = data.zhuanPanData	
	
	local leftTimes = LocalDT.GetLongTengZhuanPanLeftTimes(sysarg, zhuanPanData)
	
	DataPack.writeByte(netPack, leftTimes)	-- 剩余次数	
	
	DataPack.flush(netPack)
	LocalDT.SendLongTengZhuanPanIconState(sysarg)
end

-- 返回 0 则失败
function LongTengZhuanPan_GetNextStep(posList, dataItemList, curStep)
	if posList == nil or string.len(posList) < 50 then return 0,0 end
	
	if curStep == 0 then -- 第1次转盘必中
		return 2, string.byte(dataItemList, 1)
	end
	
	if curStep == 50 then -- 走完了
		return 0,0
	end	
	
	local itemCount = 0
	local nextItemPos = 0
	for i = 1, 50 do
		if string.byte(posList, i) ~= 48 then
			if i > curStep then
				nextItemPos = i
				break
			end
			itemCount = itemCount + 1
		end
	end
	
	if nextItemPos == 0 then return 0,0 end
	
	local itemIdx = string.byte(dataItemList, itemCount + 1)
	return nextItemPos, itemIdx
end

function LongTengZhuanPan_GetSlotItemCount(posList, from, to)
	local count = 0
	for i = from, to do
		if string.byte(posList, i) ~= 48 then -- 48 == '0'
			count = count + 1
		end
	end
	return count
end

function LongTengZhuanPan_RandNextStep(posList, dataItemList, curStep, nextItemPos)
	local _to = 0
	if nextItemPos == 50 then -- 最后一个
		_to = 49
	else			
		if (nextItemPos - curStep) < 6 then
			local nextItemPos2, itemIdx2 = LongTengZhuanPan_GetNextStep(posList, dataItemList, nextItemPos)
			if nextItemPos2 == 0 then return curStep + 1 end
		
			_to = nextItemPos2 - 1
		else
			_to = nextItemPos + 1
		end
		
		
	end
	
	if (_to - curStep) > 6 then
		_to = curStep + 6
	end
		
	-- 两个物品之间，至少会隔开一格
	local jumpStep = System.getRandomNumber(_to - curStep) + 1
	local newStep = curStep + jumpStep
	if newStep == nextItemPos then -- 因为没有命中，所以不能跳到物品的格子上
		newStep = nextItemPos + 1
		if (newStep - curStep) > 6 then
			newStep = nextItemPos - 1
		end
	end
	
	return newStep
end

function LongTengZhuanPan_DoRandIsHit(curStep, rate)
	if curStep == 49 then return true end
	
	local rnd = System.getRandomNumber(10000) + 1
	if rnd <= rate then -- 命中
		return true
	end
	
	return false
end

-- 转盘
function LongTengZhuanPan_ZhuanPan(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	if var.LongTengZhuanPanAwardData ~= nil then
		LongTengZhuanPan_GetAward(sysarg) -- 先领取上一次的奖励
		Actor.sendTipmsg(sysarg, "领取上一次转盘奖励成功", ttFlyTip)
		return
	end
	
	local data = var.days.LongTengZhuanPanData
	if data == nil or data.itemList == nil or data.zhuanPanData == nil then
		-- 打开界面时，跨天了
		Actor.sendTipmsg(sysarg, "请重新打开界面", ttFlyTip)
		return -- 需要先请求获取数据
	end
	
	-- 0：随机到的位置索引，1：抽了几次，2：当前步数，3：前25格抽中的物品数，4：后25格抽中的物品数
	local zhuanPanData = data.zhuanPanData
	local posListIdx = System.getInt64Byte(zhuanPanData, 0)
	local doTimes = System.getInt64Byte(zhuanPanData, 1)
	local curStep = System.getInt64Byte(zhuanPanData, 2)
	-- 从1开始
	if curStep == 0 then curStep = 1 end
	
	if curStep >= 50 then -- 走完了
		return
	end
	
	local hitItemCount1 = System.getInt64Byte(zhuanPanData, 3) -- 前25格抽中的物品数
	local hitItemCount2 = System.getInt64Byte(zhuanPanData, 4) -- 后25格抽中的物品数
	
	local leftTimes = LocalDT.GetLongTengZhuanPanLeftTimes(sysarg, zhuanPanData)
	if leftTimes <= 0 then
		Actor.sendTipmsg(sysarg, "当前次数已经用完，请先充值", ttFlyTip)
		return
	end
	
	if Item.getBagEmptyGridCount(sysarg) <= 0 then 
        Actor.sendTipmsg(sysarg,"包裹空间不足！",ttFlyTip)
        return
    end 
	
	local dataItemList = data.itemList	
	local posList = LongTengZhuanPanCfg.posList[posListIdx]
		
	local nextItemPos, itemIdx = LongTengZhuanPan_GetNextStep(posList, dataItemList, curStep)
	if nextItemPos == 0 then return end
	
	local libIdx = 0
	if nextItemPos <= 2 then
		libIdx = 1
	elseif nextItemPos >= 3 and nextItemPos <= 25 then
		libIdx = 2
	elseif nextItemPos >= 26 and nextItemPos <= 49 then
		libIdx = 3
	elseif nextItemPos == 50 then
		libIdx = 4
	end
	
	if libIdx == 0 then return end
	
	if LongTengZhuanPanCfg.itemList[libIdx] == nil then
		return
	end
	
	local awardCfg = LongTengZhuanPanCfg.itemList[libIdx][itemIdx]
	if awardCfg == nil then return end
	
	local isHitItem = false -- 是否抽中物品
	local isFront25 = curStep <= 24 -- 是否在前25格
	
	-- 奖励保底；前25格至少可获得3个道具（包括第2格）；后25格至少可获得2个道具（包括最后1格）
	if isFront25 then
		if hitItemCount1 >= 3 then
			isHitItem = LongTengZhuanPan_DoRandIsHit(curStep, awardCfg[4])
		else
			local leftItem = LongTengZhuanPan_GetSlotItemCount(posList, curStep + 1, 25)
			if (hitItemCount1 + leftItem) > 3 then
				isHitItem = LongTengZhuanPan_DoRandIsHit(curStep, awardCfg[4])
			else
				isHitItem = true
			end
		end
	else
		if hitItemCount2 >= 2 then
			isHitItem = LongTengZhuanPan_DoRandIsHit(curStep, awardCfg[4])
		else
			local leftItem = LongTengZhuanPan_GetSlotItemCount(posList, curStep + 1, 50)
			if (hitItemCount2 + leftItem) > 2 then
				isHitItem = LongTengZhuanPan_DoRandIsHit(curStep, awardCfg[4])
			else
				isHitItem = true
			end
		end		
	end
		
	local newStep = curStep
	if isHitItem then -- 命中
		newStep = nextItemPos
	else
		newStep = LongTengZhuanPan_RandNextStep(posList, dataItemList, curStep, nextItemPos)		
	end
	
	zhuanPanData = System.setInt64Byte(zhuanPanData, 1, doTimes + 1)
	zhuanPanData = System.setInt64Byte(zhuanPanData, 2, newStep)
	
	if isHitItem then		
		if isFront25 then
			zhuanPanData = System.setInt64Byte(zhuanPanData, 3, hitItemCount1 + 1)
		else
			zhuanPanData = System.setInt64Byte(zhuanPanData, 4, hitItemCount2 + 1)
		end
	end
	
	data.zhuanPanData = zhuanPanData
	
	if isHitItem then
		local zhuanPanFlags = 0 -- 哪个格子领了物品则置1，前端要显示标志
		if data ~= nil then
			zhuanPanFlags = data.zhuanPanFlags
			if zhuanPanFlags == nil then zhuanPanFlags = 0 end
		end
		
		zhuanPanFlags = System.setInt64Bit(zhuanPanFlags, nextItemPos - 1, true)
		data.zhuanPanFlags = zhuanPanFlags
	end
	
	if isHitItem then
		local awardData = System.setInt64Byte(0, 0, libIdx)
		awardData = System.setInt64Byte(awardData, 1, itemIdx)
		-- 不要存在 var.days 中，因为抽奖到领奖之间有可以会跨天清空，导致领取不了奖励
		var.LongTengZhuanPanAwardData = awardData	
		
		System.sendCommonLog(LogIds.LongTengZhuanPanTurn,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),doTimes + 1,newStep,libIdx,tostring(itemIdx))
	else
		System.sendCommonLog(LogIds.LongTengZhuanPanTurn,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),doTimes + 1,newStep,0,"")
	end
		
	-- 下发数据
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sLongTengZhuanPan)
	DataPack.writeByte(netPack, 2)	-- 转盘结果
	
	DataPack.writeByte(netPack, LocalDT.GetLongTengZhuanPanLeftTimes(sysarg, zhuanPanData))	-- 剩余次数
	DataPack.writeByte(netPack, newStep) -- 当前步
	DataPack.writeByte(netPack, isHitItem and 1 or 0) -- 是否抽中物品
	DataPack.flush(netPack)	
end

-- 获取奖励
function LongTengZhuanPan_GetAward(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local awardData = var.LongTengZhuanPanAwardData
	if awardData == nil then return end -- 没有奖励可领
	
	local libIdx = System.getInt64Byte(awardData, 0)
	local awardIdx = System.getInt64Byte(awardData, 1)
	
	if LongTengZhuanPanCfg.itemList[libIdx] == nil then
		var.LongTengZhuanPanAwardData = nil
		print(string.format("error, LongTengZhuanPan_GetAward 1,actorId=%d, libIdx=%d, awardIdx=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID), libIdx, awardIdx))
		return
	end
	
	local awardCfg = LongTengZhuanPanCfg.itemList[libIdx][awardIdx]
	if awardCfg == nil then
		var.LongTengZhuanPanAwardData = nil
		print(string.format("error, LongTengZhuanPan_GetAward 2,actorId=%d, libIdx=%d, awardIdx=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID), libIdx, awardIdx))
		return
	end
	
	if Item.getBagEmptyGridCount(sysarg) <= 0 then -- 发邮件
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		local title = "龙腾转盘"
		local desc = "您在龙腾转盘中，将获得以下奖品："
		local mailAward = string.format("%d,%d,%d", awardCfg[1], awardCfg[2], awardCfg[3])
        System.AddMail(actorId,6,0,title,desc,0,0,mailAward)
        
        print(string.format("LongTengZhuanPan_GetAward send mail,actorId=%d, libIdx=%d, awardIdx=%d", Actor.getIntProperty(sysarg,PROP_ENTITY_ID), libIdx, awardIdx))
    else
    	local award = { {type=0, id=awardCfg[1], count=awardCfg[2], bind=awardCfg[3]} }
		if Awards.Give(sysarg,award,LogIds.LongTengZhuanPanAward,"龙腾转盘奖励") == false then
			return
		end
    end 
	
	var.LongTengZhuanPanAwardData = nil	
	LocalDT.SendLongTengZhuanPanIconState(sysarg)
	
	local itemName = Item.getItemName(awardCfg[1])
	local msg = string.format("玩家<(c0xFF00FF00)%s>从龙腾转盘中获取到<(c0xFF00FF00)%s x %d>,运气太好啦！", Actor.getName(sysarg), itemName, awardCfg[2])
	System.broadcastTipmsg(msg, ttScreenCenter+ttChatWindow)
end

function LongTengZhuanPanMain(sysarg, sysid, packet)
	local msgid = DataPack.readByte(packet)
	
	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	if nCircle < 3 then
		Actor.sendTipmsg(sysarg, "转数不足3，未开启此系统", ttFlyTip)
		return
	end
	
	if msgid == 1 then -- 获取龙腾转盘数据
		LongTengZhuanPan_SendData(sysarg)
	elseif msgid == 2 then -- 转盘
		LongTengZhuanPan_ZhuanPan(sysarg)
	elseif msgid == 3 then -- 获取奖励
		LongTengZhuanPan_GetAward(sysarg)
	elseif msgid == 4 then -- 获取龙腾转盘剩余次数，用于界面打开并充值时，改变剩余次数的界面显示
		LongTengZhuanPan_SendLeftTimes(sysarg)
	end
end

-- -- 用于测试
-- -- @func LongTengZhuanPan_clear
-- function LongTengZhuanPan_clear(sysarg)
-- 	local var = Actor.getStaticVar(sysarg)
	
-- 	var.LongTengZhuanPanAwardData = nil	
-- 	var.days.LongTengZhuanPanData = nil	
-- end