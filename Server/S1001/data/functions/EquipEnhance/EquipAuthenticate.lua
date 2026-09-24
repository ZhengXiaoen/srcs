
--装备鉴定
function NewEquipAuthenticate(sysarg, args)	--3 装备鉴定
	
--	local config = EquipNewAuthenticateConfig
--	if not config then return false end

--	local ptrCount 	= args[1]
--	local ptrSrc	= args[2]
--	local paramCount = args[ptrCount+3]
--	--print("paramCount="..paramCount)
--	local attrStatue = {}
--	for i = 1,paramCount do
--		table.insert(attrStatue,args[ptrCount+3+i])
--	end

--	--获取玩家上锁的数量
--	local lockNum = 0
--	for key,value in ipairs(attrStatue or {}) do
--		if value == 1 then
--			lockNum = lockNum + 1
--		end
--	end

--	if lockNum > config.lockMax then
--		print("lock num exceed max actorid = ".. Actor.getIntProperty(sysarg, PROP_ENTITY_ID))
--		return false
--	end

--	local needYbCount = 0
--	local nAuthentScore = Item.getItemProperty(sysarg,ptrSrc,30) --鉴定数值
--	for key,value in ipairs(attrStatue or {}) do
--		local level = System.getBitValue(value-1,nAuthentScore)
--		if level <= 0 then
--			needYbCount = needYbCount + 0
--		else
--			needYbCount = needYbCount + config.lockConsume[level].count
--		end
--	end

--	local nYbCount = Actor.getMoneyCount(sysarg,mtYuanbao)
--	if nYbCount < needYbCount then
--		return false
--	end

--	--把上锁的属性ID先放进来 ，用来本来生成属性的那几个ID
--	local attrTable = {}
--	for key,id in ipairs(attrStatue or {}) do
--		table.insert(attrTable,{index = id,status = 1})
--	end
--    local nLoopIndex = 0
--	--获取剩余的属性ID加载进来
--	while #attrTable < config.lockMax do
--		local id = math.random(1,config.maxAttr)
--		if #attrTable == 0 then
--			table.insert(attrTable,{index = id,status = 0})
--		else
--			for key,value in ipairs(attrTable) do
--				if id == value.index then
--					id = math.random(1,config.maxAttr)
--					break
--				elseif key == #attrTable then
--					table.insert(attrTable,{index = id,status = 0})
--					break
--				end
--			end
--		end
--         nLoopIndex = nLoopIndex + 1
--        if nLoopIndex > 10000 then
--                System.trace("LoopIndex NewEquipAuthenticate")
--                break
--        end
--	end	

--	--检查和扣除消耗
--	-- 检查
--	local consumeData = {}
--	local ret = CheckAllConsume(sysarg, false, config.consume, true, consumeData)
--	if not ret then
--		return false
--	end

--	--扣费
--	ret = DeductAllConsume(sysarg, false, config.consume, GameLog.cEquipAuthConsume)
--	if not ret then
--		return false
--	end

--	if needYbCount > 0 then
--		if Actor.changeMoney(sysarg,3,-needYbCount,GameLog.clEquipHoleMoney,"装备鉴定锁定属性扣除元宝") == false then
--			print("Actor lock delete YB error，ActorID = "..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
--			return false
--		end
--	end

--	local nPersent = 0
--	for key ,value in ipairs(config.rate or {}) do
--		nPersent = nPersent + value
--	end
--	--print(nPersent)

--	--Item.setItemProperty(sysarg,ptrSrc,ipItemAppraisal,0)
--	local nNewValue = 0
--	for key,value in ipairs(attrTable or {}) do
--		local level = math.random(nPersent)
--		local attrPersent = 0
--		for k,v in ipairs(config.rate) do
--			attrPersent = attrPersent + v
--			if level < attrPersent then
--				level = k
--				break
--			end
--		end

--		if value.status == 0 then
--			--print("value.index="..value.index-1)
--			nNewValue = System.setBitValue(value.index-1,level,nNewValue) --nAuthentScore
--		elseif value.status == 1 then
--			print("index="..value.index.."	")
--			local nOldLevel = System.getBitValue(value.index-1,nAuthentScore)
--			if nOldLevel < level or nOldLevel == 0 then
--				print("--------------nOldLevel="..nOldLevel)
--				print("level="..level)
--				nNewValue = System.setBitValue(value.index-1,level,nNewValue) --nAuthentScore
--			else
--					print("*********nOldLevel="..nOldLevel)
--					print("level="..level)
--				nNewValue = System.setBitValue(value.index-1,nOldLevel,nNewValue)
--			end
--		end
--	end
--	--print(nNewValue)
--	Item.setItemProperty(sysarg,ptrSrc,30,nNewValue)
end

function NewEquipAuthenticateConsume(sysarg, args)
	local ptrCount = args[1]			--指针数量
	local ptrSrc = args[2]
	if not ptrSrc then
		return
	end
	local opType = args[ptrCount+2]
	local config = EquipNewAuthenticateConfig
	if not config then return false end

	local nCurTab = {}
	local nAuthentScore = Item.getItemProperty(sysarg,ptrSrc,30)
	for i = 1,config.maxAttr do
		local level = System.getBitValue(i-1,nAuthentScore)
		table.insert(nCurTab,level)
	end
	
	local netPack = DataPack.allocPacket(sysarg, 8, 15)
	DataPack.writeByte(netPack, opType)
	local SizeConsume = config.maxAttr+#config.consume
	DataPack.writeByte(netPack,SizeConsume)
	
	for k, curTab in ipairs(config.consume) do
		DataPack.writeChar(netPack, curTab.type)
		DataPack.writeInt(netPack, curTab.id or 0)
		DataPack.writeInt(netPack, curTab.count)	
		DataPack.writeByte(netPack, 0)
	end
	for index,value in ipairs(nCurTab) do
		for k, curTab in ipairs(config.lockConsume) do
			if value == k then
				DataPack.writeByte(netPack,config.lockConsume[k].type)
				DataPack.writeInt(netPack,config.lockConsume[k].id or 0)
				DataPack.writeInt(netPack,config.lockConsume[k].count)
				DataPack.writeByte(netPack, 0)
				--print(config.lockConsume[k].type.."		"..config.lockConsume[k].id.." 	  "..config.lockConsume[k].count)
				break
			elseif 	k == #config.lockConsume then
				DataPack.writeByte(netPack,15)
				DataPack.writeInt(netPack,0)
				DataPack.writeInt(netPack,0)
				DataPack.writeByte(netPack, 0)
				--print("------")
				break
			end
		end
	end
	DataPack.flush(netPack)
end