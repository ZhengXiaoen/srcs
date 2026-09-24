-- 活动:每日充值排行榜，散人红利和竞技大赛活动可以同时开启

local dailyRankJournalPath = "data/runtime/ranking/daily_pay_ranking_state.log"
local dailyRankSnapshots = {}
local dailyRankBoard = {}
local dailyRankTotals = {}
local dailyRankPeriod = nil
local dailyRankDay = nil
local dailyRankFlags = 0
local dailyRankGeneration = 0
local dailyRankLoaded = false
local dailyRankPersistenceOK = true
local dailyRankDelivering = false
local dailyRankDirtyBoard = false
local dailyRankPendingSnapshot = nil
local dailyRankNativeClearPending = false
-- Preserve accepted pay totals across a Lua reload while this process lives.
local dailyRankDeferredPays = daily_pay_ranking_deferredPays or {}
daily_pay_ranking_deferredPays = dailyRankDeferredPays
local daily_rank_upsert_board

local function daily_rank_log(message)
	print("[daily_pay_ranking] " .. tostring(message))
end

local function daily_rank_ensure_timer()
	if not System.hasTimer("daily_pay_ranking_OnTimer") then
		System.addTimer("daily_pay_ranking_OnTimer", 3 * 60 * 1000, -1)
	end
end

local function daily_rank_day(time)
	local y, m, d = System.GetSystemTimeInMiniTime(time)
	return string.format("%04d%02d%02d", y, m, d)
end

local function daily_rank_ordinal(day)
	local y, m, d = tonumber(string.sub(day, 1, 4)),
		tonumber(string.sub(day, 5, 6)), tonumber(string.sub(day, 7, 8))
	local offsets = {0,31,59,90,120,151,181,212,243,273,304,334}
	if not y or not m or m < 1 or m > 12 or not d or d < 1 or d > 31 then return nil end
	local previous = y - 1
	local value = previous * 365 + math.floor(previous / 4)
		- math.floor(previous / 100) + math.floor(previous / 400) + offsets[m] + d
	if m > 2 and (y % 4 == 0 and (y % 100 ~= 0 or y % 400 == 0)) then value = value + 1 end
	return value
end

local function daily_rank_split(value, separator)
	local result, from = {}, 1
	while true do
		local pos = string.find(value, separator, from, true)
		if not pos then
			table.insert(result, string.sub(value, from))
			return result
		end
		table.insert(result, string.sub(value, from, pos - 1))
		from = pos + #separator
	end
end

local function daily_rank_hex(value)
	return (string.gsub(tostring(value or ""), ".", function(c)
		return string.format("%02X", string.byte(c))
	end))
end

local function daily_rank_unhex(value)
	if #value % 2 ~= 0 or string.find(value, "[^0-9A-Fa-f]") then return nil end
	return (string.gsub(value, "..", function(c) return string.char(tonumber(c, 16)) end))
end

local function daily_rank_append(record)
	if not dailyRankPersistenceOK then return false end
	local file = io.open(dailyRankJournalPath, "a")
	if not file then
		daily_rank_log("journal open failed; board transition and mail paused")
		daily_rank_ensure_timer()
		return false
	end
	local ok, err = pcall(function()
		assert(file:write(record .. "\n"))
		assert(file:flush())
		assert(file:close())
	end)
	if not ok then
		pcall(function() file:close() end)
		dailyRankPersistenceOK = false
		daily_rank_log("journal write uncertain; inspect before retry: " .. tostring(err))
		daily_rank_ensure_timer()
		return false
	end
	return true
end

local function daily_rank_board_rows(rows)
	local result = {}
	for _, item in ipairs(rows) do
		table.insert(result, table.concat({item.id, item.value}, ","))
	end
	return table.concat(result, ";")
end

local function daily_rank_award_rows(rows)
	local result = {}
	for _, item in ipairs(rows) do
		table.insert(result, table.concat({item.id, item.actType, item.value,
			item.awardIdx, item.ranking, daily_rank_hex(item.title),
			daily_rank_hex(item.desc), daily_rank_hex(item.award),
			item.status or "pending", daily_rank_hex(item.detail)}, ","))
	end
	return table.concat(result, ";")
end

local function daily_rank_parse_board(value, count)
	if not count or count ~= math.floor(count) or count < 0 or count > 1000 then return nil end
	if count == 0 then return value == "" and {} or nil end
	local parts, result, seen = daily_rank_split(value, ";"), {}, {}
	if #parts ~= count then return nil end
	for _, row in ipairs(parts) do
		local f = daily_rank_split(row, ",")
		if #f ~= 2 then return nil end
		local id, score = tonumber(f[1]), tonumber(f[2])
		if not id or id <= 0 or id ~= math.floor(id) or seen[id]
			or not score or score <= 0 then return nil end
		seen[id] = true
		table.insert(result, {id=id, value=score})
	end
	return result
end

local function daily_rank_parse_awards(value, count)
	if not count or count ~= math.floor(count) or count < 0 or count > 2000 then return nil end
	if count == 0 then return value == "" and {} or nil end
	local parts, result, seen = daily_rank_split(value, ";"), {}, {}
	if #parts ~= count then return nil end
	for _, row in ipairs(parts) do
		local f = daily_rank_split(row, ",")
		if #f ~= 10 then return nil end
		local id, actType, score = tonumber(f[1]), tonumber(f[2]), tonumber(f[3])
		local awardIdx, ranking = tonumber(f[4]), tonumber(f[5])
		local title, desc = daily_rank_unhex(f[6]), daily_rank_unhex(f[7])
		local award, detail = daily_rank_unhex(f[8]), daily_rank_unhex(f[10])
		local key = tostring(id) .. ":" .. tostring(actType)
		if not id or id <= 0 or id ~= math.floor(id) or (actType ~= 0 and actType ~= 1)
			or not score or score <= 0 or not awardIdx or awardIdx < 1 or awardIdx > 4
			or not ranking or ranking < 1 or not title or not desc or not award or not detail
			or (f[9] ~= "pending" and f[9] ~= "unknown") or seen[key] then return nil end
		seen[key] = true
		table.insert(result, {id=id, actType=actType, value=score,
			awardIdx=awardIdx, ranking=ranking, title=title, desc=desc,
			award=award, status=f[9], detail=detail})
	end
	return result
end

local function daily_rank_read_journal()
	local file, openError, errorCode = io.open(dailyRankJournalPath, "r")
	if not file then
		assert(errorCode == 2, "cannot read journal: " .. tostring(openError))
		return false
	end
	local data = file:read("*a")
	file:close()
	if not data or (data ~= "" and string.sub(data, -1) ~= "\n") then
		error("incomplete daily ranking journal; manual reconciliation required")
	end
	local hasBoard = false
	for line in string.gmatch(data, "([^\n]*)\n") do
		assert(line ~= "", "empty daily ranking journal record")
		line = string.gsub(line, "\r$", "")
		local f = daily_rank_split(line, "\t")
		if f[1] == "B" then
			assert(#f == 7, "invalid daily board record")
			local generation, flags, count = tonumber(f[4]), tonumber(f[5]), tonumber(f[6])
			assert(generation and generation >= 0 and generation == math.floor(generation)
				and flags and flags >= 0 and flags == math.floor(flags)
				and string.match(f[3], "^%d%d%d%d%d%d%d%d$")
				and (f[2] == "-" or f[2] == f[3] .. ":" .. generation), "invalid daily period")
			local rows = daily_rank_parse_board(f[7], count)
			assert(rows and (f[2] ~= "-" or (flags == 0 and #rows == 0)), "invalid daily board rows")
			dailyRankGeneration = math.max(dailyRankGeneration, generation)
			dailyRankPeriod = f[2] ~= "-" and f[2] or nil
			dailyRankDay, dailyRankFlags, dailyRankBoard = f[3], flags, rows
			dailyRankTotals = {}
			for _, row in ipairs(rows) do dailyRankTotals[row.id] = row.value end
			dailyRankDirtyBoard = false
			hasBoard = true
		elseif f[1] == "U" then
			assert(#f == 5 and hasBoard and dailyRankPeriod == f[2]
				and dailyRankDay == f[3] and not dailyRankSnapshots[f[2]],
				"daily score update outside active period")
			local actorId, value = tonumber(f[4]), tonumber(f[5])
			assert(actorId and actorId > 0 and actorId == math.floor(actorId)
				and value and value > 0, "invalid daily score update")
			dailyRankTotals[actorId] = value
			daily_rank_upsert_board(actorId, value, true)
		elseif f[1] == "S" then
			assert(#f == 8, "invalid daily settlement record")
			local generation, nextFlags, count = tonumber(f[4]), tonumber(f[6]), tonumber(f[7])
			assert(generation and generation >= 0 and generation == math.floor(generation)
				and f[2] == f[3] .. ":" .. generation
				and string.match(f[3], "^%d%d%d%d%d%d%d%d$")
				and string.match(f[5], "^%d%d%d%d%d%d%d%d$")
				and nextFlags and nextFlags >= 0 and nextFlags == math.floor(nextFlags)
				and not dailyRankSnapshots[f[2]], "invalid daily settlement period")
			local rows = daily_rank_parse_awards(f[8], count)
			assert(rows, "invalid daily settlement rows")
			dailyRankGeneration = math.max(dailyRankGeneration, generation)
			dailyRankSnapshots[f[2]] = {day=f[3], nextDay=f[5],
				nextFlags=nextFlags, recipients=rows}
		elseif f[1] == "I" or f[1] == "R" then
			assert(#f == (f[1] == "I" and 4 or 6), "invalid daily mail record")
			local snapshot = dailyRankSnapshots[f[2]]
			assert(snapshot, "daily mail without settlement")
			local actorId, actType = tonumber(f[3]), tonumber(f[4])
			local found = false
			for _, item in ipairs(snapshot.recipients) do
				if item.id == actorId and item.actType == actType then
					found = true
					if f[1] == "I" then
						item.status = "unknown"
						item.detail = "interrupted after delivery intent"
					else
						assert(f[5] == "sent" or f[5] == "failed" or f[5] == "unknown",
							"invalid daily mail status")
						item.status, item.detail = f[5], daily_rank_unhex(f[6])
						assert(item.detail, "invalid daily mail detail")
					end
					break
				end
			end
			assert(found, "unknown daily mail recipient")
		else
			error("unknown daily ranking journal record")
		end
	end
	assert(hasBoard or data == "", "daily journal has no board record")
	return hasBoard
end

function daily_pay_ranking_GetSettlementStatus()
	local result = {}
	for period, snapshot in pairs(dailyRankSnapshots) do
		for _, item in ipairs(snapshot.recipients) do
			table.insert(result, {period=period, actorId=item.id, actType=item.actType,
				ranking=item.ranking, value=item.value, award=item.award,
				status=item.status, detail=item.detail})
		end
	end
	return result
end

-- Use only after checking the actual mailbox. false confirms the mail is absent.
function daily_pay_ranking_ResolveUnknown(period, actorId, actType, delivered)
	if type(period) ~= "string" or type(actorId) ~= "number"
		or (actType ~= 0 and actType ~= 1)
		or (delivered ~= true and delivered ~= false)
		or not dailyRankLoaded or not dailyRankPersistenceOK then return false end
	local snapshot = dailyRankSnapshots[period]
	if not snapshot then return false end
	for _, item in ipairs(snapshot.recipients) do
		if item.id == actorId and item.actType == actType and item.status == "unknown" then
			local status = delivered and "sent" or "failed"
			local detail = delivered and "operator confirmed mailbox delivery"
				or "operator confirmed mail absent"
			if not daily_rank_append(table.concat({"R", period, actorId, actType,
				status, daily_rank_hex(detail)}, "\t")) then return false end
			item.status, item.detail = status, detail
			if not delivered then daily_rank_ensure_timer() end
			return true
		end
	end
	return false
end

local function daily_rank_deliver_pending()
	if dailyRankDelivering or not dailyRankPersistenceOK then return end
	local periods = {}
	for period in pairs(dailyRankSnapshots) do table.insert(periods, period) end
	table.sort(periods)
	dailyRankDelivering = true
	for _, period in ipairs(periods) do
		for _, item in ipairs(dailyRankSnapshots[period].recipients) do
			if item.status == "pending" or item.status == "failed" then
				if not daily_rank_append(table.concat({"I", period, item.id, item.actType}, "\t")) then
					dailyRankDelivering = false
					return
				end
				item.status = "unknown"
				local ok, response = pcall(System.AddMail, item.id, 6, 0,
					item.title, item.desc, 0, 0, item.award)
				local status = "unknown"
				if ok and response == true then status = "sent"
				elseif ok and response == false then status = "failed" end
				local detail = ok and ("return=" .. tostring(response))
					or ("error=" .. tostring(response))
				if daily_rank_append(table.concat({"R", period, item.id, item.actType,
					status, daily_rank_hex(detail)}, "\t")) then
					item.status, item.detail = status, detail
				end
				if item.status == "unknown" then
					daily_rank_log("mail needs reconciliation: period=" .. period
						.. ", actor=" .. item.id .. ", type=" .. item.actType)
				end
			end
		end
	end
	dailyRankDelivering = false
end

local function daily_rank_native_board()
	local rows = {}
	local count = Ranking.get_ranking_item_count(4) or 0
	if count > 1000 then error("daily ranking item count exceeds recovery limit") end
	for i = 1, count do
		local pointer = Ranking.get_ranking_item(4, i - 1)
		if pointer then
			local actorId = Ranking.ranking_item_actorid(pointer)
			local value = Ranking.ranking_item_value(pointer)
			if actorId and actorId > 0 and value and value > 0 then
				table.insert(rows, {id=actorId, value=value})
			end
		end
	end
	return rows
end

local daily_rank_save_board

daily_rank_upsert_board = function(actorId, value, silent)
	local oldIndex
	for index, row in ipairs(dailyRankBoard) do
		if row.id == actorId then
			if row.value == value then return false end
			oldIndex = index
			break
		end
	end
	if oldIndex then table.remove(dailyRankBoard, oldIndex) end
	local insertIndex = #dailyRankBoard + 1
	for index, row in ipairs(dailyRankBoard) do
		if value > row.value then insertIndex = index; break end
	end
	table.insert(dailyRankBoard, insertIndex, {id=actorId, value=value})
	if #dailyRankBoard > 1000 then table.remove(dailyRankBoard) end
	if not silent then dailyRankDirtyBoard = true end
	return true
end

local function daily_rank_record_pay(actorId, value)
	if dailyRankTotals[actorId] == value then return true end
	-- A single actor's cumulative score is enough to replay this payment.
	-- The U record must be durable before the in-memory award board changes.
	if not daily_rank_append(table.concat({"U", dailyRankPeriod,
		dailyRankDay, actorId, value}, "\t")) then return false end
	dailyRankTotals[actorId] = value
	daily_rank_upsert_board(actorId, value, true)
	return true
end

local function daily_rank_queue_pay(actorId, value, at)
	local day = daily_rank_day(at)
	local observedPeriod = dailyRankPeriod or "-"
	local targetPeriod = dailyRankDay == day and dailyRankPeriod or nil
	if targetPeriod and (string.match(targetPeriod, ":0$")
		or dailyRankSnapshots[targetPeriod]) then
		targetPeriod = nil
	end
	for _, item in ipairs(dailyRankDeferredPays) do
		if item.id == actorId and item.day == day
			and item.targetPeriod == targetPeriod then
			item.value, item.at, item.period = value, at, observedPeriod
			return
		end
	end
	table.insert(dailyRankDeferredPays,
		{id=actorId, value=value, at=at, day=day,
			period=observedPeriod, targetPeriod=targetPeriod})
	daily_rank_ensure_timer()
end

local function daily_rank_drain_pays(day)
	if not day then return true end
	local index = 1
	while index <= #dailyRankDeferredPays do
		local item = dailyRankDeferredPays[index]
		if item.day < day then
			daily_rank_log("deferred pay crossed period without a board record: actor=" .. item.id)
			return false
		elseif item.day == day then
			if dailyRankPendingSnapshot and dailyRankPendingSnapshot.period == dailyRankPeriod then
				-- A legacy board is quarantined before current-day payments enter a new period.
				return true
			end
			if item.targetPeriod and item.targetPeriod ~= dailyRankPeriod then
				daily_rank_log("deferred pay period differs from active board: actor=" .. item.id)
				return false
			end
			if dailyRankPeriod and dailyRankFlags > 0 then
				if not daily_rank_record_pay(item.id, item.value) then return false end
			else
				daily_rank_log("pay occurred outside active daily ranking: actor=" .. item.id)
			end
			table.remove(dailyRankDeferredPays, index)
		else
			index = index + 1
		end
	end
	return true
end

function daily_pay_ranking_GetDeferredPayStatus()
	local result = {}
	for _, item in ipairs(dailyRankDeferredPays) do
		table.insert(result, {actorId=item.id, value=item.value,
			day=item.day, period=item.period, targetPeriod=item.targetPeriod,
			at=item.at})
	end
	return result
end

local function daily_rank_same_members(left, right)
	if #left ~= #right then return false end
	local values = {}
	for _, row in ipairs(left) do values[row.id] = row.value end
	for _, row in ipairs(right) do
		if values[row.id] ~= row.value then return false end
	end
	return true
end

daily_rank_save_board = function()
	if not dailyRankDirtyBoard then return true end
	local day = dailyRankDay or daily_rank_day(System.getCurrMiniTime())
	local period = dailyRankPeriod or "-"
	if not daily_rank_append(table.concat({"B", period, day, dailyRankGeneration,
		dailyRankFlags, #dailyRankBoard, daily_rank_board_rows(dailyRankBoard)}, "\t")) then return false end
	dailyRankDirtyBoard = false
	return true
end

local function daily_rank_apply_flags()
	local svar = System.getStaticVar()
	local flags = dailyRankFlags > 0 and dailyRankFlags or nil
	if svar.daily_pay_ranking_day_data ~= flags then
		svar.daily_pay_ranking_day_data = flags
		if System.saveStaticVar then System.saveStaticVar() end
	end
end

local function daily_rank_clear_native()
	local ok, err = pcall(Ranking.clear_ranking, 4, true)
	if not ok or Ranking.get_ranking_item_count(4) ~= 0 then
		daily_rank_log("native board clear failed after durable state: " .. tostring(err))
		daily_rank_ensure_timer()
		return false
	end
	dailyRankNativeClearPending = false
	return true
end

local function daily_rank_recipients()
	local result = {}
	local awardList = SanRenHongLiCfg.DailyPayRanking.awardList
	local minimums = {awardList[1].minPay, awardList[2].minPay,
		awardList[3].minPay, awardList[4].minPay}
	local legacy = dailyRankPeriod and string.match(dailyRankPeriod, ":0$")
	local function add(row, awardIdx, ranking, actType)
		local cfg = awardList[awardIdx]
		if not cfg or row.value < cfg.minPay then return end
		local title, desc
		if actType == 0 then
			title = "散人红利每日充值排行"
			desc = string.format("您在散人红利每日充值排行活动中，获得第%d名，将获得以下奖品：", ranking)
		else
			title = "竞技大赛每日充值排行"
			desc = string.format("您在竞技大赛每日充值排行活动中，获得第%d名，将获得以下奖品：", ranking)
		end
		table.insert(result, {id=row.id, actType=actType, value=row.value,
			awardIdx=awardIdx, ranking=ranking, title=title, desc=desc,
			award=cfg.mailAward, status=legacy and "unknown" or "pending",
			detail=legacy and "legacy board day and mail history unverified; review required" or ""})
	end
	local function add_for_active(row, awardIdx, ranking)
		if System.getIntByte(dailyRankFlags, 0) > 0 then add(row, awardIdx, ranking, 0) end
		if System.getIntByte(dailyRankFlags, 1) > 0 then add(row, awardIdx, ranking, 1) end
	end
	local awardIdx, ranking = 0, 0
	for _, row in ipairs(dailyRankBoard) do
		local value = row.value
		if awardIdx >= 3 or value < minimums[3] then
			ranking = math.max(4, ranking + 1)
			if ranking <= 20 then add_for_active(row, 4, ranking) end
		else
			if value >= minimums[1] then
				awardIdx = awardIdx + 1
			elseif value >= minimums[2] then
				awardIdx = math.max(2, awardIdx + 1)
			elseif value >= minimums[3] then
				awardIdx = math.max(3, awardIdx + 1)
			end
			awardIdx = math.min(4, awardIdx)
			add_for_active(row, awardIdx, awardIdx)
		end
	end
	return result
end

local function daily_rank_decrement_flags(flags, days)
	local result = flags
	for actType = 0, 1 do
		local left = System.getIntByte(flags, actType)
		result = System.setIntByte(result, actType, math.max(0, left - days))
	end
	return result
end

local function daily_rank_finish_snapshot(snapshot)
	if not daily_rank_clear_native() then return false end
	dailyRankDay = snapshot.nextDay
	dailyRankFlags = snapshot.nextFlags
	dailyRankBoard = {}
	dailyRankTotals = {}
	if dailyRankFlags > 0 then
		dailyRankGeneration = dailyRankGeneration + 1
		dailyRankPeriod = dailyRankDay .. ":" .. dailyRankGeneration
	else
		dailyRankPeriod = nil
	end
	dailyRankDirtyBoard = true
	if not daily_rank_save_board() then return false end
	daily_rank_apply_flags()
	return true
end

local function daily_rank_seal_current(today)
	if not dailyRankPeriod then return true end
	local snapshot = dailyRankSnapshots[dailyRankPeriod]
	if not snapshot then
		if not dailyRankPendingSnapshot then
			local previousDay, nextDay = daily_rank_ordinal(dailyRankDay), daily_rank_ordinal(today)
			if not previousDay or not nextDay or nextDay <= previousDay then return false end
			dailyRankPendingSnapshot = {period=dailyRankPeriod, day=dailyRankDay,
				nextDay=today,
				nextFlags=daily_rank_decrement_flags(dailyRankFlags, nextDay - previousDay),
				recipients=daily_rank_recipients()}
		end
		snapshot = dailyRankPendingSnapshot
		if snapshot.period ~= dailyRankPeriod then return false end
		local generation = tonumber(string.match(dailyRankPeriod, ":(%d+)$"))
		if not daily_rank_append(table.concat({"S", dailyRankPeriod, dailyRankDay,
			generation, snapshot.nextDay, snapshot.nextFlags,
			#snapshot.recipients, daily_rank_award_rows(snapshot.recipients)}, "\t")) then return false end
		dailyRankSnapshots[dailyRankPeriod] = snapshot
		dailyRankPendingSnapshot = nil
	end
	return daily_rank_finish_snapshot(snapshot)
end

local function daily_rank_update_timer()
	local retry = dailyRankPeriod ~= nil or dailyRankDirtyBoard
		or dailyRankPendingSnapshot ~= nil or dailyRankNativeClearPending
		or #dailyRankDeferredPays > 0
	for _, snapshot in pairs(dailyRankSnapshots) do
		for _, item in ipairs(snapshot.recipients) do
			if item.status == "pending" or item.status == "failed" then retry = true end
		end
	end
	if retry then daily_rank_ensure_timer()
	else System.deleteTimer("daily_pay_ranking_OnTimer") end
end

local function daily_rank_refresh()
	if not dailyRankLoaded or not dailyRankPersistenceOK then return false end
	local now = System.getCurrMiniTime()
	if now <= 0 then return false end
	local today = daily_rank_day(now)
	if dailyRankDirtyBoard and not daily_rank_save_board() then return false end
	if not daily_rank_drain_pays(dailyRankDay) then return false end
	local currentOrdinal = daily_rank_ordinal(today)
	if dailyRankDay and currentOrdinal < daily_rank_ordinal(dailyRankDay) then
		daily_rank_log("clock moved before active ranking day; transition paused")
		return false
	end
	while dailyRankPeriod and (dailyRankDay ~= today or dailyRankSnapshots[dailyRankPeriod]
		or (dailyRankPendingSnapshot and dailyRankPendingSnapshot.period == dailyRankPeriod)) do
		if not daily_rank_seal_current(today) then return false end
		if dailyRankDirtyBoard and not daily_rank_save_board() then return false end
		if not daily_rank_drain_pays(dailyRankDay) then return false end
	end
	if dailyRankNativeClearPending and not daily_rank_clear_native() then return false end
	if not dailyRankPeriod and dailyRankDay ~= today then
		dailyRankDay = today
		dailyRankDirtyBoard = true
		if not daily_rank_save_board() then return false end
	end
	daily_rank_apply_flags()
	daily_rank_deliver_pending()
	daily_rank_update_timer()
	return dailyRankPersistenceOK
end

function daily_pay_ranking_load()
	local previous = {snapshots=dailyRankSnapshots, board=dailyRankBoard,
		totals=dailyRankTotals,
		period=dailyRankPeriod, day=dailyRankDay, flags=dailyRankFlags,
		generation=dailyRankGeneration, loaded=dailyRankLoaded,
		dirty=dailyRankDirtyBoard, clear=dailyRankNativeClearPending}
	dailyRankSnapshots, dailyRankBoard, dailyRankTotals = {}, {}, {}
	dailyRankPeriod, dailyRankDay, dailyRankFlags = nil, nil, 0
	dailyRankGeneration, dailyRankDirtyBoard = 0, false
	dailyRankNativeClearPending = false
	dailyRankLoaded, dailyRankPersistenceOK = false, true
	if System.getCurrMiniTime() <= 0 then return end
	local ok, hasBoard = pcall(daily_rank_read_journal)
	if not ok then
		if previous.loaded then
			dailyRankSnapshots, dailyRankBoard = previous.snapshots, previous.board
			dailyRankTotals = previous.totals
			dailyRankPeriod, dailyRankDay, dailyRankFlags = previous.period,
				previous.day, previous.flags
			dailyRankGeneration, dailyRankDirtyBoard = previous.generation, previous.dirty
			dailyRankNativeClearPending, dailyRankLoaded = previous.clear, true
		end
		dailyRankPersistenceOK = false
		daily_rank_log("journal recovery stopped: " .. tostring(hasBoard))
		daily_rank_ensure_timer()
		return false
	end
	if not hasBoard then
		local svar = System.getStaticVar()
		local flags = svar.daily_pay_ranking_day_data or 0
		dailyRankDay = daily_rank_day(System.getCurrMiniTime())
		if flags > 0 then
			-- Pre-journal delivery history is unknown, including a partially sent day.
			dailyRankPeriod = dailyRankDay .. ":0"
			dailyRankFlags = flags
			local boardOK, board = pcall(daily_rank_native_board)
			if not boardOK then
				dailyRankPersistenceOK = false
				daily_rank_log("legacy board cannot be inspected: " .. tostring(board))
				daily_rank_ensure_timer()
				return
			end
			dailyRankBoard = board
			for _, row in ipairs(board) do dailyRankTotals[row.id] = row.value end
		else
			dailyRankNativeClearPending = true
		end
		dailyRankDirtyBoard = true
	end
	if previous.loaded and previous.dirty
		and (dailyRankPeriod ~= previous.period or dailyRankDay ~= previous.day
			or dailyRankFlags ~= previous.flags
			or not daily_rank_same_members(dailyRankBoard, previous.board)) then
		-- A write/close may have failed after accepting a payment or start.
		-- Retain the in-memory state until its B record is confirmed durable.
		dailyRankBoard, dailyRankPeriod, dailyRankDay = previous.board,
			previous.period, previous.day
		dailyRankTotals = previous.totals
		dailyRankFlags, dailyRankGeneration = previous.flags, previous.generation
		dailyRankDirtyBoard = true
		dailyRankNativeClearPending = previous.clear
	end
	if dailyRankPendingSnapshot and dailyRankSnapshots[dailyRankPendingSnapshot.period] then
		dailyRankPendingSnapshot = nil
	end
	if dailyRankPeriod and string.match(dailyRankPeriod, ":0$")
		and not dailyRankSnapshots[dailyRankPeriod] then
		-- The native rank has no reliable day marker. Quarantine the old
		-- scores and mail history before opening a fresh period today.
		if not dailyRankPendingSnapshot then
			dailyRankPendingSnapshot = {period=dailyRankPeriod, day=dailyRankDay,
				nextDay=dailyRankDay, nextFlags=dailyRankFlags,
				recipients=daily_rank_recipients()}
		end
		daily_rank_log("legacy board day is unverified; mail needs operator review")
	end
	if hasBoard and not dailyRankDirtyBoard then
		local boardOK, nativeBoard = pcall(daily_rank_native_board)
		if not boardOK then
			dailyRankPersistenceOK = false
			daily_rank_log("native board cannot be inspected: " .. tostring(nativeBoard))
			daily_rank_ensure_timer()
			return false
		end
		if not daily_rank_same_members(dailyRankBoard, nativeBoard) then
			dailyRankNativeClearPending = true
			daily_rank_log("native board differs from durable period; clearing stale display scores")
		end
	end
	dailyRankLoaded = true
	return daily_rank_refresh()
end

function daily_pay_ranking_OnTimer(leftTimes)
	if not dailyRankLoaded or not dailyRankPersistenceOK then
		daily_pay_ranking_load()
	else
		daily_rank_refresh()
	end
end

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
	if type(curDay) ~= "number" or type(openNDay) ~= "number"
		or curDay < 1 or curDay > openNDay or (actType ~= 0 and actType ~= 1) then
		daily_rank_log("invalid daily ranking start arguments")
		return false
	end
	if not dailyRankLoaded then daily_pay_ranking_load() end
	if not daily_rank_refresh() then return false end
	local today = daily_rank_day(System.getCurrMiniTime())
	local leftDay = openNDay - curDay + 1
	if not dailyRankPeriod then
		-- The new period is durable before old native scores can be reused.
		dailyRankGeneration = dailyRankGeneration + 1
		dailyRankPeriod = today .. ":" .. dailyRankGeneration
		dailyRankDay = today
		dailyRankBoard = {}
		dailyRankTotals = {}
		dailyRankFlags = 0
		dailyRankNativeClearPending = true
	end
	dailyRankFlags = System.setIntByte(dailyRankFlags, actType, leftDay)
	dailyRankDirtyBoard = true
	if not daily_rank_refresh() then return false end
	daily_rank_log("started: period=" .. dailyRankPeriod
		.. ", type=" .. actType .. ", remaining=" .. leftDay)
	return true
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
	if not dailyRankLoaded then daily_pay_ranking_load() end
	if not daily_rank_refresh() then return false end
	return dailyRankPeriod ~= nil and dailyRankFlags > 0
end

function daily_pay_ranking_sync_pay(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if not var then return 0 end
	if not var.newdays then var.newdays = {} end
	local pay_yb = var.days and var.days.PeyNum or 0
	var.newdays.daily_pay_ranking_yb = pay_yb
	local awardList = SanRenHongLiCfg.DailyPayRanking.awardList
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local at = System.getCurrMiniTime()
	local staticFlags = System.getStaticVar().daily_pay_ranking_day_data or 0
	if pay_yb >= awardList[4].minPay and actorId and actorId > 0 and at > 0
		and (not dailyRankLoaded or dailyRankPeriod or staticFlags > 0) then
		daily_rank_queue_pay(actorId, pay_yb, at)
	end
	if not dailyRankLoaded then daily_pay_ranking_load() end
	if not daily_rank_refresh() then return pay_yb end
	if not dailyRankPeriod or pay_yb < awardList[4].minPay then return pay_yb end
	if not actorId or actorId <= 0 then return pay_yb end
	if not daily_rank_record_pay(actorId, pay_yb) then
		daily_rank_queue_pay(actorId, pay_yb, at)
		return pay_yb
	end
	local ok, err = pcall(Ranking.update_value, 4, sysarg, pay_yb)
	if not ok then daily_rank_log("native ranking update failed: " .. tostring(err)) end
	daily_rank_update_timer()
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
	daily_pay_ranking_sync_pay(sysarg)
end

function daily_pay_ranking_ScriptRankingNewDayArrive()
	if not dailyRankLoaded then daily_pay_ranking_load() end
	-- The recorded calendar day makes a duplicate callback a no-op.
	return daily_rank_refresh()
end

function daily_pay_ranking_on_server_started()
	return daily_pay_ranking_load()
end

registerLuaEventCallback(LuaEventId.ActorPayMoney, daily_pay_ranking_OnActorPayMoney)
registerLuaEventCallback(LuaEventId.ScriptRankingNewDayArrive, daily_pay_ranking_ScriptRankingNewDayArrive)
-- 注册服务器启动事件
registerLuaEventCallback(LuaEventId.ServerStarted, daily_pay_ranking_on_server_started)