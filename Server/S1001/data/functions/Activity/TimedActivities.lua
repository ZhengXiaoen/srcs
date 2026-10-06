-- 启动时补开正在进行的定时活动，沿用实际启用的定时配置。
LocalDT.LoadTimedActivityTimers = function()
    -- 单独编译配置，避免大表与 GlobalFunction 的顶层局部变量共用寄存器。
    local TimerConfig
--#include "data\config\misc\ScriptTimer.lua" once
    LocalDT.TimedActivityTimers = TimerConfig
end

LocalDT.TimedActivities = {
    {start = "StartActivity_JMZC", finish = "EndActivity_JMZC", state = "jmzcTime"},
    {start = "StartActivity_BGXL", finish = "EndActivity_BGXL", state = "bgxlTime"},
    {start = "StartActivity_wlzb", finish = "EndActivity_wlzb", state = "wlzbTime"},
    {start = "StartActivity_bpbxd", finish = "EndActivity_bpbxd", state = "bpbxdTime"},
    {start = "StartActivity_duobaoqibing", finish = "EndActivity_duobaoqibing", state = "duobaoqibingTime"},
    {start = "onBroadcast_DuoBeiYaSong_Start", finish = "OnBroadcast_DuoBeiYaSong_End", state = "duobeiyabiaoTime"},
    {start = "StartActivity_YBJNH_New", finish = "EndActivity_YBJNH_New", state = "yuanbaojianianhuaTimeNew"},
    {start = "PalaceFighting_Start", finish = "PalaceFighting_End", state = "PalaceFightingStart"},
    {start = "StartActivity_WorldBoss", finish = "EndActivity_WorldBoss", state = "WorldBossStartTime"},
}

LocalDT.TimedActivityMatches = function(values, value)
    if values == nil or #values == 0 then return true end
    for _, candidate in ipairs(values) do
        if candidate == value then return true end
    end
    return false
end

LocalDT.TimedActivityDateMatches = function(timer, month, day)
    return LocalDT.TimedActivityMatches(timer.month, month)
        and LocalDT.TimedActivityMatches(timer.day, day)
        and LocalDT.TimedActivityMatches(timer.week, System.getDayOfWeek())
        and LocalDT.TimedActivityMatches(timer.openserverdays, System.getDaysSinceOpenServer())
        and (timer.notopenserverdays == nil or #timer.notopenserverdays == 0
            or not LocalDT.TimedActivityMatches(timer.notopenserverdays, System.getDaysSinceOpenServer()))
        and LocalDT.TimedActivityMatches(timer.combineserverdays, System.getDaysSinceCombineServer())
        and (timer.notcombineserverdays == nil or #timer.notcombineserverdays == 0
            or not LocalDT.TimedActivityMatches(timer.notcombineserverdays, System.getDaysSinceCombineServer()))
end

LocalDT.TimedActivityWindow = function(config, now)
    local year, month, day = System.GetSystemTimeInMiniTime(now)
    local startTime, endTime
    for _, timer in ipairs(LocalDT.TimedActivityTimers or {}) do
        if timer.npcFunc == config.start and LocalDT.TimedActivityDateMatches(timer, month, day) then
            for _, hour in ipairs(timer.hour or {}) do
                for _, minute in ipairs(timer.minute or {}) do
                    local timestamp = System.encodeNumTime(year, month, day, hour, minute, (timer.second or {})[1] or 0)
                    if timestamp <= now and (startTime == nil or timestamp > startTime) then
                        startTime = timestamp
                    end
                end
            end
        end
    end
    if startTime == nil then return end
    for _, timer in ipairs(LocalDT.TimedActivityTimers or {}) do
        if timer.npcFunc == config.finish and LocalDT.TimedActivityDateMatches(timer, month, day) then
            for _, hour in ipairs(timer.hour or {}) do
                for _, minute in ipairs(timer.minute or {}) do
                    local timestamp = System.encodeNumTime(year, month, day, hour, minute, (timer.second or {})[1] or 0)
                    if timestamp > startTime and (endTime == nil or timestamp < endTime) then
                        endTime = timestamp
                    end
                end
            end
        end
    end
    if endTime ~= nil and now < endTime then return startTime, endTime end
end

function RestoreRunningTimedActivities()
    if System.isCrossServer() == true or System.isCommonServer() == true then return end
    if LocalDT.TimedActivityTimers == nil then LocalDT.LoadTimedActivityTimers() end
    local now = System.getCurrMiniTime()
    local dvar = System.getDyanmicVar()
    dvar.TimedActivitiesRestored = dvar.TimedActivitiesRestored or {}
    for _, config in ipairs(LocalDT.TimedActivities) do
        local startTime, endTime = LocalDT.TimedActivityWindow(config, now)
        if startTime ~= nil and dvar.TimedActivitiesRestored[config.start] ~= startTime
            and (config.state == nil or dvar[config.state] == nil) then
            local callback = _G[config.start]
            if callback ~= nil then
                local ok, message = pcall(callback, nil, startTime, endTime)
                if ok then
                    dvar.TimedActivitiesRestored[config.start] = startTime
                    print("启动恢复定时活动", config.start, endTime - now)
                else
                    System.trace("启动恢复定时活动失败: " .. config.start .. ": " .. tostring(message))
                end
            end
        end
    end
end
