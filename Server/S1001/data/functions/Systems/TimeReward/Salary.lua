
--#include "data\config\guide\SignInAndSalary.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once

local salaryTimes = 5
MiscsImplement.GetSalaryData = function( sysarg, msgid, packet )
	local svar = Actor.getStaticVar(sysarg)
	local salaryTime = svar.SalaryTime
	if not salaryTime then salaryTime = 0 end
	local salary,nowSalary,lastSalary = Actor.getSalary(sysarg, 0, 0)
	--print(salaryTime,nowSalary*salaryTimes,lastSalary*salaryTimes)
	local npack = DataPack.allocPacket(sysarg, 139, 65)
	if not npack then return false end
	DataPack.writeUInt(npack, salaryTime)
	DataPack.writeUInt(npack, math.floor(nowSalary*salaryTimes/60))
	DataPack.writeUInt(npack, math.floor(lastSalary*salaryTimes/60))
	
	DataPack.flush(npack)
	return true
end

MiscsImplement.GetSalaryAward = function( sysarg, msgid, packet )
	local config = SignInAndSalary
	local salary,nowSalary,lastSalary = Actor.getSalary(sysarg, 0, 0)
	
	if lastSalary <= 0 then 
		return 
	end
	
	local hours = math.floor((lastSalary * salaryTimes)/60)
	
	--print("hours:"..hours)
	
	local awards = {}
	for k, v in ipairs(config.awards) do
		local award = {type=v.type, id=v.id, count=v.count*hours}
		table.insert(awards, award)
	end
	
	if Awards.CheckBagGridCount(sysarg, awards) == false then return end
	
	Actor.setSalary(sysarg, nowSalary, 0)
	
	Awards.Give(sysarg, awards, 846, string.format(Lang.LogTips.l00125, hours))
	
	local npack = DataPack.allocPacket(sysarg, 139, 66)
	if not npack then return false end
	DataPack.flush(npack)
	return true
end



MiscsImplement.registerMsgHandler(72, MiscsImplement.GetSalaryData)
MiscsImplement.registerMsgHandler(73, MiscsImplement.GetSalaryAward)