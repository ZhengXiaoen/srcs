LocalDT.RecurringActivities = {
    {name = "ShenMi", day = "isDringShenMiSD", duration = "SHENMISTORE_openDay", defaultDuration = 3,
        year = "SHENMISTORE_Year", month = "SHENMISTORE_Month", date = "SHENMISTORE_Day",
        token = "StartShenMi_MiNitime", start = "StartShenMiActivity", finish = "EndShenMiActivity",
        packet = "sShenMiShangDianIsOpen", fields = {"day", "duration"}},
    {name = "OneYear", day = "isDringOneYearAct", duration = "StartOneYear_OpenDay", defaultDuration = 7, maxDuration = 7,
        year = "StartOneYear_Year", month = "StartOneYear_Month", date = "StartOneYear_Day",
        token = "StartOneYear_Minitime", start = "StartOneYearActivity", finish = "EndOneYearActivity",
        packet = "sOneYearAct_isOpen", fields = {"duration", "day"}, rankingIndex = 2, consumeRankingIndex = 1},
    {name = "JingJi", day = "isDringJingJi", duration = "JingJiOpenDay", defaultDuration = 3,
        year = "StartJingJIYear", month = "StartJingjiMonth", date = "StartJingJiDay",
        token = "StartJingJi_MiNitime", activityType = "JingJiActivityTypes", defaultType = 2,
        start = "StartJingJi", finish = "EndJingJi",
        packet = "sJingJI_isOpen", fields = {"activityType", "duration", "day"}},
    {name = "EndMonth", day = "isDringEndMonth", duration = "EndMonth_openDay", defaultDuration = 3,
        year = "EMActivityYear", month = "EMActivityMonth", date = "EMActivityDay",
        start = "StartEndMonthActivity", finish = "EndEndMonthActivity",
        packet = "sEndMonthActivityIsOpen", fields = {"day", "duration"}},
}

LocalDT.RecurringMidnight = function(timestamp)
    local year, month, day = System.GetSystemTimeInMiniTime(timestamp)
    return System.encodeNumTime(year, month, day, 0, 0, 0)
end

LocalDT.RecurringScheduledDate = function(svar, config)
    if svar[config.year] ~= nil and svar[config.month] ~= nil and svar[config.date] ~= nil then
        return System.encodeNumTime(svar[config.year], svar[config.month], svar[config.date], 0, 0, 0)
    end
end

LocalDT.SendRecurringActivityDay = function(config, cycle, day)
    local values = {day = day, duration = cycle.duration, activityType = cycle.activityType or 0}
    for _, player in ipairs(LuaHelp.getAllActorList() or {}) do
        local packet = DataPack.allocPacket(player, 151, LogicCmd.miscSysEx.sub[config.packet])
        for _, field in ipairs(config.fields) do
            DataPack.writeByte(packet, values[field])
        end
        DataPack.flush(packet)
    end
end

LocalDT.SyncRecurringRanking = function(svar, config, duration, day)
	if config.consumeRankingIndex ~= nil then
		LocalDT.InitYbConsumeRankingActivities()[config.consumeRankingIndex] = duration - day + 1
	end
    if config.rankingIndex == nil then return end
    if config.rankingIndex == 2 then
        LocalDT.InitAnniversaryPayRanking()
        svar.daily_pay_ranking_year_days = duration - day + 1
    end
end

LocalDT.EnsureRecurringActivity = function(config, today, openDate)
    local svar = System.getStaticVar()
    local cycle = svar.RecurringActivityCycles[config.name]
    local day = tonumber(svar[config.day]) or 0
    local duration = tonumber(config.duration and svar[config.duration]) or (cycle and cycle.duration) or config.defaultDuration
    duration = math.max(1, math.min(math.floor(duration), config.maxDuration or 255))
    local activityType = config.activityType and (svar[config.activityType] or (cycle and cycle.activityType) or config.defaultType)
    if (config.name == "EndMonth" and EndMonthActivityDisabled == true) or
        (config.name == "JingJi" and JingJiCompetitionDisabled == true and activityType ~= 1) then
        if day > 0 then
            _G[config.finish]()
            if config.name == "EndMonth" then EndMonthQuanFuShuangbei_CLOSE() end
        end
        return
    end

    local scheduledDate = LocalDT.RecurringScheduledDate(svar, config)
    local token = config.token and svar[config.token]
    if day > 0 and (cycle == nil or (token ~= nil and token ~= cycle.token)) then
        local startDate
        if token ~= nil and token > 0 then
            startDate = LocalDT.RecurringMidnight(token)
            if startDate == today and day > 1 then startDate = today - (day - 1) * 86400 end
        elseif scheduledDate ~= nil and scheduledDate <= today then
            startDate = scheduledDate
        else
            startDate = today - (day - 1) * 86400
        end
        cycle = {start = math.max(startDate, openDate), duration = duration, activityType = activityType, token = token}
        svar.RecurringActivityCycles[config.name] = cycle
    end

    if day > 0 then
        local elapsedDays = math.floor((today - cycle.start) / 86400)
        if elapsedDays < 0 then return end
        if elapsedDays < cycle.duration then
            local currentDay = elapsedDays + 1
            if day ~= currentDay then
                svar[config.day] = currentDay
                if config.name == "EndMonth" and currentDay >= 2 then EndMonthQuanFuShuangbei_CLOSE() end
                LocalDT.SendRecurringActivityDay(config, cycle, currentDay)
            end
            LocalDT.SyncRecurringRanking(svar, config, cycle.duration, currentDay)
            return
        end
        _G[config.finish]()
        if config.name == "EndMonth" then EndMonthQuanFuShuangbei_CLOSE() end
        cycle.duration, cycle.activityType = duration, activityType
        svar = System.getStaticVar()
    end

    if scheduledDate ~= nil and scheduledDate > today then return end
    local startDate = (cycle and cycle.start) or scheduledDate or (token and LocalDT.RecurringMidnight(token)) or today
    startDate = math.max(startDate, openDate)
    if scheduledDate ~= nil and scheduledDate > startDate then startDate = scheduledDate end
    local elapsedDays = math.floor((today - startDate) / 86400)
    local cycleStart = startDate + math.floor(elapsedDays / duration) * duration * 86400
    local currentDay = elapsedDays % duration + 1
    local year, month, date = System.GetSystemTimeInMiniTime(cycleStart)
    svar[config.year], svar[config.month], svar[config.date] = year, month, date
    if config.dayOnly then
        _G[config.start](currentDay)
    else
        _G[config.start](duration, currentDay, activityType)
    end
    svar = System.getStaticVar()
    svar.RecurringActivityCycles[config.name] = {start = cycleStart, duration = duration,
        activityType = activityType, token = config.token and svar[config.token]}
    if config.name == "EndMonth" and currentDay >= 2 then EndMonthQuanFuShuangbei_CLOSE() end
end

function EnsureRecurringActivities()
    if System.isCrossServer() or System.getCurrMiniTime() < System.getServerOpenTime() then return false end
    local today = LocalDT.RecurringMidnight(System.getCurrMiniTime())
    local openDate = LocalDT.RecurringMidnight(System.getServerOpenTime())
    local svar = System.getStaticVar()
    if svar.daily_pay_ranking_last_settle_date == nil then
        svar.daily_pay_ranking_last_settle_date = today
    elseif svar.daily_pay_ranking_last_settle_date < today then
        daily_pay_ranking_ScriptRankingNewDayArrive()
    end
    if svar.isDringQingDianActivity ~= nil then EndQingDianActivity() end
    if svar.isDringSanRenHongLi ~= nil then EndSanRenHongLi() end
    if svar.isDringDaJiDaLi ~= nil then EndDaJiDaLi() end
    if DisableJingJiCompetition ~= nil then DisableJingJiCompetition() end
    OnYbConsumeRankingNewDayArrive() -- 先结算昨日周年庆典唯一消费榜奖励，再推进或重开活动。
    svar = System.getStaticVar()
    if svar.RecurringActivityCycles == nil then svar.RecurringActivityCycles = {} end
    for _, config in ipairs(LocalDT.RecurringActivities) do
        LocalDT.EnsureRecurringActivity(config, today, openDate)
    end
    EnsureDaJiDaLiActivity()
    EnsureNationalDayActivity()
    ensure_spring_festival_activity(false)
    System.saveStaticVar()
    return true
end

function InitRecurringActivityTimer()
    System.deleteTimer("EnsureDaJiDaLiActivity")
    if not System.hasTimer("EnsureRecurringActivities") then
        System.addTimer("EnsureRecurringActivities", 60 * 1000, -1)
    end
end
