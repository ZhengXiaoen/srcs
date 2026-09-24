--lua script
--翅膀合成


--玩家开始合成, args = {物品指针数量,[指针1],[指针2],..物品处理类型,[参数1]，[参数2],...}
function OnWingComposite( sysarg, args )
	local ptrCount = args[1]			--指针数量
	local opType = args[ptrCount+2]		--操作类型
	local nGrade = args[ptrCount+3]		--选择合成档次
	local isRepCost = args[ptrCount+4]	--是否元宝替代
	
	
	if not nGrade then return false end
	
	local consumeConfig = enhanceConfigMap[opType]
	
	local config = consumeConfig[nGrade]
	
	if (config == nil) then
		System.trace("OnWingComposite error can't find config, grade="..nGrade)
		return false
	end
	
	local award = config.awards[1]
	if award.type ~= 0 or award.id <= 0 then
		System.trace("OnWingComposite awards error！, grade="..nGrade)
		return 
	end
	
	if Awards.CheckBagGridCount(sysarg, config.awards) ~= true then return end
	
	-- local dynamic_consum_items = 
	-- {
		-- other_dy_items = {}, 
		-- luckitems = {},
	-- }
	
	-- local result = SuccessCheck(sysarg, args, config, dynamic_consum_items, isRepCost)
	
	local result = SuccessCheck(sysarg, opType, config.consumes, isRepCost, 0, true)
	
	
	if (result ~= successCheckResult.ok) then return false end
	
	local logstr = string.format(Lang.LogTips.l00071, nGrade)
	--local result, isBind = EnhanceConsume( sysarg, args, config, dynamic_consum_items, opType, isRepCost, logstr)
	local result, isBind = EnhanceConsumes(sysarg, opType, config.consumes, isRepCost, 0, 0, logstr, true)
	if (result ~= successCheckResult.ok) then return false end
	
	--创建一个装备 
	local quality = award.quality or 0
	local strong = award.strong or 0
	--[[
	local newItemPtr = Item.createItem(award.id, 1, quality, strong, isBind, 0)
	if not newItemPtr then
		System.trace("createItem error, id = "..newItem)
		return false
	end
	
	--给玩家添加一个装备 
	if (Item.addItem(sysarg, newItemPtr, Lang.LogTips.l00072, 88, 1) ~= 1) then
		System.trace("add Item error, id = "..newItem)
		return false
	end
	--]]
	--给玩家添加一个装备 
	if Actor.addItem(sysarg, award.id, quality, strong, 1, isBind, 0, Lang.LogTips.l00072, 88) < 1 then
		System.trace("add Item error, id = "..award.id)
		return false
	end
	
	--返回客户端处理结果
	Item.sendItemProcessResult( sysarg, nil, opType, false)
	return true
end

--获取合成的消耗,args = {物品指针数量,[指针1],[指针2],..物品处理类型,[参数1]，[参数2],...}
function GetWingCompositeConsumes(sysarg, args)
	local ptrCount = args[1]			--指针数量
	local opType = args[ptrCount+2]		--操作类型
	local nGrade = args[ptrCount+3]		--选择合成档次
	
	if not nGrade then return false end
	
	local consumeConfig = enhanceConfigMap[opType]
	
	local config = consumeConfig[nGrade]
	
	if (config == nil) then
		System.trace("GetWingCompositeConsumes error can't find config, grade="..nGrade)
		return false
	end

	local consumes = {}
	SendConsumesToClient(sysarg, opType, config.consumes)
	
end