--[[File:BlessTree.lua]]
--#include "data/functions/GlobalMisc.lua" once     --全局的杂项函数 
--#include "BlessTreeCommon.lua" once
--#include "SpringFestivalActivities.lua" once -- 春节活动，svn://192.168.0.160/idgp/Dragon/X-新传奇项目系统文档/H-活动汇总/X.新春活动/新春活动.docx
--#include "FestivalWithDrawYuanbao.lua" once
--#include "FestivalFireCommon.lua" once


function BlessTree_Main(sysarg)
	local dlgStr = string.format(Lang.ScriptTips.blesstree01, GetCurBlessPoint(), GetCurTreeLevel(), GetKillMonsterExpRate())
	dlgStr = string.format("%s<#BL%s/@exchangeWordAward><#BL%s/@getFireworksAward><#BL%s/@viewBlessInfo>", dlgStr, Lang.ScriptTips.blesstree02,Lang.ScriptTips.blesstree03,Lang.ScriptTips.blesstree04);
	-- 新春活动
	--dlgStr = string.format("%s<#BL%s/@GetFestiveFirecrackers><#BL%s/@GetMoneyPacket><#BL%s/@GetSpringFestivalGift>", dlgStr, Lang.ScriptTips.blesstree102,Lang.ScriptTips.blesstree103,Lang.ScriptTips.blesstree104);
	-- 驱年兽
	dlgStr = string.format("%s<#BL%s/@BaoZhuNianshoujiao>", dlgStr, Lang.Activity.bznsj001);
	dlgStr = string.format("%s<#BL%s/@NewYearBlessDialog>", dlgStr, Lang.ScriptTips.btr116)
	return dlgStr
end

-- 爆竹及年兽角
function BaoZhuNianshoujiao(sysarg)
	local dlgStr = Lang.ScriptTips.blesstree120; --print(dlgStr)
	--local sysVar = System.getDyanmicVar();
	--if sysVar.NianActivityStarted then
		dlgStr = string.format("%s<#BL%s/@GouMaiBaozhu><#BL%s/@NianConvertAwardsMenu>",dlgStr,  Lang.ScriptTips.blesstree117,Lang.ScriptTips.blesstree111);
	--end --]]
	return dlgStr .. Lang.ScriptTips.back001;
end
-- 购买爆竹
function GouMaiBaozhu(sysarg)
	local dlgStr = "";
	
	dlgStr = string.format("%s<#BL%s/@BuyBigFestiveFirecrackers,%d><#BL%s/@BuyBigFestiveFirecrackers,%d>", dlgStr, 
		string.format(Lang.ScriptTips.blesstree109,NianConfig.BigFestiveFirecrackers.Price),1,
		string.format(Lang.ScriptTips.blesstree118,NianConfig.BigFestiveFirecrackers.Price*10),10);
	dlgStr = string.format("%s<#BL%s/@BuySmallFestiveFirecrackers,%d><#BL%s/@BuySmallFestiveFirecrackers,%d>", dlgStr, 
		string.format(Lang.ScriptTips.blesstree110,NianConfig.SmallFestiveFirecrackers.Price),1,
		string.format(Lang.ScriptTips.blesstree119,NianConfig.SmallFestiveFirecrackers.Price*10),10);
		
	return dlgStr .. Lang.ScriptTips.back001;
end

--兑换烟花
function exchangeWordAward(sysarg)
	local dlgStr = Lang.ScriptTips.blesstree09
	dlgStr = string.format("%s<#BL%s/@SingleWordExchange><#BL%s/@LHZSExchange><#BL%s/@RealLHZSExChg><#BL%s/@ThrivingExChg>",dlgStr, Lang.ScriptTips.blesstree05, Lang.ScriptTips.blesstree06, Lang.ScriptTips.blesstree07, Lang.ScriptTips.blesstree08)
	return dlgStr .. Lang.ScriptTips.back001
end

function SingleWordExchange(sysarg)
	local dlgStr = ""
	for i = 1, 9 do
		local wordCfg = FireworkConfig.ExchangeWord[i]
		if wordCfg then
			dlgStr = string.format("%s<#BL%s%s/@GetSingleWordAward,%d>", dlgStr, wordCfg.noItemNotice,Lang.ScriptTips.blesstree101,i)
		end
	end
	return dlgStr ..  Lang.ScriptTips.back001
end

function GetSingleWordAward(sysarg, idx)
	idx = tonumber(idx)
	ExchangeWords(sysarg, idx, false)
end

--烈火战神礼包
function LHZSExchange(sysarg)
	local dlgStr = string.format("%s<#BL%s/@ExchangeLHZSGift><#BL%s/@ExchangeLHZSAdvGift>", Lang.ScriptTips.blesstree31,Lang.ScriptTips.blesstree32,Lang.ScriptTips.blesstree33)
	return dlgStr .. Lang.ScriptTips.back001
end

function ExchangeLHZSGift(sysarg)
	ExchangeWords(sysarg, 10,false)
end

function ExchangeLHZSAdvGift(sysarg)
	ExchangeWords(sysarg, 10, true)
end


--真烈火战神礼包
function RealLHZSExChg(sysarg)
	local dlgStr = string.format("%s<#BL%s/@ExchangeRealLHZSGift><#BL%s/@ExchangeRealLHZSAdvGift>", Lang.ScriptTips.blesstree41,Lang.ScriptTips.blesstree42,Lang.ScriptTips.blesstree43)
	return dlgStr .. Lang.ScriptTips.back001
end

function ExchangeRealLHZSGift(sysarg)
	ExchangeWords(sysarg, 11,false)
end

function ExchangeRealLHZSAdvGift(sysarg)
	ExchangeWords(sysarg, 13, true)
end

--恭喜发财
function ThrivingExChg(sysarg)
	local dlgStr = string.format("%s<#BL%s/@ExchangeTriving><#BL%s/@ExchangeAdvTriving>", Lang.ScriptTips.blesstree51, Lang.ScriptTips.blesstree52, Lang.ScriptTips.blesstree53)
	return dlgStr .. Lang.ScriptTips.back001
end

function ExchangeTriving(sysarg)
	ExchangeWords(sysarg, 12, false)
end

function ExchangeAdvTriving(sysarg)
	ExchangeWords(sysarg, 12, true)
end

function getFireworksAward(sysarg)
	local dlgStr = Lang.ScriptTips.blesstree62
	dlgStr = string.format("%s<#BL%s/@viewYestodayRankAward>", dlgStr, Lang.ScriptTips.blesstree61)
	local ranking = Ranking.getRanking( Lang.Rank.wishValue )
	if ranking then
		for i = 1, FireworkConfig.MaxRankCount do
			local pItem = Ranking.getItemFromIndex(ranking, i-1)
			if pItem then
				dlgStr = dlgStr ..  string.format(Lang.ScriptTips.blesstree63, i, Ranking.getSub(pItem,0),Ranking.getPoint(pItem))
			end
		end
	end
	return dlgStr .. Lang.ScriptTips.back001
end

function viewYestodayRankAward(sysarg)
	local dlgStr = Lang.ScriptTips.blesstree11
	local ranking = Ranking.getRanking( Lang.Rank.yestodayWishValue )
	local isMyRank = false
	local myId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	if ranking then
		for i = 1, FireworkConfig.MaxRankCount do
			local pItem = Ranking.getItemFromIndex(ranking, i-1)
			if pItem then
				if Ranking.getId(pItem) == myId then
					isMyRank = true
				end
				dlgStr = dlgStr ..  string.format(Lang.ScriptTips.blesstree63, i, Ranking.getSub(pItem,0),Ranking.getPoint(pItem))
			end
		end
	end
	if isMyRank then
		dlgStr = string.format("%s<#BL%s/@GetYestodayRankAward>", dlgStr, Lang.ScriptTips.blesstree10) 
	end
	return dlgStr .. Lang.ScriptTips.back001
end

function GetYestodayRankAward(sysarg)
	local ranking = Ranking.getRanking( Lang.Rank.yestodayWishValue )
	if ranking then
		local myId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		local pItem = Ranking.getItemPtrFromId(ranking, myId)
		if pItem then
			local myPoint = Ranking.getPoint(pItem)
			if myPoint < FireworkConfig.MinPointAward then
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.blesstree13,FireworkConfig.MinPointAward), ttFlyTip)
				return
			end
			if Ranking.getSub(pItem, 1) ~= "0" then
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.blesstree15, ttFlyTip)
				return
			end
			local myIndex = Ranking.getIndexFromPtr(pItem)
			if myIndex >= 0 and myIndex < FireworkConfig.MaxRankCount then
				myIndex = myIndex + 1
				local awardTab = FireworkConfig.YestodayRankAward[myIndex]
				if not awardTab then
					for k, v in ipairs(FireworkConfig.AfterFourRanking) do
						if myIndex >= v.min and myIndex <= v.max then
							awardTab = v.awards
							break
						end
					end
				end
				if not awardTab then
					return
				end
				if not CheckBlessTreeGrid(sysarg, awardTab)  then
					return
				end
				Ranking.setSub(pItem, 1, "1")
				for k, v in ipairs(awardTab) do
					Actor.giveAward(sysarg, v.type,v.id,v.count,0,0,0,0,840, Lang.LogTips.yb038)
				end
			else
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.blesstree14, ttFlyTip)
			end
		end
	end
end

function viewBlessInfo(sysarg)
	return Lang.ScriptTips.blesstree71 .. Lang.ScriptTips.back001
end

function InitWishRanking()
	local ranking = Ranking.getRanking( Lang.Rank.wishValue )
	if not ranking then
		ranking = Ranking.add( Lang.Rank.wishValue, FireworkConfig.MaxRankCount )
		if ranking then			
			if not Ranking.load(ranking, Lang.Rank.wishValue) then
				Ranking.addColumn(ranking, "name")
				Ranking.addColumn(ranking, "award")
			end
			Ranking.addRef( ranking )
		end
		Ranking.save(ranking, Lang.Rank.wishValue)
	end
	local yesRanking = Ranking.getRanking( Lang.Rank.yestodayWishValue )
	if not yesRanking then
		yesRanking = Ranking.add(Lang.Rank.yestodayWishValue, FireworkConfig.MaxRankCount)
		if yesRanking then
			if not Ranking.load(yesRanking, Lang.Rank.yestodayWishValue) then
				Ranking.addColumn(yesRanking, "name")
				Ranking.addColumn(yesRanking, "award")
			end
			Ranking.addRef( yesRanking )
		end
		--Ranking.save(yesRanking, Lang.Rank.yestodayWishValue)
	end

	--春节鞭炮
	local fireRanking = Ranking.getRanking( Lang.Rank.sFireRankName )
	if not fireRanking then
		fireRanking = Ranking.add( Lang.Rank.sFireRankName, FestivalWishes.RankTop )
		if fireRanking then
			if not Ranking.load(fireRanking, Lang.Rank.sFireRankName) then
				Ranking.addColumn(fireRanking, "name")
			end
			Ranking.addRef( fireRanking )
		end
	end

	local yestodayFireRanking = Ranking.getRanking(Lang.Rank.yestodayFireRank)
	if not yestodayFireRanking then
		yestodayFireRanking = Ranking.add(Lang.Rank.yestodayFireRank, FestivalWishes.RankTop)
		if yestodayFireRanking then
			if not Ranking.load(yestodayFireRanking, Lang.Rank.yestodayFireRank) then
				Ranking.addColumn(yestodayFireRanking, "name")
				Ranking.addColumn(yestodayFireRanking, "award")
			end
			Ranking.addRef(yestodayFireRanking)
		end
	end

	local drawRanking = Ranking.getRanking(Lang.Rank.FestivalDrawYBRank)
	if not drawRanking then
		drawRanking = Ranking.add(Lang.Rank.FestivalDrawYBRank, 1000)
		if drawRanking and not Ranking.load(drawRanking, Lang.Rank.FestivalDrawYBRank) then
			Ranking.addColumn(drawRanking, "name")
		end
	end
end

function RankingEnd()
	local wishRanking = Ranking.getRanking( Lang.Rank.wishValue )
	if wishRanking then
		Ranking.save(wishRanking, Lang.Rank.wishValue)
	end

	local yesRanking = Ranking.getRanking( Lang.Rank.yestodayWishValue )
	if yesRanking then
		Ranking.save(yesRanking, Lang.Rank.yestodayWishValue)
	end
	
	local fireRanking = Ranking.getRanking( Lang.Rank.sFireRankName )
	if fireRanking then
		Ranking.save(fireRanking, Lang.Rank.sFireRankName)
	end
	
	local yestodayFireRanking = Ranking.getRanking(Lang.Rank.yestodayFireRank)
	if yestodayFireRanking then
		Ranking.save(yestodayFireRanking, Lang.Rank.yestodayFireRank)
	end
	local drawRanking = Ranking.getRanking(Lang.Rank.FestivalDrawYBRank)
	if drawRanking then
		Ranking.save(drawRanking,Lang.Rank.FestivalDrawYBRank)
	end
end

table.insert(MainFnTable, BlessTree_Main)
table.insert(InitFnTable, InitWishRanking)
table.insert(FinaFnTable, RankingEnd)