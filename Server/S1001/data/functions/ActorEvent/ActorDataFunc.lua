--lua script
--#include "data\envir\FubenCountConfig.lua" once

--#include "data\functions\guildOperate\CallGuildBossEnvent.lua" once
----#include "data\functions\Activity\WuLinZhengBa\WuLinZhengBa_Common.lua" once
--#include "data\functions\NpcMiscFun\SanRenNPC\HuoDong\WuLinCommonFunc.lua" once	2016/12/26 zer 移动更新
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "data\functions\Activity\CorpsBattle\CorpsBattleCommon.lua" once
--#include "data\config\quest\MiscQuest.lua" once
--#include "data\config\quest\EntrustReward.lua" once
--#include "data\functions\Activity\Festival\OldPlayerBack.lua" once  --老玩家回归
--#include "data\config\godWealth\WealthEventConfig.lua" once
--#include "data\functions\ActorEvent\DoCrossDayData.lua" once	--处理跨天数据

LocalDT.MEDITIME = 21600        
----------------------------------------------------------------------------------------


--好友祝贺次数数据
function loadFriendCongCount(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local friendCong = var.friendCong
	if friendCong == nil then
		var.friendCong = {}
		friendCong = var.friendCong
	end
	if friendCong[1] == nil then
	  friendCong[1] = 20
	end
	if friendCong[2] == nil then 
		friendCong[2] = System.getTomorrow()
	end
	friendCong[1] = 20
	friendCong[2] = System.getTomorrow()
end
--读取系统设置数据返回给客户端 
function loadSystemInstallDataFunc(sysarg)
  local var = Actor.getStaticVar( sysarg )
  local SystemInstall = var.SystemInstall
  if SystemInstall == nil then
    var.SystemInstall = {}
    SystemInstall = var.SystemInstall
    SystemInstall[1] = 0
  end
	--print(var.systemInstall)
	--清除以前初始为315的数据错误
	if var.systemInstall then var.systemInstall = nil end	--用于清除无用错误数据 对于旧用户有效，没实际意义
	
  if SystemInstall[1] ~= nil then 
    local npack = DataPack.allocPacket(sysarg,139,7)  --申请一个数据包
    if npack == nil then return end
    DataPack.writeInt(npack,SystemInstall[1])
    DataPack.flush(npack)
	
  end 
end

--初始化每天用副本挑战书的次数
function loadFubenChallengeBook(sysarg)
	local var = Actor.getStaticVar( sysarg )
	local fbBC = var.fbBC
	if fbBC == nil then 
	  var.fbBC = {}
	  fbBC = var.fbBC
		fbBC[1] = 2 
		fbBC[2] = 1  
		fbBC[3] = 1
  end
end

--清除以前没完成的任务
function removeOldQuests( sysarg )
	for k, qid in ipairs(NewDayRemoveQuests) do
		if Actor.hasQuest(sysarg, qid) then
			Actor.removeQuestById(sysarg, qid)
		end
	end
end

local function ResetGuardData(sysarg)	
	local var = Actor.getStaticVar(sysarg)
	local guardCnt = var.days.guardCount
	if (guardCnt ~= nil) then
		var.days.guardCount = 0		
	end
end

--保存玩家的PK模式数据
function savePKModeDataFunc(sysarg)
   local var = Actor.getStaticVar(sysarg)
  if System.isCrossServer() then return end
	local pkmode = var.pkmode
  if pkmode == nil then 
		var.pkmode = {}
		pkmode = var.pkmode
	end
	
	pkmode[1] = Actor.getPkMode(sysarg)
	--print("savePKModeDataFunc!!!!!!!!!!PKMODE:"..pkmode[1])
end

--载入玩家的PK模式数据
function loadPKModeDataFunc(sysarg)
  if System.isCrossServer() then return end
  local var = Actor.getStaticVar( sysarg )
  pkmode = var.pkmode
	if pkmode == nil then 
	  --print("pkmode is nil !!")
	  var.pkmode = {}
	  pkmode = var.pkmode
		--Actor.setPkMode(sysarg,fpZY)		
	else	
	  --print("pkmode:"..pkmode[1])
	  if pkmode[1]== nil then pkmode[1] = fpPeaceful end
		if pkmode[1]~= nil then 
			Actor.setPkMode(sysarg,pkmode[1])
			--print("loadPKModeDataFunc:"..Actor.getPkMode(sysarg))
		end
	end
		
end
--保存玩家的帮派在职时间
function saveGuildZzTimeFunc(sysarg,var)
	--print("set guild time !!")
	local gZztime = Actor.getGuildZzTime(sysarg)
	--print("Zztime:"..gZztime)
  local guildzz = var.guildzz
	if guildzz == nil then
		var.guildzz = {}
		guildzz = var.guildzz
	end
	guildzz[1] = Actor.getGuildZzTime(sysarg)
	guildzz[2] = Actor.getGuildWealTime(sysarg)
end
--载入玩家的帮派在职时间
function laodGuildZzTimeFunc(sysarg)
	
 local var = Actor.getStaticVar( sysarg )
 local guildzz = var.guildzz
	if guildzz == nil  then 
		Actor.setGuildZzTime(sysarg,0) 
	else
	--print("guildzz:")
	  if guildzz[1] ~= nil then  
	  	Actor.setGuildZzTime(sysarg,guildzz[1])
	  	
		end	
		if guildzz[2] ~= nil then 
			Actor.setGuildWealTime(sysarg,guildzz[2])
		end
	end
end

--载入和处理打坐时间相关数据
function loadDazuoDatas(sysarg)
  local var = Actor.getStaticVar( sysarg )
  local medi = var.medi
		if medi == nil or medi[1] == nil then
	  	
	  	var.medi = {}
	  	medi = var.medi
	  	Actor.setDefaultPracticeTime(sysarg,LocalDT.MEDITIME)
	  	--print("medi")
		else
			--print("TimeData[1]:"..medi[1])
	  	if medi[1] ~= nil then 
	  	  if medi[1] > LocalDT.MEDITIME then
	  	  	medi[1] = LocalDT.MEDITIME
	  	  end
	  		Actor.setDefaultPracticeTime(sysarg, medi[1])
			end	  
	  end
end

--退出时保存剩下打坐时间相关数据
function saveDazuoDatas(sysarg,var)
  local medi = var.medi
	if medi == nil then
    --print("medi:")
		var.medi = {}
	  medi = var.medi
	end
  medi[1] = 0
	--print("savedazuotime:"..medi[1])
end
--初始化副本次数
function FubenCountInit(sysarg)
  local var = Actor.getStaticVar(sysarg)
	local fb = var.fb
	if fb == nil then
    --print("fbData is nil !!")
	  var.fb = {}
	  fb = var.fb
	end
	for i=1 ,#FubenCountConfig do
		fb[i] = FubenCountConfig[i]
	end
end


--退出时保存副本数据
function saveOnLogoutFuBen( sysarg ,var)
   local fb = var.fb
  if ( fb == nil ) then
	  var.fb = {}
	  fb = var.fb
  end
  for i = 1 ,6 do
	   fb[i] = Actor.getDayFubenCount(sysarg,i)		--将玩家进入副本的次数保存起来
     --print("out fb[i]:"..fb[i])
  end
  
end
--设置刺探阵营次数和领取俸禄次数 
function setSpyCampCount(sysarg)
  local var = Actor.getStaticVar( sysarg )
  var.days.spyCamp = nil  
  var.days.ZYcount = 1
end

--重置每天领取梦想神符次数 
function resetGetWishItem(sysarg)
  -- 每天领取梦想神符
  local var = Actor.getStaticVar( sysarg )
  if (var.days.GetWishItem ~= nil) then
  	var.days.GetWishItem = nil
  end
end

--重置玩家每日PK获取或掉落经验次数
function resetPkExpGetOrDropTimes(sysarg)
	local svar = Actor.getStaticVar(sysarg)
	local data = svar.killerData	--击杀信息
	if not data then 
		svar.killerData = {}
		data = svar.killerData
	end
	data[4] = nil --每日PK经验掉落次数
	data[5] = nil --每日PK经验获得次数
end

--重置武林盟主禁言数据
function resetWuLinMastetShutupData(sysarg)
	-- 每天禁言列表
	local svar = Actor.getStaticVar( sysarg )
	if (svar.days.ShutupList ~= nil) then
		svar.days.ShutupList = nil
	end
end

-- 重置祈福树活动数据
function resetPrayTreeData(sysarg)
	-- 每天领取雪人礼物
	local svar = Actor.getStaticVar( sysarg )
	svar.days.GetPraySnowmanAward = nil
end

function clearBookQuestInfo(sysarg)
	 local sVar = Actor.getStaticVar( sysarg )
	 if sVar.days.CoinQuestTimes then
		sVar.days.CoinQuestTimes = nil
	 end
end

function noticeDoBookQuest(sysarg)
    if System.isCrossServer() == true then return end
	--指引玩家去npc处接任务
	local todayTimes = Actor.getQuestTimes(sysarg, EntrustReward.BookQuestId)
	if todayTimes == 0 then
		local myLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
		if myLevel >= EntrustReward.BookQuestLevel then
			local netPack = DataPack.allocPacket(sysarg,6, 16)  --申请一个数据包
			if netPack then
				DataPack.writeWord(netPack, EntrustReward.BookQuestId)
				DataPack.flush(netPack)
			end
		end
	end
end

function loadBookQuestInfo( sysarg )
	local sVar = Actor.getStaticVar(sysarg)
	local times = sVar.days.CoinQuestTimes or 0
	local flushLv = sVar.BookFlushLevel  or 0
	local surpItemId = sVar.BookSurpItemId  or 0
	Actor.setQuestBookInfo(sysarg, times, flushLv, surpItemId)

	noticeDoBookQuest(sysarg)
end


----------------------------------------------------------------------------------------
--玩家登陆时读取玩家的.[数据参数：玩家的ActorID；]
function loadActorData(sysarg) 
	local var = Actor.getStaticVar( sysarg )
	if not var.days then
		var.days = {};
	end
	calcOldPlayerBack(sysarg)
	
	local nLast = Actor.getLastLogoutTime(sysarg)	--上次下线的时间
	if (nLast == 0) then							--新注册玩家
		Actor.setGuildZzTime(sysarg,0)
		Actor.setGuildWealTime(sysarg,0)
		ResetDayFubenTimes(sysarg)
        if not System.isCrossServer() then
            Actor.setPkMode(sysarg,fpPeaceful)	--新玩家PK模式
        end
		
		Actor.setDefaultPracticeTime(sysarg, LocalDT.MEDITIME)
		loadFubenChallengeBook(sysarg)
		loadFriendCongCount(sysarg)
		Actor.openDialogs(sysarg,diStartPlay)
	-- end	
  --各种处理 
	else
		checkFirstQuest(sysarg)
		if (nLast < System.getToday()) then  	--昨天下线的
			ResetDayFubenTimes(sysarg)
			--OnCrossDayOpt(sysarg)
			removeOldQuests(sysarg)
			Actor.setDefaultPracticeTime(sysarg, LocalDT.MEDITIME)
			loadFubenChallengeBook(sysarg)
			loadFriendCongCount(sysarg)		
			ResetGuardData(sysarg)	
			setSpyCampCount(sysarg)   --设置玩家每天的刺探阵营次数和领取俸禄次数
			
			resetGetWishItem(sysarg)  --重置每天领取梦想神符次数
			resetPkExpGetOrDropTimes(sysarg)	--重置玩家每日PK获取或掉落经验次数
			resetWuLinMastetShutupData(sysarg)	--重置武林盟主禁言信息
			resetPrayTreeData(sysarg)	-- 重置祈福树活动数据
			ResetDayData(sysarg)
			clearBookQuestInfo(sysarg)
			
			--Actor.clearEquipSharp(sysarg, false)		--这里的数据还没同步到前端，只修改服务器的值

			local days = var.days;
			-- 每日劫镖次数
			if (days.lootCampDartTimes ~= nil) then
				days.lootCampDartTimes = nil
			end
			
			--经验宝盒的次数
			days.expbox1 = nil
			days.expbox2 = nil
			days.xiuweiBoxTime = nil
			days.dmkjmj = nil
			days.isVoteForImpeach = nil
			days.VipFreeTelCnt = nil
			days.ExtCSValToday = nil
			days.GuildDartOpenTimes = nil
			days.GuildBossTimes1 = nil
			days.GuildBossTimes2 = nil
			days.mygetSbkWealState = nil
			days.getConsumeAwardFlag = nil
			days.jadeTime = nil
			days.darttms = nil  --每日押镖次数

			days.FreshFreeTimes = nil

			days.enterMiYueTimes = nil
			days.VipRewardDate = nil

			days.GetBaiFashionFlag = nil

			-- 每天领取玫瑰种子
			days.getGrowSeed = nil
		
			-- 每天免费叫鸡
			days.hotSpring = nil
			days.InteractTimes = nil		--每日重置太虚灵泉特殊互动的次数
		
			--九天冰宫 深渊烈域
			days.heavenFlag = nil
			days.HellFlag = nil
			
			--print("nQuestId:"..WealthEventConfig.events[9].nQuestId[1])
			if Actor.hasQuest(sysarg,WealthEventConfig.events[9].nQuestId[1]) == true then		--有财神任务，放弃财神任务
				Actor.giveupQuest(sysarg,WealthEventConfig.events[9].nQuestId[1])
			end
	
			Actor.setFinishState(sysarg,1)
			Actor.setNextRollTime(sysarg,0)
		else
			loadDazuoDatas( sysarg )         --读取玩家当天打坐剩下时间
		end
		--[[最初始的任务
		local zy = Actor.getIntProperty( sysarg, PROP_ACTOR_ZY )
		if zy == 1 then --无忌
			if not Actor.isFinishQuest(sysarg,1866) and not Actor.hasQuest(sysarg,1866) then
				Actor.addQuest(sysarg,1866)
				Actor.npcTalkByName(sysarg,Lang.EntityName.n00441)
			end
		elseif zy == 2 then
			if not Actor.isFinishQuest(sysarg,1867) and not Actor.hasQuest(sysarg,1867) then
				Actor.addQuest(sysarg,1867)
				Actor.npcTalkByName(sysarg,Lang.EntityName.n00446)
			end
		else
			if not Actor.isFinishQuest(sysarg,1868) and not Actor.hasQuest(sysarg,1868) then
				Actor.addQuest(sysarg,1868)
				Actor.npcTalkByName(sysarg,Lang.EntityName.n00451)
			end
		end]]
	end
	
	laodGuildZzTimeFunc(sysarg)    --载入玩家帮派在职时间
	loadPKModeDataFunc(sysarg)				--载入玩家的PK模式
	loadSystemInstallDataFunc(sysarg)

	OnActorLoginCorpsOp(sysarg)
	loadBookQuestInfo(sysarg)
	loadSwingInfo(sysarg, var);
	if var.days then
		loadSignAgain(sysarg, var.days);
		sendAccumulateSignAwardFlag(sysarg,var)
	end	
	return true
end

--玩家退出时保存玩家的数据[参数：玩家的actorID；]
function SaveData(sysarg)
  local var = Actor.getStaticVar( sysarg )
  --各种处理
  --saveOnLogoutFuBen( sysarg,var )  --副本
  saveDazuoDatas(sysarg,var)       --保存当天打坐剩下时间
	saveGuildZzTimeFunc(sysarg,var)        --帮派在职时间
    if not System.isCrossServer() then
        savePKModeDataFunc(sysarg)					--玩家的PK模式数据
    end
	
	--CleanGuildBossOp(sysarg)	--清除找出的帮派斗魂
	
	OnExitCorpsSceneOp(sysarg)		--
end

--------------------------------------------------------------------------------------------------------------------
--返回玩家需要的数据给客户端[参数列表：子系统ID,消息号ID,数据指针]
function loadActorDataFunc(sysarg,systemid,megid,pack)
  local hook = Actor.getStaticVar( sysarg ).hook
  if hook == nil or hook == {} then 
	  local npack = DataPack.allocPacket(sysarg,systemid,megid)  --申请一个数据包
	  if npack == nil then
		--print("npack:nil")
		return
	  end
	  DataPack.writeInt(npack,0)
	  DataPack.flush(npack)
	  return
  end
  local npack = DataPack.allocPacket(sysarg,systemid,megid)  --申请一个数据包
  if npack == nil then
	--print("npack:nil")
	return
  end
  local ncount = table.getn(hook)/2
  --print("ncount:"..ncount)
  DataPack.writeInt(npack,ncount)
  for i = 1 ,ncount*2 do 
	DataPack.writeInt(npack,actorGameData[i])
  end
  DataPack.flush(npack)
end

--保存玩家数据的函数，[参数1：数据ID；参数2：玩家的ActorID；参数3：需要保存到玩家文件的数据表]
function saveActorDataFunc(sysarg,systemid,megid,pack)
  
  local hook = Actor.getStaticVar( sysarg ).hook
  if hook == nil then
	hook = {}
  end
 
  local nCount = DataPack.readInt(pack)
  --print("nCount:"..nCount)
  for i = 1,nCount*2 do
	hook[i] = DataPack.readInt(pack)
  end
end

-- 加载翅膀信息
function loadSwingInfo(sysarg, var)
	local LXTimes = var.LXTimes;
	if not LXTimes then
		LXTimes = 0;
	end
	
--	local swingid = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGID);
--	local appearanceID = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGAPPEARANCE);
--	local currStartLV = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWING_EXP);
	local netPack = DataPack.allocPacket(sysarg, 52, 1)
--	DataPack.writeUInt(netPack, swingid);
--	DataPack.writeUInt(netPack, appearanceID);
--	DataPack.writeByte(netPack, currStartLV);
	DataPack.writeUInt(netPack, LXTimes);
	DataPack.flush(netPack);
end

-- 再签一次标记
function loadSignAgain(sysarg, days)
    if System.isCrossServer() == true then return end
	local qdAgain = 1;
	if not days.qdAgain then
		qdAgain = 0;
	end
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sQDAgainFlags);
	DataPack.writeByte(netPack,qdAgain); -- 再领一次成功，返回标志
	DataPack.flush(netPack);
end

function sendAccumulateSignAwardFlag(sysarg,var)
    if System.isCrossServer() == true then return end
	if not var and not var.ljqdAward then return end
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sLJQDAwardFlags);
	DataPack.writeUInt(netPack,var.ljqdAward);
	DataPack.flush(netPack);
end