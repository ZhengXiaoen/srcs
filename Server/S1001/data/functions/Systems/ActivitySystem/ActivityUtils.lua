
-- 检测时间(0 还没开始; 非0则在活动时间内)
function checkActivityTime(times)
	local nIdx = 0;
	for i = 1, #times do
		local t = times[i]
				
		local endHour = t[3]
		if endHour == 0 then
			endHour = 24;
		end
		
		if (System.isInTimeRange(t[1], t[2], 0, endHour, t[4], 0)) == true then
			nIdx = i;
			break;
		end
	end
	return nIdx;
end

function sendJoinActivity(sysarg, activityType, leftSecond)
	if leftSecond < 0 then --至少也保证为0，不然负数就溢出了。
		leftSecond = 0
	end
	local netPack = DataPack.allocPacket(sysarg, 145, LogicCmd.activitySys.sub.sJoinActivity)
	DataPack.writeByte(netPack, activityType)
	DataPack.writeUInt(netPack, leftSecond)
	DataPack.flush(netPack)
end

function sendExitActivity(sysarg, activityType)
	local netPack = DataPack.allocPacket(sysarg, 145, LogicCmd.activitySys.sub.sExitActivity)
	DataPack.writeByte(netPack, activityType)
	DataPack.flush(netPack)
end

function sendActivityEnterNextLayer(sysarg, activityType)
	local netPack = DataPack.allocPacket(sysarg, 145, LogicCmd.activitySys.sub.sEnterNextLayer)
	DataPack.writeByte(netPack, activityType)
	DataPack.flush(netPack)
end


