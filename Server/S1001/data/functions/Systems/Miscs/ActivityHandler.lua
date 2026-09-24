
--#include "data\config\misc\scriptTimerConfig\activityTips.lua" once 

function SendAllActivityTips(ActorPtr)
    local count = #activityTips
	local npack = DataPack.allocPacket(ActorPtr,139,103)  --申请一个数据包
	for i = 1, count do
		DataPack.writeString(npack,activityTips[i].tips)
		DataPack.writeString(npack,activityTips[i].ensure)
	end
	DataPack.flush(npack)
end

MiscsImplement.registerMsgHandler(103, SendAllActivityTips); -- 注册协议处理函数