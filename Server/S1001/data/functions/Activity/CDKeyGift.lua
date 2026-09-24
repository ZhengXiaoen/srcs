--¡Ï»°–Ú¡–∫≈ø®Ω±¿¯

MiscsImplement.handleGetCdkeyGift = function( sysarg, msgid, packet )

	if not packet then return false end

	local CDKEY = DataPack.readString(packet)
	
	if CDKEY == nil then return false end
		
	local sDvar = Actor.getDyanmicVar(sysarg)
	sDvar.getRewardCodeBag = 0
	
	Actor.queryServicesAddCard(sysarg,CDKEY,true)	
end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetCdkeyGift, MiscsImplement.handleGetCdkeyGift)