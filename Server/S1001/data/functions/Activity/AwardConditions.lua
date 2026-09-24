
--[[
conditions 条件类型:
1:角色等级	params = {转数(-1则不检查),等级}
2:军印等级	params = {军印等级}
3:坐骑等级	params = {坐骑等级}
4:翅膀等级	params = {翅膀等级}
5:宝石等级	params = {宝石等级}
6:灵珠等级	params = {灵珠等级}
7:装备强化	params = {强化等级，达标装备数量}
--]]

function GetAwardConditionStringFromType(_type)
	local str_table = {
		[1] = "角色等级",
		[2] = "军印等级",
		[3] = "坐骑等级",
		[4] = "翅膀等级",
		[5] = "宝石等级",
		[6] = "灵珠等级",
		[7] = "强化装备数量",
	}
	
	return str_table[_type]
end

-- 奖励条件检查
AwardConditionCheck = {}

-- 1:角色等级	params = {转数(-1则不检查),等级}
AwardConditionCheck[1] = function (sysarg, params) 
	if params[1] == nil or params[2] == nil then return false end
	
	if params[1] == -1 then -- -1则不检查转数
		local actorLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
		return (actorLevel >= params[2])
	else
		return Actor.checkActorLevel(sysarg, params[2], params[1])
	end
end

-- 2:军印等级	params = {军印等级}
AwardConditionCheck[2] = function (sysarg, params) 
	local value = Actor.getIntProperty(sysarg, PROP_ACTOR_OFFICE)
		
	return value >= params[1]
end

-- 3:坐骑等级	params = {坐骑等级}
AwardConditionCheck[3] = function (sysarg, params) 
	local value = Actor.getIntProperty(sysarg, PROP_ACTOR_RIDE_LEVEL)
	
	return value >= params[1]
end

-- 4:翅膀等级	params = {翅膀等级}
AwardConditionCheck[4] = function (sysarg, params) 
	local swingId = Actor.getIntProperty(sysarg, PROP_ACTOR_SWINGID)
	
	local value = 0
	for i1, v1 in ipairs(SwingEquipConfig.SwingEquipTable) do
		if v1.id == swingId then
			value = i1
			break
		end
	end
	
	return value >= params[1]
end

-- 5:宝石等级	params = {宝石等级}
AwardConditionCheck[5] = function (sysarg, params) 
	local value = 0
	
	-- 改为从装备查找等级
	-- local var = Actor.getStaticVar(sysarg)
	-- if var.GodFurnace ~= nil then
	-- 	value = var.GodFurnace[5]
	-- 	if value == nil then value = 0 end
	-- end
	local equipPtr = Item.getEquipByType(sysarg, Item.itEquipDiamond)
	if equipPtr ~= nil then
		value = Item.getItemId(equipPtr) - 458 -- 459 为1阶
	end
		
	return value >= params[1]
end

-- 6:灵珠等级	params = {灵珠等级}
AwardConditionCheck[6] = function (sysarg, params) 	
	local value = 0
	
	-- 改为从装备查找等级
	--local var = Actor.getStaticVar(sysarg)
	--if var.GodFurnace ~= nil then
	--	value = var.GodFurnace[7]
	--	if value == nil then value = 0 end
	--end
	local equipPtr = Item.getEquipByType(sysarg, Item.itSeal)
	if equipPtr ~= nil then
		value = Item.getItemId(equipPtr) - 823 -- 824 为1阶
	end
		
	return value >= params[1]
end

-- 7:装备强化	params = {强化等级,数量}
AwardConditionCheck[7] = function (sysarg, params) 	
	local count = Item.countStrongLevel(sysarg, 1, params[1])
	if count >= params[2] then return true end
	
	count = count + Item.countStrongLevel(sysarg, 0, params[1])
	
	return count >= params[2]
end