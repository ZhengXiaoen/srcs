--lua script

--#include "data\config\misc\UpdateListConfig.lua" once

function getSPString()
	local spid = System.getSystemDef("SPID")
	return SPUpdateLists[spid] or SPUpdateLists["*"] or ""
end

MiscsImplement.getSPUpdateInfo = function( sysarg, msgid, packet ) 
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendUpdateList )
	if netPack then
		DataPack.writeString( netPack, getSPString() )
		DataPack.flush( netPack )
	end	
end

--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetUpdateList, MiscsImplement.getSPUpdateInfo)