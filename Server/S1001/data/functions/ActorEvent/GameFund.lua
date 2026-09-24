--#include "data\config\item\GameFundCfg.lua"
--#include "data\functions\Activity\Common\Awards.lua" once

local function FundFlag(sysarg)
	
	local npack = DataPack.allocPacket(sysarg,139,113) 
	
	local var = Actor.getStaticVar(sysarg)
	
	if not var.getFundGift then
		var.getFundGift = {}
	end

	if not var.buyFundTime then
		var.buyFundTime = {}
	end
	
	if not var.buyFund then
		var.buyFund = {}
	end

	local nYear,nMonth,nDay = System.getDate(0,0,0);
	local nIntervalDay = 0
	for i = 1,#GameFund do
		
		if not var.buyFundTime[i] then
			var.buyFundTime[i] = {}
		end
		if not var.getFundGift[i] then
			var.getFundGift[i] = {}
		end	
		
		DataPack.writeByte(npack,i)
		if not var.buyFund[i] then
			DataPack.writeByte(npack,0)
		else
			DataPack.writeByte(npack,1)
		end
		DataPack.writeByte(npack,#GameFund[i].GiftItem)
		for j =1,#GameFund[i].GiftItem do
			if var.buyFund[i] then
				if not var.getFundGift[i][j] then
					nIntervalDay = System.getTimeDay(var.buyFundTime[i][1],var.buyFundTime[i][2],var.buyFundTime[i][3],nYear,nMonth,nDay)
					if nIntervalDay+1 >= j then	
						DataPack.writeByte(npack,1)
					else
						DataPack.writeByte(npack,0)
					end
				else
					DataPack.writeByte(npack,2)
				end
			else
				DataPack.writeByte(npack,0)
			end
		end
	end
	
	DataPack.flush(npack)
	return true
end

MiscsImplement.handleGetFund = function(sysarg, msgid, packet)
	
	if not packet or not GameFund then return false end

	local FundName = 
	{
		"升级基金",
		"寻宝基金",
		"翅膀基金",
		"坐骑基金",
		"法宝基金",
		"通灵基金",
		"勋章基金",
		"功德基金",
		"护符基金",
		"神器基金",
		"时装基金"
	}
	local ChooseType = DataPack.readByte(packet)   --1:领取资金  2：购买资金
	local FundType = DataPack.readByte(packet)		--哪个资金类型
	local Day = DataPack.readByte(packet)		--领取哪一天的资金   购买则是0
	
	if not GameFund[FundType] then return end
	local config = GameFund[FundType]
	local var = Actor.getStaticVar(sysarg)
	
	--记录是否领过
	if not var.getFundGift then
		var.getFundGift = {}
	end
	if not var.getFundGift[FundType] then
		var.getFundGift[FundType] = {}
	end	

	--记录购买哪钟类型的基金
	if not var.buyFund then
			var.buyFund = {}
	end	
	
	--记录购买的时间
	if not var.buyFundTime then
		var.buyFundTime = {}
		if not var.buyFundTime[FundType] then
			var.buyFundTime[FundType] = {}
		end
	end

	if ChooseType == 1 then		
		--已领过
		if var.getFundGift[FundType][Day] then
			return
		end

		if not var.buyFund[FundType] then
			print("actor not buy this fund")
			return
		end
	
		--已领完
		if var.buyFund[FundType] and var.buyFund[FundType] <= 0 then
			return
		end
	
		local IsGive = false
		--判断时间，可能隔了几天没上，连续领取几个
		local nYear,nMonth,nDay = System.getDate(0,0,0);
		local nIntervalDay = System.getTimeDay(var.buyFundTime[FundType][1],var.buyFundTime[FundType][2],var.buyFundTime[FundType][3],nYear,nMonth,nDay)
		
		if nIntervalDay+1 >= Day then
			IsGive = true
		else
			return false
		end
		
		local nGiftCfg = config.GiftItem[Day]
		
		if nGiftCfg.type == 0 then
			local needCount = Item.getAddItemNeedGridCount(sysarg,nGiftCfg.id,nGiftCfg.count)
			local hasCount = Item.getBagEmptyGridCount(sysarg)
			if needCount > hasCount then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.dm010,ttFlyTip)
				return false
			end
		end

		if IsGive then
			if Actor.giveAward(sysarg,nGiftCfg.type,nGiftCfg.id,nGiftCfg.count,nGiftCfg.quality,nGiftCfg.strong,nGiftCfg.bind) then
				var.buyFund[FundType] = var.buyFund[FundType] - 1
				var.getFundGift[FundType][Day] = 1
				
				--检测到8个礼包已经全部领取，清空数据
				if var.buyFund[FundType] <= 0 then
					var.buyFund[FundType] = nil
					var.getFundGift[FundType] = {}
					var.buyFundTime[FundType] = {}
				end
				
				local str = string.format(Lang.ScriptTips.zf605,Actor.getName(sysarg),FundName[FundType],Day,Item.getItemLinkMsg(nGiftCfg.id),nGiftCfg.count)
				System.broadcastTipmsg(str, ttScreenCenter)
				str = string.format(Lang.ScriptTips.zf608,Actor.getName(sysarg),FundName[FundType],Day,Item.getItemLinkMsg(nGiftCfg.id),nGiftCfg.count)
				System.broadcastTipmsg(str, ttChatWindow)
			else
				print("Get FundGift error, the actor name is"..Actor.getName(sysarg)..",Get FundType is"..FundName[FundType])
			end
		end	

	elseif ChooseType == 2 then
		
		if not var.buyFund then
			var.buyFund = {}
		end

		--已购买
		if var.buyFund[FundType] then
			if var.buyFund[FundType] > 0 then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf609,ttFlyTip)
				return
			end
			
			for i = 1,#GameFund do
				if var.getFundGift[FundType][i] and var.buyFund[FundType] > 0 then
					Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf612,ttFlyTip)
					return
				end
			end
		end

		--检查消耗
		local expendData = {}
		local isok = CheckOneConsume(sysarg, false, config.consumes, true, expendData)				
		if not isok then
			return true
		end

		--扣除消耗
		isok = DeductOneConsume(sysarg, false, config.consumes, GameLog.cNewFundConsume)	
		if not isok then
			return true
		end
		
		var.buyFund[FundType] = 8
		var.getFundGift[FundType] = {}
		
		--购买后记录购买时间
		local nYear,nMonth,nDay = System.getDate(0,0,0);
		var.buyFundTime[FundType][1] = nYear
		var.buyFundTime[FundType][2] = nMonth
		var.buyFundTime[FundType][3] = nDay
		
		local str = string.format(Lang.ScriptTips.zf604,Actor.getName(sysarg),FundName[FundType])
		System.broadcastTipmsg(str, ttChatWindow)
		str = string.format(Lang.ScriptTips.zf607,Actor.getName(sysarg),FundName[FundType])
		System.broadcastTipmsg(str, ttScreenCenter)
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf606,FundName[FundType]),ttFlyTip)
	end
	
	return FundFlag(sysarg)
end

MiscsImplement.handleGetFundFlag = function(sysarg, msgid, packet)
	return FundFlag(sysarg)
end

--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetFundFlag, MiscsImplement.handleGetFundFlag)
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetFund, MiscsImplement.handleGetFund)