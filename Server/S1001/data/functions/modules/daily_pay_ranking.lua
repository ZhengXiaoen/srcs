-- 活动:每日充值排行榜，散人红利和竞技大赛活动可以同时开启

--[[
--服务器开启触发事件
--更新新版时，可能散人红利或竞技大赛活动正在开启，所以要转为新格式保存，第二次更新后这部分代码可以删除
function daily_pay_ranking_on_server_started()
	local svar = System.getStaticVar()
	local cur_day = svar.daily_pay_ranking_open_day
	if cur_day == nil then return end -- 活动还没有开始，不用转
	
	local open_n_day = svar.daily_pay_ranking_open_n_day
	if open_n_day == nil then
		svar.daily_pay_ranking_open_n_day = 3
		open_n_day = 3
		print("daily_pay_started open_n_day == 3")
	end	
	
	if cur_day > open_n_day then -- 活动结束了
		svar.daily_pay_ranking_open_day = nil
		svar.daily_pay_ranking_open_n_day = nil
		print("daily_pay_started activity end")
		return
	end
	
	local day_data = svar.daily_pay_ranking_day_data
	if day_data == nil then day_data = 0 end
	
	if daily_pay_ranking_isDringSanRenHongLi(svar) then -- 是否是在散人红利活动中
		day_data = System.setIntByte(day_data, 0, open_n_day - cur_day + 1)
		svar.daily_pay_ranking_day_data = day_data		
		
		print("daily_pay_started SanRenHongLi cur_day="..cur_day..",open_n_day="..open_n_day)
	elseif daily_pay_ranking_isDringJingjiActivity(svar) then -- 是否是在竞技活动中
		day_data = System.setIntByte(day_data, 1, open_n_day - cur_day + 1)
		svar.daily_pay_ranking_day_data = day_data		
		
		print("daily_pay_started Jingji cur_day="..cur_day..",open_n_day="..open_n_day)
	else -- 活动还没有开始		
		print("daily_pay_started act end cur_day="..cur_day..",open_n_day="..open_n_day)
	end
	
	svar.daily_pay_ranking_open_day = nil
	svar.daily_pay_ranking_open_n_day = nil

end
--]]

-- 是否是在散人红利活动中
function daily_pay_ranking_isDringSanRenHongLi(svar)
	local openDay = svar.isDringSanRenHongLi
	if openDay == nil or openDay < 1 or openDay > 3 then 
		return false
	end
	
	return true
end

-- 是否是在竞技活动中
function daily_pay_ranking_isDringJingjiActivity(svar)
	if JingJiCompetitionDisabled == true then return false end
	if svar.JingJiOpenDay==nil then return false end
	
	if svar.isDringJingJi ==nil or svar.isDringJingJi<1 or svar.isDringJingJi>svar.JingJiOpenDay then 
		return false
	end
	
	-- 1为圣诞活动中，2为竞技活动中
	local activityType = svar.JingJiActivityTypes
	if activityType ~= nil and activityType == 2 then
		return true
	end
	
	return false
end

-- curDay: 当前是活动的第几天
-- openNDay: 活动共开几天
-- actType: 0散人红利；1竞技大赛；
function daily_pay_ranking_start(curDay, openNDay, actType)
	if JingJiCompetitionDisabled == true and actType == 1 then return end
	if curDay == nil or openNDay == nil or curDay < 1 or curDay > openNDay then
		print("error, daily_pay_ranking_start args error")
		return -- 活动已经结束
	end
	
	if actType ~= 0 and actType ~= 1 then
		print("error, daily_pay_ranking_start actType error")
		return
	end
	
	local leftDay = openNDay - curDay + 1
	if leftDay <= 0 then
		print("error, daily_pay_ranking_start leftDay error")
		return
	end	
	
	local svar = System.getStaticVar()
	-- 因为要在跨天且要发完奖励后才能清除排行榜的数据，避免活动结束时在发奖励之前清数据，所以增加了变量 svar.daily_pay_ranking_day_data
	local day_data = svar.daily_pay_ranking_day_data
	if day_data == nil then day_data = 0 end
	
	-- 如果在活动中则不能清空排行榜的数据
	if day_data == nil or day_data == 0 then
		-- 排行榜先清0
		Ranking.clear_ranking(4, true)
	end				
	
	--散人红利活动新年时候连续开启4次
	--local y,m,d = System.getDate(0, 0, 0)
	--if actType == 0 and 2019 == y and 2 == m and (2 == d or 5 == d or 8 == d or 11 == d) then -- 新年活动中
	--	local oldLeftDay = System.getIntByte(day_data, 0)
	--	day_data = System.setIntByte(day_data, actType, oldLeftDay + leftDay) -- 因为是连续开，可能会排行榜还没跨天，该方法已经调用了
	--	print("每日充值排行榜[新年散人红利活动]剩余"..(oldLeftDay + leftDay).."天")
	--else
		day_data = System.setIntByte(day_data, actType, leftDay)
	--end	
	
	svar.daily_pay_ranking_day_data = day_data		
		
	print("open daily_pay_ranking ok, actType="..actType..",curDay="..curDay..",openNDay="..openNDay)
end

-- 获取前3名的玩家
function daily_pay_ranking_get_top1to3(top3tbl)

	local awardList = SanRenHongLiCfg.DailyPayRanking.awardList
	
	local item_ptr = Ranking.get_ranking_item(4, 0)
	if item_ptr == nil then return end
	
	local value = Ranking.ranking_item_value(item_ptr)
	if value >= awardList[1].minPay then
		top3tbl[1] = Ranking.ranking_item_actorid(item_ptr)
		
		item_ptr = Ranking.get_ranking_item(4, 1)
		if item_ptr == nil then return end		
		value = Ranking.ranking_item_value(item_ptr)
		if value >= awardList[2].minPay then
			top3tbl[2] = Ranking.ranking_item_actorid(item_ptr)
			
			item_ptr = Ranking.get_ranking_item(4, 2)
			if item_ptr == nil then return end		
			value = Ranking.ranking_item_value(item_ptr)
			if value >= awardList[3].minPay then
				top3tbl[3] = Ranking.ranking_item_actorid(item_ptr)
			end
			
		elseif value >= awardList[3].minPay then
			top3tbl[3] = Ranking.ranking_item_actorid(item_ptr)
		end		
	elseif value >= awardList[2].minPay then
		top3tbl[2] = Ranking.ranking_item_actorid(item_ptr)
		
		item_ptr = Ranking.get_ranking_item(4, 1)
		if item_ptr == nil then return end		
		value = Ranking.ranking_item_value(item_ptr)
		if value >= awardList[3].minPay then
			top3tbl[3] = Ranking.ranking_item_actorid(item_ptr)
		end
		
	elseif value >= awardList[3].minPay then
		top3tbl[3] = Ranking.ranking_item_actorid(item_ptr)
	end	
	
end

function daily_pay_ranking_is_open()
	local svar = System.getStaticVar()
	local day_data = svar.daily_pay_ranking_day_data
	if day_data == nil then return false end
	if System.getIntByte(day_data, 0) == 0 and System.getIntByte(day_data, 1) == 0 then
		return false
	end
	return true
end

function daily_pay_ranking_sync_pay(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var == nil then return 0 end
	if var.newdays == nil then var.newdays = {} end

	local pay_yb = 0
	if var.days ~= nil and var.days.PeyNum ~= nil then
		pay_yb = var.days.PeyNum
	end
	var.newdays.daily_pay_ranking_yb = pay_yb

	local awardList = SanRenHongLiCfg.DailyPayRanking.awardList
	local minPay = awardList[4].minPay
	if pay_yb >= minPay and daily_pay_ranking_is_open() then
		Ranking.update_value(4, sysarg, pay_yb)
	end
	return pay_yb
end

-- 下发数据
function daily_pay_ranking_send_data(sysarg)
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSanRenHongLi)
	DataPack.writeByte(netPack,6) -- 6每日充值排行榜
	
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local pay_yb = daily_pay_ranking_sync_pay(sysarg)
	
	-- 我的排名, 从0开始, -1则不进排行榜
	local count, myRank = Ranking.packetRankingItems(netPack, 4, -1, actorId)	
	
	-- 算出真正的排行榜
	if myRank <= -1 or pay_yb < SanRenHongLiCfg.DailyPayRanking.awardList[4].minPay then
		myRank = 0
	else
		top3tbl = {0,0,0}
		daily_pay_ranking_get_top1to3(top3tbl)
		if actorId == top3tbl[1] then
			myRank = 1
		elseif actorId == top3tbl[2] then
			myRank = 2
		elseif actorId == top3tbl[3] then
			myRank = 3
		else
			local offset = 0
			for i=1, 3 do
				if top3tbl[i] == 0 then
					offset = offset + 1
				end
			end				
			
			myRank = myRank + offset + 1
		end		
	end
		
	DataPack.writeByte(netPack, myRank) -- 0 为不上榜
	
	DataPack.writeUInt(netPack, pay_yb)
	
	DataPack.flush(netPack)
end

-- 玩家充值
function daily_pay_ranking_OnActorPayMoney(sysarg, args)
	
	-- 是否在活动时间内
	local svar = System.getStaticVar()
	local day_data = svar.daily_pay_ranking_day_data
	if day_data == nil then return end
	
	-- 活动没有开启
	if System.getIntByte(day_data, 0) == 0 and System.getIntByte(day_data, 1) == 0 then
		return
	end
		
	daily_pay_ranking_sync_pay(sysarg)
end

function daily_pay_ranking_ScriptRankingNewDayArrive()
    local year, month, day = System.GetSystemTimeInMiniTime(System.getCurrMiniTime())
    local today = System.encodeNumTime(year, month, day, 0, 0, 0)
    local svar = System.getStaticVar()
    if svar.daily_pay_ranking_last_settle_date ~= nil and svar.daily_pay_ranking_last_settle_date >= today then return end
    svar.daily_pay_ranking_last_settle_date = today
    System.saveStaticVar()
	if DisableJingJiCompetition ~= nil then
		DisableJingJiCompetition()
	end
	local svar = System.getStaticVar()
	local day_data = svar.daily_pay_ranking_day_data
	if day_data == nil then return end -- 活动还没有开始
	
	-- 几个活动可能同时开启	
	local leftDays = {0,0}
	leftDays[1] = System.getIntByte(day_data, 0)
	leftDays[2] = System.getIntByte(day_data, 1)
	
	local actCount = 0
	if leftDays[1] ~= 0 then
		actCount = actCount + 1
		local leftDay = leftDays[1] - 1
		day_data = System.setIntByte(day_data, 0, leftDay) -- 剩余天数减 1
		print("每日充值排行榜[散人红利]还剩"..leftDay.."天")
	end
	if leftDays[2] ~= 0 then
		actCount = actCount + 1
		local leftDay = leftDays[2] - 1
		day_data = System.setIntByte(day_data, 1, leftDay) -- 剩余天数减 1
		print("每日充值排行榜[竞技大赛]还剩"..leftDay.."天")
	end
		
	if actCount == 0 then -- 所有活动都结束了
		svar.daily_pay_ranking_day_data = nil
		print("每日充值排行榜活动已经结束")
		return
	end
	
	if day_data > 0 then
		svar.daily_pay_ranking_day_data = day_data
	else -- 所有活动都结束了
		svar.daily_pay_ranking_day_data = nil
		print("每日充值排行榜活动已经结束")
	end
	
	print("daily_pay_ranking send award begin actCount="..actCount)
	
	-- 第1名：充值达到 200000 元宝
	-- 第2名：充值达到 100000 元宝
	-- 第3名：充值达到 50000 元宝
	-- 4-20名：充值达到 20000 元宝
	
	local awardList = SanRenHongLiCfg.DailyPayRanking.awardList
	local minPayList = {awardList[1].minPay, awardList[2].minPay, awardList[3].minPay, awardList[4].minPay}

	local awardIdx = 0 -- 1 2 3 4
	local ranking = 0 -- 排在第几名
	local itemCount = Ranking.get_ranking_item_count(4)
	for i = 1, itemCount do
		local item_ptr = Ranking.get_ranking_item(4, i - 1)
		local actorId = Ranking.ranking_item_actorid(item_ptr)
		if actorId > 0 then
			local value = Ranking.ranking_item_value(item_ptr)
			if awardIdx >= 3 or value < minPayList[3] then
				if ranking < 4 then
					ranking = 4
				else
					ranking = ranking + 1
				end
				
				-- 因为123名有可能为空，所以有可能大于20
				if ranking <= 20 then
					if leftDays[1] ~= 0 then
						daily_pay_ranking_send_award_to_actor(actorId, value, 4, ranking, 0)
					end
					if leftDays[2] ~= 0 then
						daily_pay_ranking_send_award_to_actor(actorId, value, 4, ranking, 1)
					end
				end
			else
				if value >= minPayList[1] then
					awardIdx = awardIdx + 1
				elseif value >= minPayList[2] then
					if awardIdx < 2 then
						awardIdx = 2
					else
						awardIdx = awardIdx + 1
					end
				elseif value >= minPayList[3] then
					if awardIdx < 3 then
						awardIdx = 3
					else
						awardIdx = awardIdx + 1
					end
				end
				
				if awardIdx > 4 then awardIdx = 4 end
				
				if leftDays[1] ~= 0 then
					daily_pay_ranking_send_award_to_actor(actorId, value, awardIdx, awardIdx, 0)
				end
				if leftDays[2] ~= 0 then
					daily_pay_ranking_send_award_to_actor(actorId, value, awardIdx, awardIdx, 1)
				end
			end

		end
	end	
	
	print("daily_pay_ranking send award end actCount="..actCount)
end

function daily_pay_ranking_send_award_to_actor(actorId, value, awardIdx, ranking, actType)
	local awardCfg = SanRenHongLiCfg.DailyPayRanking.awardList[awardIdx]
	if awardCfg == nil then return end
	
	if value < awardCfg.minPay then
		return
	end

	local title = "每日充值排行"
	local desc = ""
	if actType == 0 then
		title = "散人红利每日充值排行"
		desc = string.format("您在散人红利每日充值排行活动中，获得第%d名，将获得以下奖品：", ranking)
	elseif actType == 1 then
		title = "竞技大赛每日充值排行"
		desc = string.format("您在竞技大赛每日充值排行活动中，获得第%d名，将获得以下奖品：", ranking)
	end
		
	System.AddMail(actorId,6,0,title,desc,0,0,awardCfg.mailAward)
		
	print(string.format("[%d] id=%d, yb=%d, award=%d, actType=%d", ranking, actorId, value, awardIdx, actType))
end

registerLuaEventCallback(LuaEventId.ActorPayMoney, daily_pay_ranking_OnActorPayMoney)
registerLuaEventCallback(LuaEventId.ScriptRankingNewDayArrive, daily_pay_ranking_ScriptRankingNewDayArrive)
-- 注册服务器启动事件
--registerLuaEventCallback(LuaEventId.ServerStarted, daily_pay_ranking_on_server_started)
