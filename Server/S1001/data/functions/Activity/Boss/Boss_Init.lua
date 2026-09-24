
--#include "BossCommon.lua" once

function BossInit(sysarg)
	RankingBossInit(sysarg)
end

function LoadActiveExpRate()
	local sysVar = System.getStaticVar()
	local level = sysVar.BlessTreeTitleIdx
	local deadline = sysVar.BlessTreeDeadline
	local nNowDt = System.getRealtimeMiniTime()
	if deadline and deadline > nNowDt and level then
		System.setActivtyExpRate(FireworkConfig.BuffBaseRate * level, deadline - nNowDt)
	end
end

function ResetHolidayIcon()
	if System.getRealtimeMiniTime() < 99791973 then
		System.setHolidayOnOff(1,0)
	end
end

function BossFinal(sysarg)

end

table.insert(InitFnTable, BossInit)
table.insert(InitFnTable, LoadActiveExpRate)
table.insert(InitFnTable, ResetHolidayIcon)
table.insert(FinaFnTable, BossFinal)