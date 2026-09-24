--#include "data\config\item\NecklaceLuckCfg.lua" once

--装备幸运
function EquipNecklaceLuck(sysarg,args)

	local itemCount = args[1]
	local itemPtr = args[2]
	local opType = args[itemCount+2]
	local paramCount = args[itemCount+3]
	local isProtect = args[itemCount+4] > 0
	

	local config = NecklaceLuckCfg
	if not config then return false end
	--检查是否为项链类型
	local itemType = Item.getItemProperty(sysarg, itemPtr, Item.ipItemType, 0)
	if itemType ~= Item.itNecklace then 
		Actor.sendTipmsg(sysarg,"只有项链才能幸运")
		return
	end

	--项链转数是否大于1
	local itemCircle = Item.getItemProperty(sysarg, itemPtr, 51, 0)
	if itemCircle < config.NeckLaceItemCircle then 
		Actor.sendTipmsg(sysarg,"只有大于1转项链才能幸运")
		return
	end

	--项链的幸运最大值是否达到
	local nitemLuck = Item.getItemProperty(sysarg,itemPtr, Item.ipItemLuck,0)
	if nitemLuck >= config.MaxLuck then
		Actor.sendTipmsg(sysarg,"你的项链幸运已经是最大值了")
		return
	end

	-- 检查
	local consumeData = {}
	local ret = false
	ret = CheckAllConsume(sysarg, false, config.consume[nitemLuck+1].itemConsume, true, consumeData)
	
	if not ret then
		return
	end
	
	--扣费
	ret = DeductAllConsume(sysarg, false,config.consume[nitemLuck+1].itemConsume, GameLog.cNewEquipLuckConsume)
	
	if not ret then
		return
	end
	if System.getRandomNumber(100) < config.consume[nitemLuck+1].rate then
		nitemLuck = nitemLuck+1
		Item.setItemProperty(sysarg,itemPtr,Item.ipItemLuck,nitemLuck)
		Actor.sendTipmsg(sysarg,"恭喜项链幸运加1",ttFlyTip)
	else
		Actor.sendTipmsg(sysarg,"项链幸运锻造失败",ttFlyTip)
		return false
	end
	--返回客户端处理结果
	Item.sendItemProcessResult(sysarg, itemPtr, opType, false)
	
	return true
end




--装备幸运消耗
function EquipLuckCfgConsume(sysarg,args)

	local ptrCount = args[1]
	local itemPtr = args[2]
	if not itemPtr then
		return
	end
	
	local opType = args[ptrCount+2]		--操作类型

	local config = NecklaceLuckCfg
	if not config then return end

	--检查是否为项链类型
	local itemType = Item.getItemProperty(sysarg, itemPtr, Item.ipItemType, 0)
	if itemType ~= Item.itNecklace then 
		Actor.sendTipmsg(sysarg,"只有项链才能幸运")
		return
	end
	--项链转数是否大于1
	local itemCircle = Item.getItemProperty(sysarg, itemPtr, 51,0)
	if itemCircle <  config.NeckLaceItemCircle then 
		Actor.sendTipmsg(sysarg,"只有大于1转项链才能幸运")
		return
	end
	--项链的幸运最大值是否达到
	local nitemLuck = Item.getItemProperty(sysarg,itemPtr, Item.ipItemLuck,0)
	if nitemLuck >= config.MaxLuck then
		Actor.sendTipmsg(sysarg,"你的项链幸运已经是最大值了")
		return
	end
	
	local luckcfg = config.consume[nitemLuck+1]
	if not luckcfg then
		return
	end
	
	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	DataPack.writeByte(netPack,1) --数据总数
	
	for k, curTab in ipairs(luckcfg.itemConsume) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack,curTab.id or 0)
		DataPack.writeInt(netPack,curTab.count)
		DataPack.writeByte(netPack,0)
		
	end
	DataPack.writeByte(netPack,luckcfg.rate)
	DataPack.flush(netPack)
end



