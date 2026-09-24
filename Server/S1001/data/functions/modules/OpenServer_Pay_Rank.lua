-- 开服活动充值排行榜。结算日志是榜期和奖励投递状态的持久记录。

local sRankName = "pay_rank"
local sRankFile = "data/runtime/rank/pay_rank.txt"
local sJournalFile = "data/runtime/rank/pay_rank_settlement.log"
local sTimerName = "Pay_Rank_OnTimer"

local award =
{
    {item_id = 391, count = 2, bind = 1}, -- 第一名
    {item_id = 391, count = 1, bind = 1},
    {item_id = 378, count = 1, bind = 1},
    {item_id = 377, count = 2, bind = 1},
    {item_id = 377, count = 2, bind = 1},
    {item_id = 376, count = 5, bind = 1},
    {item_id = 376, count = 5, bind = 1},
    {item_id = 376, count = 5, bind = 1},
    {item_id = 376, count = 5, bind = 1},
    {item_id = 376, count = 5, bind = 1},
}

local function rank_new_state()
    return {
        loaded = false, known = false, healthy = true, error = nil, generation = 0,
        nextEventId = 0, seenEvents = {}, active = nil,
        resolvedCaptures = {}, maxCaptureId = 0,
        totals = {}, names = {}, top = {}, imported = {},
        settlements = {}, viewOK = false, delivering = false,
    }
end

local rankState = rank_new_state()
local rankReady = false
-- Keep unrecorded payments through a script reload in the same process.
local rankDeferred = Pay_Rank_DeferredUpdates or {}
Pay_Rank_DeferredUpdates = rankDeferred
local rankUnassigned = Pay_Rank_UnassignedUpdates or {}
Pay_Rank_UnassignedUpdates = rankUnassigned
Pay_Rank_CaptureSeq = Pay_Rank_CaptureSeq or 0
Pay_Rank_PendingStop = Pay_Rank_PendingStop or false

local function rank_log(message)
    print("[Pay_Rank] " .. tostring(message))
end

local function rank_timer()
    if not System.hasTimer(sTimerName) then
        System.addTimer(sTimerName, 3 * 60 * 1000, -1)
    end
end

local function rank_int(value, minimum)
    local number = tonumber(value)
    if not number or number ~= math.floor(number) or (minimum and number < minimum) then
        return nil
    end
    return number
end

local function rank_split(value, separator)
    local parts, from = {}, 1
    while true do
        local at = string.find(value, separator, from, true)
        if not at then
            table.insert(parts, string.sub(value, from))
            return parts
        end
        table.insert(parts, string.sub(value, from, at - 1))
        from = at + #separator
    end
end

local function rank_hex(value)
    local result = {}
    value = tostring(value or "")
    for i = 1, #value do
        result[i] = string.format("%02X", string.byte(value, i))
    end
    return table.concat(result)
end

local function rank_unhex(value)
    if #value % 2 ~= 0 or string.find(value, "[^0-9A-Fa-f]") then return nil end
    return (string.gsub(value, "..", function(pair)
        return string.char(tonumber(pair, 16))
    end))
end

local function rank_insert_top(state, actorId, total)
    local top, oldPosition = state.top, nil
    for i = 1, #top do
        if top[i].id == actorId then
            oldPosition = i
            table.remove(top, i)
            break
        end
    end
    local position = #top + 1
    for i = 1, #top do
        if total > top[i].total or (total == top[i].total and actorId < top[i].id) then
            position = i
            break
        end
    end
    if position <= #award then
        table.insert(top, position, {id = actorId, total = total})
        if #top > #award then table.remove(top) end
    end
    return oldPosition ~= nil or position <= #award
end

local function rank_apply_score(state, actorId, amount, name)
    local total = (state.totals[actorId] or 0) + amount
    state.totals[actorId], state.names[actorId] = total, name
    return rank_insert_top(state, actorId, total)
end

local function rank_board_rows(rows)
    local result = {}
    for _, item in ipairs(rows) do
        table.insert(result, table.concat({item.id, item.total, rank_hex(item.name)}, ","))
    end
    return table.concat(result, ";")
end

local function rank_parse_board_rows(value)
    if value == "" then return {} end
    local rows, seen = {}, {}
    for _, row in ipairs(rank_split(value, ";")) do
        local fields = rank_split(row, ",")
        assert(#fields == 3, "invalid board row")
        local actorId, total = rank_int(fields[1], 1), rank_int(fields[2], 1)
        local name = rank_unhex(fields[3])
        assert(actorId and total and name and not seen[actorId], "invalid board data")
        seen[actorId] = true
        table.insert(rows, {id = actorId, total = total, name = name})
        assert(#rows <= #award, "legacy board exceeds rank size")
    end
    return rows
end

local function rank_settlement_rows(rows)
    local result = {}
    for _, item in ipairs(rows) do
        table.insert(result, table.concat({
            item.id, item.ranking, item.total, rank_hex(item.name),
            item.packedAward, item.status,
        }, ","))
    end
    return table.concat(result, ";")
end

local function rank_parse_settlement_rows(value, count)
    assert(count >= 0 and count <= #award, "invalid recipient count")
    if count == 0 then
        assert(value == "", "unexpected recipient data")
        return {}
    end
    local result, seen = {}, {}
    local rows = rank_split(value, ";")
    assert(#rows == count, "recipient count mismatch")
    for _, row in ipairs(rows) do
        local fields = rank_split(row, ",")
        assert(#fields == 6, "invalid recipient row")
        local actorId = rank_int(fields[1], 1)
        local ranking = rank_int(fields[2], 1)
        local total = rank_int(fields[3], 1)
        local name = rank_unhex(fields[4])
        local packedAward = rank_int(fields[5])
        local status = fields[6]
        assert(actorId and ranking and ranking <= #award and total and name
            and packedAward and not seen[actorId], "invalid recipient data")
        assert(status == "pending" or status == "unknown", "invalid initial mail status")
        seen[actorId] = true
        table.insert(result, {id = actorId, ranking = ranking, total = total,
            name = name, packedAward = packedAward, status = status,
            detail = status == "unknown" and "legacy delivery history requires reconciliation" or ""})
    end
    return result
end

local function rank_recipient(settlement, actorId)
    for _, item in ipairs(settlement.recipients) do
        if item.id == actorId then return item end
    end
    return nil
end

-- O opens a period, U records credit, E closes input, S freezes awards.
-- I is durable mail intent. R records a native result or a manual decision.
-- A/Q audit an operator's decision for a payment captured during recovery.
-- An I without a confirmed R is unknown and never automatically resent.
local function rank_read_journal()
    local file, openError, errorCode = io.open(sJournalFile, "r")
    if not file then
        assert(errorCode == 2, "cannot read settlement journal: " .. tostring(openError))
        return false
    end
    local data = file:read("*a")
    assert(file:close(), "cannot close settlement journal")
    assert(data and data ~= "" and string.sub(data, -1) == "\n",
        "incomplete settlement journal; inspect before recovery")
    local restored = rank_new_state()
    for rawLine in string.gmatch(data, "([^\n]+)\n") do
        local line = string.gsub(rawLine, "\r$", "")
        local f = rank_split(line, "\t")
        if f[1] == "M" then
            assert(#f == 2 and rank_int(f[2], 1), "invalid migration marker")
        elseif f[1] == "O" then
            assert(#f == 6 and not restored.active, "invalid open record")
            local period = rank_int(f[2], 1)
            local round = rank_int(f[3], 0)
            local startedAt = rank_int(f[4], 1)
            local mode = f[5]
            assert(period == restored.generation + 1 and round and startedAt
                and (mode == "new" or mode == "legacy_active" or mode == "legacy_orphan"),
                "invalid period")
            local rows = rank_parse_board_rows(f[6])
            restored.generation = period
            restored.active = {period = tostring(period), round = round,
                startedAt = startedAt, mode = mode, closing = false}
            for _, item in ipairs(rows) do
                restored.totals[item.id], restored.names[item.id] = item.total, item.name
                restored.imported[item.id] = true
                rank_insert_top(restored, item.id, item.total)
            end
        elseif f[1] == "U" then
            assert(#f == 6 and restored.active and not restored.active.closing
                and f[2] == restored.active.period, "invalid credit record")
            local eventId = rank_int(f[3], 1)
            local actorId = rank_int(f[4], 1)
            local amount = rank_int(f[5], 1)
            local name = rank_unhex(f[6])
            assert(eventId and eventId > restored.nextEventId
                and actorId and amount and name, "invalid credit data")
            restored.nextEventId, restored.seenEvents[eventId] = eventId, true
            rank_apply_score(restored, actorId, amount, name)
        elseif f[1] == "A" then
            assert(#f == 9 and restored.active
                and f[2] == restored.active.period, "invalid manual credit")
            local eventId, captureId = rank_int(f[3], 1), rank_int(f[4], 1)
            local actorId, amount = rank_int(f[5], 1), rank_int(f[6], 1)
            local occurredAt = rank_int(f[7], 1)
            local name, note = rank_unhex(f[8]), rank_unhex(f[9])
            assert(eventId and eventId > restored.nextEventId and captureId
                and actorId and amount and occurredAt and name and note
                and note ~= "" and not restored.resolvedCaptures[captureId],
                "invalid manual credit data")
            restored.nextEventId, restored.seenEvents[eventId] = eventId, true
            restored.resolvedCaptures[captureId] = "applied"
            restored.maxCaptureId = math.max(restored.maxCaptureId, captureId)
            rank_apply_score(restored, actorId, amount, name)
        elseif f[1] == "E" then
            assert(#f == 3 and restored.active and not restored.active.closing
                and f[2] == restored.active.period, "invalid close record")
            restored.active.endedAt = rank_int(f[3], 1)
            assert(restored.active.endedAt, "invalid close time")
            restored.active.closing = true
        elseif f[1] == "S" then
            assert(#f == 5 and restored.active and restored.active.closing
                and f[2] == restored.active.period, "invalid settlement record")
            local endedAt, count = rank_int(f[3], 1), rank_int(f[4], 0)
            assert(endedAt and count and endedAt == restored.active.endedAt,
                "invalid settlement header")
            local recipients = rank_parse_settlement_rows(f[5], count)
            assert(count == #restored.top, "settlement does not match board")
            local topIds = {}
            for _, top in ipairs(restored.top) do topIds[top.id] = true end
            for _, item in ipairs(recipients) do
                assert(topIds[item.id] and restored.totals[item.id] == item.total,
                    "settlement score does not match credit")
            end
            restored.settlements[f[2]] = {
                period = f[2], round = restored.active.round,
                startedAt = restored.active.startedAt, endedAt = endedAt,
                mode = restored.active.mode, recipients = recipients,
            }
            restored.active = nil
            restored.totals, restored.names, restored.top, restored.imported = {}, {}, {}, {}
        elseif f[1] == "I" then
            assert(#f == 3 and restored.settlements[f[2]], "invalid mail intent")
            local item = rank_recipient(restored.settlements[f[2]], rank_int(f[3], 1))
            assert(item and (item.status == "pending" or item.status == "failed"),
                "duplicate or invalid mail intent")
            item.status, item.detail = "unknown", "interrupted after durable mail intent"
        elseif f[1] == "R" then
            assert(#f == 5 and restored.settlements[f[2]], "invalid mail result")
            local item = rank_recipient(restored.settlements[f[2]], rank_int(f[3], 1))
            local detail = rank_unhex(f[5])
            assert(item and detail and item.status == "unknown"
                and (f[4] == "sent" or f[4] == "failed" or f[4] == "unknown"),
                "invalid mail resolution")
            item.status, item.detail = f[4], detail
        elseif f[1] == "Q" then
            assert(#f == 10, "invalid manual payment review")
            local captureId, actorId = rank_int(f[2], 1), rank_int(f[3], 1)
            local amount, occurredAt = rank_int(f[4], 1), rank_int(f[5], 1)
            local observedPeriod = f[6] == "-" or rank_int(f[6], 1)
            local observedRound = f[7] == "-" or rank_int(f[7], 1)
            local observedStart = f[8] == "-" or rank_int(f[8], 1)
            local name, note = rank_unhex(f[9]), rank_unhex(f[10])
            assert(captureId and actorId and amount and occurredAt
                and observedPeriod and observedRound and observedStart
                and name and note and note ~= ""
                and not restored.resolvedCaptures[captureId],
                "invalid manual payment review data")
            restored.resolvedCaptures[captureId] = "handled"
            restored.maxCaptureId = math.max(restored.maxCaptureId, captureId)
        else
            error("unknown settlement journal record")
        end
    end
    restored.loaded = true
    restored.known = true
    rankState = restored
    return true
end

local function rank_append(record)
    if not rankState.healthy then return false end
    local file, openError = io.open(sJournalFile, "a")
    if not file then
        rankState.error = "journal open failed: " .. tostring(openError)
        rank_log(rankState.error .. "; payment or settlement remains pending")
        rank_timer()
        return false
    end
    local ok, err = pcall(function()
        assert(file:write(record .. "\n"))
        assert(file:flush())
        assert(file:close())
    end)
    if not ok then
        pcall(function() file:close() end)
        rankState.healthy, rankState.loaded = false, false
        rankState.error = "journal write outcome uncertain: " .. tostring(err)
        rank_log(rankState.error)
        rank_timer()
        return false
    end
    rankState.error = nil
    return true
end

local function rank_rebuild_view()
    local pRank = Ranking.getRanking(sRankName)
    if not pRank then
        rankState.viewOK = false
        rank_log("native ranking unavailable")
        return false
    end
    local ok, err = pcall(function()
        Ranking.clearRanking(pRank)
        for _, top in ipairs(rankState.top) do
            local item = Ranking.addItem(pRank, top.id, top.total)
            assert(item, "native ranking rejected a top item")
            Ranking.setSub(item, 0, tostring(top.id))
            Ranking.setSub(item, 1, rankState.names[top.id] or "")
        end
    end)
    rankState.viewOK = ok
    if not ok then rank_log("native ranking rebuild failed: " .. tostring(err)) end
    return ok
end

local function rank_save_native()
    local pRank = Ranking.getRanking(sRankName)
    if not pRank then return end
    local ok, result = pcall(Ranking.save, pRank, sRankFile)
    if not ok or result == false then
        rank_log("native ranking backup failed: " .. tostring(result))
    end
end

local function rank_sync_flags()
    local svar = System.getStaticVar()
    local active = rankState.active
    if active and not active.closing and active.mode ~= "legacy_orphan" then
        svar.pay_ranking = active.startedAt
        svar.pay_rank_index = active.round
        svar.pay_rank_minitime = active.startedAt
        svar.pay_rank_period = active.period
    else
        svar.pay_ranking = nil
        svar.pay_rank_index = 0
        svar.pay_rank_minitime = nil
        svar.pay_rank_period = nil
    end
    svar.pay_rank_journal_initialized = 1
end

local function rank_native_rows()
    local pRank = Ranking.getRanking(sRankName)
    assert(pRank, "native ranking unavailable")
    local result, seen = {}, {}
    for i = 1, #award do
        local item = Ranking.getItemFromIndex(pRank, i - 1)
        if item then
            local actorId = rank_int(Ranking.getSub(item, 0), 1)
                or rank_int(Ranking.getId(item), 1)
            local total = rank_int(Ranking.getPoint(item), 1)
            assert(actorId and total and not seen[actorId], "invalid legacy rank item")
            seen[actorId] = true
            table.insert(result, {id = actorId, total = total,
                name = Ranking.getSub(item, 1) or ""})
        end
    end
    return result
end

local function rank_snapshot()
    assert(rankState.viewOK, "ranking view is not rebuilt")
    local pRank = Ranking.getRanking(sRankName)
    assert(pRank, "native ranking unavailable")
    local result, seen = {}, {}
    for i = 1, #rankState.top do
        local item = Ranking.getItemFromIndex(pRank, i - 1)
        assert(item, "native ranking is shorter than credit board")
        local actorId = rank_int(Ranking.getSub(item, 0), 1)
            or rank_int(Ranking.getId(item), 1)
        local total = rank_int(Ranking.getPoint(item), 1)
        assert(actorId and total and rankState.totals[actorId] == total
            and not seen[actorId], "native ranking differs from credit board")
        seen[actorId] = true
        local packedAward = 0
        packedAward = System.setInt2Byte(packedAward, true, award[i].count)
        packedAward = System.setInt2Byte(packedAward, false, award[i].item_id)
        assert(rank_int(packedAward), "invalid packed reward")
        local unknown = rankState.active.mode == "legacy_orphan"
            or rankState.imported[actorId] == true
        table.insert(result, {
            id = actorId, ranking = i, total = total,
            name = Ranking.getSub(item, 1) or rankState.names[actorId] or "",
            packedAward = packedAward,
            status = unknown and "unknown" or "pending",
            detail = unknown and "legacy delivery history requires reconciliation" or "",
        })
    end
    return result
end

local function rank_retry_pending()
    if not rankState.loaded or not rankState.healthy or rankState.delivering then return false end
    rankState.delivering = true
    local periods = {}
    for period in pairs(rankState.settlements) do table.insert(periods, period) end
    table.sort(periods, function(a, b) return tonumber(a) < tonumber(b) end)
    for _, period in ipairs(periods) do
        local settlement = rankState.settlements[period]
        for _, item in ipairs(settlement.recipients) do
            if item.status == "pending" or item.status == "failed" then
                if not rank_append(table.concat({"I", period, item.id}, "\t")) then
                    rankState.delivering = false
                    return false
                end
                item.status, item.detail = "unknown", "mail intent recorded"
                local body = "开服活动,充值排行第" .. item.ranking
                    .. "名奖励,只要按一键提取就可以领取奖品."
                local ok, result = pcall(System.AddMail, item.id, 6, 0,
                    "开服活动充值排行奖励", body, item.packedAward, 0)
                local status = "unknown"
                if ok and result == true then
                    status = "sent"
                elseif ok and result == false then
                    status = "failed"
                end
                local detail = ok and ("return=" .. tostring(result))
                    or ("error=" .. tostring(result))
                if rank_append(table.concat({
                    "R", period, item.id, status, rank_hex(detail),
                }, "\t")) then
                    item.status, item.detail = status, detail
                end
                if item.status == "unknown" then
                    rank_log("mail needs reconciliation: period=" .. period
                        .. ", actor=" .. item.id .. ", " .. item.detail)
                end
                if not rankState.loaded then
                    rankState.delivering = false
                    return false
                end
            end
        end
    end
    rankState.delivering = false
    return true
end

local function rank_flush_deferred()
    if not rankState.loaded or not rankState.healthy then return false end
    while #rankDeferred > 0 do
        local item = rankDeferred[1]
        if rankState.seenEvents[item.eventId] then
            if item.capture then item.capture.recorded = true end
            table.remove(rankDeferred, 1)
        else
            local active = rankState.active
            if Pay_Rank_PendingStart
                and item.period == tostring(rankState.generation + 1) then
                -- The next period has not been opened durably yet.
                return true
            end
            if not active or active.closing or active.period ~= item.period then
                rank_log("unrecorded payment needs reconciliation: event="
                    .. tostring(item.eventId) .. ", period=" .. tostring(item.period))
                return false
            end
            local record = table.concat({
                "U", item.period, item.eventId, item.id, item.amount, rank_hex(item.name),
            }, "\t")
            if not rank_append(record) then return false end
            rankState.nextEventId = math.max(rankState.nextEventId, item.eventId)
            rankState.seenEvents[item.eventId] = true
            local topChanged = rank_apply_score(rankState, item.id, item.amount, item.name)
            if item.capture then item.capture.recorded = true end
            table.remove(rankDeferred, 1)
            if topChanged then rank_rebuild_view() end
        end
    end
    return true
end

-- Journal recovery can fail before the period is known. Capture the payment
-- first, then credit it only when the recovered period proves its owner.
local function rank_capture_unassigned(actorId, name, amount)
    local svar = System.getStaticVar()
    local active = rankState.known and rankState.active or nil
    local period = active and active.period or rank_int(svar.pay_rank_period, 1)
    local pendingRound = rank_int(Pay_Rank_PendingStart, 1)
    Pay_Rank_CaptureSeq = Pay_Rank_CaptureSeq + 1
    local item = {
        captureId = Pay_Rank_CaptureSeq, id = actorId,
        amount = amount, name = name,
        occurredAt = rank_int(System.getCurrMiniTime(), 0) or 0,
        observedPeriod = period and tostring(period) or nil,
        observedRound = active and active.round or rank_int(svar.pay_rank_index, 1),
        observedStartedAt = active and active.startedAt
            or rank_int(svar.pay_rank_minitime, 1)
            or rank_int(svar.pay_ranking, 1),
        stopRequested = Pay_Rank_PendingStop == true,
        observedOpen = not Pay_Rank_PendingStop
            and ((active and not active.closing) or svar.pay_ranking ~= nil),
        pendingRound = pendingRound,
        pendingPeriod = pendingRound and rankState.known
            and tostring(rankState.generation + 1) or nil,
        reason = "settlement journal unavailable", recorded = false,
    }
    table.insert(rankUnassigned, item)
    rank_log("payment held for period review: capture=" .. item.captureId
        .. ", actor=" .. actorId .. ", amount=" .. amount)
    return item
end

local function rank_unassigned_matches(active, item)
    if not active or active.closing or active.mode == "legacy_orphan" then
        item.reason = "no open matching period"
        return false
    end
    if item.occurredAt <= 0 then
        item.reason = "payment time unavailable"
        return false
    end
    if item.pendingPeriod and (not item.observedPeriod
        or item.pendingRound ~= item.observedRound or not item.observedOpen) then
        if item.pendingPeriod == active.period
            and item.pendingRound == active.round then return true end
        item.reason = "pending period did not match recovered period"
        return false
    end
    if item.observedPeriod then
        if item.observedOpen and item.observedPeriod == active.period
            and item.observedRound == active.round
            and item.observedStartedAt == active.startedAt
            and item.occurredAt >= active.startedAt then return true end
    elseif item.pendingPeriod then
        if item.pendingPeriod == active.period
            and item.pendingRound == active.round then return true end
    elseif item.observedOpen and item.observedRound and item.observedStartedAt then
        if item.observedRound == active.round
            and item.observedStartedAt == active.startedAt
            and item.occurredAt >= active.startedAt then return true end
    end
    item.reason = "observed period does not prove current period"
    return false
end

local function rank_reconcile_unassigned()
    if not rankState.loaded or not rankState.healthy then return false end
    local i = 1
    while i <= #rankUnassigned do
        local item = rankUnassigned[i]
        local decision = rankState.resolvedCaptures[item.captureId]
        if decision and item.resolutionIntent == decision then
            item.recorded = decision == "applied"
            table.remove(rankUnassigned, i)
        elseif decision then
            item.reason = "capture identifier needs review"
            i = i + 1
        elseif item.resolutionIntent then
            item.reason = "manual decision write was not confirmed"
            i = i + 1
        elseif rank_unassigned_matches(rankState.active, item) then
            rankState.nextEventId = rankState.nextEventId + 1
            table.insert(rankDeferred, {
                eventId = rankState.nextEventId, period = rankState.active.period,
                id = item.id, name = item.name, amount = item.amount,
                occurredAt = item.occurredAt, capture = item,
            })
            table.remove(rankUnassigned, i)
        else
            i = i + 1
        end
    end
    return rank_flush_deferred()
end

local function rank_unassigned_affects(active)
    for _, item in ipairs(rankUnassigned) do
        if item.pendingPeriod and (not item.observedPeriod
            or item.pendingRound ~= item.observedRound or not item.observedOpen) then
            if item.pendingPeriod == active.period then return true end
        elseif item.observedPeriod == active.period
            or item.pendingPeriod == active.period then
            return true
        elseif not item.observedPeriod and not item.pendingPeriod
            and item.observedOpen then
            if not item.observedRound or not item.observedStartedAt
                or (item.observedRound == active.round
                    and item.observedStartedAt == active.startedAt) then return true end
        end
    end
    return false
end

local function rank_recover()
    local ok, exists = pcall(rank_read_journal)
    if not ok then
        rankState.loaded, rankState.healthy = false, false
        rankState.error = tostring(exists)
        rank_log("journal recovery paused: " .. rankState.error)
        return false
    end
    if not exists then
        local svar = System.getStaticVar()
        if svar.pay_rank_journal_initialized == 1 then
            rankState.loaded, rankState.healthy = false, false
            rankState.error = "settlement journal disappeared after first migration"
            rank_log(rankState.error)
            return false
        end
        -- A transient read error may have preceded the first journal file.
        rankState.healthy, rankState.error = true, nil
        local pRank = Ranking.getRanking(sRankName)
        local oldFile, oldError, oldCode = io.open(sRankFile, "r")
        if not oldFile and oldCode ~= 2 then
            rank_log("legacy ranking cannot be inspected: " .. tostring(oldError))
            return false
        end
        if oldFile then
            oldFile:close()
            local loadOK, loadResult = pcall(Ranking.load, pRank, sRankFile)
            if not loadOK or loadResult == false then
                rank_log("legacy ranking load failed: " .. tostring(loadResult))
                return false
            end
        end
        local rowsOK, rows = pcall(rank_native_rows)
        if not rowsOK then
            rank_log("legacy ranking needs inspection: " .. tostring(rows))
            return false
        end
        local index = rank_int(svar.pay_rank_index, 1)
        local oldActive = svar.pay_ranking ~= nil and index ~= nil
        local now = rank_int(System.getCurrMiniTime(), 1)
        if not now then return false end
        local startedAt = rank_int(svar.pay_rank_minitime, 1)
            or rank_int(svar.pay_ranking, 1) or now
        local record
        if oldActive or #rows > 0 then
            local mode = oldActive and "legacy_active" or "legacy_orphan"
            record = table.concat({
                "O", 1, oldActive and index or 0, startedAt, mode, rank_board_rows(rows),
            }, "\t")
        else
            record = table.concat({"M", now}, "\t")
        end
        if not rank_append(record) then return false end
        local readOK, readResult = pcall(rank_read_journal)
        if not readOK or not readResult then
            rankState.loaded, rankState.healthy = false, false
            rankState.error = tostring(readResult)
            rank_log("migration journal cannot be reread: " .. rankState.error)
            return false
        end
        if rankState.active and rankState.active.mode == "legacy_orphan" then
            rank_log("old board quarantined; inspect settlement status before mail resolution")
        end
    end
    for _, item in ipairs(rankDeferred) do
        rankState.nextEventId = math.max(rankState.nextEventId, item.eventId)
    end
    Pay_Rank_CaptureSeq = math.max(Pay_Rank_CaptureSeq, rankState.maxCaptureId)
    for _, item in ipairs(rankUnassigned) do
        Pay_Rank_CaptureSeq = math.max(Pay_Rank_CaptureSeq, item.captureId)
        if rankState.resolvedCaptures[item.captureId] and not item.resolutionIntent then
            Pay_Rank_CaptureSeq = Pay_Rank_CaptureSeq + 1
            item.captureId = Pay_Rank_CaptureSeq
        end
    end
    rank_sync_flags()
    if rank_rebuild_view() then rank_save_native() end
    rank_reconcile_unassigned()
    if rankState.active and (rankState.active.closing
        or rankState.active.mode == "legacy_orphan" or Pay_Rank_PendingStop) then
        Pay_Rank_Activity_Stop()
    elseif not Pay_Rank_PendingStart
        or (rankState.active and rankState.active.round == Pay_Rank_PendingStart) then
        rank_flush_deferred()
    end
    rank_retry_pending()
    return rankState.loaded and rankState.healthy
end

function Pay_Rank_CreateRank()
    if rankReady then return true end
    local ok, err = pcall(function()
        local pRank = Ranking.getRanking(sRankName)
        if not pRank then
            pRank = Ranking.add(sRankName, #award, 0, 0)
            assert(pRank, "native ranking creation failed")
            Ranking.addColumn(pRank, "id")
            Ranking.addColumn(pRank, "name")
            Ranking.addRef(pRank)
        end
    end)
    if not ok then
        rank_log("native ranking initialization failed: " .. tostring(err))
        return false
    end
    rankReady = true
    return true
end

function Pay_Rank_StartServer()
    rank_timer()
    if not Pay_Rank_CreateRank() then return false end
    return rank_recover()
end

function Pay_Rank_StopServer()
    if rankState.loaded then rank_flush_deferred() end
    if #rankDeferred > 0 then
        rank_log("server stopping with unrecorded payment events: " .. #rankDeferred)
    end
    if #rankUnassigned > 0 then
        rank_log("server stopping with payments awaiting period review: " .. #rankUnassigned)
    end
    if rankState.viewOK then rank_save_native() end
    System.deleteTimer(sTimerName)
end

function Pay_Rank_UpdateItem(actorId, actorName, amount)
    actorId, amount = rank_int(actorId, 1), rank_int(amount, 1)
    if not actorId or not amount then return false end
    actorName = tostring(actorName or "")
    if not rankState.loaded then
        local captured = rank_capture_unassigned(actorId, actorName, amount)
        if not Pay_Rank_StartServer() then return false end
        rank_reconcile_unassigned()
        return captured.recorded == true
    end
    local active = rankState.active
    if Pay_Rank_PendingStop and not Pay_Rank_PendingStart then
        rank_capture_unassigned(actorId, actorName, amount)
        return false
    end
    local period
    if Pay_Rank_PendingStart and (not active or active.closing
        or active.round ~= Pay_Rank_PendingStart) then
        period = tostring(rankState.generation + 1)
    elseif active and not active.closing and active.mode ~= "legacy_orphan" then
        period = active.period
    else
        return false
    end
    rankState.nextEventId = rankState.nextEventId + 1
    table.insert(rankDeferred, {
        eventId = rankState.nextEventId, period = period,
        id = actorId, name = actorName, amount = amount,
        occurredAt = rank_int(System.getCurrMiniTime(), 0) or 0,
    })
    return rank_flush_deferred() and #rankDeferred == 0
end

function Pay_Rank_Activity_Start(index)
    index = rank_int(index, 1)
    if not index then return false end
    Pay_Rank_PendingStart = index
    if not rankState.loaded and not Pay_Rank_StartServer() then return false end
    if rankState.active then
        if rankState.active.round == index and not rankState.active.closing then
            Pay_Rank_PendingStart = nil
            return true
        end
        if not Pay_Rank_Activity_Stop() then return false end
    end
    local now = rank_int(System.getCurrMiniTime(), 1)
    if not now then return false end
    local period = tostring(rankState.generation + 1)
    for _, payment in ipairs(rankDeferred) do
        if not rankState.seenEvents[payment.eventId]
            and payment.period ~= period then
            rank_log("cannot open next round while an earlier payment is unrecorded")
            return false
        end
    end
    if not rank_append(table.concat({"O", period, index, now, "new", ""}, "\t")) then
        return false
    end
    rankState.generation = rankState.generation + 1
    rankState.active = {period = period, round = index, startedAt = now,
        mode = "new", closing = false}
    rankState.totals, rankState.names, rankState.top, rankState.imported = {}, {}, {}, {}
    Pay_Rank_PendingStart = nil
    rank_sync_flags()
    if rank_rebuild_view() then rank_save_native() end
    rank_reconcile_unassigned()
    System.broadcastTipmsg("开服活动充值排行第" .. index .. "轮开启!",
        ttScreenCenter + ttChatWindow)
    rank_retry_pending()
    return true
end

function Pay_Rank_Activity_Stop()
    Pay_Rank_PendingStop = true
    if not rankState.loaded and not Pay_Rank_StartServer() then return false end
    local active = rankState.active
    if not active then
        Pay_Rank_PendingStop = false
        rank_retry_pending()
        return true
    end
    rank_reconcile_unassigned()
    if rank_unassigned_affects(active) then
        rank_log("settlement held: unassigned payment may affect period " .. active.period)
        return false
    end
    if not rank_flush_deferred() then return false end
    if not active.closing then
        local now = rank_int(System.getCurrMiniTime(), 1)
        if not now or not rank_append(table.concat({"E", active.period, now}, "\t")) then
            return false
        end
        active.closing, active.endedAt = true, now
        rank_sync_flags()
    end
    if not rankState.viewOK and not rank_rebuild_view() then return false end
    local ok, recipients = pcall(rank_snapshot)
    if not ok then
        rank_log("settlement snapshot failed; board retained: " .. tostring(recipients))
        return false
    end
    local record = table.concat({
        "S", active.period, active.endedAt, #recipients,
        rank_settlement_rows(recipients),
    }, "\t")
    if not rank_append(record) then return false end
    rankState.settlements[active.period] = {
        period = active.period, round = active.round,
        startedAt = active.startedAt, endedAt = active.endedAt,
        mode = active.mode, recipients = recipients,
    }
    local round = active.round
    rankState.active = nil
    rankState.totals, rankState.names, rankState.top, rankState.imported = {}, {}, {}, {}
    Pay_Rank_PendingStop = false
    rank_sync_flags()
    if rank_rebuild_view() then rank_save_native() end
    if round > 0 then
        System.broadcastTipmsg("开服活动充值排行第" .. round .. "轮结束!",
            ttScreenCenter + ttChatWindow)
    end
    rank_retry_pending()
    return true
end

function Pay_Rank_OnTimer(leftTimes)
    if not rankReady or not rankState.loaded then
        Pay_Rank_StartServer()
        return
    end
    rank_reconcile_unassigned()
    if Pay_Rank_PendingStart then
        Pay_Rank_Activity_Start(Pay_Rank_PendingStart)
    elseif Pay_Rank_PendingStop or (rankState.active and rankState.active.closing) then
        Pay_Rank_Activity_Stop()
    else
        rank_flush_deferred()
    end
    if not rankState.viewOK then rank_rebuild_view() end
    rank_retry_pending()
end

-- Read-only operator view. No returned table is shared with the live state.
function Pay_Rank_GetSettlementStatus(period)
    local result = {
        ready = rankState.loaded and rankState.healthy
            and rankState.error == nil and #rankDeferred == 0
            and #rankUnassigned == 0,
        viewReady = rankState.viewOK,
        error = rankState.error,
        activePeriod = rankState.active and rankState.active.period or nil,
        deferredPayments = #rankDeferred, unassignedPayments = {},
        settlements = {},
    }
    for _, item in ipairs(rankUnassigned) do
        table.insert(result.unassignedPayments, {
            captureId = item.captureId, id = item.id, amount = item.amount,
            name = item.name, occurredAt = item.occurredAt,
            observedPeriod = item.observedPeriod,
            observedRound = item.observedRound,
            observedStartedAt = item.observedStartedAt,
            stopRequested = item.stopRequested,
            pendingPeriod = item.pendingPeriod, pendingRound = item.pendingRound,
            reason = item.reason,
        })
    end
    local periods = {}
    for key in pairs(rankState.settlements) do
        if period == nil or tostring(period) == key then table.insert(periods, key) end
    end
    table.sort(periods, function(a, b) return tonumber(a) < tonumber(b) end)
    for _, key in ipairs(periods) do
        local settlement = rankState.settlements[key]
        local copy = {period = key, round = settlement.round,
            startedAt = settlement.startedAt, endedAt = settlement.endedAt,
            mode = settlement.mode, recipients = {}}
        for _, item in ipairs(settlement.recipients) do
            table.insert(copy.recipients, {
                id = item.id, ranking = item.ranking, total = item.total,
                name = item.name, packedAward = item.packedAward,
                status = item.status, detail = item.detail,
            })
        end
        table.insert(result.settlements, copy)
    end
    return result
end

-- Call only after checking the native mailbox or its delivery log.
-- true means received; false means confirmed absent and allows a retry.
function Pay_Rank_ResolveUnknown(period, actorId, delivered)
    if delivered ~= true and delivered ~= false then return false, "expected boolean" end
    if not rankState.loaded or not rankState.healthy then return false, "journal unavailable" end
    if rankState.delivering then return false, "delivery in progress" end
    local settlement = rankState.settlements[tostring(period)]
    local item = settlement and rank_recipient(settlement, rank_int(actorId, 1))
    if not item or item.status ~= "unknown" then return false, "recipient is not unknown" end
    local status = delivered and "sent" or "failed"
    local detail = delivered and "manual mailbox confirmation: delivered"
        or "manual mailbox confirmation: absent"
    if not rank_append(table.concat({
        "R", settlement.period, item.id, status, rank_hex(detail),
    }, "\t")) then return false, "journal write failed" end
    item.status, item.detail = status, detail
    if status == "failed" then rank_retry_pending() end
    return true
end

-- Operator review of a payment captured while the journal was unreadable.
-- "apply" adjusts the named, still unsealed period. "handled" means the
-- operator has verified exclusion or completed separate compensation.
function Pay_Rank_ResolveUnassignedPayment(captureId, decision, period, note)
    captureId = rank_int(captureId, 1)
    if not captureId or (decision ~= "apply" and decision ~= "handled") then
        return false, "invalid review request"
    end
    if type(note) ~= "string" or note == "" then
        return false, "a review note is required"
    end
    if not rankState.loaded or not rankState.healthy then
        return false, "journal unavailable"
    end
    local position, item
    for i, captured in ipairs(rankUnassigned) do
        if captured.captureId == captureId then
            position, item = i, captured
            break
        end
    end
    if not item then return false, "capture not found" end
    local requestedIntent = decision == "apply" and "applied" or "handled"
    if item.resolutionIntent and item.resolutionIntent ~= requestedIntent then
        return false, "a different review decision is pending"
    end
    local active = rankState.active
    if decision == "apply" then
        if not active or active.period ~= tostring(period)
            or active.mode == "legacy_orphan" then
            return false, "period is not open for settlement"
        end
        local eventId = rankState.nextEventId + 1
        local record = table.concat({"A", active.period, eventId, captureId,
            item.id, item.amount, item.occurredAt,
            rank_hex(item.name), rank_hex(note)}, "\t")
        item.resolutionIntent = "applied"
        if not rank_append(record) then return false, "journal write failed" end
        rankState.nextEventId, rankState.seenEvents[eventId] = eventId, true
        rankState.resolvedCaptures[captureId] = "applied"
        rankState.maxCaptureId = math.max(rankState.maxCaptureId, captureId)
        rank_apply_score(rankState, item.id, item.amount, item.name)
        item.recorded = true
        rank_rebuild_view()
    else
        local record = table.concat({"Q", captureId, item.id, item.amount,
            item.occurredAt, item.observedPeriod or "-",
            item.observedRound or "-", item.observedStartedAt or "-",
            rank_hex(item.name), rank_hex(note)}, "\t")
        item.resolutionIntent = "handled"
        if not rank_append(record) then return false, "journal write failed" end
        rankState.resolvedCaptures[captureId] = "handled"
        rankState.maxCaptureId = math.max(rankState.maxCaptureId, captureId)
    end
    table.remove(rankUnassigned, position)
    if Pay_Rank_PendingStop and rankState.active then Pay_Rank_Activity_Stop() end
    return true
end

function Pay_Rank_RetryPending()
    return rank_retry_pending()
end

-- 查询排行榜
function Pay_Rank_Query(sysarg)
    local time = 0
    local active = rankState.active
    if active and not active.closing and active.mode ~= "legacy_orphan" then
        time = math.max(0, 60 * 60 * 8
            - (System.getCurrMiniTime() - active.startedAt))
    end

    local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
    local netPack = DataPack.allocPacket(sysarg, 139, 182)
    local nYuanBao, nRank = 0, 0
    local pRank = rankState.viewOK and Ranking.getRanking(sRankName) or nil
    local pRankItem

    if pRank then
        for i = 1, #award do
            pRankItem = Ranking.getItemFromIndex(pRank, i - 1)
            if pRankItem and actorID == tonumber(Ranking.getSub(pRankItem, 0)) then
                nRank = i
                nYuanBao = Ranking.getPoint(pRankItem)
                break
            end
        end
    end

    DataPack.writeByte(netPack, nRank)
    DataPack.writeInt(netPack, nYuanBao)
    DataPack.writeInt(netPack, time)
    if pRank then
        DataPack.writeByte(netPack, 3)
        for i = 1, 3 do
            pRankItem = Ranking.getItemFromIndex(pRank, i - 1)
            DataPack.writeString(netPack,
                pRankItem and (Ranking.getSub(pRankItem, 1) or "") or "")
        end
    else
        DataPack.writeByte(netPack, 0)
    end
    DataPack.flush(netPack)
end