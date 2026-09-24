--#include "data\functions\Activity\Common\Awards.lua" once

--装备血炼分解

function EquipBloodDecom(sysarg,args)
	local itemCount = args[1]
	local itemPtr = args[2]
	local opType = args[itemCount+2]
	local paramCount = args[itemCount+3]
	
	local config = EquipDecomCfg
	if not config then return false end
		
	--没有血炼等级
	local nBloodLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemAppraisal, 0) 
	if nBloodLevel <= 0 then
		return
	end

	if not Awards.CheckBagGridCount(sysarg, config[nBloodLevel].decomItem) then
		return false
	end
	
	-- 检查
	local consumeData = {}
	local ret = false

	ret = CheckAllConsume(sysarg, false, config[nBloodLevel].coinCoumeue, true, consumeData)
	if not ret then
		return
	end	
	
	--扣费
	ret = DeductAllConsume(sysarg, false,config[nBloodLevel].coinCoumeue, GameLog.cNewEquipBloodDecomConsume)
	
	if not ret then
		return
	end
	
	Awards.Give(sysarg, config[nBloodLevel].decomItem, 987, "装备血炼分解得到物品")
	Item.setItemProperty( sysarg, itemPtr, Item.ipItemAppraisal, nBloodLevel-1)
	
	--返回客户端处理结果
	Item.sendItemProcessResult(sysarg, itemPtr, opType, false)
end

function EquipDecomCfgConsume(sysarg,args)

	local ptrCount = args[1]
	local itemPtr = args[2]
	if not itemPtr then
		return
	end
	
	local opType = args[ptrCount+2]		--操作类型
	
	local config = EquipDecomCfg
	if not config then return end
	
	--没有血炼等级
	local nBloodLevel = Item.getItemProperty(sysarg, itemPtr, Item.ipItemAppraisal, 0) 
	if nBloodLevel <= 0 then
		return
	end	
	
	local nDecomCfg = config[nBloodLevel]
	if not nDecomCfg then
		return
	end
	
	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	DataPack.writeByte(netPack,#nDecomCfg.coinCoumeue+#nDecomCfg.decomItem) --数据总数
	
	for k, curTab in ipairs(nDecomCfg.coinCoumeue) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack,curTab.id or 0)
		DataPack.writeInt(netPack,curTab.count)
		DataPack.writeByte(netPack,Any_Stuff)
	end
	
	for k, curTab in ipairs(nDecomCfg.decomItem) do
		DataPack.writeByte(netPack,curTab.type)
		DataPack.writeInt(netPack,curTab.id or 0)
		DataPack.writeInt(netPack,curTab.count)
		DataPack.writeByte(netPack,Any_Stuff)
	end
	
	DataPack.flush(netPack)
end