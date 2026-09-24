--#include "data\config\item\MergerServerConfig.lua" once

MiscsImplement.handleGetDiscountGift = function(sysarg, msgid, packet)
	
	if not MergerServerCfg.DiscountShop then return false end

	local nGetId = DataPack.readByte(packet) 	--领取的ID 1~6
	
	return true
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetDiscountGift, MiscsImplement.handleGetDiscountGift)