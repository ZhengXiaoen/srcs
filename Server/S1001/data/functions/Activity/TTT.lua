function JustTestNewMis(sysarg,sysid,packet)
	local nType = DataPack.readByte(packet)
	print("nType="..nType)
	
	local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sTestNewMis)
	DataPack.writeByte(netPack,100)
	DataPack.flush(netPack)
end


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cTestNewMis,JustTestNewMis)
