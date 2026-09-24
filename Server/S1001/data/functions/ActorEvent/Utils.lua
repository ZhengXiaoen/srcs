
-- ¸ÅÂÊ¼Ó buf
function RandomAddBuffsToActor(sysarg, buffs)
	if buffs == nil then return 0 end

	local count = 0
	for i, v in ipairs(buffs) do
		if System.getRandomNumber(100) <= v.value then
			Actor.addBuffById(sysarg, v.type)
			count = count + 1
		end
	end
		
	return count
end

function IsEquipByItemType(itemType)
	if itemType == nil then return false end

	if itemType > Item.itUndefinedType and itemType < Item.itEquipMax then
		return true
	end
	
	if itemType > Item.itPetEquipMin and itemType < Item.itPetEquipMax then
		return true
	end

	return false	
end

function IsEquipByItemPtr(sysarg, itemPtr)
	if itemPtr == nil then return false end
	
	local itemType = Item.getItemProperty(sysarg, itemPtr, Item.ipItemType, 0)	
	return IsEquipByItemType(itemType)	
end