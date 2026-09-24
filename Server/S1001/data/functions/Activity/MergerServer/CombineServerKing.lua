--合服五天王城奖励
function getCombineServerKingAwards(sysarg,packet)
	
	local nHour,nMin,nSec = System.getTime(0,0,0)
	if nHour < 21 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.ComSerK0007,ttFlyTip)
		return false
	end
		
	if Guild.getSbkWarFlag() == 1 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.ComSerK0001,ttFlyTip)
		return false 
	end
		
	local nSbkLeaderId = Guild.getSbkCityOwner()
	if nSbkLeaderId <= 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.ComSerK0002,ttFlyTip)
		return false 
	end
	
	local nCityWarAward = MergerServerCfg.CityWarAward
	if not nCityWarAward then return false end
	local nGiftIndex = DataPack.readByte(packet)
	
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local sVar = System.getStaticVar()
	local config
	if nGiftIndex == 1 then
		if nSbkLeaderId ~= nActorId then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.ComSerK0003,ttFlyTip)
			return false
		end
		
		if sVar.CombineSbkLeader then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.n00010,ttFlyTip)
			return false
		end
		
		config = nCityWarAward.Leader
	elseif nGiftIndex == 2 then
		local nSbkGuildId = Guild.getSbkCityOwnerGuildId()
	
		if nSbkGuildId <= 0 then
			return false
		else
			if nSbkGuildId ~= Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID) then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.ComSerK0006,ttFlyTip)
				return false
			end
			
			if nSbkLeaderId == nActorId then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.ComSerK0008,ttFlyTip)
				return false
			end
			
			if not sVar.CombineSbkMasses then
				sVar.CombineSbkMasses = {}
			elseif sVar.CombineSbkMasses[nActorId] then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.n00010,ttFlyTip)
				return false
			end
			
			if sVar.CombineSbkLeader then
				if sVar.CombineSbkLeader == nActorId then
					Actor.sendTipmsg(sysarg,Lang.ScriptTips.ComSerK0009,ttFlyTip)
					return false
				end
			end
		end
		
		config = nCityWarAward.Masses
	end
	
	if not config then return false end
	if not Awards.CheckBagGridCount(sysarg, config) then
		return false
	end
	
	local bResult = Awards.Give(sysarg, config, 817, "合服王城奖励")
	if bResult == false then
		print("give award error, actor name = "..Actor.getName(sysarg))
		return false
	end
	
	if nGiftIndex == 1 then
		sVar.CombineSbkLeader = nActorId
	else
		sVar.CombineSbkMasses[nActorId] = 1
	end

	SendCombineData(sysarg)
	return true
end