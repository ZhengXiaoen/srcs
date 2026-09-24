--lua script
--行会建筑通用处理

--#include "data\language\LangCode.txt" once
--#include "data\config\guild\GuildMainHall.lua" once
--#include "data\config\guild\MoonBoxConfig.lua" once
--#include "data\config\guild\GuildBossConfig.lua" once
--#include "data\config\ActorEvent\SbkAwardConfig.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once
--#include "data\config\item\GuildDepotItemCfg.lua" once
--#include "data\config\guild\Guild.lua" once

--获取上香面板数据
function OnSendShxFormData(sysarg,args)
	local pack = DataPack.allocPacket(sysarg,10,62) 
	if (pack==nil) then return end

	local nTimes = 0
	local nGuild = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID)
	if nGuild <= 0 then return end

	local nHallLev = System.getGuildbuildingLev(nGuild,1)
	if nHallLev <=0 or nHallLev > table.getn(GuildMainHall.MainHallLev) then return end

	if Actor.isVip(sysarg) == true then
		nTimes = GuildMainHall.MainHallLev[nHallLev].nVipTimes
	else
		nTimes = GuildMainHall.MainHallLev[nHallLev].nTimes
	end
	
	nTimes = nTimes + Actor.getShxAddTimes(sysarg) - Actor.getShxDoneTimes(sysarg)
	if nTimes < 0 then
		nTimes = 0
	end
	
	if nTimes > 100 then
		nTimes = 100
	end

	DataPack.writeInt(pack,nTimes) 
	DataPack.writeInt(pack,GuildMainHall.GgFashionNeedCoin) 
	
	local nCount = table.getn(GuildMainHall.SxData)
	DataPack.writeByte(pack,nCount) 

	for i=1,nCount do
		DataPack.writeByte(pack,GuildMainHall.SxData[i].type) 
		DataPack.writeByte(pack,GuildMainHall.SxData[i].moneyType) 
		DataPack.writeInt(pack,GuildMainHall.SxData[i].moneyValue) 
		DataPack.writeByte(pack,table.getn(GuildMainHall.SxData[i].awards)) 
		for j=1,table.getn(GuildMainHall.SxData[i].awards) do
			DataPack.writeByte(pack,GuildMainHall.SxData[i].awards[j].type) 
			if GuildMainHall.SxData[i].awards[j].type == 20 then
				local nCount = Actor.getActivityExp(sysarg,GuildMainHall.SxData[i].awards[j].id,GuildMainHall.SxData[i].awards[j].count,GuildMainHall.SxData[i].awards[j].quality)
				DataPack.writeInt(pack,nCount) 
			else
				DataPack.writeInt(pack,GuildMainHall.SxData[i].awards[j].count) 
			end
		end
	end

	DataPack.flush(pack)			--向客户端发送
end

--玩家上香
function OnActorSxOp(sysarg,args)
	local nType = args[2]
	if nType <= 0 or nType > table.getn(GuildMainHall.SxData) then 
		return
	end
	
	local nGuild = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID)
	if nGuild <= 0 then return end

	local nHallLev = System.getGuildbuildingLev(nGuild,1)
	if nHallLev <=0 or nHallLev > table.getn(GuildMainHall.MainHallLev) then return end

	local nTimes = 0
	if Actor.isVip(sysarg) == true then
		nTimes = GuildMainHall.MainHallLev[nHallLev].nVipTimes
	else
		nTimes = GuildMainHall.MainHallLev[nHallLev].nTimes
	end
	
	local nSxTimes = Actor.getShxDoneTimes(sysarg)
	nTimes = nTimes + Actor.getShxAddTimes(sysarg) - nSxTimes

	if nTimes > 100 then
		nTimes = 100
	end

	if nTimes <= 0 then		--剩余次数已用完
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0001,ttFlyTip)
		return
	end
	
	local nCoin = 0
	if nType == 1 then
		nCoin = Actor.getIntProperty(sysarg,PROP_ACTOR_COIN)
		if nCoin < GuildMainHall.SxData[1].moneyValue then
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0002,ttFlyTip)
			return
		end
	elseif nType == 2 then
		nCoin = Actor.getIntProperty(sysarg,PROP_ACTOR_HONOUR)
		if nCoin < GuildMainHall.SxData[2].moneyValue then
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0038,ttFlyTip)
			return
		end
	elseif nType == 3 then
		nCoin = Actor.getIntProperty(sysarg,PROP_ACTOR_YUANBAO)
		if nCoin < GuildMainHall.SxData[3].moneyValue then
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0003,ttFlyTip)
			return
		end
	end
	
	if GuildMainHall.SxData[nType].moneyType <= 3 then
		Actor.changeMoney(sysarg,GuildMainHall.SxData[nType].moneyType,-GuildMainHall.SxData[nType].moneyValue,GameLog.clShangXiangLog,Lang.GuildLang.jz0004)
	elseif GuildMainHall.SxData[nType].moneyType == 5 then
		Actor.giveAward(sysarg,21,0,-GuildMainHall.SxData[nType].moneyValue,0,0,0,0,900,Lang.GuildLang.jz0004)
	end
	Actor.setShxDoneTimes(sysarg,nSxTimes+1)
	
	OnSendLeftSxTimes(sysarg)
	
	local nRate = 1
	local nHour,nMin,nSec = System.getTime(0,0,0)
	if nHour >= GuildMainHall.DoubleAward[1][1] and nHour <= GuildMainHall.DoubleAward[2][1] then
		if nMin >= GuildMainHall.DoubleAward[1][2] and nMin <= GuildMainHall.DoubleAward[2][2] then
			nRate = 2
		end
	end

	local ShangXConfig = GuildMainHall.SxData[nType]
	for i=1,table.getn(GuildMainHall.SxData[nType].awards) do
		Actor.giveAward(sysarg,ShangXConfig.awards[i].type,ShangXConfig.awards[i].id,ShangXConfig.awards[i].count * nRate,0,0,0)
		if ShangXConfig.awards[i].type == 20 then
			local nCount = Actor.getActivityExp(sysarg,ShangXConfig.awards[i].id,ShangXConfig.awards[i].count,ShangXConfig.awards[i].quality)
			nCount = nCount * nRate
			Actor.sendTipmsg(sysarg,string.format(Lang.GuildLang.jz0043,nCount),ttFlyTip)
		end

		if ShangXConfig.awards[i].type == 3 then		--贡献
			Actor.changeTodayGx(sysarg,ShangXConfig.awards[i].count * nRate)
		end
	end
end

--下发剩余上香次数
function OnSendLeftSxTimes(sysarg)
	local pack = DataPack.allocPacket(sysarg,10,63) 
	if(pack==nil) then return end
	
	local nGuild = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID)
	if nGuild <= 0 then return end

	local nHallLev = System.getGuildbuildingLev(nGuild,1)
	if nHallLev <=0 or nHallLev > table.getn(GuildMainHall.MainHallLev) then return end

	local nTimes = 0
	if Actor.isVip(sysarg) == true then
		nTimes = GuildMainHall.MainHallLev[nHallLev].nVipTimes
	else
		nTimes = GuildMainHall.MainHallLev[nHallLev].nTimes
	end
	
	nTimes = nTimes + Actor.getShxAddTimes(sysarg) - Actor.getShxDoneTimes(sysarg)
	if nTimes < 0 then
		nTimes = 0
	end

	DataPack.writeInt(pack,nTimes) 
	DataPack.flush(pack) --向客户端发送
end

--增加上香的次数
function OnAddSxTimesOp(sysarg,args)
	if Actor.isVip(sysarg) == false then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0005,ttFlyTip)
		return
	end

	local nYb = Actor.getIntProperty(sysarg,PROP_ACTOR_YUANBAO)
	if nYb < GuildMainHall.addTimesNeedYb then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0049,ttFlyTip)
		return
	end

	if Actor.getShxAddTimes(sysarg) >= GuildMainHall.VipAddTimes then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0006,ttFlyTip)
		return
	end

	Actor.changeMoney(sysarg,3,-GuildMainHall.addTimesNeedYb,GameLog.clShangXiangLog,Lang.GuildLang.jz0050)

	Actor.changeShxAddTimes(sysarg,1)
	OnSendLeftSxTimes(sysarg)
end

--领取拜关公时装
function OnGetGuanGongFashion(sysarg,args)
	local nTodayGx = Actor.getTodayGxValue(sysarg)
	if nTodayGx < GuildMainHall.GgFashionNeedCoin then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0007,ttFlyTip)
		return
	end
	
	local svar = Actor.getStaticVar( sysarg ) 
	if svar.days.GetBaiFashionFlag == nil then
		svar.days.GetBaiFashionFlag = 0
	end
	if svar.days.GetBaiFashionFlag == 1 then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0046,ttFlyTip)
		return
	end

	if Item.getBagEmptyGridCount(sysarg) < 1 then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0047,ttFlyTip)
		return
	end

	local nSex = Actor.getIntProperty( sysarg, PROP_ACTOR_SEX)
	if nSex == 0 then
		Actor.addItem(sysarg,GuildMainHall.GuanGongFashion.id,GuildMainHall.GuanGongFashion.quality,GuildMainHall.GuanGongFashion.strong,GuildMainHall.GuanGongFashion.count,GuildMainHall.GuanGongFashion.bind,GuildMainHall.GuanGongFashion.nLeftTime,Lang.GuildLang.jz0008,900)
	else
		Actor.addItem(sysarg,GuildMainHall.WomenGuanGongFashion.id,GuildMainHall.WomenGuanGongFashion.quality,GuildMainHall.WomenGuanGongFashion.strong,GuildMainHall.WomenGuanGongFashion.count,GuildMainHall.WomenGuanGongFashion.bind,GuildMainHall.WomenGuanGongFashion.nLeftTime,Lang.GuildLang.jz0008,900)
	end

	svar.days.GetBaiFashionFlag = 1
end

--获取月光宝盒的数据
function OnGetGuildMoonBoxData(sysarg,args)
	local pack = DataPack.allocPacket(sysarg,10,64) 
	if (pack==nil) then return end

	DataPack.writeInt(pack,GuildMainHall.exploreCoin) 
	DataPack.writeInt(pack,table.getn(MoonBoxConfig.AllBoxType)) 
	for i=1,table.getn(MoonBoxConfig.AllBoxType) do
		DataPack.writeInt(pack,MoonBoxConfig.AllBoxType[i].nPicId) 
		DataPack.writeString(pack,MoonBoxConfig.AllBoxType[i].sTips) 
	end

	DataPack.flush(pack)

	OnSendExploreTimesToClient(sysarg)
	
	OnSendExploreItemId(sysarg)
end

--行会探险
function OnGuildExploreOp(sysarg,args)
	local myGx = Actor.getGuildGx(sysarg)
	if myGx < GuildMainHall.exploreCoin then			--行会贡献不够
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0007,ttFlyTip)
		return
	end
	
	local nGuild = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID)
	if nGuild <= 0 then return end

	local nLev = System.getGuildbuildingLev(nGuild,3)
	if nLev <=0 or nLev > table.getn(GuildMainHall.moonBox) then return end

	local nMaxTimes = GuildMainHall.moonBox[nLev].nTimes
	local curTimes = Actor.getExploreTimes(sysarg)
	if curTimes >= nMaxTimes then		--探险次数不够
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0013,ttFlyTip)
		return
	end

	local nCount = table.getn(MoonBoxConfig.AllBoxType)
	local nMaxWeight = 0
	for i=1,nCount do
		nMaxWeight = nMaxWeight + MoonBoxConfig.AllBoxType[i].nWeight
	end
	local nResult = System.getRandomNumber(nMaxWeight)
	
	local nBoxIndex = 0
	local curWeight = 0
	for j=1,nCount do
		curWeight = curWeight + MoonBoxConfig.AllBoxType[j].nWeight
		if nResult < curWeight then
			nBoxIndex = j
			break
		end
	end

	if nBoxIndex <= 0 then
		nBoxIndex = 1
	end

	if nBoxIndex > nCount then
		nBoxIndex = nCount
	end
	
	local nItemIndex = 1
	local BoxConfig = MoonBoxConfig.AllBoxType[nBoxIndex]
	
	local nMaxRate = 0
	for k=1,table.getn(BoxConfig.nItems) do
		nMaxRate = nMaxRate + BoxConfig.nItems[k].nrate
	end
	local nRate = System.getRandomNumber(nMaxRate)
	local curRate = 0
	for k=1,table.getn(BoxConfig.nItems) do
		curRate = curRate + BoxConfig.nItems[k].nrate
		if nRate < curRate then
			nItemIndex = k
			break
		end
	end

	Actor.changeExploreTimes(sysarg,1)
	Actor.setExploreItemId(sysarg,BoxConfig.nItems[nItemIndex].nItemId)
	
	Actor.changeGuildGx(sysarg,-GuildMainHall.exploreCoin)
	
	local nRangStr = System.getRandomNumber(table.getn(GuildMainHall.randLang))
	if nRangStr <=0 or nRangStr > table.getn(GuildMainHall.randLang) then
		nRangStr = 1
	end

	--local strEvent = string.format(Lang.GuildLang.jz0014,Item.getItemName(BoxConfig.nItems[nItemIndex].nItemId))
	OnSendExploreEvent(sysarg,GuildMainHall.randLang[nRangStr])

	local pack = DataPack.allocPacket(sysarg,10,65) 
	if (pack==nil) then return end

	DataPack.writeInt(pack,BoxConfig.nPicId) 
	DataPack.writeInt(pack,BoxConfig.nItems[nItemIndex].nItemId) 
	DataPack.writeInt(pack,nMaxTimes-1-curTimes) 

	DataPack.flush(pack)
end

--下发探险的次数
function OnSendExploreTimesToClient(sysarg)
	local nGuild = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID)
	if nGuild <= 0 then return end

	local nLev = System.getGuildbuildingLev(nGuild,3)
	if nLev <= 0 or nLev > table.getn(GuildMainHall.moonBox) then 
		nLev = 1
	end

	local pack = DataPack.allocPacket(sysarg,10,68) 
	if (pack==nil) then return end

	local nMaxTimes = GuildMainHall.moonBox[nLev].nTimes
	local curTimes = Actor.getExploreTimes(sysarg)
	
	DataPack.writeInt(pack,nMaxTimes - curTimes) 
	DataPack.writeInt(pack,nMaxTimes) 

	DataPack.flush(pack)
end

--探险动画播放完毕
function OnExploreFinishOp(sysarg,args)
	local nItemId = Actor.getExploreItemId(sysarg)
	if nItemId > 0 then
		local strEvent = string.format(Lang.GuildLang.jz0014,Item.getItemName(nItemId))
		OnSendExploreEvent(sysarg,strEvent)
	end
end

--下发探险事件
function OnSendExploreEvent(sysarg,strEvent)
	if strEvent == nil then return end
	local pack = DataPack.allocPacket(sysarg,10,66) 
	if (pack==nil) then return end
	DataPack.writeString(pack,strEvent) 
	DataPack.flush(pack)
end

--下发上一次获得物品的id
function OnSendExploreItemId(sysarg)	
	local nItemId = Actor.getExploreItemId(sysarg)
	--print("OnSendExploreItemId:"..nItemId)
	if nItemId > 0 then
		local pack = DataPack.allocPacket(sysarg,10,67) 
		if (pack==nil) then return end
		DataPack.writeInt(pack,nItemId) 
		DataPack.flush(pack)
	end
end

--领取月光宝盒的物品
function OnGetExploreItemIdOp(sysarg,args)
	local nItemId = Actor.getExploreItemId(sysarg)
	if nItemId > 0 then
		if Item.getBagEmptyGridCount(sysarg) < 1 then
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0047,ttFlyTip)
			return
		end
		Actor.addItem(sysarg,nItemId,0,0,1,1,0,Lang.GuildLang.jz0015,902)
		Actor.setExploreItemId(sysarg,0)

		local pack = DataPack.allocPacket(sysarg,10,67) 
		if (pack==nil) then return end
		DataPack.writeInt(pack,0) 
		DataPack.flush(pack)
	end
end

--行会建筑升级
function OnUpGuildBuildingOp(sysarg,args)
	local nIndex = args[2]

	local nPos = Actor.getGuildPos(sysarg)
	if nPos ~= 2 and nPos ~= 3 then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0028,ttFlyTip)
		return
	end
	
	local nGuild = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID)
	if nGuild <= 0 then
		return
	end
	
	local curTime = System.getCurrMiniTime()
	if System.getGuildBuildingCdTime(nGuild) > curTime then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0030,ttFlyTip)
		return
	end
	
	local nLevel = 0
	local nCoin = Actor.getGuildCoin(sysarg)
	local nCdTime = 0

	if nIndex == 1 then		--主殿
		nLevel = System.getGuildbuildingLev(nGuild,nIndex)
		if nLevel >= table.getn(GuildMainHall.MainHallLev) then
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0029,ttFlyTip)
			return
		end

		if nCoin < GuildMainHall.MainHallLev[nLevel + 1].upNeedGuildCoin then	
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0031,ttFlyTip)
			return
		end
		System.changeGuildCoin(nGuild,-GuildMainHall.MainHallLev[nLevel + 1].upNeedGuildCoin)
		System.setGuildBuildingCdTime(nGuild,GuildMainHall.MainHallLev[nLevel + 1].nCdTime + curTime)
		System.changeGuildBuildingLev(nGuild,1,1)

		nCdTime = GuildMainHall.MainHallLev[nLevel + 1].nCdTime
		OnHallUpLevelOpenOnter(sysarg,nGuild,nLevel + 1)

	elseif nIndex == 2 then		--行会商店
		nLevel = System.getGuildbuildingLev(nGuild,nIndex)
		if nLevel >= table.getn(GuildMainHall.guildShop) then
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0032,ttFlyTip)
			return
		end

		if nCoin < GuildMainHall.guildShop[nLevel + 1].needCoin then	
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0031,ttFlyTip)
			return
		end

		if System.getGuildbuildingLev(nGuild,1) < GuildMainHall.guildShop[nLevel + 1].needHallLev then
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0033,ttFlyTip)
			return
		end
		
		System.changeGuildCoin(nGuild,-GuildMainHall.guildShop[nLevel + 1].needCoin)
		System.setGuildBuildingCdTime(nGuild,GuildMainHall.guildShop[nLevel + 1].nCdTime + curTime)
		System.changeGuildBuildingLev(nGuild,2,1)

		nCdTime = GuildMainHall.guildShop[nLevel + 1].nCdTime

	elseif nIndex == 3 then		--月光宝盒
		nLevel = System.getGuildbuildingLev(nGuild,nIndex)
		if nLevel >= table.getn(GuildMainHall.moonBox) then
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0034,ttFlyTip)
			return
		end

		if nCoin < GuildMainHall.moonBox[nLevel + 1].needCoin then	
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0031,ttFlyTip)
			return
		end

		if System.getGuildbuildingLev(nGuild,1) < GuildMainHall.moonBox[nLevel + 1].needHallLev then
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0033,ttFlyTip)
			return
		end
		
		System.changeGuildCoin(nGuild,-GuildMainHall.moonBox[nLevel + 1].needCoin)
		System.setGuildBuildingCdTime(nGuild,GuildMainHall.moonBox[nLevel + 1].nCdTime + curTime)
		System.changeGuildBuildingLev(nGuild,3,1)

		nCdTime = GuildMainHall.moonBox[nLevel + 1].nCdTime

	elseif nIndex == 4 then		--封印兽碑
		nLevel = System.getGuildbuildingLev(nGuild,nIndex)
		if nLevel >= table.getn(guildBossConfig.bossConfig) then
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0035,ttFlyTip)
			return
		end

		if nCoin < guildBossConfig.bossConfig[nLevel + 1].needCoin then	
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0031,ttFlyTip)
			return
		end

		if System.getGuildbuildingLev(nGuild,1) < guildBossConfig.bossConfig[nLevel + 1].nNeedHallLev then
			Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0033,ttFlyTip)
			return
		end
		
		System.changeGuildCoin(nGuild,-guildBossConfig.bossConfig[nLevel + 1].needCoin)
		System.setGuildBuildingCdTime(nGuild,guildBossConfig.bossConfig[nLevel + 1].nCdTime + curTime)
		System.changeGuildBuildingLev(nGuild,4,1)

		nCdTime = guildBossConfig.bossConfig[nLevel + 1].nCdTime

	end
	
	--[[
		local pack = DataPack.allocPacket(sysarg,10,72) 
		if (pack==nil) then return end
		DataPack.writeByte(pack,nIndex) 
		DataPack.writeInt(pack,nLevel+1) 
		DataPack.flush(pack)
	]]
	
	--OnSendGuildBuildCdTime(sysarg,nCdTime)
end

--清除行会建筑冷却时间
function OnClearGuildBuildCdTime(sysarg,args)
	local nGuild = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID)
	local curTime = System.getCurrMiniTime()
	local nCdTime = System.getGuildBuildingCdTime(nGuild)
	if nCdTime <= curTime then
		return
	end
	
	local nIndex = math.ceil((nCdTime-curTime) / (10*60))
	Actor.messageBox(sysarg,0,0,string.format(Lang.GuildLang.jz0042,nIndex),Lang.GuildLang.z00040.."/OnGuildBuildCdTime",Lang.GuildLang.z00041.."/CanleClearBuildingCdTime",NULL)
end

--确定
function OnGuildBuildCdTime(sysarg)
	local nGuild = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID)
	local nCdTime = System.getGuildBuildingCdTime(nGuild)
	local curTime = System.getCurrMiniTime()
	if nCdTime <= curTime then
		return
	end
	
	local nPos = Actor.getGuildPos(sysarg)
	if nPos ~= 2 and nPos ~= 3 then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0041,ttFlyTip)
		return
	end
	
	local nIndex = math.ceil((nCdTime - curTime) / (10*60))
	if nIndex > Actor.getIntProperty(sysarg,PROP_ACTOR_YUANBAO) then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0036,ttFlyTip)
		return
	end
	
	Actor.changeMoney(sysarg,3,-nIndex,GameLog.clShangXiangLog,Lang.GuildLang.jz0037)
	System.setGuildBuildingCdTime(nGuild,0)
	--OnSendGuildBuildCdTime(sysarg,0)

end

--取消
function CanleClearBuildingCdTime(sysarg)

end

--下发冷却时间
function OnSendGuildBuildCdTime(sysarg,nCdTime)
	local pack1 = DataPack.allocPacket(sysarg,10,71) 
	if (pack1==nil) then return end
	DataPack.writeInt(pack1,nCdTime) 
	DataPack.flush(pack1)
end

--当主殿升级到某个等级开启另外的建筑
function OnHallUpLevelOpenOnter(sysarg,nGuild,nLevel)
	if nLevel == GuildMainHall.guildShop[1].needHallLev then
		System.changeGuildBuildingLev(nGuild,2,1)
		--SendGuildBuildingLevel(sysarg,2,1)
	end

	if nLevel == GuildMainHall.moonBox[1].needHallLev then
		System.changeGuildBuildingLev(nGuild,3,1)
		--SendGuildBuildingLevel(sysarg,3,1)
	end

	if nLevel == guildBossConfig.bossConfig[1].nNeedHallLev then
		System.changeGuildBuildingLev(nGuild,4,1)
		--SendGuildBuildingLevel(sysarg,4,1)
	end
end

--下发行会建筑的等级
function SendGuildBuildingLevel(sysarg,nIndex,nLevel)
	local pack = DataPack.allocPacket(sysarg,10,72) 
	if (pack==nil) then return end
	DataPack.writeByte(pack,nIndex) 
	DataPack.writeInt(pack,nLevel) 
	DataPack.flush(pack)
end


--下发沙巴克管理层名字
function SendGuildSbkLeaderName(sysarg,args)
	
	local pack = DataPack.allocPacket(sysarg,10,75) 
	if (pack==nil) then return end
	
	local nSbkGuildId = Guild.getSbkCityOwnerGuildId()
	if nSbkGuildId > 0 then
		local nCount = 0
		local nLeaderNameList = {}
		local nLeaderIdList = {}
		local nLeaderSexList = {}
		
		DataPack.writeByte(pack,1) 
		local nGuildName = Guild.getGuildName(nSbkGuildId)
		DataPack.writeString(pack,nGuildName)
		
		for i = 1,6 do
			local name = Guild.getGuildBackboneName(nSbkGuildId,i)
			if name then
				local sex = Guild.getGuildBackboneSex(nSbkGuildId,i)
				nCount = nCount + 1
				--print(name.."     "..i.."     "..sex)
				table.insert(nLeaderNameList,name)
				table.insert(nLeaderIdList,i)
				table.insert(nLeaderSexList,sex)
			end
		end

		local nIdCount = table.getn(nLeaderNameList)
		local nNameCount = table.getn(nLeaderIdList)
		local nSexCount = table.getn(nLeaderSexList)
		if nIdCount ~= nNameCount or nNameCount ~= nSexCount or nIdCount ~= nSexCount then
			print("read the count error")
			return false
		end
		
		DataPack.writeByte(pack,nCount)
		for i = nCount,1,-1 do
			DataPack.writeByte(pack,nLeaderIdList[i])
			DataPack.writeString(pack,nLeaderNameList[i])
			DataPack.writeByte(pack,nLeaderSexList[i])
		end
	else 
		DataPack.writeByte(pack,0) 
	end
	DataPack.flush(pack)
	
	SendSignUpGuildList(sysarg,args)
end

--下发今天和明天参加帮战的行会名字
function SendSignUpGuildList(sysarg,args)
	local pack = DataPack.allocPacket(sysarg,10,76) 
	if (pack==nil) then return end
	--for i = 1,2 do
		local i = 2 -- 只下发今天的
		DataPack.writeByte(pack,i) 
		local nGuildList = LuaHelp.getSignUpSbkList(i)
		
		if nGuildList then
			local nSignUpCount = table.getn(nGuildList)
			DataPack.writeShort(pack,nSignUpCount) 
			if nSignUpCount > 0 then
				for key,value in ipairs(nGuildList or {}) do
					DataPack.writeString(pack,value)
				end			
			end
		else
			DataPack.writeShort(pack,0) 
		end
	--end
	DataPack.flush(pack)
end

--获取本次攻城的奖励
function GetSbkAward(sysarg,args)
	
	local nType = args[2]
	
	--失败方不奖励了
	if nType == 5 then return end
	
	local nGuildId = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID )
	if nGuildId <= 0 then
		return false -- 非行会成员
	end
	
	if Guild.getSbkWarFlag() > 0 then -- 如果是在攻城期间是不能领的
		return false
	end
	
	-- 没配置有奖励
	if not SbkAward.guildAward then return false end	
	
	local nOpenDay = System.getDaysSinceOpenServer()
	if nOpenDay < GuildConfig.SbkSignUpTime.openDay[1] then return false end -- 开服第3天为首次攻城
	
	local combineDay = System.getDaysSinceCombineServer()
    local sVar = System.getStaticVar()

	if sVar.sbkcombineday ~= nil then
        combineDay = sVar.sbkcombineday
    end
	
	
	-- 是否首次攻城奖励
	local isFirstAward = false
    local nCombineDay = 0
	if nOpenDay == GuildConfig.SbkSignUpTime.openDay[1] then
		isFirstAward = true -- 开服第3天肯定是首次攻城
	elseif combineDay > 0 then -- -- 合区第几天首次攻城(-1 则忽略合区状态)
        for i = 1,table.getn(GuildConfig.SbkSignUpTime.combineDay) do
            if GuildConfig.SbkSignUpTime.combineDay[i] == combineDay then
                nCombineDay = GuildConfig.SbkSignUpTime.combineDay[i]
                break
            end
        end
        --combineDay == GuildConfig.SbkSignUpTime.combineDay
		--isFirstAward = true -- 合区第3天肯定是首次攻城
	else
		-- 有些玩家是第二天才去领，保险点给三天时间，因为怕 sVar.gwarTimes 也不一定准
		if sVar.gwarTimes ~= nil and sVar.gwarTimes == 1 then
			if nOpenDay <= 7 and nOpenDay >= (GuildConfig.SbkSignUpTime.openDay[1]+1) then
				isFirstAward = true
			end
		end		
	end	
	
	local awardCfg
	if nCombineDay > 0 then
        if nCombineDay == 3 then
            awardCfg = SbkAward.guildAward.combineOneDay[nType]
        elseif nCombineDay == 4 then
            awardCfg = SbkAward.guildAward.combineTwoDay[nType]
        elseif nCombineDay == 5 then
            awardCfg = SbkAward.guildAward.combineThreeDay[nType]
        end
    else
        if isFirstAward then
		    awardCfg = SbkAward.guildAward.firstAward[nType]
        elseif nOpenDay >= 4 and nOpenDay <= 7 then --第4-7天攻城奖励5000元宝
            awardCfg = SbkAward.guildAward.fourtoSevenAward[nType]
	    else
		    awardCfg = SbkAward.guildAward.normalAward[nType]
	    end
    end


	if not awardCfg then return false end	

	local sbkGuildid = Guild.getSbkCityOwnerGuildId()	
	
	local nActorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	local nId = 0
	
	if nType <= 4 then
		if sbkGuildid ~= nGuildId then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf143,ttFlyTip)  
			return false 
		end
	elseif nGuildId <= 0 then
		return false
	end
	
	local hasVar = sVar.sbkAward ~= nil

	if nType == 1 then		
		local nSbkActorid = Guild.getSbkCityOwner()
		if nActorid ~= nSbkActorid then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf141,ttFlyTip)  
			return false
		end
		
		if Actor.getSocialMask(sysarg,smGuildLeader) == false then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf141,ttFlyTip)  
			return false
		end

		if hasVar == true and sVar.sbkAward[smGuildLeader] then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf142,ttFlyTip)  
			return false
		else
			nId = smGuildLeader
		end
	elseif nType == 2 then
		if Actor.getSocialMask(sysarg,smGuildAssistLeader) == false then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf144,ttFlyTip) 
			return false
		end
		
		if hasVar == true and sVar.sbkAward[smGuildAssistLeader] then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf142,ttFlyTip)  
			return false
		else
			nId = smGuildAssistLeader
		end
	elseif nType == 3 then
		
		for i = 1 , 4 do
			if Actor.getSocialMask(sysarg,i) == true then
				if hasVar == true and sVar.sbkAward[i] then
					Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf142,ttFlyTip) 
					return false
				else
					nId = i
					break
				end			
			end
		end
		
		if nId == 0 then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf145,ttFlyTip) 
			return false
		end
	
	elseif nType == 4 then
		for i = smGuildTangzhuFir,smGuildLeader do
			if hasVar == true and sVar.sbkAward[i] and sVar.sbkAward[i] == nActorid then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf277,ttFlyTip) 
				return false
			end
		end
		if Actor.getGuildPos(sysarg) == smGuildCommon then
			local nHour,nMin,nSec = System.getTime(0,0,0)
			local var = Actor.getStaticVar(sysarg)
			if var.days.civyAward then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf278,ttFlyTip) 
				return false
			elseif nHour >= 21 then
				if Awards.CheckBagGridCount(sysarg,awardCfg) then
					Awards.GiveNoCheck(sysarg,awardCfg,1011,"领取王城全民奖")
					var.days.civyAward = 1
					return true
				else
					return false
				end
			else
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf274,ttFlyTip) 
				return false
			end
		else
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf276,ttFlyTip) 
			return false
		end
		
	elseif nType == 5 then 
		if sbkGuildid == nGuildId then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf279,ttFlyTip) 
			return false
		elseif Actor.isSignUpSbkWar(sysarg) >= 1 then
			local nHour,nMin,nSec = System.getTime(0,0,0)
			local var = Actor.getStaticVar(sysarg)
			if var.days.failureAward then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf275,ttFlyTip) 
				return false
			elseif nHour >= 21 then
				if Awards.CheckBagGridCount(sysarg,awardCfg) then
					Awards.GiveNoCheck(sysarg,awardCfg,1011,"领取王城战败安慰奖")
					var.days.failureAward = 1
					return true
				else
					return false
				end
			else
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf274,ttFlyTip) 
				return false
			end
		else
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf273,ttFlyTip) 
			return false
		end
	else
		return false
	end
	
	if Awards.CheckBagGridCount(sysarg,awardCfg) == false then
		return false
	end
		
	if Awards.GiveNoCheck(sysarg, awardCfg, 991, "领取王城奖励") == false then
		print("give award error, nActorid="..nActorid..",guildid="..nGuildId..",nType="..nType)
		return false
	end
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf146,ttFlyTip)
	
	if hasVar == false then
		sVar.sbkAward = {}
	end
	
	sVar.sbkAward[nId] = nActorid
end

--城主特权
function GetLeaderPrivilege(sysarg,args)
	
	local nEventId = args[2]
	local nTypeId = args[3]
	local nbuyNum = args[4]
	
	if not SbkAward.LeaderPrivilege then
		return false
	end
	local config
	if nEventId == SbkAward.LeaderPrivilege.sbkWeapon.id then
		--config = SbkAward.LeaderPrivilege.sbkWeapon
		return false
	elseif nEventId == SbkAward.LeaderPrivilege.sbkTitle.id then
		config = SbkAward.LeaderPrivilege.sbkTitle
	elseif nEventId == SbkAward.LeaderPrivilege.sbkStore.id then
		--config = SbkAward.LeaderPrivilege.sbkStore
		return false
	end
	
	if not config then return false end

	if Guild.getSbkWarFlag() > 0 then
		return false
	end

	local nActorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	local nSbkActorid = Guild.getSbkCityOwner()
	if nActorid ~= nSbkActorid then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf139,ttFlyTip)    
		return false
	end
	
	local sVar = System.getStaticVar()
	
	if not sVar.LeaderPrivilege then
		sVar.LeaderPrivilege = {}
	end
	
	if nEventId < 3 then
		if not sVar.LeaderPrivilege[nEventId] then
			if nEventId == 1 then
				--屏蔽城主武器
				return false
				
				--if Awards.CheckBagGridCount(sysarg,config.award) then
				--	Awards.Give(sysarg,config.award,992,"领取王城城主特权武器奖励")
				--else
				--	return false
				--end
				
			elseif nEventId == 2 then
				if Actor.setTopTitle(sysarg,config.Titleid,true) == false then
					print("add topTitle error")
					return false
				end
			end
			
			sVar.LeaderPrivilege[nEventId] = 1
		else
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf268,ttFlyTip)
			return false
		end
	else
		local itemInfo
		for key ,value in ipairs(config.store) do
			if value.typeId == nTypeId then
				itemInfo = value
				break
			end
		end
		
		if not itemInfo then return false end
	
		local nGridCount = Item.getBagEmptyGridCount(sysarg)
		local nNeedCount = Item.getAddItemNeedGridCount(sysarg,itemInfo.itemId,nbuyNum)
		if nGridCount < nNeedCount then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf140,ttFlyTip)       
			return false 
		end
		
		local nNeedMoney = itemInfo.price.price*nbuyNum
		if Actor.changeMoney(sysarg,itemInfo.price.type,-nNeedMoney) == false then
			if Actor.changeMoney(sysarg,itemInfo.price.type+1,-nNeedMoney) == false then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.tf00008,ttFlyTip)
				return false
			end
		end
	
		if Actor.giveAward(sysarg,0,itemInfo.itemId,nbuyNum,0,0,itemInfo.bind,0,993,"在王城特权商店购买物品") == false then
			print("give award error")
			return false
		end
	end
end

--取出行会仓库物品
function GetGuildDepotItem(sysarg,args)
	
	local pUserItem = args[2]
	if not pUserItem or not GuildDepot then return end
	
	local nItemId = Item.getItemId(pUserItem)
	local minCircle = Item.getItemPropertyById(nItemId, Item.ipItemNeedCircle)
	local itemType = Item.getItemProperty( sysarg, pUserItem, Item.ipItemType, 0)
	
	if minCircle > 0 then
		for key,circleCfg in ipairs(GuildDepot.CircleEquip) do
			if circleCfg.circle == minCircle then
				if not CheckGuildGX(sysarg,circleCfg) then
					Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf294,Item.getItemName(nItemId),circleCfg.guildScore),ttFlyTip)
					return false
				else
					return true
				end
			end
		end
	else
		local needLevel = Item.getItemPropertyById(nItemId, Item.ipItemActorLevel)
		for key,normalCfg in ipairs(GuildDepot.NormalEquip) do
			if needLevel >= normalCfg.minLevel and needLevel <= normalCfg.maxLevel and GetnCurEquipValue(itemType,normalCfg) then
				if not CheckGuildGX(sysarg,normalCfg) then
					Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf294,Item.getItemName(nItemId),normalCfg.guildScore),ttFlyTip)
					return false
				else
					return true	
				end
			end
		end
	end
	
	return false
end

--这个是检测个人的私人行会贡献值
function CheckGuildGX(sysarg,config)
	
	if Actor.getGuildGx(sysarg) >= config.guildScore then
		Actor.changeGuildGx(sysarg,-config.guildScore)
		return true
	else
		return false
	end
end

function GuildDonateResult(sysarg,args)
	local bindCoinCount = args[2]
	
	OnLivenessGuildDonateResult(sysarg, bindCoinCount)
end