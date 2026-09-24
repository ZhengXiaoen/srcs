--#include "data\config\misc\PreferentialGoods.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once

local GiftName = 
{	
	"王者大礼包",
	"急速大礼包",
	"财神大礼包",
	"限时大礼包",
	"限时大礼包",
}

--领特惠礼包
MiscsImplement.ReceivePreferentialGoods = function( sysarg, msgid, packet )
	
	local nGiftType = DataPack.readByte(packet)
	if nGiftType == 0 then
		SendUpdatePacksInfo(sysarg)
	elseif nGiftType == 1 then
		GetPreferentialGift(sysarg,packet)
	elseif nGiftType == 2 then
		--GetWholePeople(sysarg,packet)
	elseif nGiftType == 3 then
		--GetOpenServerLottery(sysarg,packet)
	elseif nGiftType == 4 then
		GetTimelimitGift(sysarg,packet)
	elseif nGiftType == 5 then
		GetTimelimitBoss(sysarg,packet)
	--竞技礼包
	elseif nGiftType == 6 then 
		GetAthleticsGift(sysarg,packet)
	end
end

--购买竞技礼包
function GetAthleticsGift(sysarg,packet)
	local goodsIndex = DataPack.readByte(packet);
	local config = PreferentialGift.AthleticsGift[goodsIndex]
		if config == nil  then
			print("config null")
		return 
	end
	local var = Actor.getStaticVar(sysarg);
	if not var.AthleticsGiftGoods then	
		var.AthleticsGiftGoods = {}
	end
	if var.AthleticsGiftGoods[goodsIndex] and var.AthleticsGiftGoods[goodsIndex] > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf597,ttFlyTip)
		return 
	end 
	local nJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
	local nSex = Actor.getIntProperty( sysarg, PROP_ACTOR_SEX ) 
	local AwardTable = {}
	for k,v in ipairs(config.award) do
		table.insert(AwardTable,v)
	end
     
	if not Awards.CheckBagGridCount(sysarg, AwardTable) then
		return
	end

	--扣除消耗
	local logid = 2132
	if goodsIndex == 1 then
		logid = 2132
	elseif goodsIndex == 2 then
		logid = 2133
	else
		logid = 2134
	end
	if not Actor.changeMoney( sysarg, mtYuanbao, -config.needYuanBao, logid, Lang.LogTips.yb047) then
			Actor.sendTipmsg(sysarg,string.format(Lang.Activity.t00174, config.needYuanBao), ttFlyTip);
			return
	end
	--奖品一个物品给玩家
	
	Awards.Give(sysarg, AwardTable, GameLog.clAthleticsGift, "购买竞技礼包")
	--这里写死送绑金、能量等 因为前端说不好显示图标图片
	if config.tips then
		System.broadcastTipmsg(string.format(config.tips,Actor.getName(sysarg)),128+2+2048)
	end
	var.AthleticsGiftGoods[goodsIndex] = 1
	
	SendUpdatePacksInfo(sysarg)
	-- 记录日志
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	System.sendCommonLog(GameLog.cOpenServer,nActorId,'',1,goodsIndex,0,'','','','','','','',"GetAthleticsGift")
end



function GetPreferentialGift(sysarg,packet)
	
	local nOpenDays = System.getDaysSinceOpenServer()
	if nOpenDays > 7 then
		return
	end
	
	local goodsIndex = DataPack.readByte(packet)
	
	local config = PreferentialGift.SpecialOffer[goodsIndex]
	if config == nil or config.is_delete == true then
		return 
	end
	
	local var = Actor.getStaticVar(sysarg);
	
	if not var.PreferentialGoods then	--获得特惠礼包记录
		var.PreferentialGoods = {}
	end
	
	var.PreferentialGoods[5]=1
	
	--if not var.goodsIndexhasBought then
	--	var.goodsIndexhasBought=5
	--end
	
	--已经买过，无法购买
	if var.PreferentialGoods[goodsIndex] and var.PreferentialGoods[goodsIndex] > 0 + config.expandTime  then
	--if var.goodsIndexhasBought>=goodsIndex then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf597,ttFlyTip)
		return 
	end 

	--[[
	if goodsIndex == 4 or goodsIndex == 5 then
		if not var.nYuanBao_timedGift or var.nYuanBao_timedGift < config.RechargeYB then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf645,GiftName[goodsIndex],config.RechargeYB),ttFlyTip)
			return
		end
	end
	--]]
	
	--按顺序购买
	--if(var.PreferentialGoods[goodsIndex-1]~=1)then
	--if goodsIndex~=var.goodsIndexhasBought+1 then
		--Actor.sendTipmsg(sysarg,"请按顺序购买",ttFlyTip)
		--return
	--end
		

	local nJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
	local nSex = Actor.getIntProperty( sysarg, PROP_ACTOR_SEX ) 
	local AwardTable = {}
	
	local award = config.award
	local open_money = config.open_money
	local tips = config.tips
	if var.PreferentialGoods[goodsIndex] and var.PreferentialGoods[goodsIndex] >=1 then 
		award = config.expandAwards[var.PreferentialGoods[goodsIndex]].award --购买扩展的第几次奖励
		open_money = config.expandAwards[var.PreferentialGoods[goodsIndex]].open_money
		tips = config.expandAwards[var.PreferentialGoods[goodsIndex]].tips
	end
	
	for k,v in ipairs(award) do
		if (not v.sex or v.sex == -1 or v.sex == nSex) and (not v.job or v.job == 0 or v.job == nJob) then
			table.insert(AwardTable,v)
		end
	end
     
	if not Awards.CheckBagGridCount(sysarg, AwardTable) then
		return
	end

	--检查消耗
	local consumeData = {}
	local isok = CheckOneConsume(sysarg, false, open_money, true, consumeData)
	if isok == false then return end
	--扣除消耗
	isok = DeductOneConsume(sysarg, false, open_money, GameLog.cNewGetPreferentialGiftConsume,"特惠礼包"..(goodsIndex-5))	
	if isok == false then return end
	
	--奖品一个物品给玩家
	
	Awards.Give(sysarg, AwardTable, GameLog.clPreferentialGoods, "领取特惠礼包")
	--这里写死送绑金、能量等 因为前端说不好显示图标图片
	if tips then
		System.broadcastTipmsg(string.format(tips.."<我要领取/@@showWin,99>",Actor.getName(sysarg)),128+2+2048)
	end
	if var.PreferentialGoods[goodsIndex] ==nil then 
		var.PreferentialGoods[goodsIndex] = 1
	else 
		var.PreferentialGoods[goodsIndex] = var.PreferentialGoods[goodsIndex] + 1
	end
	--var.goodsIndexhasBought=var.goodsIndexhasBought+1
	
	SendUpdatePacksInfo(sysarg)
	-- 记录日志
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	System.sendCommonLog(GameLog.cOpenServer,nActorId,'',1,goodsIndex,0,'','','','','','','',"GetPreferentialGift")
	
	--关联特惠礼包
	local guanLianId = {{605 ,606, 607, 608, },{617, 618 ,619 ,620},{4735, 4736 ,4737 ,4738, 4739 },}  --羽毛，特戒，金币宝箱
	local i = 0
	if goodsIndex == 7 or goodsIndex ==9 or goodsIndex ==10 then 
		if goodsIndex == 7 then 
			i=1
		elseif goodsIndex ==9 then 
			i=3
		elseif goodsIndex ==10 then 
			i=2
		end
		
		--需要删除的宝箱
		local removeItemId = guanLianId[i][var.PreferentialGoods[goodsIndex]]
		--需要增加的宝箱
		local addItemId = removeItemId+1
		
		if Actor.removeItem(sysarg,removeItemId,1) == 1 then --删除成功
			if var.PreferentialGoods[goodsIndex] <= config.expandTime then --不是最后一个
				Actor.addItem(sysarg,addItemId,0,0,1,1,0,"onTeHuiLiBaoAdd");  --增加一个宝箱
			end
		end
	end
	
end

function GetWholePeople(sysarg,packet)
	
	local nOpenDays = System.getDaysSinceOpenServer()
	if nOpenDays > 7 then
		return
	end
	
	local nIndex = DataPack.readByte(packet)
	local config = PreferentialGift.WholePeople[nIndex]
	if not config then return end

	local var = Actor.getStaticVar(sysarg)
	local sVar = System.getStaticVar()
	
	if not var.days.BetaWholePeople then
		var.days.BetaWholePeople = {}
	end

	if not var.days.PeyNum and nIndex == 1 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf333,ttFlyTip)
		return
	end
	
	if var.days.BetaWholePeople[nIndex] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf616,ttFlyTip)
		return
	end
	
	if not Actor.checkActorLevel(sysarg,config.needLevel) then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf335,config.needLevel),ttFlyTip)
		return
	end

	if not sVar.BetaWholePeople then
		sVar.BetaWholePeople = 0
	end

	if sVar.BetaWholePeople < config.needPeople[nOpenDays] then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf337,config.needPeople[nOpenDays]),ttFlyTip)
		return
	end

	if not Awards.CheckBagGridCount(sysarg, config.award[nOpenDays]) then
		return
	end

	if config.needMoney > 0 then
		if nIndex == 1 then
			if var.days.PeyNum < config.needMoney then
				Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf334,config.needMoney),ttFlyTip)
				return
			end
		else
			if not Actor.changeMoney(sysarg,3,-config.needMoney,GameLog.cDoubleEggActivity,"双蛋全民奖励") then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf613,ttFlyTip)
				return
			end			
		end		
	end

	Awards.Give(sysarg, config.award[nOpenDays], 1025, "公测全民奖励")
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf617,ttFlyTip)
	var.days.BetaWholePeople[nIndex] = 1

	if nIndex == 1 then
		sVar.BetaWholePeople = sVar.BetaWholePeople + 1
	end
	
	SendUpdatePacksInfo(sysarg)
end

function CheckBagCount(sysarg,itemId,count)

	local needCount = Item.getAddItemNeedGridCount(sysarg,itemId,count)
	local hasCount = Item.getBagEmptyGridCount(sysarg)
	if needCount > hasCount then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.dm010,ttFlyTip)
		return false
	end
	return true
end

function RandomLotteryId(AwardItems)
	
	if not AwardItems then return 0 end
	
	local nAllPersent = 0	
	for _,item in ipairs(AwardItems) do
		nAllPersent = nAllPersent + item.nPersent
	end
	if nAllPersent <= 0 then return 0 end
		
	local nRandomScore = math.random(nAllPersent)
	local nCurPersent = 0
	local nId = 0

	for id,item in ipairs(AwardItems) do
		nCurPersent = nCurPersent + item.nPersent
		if nRandomScore <= nCurPersent then
			return id
		end
	end
	
	return 0
end

function GetOpenServerLottery(sysarg, packet)

	local nOpenDays = System.getDaysSinceOpenServer()
	if nOpenDays > 7 then
		return
	end

	local nLotteryType = DataPack.readByte(packet)
	local nIndex = DataPack.readByte(packet)

	local config1 = PreferentialGift.SmallLottery
	local config2 = PreferentialGift.BigLottery
	if not config1 or not config2 then return end

	local var = Actor.getStaticVar(sysarg)
	if not var.OpenServerLotteryScore then
		var.OpenServerLotteryScore = 0
	end
	
	local config
	if nIndex == 1 then
		config = config1
	elseif nIndex == 2 then
		config = config2
	end
	if not config and nLotteryType > 1 then return end

	if nLotteryType == 1 then
		SendUpdatePacksInfo(sysarg)
		
	elseif nLotteryType == 2 then
		
		if var.OpenServerLotteryScore < config.needScore then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf322,ttFlyTip)
			return
		end
		
		local nGroup
		if nIndex == 1 then
			if not var.OpenServerSmallLotteryId or not var.OpenServerSmallLotteryId[1] then
				return				
			end
			nGroup = var.OpenServerSmallLotteryId[1]
		elseif nIndex == 2 then
			if not var.OpenServerBigLotteryId or not var.OpenServerBigLotteryId[1] then
				return				
			end
			nGroup = var.OpenServerBigLotteryId[1]
		end
	
		local nId = RandomLotteryId(config.items[nGroup])
		if nId <= 0 then
			return
		end
					
		if nIndex == 1 and not var.OpenServerSmallLotteryId[2] then
			var.OpenServerSmallLotteryId[2] = nId
		elseif nIndex == 2 and not var.OpenServerBigLotteryId[2] then
			var.OpenServerBigLotteryId[2] = nId
		end
		
		SendUpdatePacksInfo(sysarg)

	elseif nLotteryType == 3 then
		
		local nGroup
		local nId
		if nIndex == 1 then
			if not var.OpenServerSmallLotteryId then
				return
			elseif not var.OpenServerSmallLotteryId[1] or not var.OpenServerSmallLotteryId[2] then
				return
			end
			nGroup = var.OpenServerSmallLotteryId[1]
			nId    = var.OpenServerSmallLotteryId[2]
		elseif nIndex == 2 then
			if not var.OpenServerBigLotteryId then
				return
			elseif not var.OpenServerBigLotteryId[1] or not var.OpenServerBigLotteryId[2] then
				return
			end
			nGroup = var.OpenServerBigLotteryId[1]
			nId    = var.OpenServerBigLotteryId[2]
		end
		
		local nAward = config.items[nGroup][nId]
		
		if not CheckBagCount(sysarg,nAward.id,nAward.count) then
			return
		end
		
		Actor.giveAward(sysarg,nAward.type,nAward.id,nAward.count,nAward.quality,nAward.strong,nAward.bind,0,817,"双蛋活动抽奖")
		System.broadcastTipmsg(string.format(Lang.ScriptTips.zf338,Actor.getName(sysarg),Item.getItemName(nAward.id)),2048)
		
		var.OpenServerLotteryScore = var.OpenServerLotteryScore - config.needScore
		if nIndex == 1 then
			var.OpenServerSmallLotteryId = nil
		elseif nIndex == 2 then
			var.OpenServerBigLotteryId = nil
		end
		SendUpdatePacksInfo(sysarg)
	end
end

function InitOpenServerLotteryGroup(sysarg,config1,config2)
	
	local var = Actor.getStaticVar(sysarg)
	if not var.OpenServerSmallLotteryId then
		local nLotteryId = math.random(#config1.items)
		var.OpenServerSmallLotteryId = {}
		var.OpenServerSmallLotteryId[1] = nLotteryId
	end
	if not var.OpenServerBigLotteryId then
		local nLotteryId = math.random(#config2.items)
		var.OpenServerBigLotteryId = {}
		var.OpenServerBigLotteryId[1] = nLotteryId
	end
	if not var.OpenServerLotteryScore then
		var.OpenServerLotteryScore = 0
	end
end

function GetTimelimitGift(sysarg,packet)
	
	local config = PreferentialGift.TimelimitGift
	if not config then return end
		
	local var = Actor.getStaticVar(sysarg)
	if var.TimelimitGift then
		return
	end
	
	if not var.nYuanBao_timedGift then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf357,config.needPayMoney),ttFlyTip)
		return
	elseif var.nYuanBao_timedGift < config.needPayMoney then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf357,config.needPayMoney),ttFlyTip)
		return
	end
		
	if not Awards.CheckBagGridCount(sysarg, config.award[1]) then
		return
	end
	
	--奖品一个物品给玩家
	Awards.Give(sysarg, config.award[1], 208, "购买开服限时礼包")
	var.TimelimitGift = 1
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf321,ttFlyTip)
	
	SendUpdatePacksInfo(sysarg)
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	System.sendCommonLog(1096,nActorId,'',2,2,0,'','','','','','','',"GetTimelimitGift")
end

function GetTimelimitBoss(sysarg,packet)
	
	local bossIndex = DataPack.readByte(packet)
	
	local config = PreferentialGift.TimelimitBoss[bossIndex]
	if not config then return end
		
	local var = Actor.getStaticVar(sysarg)
	if not var.TimelimitBossGift then
		var.TimelimitBossGift = {}
	elseif var.TimelimitBossGift[bossIndex] then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf346,ttFlyTip)
		return
	end

	if not var.TimelimitKillBoss then
		return
	end
		
	local nMaxBoss = #config.BossId
	local nIndex = nMaxBoss*bossIndex-nMaxBoss
	for i = nIndex+1,nMaxBoss*bossIndex do
		if not var.TimelimitKillBoss[i] then
			return
		end
	end
	
	if not Awards.CheckBagGridCount(sysarg, config.award) then
		return
	end
	
	--奖品一个物品给玩家
	Awards.Give(sysarg, config.award, 208, "开服限时击杀Boss礼包")
	var.TimelimitBossGift[bossIndex] = 1
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf358,ttFlyTip)
	
	SendUpdatePacksInfo(sysarg)
end

--更新特惠礼包面板数据
function SendUpdatePacksInfo(sysarg)
    if System.isCrossServer() == true then return end
	if not PayMoneyAwardCfg or not PreferentialGift then return end
	local config1 = PreferentialGift.SmallLottery
	local config2 = PreferentialGift.BigLottery
	if not config1 or not config2 then return end
	
	local nCountTb = {}
	for id, nConfig in ipairs(PreferentialGift.SpecialOffer) do
		if not nConfig.is_delete then
			table.insert(nCountTb,nConfig.id)
		end
	end

	local var = Actor.getStaticVar(sysarg)
	local sVar = System.getStaticVar()	
	
	if not var.PreferentialGoods then
		var.PreferentialGoods = {}
	end
	--if not var.goodsIndexhasBought then
		--var.goodsIndexhasBought=5
	--end
	
	if not var.AthleticsGiftGoods then 
		var.AthleticsGiftGoods = {}
	end
	if not var.AddPayAwardFlag then
		var.AddPayAwardFlag = {}
	end
	
	if not var.days.BetaWholePeople then
		var.days.BetaWholePeople = {}
	end	

	local netPack = DataPack.allocPacket(sysarg, 139, 121)
	if not netPack then return end
	
	DataPack.writeByte(netPack,#nCountTb)
	for _,index in ipairs(nCountTb) do
		DataPack.writeByte(netPack,index)
		if var.PreferentialGoods[index] then
		--if var.goodsIndexhasBought>=index then
			DataPack.writeByte(netPack,var.PreferentialGoods[index])
		else
			DataPack.writeByte(netPack,0)
		end
	end
	
	DataPack.writeByte(netPack,#PayMoneyAwardCfg)
	for _,index in ipairs(PayMoneyAwardCfg) do
		DataPack.writeByte(netPack,index.id)
		if var.AddPayAwardFlag[index.id] then
			DataPack.writeByte(netPack,1)
		else
			DataPack.writeByte(netPack,0)
		end
	end

	InitOpenServerLotteryGroup(sysarg,config1,config2)
	local nSmallGroup = var.OpenServerSmallLotteryId[1]
	local nSmallId = var.OpenServerSmallLotteryId[2] or 0
	local nSmallTimes = var.OpenServerLotteryScore/config1.needScore
	
	local nBigGroup = var.OpenServerBigLotteryId[1]
	local nBigId = var.OpenServerBigLotteryId[2] or 0
	local nBigTimes = var.OpenServerLotteryScore/config2.needScore
	
	DataPack.writeByte(netPack,nSmallGroup)
	DataPack.writeByte(netPack, nSmallId)
	DataPack.writeInt(netPack, nSmallTimes)
	DataPack.writeByte(netPack, nBigGroup)
	DataPack.writeByte(netPack, nBigId)
	DataPack.writeInt(netPack, nBigTimes)

	--限时累积礼包
	DataPack.writeInt(netPack, var.nYuanBao_timedGift)
	if var.TimelimitGift then
		DataPack.writeByte(netPack, 2)
	else
		if not var.nYuanBao_timedGift then
			DataPack.writeByte(netPack, 0)
		elseif var.nYuanBao_timedGift >= PreferentialGift.TimelimitGift.needPayMoney then
			DataPack.writeByte(netPack, 1)
		else
			DataPack.writeByte(netPack, 0)
		end
	end
	

	--开服限时击杀BOSS标记
	local BossList = PreferentialGift.TimelimitBoss
	DataPack.writeByte(netPack, #BossList*#BossList[1].BossId)
	local TimelimitKillBoss = var.TimelimitKillBoss
	
	local nId = 0
	local nIsGiveGift = true 
	local nBossResult = {}
	for _,BossInfo in ipairs(BossList) do
		for _,BossId in ipairs(BossInfo.BossId) do
			nId = nId + 1
			if not TimelimitKillBoss then
				DataPack.writeByte(netPack, 0)
				nIsGiveGift = false
			else
				if not TimelimitKillBoss[nId] then
					DataPack.writeByte(netPack, 0)
					nIsGiveGift = false
				else
					DataPack.writeByte(netPack, 1)
				end
			end
		end
		table.insert(nBossResult,nIsGiveGift)
	end

	--开服限时击杀BOSS礼包标识
	DataPack.writeByte(netPack, #BossList)
	if not var.TimelimitBossGift then
		var.TimelimitBossGift = {}
	end
	
	local TimelimitBossGift = var.TimelimitBossGift
	for i = 1,#BossList do
		if TimelimitBossGift[i] then
			DataPack.writeByte(netPack, 2)
		else
			if nBossResult[i] then
				DataPack.writeByte(netPack, 1)
			else
				DataPack.writeByte(netPack, 0)
			end
		end
	end
	--竞技礼包
	local nCount = #PreferentialGift.AthleticsGift
	DataPack.writeByte(netPack,nCount)
	for i = 1 ,nCount  do
		--DataPack.writeByte(netPack,i)
		if var.AthleticsGiftGoods[i] then
			DataPack.writeByte(netPack,1)
		else
			DataPack.writeByte(netPack,0)
		end	

	end
	DataPack.flush(netPack)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cReceivePreferentialGoods, MiscsImplement.ReceivePreferentialGoods)