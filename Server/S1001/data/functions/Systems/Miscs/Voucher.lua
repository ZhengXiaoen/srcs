
--#include "data\functions\ActorEvent\NormalItem\UseVoucher.lua" once

MiscsImplement.Voucher = function( sysarg, msgid, packet )
	local itemGuid = DataPack.readInt64(packet)
	local goodsId = DataPack.readInt(packet)
	BuyVoucherItem(sysarg, itemGuid, goodsId)
end


MiscsImplement.registerMsgHandler(66, MiscsImplement.Voucher)