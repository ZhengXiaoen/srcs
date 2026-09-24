--#include "data\config\equipSynthesis\ShenDunCfg.lua" once

handlecShenDunSystem = function( sysarg, msgid, packet )
	local nType = DataPack.readByte(packet)
	if	nType== 1 then --获得信息
		SendShenDunInfo(sysarg)
	elseif nType== 2 then --选择展示哪个神盾
		MakeShenDunChoose(sysarg,DataPack.readByte(packet))
	elseif nType== 3 then --穿上
		TakeOnShenDunEquipment(sysarg,packet)
	elseif nType==4 then --脱下
		TakeOffShenDunEquipment(sysarg,packet)
	end
end

function GetShenDunSlotCount()
	local slotCount = 6 -- 有6个槽位		
	return slotCount
end

--获得信息
function SendShenDunInfo(sysarg)
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sShenDunSystem)
	--DataPack.writeByte(netPack,1)--2外观广播(在c++实现了)
	local slotCount = GetShenDunSlotCount()
	for i=1,slotCount do 
		DataPack.writeInt(netPack,Actor.getShenDunInfo(sysarg,i-1))
	end
	DataPack.writeByte(netPack,Actor.getShenDunChoose(sysarg))
	DataPack.flush(netPack)
end

--选择显示哪个神盾
function MakeShenDunChoose(sysarg,index)
	local slotCount = GetShenDunSlotCount()
	if index<0 and index>slotCount then 
		return 
	end
	
	--什么都不选
	if index==0 then
		Actor.setShenDunChoose(sysarg,index)
		SendShenDunInfo(sysarg)
		return 
	end
	
	local shendunId = Actor.getShenDunInfo(sysarg,index-1)
	if shendunId==0 then 
		Actor.sendTipmsg(sysarg,"请穿戴上再选择",ttFlyTip)
		return 
	end
	
	Actor.setShenDunChoose(sysarg,index)
	SendShenDunInfo(sysarg)
end


--穿上
function TakeOnShenDunEquipment(sysarg,packet)
	local slotCount = GetShenDunSlotCount()
	local index = DataPack.readByte(packet)
	if index<1 or index >slotCount then  return end
	
	local series = DataPack.readUint64(packet)
	
	local shendunId = Actor.getShenDunInfo(sysarg,index-1)
	
	if shendunId~=0 then 
		Actor.sendTipmsg(sysarg,"此槽位已存在神盾,请脱下再穿上",ttFlyTip)
		return 
	end
	
    local itemPer = Item.getBagItemPtrByGuid(sysarg,series)
	if (itemPer==nil )then 
		Actor.sendTipmsg(sysarg,"物品不存在",ttFlyTip)
		return 
	end
	local itemID = Item.getItemProperty(sysarg,itemPer,Item.ipItemID) 
	local isOk = false
	for i=1,#ShenDunCfg.ShenDunIds do 
		if itemID==ShenDunCfg.ShenDunIds[i] then 
			isOk=true
			break
		end
	end
	if isOk==false then 
		Actor.sendTipmsg(sysarg,"物品类型不对",ttFlyTip)
		return 
	end
	
	--把穿上的物品扣除了
	if Actor.removeItemByPtr(sysarg,itemPer,1,true,"穿上神盾",LogIds.shendunTakeOnAndOff)==0 then 
		Actor.sendTipmsg(sysarg,"穿戴失败",ttFlyTip)
		return 
	end
	
	Actor.setShenDunInfo(sysarg,index-1,itemID)
	
	SendShenDunInfo(sysarg)
	
	Actor.collectOperate(sysarg, 0) -- 重新计算角色属性
	
end



--脱下
function TakeOffShenDunEquipment(sysarg,packet)
	local slotCount = GetShenDunSlotCount()
	local index = DataPack.readByte(packet)
	if index<1 or index >slotCount then  return end
	local shendunId = Actor.getShenDunInfo(sysarg,index-1)
	
	if shendunId==0 then 
		Actor.sendTipmsg(sysarg,"没有穿戴的物品可以脱下",ttFlyTip)
		return 
	end
	
	
	local hasCount = Item.getBagEmptyGridCount(sysarg)
	if hasCount<Item.getAddItemNeedGridCount(sysarg, shendunId, 1, 0, 0, 1) then 
		Actor.sendTipmsg(sysarg,"背包不足,装备脱下失败",ttFlyTip)
		return false
	end
	
	local nNewItem = Item.createItem(shendunId,1,0,0,1)
	if (nNewItem==nil) then 
		Actor.sendTipmsg(sysarg,"脱下失败",ttFlyTip)
		return false
	end
	
	if Actor.setShenDunInfo(sysarg,index-1,0)==false then 
		Actor.sendTipmsg(sysarg,"脱下失败2",ttFlyTip)
		return false
	end
	
	Item.addItem(sysarg,nNewItem,"脱下神盾",LogIds.shendunTakeOnAndOff)
	
	
	Actor.collectOperate(sysarg, 0) -- 重新计算角色属性
	
	SendShenDunInfo(sysarg)
	
	return true
end



MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cShenDunSystem, handlecShenDunSystem)
