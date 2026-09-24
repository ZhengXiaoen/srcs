-- 月度活动 元宝消耗排行榜
--#include "data\functions\ActorEvent\OfflineMsg.lua" once
--#include "data\config\activity\PublicTestCfg.lua" once
--#include "data\functions\Activity\SpringFestivalActivity.lua" once
--#include "data\functions\OldPlayerReturnFunc.lua" once
--#include "data\config\activity\QingDianActivityCfg.lua" once
YbConsumeRanking = {}
YbConsumeRanking_minYb = 0
YbConsumeRanking_isModified = false
YbConsumeRanking_inTime = false

function IsYbConsumeRankingTime()	
	--[[
	if PublicTestCfg.gameIndex ~= 0 and System.GetGameIndex() ~= PublicTestCfg.gameIndex then
		return false -- 月度活动不是该平台laob
	end
		
	local time = PublicTestCfg.time
	return System.isInDateRange(time[1], time[2], time[3], 0, 0, 0, time[4], time[5], time[6], 23, 59, 59)
	--]]
	if is_spring_festival_time() then 
		return true
	end
	
	local svar = System.getStaticVar()
	if (svar.StartOneYear_OpenDay==nil or svar.isDringOneYearAct ==nil or svar.isDringOneYearAct<1 or svar.isDringOneYearAct>svar.StartOneYear_OpenDay)==false then 
		return true
	end
		
	-- 跟庆典活动一起开
	
	if svar.QingDian_openDay==nil then 
		return false
	end
	
	local isDringQingDianActivity = svar.isDringQingDianActivity
	if isDringQingDianActivity == nil or isDringQingDianActivity < 1 or isDringQingDianActivity > svar.QingDian_openDay then 
		return false
	end
	
	return true
end

function YbConsumeRanking_load()		
	YbConsumeRanking = {} -- 清空
	YbConsumeRanking_minYb = 0
	YbConsumeRanking_isModified = false
	YbConsumeRanking_inTime = false
	
	local curTime = System.getCurrMiniTime()
	if curTime <= 0 then -- 如果是lua引擎没有启动完
		print("error, YbConsumeRanking_load curTime <= 0")	
		return
	end 
	
	if not IsYbConsumeRankingTime() then
		return
	end
	
	YbConsumeRanking_inTime = true
	
	-- 定时 3 分钟保存
	System.addTimer("YbConsumeRanking_OnTimer", 3 * 60 * 1000, -1)
		
	print("----------- 开始装载[元宝消耗]排行榜 -----------")		
	
	local file = io.open("data/runtime/ranking/YbConsumeRanking.txt", "r")
	if not file then
		print("没有 [元宝消耗]排行榜 文件：ranking/YbConsumeRanking.txt")
		return
	end
	
	local bom = file:read(3) -- read BOM
	if not bom or string.len(bom) < 3 then
		file:close()
		print("error, 装载 [元宝消耗]排行榜 失败(BOM error)")
		return
	end	

	-- 0:成功并继续解析下一行；1:失败并继续解析下一行；2:旧排行榜数据
	local parseResult = 0

	local line
    local nLoopIndex = 0
	while true do
		line = file:read()
		if not line then break end
		
		parseResult = YbConsumeRanking_parse_line(line, parseResult)
		if parseResult == 1 then
			print("error, YbConsumeRanking_parse_line")
			print(line) -- 把信息打印出来，免得覆盖就没了
		end
		 nLoopIndex = nLoopIndex + 1
        if nLoopIndex > 10000 then
        	System.trace("LoopIndex YbConsumeRanking_load")
        	break
        end
	end

	file:close()
	
	local count = #YbConsumeRanking
	if count == 0 then
		print("装载 [元宝消耗]排行榜 成功, 上榜人数0")
		return
	end
		
	-- 排序，从大到小
	table.sort(YbConsumeRanking, YbConsumeRanking_comps)
	
	if count > 20 then
		for i=count, 21, -1 do
			table.remove(YbConsumeRanking)
		end
		
		count = 20
		YbConsumeRanking_isModified = true
	end
	
	YbConsumeRanking_minYb = YbConsumeRanking[count].yb
	
	print("装载 [元宝消耗]排行榜 成功, 上榜人数"..count)

end

function YbConsumeRanking_save()
	if not YbConsumeRanking_isModified then return end
	
	-- 没有文件则新建，有则清空文件再写		
	local file = io.open("data/runtime/ranking/YbConsumeRanking.txt", "w")
	if not file then
		print("------------ error, open YbConsumeRanking.txt fail")
		return
	end
	
	local curTime = System.getCurrMiniTime() -- 保存时间，以便检查是否跨天
	if curTime <= 0 then
		print("error, YbConsumeRanking_save curTime <= 0")	
		return
	end
	
	local header = "time=" .. tostring(curTime) .. "#ActorId#Yb#ActorName\n"

	file:write(string.format("%c%c%c", 0xEF, 0xBB, 0xBF)) -- write BOM	
	file:write(header) -- 写标题

	local count = 0
	for i, v in ipairs(YbConsumeRanking) do
		if YbConsumeRanking_write_line(file, v) then
			count = count + 1
			if count >= 20 then
				break
			end
		end	
	end
	
	file:close()	
	
	YbConsumeRanking_isModified = false	
	
	if count > 0 then
		YbConsumeRanking_minYb = YbConsumeRanking[count].yb
	else
		YbConsumeRanking_minYb = 0
	end
	
	print("保存 [元宝消耗]排行榜 成功, 上榜人数"..count)
end

-- 排序算法
function YbConsumeRanking_comps(a, b)
	return a.yb > b.yb
end

-- 解析时间，失败返回 0
function YbConsumeRanking_parse_time(line)
	local pos1 = string.find(line, "time=", 1) 
	if not pos1 then return 0 end
	
	local pos2 = string.find(line, '#', pos1 + 5) 
	if not pos2 then return 0 end
	
	local substr = string.sub(line, pos1 + 5, pos2 - 1)
	local time = tonumber(substr)
	return time
end

function YbConsumeRanking_is_old_data(line)	
	local time = YbConsumeRanking_parse_time(line)
	if time <= 0 then return true end	
	
	-- 如果是lua引擎没有启动完
	local curTime = System.getCurrMiniTime()
	if curTime <= 0 then
		print("----- error YbConsumeRanking_is_old_data lua引擎没有启动完")
		return false
	end

	if System.isSameDay(time, curTime) then
		return false
	end

	return true
end

-- 返回值：0:成功并继续解析下一行；1:失败并继续解析下一行；2:旧排行榜数据
function YbConsumeRanking_parse_line(line, lastParseResult)

	if line == "" then return lastParseResult end	
	
	-- ActorId Yb ActorName
	-- 如果玩家名字含有 '\t' 呢？所以这里一个一个分隔
	
	local pos = string.find(line, '\t', 1) 
	if not pos then
		-- 当标题解析
		if YbConsumeRanking_is_old_data(line) then
			return 2
		else
			return 0
		end
	end
	
	if lastParseResult == 2 then -- 旧排行榜数据
		return 2
	end
	
	local substr = string.sub(line, 1, pos - 1)
	local actorId = tonumber(substr)
	if actorId <= 0 then return 1 end
	
	local i = pos + 1
	pos = string.find(line, '\t', i)
	if not pos then return 1 end
	
	substr = string.sub(line, i, pos - 1)
	local _yb = tonumber(substr)
	if _yb <= 0 then return 1 end
	
	-- 剩下的就都是名称
		
	local item = {id=actorId, yb=_yb, name=string.sub(line, pos + 1)}
	
	table.insert(YbConsumeRanking, item)
	return 0
end

function YbConsumeRanking_write_line(file, item)
	if item.id <= 0 or item.yb <= 0 then return false end

	local line = string.format("%d	%d	%s\n", item.id, item.yb, item.name)			
	file:write(line)

	return true
end

function YbConsumeRanking_check_size()
	-- 保险点，重新取数组大小
	local count = #YbConsumeRanking
	if count <= 20 then return end
	
	for i=count, 21, -1 do			
		table.remove(YbConsumeRanking)
	end
	
	count = 20
	YbConsumeRanking_isModified = true	
	YbConsumeRanking_minYb = YbConsumeRanking[count].yb
end


-- 查找插入的位置，返回: 新位置（0则不需要插入），旧位置（0则不在）, 数组大小(新位置不等于0时有效)
function YbConsumeRanking_find_insert_pos(actorId, yb)
	if yb <= 0 then return 0,0,0 end
	
	local newPos = 0
	local oldPos = 0
	local count = 0
	for i, v in ipairs(YbConsumeRanking) do
		if actorId == v.id then
			oldPos = i
		end
		
		if yb > v.yb and newPos == 0 then
			newPos = i
		end
		
		count = count + 1
	end
	
	if count < 20 and newPos == 0 then
		newPos = count + 1
	end
	
	return newPos, oldPos, count
end

-- -----------------------------------------------------

function YbConsumeRanking_FindMyRanking(dayConsumeYB, actorId)
	if not YbConsumeRanking_inTime then return 0 end
	
	if dayConsumeYB < YbConsumeRanking_minYb then
		return 0
	end
	
	local count = 0
	local listCount = #YbConsumeRanking
	local offset_count = 0
	
	local awardList = PublicTestCfg.YbConsumeRanking.awardList
	
	-- 第1名
	if listCount >= 1 then
		local item = YbConsumeRanking[1]
		if item.yb >= awardList[1].minConsume then
			if item.id == actorId then
				return 1
			end
			offset_count = offset_count + 1
		end
		
		count = count + 1		
	end
	
	-- 第2名
	if (listCount - offset_count) >= 1 then
		local item = YbConsumeRanking[offset_count+1]
		if item.yb >= awardList[2].minConsume then
			if item.id == actorId then
				return 2
			end
			offset_count = offset_count + 1		
		end
		
		count = count + 1
	end
	
	-- 第3名
	if (listCount - offset_count) >= 1 then
		local item = YbConsumeRanking[offset_count+1]
		if item.yb >= awardList[3].minConsume then
			if item.id == actorId then
				return 3
			end
			offset_count = offset_count + 1
		end
		
		count = count + 1
	end
	
	-- 第4名以上
	local j = 4
	for i = offset_count+1, listCount do
		local item = YbConsumeRanking[i]
		if item.yb >= awardList[4].minConsume then
			if item.id == actorId then
				return j
			end
			j = j + 1
		end
		count = count + 1
	end
	
	return 0
end

function YbConsumeRanking_SendMyData(sysarg)

	if not YbConsumeRanking_inTime then return end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sPublicTest)
	DataPack.writeByte(netPack, 3) -- S2C_PublicTestMsgId.MyYbRankData
	
	local var = Actor.getStaticVar(sysarg)
	
	local dayConsumeYB = var.dayConsumeYB
	if dayConsumeYB == nil then	dayConsumeYB = 0 end
	
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	
	local ranking = YbConsumeRanking_FindMyRanking(dayConsumeYB, actorId)
			
	DataPack.writeByte(netPack, ranking)	
	DataPack.writeUInt(netPack, dayConsumeYB)
	
	DataPack.flush(netPack)		
	
end

function YbConsumeRanking_SendRankingData(sysarg, rankBegin, count)
	--[[
	if not YbConsumeRanking_inTime then return end
	
	if rankBegin < 1 or rankBegin > 20 or count <= 0 then
		return
	end
		
	local listCount = #YbConsumeRanking
	if (rankBegin + count) > (listCount + 1) then
		count = (listCount + 1) - rankBegin
	end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sPublicTest)
	DataPack.writeByte(netPack, 4) -- S2C_PublicTestMsgId.YbRankData
			
	DataPack.writeByte(netPack, rankBegin)
	DataPack.writeByte(netPack, count)
		
	for i = rankBegin, (rankBegin + count - 1) do
		local v = YbConsumeRanking[i]
		DataPack.writeString(netPack, v.name)
		--DataPack.writeUInt(netPack, v.yb) -- 本活动不显示玩家消耗的元宝数量
	end
		
	DataPack.flush(netPack)
	--]]
	if not YbConsumeRanking_inTime then return end
		
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sPublicTest)
	DataPack.writeByte(netPack, 4) -- S2C_PublicTestMsgId.YbRankData
			
	DataPack.writeByte(netPack, 1) -- 开始索引
	
	local pos = DataPack.getDataPackPos(netPack)	
	
	DataPack.writeByte(netPack, 0)
	local count = 0
	local listCount = #YbConsumeRanking
	local offset_count = 0
	
	local awardList = PublicTestCfg.YbConsumeRanking.awardList
	
	-- 本活动不显示玩家消耗的元宝数量
	-- 第1名
	if listCount >= 1 then
		local item = YbConsumeRanking[1]
		if item.yb >= awardList[1].minConsume then
			DataPack.writeString(netPack, item.name)
			offset_count = offset_count + 1
		else
			DataPack.writeString(netPack, "")
		end
		
		count = count + 1		
	end
	
	-- 第2名
	if (listCount - offset_count) >= 1 then
		local item = YbConsumeRanking[offset_count+1]
		if item.yb >= awardList[2].minConsume then
			DataPack.writeString(netPack, item.name)
			offset_count = offset_count + 1
		else
			DataPack.writeString(netPack, "")
		end
		
		count = count + 1
	end
	
	-- 第3名
	if (listCount - offset_count) >= 1 then
		local item = YbConsumeRanking[offset_count+1]
		if item.yb >= awardList[3].minConsume then
			DataPack.writeString(netPack, item.name)
			offset_count = offset_count + 1
		else
			DataPack.writeString(netPack, "")
		end
		
		count = count + 1
	end
	
	-- 第4到10名
	for i = offset_count+1, listCount do
		if count >= 10 then break end
		
		local item = YbConsumeRanking[i]
		if item.yb >= awardList[4].minConsume then
			DataPack.writeString(netPack, item.name)
		else
			DataPack.writeString(netPack, "")
		end
		count = count + 1
	end
		
	DataPack.writeByteByPtr(netPack, pos, count)
	DataPack.flush(netPack)	
	
end

-- 服务器跨天
function OnYbConsumeRankingNewDayArrive()	
	if not YbConsumeRanking_inTime then
		--[[
		if IsYbConsumeRankingTime() then -- 活动时间到来了
			YbConsumeRanking = {} -- 清空旧数据
			YbConsumeRanking_minYb = 0
			YbConsumeRanking_isModified = true
			YbConsumeRanking_inTime = true
	
			System.addTimer("YbConsumeRanking_OnTimer", 3 * 60 * 1000, -1)
		end
		--]]
		return
	end
				
	-- 活动时间结束
	print("发送元宝消耗排行榜离线邮件")
	
	YbConsumeRanking_sendAwardMails()
	
	YbConsumeRanking = {} -- 清空，避免下次装载到旧数据
	YbConsumeRanking_isModified = true
	YbConsumeRanking_save()		
	
	YbConsumeRanking_minYb = 0
	YbConsumeRanking_isModified = false
	
	YbConsumeRanking_inTime = IsYbConsumeRankingTime()	
		
	
	if YbConsumeRanking_inTime then
		if not System.hasTimer("YbConsumeRanking_OnTimer") then
			System.addTimer("YbConsumeRanking_OnTimer", 3 * 60 * 1000, -1)
		end
	else
		System.deleteTimer("YbConsumeRanking_OnTimer")
		print("元宝消耗排行榜活动 结束")
	end
end

function YbConsumeRanking_OnTimer(leftTimes)
	YbConsumeRanking_save()
end

function YbConsumeRankingConsumeYb(sysarg, totalYb)
	if totalYb <= 0 then return end
	
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)	
		
	local newPos, oldPos, count = YbConsumeRanking_find_insert_pos(actorId, totalYb)
	if newPos == 0 then
		return
	end	

	local actorName = Actor.getName(sysarg)	
	YbConsumeRanking_isModified = true
	
	if newPos == oldPos then
		YbConsumeRanking[oldPos].yb = totalYb		
	else	
		local item = {id=actorId, yb=totalYb, name=actorName}
		table.insert(YbConsumeRanking, newPos, item)
		
		if oldPos > 0 then
			if newPos <= oldPos then
				table.remove(YbConsumeRanking, oldPos + 1)
			else
				table.remove(YbConsumeRanking, oldPos)
			end
		else
			count = count + 1 -- 新增
		end	
	end

	YbConsumeRanking_minYb = YbConsumeRanking[count].yb
		
	-- 删除挤出排行榜的
	if count > 20 then
		YbConsumeRanking_check_size()
	end

	-- 提示
	if newPos ~= oldPos and newPos >= 1 and newPos <= 20 then		
		local msg = string.format("玩家<(c0xFF00FF00)%s>元宝消耗排行第%d！", actorName, newPos)
		System.broadcastTipmsg(msg, ttScreenCenterBigNotice)
	end	
end

function OnRankingConsumeYbEvent(sysarg, nYuanBao)	
  
	if not YbConsumeRanking_inTime then	return end
	
	local var = Actor.getStaticVar(sysarg)
	
	local dayConsumeYB = var.dayConsumeYB
	if dayConsumeYB == nil then
		dayConsumeYB = nYuanBao
	else
		dayConsumeYB = dayConsumeYB + nYuanBao
	end
	
	var.dayConsumeYB = dayConsumeYB

  
	-- 消耗的总元宝数是否可以上榜了？
	if dayConsumeYB < PublicTestCfg.YbConsumeRanking.minConsume then return end

	YbConsumeRankingConsumeYb(sysarg, dayConsumeYB)
		
	
	--(与排行榜无关)-----------------这个是计算庆典活动消费转盘，能够得到多少次转盘机会-------------------------------
--	local dayConsumeYBCanChangeRun = var.dayConsumeYBCanChangeRun
--	if dayConsumeYBCanChangeRun == nil then
--		dayConsumeYBCanChangeRun = nYuanBao
--	else
--		dayConsumeYBCanChangeRun = dayConsumeYBCanChangeRun + nYuanBao
--	end
--	
--	local Yb = QingDianActivityCfg.XiaoFeiZhuanPan.cosumeEveryYB
--	if dayConsumeYBCanChangeRun>=Yb then 
--		local addTime  = math.floor(dayConsumeYBCanChangeRun/Yb)
--		dayConsumeYBCanChangeRun = dayConsumeYBCanChangeRun - addTime*Yb
--		
--		
--		local svar = System.getStaticVar()
--		if svar.StartQDHDtime ==nil or svar.StartQDHDtime==0 then 
--			svar.StartQDHDtime = 1
--		end
--		local StartQDHDtime = svar.StartQDHDtime
--		
--		if var.QD_ZPcount==nil then var.QD_ZPcount ={} end 
--		
--		if var.QD_ZPcount[StartQDHDtime]==nil then 
--			var.QD_ZPcount={} --把之前活动的数据清了
--			var.QD_ZPcount[StartQDHDtime] =0
--		end
--		
--		var.QD_ZPcount[StartQDHDtime] = var.QD_ZPcount[StartQDHDtime] +addTime
--		
--		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
--		DataPack.writeByte(netPack,10)
--		DataPack.writeByte(netPack,1)
--		DataPack.writeInt(netPack,var.QD_ZPcount[StartQDHDtime])
--		DataPack.writeUInt(netPack,dayConsumeYB)
--		
--		DataPack.flush(netPack)
--	
--	end
--	var.dayConsumeYBCanChangeRun = dayConsumeYBCanChangeRun
--	
--	--------------------------这个是计算庆典活动消费转盘，能够得到多少次转盘机会-------------------------------
end

function OnYbConsumeRanking_ActivityStart(startQDHDtime)

	-- 清空数据前，如果是在活动中则先发奖励
	if YbConsumeRanking_inTime ~= nil and YbConsumeRanking_inTime == true then
		print("开始活动前已经有一个活动在开始了。发送元宝消耗排行榜离线邮件")	
		YbConsumeRanking_sendAwardMails()
		
		YbConsumeRanking = {} -- 清空，避免下次装载到旧数据
		YbConsumeRanking_isModified = true
		YbConsumeRanking_save()		
		
		YbConsumeRanking_minYb = 0
		YbConsumeRanking_isModified = false
	end

	YbConsumeRanking = {} -- 清空旧数据
	YbConsumeRanking_minYb = 0
	YbConsumeRanking_isModified = true
	YbConsumeRanking_inTime = true
			
	-- 定时 3 分钟保存
	if not System.hasTimer("YbConsumeRanking_OnTimer") then
		System.addTimer("YbConsumeRanking_OnTimer", 3 * 60 * 1000, -1)
	end
	
	print("庆典活动-消费排名 开始")
end

-- 活动时间结束
function OnYbConsumeRanking_ActivityEnd()
	print("庆典活动-消费排名 结束")
	
	if YbConsumeRanking_inTime then
		YbConsumeRanking_sendAwardMails()
	end
	
	if #YbConsumeRanking ~= 0 then
		YbConsumeRanking = {} -- 清空，避免下次装载到旧数据
		YbConsumeRanking_isModified = true		
	end	
	
	YbConsumeRanking_save()	
	
	YbConsumeRanking_minYb = 0
	YbConsumeRanking_isModified = false
	
	YbConsumeRanking_inTime = false
	
	System.deleteTimer("YbConsumeRanking_OnTimer")
	print("元宝消耗排行榜活动 结束")
end

function YbConsumeRanking_sendAwardMails()
	
	local count = 0
	local listCount = #YbConsumeRanking
	local offset_count = 0
	
	local awardList = PublicTestCfg.YbConsumeRanking.awardList
	
	-- 第1名
	if listCount >= 1 then
		local item = YbConsumeRanking[1]
		if item.yb >= awardList[1].minConsume then
			YbConsumeRanking_sendAwardMailToActor(item.id, 1, 1)
			print("[1] id=" .. item.id .. ",yb=" .. item.yb)
			offset_count = offset_count + 1
		end
		
		count = count + 1		
	end
	
	-- 第2名
	if (listCount - offset_count) >= 1 then
		local item = YbConsumeRanking[offset_count+1]
		if item.yb >= awardList[2].minConsume then
			YbConsumeRanking_sendAwardMailToActor(item.id, 2, 2)
			print("[2],id=" .. item.id .. ",yb=" .. item.yb)
			offset_count = offset_count + 1		
		end
		
		count = count + 1
	end
	
	-- 第3名
	if (listCount - offset_count) >= 1 then
		local item = YbConsumeRanking[offset_count+1]
		if item.yb >= awardList[3].minConsume then
			YbConsumeRanking_sendAwardMailToActor(item.id, 3, 3)
			print("[3],id=" .. item.id .. ",yb=" .. item.yb)
			offset_count = offset_count + 1
		end
		
		count = count + 1
	end
	
	-- 第4名以上
	local j = 4
	for i = offset_count+1, listCount do
		local item = YbConsumeRanking[i]
		if item.yb >= awardList[4].minConsume then
			YbConsumeRanking_sendAwardMailToActor(item.id, 4, j)
			print("[".. j .. "],id=" .. item.id .. ",yb=" .. item.yb)
			j = j + 1
		end
		count = count + 1
	end

end

function YbConsumeRanking_sendAwardMailToActor(actorId, awardIdx, ranking)
	local title = "消费排行"
	local desc = string.format("您在消费排行活动中，获得第%d名，将获得以下奖品：", ranking)
	
	System.AddMail(actorId,6,0,title,desc,0,0,PublicTestCfg.YbConsumeRanking.awardList[awardIdx].mailAward)
	
end


function spring_YbConsumeRanking_activity_start_or_end(is_start, is_started_server)
	if is_start then
		if is_started_server ~= nil and is_started_server == false then -- 不是服务器启动时
			OnYbConsumeRanking_ActivityStart(nil)
		end
	else
		OnYbConsumeRanking_ActivityEnd()
	end
end

register_spring_festival_start_end_func(spring_YbConsumeRanking_activity_start_or_end)

-- 服务器启动或者 @rsf 时重新装载
YbConsumeRanking_load()

-- 给玩家补元宝
function YbCRaddYb(sysarg, name, nYuanBao)
	name = tostring(name)
	nYuanBao = tonumber(nYuanBao)
	
	local pActor = Actor.getActorByName(name)
	if pActor == nil then
		print("命令失败，玩家不在线："..name)
		return
	end
	
	OnRankingConsumeYbEvent(pActor, nYuanBao)
end

function YbCRaddYbById(sysarg, actorId, nYuanBao)
	actorId = tonumber(actorId)
	nYuanBao = tonumber(nYuanBao)
	
	local pActor = System.getEntityPtrByActorID(actorId)
	if pActor == nil then
		print("命令失败，玩家不在线："..actorId)
		return
	end
	
	OnRankingConsumeYbEvent(pActor, nYuanBao)
end