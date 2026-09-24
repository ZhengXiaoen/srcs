--#include "data\config\item\itemEnhance\MoveEquipAttrConfig.lua" once

local function MsgTooltip(errorCode, sysarg, srcItemPtr, dstItemGuid)
	local msgs = {Lang.ScriptTips.zf500, Lang.ScriptTips.zf502, Lang.ScriptTips.zf503, Lang.ScriptTips.zf503, Lang.ScriptTips.zf504, Lang.ScriptTips.zf504}
	Actor.sendTipmsg(sysarg, msgs[-errorCode], ttFlyTip)
end

--转移装备属性
function MoveEquipAttr(sysarg, args)  	--18,转移装备属性
	local ptrCount = args[1]
	local srcItemPtr = args[2]
	local destItemPtr = args[3]
	
	if not srcItemPtr or not destItemPtr then
		return
	end
	
	local srcItemGuid = Item.getItemGuid(srcItemPtr)
	local dstItemGuid = Item.getItemGuid(destItemPtr)

	local opType = args[ptrCount+2]		--操作类型
	local itemStrong = Item.getItemProperty(sysarg, srcItemPtr, Item.ipItemStrong, 0)
	if itemStrong < 7 then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf509,7), ttFlyTip)
		return
	end
	
	local consumeCfg = MoveEquipAttrConfig.consume[itemStrong+1]
	if not consumeCfg then
		SendEquipOptResult(sysarg, srcItemGuid, itMoveEquipAttr, 2)
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf500, ttFlyTip)
		return
	end
	
	-- 检查
	local errorCode = Actor.checkMoveEquipAttr(sysarg, srcItemPtr, destItemPtr)
	if errorCode ~= 0 then
		MsgTooltip(errorCode, sysarg, srcItemPtr, dstItemGuid)
		SendEquipOptResult(sysarg, srcItemGuid, itMoveEquipAttr, 2)
		return
	end
	
	local consumeData = {}
	local ret = CheckOneConsume(sysarg, false, consumeCfg, true, consumeData)
	if not ret then
		SendEquipOptResult(sysarg, srcItemGuid, itMoveEquipAttr, 2)
		return
	end
		
	--扣费
	ret = DeductOneConsume(sysarg, false, consumeCfg, GameLog.cNewEquipMoveAttrConsume)
	if not ret then
		SendEquipOptResult(sysarg, srcItemGuid, itMoveEquipAttr, 2)
		return
	end	
	
	local errorCode = Actor.moveEquipAttr(sysarg, srcItemPtr, destItemPtr)
	if errorCode ~= 0 then
		MsgTooltip(errorCode, sysarg, srcItemPtr, dstItemGuid)
		SendEquipOptResult(sysarg, srcItemGuid, itMoveEquipAttr, 2)
		return
	end
	
	SendEquipOptResult(sysarg, srcItemGuid, itMoveEquipAttr, 0)
	--提示转移装备属性成功
	
	return true
end

--读取转移装备属性
function MoveEquipAttrConsume(sysarg, args)
	local ptrCount = args[1]
	local srcItemPtr = args[2]
	local destItemPtr = args[3]
	
	if not srcItemPtr or not destItemPtr then
		return
	end
	
	local opType = args[ptrCount+2]		--操作类型
	
	local itemStrong = Item.getItemProperty(sysarg, srcItemPtr, Item.ipItemStrong, 0)
	local consumeCfg = MoveEquipAttrConfig.consume[itemStrong+1]
	if not consumeCfg then return end
	
	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	DataPack.writeByte(netPack, 1)
	
	DataPack.writeByte(netPack,consumeCfg.type)
	DataPack.writeInt(netPack,consumeCfg.id or 0)
	DataPack.writeInt(netPack,consumeCfg.count)
	DataPack.writeByte(netPack, consumeCfg.usetype or 0)

	DataPack.flush(netPack)
end