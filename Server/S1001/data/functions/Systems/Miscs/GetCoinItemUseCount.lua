--获取招财符的使用次数
function MiscsImplement.GetCoinItemUseCount(sysarg, msgid,packet)
	local nItemId = DataPack.readUInt( packet )
	local pack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sSendCoinItemUseCount)
	if pack == nil then return end	
	local var = Actor.getStaticVar(sysarg)
	local d = var.d
	local nDparam = 0
	if nItemId == 325 then	--使用招财符
		nDparam = 16
	elseif nItemId == 326 then	--使用小金条
		nDparam = 17
	end
	DataPack.writeShort(pack, nItemId)
	if nDparam > 0 then
		DataPack.writeShort(pack, d[nDparam])
	else
		DataPack.writeShort(pack, nDparam)
	end
	DataPack.flush(pack)
end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetCoinItemUseCount,MiscsImplement.GetCoinItemUseCount)