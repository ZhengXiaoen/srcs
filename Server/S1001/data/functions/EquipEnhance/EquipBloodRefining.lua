--#include "data\config\item\BloodRefiningCfg.lua" once

--装备血炼
function EquipBloodRefining(sysarg,args)
	local itemCount = args[1]
	local itemPtr = args[2]
	local opType = args[itemCount+2]
	local paramCount = args[itemCount+3]
	local isProtect = args[itemCount+4] > 0
	
	local config = EquipBloodRefiningCfg
	if not config then return false end

	--强化等级不符合
	local nStrongLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrong, 0) 
	if nStrongLevel < config.needStrong then
		return
	end

	--血炼等级满了
	local nMaxLevel = config.maxBloodRefin
	local nBloodLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemAppraisal, 0) 
	if nBloodLevel >= nMaxLevel then
		return
	end
	
		-- 检查
	local consumeData = {}
	local ret = false
	if isProtect then
		ret = CheckAllConsume(sysarg, false, config.consume[nBloodLevel+1].YbCoumeue, true, consumeData)
	else
		
		ret = CheckAllConsume(sysarg, false, config.consume[nBloodLevel+1].itemConsume, true, consumeData)
	end
	
	if not ret then
		return
	end	
	
	--检查后一级回不回跟当前一样
	if nBloodLevel == nBloodLevel+1 then
		return false
	end
	
	--扣费
	if isProtect then
		ret = DeductAllConsume(sysarg, false,config.consume[nBloodLevel+1].YbCoumeue, GameLog.cNewEquipBloodConsume)
	else
		ret = DeductAllConsume(sysarg, false,config.consume[nBloodLevel+1].itemConsume, GameLog.cNewEquipBloodConsume)
	end
	
	if not ret then
		return
	end
	
	Item.setItemProperty( sysarg, itemPtr, Item.ipItemAppraisal, nBloodLevel+1)
	
	--返回客户端处理结果
	Item.sendItemProcessResult(sysarg, itemPtr, opType, false)
	
	return true
	
end

--读取血炼数据
function EquipBloodRefinConsume( sysarg, args )
	
	local ptrCount = args[1]
	local itemPtr = args[2]
	if not itemPtr then
		return
	end
	
	local opType = args[ptrCount+2]		--操作类型

	local config = EquipBloodRefiningCfg
	if not config then return end
	
	local nStrongLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemStrong, 0) 
	if nStrongLevel < config.needStrong then
		return
	end
	
	--血炼等级满了
	local nMaxLevel = config.maxBloodRefin
	local nBloodLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemAppraisal, 0) 
	
	if nBloodLevel >= nMaxLevel then
		return
	end
	
	local bloodCfg = config.consume[nBloodLevel+1]
	
	if not bloodCfg then
		return
	end
	
	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	DataPack.writeByte(netPack,2) --数据总数
	
	for k, curTab in ipairs(bloodCfg.itemConsume) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack,curTab.id or 0)
		DataPack.writeInt(netPack,curTab.count)
		DataPack.writeByte(netPack,0)
		
	end

	for k, curTab in ipairs(bloodCfg.YbCoumeue) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack,curTab.id or 0)
		DataPack.writeInt(netPack,curTab.count)
		DataPack.writeByte(netPack, 0)

	end
	
	DataPack.flush(netPack)
end