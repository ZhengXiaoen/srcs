--#include "data\config\item\NecklaceLuckCfg.lua" once

--幸运转移
function EquipNecklaceLuckTrans(sysarg,args)
	local ptrCount = args[1]
	local srcItemPtr = args[3]
	local destItemPtr = args[2]
	
	if not srcItemPtr or not destItemPtr then
		return
	end

	local config = NecklaceLuckTransCfg
	if not config then
		return
	end

	local srcItemGuid = Item.getItemGuid(srcItemPtr)
	local dstItemGuid = Item.getItemGuid(destItemPtr)

	local opType = args[ptrCount+2]		--操作类型

	--检查是否为项链类型
	local srcItemType = Item.getItemProperty(sysarg, srcItemPtr, Item.ipItemType, 0)
	local descItemType = Item.getItemProperty(sysarg, destItemPtr, Item.ipItemType, 0)
	if srcItemType ~= Item.itNecklace or descItemType ~= Item.itNecklace then
		Actor.sendTipmsg(sysarg,"只有项链才能幸运")
		return
	end

	--项链转数是否大于1
	local srcItemCircle = Item.getItemProperty(sysarg, srcItemPtr, 51, 0)
	local descItemCircle = Item.getItemProperty(sysarg, destItemPtr, 51, 0)
	if srcItemCircle <= config.NeckLaceItemCircle or descItemCircle <= config.NeckLaceItemCircle then 
		Actor.sendTipmsg(sysarg,"只有大于1转项链才能幸运")
		return
	end

	local nItemLuck = Item.getItemProperty(sysarg,srcItemPtr,Item.ipItemLuck,0)
	local nDestItemLuck = Item.getItemProperty(sysarg,destItemPtr,Item.ipItemLuck,0)

	if nItemLuck <= 0 or nDestItemLuck > 0 then
		Actor.sendTipmsg(sysarg,"不能转移")
		return
	end
	
	local consumeCfg = NecklaceLuckTransCfg.consume[nItemLuck]
	if not consumeCfg then
		Actor.sendTipmsg(sysarg, "没有配置", ttFlyTip)
		return
	end
	
	local consumeData = {}
	local ret = CheckOneConsume(sysarg, false, consumeCfg, true, consumeData)
	if not ret then
		SendEquipOptResult(sysarg, srcItemGuid, itMoveEquipAttr, 2)
		return
	end
		
	--扣费
	ret = DeductOneConsume(sysarg, false, consumeCfg, GameLog.cNewEquipLuckTransConsume)
	if not ret then
		SendEquipOptResult(sysarg, srcItemGuid, itMoveEquipAttr, 2)
		return
	end	
	
	Item.setItemProperty(sysarg,destItemPtr,Item.ipItemLuck,nItemLuck)
	Item.setItemProperty(sysarg,srcItemPtr,Item.ipItemLuck,0)
	
	Actor.sendTipmsg(sysarg,"幸运转移成功",ttFlyTip)
	--提示转移装备属性成功
	return true

end



--装备幸运转移消耗
function EquipLuckTransConsume(sysarg,args)
	local ptrCount = args[1]
	local srcItemPtr = args[2]
	local destItemPtr = args[3]
	
	if not srcItemPtr or not destItemPtr then
		return
	end
	local opType = args[ptrCount+2]		--操作类型
	
	local nLuck = Item.getItemProperty(sysarg, srcItemPtr, Item.ipItemLuck, 0)

	local consumeCfg = NecklaceLuckTransCfg.consume[nLuck]
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