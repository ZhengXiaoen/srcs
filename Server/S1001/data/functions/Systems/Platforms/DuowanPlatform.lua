-- 多玩平台

--#include "data\config\item\YYVipReward.lua"

DuowanCmds = {
	--客户端消息
	cData = 0, 			-- 返回数据
	cYYGift = 1,		--领取YY每日奖励或者购买YY商店
	cYYGiftFlag = 2,	--请求YY领取标识
	
	--服务器下发
	sData = 0, 			-- 请求数据
	sGetData = 1, 	-- 下发数据
	sSendGiftFlag = 2, --下发YY领取标识
}


function RequestDuowanData(sysarg)
	--print("---------------RequestDuowanData()")
	local netPack = AllocPlatformPacket(sysarg, PlatformIDs._duowan, DuowanCmds.sData)
	DataPack.flush(netPack)
end

function DuowanDataHandle(sysarg, platformId, msgid, packet)
--[[
	local str_data = DataPack.readString(packet)
	local ret = Actor.parsePlatformVipInfo(sysarg, str_data, -1)	
	if ret ~= 0 then
		print("---------------Actor.parsePlatformVipInfo() error return value="..ret)
		return
	end
	
	local vip_level = Actor.getPlatformVipLevel(sysarg)
	if vip_level < 0 then -- 不是 vip
		--print("---------------not duowan vip")
		return
	end
	

	local nTopTitle = Actor.getIntProperty(sysarg,PROP_ACTOR_HEAD_TITLE)
	if nTopTitle == 0 and vip_level > 0 then
		Actor.setTopTitle(sysarg,31,true)
		local dVar = Actor.getDyanmicVar(sysarg)
		if not dVar.SpidTitle then
			dVar.SpidTitle = 1
		end
	end

	
	local vip_type = Actor.getPlatformVipType(sysarg)
	
	-- vip_type: 0 月费  1 年费 2 季费
	--print("---------------duowan vip level=" .. vip_level .. ",type=" .. vip_type)
	
	local netPack = AllocPlatformPacket(sysarg, PlatformIDs._duowan, DuowanCmds.sGetData)
	DataPack.writeInt(netPack, vip_level)
	DataPack.writeByte(netPack, vip_type)
	
	DataPack.flush(netPack)
--]]
end

function DuowanGetEveryDayGift(sysarg)
	
	local config = YYVipReward.DailyReward
	if not config then return false end
	--获取玩家YY等级
	local nYYlevel = Actor.getPlatformVipLevel(sysarg)
	
	--如果不是YY会员
	if nYYlevel < 0 then
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	if not var.days.YYGiftFlag then
		var.days.YYGiftFlag = 0
	end
	
	if var.days.YYGiftFlag > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf620,ttFlyTip)
		return false
	end

	--获取玩家季度或者年度
	local vip_type = Actor.getPlatformVipType(sysarg)
	local nConfigId = 0
	
	if vip_type == 0 then
		if not Awards.CheckBagGridCount(sysarg, config[nYYlevel].rewards) then
			return false
		end	
	elseif vip_type == 1 or vip_type == 2 then
		local bResult, BagCount = Awards.CheckBagGridCount(sysarg, config[nYYlevel].rewards,1)
		if vip_type == 1 then 
			nConfigId = 9
		else
			nConfigId = 8
		end
		local bMonthResult, BagYearCount = Awards.CheckBagGridCount(sysarg, config[nConfigId].rewards,1)
		local nNeedCount = BagCount + BagYearCount
		
		local bagCount = Item.getBagEmptyGridCount(sysarg)
		
		if nNeedCount > bagCount then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mt00001, nNeedCount-bagCount), ttFlyTip)
			return false
		end
	end
	
	Awards.Give(sysarg, config[nYYlevel].rewards, 208, "YY会员每天领取物品")
	if vip_type == 2 then
		Awards.Give(sysarg, config[nConfigId].rewards, 208, "YY会员额外领取季费物品")
	elseif vip_type == 1 then
		Awards.Give(sysarg, config[nConfigId].rewards, 208, "YY会员额外领取年费物品")
	end
	
	var.days.YYGiftFlag = 1

	local netPack =  AllocPlatformPacket(sysarg, PlatformIDs._duowan, DuowanCmds.sSendGiftFlag)
	DataPack.writeByte(netPack, var.days.YYGiftFlag)
	DataPack.flush(netPack)
	
	return true
end


function DuowanGetYYVipShop(sysarg,nBuyItemId,nBuyItemNum)
	
	local config = YYVipReward.YYVipStore
	if not config then return false end

	--获取玩家YYVip等级
	local nYYlevel = Actor.getPlatformVipLevel(sysarg)
	
	--如果不是YY会员
	if nYYlevel <= 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf619,ttFlyTip)  
		return false
	end
	
	local itemConfig = nil
	for key,value in ipairs(config.items) do
		if value.item == nBuyItemId then
			itemConfig = config.items[key]
			break
		end
	end
	
	if not itemConfig then
		print("YY Config search is null, the actor name is "..Actor.getName(sysarg))
		return false
	end

	local needCount = Item.getAddItemNeedGridCount(sysarg,nBuyItemId,nBuyItemNum)
	local hasCount = Item.getBagEmptyGridCount(sysarg)
	if needCount > hasCount then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.dm010,ttFlyTip)
		return false
	end
	
	local ybCount = itemConfig.price[1].price*nBuyItemNum
	if Actor.changeMoney(sysarg,itemConfig.price[1].type,-ybCount,0,"") == false then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf613,ttFlyTip)   
		return false
	end

	Actor.giveAward(sysarg,0,nBuyItemId,nBuyItemNum)
	
	return true	
	
end

function YYVipGift(sysarg, platformId, msgid, packet)
	
	local nGetYYGiftType = DataPack.readByte(packet)   --1:每日YY领取  2：领取YY商店
	
	if nGetYYGiftType == 1 then
		return DuowanGetEveryDayGift(sysarg)
	elseif nGetYYGiftType == 2 then
		local nBuyItemId = DataPack.readInt(packet)
		local nBuyItemNum = DataPack.readInt(packet)
		return DuowanGetYYVipShop(sysarg,nBuyItemId,nBuyItemNum)
	end
	
	return true
end

function GetYYGiftFlag(sysarg, platformId, msgid, packet)
	local var = Actor.getStaticVar(sysarg)
	if not var.days.YYGiftFlag then
		var.days.YYGiftFlag = 0
	end

	local netPack =  AllocPlatformPacket(sysarg, PlatformIDs._duowan, DuowanCmds.sSendGiftFlag)
	DataPack.writeByte(netPack, var.days.YYGiftFlag)
	DataPack.flush(netPack)
end


-- 注册消息
if (System.GetGameIndex() == GameIndexDef.BaZheZhiRen2) and (System.getSpid() == PlatformIDs._duowan) then
	PlatformImplement.registerMsgHandler(PlatformIDs._duowan, DuowanCmds.cData, DuowanDataHandle)
	PlatformImplement.registerMsgHandler(PlatformIDs._duowan, DuowanCmds.cYYGift, YYVipGift)
	PlatformImplement.registerMsgHandler(PlatformIDs._duowan, DuowanCmds.cYYGiftFlag, GetYYGiftFlag)
end