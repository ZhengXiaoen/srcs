--#include "data\config\equipSynthesis\EquipStoveCfg.lua" once

 --¶ÜÅÆ¡¢±¦Ê¯¡¢ÁéÖé¶Ò»»¶ÜÁé¡¢±¦Ê¯½á¾§¡¢ÁéÖéËéÆ¬
MiscsImplement.EquipExchange = function( sysarg,msgid,packet )
	local nType = DataPack.readByte(packet)
	local nIndex =DataPack.readByte(packet)
	local group = nil
	local sitem = ""
	local nStaticId = 0
	if nType == 1 then
		group = EquipStoveCfg.EquipExchange[1]
		sitem = Lang.ScriptTips.exchang004
		nStaticId = PROP_ACTOR_SHIELD_SPIRIT
	elseif nType == 2 then
		group = EquipStoveCfg.EquipExchange[2]
		sitem = Lang.ScriptTips.exchang005
		nStaticId = PROP_ACTOR_GEM_CRYSTAL
	elseif nType == 3 then
		group = EquipStoveCfg.EquipExchange[3]
		sitem = Lang.ScriptTips.exchang003
		nStaticId = PROP_ACTOR_PEARL_CHIP
	end
	if group == nil then return end
	if nIndex > table.getn(group.item) then return end
	local nCount = Actor.getItemCount(sysarg,group.item[nIndex].itemid)
	if nCount == 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.exchang001,ttFlyTip)
		return true
	end
	
	Actor.removeItem(sysarg,group.item[nIndex].itemid,1)
	local myMaterial = Actor.getUIntProperty(sysarg, nStaticId)
	myMaterial = myMaterial + group.item[nIndex].value
	Actor.setUIntProperty(sysarg, nStaticId, myMaterial)
	local stips = string.format(Lang.ScriptTips.exchang002,sitem,group.item[nIndex].value)
	
	Actor.sendTipmsg(sysarg,stips,ttFlyTip)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEquipExchange, MiscsImplement.EquipExchange)
