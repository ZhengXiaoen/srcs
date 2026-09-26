--#include "data\config\activity\SpringFestivalCfg.lua" once

-- 春节活动
SpringFestivalActivityDisabled = true -- 彻底关闭春节活动

-- func(sysarg, packet)
g_spring_festival_funcs = {}

g_spring_festival_start_end_funcs = {}

g_spring_festival_login_funcs = {}
g_spring_festival_online_cross_day_funcs = {}

function clone_spring_festival_time(time)
	local newTime = {}
	if time == nil then
		return newTime
	end

	newTime[1] = time[1]
	newTime[2] = time[2]
	newTime[3] = time[3]
	newTime[4] = time[4]
	newTime[5] = time[5]
	newTime[6] = time[6]
	return newTime
end

function get_spring_festival_time(init_if_missing)
	local svar = System.getStaticVar()
	local needInit = false
	if svar.SpringTime == nil or svar.SpringTime <= 0 then
		needInit = true
	elseif init_if_missing == true then
		local startTime = svar.SpringTime
		local y, m, d = System.GetSystemTimeInMiniTime(startTime)
		local endTime = startTime + 11 * 24 * 3600
		local ey, em, ed = System.GetSystemTimeInMiniTime(endTime)
		if System.isInDateRange(y, m, d, 0, 0, 0, ey, em, ed, 23, 59, 59) == false then
			needInit = true
		end
	end

	if init_if_missing == true and needInit then
		local y, m, d = System.getDate()
		svar.SpringTime = System.encodeNumTime(y, m, d, 0, 0, 0)
		System.saveStaticVar()
		svar = System.getStaticVar()
	end

	if svar.SpringTime ~= nil and svar.SpringTime > 0 then
		local startTime = svar.SpringTime
		local y, m, d = System.GetSystemTimeInMiniTime(startTime)
		local endTime = startTime + 11 * 24 * 3600
		local ey, em, ed = System.GetSystemTimeInMiniTime(endTime)
		local time = {y, m, d, ey, em, ed}
		SpringFestivalCfg.time = clone_spring_festival_time(time)
		return time
	end

	if SpringFestivalCfg ~= nil and SpringFestivalCfg.time ~= nil then
		return clone_spring_festival_time(SpringFestivalCfg.time)
	end

	return {}
end

-- var.spring_flags
-- 0 到 7 为红包奖励领取标志
-- 8 到 15 为绝版年货购买标志

function register_spring_festival_func(id, func)
	if id == nil or func == nil then
		return false
	end
	
	--if g_spring_festival_funcs[id] ~= nil then
	--	return false
	--end
	
	g_spring_festival_funcs[id] = func
	return true
end

function register_spring_festival_start_end_func(func)
	if func == nil then
		return false
	end
	
	for i, v in ipairs(g_spring_festival_start_end_funcs) do
		if v == func then
			return false
		end
	end
		
	table.insert(g_spring_festival_start_end_funcs, func)
	return true
end

function register_spring_festival_login_func(func)
	if func == nil then
		return false
	end
	
	for i, v in ipairs(g_spring_festival_login_funcs) do
		if v == func then
			return false
		end
	end
		
	table.insert(g_spring_festival_login_funcs, func)
	return true
end

function register_spring_festival_online_cross_day_func(func)
	if func == nil then
		return false
	end
	
	for i, v in ipairs(g_spring_festival_online_cross_day_funcs) do
		if v == func then
			return false
		end
	end
		
	table.insert(g_spring_festival_online_cross_day_funcs, func)
	return true
end

-- 是否在春节活动时间内
function is_spring_festival_time()
	if SpringFestivalActivityDisabled then return false end
	local time = get_spring_festival_time(false)
	if time == nil or time[1] == nil then
		return false
	end

	return System.isInDateRange(time[1], time[2], time[3], 0, 0, 0, time[4], time[5], time[6], 23, 59, 59)
end

function get_spring_festival_day_count()
	if not is_spring_festival_time() then return 0 end
	
	local time = get_spring_festival_time(false)
	if time == nil or time[1] == nil then return 0 end

	local y,m,d = System.getDate()
	local day = System.getTimeDay(time[1], time[2], time[3], y, m, d)
	if day < 0 then return 0 end	
	
	return day + 1
end

--登陆
function on_spring_festival_player_login(sysarg, isCrossDay)
	if not is_spring_festival_time() then
		AllActivityButtonState(sysarg,84,0) -- 隐藏已有的新春活动入口
		return
	end
	
	if isCrossDay ~= 0 then isCrossDay = true
	else isCrossDay = false end
		
	local _time = get_spring_festival_time(false)
	if _time == nil or _time[1] == nil then return end

	local datetime = string.format("%d-%d-%d %d-%d-%d",_time[1], _time[2], _time[3], _time[4], _time[5], _time[6])
	AllActivityButtonState(sysarg,84,1,datetime) -- 显示 icon	
	
	for i, func in ipairs(g_spring_festival_login_funcs) do
		func(sysarg, isCrossDay)
	end
end

--在线跨天
function on_spring_festival_online_cross_day(sysarg)
			
	if is_spring_festival_time() then		
		local _time = get_spring_festival_time(false)
		if _time == nil or _time[1] == nil then return end

		local datetime = string.format("%d-%d-%d %d-%d-%d",_time[1], _time[2], _time[3], _time[4], _time[5], _time[6])
		AllActivityButtonState(sysarg,84,1,datetime) -- 显示 icon		
	
		for i, func in ipairs(g_spring_festival_online_cross_day_funcs) do
			func(sysarg)
		end
	else
		AllActivityButtonState(sysarg,84,0) -- 隐藏 icon			
	end
	
end

function ensure_spring_festival_activity(is_started_server)
	if SpringFestivalActivityDisabled then
		local dvar = System.getDyanmicVar()
		if dvar.start_spring_festival_activity == 1 then
			end_spring_festival_activity()
		end
		return
	end
	if System.getCurrMiniTime() < System.getServerOpenTime() then return end
	local previousStart = System.getStaticVar().SpringTime
	get_spring_festival_time(true)
	local cycleChanged = previousStart ~= System.getStaticVar().SpringTime
	local dvar = System.getDyanmicVar()
	if cycleChanged and dvar.start_spring_festival_activity == 1 then
		end_spring_festival_activity()
	end
	if is_spring_festival_time() and (is_started_server or dvar.start_spring_festival_activity ~= 1) then
		start_spring_festival_activity(is_started_server == true and not cycleChanged)
	end
end

function on_spring_festival_started_logic_server()
	ensure_spring_festival_activity(true)
end

-- 春节活动跨天
function on_spring_festival_new_day_arrive()
	ensure_spring_festival_activity(false)
end

function start_spring_festival_activity(is_started_server)
	if SpringFestivalActivityDisabled then return end
	print("----春节活动开始----")
	
	local dvar = System.getDyanmicVar()
	dvar.start_spring_festival_activity = 1 -- 设置春节活动开始标志
	
	for i, func in ipairs(g_spring_festival_start_end_funcs) do
		func(true, is_started_server)
	end	
	
end

function end_spring_festival_activity()
	print("----春节活动结束----")
	
	local dvar = System.getDyanmicVar()
	dvar.start_spring_festival_activity = nil -- 去掉春节活动开始标志
	
	for i, func in ipairs(g_spring_festival_start_end_funcs) do
		func(false, false)
	end
		
end

-- 春节活动
function on_msg_spring_festival_activity(sysarg, sysid, packet)
	if sysid ~= LogicCmd.miscSys.sub.cSpringFestivalActivity then
		print("error on_msg_spring_festival_activity, sysid="..sysid)
		return
	end
	
	if not is_spring_festival_time() then
		Actor.sendTipmsg(sysarg,"春节活动已经结束",ttFlyTip)
		return
	end
	
	local msgId = DataPack.readByte(packet)
		
	local func = g_spring_festival_funcs[msgId]
	if func == nil then
		print("error on_msg_spring_festival_activity, unknown msgId="..msgId)
		return
	end
	
	func(sysarg, packet)
end
