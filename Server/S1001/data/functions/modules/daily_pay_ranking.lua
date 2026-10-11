-- 周年庆典唯一每日充值排行，沿用原榜单与奖励。
LocalDT.InitAnniversaryPayRanking = function()
    local svar = System.getStaticVar()
    if svar.daily_pay_ranking_unique_version ~= 1 then
        -- 迁移归属，保留已有榜单和充值金额；退休活动不再单独结算。
        if svar.daily_pay_ranking_year_days == nil and svar.StartOneYear_OpenDay ~= nil and
            svar.isDringOneYearAct ~= nil and svar.isDringOneYearAct >= 1 and
            svar.isDringOneYearAct <= svar.StartOneYear_OpenDay then
            svar.daily_pay_ranking_year_days = svar.StartOneYear_OpenDay - svar.isDringOneYearAct + 1
        end
        svar.daily_pay_ranking_day_data = nil
        svar.daily_pay_ranking_unique_version = 1
    end
    return svar.daily_pay_ranking_year_days or 0
end

function daily_pay_ranking_start(curDay, openNDay, actType)
    if actType ~= 2 or curDay == nil or openNDay == nil or curDay < 1 or curDay > openNDay then return end
    LocalDT.InitAnniversaryPayRanking()
    daily_pay_ranking_ScriptRankingNewDayArrive()
    local svar = System.getStaticVar()
    if (svar.daily_pay_ranking_year_days or 0) == 0 then Ranking.clear_ranking(4, true) end
    svar.daily_pay_ranking_year_days = openNDay - curDay + 1
    System.saveStaticVar()
end

function daily_pay_ranking_end()
    LocalDT.InitAnniversaryPayRanking()
    daily_pay_ranking_ScriptRankingNewDayArrive()
    local svar = System.getStaticVar()
    if (svar.daily_pay_ranking_year_days or 0) > 0 then svar.daily_pay_ranking_year_days = 1 end
    System.saveStaticVar()
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
    local leftDays = LocalDT.InitAnniversaryPayRanking()
    local svar = System.getStaticVar()
    return leftDays > 0 and svar.StartOneYear_OpenDay ~= nil and svar.isDringOneYearAct ~= nil and
        svar.isDringOneYearAct >= 1 and svar.isDringOneYearAct <= svar.StartOneYear_OpenDay
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
	if not daily_pay_ranking_is_open() then return end
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
		local top3tbl = {0,0,0}
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
    if daily_pay_ranking_is_open() then daily_pay_ranking_sync_pay(sysarg) end
end

function daily_pay_ranking_ScriptRankingNewDayArrive()
    local leftDays = LocalDT.InitAnniversaryPayRanking()
    local year, month, day = System.GetSystemTimeInMiniTime(System.getCurrMiniTime())
    local today = System.encodeNumTime(year, month, day, 0, 0, 0)
    local svar = System.getStaticVar()
    if svar.daily_pay_ranking_last_settle_date == nil then
        svar.daily_pay_ranking_last_settle_date = today
        System.saveStaticVar()
        return
    end
    if svar.daily_pay_ranking_last_settle_date >= today then return end
    svar.daily_pay_ranking_last_settle_date = today
    svar.daily_pay_ranking_year_days = leftDays > 1 and leftDays - 1 or nil
    System.saveStaticVar()
    if leftDays <= 0 then return end

	-- 第1名：充值达到 2000000 元宝
	-- 第2名：充值达到 1000000 元宝
	-- 第3名：充值达到 500000 元宝
	-- 4-20名：充值达到 200000 元宝
	
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
					daily_pay_ranking_send_award_to_actor(actorId, value, 4, ranking, 2)
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
				
					daily_pay_ranking_send_award_to_actor(actorId, value, awardIdx, awardIdx, 2)
			end

		end
	end	
	
	print("周年庆典每日充值排行结算完成")
end

function daily_pay_ranking_send_award_to_actor(actorId, value, awardIdx, ranking, actType)
	local awardCfg = SanRenHongLiCfg.DailyPayRanking.awardList[awardIdx]
	if awardCfg == nil then return end
	
	if value < awardCfg.minPay then
		return
	end

    if actType ~= 2 then return end
    local title = "周年庆典每日充值排行"
    local desc = string.format("您在周年庆典每日充值排行活动中，获得第%d名，将获得以下奖品：", ranking)

	System.AddMail(actorId,6,0,title,desc,0,0,awardCfg.mailAward)
		
	print(string.format("[%d] id=%d, yb=%d, award=%d, actType=%d", ranking, actorId, value, awardIdx, actType))
end

registerLuaEventCallback(LuaEventId.ActorPayMoney, daily_pay_ranking_OnActorPayMoney)
registerLuaEventCallback(LuaEventId.ScriptRankingNewDayArrive, daily_pay_ranking_ScriptRankingNewDayArrive)
-- 初始化旧状态迁移，不清除原榜单。
LocalDT.InitAnniversaryPayRanking()
