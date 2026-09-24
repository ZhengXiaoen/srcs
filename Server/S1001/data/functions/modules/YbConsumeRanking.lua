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


-- Shared daily board. The append-only journal is authoritative after migration.
-- S seals an immutable award snapshot; I records intent BEFORE AddMail.
-- An unconfirmed I is never retried automatically. false is the only retryable
-- AddMail result; true is confirmed, all other results require reconciliation.
local rankJournalPath = "data/runtime/ranking/YbConsumeRankingState.log"
local rankSettlements = {}
local rankPeriod = nil
local rankDay = nil
local rankGeneration = 0
local rankPersistenceOK = true
local rankDelivering = false
local rankLoaded = false
local rankActorTotals = {}
-- Keep unwritten events across a Lua script reload in the same process.
local rankDeferredConsumes = YbConsumeRanking_deferredConsumes or {}
YbConsumeRanking_deferredConsumes = rankDeferredConsumes
local rankNextEventId = YbConsumeRanking_nextEventId or 0
local rankLastEventId = 0
local rankNeedsBoardRecord = false

local function rank_log(message)
	print("[YbConsumeRanking] " .. tostring(message))
end

local function rank_ensure_timer()
	if not System.hasTimer("YbConsumeRanking_OnTimer") then
		System.addTimer("YbConsumeRanking_OnTimer", 3 * 60 * 1000, -1)
	end
end

local function rank_day(time)
	local y, m, d = System.GetSystemTimeInMiniTime(time)
	return string.format("%04d%02d%02d", y, m, d)
end

local function rank_split(value, separator)
	local result = {}
	local from = 1
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

local function rank_hex(value)
	return (string.gsub(tostring(value or ""), ".", function(c)
		return string.format("%02X", string.byte(c))
	end))
end

local function rank_unhex(value)
	if #value % 2 ~= 0 or string.find(value, "[^0-9A-Fa-f]") then return nil end
	return (string.gsub(value, "..", function(c) return string.char(tonumber(c, 16)) end))
end

local function rank_append(record)
	if not rankPersistenceOK then return false end
	local file = io.open(rankJournalPath, "a")
	if not file then
		rank_log("journal open failed; settlement/rollover paused")
		rank_ensure_timer()
		return false
	end
	local ok, err = pcall(function()
		assert(file:write(record .. "\n"))
		assert(file:flush())
		assert(file:close())
	end)
	if not ok then
		pcall(function() file:close() end)
		rankPersistenceOK = false
		rank_log("journal write uncertain; inspect journal before retry: " .. tostring(err))
		rank_ensure_timer()
		return false
	end
	return true
end

local function rank_rows(records, awards)
	local rows = {}
	for _, item in ipairs(records) do
		if awards then
			table.insert(rows, table.concat({item.id, item.ranking, item.awardIdx,
				item.yb, rank_hex(item.award), item.status or "pending", rank_hex(item.detail)}, ","))
		else
			table.insert(rows, table.concat({item.id, item.yb, rank_hex(item.name)}, ","))
		end
	end
	return table.concat(rows, ";")
end

local function rank_parse_rows(value, count, awards)
	if not count or count < 0 or count > 20 or count ~= math.floor(count) then return nil end
	if count == 0 then if value == "" then return {} else return nil end end
	local result, seen = {}, {}
	local rows = rank_split(value, ";")
	if #rows ~= count then return nil end
	for _, row in ipairs(rows) do
		local fields = rank_split(row, ",")
		if awards then
			if #fields ~= 5 and #fields ~= 7 then return nil end
		elseif #fields ~= 3 then return nil end
		local id = tonumber(fields[1])
		if not id or id <= 0 or seen[id] then return nil end
		seen[id] = true
		if awards then
			local ranking, index, yb = tonumber(fields[2]), tonumber(fields[3]), tonumber(fields[4])
			local award = rank_unhex(fields[5])
			if not ranking or ranking < 1 or not index or index < 1 or index > 4
				or not yb or yb <= 0 or not award then return nil end
			local status = fields[6] or "pending"
			local detail = fields[7] and rank_unhex(fields[7]) or ""
			if (status ~= "pending" and status ~= "unknown") or not detail then return nil end
			table.insert(result, {id=id, ranking=ranking, awardIdx=index, yb=yb,
				award=award, status=status, detail=detail})
		else
			local yb, name = tonumber(fields[2]), rank_unhex(fields[3])
			if not yb or yb <= 0 or not name then return nil end
			table.insert(result, {id=id, yb=yb, name=name})
		end
	end
	return result
end

local function rank_read_journal()
	local file, openError, errorCode = io.open(rankJournalPath, "r")
	if not file then
		-- Lua 5.1 io.open returns errno as its third result. Only ENOENT
		-- authorizes migration; denial/sharing errors must not hide mail history.
		assert(errorCode == 2, "cannot read journal: " .. tostring(openError))
		return false
	end
	local data = file:read("*a")
	file:close()
	if not data or (data ~= "" and string.sub(data, -1) ~= "\n") then
		error("incomplete journal tail; manual reconciliation required")
	end
	local hasBoard = false
	for line in string.gmatch(data, "([^\n]+)\n") do
		line = string.gsub(line, "\r$", "")
		local f = rank_split(line, "\t")
		if f[1] == "B" or f[1] == "S" then
			assert(#f == 6, "invalid snapshot")
			local generation, count = tonumber(f[4]), tonumber(f[5])
			assert(generation and generation >= 0 and string.match(f[3], "^%d%d%d%d%d%d%d%d$"), "invalid period")
			assert(f[2] == "-" or f[2] == f[3] .. ":" .. generation, "invalid period key")
			local records = rank_parse_rows(f[6], count, f[1] == "S")
			assert(records, "invalid snapshot rows")
			rankGeneration = math.max(rankGeneration, generation)
			if f[1] == "B" then
				if rankPeriod ~= (f[2] ~= "-" and f[2] or nil) then rankActorTotals = {} end
				YbConsumeRanking = records
				rankPeriod = f[2] ~= "-" and f[2] or nil
				rankDay = f[3]
				YbConsumeRanking_minYb = #records > 0 and records[#records].yb or 0
				YbConsumeRanking_isModified = false
				rankNeedsBoardRecord = false
				for _, item in ipairs(records) do
					rankActorTotals[item.id] = math.max(rankActorTotals[item.id] or 0, item.yb)
				end
				hasBoard = true
			else
				assert(f[2] ~= "-" and not rankSettlements[f[2]], "duplicate settlement snapshot")
				rankSettlements[f[2]] = {day=f[3], recipients=records}
			end
		elseif f[1] == "C" then
			assert(#f == 6 and f[3] == rankPeriod, "consume without active board")
			local eventId, actorId, total = tonumber(f[2]), tonumber(f[4]), tonumber(f[5])
			local name = rank_unhex(f[6])
			assert(eventId and eventId == math.floor(eventId) and eventId > rankLastEventId
				and actorId and actorId == math.floor(actorId) and actorId > 0
				and total and total > 0 and name, "invalid consume record")
			assert(total >= (rankActorTotals[actorId] or 0), "decreasing consume total")
			rankLastEventId = eventId
			rankNextEventId = math.max(rankNextEventId, eventId)
			YbConsumeRanking_nextEventId = rankNextEventId
			rankActorTotals[actorId] = total
			if total >= PublicTestCfg.YbConsumeRanking.minConsume then
				YbConsumeRankingConsumeYbById(actorId, name, total, true)
			end
		elseif f[1] == "I" or f[1] == "R" then
			assert(#f == (f[1] == "I" and 3 or 5), "invalid mail record")
			local snapshot = rankSettlements[f[2]]
			assert(snapshot, "mail record without snapshot")
			local found = false
			for _, item in ipairs(snapshot.recipients) do
				if item.id == tonumber(f[3]) then
					found = true
					if f[1] == "I" then
						item.status = "unknown"
						item.detail = "interrupted after durable delivery intent"
					else
						assert(f[4] == "sent" or f[4] == "failed" or f[4] == "unknown", "invalid mail status")
						item.status, item.detail = f[4], rank_unhex(f[5])
						assert(item.detail, "invalid mail detail")
					end
					break
				end
			end
			assert(found, "unknown mail recipient")
		else
			error("unknown journal record")
		end
	end
	return hasBoard
end

local function rank_recipients()
	local result, nextItem = {}, 1
	local cfg = PublicTestCfg.YbConsumeRanking.awardList
	local function add(item, awardIdx, ranking)
		table.insert(result, {id=item.id, yb=item.yb, awardIdx=awardIdx,
			ranking=ranking, award=cfg[awardIdx].mailAward, status="pending"})
	end
	for slot = 1, 3 do
		local item = YbConsumeRanking[nextItem]
		if item and item.yb >= cfg[slot].minConsume then
			add(item, slot, slot)
			nextItem = nextItem + 1
		end
	end
	local ranking = 4
	for i = nextItem, #YbConsumeRanking do
		local item = YbConsumeRanking[i]
		if item.yb >= cfg[4].minConsume then
			add(item, 4, ranking)
			ranking = ranking + 1
		end
	end
	return result
end

local function rank_deliver_pending()
	if rankDelivering or not rankPersistenceOK then return end
	local periods = {}
	for period in pairs(rankSettlements) do table.insert(periods, period) end
	table.sort(periods)
	rankDelivering = true
	for _, period in ipairs(periods) do
		for _, item in ipairs(rankSettlements[period].recipients) do
			if item.status == "pending" or item.status == "failed" then
				if not rank_append(table.concat({"I", period, item.id}, "\t")) then
					rankDelivering = false
					return
				end
				item.status = "unknown"
				local desc = string.format("您在消费排行活动中，获得第%d名，将获得以下奖品：", item.ranking)
				local ok, result = pcall(System.AddMail, item.id, 6, 0, "消费排行", desc, 0, 0, item.award)
				local status = "unknown"
				if ok and result == true then status = "sent"
				elseif ok and result == false then status = "failed" end
				local detail = ok and ("return=" .. tostring(result)) or ("error=" .. tostring(result))
				if rank_append(table.concat({"R", period, item.id, status, rank_hex(detail)}, "\t")) then
					item.status, item.detail = status, detail
				end
				if item.status == "unknown" then
					rank_log("mail requires reconciliation: period=" .. period .. ", actor=" .. item.id .. ", " .. detail)
				end
			end
		end
	end
	rankDelivering = false
end

local function rank_close_period()
	if not rankPeriod then return true end
	if not rankSettlements[rankPeriod] then
		local recipients = rank_recipients()
		-- Generation zero is reserved for imported boards without delivery
		-- history. This provenance survives same-day saves and restarts.
		if string.match(rankPeriod, ":0$") then
			for _, item in ipairs(recipients) do
				item.status = "unknown"
				item.detail = "legacy snapshot has no delivery history; review required"
			end
			rank_log("legacy settlement requires reconciliation: period=" .. rankPeriod)
		end
		local generation = tonumber(string.match(rankPeriod, ":(%d+)$"))
		if not rank_append(table.concat({"S", rankPeriod, rankDay, generation,
			#recipients, rank_rows(recipients, true)}, "\t")) then return false end
		rankSettlements[rankPeriod] = {day=rankDay, recipients=recipients}
	end
	YbConsumeRanking = {}
	YbConsumeRanking_minYb = 0
	YbConsumeRanking_isModified = true
	YbConsumeRanking_inTime = false
	rankPeriod = nil
	rankActorTotals = {}
	rankNeedsBoardRecord = true
	return true
end

local function rank_refresh_at(now, active, saveCurrent)
	if not rankPersistenceOK or not rankLoaded then return false end
	if now <= 0 then return false end
	local today = rank_day(now)
	local changed = false
	if rankPeriod and (rankDay ~= today or rankSettlements[rankPeriod] or not active) then
		if not rank_close_period() then return false end
		changed = true
	end
	if not rankPeriod and active then
		rankGeneration = rankGeneration + 1
		rankDay = today
		rankPeriod = today .. ":" .. rankGeneration
		YbConsumeRanking = {}
		rankActorTotals = {}
		YbConsumeRanking_isModified = true
		rankNeedsBoardRecord = true
		changed = true
	end
	YbConsumeRanking_inTime = rankPeriod ~= nil and active
	if YbConsumeRanking_isModified and (changed or saveCurrent or rankNeedsBoardRecord)
		and not YbConsumeRanking_save() then return false end
	-- Keep the retry timer even if the final activity has ended.
	local retry = YbConsumeRanking_inTime or #rankDeferredConsumes > 0
	for _, snapshot in pairs(rankSettlements) do
		for _, item in ipairs(snapshot.recipients) do
			if item.status == "pending" or item.status == "failed" then retry = true end
		end
	end
	if retry then
		rank_ensure_timer()
	else System.deleteTimer("YbConsumeRanking_OnTimer") end
	return true
end

local function rank_actor_total_by_var(var, actorId)
	local total = rankActorTotals[actorId] or 0
	if not var then return nil, total end
	if var.YbConsumeRanking_period ~= rankPeriod then
		if var.YbConsumeRanking_period == nil and var.dayConsumeYB ~= nil
			and var.YbConsumeRanking_legacy == nil then
			var.YbConsumeRanking_legacy = {value=var.dayConsumeYB,
				takenOverAt=System.getCurrMiniTime(), period=rankPeriod}
		end
		-- Only a score in this persisted/current board proves an untagged amount.
		var.YbConsumeRanking_period = rankPeriod
	else
		total = math.max(total, var.YbConsumeRanking_total or 0)
	end
	-- A recovered board can be newer than the persisted actor record.
	for _, item in ipairs(YbConsumeRanking) do
		if item.id == actorId then
			total = math.max(total, item.yb)
			break
		end
	end
	var.YbConsumeRanking_total = total
	var.dayConsumeYB = total
	return var, var.dayConsumeYB
end

local function rank_actor_total(sysarg)
	return rank_actor_total_by_var(Actor.getStaticVar(sysarg),
		Actor.getIntProperty(sysarg, PROP_ENTITY_ID))
end

local function rank_drain_deferred()
	while #rankDeferredConsumes > 0 do
		local item = rankDeferredConsumes[1]
		if not rank_refresh_at(item.time, true) then return false end
		if item.eventId and item.eventId <= rankLastEventId then
			-- An uncertain write was present in the journal after recovery.
			rank_actor_total_by_var(item.var, item.id)
			table.remove(rankDeferredConsumes, 1)
		else
			local _, previous = rank_actor_total_by_var(item.var, item.id)
			local total = previous + item.amount
			if not item.eventId then
				rankNextEventId = rankNextEventId + 1
				YbConsumeRanking_nextEventId = rankNextEventId
				item.eventId = rankNextEventId
			end
			if not rank_append(table.concat({"C", item.eventId, rankPeriod,
				item.id, total, rank_hex(item.name)}, "\t")) then return false end
			rankLastEventId = item.eventId
			local ok, err = pcall(function()
				rankActorTotals[item.id] = total
				if item.var then
					item.var.YbConsumeRanking_period = rankPeriod
					item.var.YbConsumeRanking_total = total
					item.var.dayConsumeYB = total
				end
				if total >= PublicTestCfg.YbConsumeRanking.minConsume then
					YbConsumeRankingConsumeYbById(item.id, item.name, total, false)
				end
			end)
			if not ok then
				rankPersistenceOK = false
				rank_log("consume replay needed before settlement: " .. tostring(err))
				rank_ensure_timer()
				return false
			end
			table.remove(rankDeferredConsumes, 1)
		end
	end
	return true
end

local function rank_service(saveCurrent)
	if not rankLoaded or not rankPersistenceOK then return false end
	if not rank_drain_deferred() then return false end
	local now = System.getCurrMiniTime()
	if now <= 0 or not rank_refresh_at(now, IsYbConsumeRankingTime(), saveCurrent) then return false end
	rank_deliver_pending()
	return rankPersistenceOK
end

-- Read-only reconciliation data; this function never resends uncertain mail.
function YbConsumeRanking_GetSettlementStatus()
	local result = {}
	for period, snapshot in pairs(rankSettlements) do
		for _, item in ipairs(snapshot.recipients) do
			table.insert(result, {period=period, actorId=item.id, ranking=item.ranking,
				value=item.yb, award=item.award, status=item.status, detail=item.detail})
		end
	end
	return result
end

-- Call only after checking the actor's actual mailbox. false means that the
-- mail is confirmed absent and may be retried by the settlement timer.
function YbConsumeRanking_ResolveUnknown(period, actorId, delivered)
	if type(period) ~= "string" or type(actorId) ~= "number"
		or (delivered ~= true and delivered ~= false)
		or not rankLoaded or not rankPersistenceOK then return false end
	local snapshot = rankSettlements[period]
	if not snapshot then return false end
	for _, item in ipairs(snapshot.recipients) do
		if item.id == actorId and item.status == "unknown" then
			local status = delivered and "sent" or "failed"
			local detail = delivered and "operator confirmed mailbox delivery"
				or "operator confirmed mail absent"
			if not rank_append(table.concat({"R", period, actorId, status,
				rank_hex(detail)}, "\t")) then return false end
			item.status, item.detail = status, detail
			if not delivered then rank_ensure_timer() end
			return true
		end
	end
	return false
end

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
	YbConsumeRanking = {}
	YbConsumeRanking_minYb = 0
	YbConsumeRanking_isModified = false
	YbConsumeRanking_inTime = false
	rankSettlements, rankPeriod, rankDay = {}, nil, nil
	rankActorTotals, rankLastEventId, rankNeedsBoardRecord = {}, 0, false
	rankGeneration, rankPersistenceOK, rankLoaded = 0, true, false
	if System.getCurrMiniTime() <= 0 then return end
	local ok, hasBoard = pcall(rank_read_journal)
	if not ok then
		rankPersistenceOK = false
		rank_log("journal recovery stopped: " .. tostring(hasBoard))
		rank_ensure_timer()
		return
	end
	if not hasBoard then
		-- Import the legacy BOM/time file, INCLUDING an unsettled previous day.
		local file, openError, errorCode = io.open("data/runtime/ranking/YbConsumeRanking.txt", "r")
		if not file and errorCode ~= 2 then
			rankPersistenceOK = false
			rank_log("legacy ranking cannot be read; migration paused: " .. tostring(openError))
			rank_ensure_timer()
			return
		end
		if file then
			local content = file:read("*a")
			file:close()
			if content == nil then
				rankPersistenceOK = false
				rank_log("legacy ranking read failed; migration paused")
				rank_ensure_timer()
				return
			end
			content = string.gsub(content, "^\239\187\191", "")
			local result = 0
			for line in string.gmatch(content .. "\n", "([^\n]*)\n") do
				line = string.gsub(line, "\r$", "")
				if line ~= "" then
					local parseOK, parsed = pcall(YbConsumeRanking_parse_line, line, result)
					if not parseOK or parsed ~= 0 then
						rankPersistenceOK = false
						rank_log("legacy ranking malformed; recovery paused")
						rank_ensure_timer()
						return
					end
					result = parsed
				end
			end
			if content ~= "" and not rankPeriod then
				rankPersistenceOK = false
				rank_log("legacy ranking has no date header; migration paused")
				rank_ensure_timer()
				return
			end
		end
	end
	table.sort(YbConsumeRanking, YbConsumeRanking_comps)
	YbConsumeRanking_check_size()
	if #YbConsumeRanking > 0 then YbConsumeRanking_minYb = YbConsumeRanking[#YbConsumeRanking].yb end
	for _, item in ipairs(YbConsumeRanking) do
		rankActorTotals[item.id] = math.max(rankActorTotals[item.id] or 0, item.yb)
	end
	YbConsumeRanking_isModified = not hasBoard or YbConsumeRanking_isModified
	rankNeedsBoardRecord = not hasBoard
	rankLoaded = true
	rank_service(true)
end

function YbConsumeRanking_save()
	if not YbConsumeRanking_isModified then return true end
	local now = System.getCurrMiniTime()
	if now <= 0 or not rankPersistenceOK then return false end
	local day = rankDay or rank_day(now)
	local records = rankPeriod and YbConsumeRanking or {}
	if not rank_append(table.concat({"B", rankPeriod or "-", day, rankGeneration,
		#records, rank_rows(records, false)}, "\t")) then return false end
	YbConsumeRanking_isModified = false
	rankNeedsBoardRecord = false
	YbConsumeRanking_minYb = #YbConsumeRanking > 0 and YbConsumeRanking[#YbConsumeRanking].yb or 0
	return true
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
	if not time or time <= 0 then return true end
	rankDay = rank_day(time)
	rankPeriod = rankDay .. ":0"
	return false
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
	if not rank_service() then return end

	if not YbConsumeRanking_inTime then return end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sPublicTest)
	DataPack.writeByte(netPack, 3) -- S2C_PublicTestMsgId.MyYbRankData
	
	local var = rank_actor_total(sysarg)
	
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
	rank_service()
end

function YbConsumeRanking_OnTimer(leftTimes)
	if not rankLoaded or not rankPersistenceOK then
		YbConsumeRanking_load()
	else
		rank_service(true)
	end
end

function YbConsumeRankingConsumeYbById(actorId, actorName, totalYb, silent)
	if totalYb <= 0 then return end
		
	local newPos, oldPos, count = YbConsumeRanking_find_insert_pos(actorId, totalYb)
	if newPos == 0 then
		return
	end	

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
	if not silent and newPos ~= oldPos and newPos >= 1 and newPos <= 20 then
		local msg = string.format("玩家<(c0xFF00FF00)%s>元宝消耗排行第%d！", actorName, newPos)
		System.broadcastTipmsg(msg, ttScreenCenterBigNotice)
	end	
end

function YbConsumeRankingConsumeYb(sysarg, totalYb)
	return YbConsumeRankingConsumeYbById(Actor.getIntProperty(sysarg, PROP_ENTITY_ID),
		Actor.getName(sysarg), totalYb, false)
end

function OnRankingConsumeYbEvent(sysarg, nYuanBao)
	if type(nYuanBao) ~= "number" or nYuanBao <= 0 then return end
	local now = System.getCurrMiniTime()
	if now <= 0 then return end
	if IsYbConsumeRankingTime() then
		table.insert(rankDeferredConsumes, {time=now, id=Actor.getIntProperty(sysarg, PROP_ENTITY_ID),
			name=Actor.getName(sysarg), amount=nYuanBao, var=Actor.getStaticVar(sysarg)})
	end
	if not rankLoaded or not rankPersistenceOK then
		YbConsumeRanking_load()
	else
		rank_service()
	end
	
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
	-- Callers have already set their own activity state. Joining an existing
	-- same-day board must not settle it or reset any player's valid total.
	rank_service()
end

function OnYbConsumeRanking_ActivityEnd()
	-- A different activity may still own this shared daily board.
	rank_service()
end

function YbConsumeRanking_sendAwardMails()
	if not rank_service() then return end
	if rank_close_period() and YbConsumeRanking_save() then rank_deliver_pending() end
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