--#include "data\config\activity\OneHundredActivityCfg.lua" once
--#include  "data\functions\modules\OpenServer_Pay_Rank.lua" once
function GetActorTodayOnlineTime(sysarg)
	if sysarg == nil then return 0 end
	
	local nCurTime = System.getCurrMiniTime()
	local nLoginTime = Actor.getLoginTime(sysarg)
	local nToday = System.getToday()
	
	local sec = nCurTime - nLoginTime
	if nLoginTime < nToday then
		sec = nCurTime - nToday
	end
	
	return sec
end
MiscsImplement.GetOpenServerPayRank =function( sysarg, msgid, packet )
    Pay_Rank_Query(sysarg)
end
--百服活动
MiscsImplement.OnOneHundredActivity = function( sysarg, msgid, packet )
	
	if not OneHundredActivityCfg then return end
	
	-- 获得白服活动状态（0:关闭，1:开启，2:结束且显示图标）
	if System.getHundredServerStatus() ~= 1 then
		return
	end
	
	local nResult = false
	local nType = DataPack.readByte(packet)	
	if nType == 1 then
		SendOneHundredActivityData(sysarg)
	elseif nType == 2 then
		nResult = HundredAllPeople(sysarg,packet)
	elseif nType == 3 then
		nResult = HundredOnlineGift(sysarg,packet)
	elseif nType == 4 then
		nResult = HundredCollectExchange(sysarg,packet)
	elseif nType == 5 then
		nResult = HundredMissionStep(sysarg,packet)
	elseif nType == 6 then
		HundredBossScene(sysarg,packet)
	elseif nType == 7 then
		HundredKingSuit(sysarg,packet)
	else
		return
	end
	
	if nResult then	
		SendOneHundredActivityData(sysarg)
	end
end

function HundredAllPeople(sysarg,packet)
	
	local config = OneHundredActivityCfg.AllPeopleGift
	if not config then return false end

	local var = Actor.getStaticVar(sysarg)
	if var.OneHundredFreeGift2 then
		return false
	end
	
	if not Actor.checkActorLevel(sysarg,config.needLevel) then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf345,config.needLevel),ttFlyTip)
		return false
	end
	
	if not Awards.CheckBagGridCount(sysarg, config.award) then
		return false
	end
		
	Awards.Give(sysarg, config.award, 1029, "百服活动全民共享")
	var.OneHundredFreeGift2 = 1
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf344,ttFlyTip)
	
	return true
end

function HundredOnlineGift(sysarg,packet)
	
	local nGiftType = DataPack.readByte(packet)
	
	local config = OneHundredActivityCfg.OnlineGift[nGiftType]
	if not config then return false end
		
	local var = Actor.getStaticVar(sysarg)
	if not var.HundredOnlineTime then
		var.HundredOnlineTime = 0
	end

	if not var.HundredOnlineAward then
		var.HundredOnlineAward = {}
	end	
	
	if var.HundredOnlineAward[nGiftType] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf346,ttFlyTip)
		return false
	end
		
	local nSecond = var.HundredOnlineTime + GetActorTodayOnlineTime(sysarg)
	local nMinute = nSecond / 60
	
	if nMinute < config.onlineMinute then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf347,config.onlineMinute),ttFlyTip)
		return false
	end
	
	if not Awards.CheckBagGridCount(sysarg, config.award) then
		return false
	end
		
	Awards.Give(sysarg, config.award, 1029, "百服活动在线豪礼")
	var.HundredOnlineAward[nGiftType] = 1
	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf348,config.onlineMinute),ttFlyTip)
	return true
end

function HundredCollectExchange(sysarg,packet)
	
	return false
	--local nGiftType = DataPack.readByte(packet)
	--local config = OneHundredActivityCfg.CollectExchange[nGiftType]
	--if not config then return false end
    --
	--for _,itemId in ipairs(config.needItem) do
	--	if Actor.getItemCount(sysarg,itemId) <= 0 then
	--		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf350,Item.getItemName(itemId)),ttFlyTip)
	--		return false
	--	end
	--end
	--
	--for _,itemId in ipairs(config.needItem) do
	--	if Actor.removeItem(sysarg,itemId,1) ~= 1 then
	--		return false
	--	end
	--end
	--
	--if Awards.Give(sysarg, config.award, 1029, "百服活动集字换宝") then
	--	Actor.addVipPoint(sysarg,config.addVipPoint)
	--end	
	--Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf349,config.award[1].count,config.addVipPoint),ttFlyTip)
	--return true
end

function HundredMissionStep(sysarg,packet)
	
	local nGiftType = DataPack.readByte(packet)
	
	local config = OneHundredActivityCfg.MissionStepGift[nGiftType]
	if not config then return false end

	local var = Actor.getStaticVar(sysarg)
	if not var.MissionStep then
		var.MissionStep = 0
	end
	
	if not var.MissionStepAward then
		var.MissionStepAward = {}
	end
	
	if config.needLevel then
		if not Actor.checkActorLevel(sysarg,config.needLevel) then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf355,ttFlyTip)
			return false
		end
	end
	
	if nGiftType > var.MissionStep and var.MissionStep ~= 5 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf351,ttFlyTip)
		return false
	end
	
	if var.MissionStepAward[nGiftType] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf352,ttFlyTip)
		return false
	end
	
	if not Awards.CheckBagGridCount(sysarg, config.award) then
		return false
	end
		
	Awards.Give(sysarg, config.award, 1029, "百服活动闯关大礼")
	var.MissionStepAward[nGiftType] = 1
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf353,ttFlyTip)
	return true
end

function HundredBossScene(sysarg,packet)
	
	local config = OneHundredActivityCfg.BossRaid
	if not config then return false end
			
	if not checkActivityCondition(sysarg,config.needLevel) then
		return
	end
	
	Actor.enterScene(sysarg,config.BossSceneId,math.random(unpack(config.ActorPosX)),math.random(unpack(config.ActorPosY)))
end

function HundredKingSuit(sysarg,packet)
	
	local nType = DataPack.readByte(packet)
	local nId = DataPack.readByte(packet)
	
	local config = OneHundredActivityCfg.KingSuit[nType][nId]
	if not config then return false end

		--检查消耗
	local consumeData = {}
	local isok = CheckAllConsume(sysarg, false, config.consume, true, consumeData)
	if isok == false then return end
	--扣除消耗
	local nStrong = 0
	local nBlood = 0
	local nStrongLimit = 12
	
	for _,item in ipairs(config.consume) do
		if item.type == 0 then
			for i = 1,item.count do
				local nItem = Item.getBagItemPtrById(sysarg,item.id)
				if nItem then
					local itemType = Item.getItemProperty(sysarg, nItem, Item.ipItemType, 0)
					if itemType > Item.itUndefinedType and itemType < Item.itEquipMax  then
						local nTempStrong = Item.getItemProperty(sysarg,nItem,Item.ipItemStrong)
						local bTempBlood = Item.getItemProperty(sysarg,nItem,Item.ipItemAppraisal)
						local nTempStrongLimit = Item.getItemProperty(sysarg,nItem,Item.ipItemStrongLimit)
						if nTempStrong > nStrong then
							nStrong = nTempStrong
							nStrongLimit = nTempStrongLimit
						end
						if bTempBlood > nBlood then
							nBlood = bTempBlood
						end
					end
					if Actor.removeItemByPtr(sysarg,nItem,item.count) ~= 1 then
						print("removePtr error")
						return
					end
				end
			end
		end
	end
	
	local award = config.award[1]
	local nNewItem = Item.createItem(award.id,award.count,nStrong,0,0)
	Item.addItem(sysarg,nNewItem,"百服活动合成霸者新装备",1029)
	Item.setItemProperty(sysarg, nNewItem, Item.ipItemStrongLimit, nStrongLimit);
	Item.setItemProperty(sysarg, nNewItem, Item.ipItemAppraisal, nBlood);
end

function CreateHundredMonster()
	
	-- 获得白服活动状态（0:关闭，1:开启，2:结束且显示图标）
	if System.getHundredServerStatus() ~= 1 then
		print("Hundred Server Status is Close")
		return
	end
	
	local config = OneHundredActivityCfg.BossRaid
	if not config then print("找不到配置") return end
	
	local hScene = Fuben.getSceneHandleById(config.BossSceneId, 0)
	local nMonserPtr = Fuben.createMonster(hScene, config.BossID,config.BossEnterPos[1],config.BossEnterPos[2],10800)
	print("Create Monster Success")

	local onlinePlayerList = LuaHelp.getAllActorList(config.needLevel)
	if not onlinePlayerList then return end
		
	for _,player in ipairs(onlinePlayerList) do
		if player then
			local netPack = DataPack.allocPacket(player, 26, 70)
			DataPack.writeByte(netPack, 4)
			DataPack.writeString(netPack,config.titleName)
			DataPack.writeString(netPack,config.content)
			DataPack.writeByte(netPack,1)
			DataPack.writeString(netPack,config.buttonName)
			DataPack.flush(netPack)
		end
	end
	
	System.broadcastTipmsg(Lang.ScriptTips.zf354,2048)
end

function SendOneHundredActivityData(sysarg)
	
	local config = OneHundredActivityCfg
	if not config then return end
	
	local var = Actor.getStaticVar(sysarg)	
	
	local netPack = DataPack.allocPacket(sysarg, 139, 132)
	if var.OneHundredFreeGift2 then
		DataPack.writeByte(netPack, 2)
	elseif not Actor.checkActorLevel(sysarg,config.AllPeopleGift.needLevel) then
		DataPack.writeByte(netPack, 0)
	else
		DataPack.writeByte(netPack, 1)
	end
	
	
	if not var.HundredOnlineTime then
		var.HundredOnlineTime = 0
	end
	if not var.HundredOnlineAward then
		var.HundredOnlineAward = {}
	end
	
	local nSecond = var.HundredOnlineTime + GetActorTodayOnlineTime(sysarg)
	local nMinute = nSecond / 60
	DataPack.writeInt(netPack, nMinute)
	DataPack.writeByte(netPack, #config.OnlineGift)
	for index,onlineTime in ipairs(config.OnlineGift) do
		if var.HundredOnlineAward[index] then
			DataPack.writeByte(netPack, 2)
		elseif nMinute >= onlineTime.onlineMinute then
			DataPack.writeByte(netPack, 1)
		else
			DataPack.writeByte(netPack, 0)
		end
	end


	if not var.MissionStep then
		var.MissionStep = 0
	end
	
	if not var.MissionStepAward then
		var.MissionStepAward = {}
	end
	
	local nStepData = getMissionStepData(sysarg)
	DataPack.writeByte(netPack, #config.MissionStepGift)
	for index,mission in ipairs(config.MissionStepGift) do
		if var.MissionStepAward[index] then
			DataPack.writeByte(netPack, 2)
			DataPack.writeInt(netPack, mission.finishCount)
		elseif var.MissionStep >= index then
			DataPack.writeByte(netPack, 1)
			DataPack.writeInt(netPack, mission.finishCount)
		else
			DataPack.writeByte(netPack, 0)
			DataPack.writeInt(netPack, nStepData[index])
		end
	end

	DataPack.flush(netPack)
end

function getMissionStepData(sysarg)
	
	local nData = {}
	local var = Actor.getStaticVar(sysarg)
	if not var.oneHundredPay then
		var.oneHundredPay = 0
	end
	table.insert(nData,var.oneHundredPay)
	
	if not var.HundreaKillMonsterNum then
		var.HundreaKillMonsterNum = 0
	end	
	table.insert(nData,var.HundreaKillMonsterNum)
	
	if not var.HundreaKillActorNum then
		var.HundreaKillActorNum = 0
	end		
	table.insert(nData,var.HundreaKillActorNum)
	
	if not var.HundreaRecoverEquipNum then
		var.HundreaRecoverEquipNum = 0
	end		
	table.insert(nData,var.HundreaRecoverEquipNum)	
	
	if not var.HundreaSynthesisEquipNum then
		var.HundreaSynthesisEquipNum = 0
	end		
	table.insert(nData,var.HundreaSynthesisEquipNum)	
	
	table.insert(nData,0)
	
	return nData
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetOneHundredActivity, MiscsImplement.OnOneHundredActivity)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetOpenServerPayRank, MiscsImplement.GetOpenServerPayRank)