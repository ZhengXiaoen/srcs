

--#include "data\functions\Tasks\CampTasks\CampDart\CampDartCommon.lua" once
--#include "data\config\camp\CampActivities.lua" once --阵营活动设置 

MiscsImplement.CampDartChangeSlave = function (sysarg,msgid, packet)
	local consumeType = DataPack.readByte(packet)
	--print("consumeType:"..consumeType)
	if consumeType then
		ChangeSlave(sysarg, 0, consumeType)  
	end

end


MiscsImplement.registerMsgHandler(38,MiscsImplement.CampDartChangeSlave)