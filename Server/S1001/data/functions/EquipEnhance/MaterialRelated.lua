--#include "data\config\equipSynthesis\EquipMaterial.lua" once

--血炼石相关操作
MiscsImplement.MaterialRelated = function( sysarg, msgid, packet )
	
	local nType = DataPack.readByte(packet)
	local nIndex = DataPack.readByte(packet)
	
	if not Material then return end
	if nType > 0 and nType <= 4 then
		EquipMaterial(sysarg,nType,nIndex)
	end	
end

function EquipMaterial(sysarg,nType,nIndex)
	
	local config
	if nType == 1 then
		config = Material.BloodRefining.Synthesis[nIndex]
	elseif nType == 2 then
		config = Material.BloodRefining.Dismantling[nIndex]
	elseif nType == 3 then
		config = Material.UpgradeStone.Synthesis[nIndex]
	elseif nType == 4 then
		config = Material.UpgradeStone.Dismantling[nIndex]
	end
	if not config then return end	
	
	local consumeData = {}
	local ret = CheckAllConsume(sysarg, false, config.consume, true, consumeData)
	if not ret then return end

	if not Awards.CheckBagGridCount(sysarg,config.award) then
		return
	end

	ret = DeductAllConsume(sysarg, false, config.consume, GameLog.cNewMaterialAwardsConsume)
	if not ret then return end
	
	local nAward = config.award
	local nLogStr = ""
	if nType == 1 then
		nLogStr = Lang.LogTips.l00219
	elseif nType == 2 then
		nLogStr = Lang.LogTips.l00220
	elseif nType == 3 then
		nLogStr = Lang.LogTips.l00221
	elseif nType == 4 then
		nLogStr = Lang.LogTips.l00222
	end
	
	Awards.Give(sysarg,config.award,1017,nLogStr)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cMaterialRelated, MiscsImplement.MaterialRelated)