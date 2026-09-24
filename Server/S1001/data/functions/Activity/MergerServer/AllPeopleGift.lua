
--合区抽奖
function CombineLottery(sysarg,packet)
	
	local nLotteryType = DataPack.readByte(packet)

	local config = MergerServerCfg.Lottery
	if not config then
		return false
	end
		
	local var = Actor.getStaticVar(sysarg)
	if not var.CombineLotteryScore then
		var.CombineLotteryScore = 0
	end
	
	if nLotteryType == 0 then
		InitLotteryId(sysarg,config)
		
	elseif nLotteryType == 1 then
		if var.CombineLotteryScore < config.needScore then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf312,config.needScore,var.CombineLotteryScore),ttFlyTip)
			return false
		end
		
		if not var.CombineLotteryId then
			return false
		elseif not var.CombineLotteryId[1] then
			return false
		end
		
		local nGroup = var.CombineLotteryId[1]
	
		if not var.CombineLotteryId[2] then
			local nAllPersent = 0 
			for _,item in ipairs(config.items[nGroup]) do
				nAllPersent = nAllPersent + item.nPersent
			end
			if nAllPersent == 0 then return false end
				
			local nRandomScore = math.random(nAllPersent)
			local nCurPersent = 0
			local nId = 0

			for id,item in ipairs(config.items[nGroup]) do
				nCurPersent = nCurPersent + item.nPersent
				if nRandomScore <= nCurPersent then
					nId = id
					break
				end
			end
			var.CombineLotteryId[2] = nId
		end
		
		local netPack = DataPack.allocPacket(sysarg, 139,115)
		DataPack.writeByte(netPack, var.CombineLotteryId[1])
		DataPack.writeByte(netPack, var.CombineLotteryId[2])
		DataPack.writeInt(netPack, var.CombineLotteryScore/config.needScore)
		DataPack.flush(netPack)
		
	elseif nLotteryType == 2 then
	
		if not var.CombineLotteryId then
			return false
		elseif not var.CombineLotteryId[1] or not var.CombineLotteryId[2] then
			return false
		end
		
		local nGroup = var.CombineLotteryId[1]
		local nId = var.CombineLotteryId[2]
		
		local nAward = config.items[nGroup][nId]
		
		local needCount = Item.getAddItemNeedGridCount(sysarg,nAward.id,nAward.count)
		local hasCount = Item.getBagEmptyGridCount(sysarg)
		if needCount > hasCount then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.dm010,ttFlyTip)
			return false
		end
		
		Actor.giveAward(sysarg,nAward.type,nAward.id,nAward.count,nAward.quality,nAward.strong,nAward.bind,0,817,"合区抽奖")
		System.broadcastTipmsg(string.format(Lang.ScriptTips.zf314,Actor.getName(sysarg),Item.getItemName(nAward.id)),2048)
		var.CombineLotteryScore = var.CombineLotteryScore - config.needScore
		
		System.sendCommonLog(1079,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),4,1)
		
		var.CombineLotteryId = nil
		InitLotteryId(sysarg,config)
	end
	
	return true
end

function InitLotteryId(sysarg,config)
	local itemCount = #config.items
	if itemCount == 0 then return end
	
	local var = Actor.getStaticVar(sysarg)
	if not var.CombineLotteryId then
		local nLotteryId = math.random(itemCount)
		var.CombineLotteryId = {}
		var.CombineLotteryId[1] = nLotteryId
	end
	
	local netPack = DataPack.allocPacket(sysarg, 139,115)
	DataPack.writeByte(netPack, var.CombineLotteryId[1])
	DataPack.writeByte(netPack, 0)
	DataPack.writeInt(netPack, var.CombineLotteryScore/config.needScore)
	DataPack.flush(netPack)
end

function EnterCombineScene(sysarg,packet)
	
	if System.getDaysSinceCombineServer() > 5 then return false end
	local nMergerType = DataPack.readByte(packet)

	local config = MergerServerCfg.SceneInfo
	if not config then
		return false
	end

	if not CombineSceneCondition(sysarg,config.needLevel,config.needCircle) then
		return false
	end
	
	Actor.enterScene(sysarg,config.sceneId)
	
	return true
end

function CombineSceneCondition(sysarg,level,circle)
	local Var = Actor.getStaticVar(sysarg)
	--运镖中
	if Var.ybstate == 1 then
		Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip) 
		return false
	end
	
	--在副本中
	local fubenId = Actor.getFubenId(sysarg)
	if fubenId > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf568, ttFlyTip) 
		return false
	end
	
	--在武林争霸中
	if Actor.getSceneId(sysarg) == 58 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf138,ttFlyTip)
		return false
	end

	if not Actor.checkActorLevel(sysarg,level,circle) then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf313,circle,level),ttFlyTip)
		return false
	end	
	
	return true
end