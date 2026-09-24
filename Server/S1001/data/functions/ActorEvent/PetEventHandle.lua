--宠物宝宝事件

--#include "data\config\ActorEvent\PetEventCfg.lua" once

PetOpFuncList = {}

EventCallDispatcher.HandlerPetOp = function (sysarg, args)
	
	if args[1] == nil then return end  
	local func = PetOpFuncList[args[1]]
	if func ~= nil then
		func(sysarg, args) 
	end
end

function PetConfig(id)	
	for key,value in ipairs(PetCofig.buyPet) do
		if id == value.id then
			return value
		end
	end	
	return nil
end

function BuyPetConditions(sysarg)
	
	local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if level < PetCofig.buyPet.openLevel then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf129,ttFlyTip)
		return false
	end
	
	for key ,value in ipairs(PetCofig.buyPet) do
		local petCount = Pet.getPetCountById(sysarg,value.petId)
		if petCount > 0 then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf127,ttFlyTip)
			return false
		end
	end
	
	if Actor.getSceneId(sysarg) == StdActivity[6].lowSceenId then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf224,ttFlyTip)
		return false
	elseif Actor.getSceneId(sysarg) == 171 then
		Actor.sendTipmsg(sysarg,"本场景内不能召唤宠物",ttFlyTip)
		return false
	end
	
	return true
end

--购买宠物
PetOpFuncList[1] = function(sysarg, args) 
	
	local id = args[2]
	
	if not PetCofig or not PetCofig.buyPet then return end
	
	local config = PetConfig(id)
	if not config then return end
		
	if BuyPetConditions(sysarg) == false then
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	if not var.activateInfo then
		return
	end
		
	if not var.days.BuyPetNum then
		var.days.BuyPetNum = {}
	end
	
	if not var.days.BuyPetNum[id] then
		var.days.BuyPetNum[id] = 0
	elseif var.days.BuyPetNum[id] >= config.coinMaxNum and config.coinMaxNum ~= -1 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf217,ttFlyTip)
		return 
	end
	
	local consume = config.consume
	if not consume then return end
	local consumeData = {}
	local result = CheckOneConsume(sysarg, false, consume, true, consumeData)
	
	if not result or result == false then 
		return 
	end
	
	result = DeductOneConsume(sysarg, false, consume, GameLog.cNewBuyPetConsume)
	if not result then
		return
	end
	
	local petId = Pet.addPet(sysarg,config.petId,1,config.petAi,0)
	if petId <= 0 then  
		print("add pet error,Actor id ="..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	var.days.BuyPetNum[id] = var.days.BuyPetNum[id] + 1
	if not var.petId then
		var.petId = petId
	end
	
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf128,ttFlyTip)
end

function CheckTempAddAttr(sysarg,nType)
	
	if not PetCofig or not PetCofig.StrengthenAttr then return nil end
	local config = PetCofig.StrengthenAttr
	if not config then return end
	local nMultiple = config.multipleConfig[nType]
	if not nMultiple then return end
	
	local var = Actor.getStaticVar(sysarg)

	local nPetId  = 0
	for key ,value in ipairs(config.PetId) do
		if Pet.getPetCountById(sysarg,value) > 0 then
			nPetId = value
			break
		end
	end
	if nPetId <= 0 then 
		Actor.sendTipmsg(sysarg,"您当前没有宠物",ttFlyTip)    
		return nil 
	end

	if var.addTempAck then
		if var.addTempAck[2] then
			if nMultiple.multiple == var.addTempAck[2] then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf164,ttFlyTip)    
				return nil
			elseif nMultiple.multiple < var.addTempAck[2] then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf165,ttFlyTip)    
				return nil
			end
		end
	else
		var.addTempAck = {}
	end
	
	local nPetPtr = Pet.getPetByConfigId(sysarg,nPetId)
	if not nPetPtr then return nil end
		
	return nPetPtr
end

-- type 配置表索引ID
-- nPetPtr 宠物的指针
function TempAddAttr(sysarg,nType,nPetPtr)

	local config = PetCofig.StrengthenAttr		
	local nMultiple = config.multipleConfig[nType]
	if not nMultiple then return end
		
	for key,value in ipairs(config.attrType) do
		Pet.setIntAddAttr(nPetPtr,value,0)
	end
	
	local var = Actor.getStaticVar(sysarg)
	local combatAttr = {}
	for i = 13,22 do	--最小物理攻击属性开始到最大魔法防御TypeId
		if var.addTempAck[1] and var.addTempAck[2] then
			local nNum = Actor.getIntProperty(nPetPtr,i)	--属性初始化回来
			local attrNum = nNum/var.addTempAck[2]
			Actor.setIntProperty(nPetPtr,i,attrNum)
		end
		table.insert(combatAttr,Actor.getIntProperty(nPetPtr,i))
	end
	
	for key,value in ipairs(config.attrType) do
		Pet.setIntAddAttr(nPetPtr,value,combatAttr[key]*(nMultiple.multiple-1))
	end
	
	local nCurTime = System.getCurrMiniTime()
	var.addTempAck[1] = nCurTime + config.times
	var.addTempAck[2] = nMultiple.multiple
	Actor.collectOperate(nPetPtr,0)
	
	local npack = DataPack.allocPacket(sysarg, 34, 1)
	if not npack then return end 
	DataPack.writeInt(npack,config.times)
	DataPack.writeByte(npack,nMultiple.multiple)	
	DataPack.flush(npack)
	
	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf163,nMultiple.multiple),ttFlyTip)	
end

--属性临时增加
PetOpFuncList[2] = function(sysarg, args) 

	local nType = args[2]
	if nType <= 0 then return end
	
	--宠物按钮临时增加属性改为使用物品，这里屏蔽
	--CheckTempAddAttr(sysarg,nType)
	--TempAddAttr(sysarg,nType)
end

--购买的宝宝死亡处理
PetOpFuncList[3] = function(sysarg, args) 
	
	local nConfigId = args[2]
	local petCount = 0
	
	local nPetIdTable = {256,257,258}
	for key ,value in ipairs(nPetIdTable) do
		if nConfigId == value then
			petCount = Pet.getPetCountById(sysarg,value)
			break
		end
	end

	if petCount <= 0 then return end
	
	local var = Actor.getStaticVar(sysarg)
	if var.addTempAck then var.addTempAck = nil end 
	if var.petId then var.petId = nil end
	if var.petInfo then var.petInfo = nil end
	
	Actor.setSocialMask(sysarg,smisHasPet,false)
	local npack = DataPack.allocPacket(sysarg, 34, 1)
	if not npack then return end
	DataPack.writeInt(npack,0)
	DataPack.writeByte(npack,0)	
	DataPack.flush(npack)
end

function SendPetActivateInfo(sysarg)
	
	local npack = DataPack.allocPacket(sysarg, 34, 2)
	if not npack then return end 
	
	local var = Actor.getStaticVar(sysarg)
	local nLen = table.getn(PetCofig.buyPet)
	DataPack.writeByte(npack,nLen)
	
	if not var.activateInfo then
		var.activateInfo = {}
	end

	for i = 1,nLen do
		if not var.activateInfo[i] then
			DataPack.writeByte(npack,0)	
		else
			DataPack.writeByte(npack,1)	
		end
	end
	
	DataPack.flush(npack)	
end

function CheckPetActivate(sysarg,config)
	if config.vipLevel > 0 then
		local nVipLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)
		if nVipLevel < config.vipLevel then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf215,config.vipLevel),ttFlyTip)
			return false
		end
	end
	
	local var = Actor.getStaticVar(sysarg)
	if config.SuperpositionDay > 0 then
		if not var.SevenDayFlag then
			var.SevenDayFlag = 0
		end
		if var.SevenDayFlag < config.SuperpositionDay then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf216,config.SuperpositionDay),ttFlyTip)
			return false
		end
	end
	
	return true
end

--宠物所有激活信息
PetOpFuncList[4] = function(sysarg, args) 
	SendPetActivateInfo(sysarg)
end


--激活宠物
PetOpFuncList[5] = function(sysarg, args) 

	local nActivate = args[2]
	local nLen = table.getn(PetCofig.buyPet)
	if nActivate <= 0 or nActivate > nLen then
		return
	end
	
	local config = PetConfig(nActivate)
	if not config then return end
	
	if CheckPetActivate(sysarg,config) == false then
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	if not var.activateInfo then
		var.activateInfo = {}
	end
	
	if not var.activateInfo[nActivate] then
		var.activateInfo[nActivate] = 1
	else
		return
	end
	
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf218,ttFlyTip)
	SendPetActivateInfo(sysarg)
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aePetEvent, EventCallDispatcher.HandlerPetOp)