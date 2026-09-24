-- 节日活动
--#include "data\functions\new_activity\festival\pay_money.lua" once

--手动开启
function startFestivalByCode(sysarg, begin_time, openday)
	begin_time = tonumber(begin_time)
	openday = tonumber(openday)
	--local cur_time = System.getCurrMiniTime()
	--http://tool.chinaz.com/Tools/unixtime.aspx
	--测试用的，要手动开启的话，需要自己填写这个东西。
	local args = {begin_time, openday}	
	backcmd_FestivalActs(args)
end

-- 后台命令(节日活动)
function backcmd_FestivalActs(args)
	local begin_time = tonumber(args[1]) -- UTC
	if begin_time == nil then return false end -- 参数错误
	
	local cur_time = System.getCurrMiniTime()
	local openday = 0
	local end_time = 0
	
	if begin_time > 0 then
		openday = tonumber(args[2]) -- 开启天数
		if openday == nil or openday <= 0 then return false end -- 参数错误
		
		--(现在可以手动开启，先屏蔽了。)
		begin_time = System.utcToMiniDateTime(begin_time)
		
		-- 晚上凌晨结束
		local nYear,nMonth,nDay,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(begin_time)	
		--print("begin_time="..begin_time)
		--print("nYear="..nYear)
		--print("nMonth="..nMonth)
		--print("nDay="..nDay)
		local zeroTime = System.encodeNumTime(nYear,nMonth,nDay,0,0,0)				
		
		end_time = zeroTime + openday * 86400		
		if cur_time >= end_time then --已经过期了
			begin_time = 0
			return false -- 参数错误
		end
	end
	
	local svar = System.getStaticVar()
	if begin_time > 0 then
		svar.festival_acts_begin_time = begin_time
		svar.festival_acts_openday = openday
		svar.festival_acts_end_time = end_time
		
		local nYear,nMonth,nDay,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(begin_time)	
		print(string.format("节日活动 开始时间为[%d-%d-%d %d:%d:%d]",nYear,nMonth,nDay,nHour,nMinute,nSecond))
	else
		--参数有问题
		svar.festival_acts_begin_time = nil
		svar.festival_acts_openday = nil
		svar.festival_acts_end_time = nil
		print("节日活动 结束了")
	end
	
	-- 广播给在线的玩家	
	if begin_time == 0 or (cur_time >= begin_time and cur_time < end_time) then
		festival_acts_start(begin_time , openday)
		broadcast_msg_festival_acts_data(begin_time, openday)	
	else
		local offset = begin_time - cur_time
		--print("offset="..offset)
		System.deleteTimer("on_timer_festival_acts")
		System.addTimer("on_timer_festival_acts", offset * 1000, 1)
	end

	return true
end



--定时器开启活动
function on_timer_festival_acts()
	System.deleteTimer("on_timer_festival_acts")
	local svar = System.getStaticVar()
	local begin_time = svar.festival_acts_begin_time
	if begin_time ~= nil and begin_time > 0 then
		local openday = svar.festival_acts_openday
		
		festival_acts_start(begin_time, openday)
		broadcast_msg_festival_acts_data(begin_time, openday)	
	end
end

--广播开启活动
function broadcast_msg_festival_acts_data(begin_time, openday)
	-- 广播给在线的玩家	
	local npack = DataPack.allocPacketEx()
	if (npack ~= nil) then
		-- 这里协议修改，festival_acts_send_data() 也要改
		DataPack.writeByte(npack, LogicCmd.miscSysEx.sysId)
		DataPack.writeByte(npack, LogicCmd.miscSysEx.sub.sFestivalActs)
		DataPack.writeByte(npack, 0) -- 0 为活动系统本身，否则为活动ID
		DataPack.writeUInt(npack, begin_time) -- 0 为关闭
		DataPack.writeByte(npack, openday) -- 开启天数
		
		Actor.worldBroadCastMsg(npack, 0)		
		DataPack.freePacketEx(npack)
	end
end

-- 节日活动开始
function festival_acts_start(begin_time, openday)
	print("festival_acts_start")
end

--这个是什么东西，(写错了函数名?)
--function festival_acts_send_data(sysarg, begin_time, openday)
function festival_acts_send_icon_state(sysarg, begin_time, openday)   --登录的时候发送那个图标状态
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sFestivalActs)
   
    DataPack.writeByte(netPack, 0) -- 0 为活动系统本身，否则为活动ID
    DataPack.writeUInt(netPack, begin_time) -- 0 为关闭
    DataPack.writeByte(netPack, openday) -- 开启天数

	DataPack.flush(netPack)
end


--登录的时候发送那个图标状态
function festival_acts_on_player_login(sysarg, args)
	local svar = System.getStaticVar()
	local begin_time = svar.festival_acts_begin_time
	if begin_time == nil or begin_time <= 0 then -- 活动没有开始
		return
	end		
			
	local openday = svar.festival_acts_openday
	local isCrossDay = args[1]
	
	festival_acts_send_icon_state(sysarg, begin_time, openday)
	
end

function festival_acts_check_cfg_time()
	local cfgTime = activityTotle_cfg.time
	if cfgTime == nil then return false end
	
	local end_time = System.encodeNumTime(cfgTime[4], cfgTime[5], cfgTime[6], 23, 59, 59)
	local cur_time = System.getCurrMiniTime()
	if cur_time >= end_time then -- 已经结束了
		return false
	end
	
	local begin_time = System.encodeNumTime(cfgTime[1], cfgTime[2], cfgTime[3], 0, 0, 0)	
	local openday = System.getTimeDay(cfgTime[1], cfgTime[2], cfgTime[3], cfgTime[4], cfgTime[5], cfgTime[6]) + 1

	local svar = System.getStaticVar()
	
	svar.festival_acts_begin_time = begin_time
	svar.festival_acts_openday = openday
	svar.festival_acts_end_time = end_time
		
	local nYear,nMonth,nDay,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(begin_time)	
	print(string.format("节日活动 开始时间为[%d-%d-%d %d:%d:%d]",nYear,nMonth,nDay,nHour,nMinute,nSecond))
	
	return true
end

--服务器开启触发事件
function festival_acts_on_server_started()
	local svar = System.getStaticVar()
	local begin_time = svar.festival_acts_begin_time
	local end_time = svar.festival_acts_end_time
	local cur_time = System.getCurrMiniTime()
	
	local isCheckCfgTime = false
	if begin_time == nil or begin_time <= 0 then -- 活动没有开始 (新区检查)
		isCheckCfgTime = true
	end
	
	if end_time == nil or cur_time > end_time then
		isCheckCfgTime = true
	end		
		
	if isCheckCfgTime then -- 活动没有开始
		if festival_acts_check_cfg_time() == false then
			return
		end
		
		begin_time = svar.festival_acts_begin_time
		end_time = svar.festival_acts_end_time
	end		

	local openday = svar.festival_acts_openday
		
	if cur_time < begin_time then -- 活动时间还没有到
		local offset = begin_time - cur_time
		System.deleteTimer("on_timer_festival_acts")
		System.addTimer("on_timer_festival_acts", offset * 1000, 1)
	elseif cur_time >= begin_time and cur_time < end_time then -- 活动正在进行中	
	end

end

-- 客户端消息
function festival_acts_main(sysarg, sysid, packet)
	local msgid = DataPack.readByte(packet)
	local svar = System.getStaticVar()
	local begin_time = svar.festival_acts_begin_time
	if begin_time == nil or begin_time <= 0 then -- 活动没有开始
		return
	end		
	
	local cur_time = System.getCurrMiniTime()
	
	local end_time = svar.festival_acts_end_time 
	if end_time==nil or end_time<=cur_time then --已经超过活动时间了
		return
	end
	
	if cur_time < begin_time then -- 活动还没有开始
		return
	end
	
	
	-------------------是否在活动期间内
	if msgid == 1 then -- 每日充值
		festival_acts_pay_money_main(sysarg, packet)
	elseif msgid==2 then --在线抽奖
		festival_acts_onlineGiveAward(sysarg, packet)
	elseif msgid==3 then --消费
		festival_acts_consumeGiveAward(sysarg, packet)
	elseif msgid==4 then --购买
		festival_acts_buySomething(sysarg, packet)
	end
	
end

-- 后台命令(节日活动): FestivalActs|开始时间(UTC时间)0则结束, 开启天数(结束时不用传)
RegisterBackCmd("FestivalActs", backcmd_FestivalActs)

-- 注册玩家登陆事件
registerLuaEventCallback(LuaEventId.PlayerLogin, festival_acts_on_player_login)
-- 注册服务器启动事件
registerLuaEventCallback(LuaEventId.ServerStarted, festival_acts_on_server_started)


