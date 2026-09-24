--#include "data\functions\ActorEvent\BatchBoxScriptFunc.lua" once


function OnBatchBoxScriptFunc(sysarg,itemCount,packet,funcName, ...)
--	print("funcName arg=======================",funcName,itemCount)

--[[ 这里有好多物品ID都是写死的，保险点，暂时屏蔽掉，到时用到哪个再打开哪个功能吧
	local func = BatchBoxFunc[funcName]
	if func == nil then return end
		
	local itemList = {};
	for i = 1, itemCount do
		local itemGuid = DataPack.readUint64(packet)
		--print(itemGuid)
		local itemPer = Item.getBagItemPtrByGuid(sysarg,itemGuid)
		table.insert(itemList,itemPer)
	end
	
		--print("OnActivityScriptFunc")
	return func(sysarg,itemList,unpack(arg))
--]]
end