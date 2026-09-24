--lua script
--使用经验玉 火龙珠

--#include "data\config\item\ExpJade.lua" once --BUFF配置表
--#include "data\functions\Activity\Common\Consumes.lua" once

--[[
--添加buff的物品
--sysarg:实体的指针
--itemidx: 物品的ID
--itemPtr: 物品的指针
--ItemTable: 配置的参数列表 
--]]
function UseJadeItem(sysarg,itemidx,itemPtr,ItemTable)
	if(Actor.getItemCount(sysarg,ItemTable.item_id) == 0) then
		Actor.sendTipmsg( sysarg,Lang.ScriptTips.x00013,ttTipmsgWindow )
		return
	end	
	
	local nIndex = Item.getItemJadeIndex(sysarg,itemPtr)
	if nIndex == -1 then
		Actor.sendTipmsg( sysarg,Lang.ScriptTips.x00013,ttTipmsgWindow )
		return
	end
	
	local nValue = 0
	local nDua = Item.getItemProperty(sysarg,itemPtr,Item.ipItemDua,nValue)
	
	if nDua <= 0 then
		Actor.sendTipmsg( sysarg,Lang.Activity.w00065,256 )
		return
	end	
	
	local itemId = Item.getItemProperty(sysarg,itemPtr,0,nValue)	
	local maxDua = Item.getItemPropertyById(itemId, Item.ipItemStaticDuaMax)
	
	--满了才能使用
	if nDua < maxDua then
		Actor.sendTipmsg( sysarg,Lang.Activity.w00125,256 )
		return
	end
	
	local mIndex = 0
	for i=1,table.getn(ExpJadeTable) do
		if ExpJadeTable[i].item_id == ItemTable.item_id then
			mIndex = i
			break
		end
	end
	
	if mIndex == 0 then return end

	local Val = Actor.getStaticVar(sysarg)
	-- 当天使用次数
	if _ExpJadeCfg.MaxUseTimes > 0 then
		local useTimes = Val.days.jadeTime		
		if useTimes == nil then useTimes = 0 end
		if useTimes >= _ExpJadeCfg.MaxUseTimes then
			Actor.sendTipmsg( sysarg,Lang.ScriptTips.x00204,ttFlyTip )
			return
		end
	end

	local consumes = ExpJadeTable[mIndex].consumes
	local consumesCount = #consumes
	if consumesCount == 0 then
		return
	elseif consumesCount > 2 then 
		print("error! Actor.messageBox()最多只支持3个按钮")
	end

	local moneyTexts = {
		[5] = "绑定金币",
		[6] = "金币",
		[7] = "绑定元宝",
		[15] = "元宝",
	}

	if consumesCount == 1 then
		local str = string.format("消耗<(c0xFF7CFC00)%d>%s即可领取<(c0xFF7CFC00)%d>点经验",consumes[1].count, moneyTexts[consumes[1].type], nDua)
		local btns = moneyTexts[consumes[1].type].."兑换/GetExpFromJadeItem,"..nIndex..",1"
		Actor.messageBox(sysarg,0,0,str, btns, "我不需要/CanleGetExp", NULL, 0)
	else		
		local str = string.format("消耗<(c0xFF7CFC00)%d>%s或<(c0xFF7CFC00)%d>%s即可领取<(c0xFF7CFC00)%d>点经验",consumes[1].count, moneyTexts[consumes[1].type], consumes[2].count, moneyTexts[consumes[2].type], nDua)
		local btns1 = moneyTexts[consumes[1].type].."兑换/GetExpFromJadeItem,"..nIndex..",1"
		local btns2 = moneyTexts[consumes[2].type].."兑换/GetExpFromJadeItem,"..nIndex..",2"
		Actor.messageBox(sysarg,0,0,str, btns1, btns2, "我不需要/CanleGetExp", 0)
	end
end

--经验玉兑换
function GetExpFromJadeItem(sysarg, nIndex, consume_idx)
	local nIndex = tonumber(nIndex)	
	local consume_idx = tonumber(consume_idx)	
	if nIndex < 0 then return end
	
	local var = Actor.getStaticVar(sysarg)
	local useTimes = var.days.jadeTime
	if useTimes == nil then useTimes = 0 end
	
	-- 当天使用次数
	if _ExpJadeCfg.MaxUseTimes > 0 then		
		if useTimes >= _ExpJadeCfg.MaxUseTimes then
			Actor.sendTipmsg( sysarg,Lang.ScriptTips.x00204,ttFlyTip )
			return
		end
	end
	
	local itemPtr = Item.getItemPtrByJadeIndex(sysarg,nIndex)	
	if itemPtr == nil then return end
	
	local nValue = 0
	
	local nDua = Item.getItemProperty(sysarg,itemPtr,Item.ipItemDua,nValue)	
	if nDua <= 0 then
		Actor.sendTipmsg( sysarg,Lang.Activity.w00065,ttDialog )
		return
	end	
	
	local itemId = Item.getItemProperty(sysarg,itemPtr,0,nValue)	
	local maxDua = Item.getItemPropertyById(itemId, Item.ipItemStaticDuaMax)
	
	--满了才能使用
	if nDua < maxDua then
		Actor.sendTipmsg( sysarg,Lang.Activity.w00125,256 )
		return
	end
	
	local mIndex = 0	
	for i=1,table.getn(ExpJadeTable) do
		if ExpJadeTable[i].item_id == itemId then
			mIndex = i
			break
		end
	end	
	
	if mIndex == 0 then return end
	
	local consume = ExpJadeTable[mIndex].consumes[consume_idx]
	if consume == nil then return end
	
	local consumeData = {}
	local isok = CheckOneConsume(sysarg, false, consume, true, consumeData)				
	if not isok then return end	
	
	--扣除消耗
	isok = DeductOneConsume(sysarg, false, consume, GameLog.clUseExpJade, Lang.Activity.w00056)		
	if not isok then return end	
		
	Actor.giveAward(sysarg,2,0,nDua,0,0,0,0,GameLog.clUseExpJade,"JadeExp")
	Item.changeHpPotValue(sysarg,itemPtr,0)
	--Item.sendHpPotDataToClient(sysarg,itemPtr)
	Actor.removeItemByPtr(sysarg,itemPtr,1,true,"JadeExp",5)
	
	var.days.jadeTime = useTimes + 1
	
	if _ExpJadeCfg.MaxUseTimes > 0 then		
		Actor.sendTipmsg(sysarg, string.format(Lang.Activity.w00124, nDua, _ExpJadeCfg.MaxUseTimes-var.days.jadeTime),256 )
	end
	
	-- 日常经验珠
	local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if level >= 68 then
		Quest_ShuaXin(sysarg) -- 刷新任务
	end
	
end

--取消
function CanleGetExp(sysarg)
	return nil
end

function UseJadeItemInit(sysarg)
  for i = 1,table.getn(ExpJadeTable) do
	local x = ExpJadeTable[i]
	GlobalItemFn[x.item_id] = { func = UseJadeItem, params = x }
  end
end

table.insert(InitFnTable,UseJadeItemInit)