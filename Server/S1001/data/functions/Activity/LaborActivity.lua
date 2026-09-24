--#include "data\config\activity\LaborActivityCfg.lua" once

MiscsImplement.OnLaborActivity = function( sysarg, msgid, packet )
	return
	--[[
	if not LaborActivityCfg then return end
	
	if IsOpenActivity(LaborActivityCfg) ~= 5 then
		return
	end
	
	local nResult = false
	local nType = DataPack.readByte(packet)	
	if nType == 1 then
		nResult = LaborLoginGift(sysarg,packet)
	elseif nType == 2 then
		nResult = LaborSinglePayGift(sysarg,packet)
	elseif nType == 3 then
		nResult = LaborCumulativePayGift(sysarg,packet)
	elseif nType == 4 then
		EnterLaborBoss(sysarg,packet)
	elseif nType == 5 then
		LaborLottery(sysarg,packet)
	else
		return
	end
	
	if nResult then
		SendLaborActivityData(sysarg)
	end
	--]]
end

function LaborLoginGift(sysarg,packet)
	
	local nDay = DataPack.readByte(packet)
	local config = LaborActivityCfg.LoginGift
	if not config then return false end
	
	if not Actor.checkActorLevel(sysarg,config.needLevel,config.needCircle) then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf310,config.needCircle,config.needLevel),ttFlyTip)
		return false 
	end
	
	local var = Actor.getStaticVar(sysarg)
	if not var.LaborLoginDay then
		var.LaborLoginDay = 0
	end
	
	if var.LaborLoginDay < nDay then
		return
	end
	
	if not var.LaborLoginDayFlag then
		var.LaborLoginDayFlag = {}
	elseif var.LaborLoginDayFlag[nDay] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.tf00041,ttFlyTip)
		return
	end
	
	if not Awards.CheckBagGridCount(sysarg, config.award[nDay]) then
		return false
	end

	local bResult = Awards.Give(sysarg, config.award[nDay], 1080, "51劳动每日奖励")
	if bResult == false then
		print("give award error, actor name = "..Actor.getName(sysarg))
		return false
	end
	
	var.LaborLoginDayFlag[nDay] = 1
	System.sendCommonLog(1084,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),1,nDay)
	
	return true
end

function LaborSinglePayGift(sysarg,packet)
	
	local nType = DataPack.readByte(packet)

	local config = LaborActivityCfg.SinglePay

	local var = Actor.getStaticVar(sysarg)
			
	local nSinglePayValue = var.LaborSinglePayValue
	if not nSinglePayValue then
		return false
	elseif nSinglePayValue < config[nType].needPay then
		return false
	end

	local nSinglePayFlag = var.LobarSinglePayFlag
	if not nSinglePayFlag then
		var.LobarSinglePayFlag = {}
	elseif nSinglePayFlag[nType] then
		return false
	end	
	
	if not Awards.CheckBagGridCount(sysarg, config[nType].award) then
		return false
	end
	
	local bResult = Awards.Give(sysarg, config[nType].award, 1081, "51劳动单笔奖励")
	if bResult == false then
		print("give award error, actor name = "..Actor.getName(sysarg))
		return false
	end
	
	var.LobarSinglePayFlag[nType] = 1
	System.sendCommonLog(1084,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),2,nType)
	
	return true
end

function LaborCumulativePayGift(sysarg,packet)
	
	local nType = DataPack.readByte(packet)

	local config = LaborActivityCfg.CumulativePay

	local var = Actor.getStaticVar(sysarg)
	
	local nCumulativePayFlag = var.LaborCumulativePayFlag
	if not nCumulativePayFlag then
		var.LaborCumulativePayFlag = {}
	elseif nCumulativePayFlag[nType] then
		return false
	end
	
	local nCumulativePayValue = var.LaborCumulativePayValue
	if not nCumulativePayValue then
		return false
	elseif nCumulativePayValue < config[nType].needPay then
		return false
	end
	
	if not Awards.CheckBagGridCount(sysarg, config[nType].award) then
		return false
	end
	
	local bResult = Awards.Give(sysarg, config[nType].award, 1082, "51劳动累积奖励")
	if bResult == false then
		print("give award error, actor name = "..Actor.getName(sysarg))
		return false
	end

	var.LaborCumulativePayFlag[nType] = 1
	System.sendCommonLog(1084,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),3,nType)
	
	return true
end

function EnterLaborBoss(sysarg,packet)

	local config = LaborActivityCfg.LaborBoss
	if not config then
		return false
	end	
	
	if not CombineSceneCondition(sysarg,1,0) then
		return false
	end

	Actor.enterScene(sysarg,config.SceneId)
	
	return true
end

function CreateLaborBoss()
		
	local config = LaborActivityCfg.LaborBoss
	if not config then 
		print("Find the LaborBoss config is nil") 
		return 
	end
	
	local hScene = Fuben.getSceneHandleById(config.SceneId, 0)
	local nMonserPtr = Fuben.createMonster(hScene, config.BossId,config.BossPos[1],config.BossPos[2],config.liveTime)
	print("Create Monster Success")

	local onlinePlayerList = LuaHelp.getAllActorList(config.needLevel)
	if not onlinePlayerList then return end
		
	for _,player in ipairs(onlinePlayerList) do
		if player then
			local netPack = DataPack.allocPacket(player, 26, 70)
			DataPack.writeByte(netPack, 5)
			DataPack.writeString(netPack,config.titleName)
			DataPack.writeString(netPack,config.content)
			DataPack.writeByte(netPack,1)
			DataPack.writeString(netPack,config.buttonName)
			DataPack.flush(netPack)
		end
	end
	
	System.broadcastTipmsg(Lang.ScriptTips.zf372,2048)
end

--51劳动抽奖
function LaborLottery(sysarg,packet)
	
	local nLotteryType = DataPack.readByte(packet)

	local config = LaborActivityCfg.LaborLuckyDraw
	if not config then
		print("Find the LaborLucky Config is nil ")
		return false
	end
		
	local var = Actor.getStaticVar(sysarg)
	if not var.LaborLotteryNum then
		var.LaborLotteryNum = 0
	end
	
	local isFree = false
	if var.LaborLotteryNum %10 == 0 and var.LaborLotteryNum/10 > 0 then
		isFree = true
	end
	
	if nLotteryType == 0 then
		InitLaborLotteryId(sysarg,config)
		SendLaborActivityData(sysarg)
	elseif nLotteryType == 1 then
		
		if Item.getBagEmptyGridCount(sysarg) < 1 then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.dm010,ttFlyTip)
			return false
		end
			
		if not isFree then	
			if Actor.getMoneyCount(sysarg,config.needType) < config.needYuanBao then
				Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf373,config.needYuanBao),ttFlyTip)
				return false
			end	
		end
		
		if not var.LaborLotteryId then
			return false
		elseif not var.LaborLotteryId[1] then
			return false
		end
		
		local nGroup = var.LaborLotteryId[1]
		
		if not var.LaborLotteryId[2] then
			local nId = RandomLotteryId(config.Items[nGroup])
			if nId <= 0 then
				print("Random LaborLottery error ")
				return false
			end
			var.LaborLotteryId[2] = nId
		end

		local netPack = DataPack.allocPacket(sysarg, 139,143)
		DataPack.writeByte(netPack, var.LaborLotteryId[1])
		DataPack.writeByte(netPack, var.LaborLotteryId[2])
		DataPack.writeInt(netPack, var.LaborLotteryNum)
		DataPack.flush(netPack)
		
	elseif nLotteryType == 2 then
	
		if not var.LaborLotteryId then
			return false
		elseif not var.LaborLotteryId[1] or not var.LaborLotteryId[2] then
			return false
		end
		
		local nGroup = var.LaborLotteryId[1]
		local nId = var.LaborLotteryId[2]

		local nAward = config.Items[nGroup][nId]
		if not nAward then
			print("Lottery Award config is nil")
		end
		
		local needCount = Item.getAddItemNeedGridCount(sysarg,nAward.id,nAward.count)
		if isFree then
			needCount = Item.getAddItemNeedGridCount(sysarg,nAward.id,nAward.count*2)
		end
		
		local hasCount = Item.getBagEmptyGridCount(sysarg)
		if needCount > hasCount then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.dm010,ttFlyTip)
			return false
		end
		
		if isFree then
			Actor.giveAward(sysarg,nAward.type,nAward.id,nAward.count*2,nAward.quality,nAward.strong,nAward.bind,0,1083,"Labor LuckyDraw Success")
			var.LaborLotteryNum = 0
			System.sendCommonLog(1084,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),4,2)
		else
			if not Actor.changeMoney(sysarg,config.needType,-config.needYuanBao,GameLog.cLobarLottery,"51Labor Activity LuckyDraw Consume",true) then
				return false
			end	
			Actor.giveAward(sysarg,nAward.type,nAward.id,nAward.count,nAward.quality,nAward.strong,nAward.bind,0,1083,"Labor LuckyDraw Success")
			var.LaborLotteryNum = var.LaborLotteryNum + 1
			System.sendCommonLog(1084,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),4,1)
		end
		
		System.broadcastTipmsg(string.format(Lang.ScriptTips.zf371,Actor.getName(sysarg),Item.getItemName(nAward.id)),2048)
		
		var.LaborLotteryId = nil
		InitLaborLotteryId(sysarg,config)
	end
	
	return true
end


function InitLaborLotteryId(sysarg,config)
	
	local var = Actor.getStaticVar(sysarg)
	if not var.LaborLotteryId then
		local nLotteryId = math.random(#config.Items)
		var.LaborLotteryId = {}
		var.LaborLotteryId[1] = nLotteryId
	end
	
	local netPack = DataPack.allocPacket(sysarg, 139,143)
	DataPack.writeByte(netPack, var.LaborLotteryId[1])
	DataPack.writeByte(netPack, 0)
	DataPack.writeInt(netPack, var.LaborLotteryNum)
	DataPack.flush(netPack)
end

function SendLaborActivityData(sysarg)

	local var = Actor.getStaticVar(sysarg)
	
	local netPack = DataPack.allocPacket(sysarg, 139, 144)
	if not netPack then return end
	
	local config = LaborActivityCfg
	if not config then return end

	if not var.LaborLoginDayFlag then
		var.LaborLoginDayFlag = {}
	end

	if not var.LaborLoginDay then
		var.LaborLoginDay = 0
	end
	local nLoginDays = var.LaborLoginDay
	
	local nCount = #config.LoginGift.award
	DataPack.writeByte(netPack,nCount)
	for i = 1,nCount do
		if var.LaborLoginDayFlag[i] then
			DataPack.writeByte(netPack,2)
		else
			if nLoginDays >= i then
				DataPack.writeByte(netPack,1)
			else
				DataPack.writeByte(netPack,0)
			end
		end
	end

-------------------------------------单笔充值
	if not var.LobarSinglePayFlag then
		var.LobarSinglePayFlag = {}
	end
	
	if not var.LaborSinglePayValue then
		var.LaborSinglePayValue = 0
	end
	local value1 = var.LaborSinglePayValue
	
	nCount = #config.SinglePay
	local nGiveId = 0
	for i = 1,nCount do
		if var.LobarSinglePayFlag[i] then
			nGiveId = i
			break
		end
	end
	
	DataPack.writeByte(netPack,nCount)
	if nGiveId > 0 then
		for i = 1,nCount do
			if i == nGiveId then
				DataPack.writeByte(netPack,2)
			else
				DataPack.writeByte(netPack,0)
			end
		end
	else
		local nId = 0
		for i = 1,nCount do
			if i == nCount then
				if value1 >= config.SinglePay[i].needPay then
					nId = i
					break
				end
			elseif value1 >= config.SinglePay[i].needPay and value1 < config.SinglePay[i+1].needPay then
				nId = i
				break
			end
		end
		
		for id, PayData in ipairs(config.SinglePay) do
			if nId > 0 and id == nId then
				DataPack.writeByte(netPack,1)
			else
				DataPack.writeByte(netPack,0)
			end
		end
	end

------------------------------累积充值
	if not var.LaborCumulativePayFlag then
		var.LaborCumulativePayFlag = {}
	end
	
	if not var.LaborCumulativePayValue then
		var.LaborCumulativePayValue = 0
	end
	
	local nCumulativePay = var.LaborCumulativePayFlag
	local value2 = var.LaborCumulativePayValue
	
	nCount = #config.CumulativePay
	DataPack.writeByte(netPack,nCount)
	for id, PayData in ipairs(config.CumulativePay) do
		if nCumulativePay[id] then
			DataPack.writeByte(netPack,2)
	
		else
			if value2 >= PayData.needPay then
				DataPack.writeByte(netPack,1)
			else
				DataPack.writeByte(netPack,0)
			end
		end
	end

	DataPack.writeByte(netPack,nLoginDays)
	DataPack.writeInt(netPack,value1)
	DataPack.writeInt(netPack,value2)
	DataPack.flush(netPack)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetLaborInfo, MiscsImplement.OnLaborActivity)