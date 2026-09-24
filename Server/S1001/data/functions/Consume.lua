--[[ 例子：
-- type 定义在 script\interface\ActorEventDef.h tagAwardType
-- logid 定义在 script\interface\LogDef.h taggGameLogType
--消耗	
--消耗绑定金币时，先扣绑定金币，不够的话再扣非绑定金币
--消耗金币时，只扣金币不扣绑定金币

consume = {	
	{type = 15, count = 10, tips = {Lang.ScriptTips.zf063, ttFlyTip}, logs = {920, Lang.LogTips.l00010}}, -- 元宝不足提示
	{type = 7, count = 10, tips = {Lang.ScriptTips.x00212, ttFlyTip}, logs = {921, Lang.LogTips.l00011}}, -- 绑定元宝不足提示
	{type = 6, count = 20, tips = {Lang.ScriptTips.zf061, ttFlyTip}, logs = {922, Lang.LogTips.l00012}}, -- 金币不足提示
	{type = 0, id = 1, count = 1, yb = 100, 
		tips = {{Lang.ScriptTips.zf065, ttFlyTip}, -- 材料不足且不用元宝代替时的提示
						{Lang.ScriptTips.zf066, ttFlyTip}, -- 代替材料的元宝不够的提示
						{Lang.ScriptTips.zf067, ttFlyTip}}, -- 不能用元宝代替的提示
		logs = {{924, Lang.LogTips.l00014}, -- 扣除物品日志
						{920, Lang.LogTips.l00010}} -- 扣除元宝日志
	},
}

--保护
protect = {
	{type = 15, count = 10, tips = {Lang.ScriptTips.zf063, ttFlyTip}, logs = {920, Lang.LogTips.l00010}}, -- 不足提示
}
--]]

local function CheckYbConsume(sysarg, consume, isTooltip, eraseCount)
	if consume.count <= 0 then
		return 0
	end
	
	if eraseCount == nil then eraseCount = 0 end
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	if myYb < eraseCount then return -1 end
	
	myYb = myYb - eraseCount
	
	if myYb < consume.count then
		if isTooltip then
			local tip, tipType
			if consume.tips then
				tip = consume.tips[1]
				tipType = consume.tips[2]
			end
			
			if not tip then tip = Lang.ScriptTips.zf063	end
			if not tipType then	tipType = ttFlyTip end
			--Actor.sendTipmsg(sysarg, tip, tipType)
			SendRecommendTips(sysarg,"1")
		end
		
		return -1
	end
	
	return consume.count
end

--只是绑定元宝
local function OnlyCheckBindYbConsume(sysarg, consume, isTooltip, eraseCount)
	if consume.count <= 0 then
		return 0
	end

	if eraseCount == nil then eraseCount = 0 end
	local myBindYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_BIND_YUANBAO)
	if myBindYb < eraseCount then return -1 end
	
	myBindYb = myBindYb - eraseCount
	
	if myBindYb < consume.count then
		if isTooltip then
			local tip, tipType
			if consume.tips then
				tip = consume.tips[1]
				tipType = consume.tips[2]
			end

			if not tip then tip = Lang.ScriptTips.x00212 end
			if not tipType then	tipType = ttFlyTip end
			Actor.sendTipmsg(sysarg, tip, tipType)
		end
		
		return -1
	end
	
	return consume.count
end

--[[
local function CheckBindYbConsume(sysarg, consume, isTooltip, eraseCount, eraseYbCount)
	if consume.count <= 0 then
		return 0, 0
	end
	
	if eraseCount == nil then eraseCount = 0 end
	if eraseYbCount == nil then eraseYbCount = 0 end
	local myBindYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_BIND_YUANBAO)
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	
	if myBindYb < eraseCount then return -1, 0 end
	
	myBindYb = myBindYb - eraseCount
	if myBindYb >= consume.count then
		return consume.count, 0
	end
	
	myYb = myYb - eraseYbCount
	local deductYb = consume.count - myBindYb
	if myYb >= deductYb then
		return myBindYb, deductYb
	end
	
	-- 绑定元宝不足
	if isTooltip then
		local tip, tipType
		if consume.tips then
			tip = consume.tips[1]
			tipType = consume.tips[2]
		end
		if not tip then tip = Lang.ScriptTips.n00019 end
		if not tipType then	tipType = ttFlyTip end
		Actor.sendTipmsg(sysarg, tip, tipType)
	end
	
	return -1, 0	
end
--]]

local function CheckCoinConsume(sysarg, consume, isTooltip, eraseCount)
	if consume.count <= 0 then
		return 0
	end
	
	if eraseCount == nil then eraseCount = 0 end
	local myCoin = Actor.getUIntProperty(sysarg, PROP_ACTOR_COIN)
	if myCoin < eraseCount then return -1 end
	
	myCoin = myCoin - eraseCount
	
	if myCoin < consume.count then
		if isTooltip then
			local tip, tipType
			if consume.tips then
				tip = consume.tips[1]
				tipType = consume.tips[2]
			end
			
			if not tip then tip = Lang.ScriptTips.zf061	end
			if not tipType then	tipType = ttFlyTip end
			--Actor.sendTipmsg(sysarg, tip, tipType)
			SendRecommendTips(sysarg,"2")
		end
		
		return -1
	end
	
	return consume.count
end


local function CheckBindCoinConsume(sysarg, consume, isTooltip, eraseCount, eraseCoinCount)
	if consume.count <= 0 then
		return 0, 0
	end
	
	if eraseCount == nil then eraseCount = 0 end
	if eraseCoinCount == nil then eraseCoinCount = 0 end
	local myBindCoin = Actor.getUIntProperty(sysarg, PROP_ACTOR_BIND_COIN)
	local myCoin = Actor.getUIntProperty(sysarg, PROP_ACTOR_COIN)
	
	if myBindCoin < eraseCount then return -1, 0 end
	
	myBindCoin = myBindCoin - eraseCount
	if myBindCoin >= consume.count then
		return consume.count, 0
	end
	
	myCoin = myCoin - eraseCoinCount
	local deductCoin = consume.count - myBindCoin;
	if myCoin >= deductCoin then
		return myBindCoin, deductCoin
	end

	
	-- 绑定金币不足
	if isTooltip then
		local tip, tipType
		if consume.tips then
			tip = consume.tips[1]
			tipType = consume.tips[2]
		end
		if not tip then tip = Lang.ScriptTips.n00012	end
		if not tipType then	tipType = ttFlyTip end
		--Actor.sendTipmsg(sysarg, tip, tipType)
		SendRecommendTips(sysarg,"2")
	end
	
	return -1, 0	
end

-- 返回扣除的物品数，元宝数
local function CheckItemConsume(sysarg, isYbExchange, consume, isTooltip, eraseYb, eraseItem)
	if consume.count <= 0 then
		return 0, 0
	end
	
	if eraseYb == nil then eraseYb = 0 end
	if eraseItem == nil then eraseItem = 0 end
	
	local nStrong = -1
	if consume.strong then
		nStrong = consume.strong
	end

	local itemCount = Actor.getItemCount(sysarg, consume.id,0,nStrong)
	itemCount = itemCount - eraseItem
	if itemCount < 0 then
		return -1
	end
	
	if itemCount >= consume.count then
		return consume.count, 0
	end
	
	-- 材料不足
	if not isYbExchange then
		if isTooltip then
			local tip, tipType
			if consume.tips and consume.tips[1] then
				tip = consume.tips[1][1]
				tipType = consume.tips[1][2]
			end
			
			if not tip then tip = Lang.ScriptTips.zf065	end
			if not tipType then	tipType = ttFlyTip end
			Actor.sendTipmsg(sysarg, tip, tipType)
		end
		
		return -1
	end
	
	-- 材料不足且不能用元宝代替
	if not consume.yb or consume.yb == 0 then
		if isTooltip then
			local tip, tipType
			if consume.tips and consume.tips[3] then
				tip = consume.tips[3][1]
				tipType = consume.tips[3][2]
			end
			
			if not tip then tip = Lang.ScriptTips.zf067	end
			if not tipType then	tipType = ttFlyTip end
			Actor.sendTipmsg(sysarg, tip, tipType)
		end
		
		return -1
	end
	
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	if myYb < eraseYb then return -1 end
	
	myYb = myYb - eraseYb
	
	-- 代替材料的元宝不够
	local needYb = consume.yb * (consume.count - itemCount)
	if myYb < needYb then
		if isTooltip then
			local tip, tipType
			if consume.tips and consume.tips[2] then
				tip = consume.tips[2][1]
				tipType = consume.tips[2][2]
			end
			
			if not tip then tip = Lang.ScriptTips.zf066	end
			if not tipType then	tipType = ttFlyTip end
			Actor.sendTipmsg(sysarg, tip, tipType)
		end
		
		return -1
	end
	
	return itemCount, needYb
end

local function CheckEnergyConsume(sysarg, consume, isTooltip, eraseCount)
	if consume.count <= 0 then
		return 0
	end
		
	local myEnergy = Actor.getUIntProperty(sysarg, PROP_ACTOR_ENERGY)
	if eraseCount ~= nil then
		myEnergy = myEnergy - eraseCount
	end
	
	if myEnergy < consume.count then
		if isTooltip then
			local tip, tipType
			if consume.tips then
				tip = consume.tips[1]
				tipType = consume.tips[2]
			end
			
			if not tip then tip = Lang.ScriptTips.zf505	end
			if not tipType then	tipType = ttFlyTip end
			Actor.sendTipmsg(sysarg, tip, tipType)
		end
		
		return -1
	end
	
	return consume.count
end

local function ChecCrystalConsume(sysarg, consume, isTooltip, eraseCount)
	--[[if consume.count <= 0 then
		return 0
	end
	
	local myCrystal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CRYSTAL)
	if eraseCount ~= nil then
		myCrystal = myCrystal - eraseCount
	end
	
	if myCrystal < consume.count then
		if isTooltip then
			local tip, tipType
			if consume.tips then
				tip = consume.tips[1]
				tipType = consume.tips[2]
			end
			
			if not tip then tip = Lang.ScriptTips.zf506	end
			if not tipType then	tipType = ttFlyTip end
			Actor.sendTipmsg(sysarg, tip, tipType)
		end
		
		return -1
	end
	
	return consume.count--]]
end

-- 灵珠碎片 声望值 圣珠结晶
function CheckPearlChipConsume(sysarg, consume, isTooltip, eraseCount)
	if consume.count <= 0 then
		return 0
	end
		
	local myPearl = Actor.getUIntProperty(sysarg, PROP_ACTOR_PEARL_CHIP)
	if eraseCount ~= nil then
		myPearl = myPearl - eraseCount
	end
	
	if myPearl < consume.count then
		if isTooltip then
			local tip, tipType
			if consume.tips then
				tip = consume.tips[1]
				tipType = consume.tips[2]
			end
			
			if not tip then tip = "您的圣珠结晶不足" end
			if not tipType then	tipType = ttFlyTip end
			Actor.sendTipmsg(sysarg, tip, tipType)
		end
		
		return -1
	end
	
	return consume.count
end

-- 荣誉值 功勋
function CheckHonorVauleConsume(sysarg, consume, isTooltip, eraseCount)
	if consume.count <= 0 then
		return 0
	end

	local myHonor = Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE)
	if eraseCount ~= nil then
		myHonor = myHonor - eraseCount
	end

	if myHonor < consume.count then
		if isTooltip then	

			Actor.sendTipmsg(sysarg, "您的功勋值不足", ttFlyTip)
		end
		return -1
	end

	return consume.count
end

local function CheckSpiritConsume(sysarg, consume, isTooltip, eraseCount)

	if consume.count <= 0 then return 0 end
		
	local mySpirit = Actor.getUIntProperty(sysarg, PROP_ACTOR_SPIRITVALUE)
	if eraseCount ~= nil then 
		mySpirit = mySpirit - eraseCount
	end
	
	if mySpirit < consume.count then
		if isTooltip then
			local tip, tipType
			if consume.tips then
				tip = consume.tips[1]
				tipType = consume.tips[2]
			end
			
			if not tip then tip = Lang.ScriptTips.zf507	end
			if not tipType then	tipType = ttFlyTip end
			Actor.sendTipmsg(sysarg, tip, tipType)
		end
		
		return -1
	end
	
	return consume.count
end

function _CheckActorConsume(sysarg, propId, count, isTooltip, tipMsg)
	local myVal = Actor.getUIntProperty(sysarg, propId)
	if myVal >= count then return true end
	if isTooltip then
		Actor.sendTipmsg(sysarg, tipMsg, ttFlyTip)
	end			
	return false	
end

function CheckOneConsume(sysarg, isYbExchange, consume, isTooltip, consumeData)
	
	if not consume or not consumeData then return false end	
	local ret = -1
	local ret2 = -1
	if consume.type == 15 then -- 元宝
		ret = CheckYbConsume(sysarg, consume, isTooltip, consumeData.yb)
		if ret < 0 then return false end
		
		if consumeData.yb == nil then
			consumeData.yb = ret
		else
			consumeData.yb = consumeData.yb + ret
		end
		
		return true	
	elseif consume.type == 7 then -- 绑定元宝
	--[[
		ret, ret2 = CheckBindYbConsume(sysarg, consume, isTooltip, consumeData.BindYb, consumeData.Yb)
		if ret < 0 then return false end
		
		if consumeData.BindYb == nil then
			consumeData.BindYb = ret
		else
			consumeData.BindYb = consumeData.BindYb + ret
		end
		
		if ret2 > 0 then
			if consumeData.Yb == nil then
				consumeData.Yb = ret2
			else
				consumeData.Yb = consumeData.Yb + ret2
			end
		end
		
		return true	
	--]]
		ret = OnlyCheckBindYbConsume(sysarg, consume, isTooltip, consumeData.BindYb)
		if ret < 0 then return false end
		
		if consumeData.BindYb == nil then
			consumeData.BindYb = ret
		else
			consumeData.BindYb = consumeData.BindYb + ret
		end
		
		return true			
	elseif consume.type == 6 then -- 金币
		ret = CheckCoinConsume(sysarg, consume, isTooltip, consumeData.Coin)
		if ret < 0 then return false end
		
		if consumeData.Coin == nil then
			consumeData.Coin = ret
		else
			consumeData.Coin = consumeData.Coin + ret
		end
		
		return true	
	elseif consume.type == 5 then -- 绑定金币
		ret, ret2 = CheckBindCoinConsume(sysarg, consume, isTooltip, consumeData.BindCoin, consumeData.Coin)
		if ret < 0 then return false end
		
		if consumeData.BindCoin == nil then
			consumeData.BindCoin = ret
		else
			consumeData.BindCoin = consumeData.BindCoin + ret
		end
		
		if ret2 > 0 then
			if consumeData.Coin == nil then
				consumeData.Coin = ret2
			else
				consumeData.Coin = consumeData.Coin + ret2
			end
		end
		
		return true	
	elseif consume.type == 0 then -- 物品
		local eraseItem = 0
		if consumeData.items then
			eraseItem = consumeData.items[consume.id]
			if not eraseItem then eraseItem = 0 end
		end
		
		local eraseYb = 0
		ret, eraseYb = CheckItemConsume(sysarg, isYbExchange, consume, isTooltip, consumeData.yb, eraseItem)
		if ret < 0 then return false end
		
		if eraseYb > 0 then
			if consumeData.yb == nil then
				consumeData.yb = eraseYb
			else
				consumeData.yb = consumeData.yb + eraseYb
			end
		end
		
		if consumeData.items == nil then consumeData.items = {} end
		consumeData.items[consume.id] = eraseItem + ret 
		return true
	elseif consume.type == 11 then -- 成就点
		return _CheckActorConsume(sysarg, PROP_ACTOR_ACIEVEPOINT, consume.count, isTooltip, "成就点不足")	
	elseif consume.type == 36 then -- 能量
		ret = CheckEnergyConsume(sysarg, consume, isTooltip, consumeData.Energy)
		if ret < 0 then return false end
		
		if consumeData.Energy == nil then
			consumeData.Energy = ret
		else
			consumeData.Energy = consumeData.Energy + ret
		end
		
		return true
	elseif consume.type == 37 then -- 魔晶
		--[[ret = ChecCrystalConsume(sysarg, consume, isTooltip, consumeData.Crystal)
		if ret < 0 then return false end
		
		if consumeData.Crystal == nil then
			consumeData.Crystal = ret
		else
			consumeData.Crystal = consumeData.Crystal + ret
		end--]]
		
		return true
	elseif consume.type == 38 then --战功值
		ret = CheckSpiritConsume(sysarg,consume,isTooltip,consumeData.Spirit)
		if ret < 0 then return false end
			
		if consumeData.Spirit == nil then
			consumeData.Spirit = ret
		else
			consumeData.Spirit = consumeData.Spirit + ret
		end
		
		return true	
	elseif consume.type == 41 then -- 荣誉值 功勋
		ret = CheckHonorVauleConsume(sysarg,consume,isTooltip,consumeData.Honor)
		if ret < 0 then return false end
			
		if consumeData.Honor == nil then
			consumeData.Honor = ret
		else
			consumeData.Honor = consumeData.Honor + ret
		end
		
		return true
	elseif consume.type == 42 then --圣珠结晶
		ret = CheckPearlChipConsume(sysarg,consume,isTooltip,consumeData.Pearl)
		if ret < 0 then return false end
			
		if consumeData.Pearl == nil then
			consumeData.Pearl = ret
		else
			consumeData.Pearl = consumeData.Pearl + ret
		end
		
		return true
	elseif consume.type == 45 then -- 护盾结晶
		return _CheckActorConsume(sysarg, PROP_ACTOR_SHIELD_SPIRIT, consume.count, isTooltip, "护盾结晶不足")
	elseif consume.type == 46 then -- 护符碎片
		return _CheckActorConsume(sysarg, PROP_ACTOR_MAGIC_SOUL, consume.count, isTooltip, "护符碎片不足")
	elseif consume.type == 47 then -- 宝石结晶
		return _CheckActorConsume(sysarg, PROP_ACTOR_GEM_CRYSTAL, consume.count, isTooltip, "宝石结晶不足")
	elseif consume.type == 48 then -- 特戒结晶
		return _CheckActorConsume(sysarg, PROP_ACTOR_RING_CRYSTAL, consume.count, isTooltip, "特戒结晶不足")
	end
	
	return false
end

function CheckAllConsume(sysarg, isYbExchange, allConsume, isTooltip, consumeData)
	if not allConsume then return false end
	
	if not consumeData then consumeData = {} end

	for i, tab in ipairs(allConsume) do
		local ret = CheckOneConsume(sysarg, isYbExchange, tab, isTooltip, consumeData)
		if not ret then return false end
	end
	
	return true
end

local function DeductYbConsume(sysarg, consume, logId, logComment)
	if consume.count <= 0 then return true end
	
	if consume.logs then
		if consume.logs[1] then logId = consume.logs[1] end
		if consume.logs[2] then logComment = consume.logs[2] end
	end
	
	if not logId then logId = 920 end
	if not logComment then logComment = Lang.LogTips.l00010 end
	
	return Actor.changeMoney(sysarg, mtYuanbao, -consume.count, logId, logComment)
end

--只是扣绑定元宝
local function OnlyDeductBindYbConsume(sysarg, consume, logId, logComment)
	if consume.count <= 0 then return true end
	
	if consume.logs then
		if consume.logs[1] then logId = consume.logs[1] end
		if consume.logs[2] then logComment = consume.logs[2] end
	end
	
	if not logId then logId = 921 end
	if not logComment then logComment = Lang.LogTips.l00011 end
	
	return Actor.changeMoney(sysarg, mtBindYuanbao, -consume.count, logId, logComment)
end

--绑定元宝不够就扣元宝，不能同时扣两种
local function DeductBindYbConsume(sysarg, consume, logId, logComment)
	if consume.count <= 0 then return true end
	
	if consume.logs then
		if consume.logs[1] then logId = consume.logs[1] end
		if consume.logs[2] then logComment = consume.logs[2] end
	end
	
	if not logId then logId = 921 end
	if not logComment then logComment = Lang.LogTips.l00011 end
	
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	local myBindYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_BIND_YUANBAO)
	
	--绑定元宝+元宝都不足需扣除的金额
	
	if myYb + myBindYb < consume.count then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.n00019,ttFlyTip)
		return false
	end
	
	--绑定元宝足够，纯扣绑定元宝
	if myBindYb >= consume.count then
		return Actor.changeMoney(sysarg, mtBindYuanbao, -consume.count, logId, logComment)
	end
	
	--绑定元宝不足全部则检测元宝是否可以扣除绑定元宝剩下的金额
	local deductYb = consume.count - myBindYb;
	if myYb < deductYb then return false end
	
	Actor.changeMoney(sysarg, mtBindYuanbao, -myBindYb, logId, logComment)
	--logId = 921
	--logComment = Lang.LogTips.l00011
	Actor.changeMoney(sysarg, mtYuanbao, -deductYb, logId, logComment)
	return true
end


local function DeductCoinConsume(sysarg, consume, logId, logComment)
	if consume.count <= 0 then return true end
	
	if consume.logs then
		if consume.logs[1] then logId = consume.logs[1] end
		if consume.logs[2] then logComment = consume.logs[2] end
	end
	
	if not logId then logId = 922 end
	if not logComment then logComment = Lang.LogTips.l00012 end
	
	return Actor.changeMoney(sysarg, mtCoin, -consume.count, logId, logComment)
end

--绑定金币不够就扣金币，不能同时扣两种
local function DeductBindCoinConsume(sysarg, consume, logId, logComment)
	if consume.count <= 0 then return true end
	
	if consume.logs then
		if consume.logs[1] then logId = consume.logs[1] end
		if consume.logs[2] then logComment = consume.logs[2] end
	end
	
	if not logId then logId = 923 end
	if not logComment then logComment = Lang.LogTips.l00013 end
	
	local myCoin = Actor.getUIntProperty(sysarg, PROP_ACTOR_COIN)
	local myBindCoin = Actor.getUIntProperty(sysarg, PROP_ACTOR_BIND_COIN)
	
	--绑金+金币都不足需扣除的金额
	
	if myCoin + myBindCoin < consume.count then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.n00012,ttFlyTip)
		return false
	end
	
	--绑金足够，纯扣绑金
	if myBindCoin >= consume.count then
		return Actor.changeMoney(sysarg, mtBindCoin, -consume.count, logId, logComment)
	end
	
	--绑金不足全部则检测金币是否可以扣除绑金剩下的金额
	local deductCoin = consume.count - myBindCoin;
	if myCoin < deductCoin then return false end
	
	Actor.changeMoney(sysarg, mtBindCoin, -myBindCoin, logId, logComment)
	--logId = 922
	--logComment = Lang.LogTips.l00012
	Actor.changeMoney(sysarg, mtCoin, -deductCoin, logId, logComment)
	return true
end

local function DeductItemConsume(sysarg, isYbExchange, consume, logId, logComment)
	if consume.count <= 0 then return true end
	
	if consume.logs and consume.logs[1] then
		if consume.logs[1][1] then logId = consume.logs[1][1] end
		if consume.logs[1][2] then logComment = consume.logs[1][2] end
	end
	
	if not logId then logId = 924 end
	if not logComment then logComment = Lang.LogTips.l00014 end
	
	local removeCount = Actor.removeItem(sysarg, consume.id, consume.count,-1,-1,-1,logComment,logId)
	if removeCount >= consume.count then return true end	
	if not isYbExchange then return false end

	local needYb = consume.yb * (consume.count - removeCount)
	
	if consume.logs and consume.logs[2] then
		if consume.logs[2][1] then logId = consume.logs[2][1] end
		if consume.logs[2][2] then logComment = consume.logs[2][2] end		
	end
	if not logId then logId = 920 end
	if not logComment then logComment = Lang.LogTips.l00010 end
	
	return Actor.changeMoney(sysarg, mtYuanbao, -needYb, logId, logComment)					
end

local function DeductEnergyConsume(sysarg, consume, logId, logComment)
	if consume.count <= 0 then return true end
	
	if consume.logs then
		if consume.logs[1] then logId = consume.logs[1] end
		if consume.logs[2] then logComment = consume.logs[2] end
	end
	
	if not logId then logId = 925 end
	if not logComment then logComment = Lang.LogTips.l00015 end
	
	local myEnergy = Actor.getUIntProperty(sysarg, PROP_ACTOR_ENERGY)
	if myEnergy < consume.count then return false end
	
	Actor.changeEnergy(sysarg, -consume.count)
	
	local newEnergy = Actor.getUIntProperty(sysarg, PROP_ACTOR_ENERGY)
	
	local actorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	System.sendCommonLog(logId,actorId,"",myEnergy,-consume.count,newEnergy,"","","energy")
	return true
end

local function DeductCrystalConsume(sysarg, consume, logId, logComment)
	--[[if consume.count <= 0 then return true end
	
	if consume.logs then
		if consume.logs[1] then logId = consume.logs[1] end
		if consume.logs[2] then logComment = consume.logs[2] end
	end
	
	if not logId then logId = 926 end
	if not logComment then logComment = Lang.LogTips.l00016 end
	
	local myCrystal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CRYSTAL)
	if myCrystal < consume.count then return false end
	
	Actor.changeCrystal(sysarg, -consume.count)--]]
	return true
end

local function DeductSpiritConsume(sysarg, consume, logId, logComment)
	if consume.count <= 0 then return true end
	
	if consume.logs then
		if consume.logs[1] then logId = consume.logs[1] end
		if consume.logs[2] then logComment = consume.logs[2] end
	end
	
	if not logId then logId = 927 end
	if not logComment then logComment = Lang.LogTips.l00017 end
	
	local mySpirit = Actor.getUIntProperty(sysarg, PROP_ACTOR_SPIRITVALUE)
	if mySpirit < consume.count then return false end
	
	Actor.changeSpiritValue(sysarg, -consume.count)
	return true
end

-- 灵珠碎片 声望值 圣珠结晶
function DeductPearlChipConsume(sysarg, consume, logId, logComment)
	if consume.count <= 0 then return true end
		
	local myPearl = Actor.getUIntProperty(sysarg, PROP_ACTOR_PEARL_CHIP)
	if myPearl < consume.count then return false end
	
	local newPearl = myPearl - consume.count
	Actor.setUIntProperty(sysarg, PROP_ACTOR_PEARL_CHIP, newPearl)
	if logId > 0 then
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		local actorName = Actor.getName(sysarg)	
		System.sendCommonLog(logId, actorId, actorName, myPearl, newPearl, 0, logComment)
	end
	
	return true
end

-- 荣誉值 功勋
function DeductHonorVauleConsume(sysarg, consume, logId, logComment)
	if consume.count <= 0 then return true end
		
	local myHonor = Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE)
	if myHonor < consume.count then return false end
	
	local newHonor = myHonor - consume.count
	Actor.setUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE, newHonor)
	if logId > 0 then
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		local actorName = Actor.getName(sysarg)	
		System.sendCommonLog(logId, actorId, actorName, myHonor, newHonor, 0, logComment)
	end
	
	return true
end

function _DeductActorConsume(sysarg, propId, count, logId, logComment)
	if count <= 0 then return true end
		
	local myVal = Actor.getUIntProperty(sysarg, propId)
	if myVal < count then return false end
	
	local newVal = myVal - count
	Actor.setUIntProperty(sysarg, propId, newVal)
	if logId > 0 then
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		local actorName = Actor.getName(sysarg)	
		System.sendCommonLog(logId, actorId, actorName, myVal, newVal, 0, logComment)
	end
	
	return true
end


-- 返回 true false
function DeductOneConsume(sysarg, isYbExchange, consume, logId, logComment)
	if not consume then return false end
	
	if consume.type == 15 then -- 元宝
		return DeductYbConsume(sysarg, consume, logId, logComment)
	elseif consume.type == 7 then -- 绑定元宝
		return OnlyDeductBindYbConsume(sysarg, consume, logId, logComment)
	elseif consume.type == 6 then -- 金币
		return DeductCoinConsume(sysarg, consume, logId, logComment)
	elseif consume.type == 5 then -- 绑定金币
		return DeductBindCoinConsume(sysarg, consume, logId, logComment)
	elseif consume.type == 0 then -- 物品
		return DeductItemConsume(sysarg, isYbExchange, consume, logId, logComment)
	elseif consume.type == 11 then -- 成就点
		--return _DeductActorConsume(sysarg, PROP_ACTOR_ACIEVEPOINT, consume.count, logId, logComment)
		return false -- 成就点改为只增不减
	elseif consume.type == 36 then -- 能量
		return DeductEnergyConsume(sysarg, consume, logId, logComment)
	elseif consume.type == 37 then -- 魔晶
		return DeductCrystalConsume(sysarg, consume, logId, logComment)
	elseif consume.type == 38 then -- 战功值
	    return DeductSpiritConsume(sysarg, consume, logId, logComment)
	elseif consume.type == 41 then -- 荣誉值 功勋
		return DeductHonorVauleConsume(sysarg, consume, logId, logComment)
	elseif consume.type == 42 then -- 圣珠结晶
	    return DeductPearlChipConsume(sysarg, consume, logId, logComment)
	elseif consume.type == 45 then -- 护盾结晶
		return _DeductActorConsume(sysarg, PROP_ACTOR_SHIELD_SPIRIT, consume.count, logId, logComment)
	elseif consume.type == 46 then -- 护符碎片
		return _DeductActorConsume(sysarg, PROP_ACTOR_MAGIC_SOUL, consume.count, logId, logComment)
	elseif consume.type == 47 then -- 宝石结晶
		return _DeductActorConsume(sysarg, PROP_ACTOR_GEM_CRYSTAL, consume.count, logId, logComment)
	elseif consume.type == 48 then -- 特戒结晶
		return _DeductActorConsume(sysarg, PROP_ACTOR_RING_CRYSTAL, consume.count, logId, logComment)
	end
	return false
end
		
function DeductAllConsume(sysarg, isYbExchange, allConsume, logId, logComment)

	if not allConsume then return false end
	
	for i, tab in ipairs(allConsume) do
		local ret = DeductOneConsume(sysarg, isYbExchange, tab, logId, logComment)
		if not ret then return false end
	end
	
	return true
end
--判断背包格子是否足够
function IsEnoughBagGrids( sysarg,RewardTable)
	local count = 0
	for k, v in ipairs( RewardTable ) do
		if v.type == 0 then
			count = count + Item.getAddItemNeedGridCount( sysarg, v.id, v.count, v.quality, v.strong)
		end
	end
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if bagIdxs < count then
		Actor.sendTipmsg( sysarg,string.format(Lang.ScriptTips.tf00008, count),ttFlyTip )
		return false
	end
	return true
end