-- 龙灵守护系统
--#include "data\config\modules\guard_dragon_cfg.lua" once -- 龙灵守护配置

-- 龙灵守护属性计算
function ResetActorGuardDragonPropertys(sysarg, calc)
	-- 龙灵守护数据（byte0:等级，byte1:当前外观）
	local data = Actor.getUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_DATA)
	if data == 0 then return end
	
	local level = System.getIntByte(data, 0)
	if level <= 0 then return end
		
	local levelcfg = guard_dragon_cfg.levels[level]
	if levelcfg == nil then return end	
		
	LuaHelp.calcActorAttrs(sysarg, calc, levelcfg.attrs)
end

-- 返回 -1 则没有找到
function get_recycle_guard_dragon_exp_from_table(tbl, itemid)
	local i = 1
	while (true) do
		local id = tbl[i]
		if id == nil then return -1 end
		
		if id == itemid then
			local _exp = tbl[i + 1]
			if _exp == nil then
				return -1
			else	
				return _exp
			end
		end
		
		i = i + 2
	end
	
	return -1
end

-- 返回 -1 则没有找到
function get_recycle_guard_dragon_exp_from_itemid(itemid)
	if itemid == 0 then return -1 end
	
	for i, v in ipairs(guard_dragon_cfg.recycle_item_list) do
		local _exp = get_recycle_guard_dragon_exp_from_table(v, itemid)
		if _exp >= 0 then
			return _exp
		end
	end
	
	return -1
end

-- 龙灵守护回收物品
function recycle_guard_dragon_items(sysarg, packet)
	-- 0:背包， 1:个人仓库， 2:寻宝仓库
	local bagType = DataPack.readByte(packet)
	if bagType ~= 0 and bagType ~= 1 and bagType ~= 2 then
		return
	end
	
	local recycleCount = DataPack.readByte(packet)
	if recycleCount == 0 then return end
	
	-- 龙灵守护数据（byte0:等级，byte1:当前外观）
	local data = Actor.getUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_DATA)	
	local oldLevel = System.getIntByte(data, 0)
	
	local levelListCfg = guard_dragon_cfg.levels
	if levelListCfg[oldLevel + 1] == nil then
		Actor.sendTipmsg(sysarg, "您的龙灵守护已满级无法进行投入", ttFlyTip)
		return -- 满极了
	end
		
	local addExp = 0
	
	for i = 1, recycleCount do
		local itemSec = DataPack.readInt64(packet)
		
		local itemPtr = nil
		if bagType == 0 then
			itemPtr = Item.getBagItemPtrByGuid(sysarg, itemSec)
		elseif bagType == 1 then
			itemPtr = Actor.getDepotItemByGuid(sysarg, itemSec)
		elseif bagType == 2 then
			itemPtr = Dmkj.getStoreItemByGuid(sysarg, itemSec)
		end
		
		if itemPtr ~= nil then
			local itemId = Item.getItemId(itemPtr)
			local _exp = get_recycle_guard_dragon_exp_from_itemid(itemId)
			if _exp >= 0 then -- 返回 -1 则该物品不能加收
				local itemCount = Item.getItemProperty(sysarg, itemPtr, Item.ipItemCount, 0)
				local itemExp = _exp * itemCount
				
				if bagType == 0 then
					if Item.removeItem(sysarg, itemPtr, itemCount, tostring(itemExp), LogIds.guardDragonRecycleItems) >= itemCount then
						addExp = addExp + itemExp
					end
				elseif bagType == 1 then
					if Actor.deleteDepotItemByGuid(sysarg, itemSec, tostring(itemExp), LogIds.guardDragonRecycleItems) == true then
						addExp = addExp + itemExp
					end
				elseif bagType == 2 then
					if Dmkj.deleteStoreItem(sysarg, itemPtr, LogIds.guardDragonRecycleItems) == true then
						addExp = addExp + itemExp
					end
				end
			end
		end
	end
	
	addExp = math.floor(addExp)
	if addExp == 0 then return end
	
	local oldExp = Actor.getUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_EXP)
		
	-- 龙灵守护数据（byte0:等级，byte1:当前外观）
	local data = Actor.getUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_DATA)	
	local oldLevel = System.getIntByte(data, 0)
	
	local curExp = oldExp + addExp
	local curLevel = oldLevel	
	
	while (true) do
		local levelCfg = levelListCfg[curLevel + 1]
		if levelCfg == nil then
			break
		end
		
		if curExp < levelCfg.needExp then
			break
		end
		
		curExp = curExp - levelCfg.needExp
		curLevel = curLevel + 1
	end
	
	Actor.setUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_EXP, curExp)
	
	if curLevel ~= oldLevel then -- 等级改变
		data = System.setIntByte(data, 0, curLevel)
		Actor.setUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_DATA, data)		
		Actor.collectOperate(sysarg, 0) -- 0:重新计算属性
	end
	
	System.sendCommonLog(LogIds.guardDragonRecycleItemsAddExp, Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),curExp,oldExp,curLevel,tostring(oldLevel))
	
	if curLevel ~= oldLevel then -- 等级改变通知前端播放特效
		local netPack = DataPack.allocPacket(sysarg, 151, LogicCmd.miscSysEx.sub.sGuardDragon)
		DataPack.writeByte(netPack, 1) -- 龙灵守护升级		
		DataPack.writeByte(netPack, curLevel) -- 新等级		
		DataPack.flush(netPack)
	end
	
	if curLevel ~= oldLevel then
		local oldClass = math.floor((oldLevel+9)/10) -- 每10级一个特效展示
		local newClass = math.floor((curLevel+9)/10)
		if oldClass ~= newClass then -- 升阶
			local strTbl = {"绿", "蓝", "紫", "黄", "橙" }		
			local msg = strTbl[newClass]
			if msg ~= nil then		
				if newClass == 1 then
					msg = string.format("恭喜玩家<(c0xFF00FF00)%s>激活绿-龙灵守护,龙灵环身战力暴涨！<我也要激活/@@showWin,213>", Actor.getName(sysarg))
				else
					msg = string.format("恭喜玩家<(c0xFF00FF00)%s>突破至%s-龙灵守护,龙灵环身战力暴涨！<我也要激活/@@showWin,213>", Actor.getName(sysarg), msg)
				end
				
				System.broadcastTipmsg(msg, ttScreenCenter+ttChatWindow)
			end
		end
	end
	
end

-- 选择龙灵守护外观
function select_guard_dragon_appearance(sysarg, packet)
	local idx = DataPack.readByte(packet) -- 0 为没有
	
	-- 龙灵守护数据（byte0:等级，byte1:当前外观）
	local data = Actor.getUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_DATA)
		
	if idx > 0 then		
		local level = System.getIntByte(data, 0)
		if level <= 0 then return end
		
		local level2 = math.floor((level+9)/10) -- 每10级一个特效展示
		if idx > level2 then return end
	end
	
	if System.getIntByte(data, 1) == idx then
		return
	end
	
	data = System.setIntByte(data, 1, idx)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_DATA, data)
	Actor.collectOperate(sysarg,1) -- 重新计算外观
end

function guard_dragon_main(sysarg, sysid, packet)
	local msgid = DataPack.readByte(packet)
	
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if actorLevel < guard_dragon_cfg.openLevel then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, guard_dragon_cfg.openLevel), ttFlyTip)
		return
	end
		
	if msgid == 1 then -- 龙灵守护回收物品
		recycle_guard_dragon_items(sysarg, packet)	
	elseif msgid == 2 then -- 选择龙灵守护外观
		select_guard_dragon_appearance(sysarg, packet)
	else
		print("error guard_dragon_main, unknown msgid="..msgid)
		return
	end
end

--[[
function printll(sysarg)
	local exp = Actor.getUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_EXP)
	local data = Actor.getUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_DATA)
	local level = System.getIntByte(data, 0)	
	local level2 = math.floor((level+9)/10) -- 每10级一个特效展示
	
	print("-----exp="..exp..",level="..level..",level2="..level2)
end
--]]