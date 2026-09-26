--[[File:ActorLoginHandler.lua]]
--To do something about Login and Logout

--#include "ActorDataFunc.lua" once
--#include "data\functions\Systems\FlowerSystem\config.lua" once
--#include "data\config\TasksConfig.inc" once --活动开始配置
--#include "data\config\activityconfig\corpsBattle\corpsBattle.lua" once
--#include "data\config\activityconfig\Dart\DartConfig.lua"  once  --基本设置
--#include "data\config\activity\StdActivityCfg.lua" once
--#include "data\functions\Systems\FlowerSystem\RoseRanking.lua" once  --玫瑰配置
	--#include "data\functions\Tasks\LuoYangBattle\BattleCommon.lua" once
--#include "data\config\activityconfig\KillEvil\KillEvilConfig.lua" once  --装备不可回收时物品
--#include "data\config\activityconfig\Blessing\BlessingConfig.lua" once  --祈福头衔
--#include "data\functions\Activity\Answer\AnswerCommon.lua" once		  --答题
--#include "data\functions\Systems\PaTaSystem\PaTaCommon.lua" once
--#include "data\config\activity\seckill.lua" once	--秒活动
--#include "data\config\quest\MiscQuest.lua" once
--#include "data\functions\Activity\Festival\FestivalAct.lua" once
--#include "data\config\activityconfig\CrossGuildSbk\CrossWorldNumOne.lua" once	
--#include "data\functions\Activity\Festival\FestivalFireCommon.lua" once
--#include "data\functions\player.lua" once -- 角色处理
--#include "data\config\guild\GuildSiegeConfig.lua" once  --行会

-------------------------------------------------------------------------------------------
--死亡后重新登陆的判断
EventCallDispatcher._LoginLoginResurrection = function (sysarg)
	if Actor.getIntProperty(sysarg,PROP_CREATURE_HP) == 0 then
		------------------------------------------------------------
		--掉落操作
		PkDropFunc(sysarg)
		
		--清除击杀者信息
		ClearKillerData(sysarg)
		----------------------------------------------------------
		
		
		if Actor.getIntProperty(sysarg,PROP_CREATURE_HP) == 0 then
	    local maxhp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP) 
			Actor.changeHp(sysarg,maxhp*0.3)
			local actorMp = Actor.getIntProperty(sysarg,PROP_CREATURE_MP)
			local maxmp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)
			--print("actorMp:"..actorMp)
			Actor.changeMp(sysarg,-(actorMp-maxmp*0.3))
		end
        Actor.relive(sysarg,1)
		Actor.addBuff(sysarg,65,1,1,1,15,Lang.ScriptTips.b00009)
	end
end

--上线通知结拜兄弟
function noticeBrother(sysarg)
	local handle = Actor.getBrotherGroupHandle(sysarg)
	if handle == 0 then return end
	
	local idList = System.getBrotherPtrList(handle)
	if idList == nil then return end
	
	local x = 0
	local y = 0
	local name = nil
	name,x,y = Actor.getSceneName(sysarg,x,y)
	local str = string.format(Lang.ScriptTips.jb030,Actor.getName(sysarg),name,x,y)
	--print(str)
	local id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	for i = 1, #idList do
		local ptr = idList[i]
		if ptr ~= nil and ptr ~= sysarg then
			Actor.messageBox(ptr,0,0,str,Lang.ScriptTips.jb031.."/sayBrotherHello,"..id,Lang.ScriptTips.jb032.."/inviteBrotherTeam,"..id, Lang.ScriptTips.x00079.."/cancelFunction", 0,1)
		end
	end
end

--通知领取鲜花系统的时装
function noticeGetFlowerAward(sysarg)
	local week = System.getDayOfWeek()
	if week == 1 then
		local awardRank = Ranking.getRanking(FlowerConfig.awardRank) 
		if awardRank == nil then return	end
		
		local id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		local item = Ranking.getItemPtrFromId(awardRank,id)
		if item ~= nil then
			if Ranking.getSub(item,1) == "-" then
				local sex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
				local sexNotice = FlowerConfig.noticTip[sex+1]
				local str = string.format(Lang.Flower.f028,sexNotice)
				Actor.messageBox(sysarg,0,0,str,Lang.Flower.f029.."/telportScene,"..FlowerConfig.scenePos[1]..","..FlowerConfig.scenePos[2]..","..FlowerConfig.scenePos[3],Lang.Flower.f030.."/cancelFunction,", nil, 0,1,Lang.Flower.f031,24)
				Ranking.setSub(item,1,"n")
				Ranking.save(awardRank,FlowerConfig.awardRank..".lua")
			end
		end
	end
end

EventCallDispatcher.defaultHandlerSetHeadTitle = function (sysarg,arg)
    local nTitleId = arg[1]
    local bDel = false
    if arg[2] == 0 then bDel = true end
    --删除称号
    if bDel == true then
        Actor.setTopTitle(sysarg, nTitleId, false)
       
    end
    local var = Actor.getStaticVar(sysarg)
    if var._headtitlecount == nil then 
        var._headtitlecount = 0
        var._headtitle = {}
    end
    var._headtitlecount = var._headtitlecount + 1
    var._headtitle[var._headtitlecount] = nTitleId
    Actor.setTopTitle(sysarg, nTitleId, true)
    
end
-------------------------------------------------------------------------------------------
EventCallDispatcher.defaultHandlerPlayerLogin = function (sysarg,arg)
	local isFirstLogin = arg[1]
	local isCrossDayLogin = arg[2]

    --腾讯的微端
    if System.getSpid()==99 then
        if isFirstLogin == 1 then
            GetLoginGiftResult(sysarg,1,true)
        end
    end

	EventCallDispatcher._LoginLoginResurrection(sysarg)
	loadActorData(sysarg)
	--跨服限制
	if OnCsActorLoginLmt() == false then 

		ResetSecKill(sysarg)
	
		EventCallDispatcher.handleLoginSetPlantYbParam(sysarg)
	  

		if (isFirstLogin == 1) then
			FirstLoginToLearnSkill(sysarg,arg)
			Actor.addBuffById(sysarg, 37) --新手buff
			--Actor.addBuffById(sysarg, 98) --加血加蓝buff
		--------------------------------------------第一次登陆相关
		end
		
		--宝宝上线加载
		OnAddPet(sysarg)
		--删除上届城主的专属武器
		OnRemoveLastSbkLeader(sysarg)
		
		--删除武林盟主
		--SetWuLinMaster(sysarg)

		SetLuoYangMaster(sysarg)
		--通知结拜兄弟
		--noticeBrother(sysarg)
		--noticeGetFlowerAward(sysarg)
		OnSendInitData(sysarg)
		
		SetAnswerTitle(sysarg)
		SetPaTaState(sysarg)
		SetFlowerTitle(sysarg)

		SetCorpsTitle(sysarg)
		
		SetCrossFirstOneTitle(sysarg)

		SendMyWishBottle(sysarg)

		SendApplyDartLeftTimes(sysarg)

		SendVipWelfare(sysarg)
		
		--充值促销系统
		OnPaySalesActorLogin(sysarg)
		
		--惊喜回馈
		OnSurpriseRetActorLogin(sysarg)
		
		OnSetCppProp(sysarg)

		--在恶魔岭上线就检测
		OnLoginCheckEMoLingAddUpExp(sysarg)
		
		SendUpdatePacksInfo(sysarg)
		--检测副本任务
		QuestFuBen(sysarg)
		
		SetAlchemyTime(sysarg)
		
		TianGuanTimes(sysarg)
		
		ClearCombinedAwardData(sysarg)
			
		LearnSkill(sysarg) --学习技能
		
		SendPlatformData(sysarg)
		
		SendHideWeixin(sysarg)

		--临时处理下，等级》45级的都全部完成
		if Actor.isAchieveFinished(sysarg,195) ==false then
			if Actor.getIntProperty(sysarg,6) >=40 then
				for i=1,5 do
					Actor.triggerAchieveEvent(sysarg,5,8001)
				end
			end
		end
	end
		
	-- 处理玩家登陆
	OnPlayerLogin(sysarg, isCrossDayLogin)
	EscortPrincessTimes(sysarg)
    --搜狗第一次登录 勾选搜狗称号
    if isFirstLogin == 1 and System.getSpid() == 5  then
        local headtitleVal = 0
        local title1 = 36 --35
        headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	    Actor.setUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE, headtitleVal)
	    
    end
       --7k7k第一次登录 勾选7k7k称号
    if isFirstLogin == 1 and System.getSpid() == 14  then
        local headtitleVal = 0
        local title1 = 47 --46
        headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	    Actor.setUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE, headtitleVal)
	    
    end
    --爱奇艺第一次登录- 勾选爱奇艺称号
    if isFirstLogin == 1 and System.getSpid() == 18  then
        local headtitleVal = 0
        local title1 = 48 --47
        headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	    Actor.setUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE, headtitleVal)
	     
    end
    --趣酷第一次登录- 勾选趣酷称号
    if isFirstLogin == 1 and System.getSpid() == 16  then
        local headtitleVal = 0
        local title1 = 50 --49
        headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	    Actor.setUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE, headtitleVal)
	   
    end

  
    --747第一次登录- 勾选747称号
    if isFirstLogin == 1 and System.getSpid() == 21  then
        local headtitleVal = 0
        local title1 = 60 --59
        headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	    Actor.setUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE, headtitleVal)
    end
    --9377第一次登录
     if isFirstLogin == 1 and System.getSpid() == 24  then
        local headtitleVal = 0
        local title1 = 61 --60
        headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	    Actor.setUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE, headtitleVal)
    end   

     if isFirstLogin == 1 then
        Hero.setHeroMana(sysarg, 0)
     end
end


--下发vip玩家是否领过福利
function SendVipWelfare( sysarg )
	if Actor.isVip(sysarg) then
		local sVar = Actor.getStaticVar(sysarg)
		local vipAwardFlag = 0
		if sVar.DayRewardFlag and sVar.DayRewardFlag == 1 then
			vipAwardFlag = sVar.DayRewardFlag
			Actor.setVipAwardFlag(sysarg, vipAwardFlag)
		end
		local netPack = DataPack.allocPacket(sysarg, 139, 61)
		if netPack then
			DataPack.writeByte(netPack, vipAwardFlag)
			DataPack.flush(netPack)
		end
	end
end

function SetFlowerTitle(sysarg)
	--当天魅力值头衔
	local myName = Actor.getName(sysarg)
	local sysVar = System.getStaticVar()
	if sysVar.FesFireTitleName and sysVar.FesFireTitleName == myName then
		--Actor.setTopTitle(sysarg, FestivalWishes.TitleId, true)
	end
	local myId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local sex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)
	local info = RoseRankConfig.RankData[2 - sex]
	if info == nil then return end
	--显示本周第一名
	local ranking = Ranking.getRanking(info.rankFile)
	if ranking then
		for _idx, titleId in ipairs(info.titles) do
			local item = Ranking.getItemFromIndex(ranking, _idx -1 )
			if item and Ranking.getId(item) == myId then
				Actor.setTopTitle(sysarg, titleId, true)
				if _idx == 1 then		--只是第一名提示
					--System.broadcastTipmsg(string.format(info.noticeStr, myName, myName), ttScreenCenter+ttChatWindow)
				end
				return
			end
		end
	end
end

function SetAnswerTitle( sysarg )
	local myName = Actor.getName(sysarg)
	local sysVar = System.getStaticVar()
	local lastRanking = Ranking.getRanking( Lang.Rank.LastWeekAnswer )
	if lastRanking then
		local item = Ranking.getItemFromIndex(lastRanking, 0)
		if item then
			local topName = Ranking.getSub(item, 0)
			if topName == myName then
				--Actor.setTopTitle(sysarg, AnswerConfig.TitleId, true)
			end
		end
	end
	--处理文采值是否过期
	local sVar = Actor.getStaticVar(sysarg)
	if sVar.AnswerPoints then
		if sysVar.AnswerResetDt and sVar.LastGetAnswerPtDt and sysVar.AnswerResetDt > sVar.LastGetAnswerPtDt then
			sVar.AnswerPoints = nil
			sVar.LastGetAnswerPtDt = nil
		else
			-- PROP_ACTOR_KNOWLEDGE_POINT 改为了 PROP_ACTOR_CURRENT_HEAD_TITLE, 如果以后前端还需要 sVar.AnswerPoints 这个就话就单独下发吧
			--Actor.setUIntProperty(sysarg, PROP_ACTOR_KNOWLEDGE_POINT, sVar.AnswerPoints)
		end
	end
end

function sayBrotherHello(sysarg,arg)
	if arg == nil then
		return
	end
	local ptr = System.getEntityPtrByActorID(arg)
	if ptr ~= nil then
		--Actor.sendPrivateChatMsg(sysarg,ptr,Lang.ScriptTips.jb033)
	end
end

function inviteBrotherTeam(sysarg,arg)
	if arg == nil then
		return
	end
	local ptr = System.getEntityPtrByActorID(arg)
	if ptr ~= nil then
		Actor.inviteJoinTeam(sysarg,ptr)
	end
end

function SetLuoYangMaster( sysarg )
	local sysSVar = System.getStaticVar()
	local oldMaster = sysSVar.luoyangMaster
	if oldMaster then
		local guildId = oldMaster[2]
		if guildId > 0 and Actor.getGuildId(sysarg) == guildId then			
			local myId = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
			local leaderId = Guild.getGuildLeaderId(guildId)
			if leaderId == myId then
				setGuildTopTitle(guildId, true)
			end
		end
	end
end

--设置武林盟主
function SetWuLinMaster(sysarg)
	if not WuLinZhengBaConst then return end
	local config = WuLinZhengBaConst
	local sval = System.getStaticVar()
	local FinalOne = sval.WuLinZhengBaFinalOne			-- 取出冠军数据
	local userId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	if not FinalOne or userId ~= FinalOne[8] then
		--去除旧盟主头衔
		if config.LeaderTopTitleId then
			Actor.setTopTitle(sysarg, config.LeaderTopTitleId, false)
		end
		--删除旧的武林盟主
		Actor.setSocialMask(sysarg, smIsWulinMaster, false)
		--删除旧的称号
		if config.LeaderTitleId then 
			if Actor.HasTitle(sysarg, config.LeaderTitleId) == true then
				Actor.GiveupTitle(sysarg, config.LeaderTitleId)
			end
		end
	elseif userId == FinalOne[8] then
		--设置武林盟主头衔
		if config.LeaderTopTitleId then
			Actor.setTopTitle(sysarg, config.LeaderTopTitleId)
		end

		--设置社会关系为武林盟主
		Actor.setSocialMask(sysarg, smIsWulinMaster, true)
		
	end
end


function OnSendInitData( sysarg )
    if System.isCrossServer() == true then return end
	--装备回收
	local netPack = DataPack.allocPacket(sysarg, 7, 8)
	if netPack then
		DataPack.writeByte(netPack, 1)
		DataPack.writeInt(netPack, #KillEvilConfig.NoDropItems)
		for _, itId in ipairs(KillEvilConfig.NoDropItems) do
			DataPack.writeInt(netPack, itId)
		end		
		DataPack.flush(netPack)
	end
end

--发送个人押镖剩余次数
function SendApplyDartLeftTimes(sysarg)
    if System.isCrossServer() == true then return end
	local var = Actor.getStaticVar(sysarg)

	if var.days.darttms == nil then
		var.days.darttms = 0
	end

	local maxTimes = StdActivityCfg.DuoBeiYaSong.maxEscort
	local pack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sDartSurplusTimes) --分配一个数据包
	if(pack~=nil) then
		DataPack.writeInt(pack,math.max(0, maxTimes - var.days.darttms))

		DataPack.flush(pack) --向客户端发送
	end
end

--秒活动副本参加数据
function ResetSecKill(sysarg)
	local lastLogoutTime = Actor.getLastLogoutTime(sysarg)
	local loginTime = System.getCurrMiniTime()
	
	-- print(Actor.getIntProperty(sysarg, PROP_ACTOR_WORK1DAY))
	-- print(Actor.getIntProperty(sysarg, PROP_ACTOR_WORK2DAY))
	-- print(Actor.getIntProperty(sysarg, PROP_ACTOR_WORK3DAY))
	
	if System.isSameDay(loginTime, lastLogoutTime) == true then
		return
	end
	
	local config = SecKill
	if not config then return end
	local circle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	if circle > 0 then return end
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	local maxId = 1
	for k, v in ipairs(config) do
		if v.id > maxId then
			maxId = v.id
		end
		if v.level == 0 or level < v.level then
			--Actor.setWorkDayMask(sysarg, 0, v.id, false)
			Actor.setWorkDayMask(sysarg, 1, v.id, true)
			Actor.setWorkDayMask(sysarg, 2, v.id, true)
			Actor.setWorkDayMask(sysarg, 3, v.id, true)
		end
	end
	
	for i=(maxId+1), 64 do
		Actor.setWorkDayMask(sysarg, 0, i, true)
	end
end

--设置第一战队的头衔
function SetCorpsTitle(sysarg)

	--[[local dvar = System.getStaticVar()

	if dvar.CorpsBattleWinId == nil then
		dvar.CorpsBattleWinId = 0
	end
	
	local nCorpsid = Actor.getCorpsId(sysarg)
	if nCorpsid > 0 and nCorpsid == dvar.CorpsBattleWinId then
		--Actor.setTopTitle(sysarg, corpsBattleConfig.corpsTitleId,true)
	end]]--
end


--设置天下第一头衔
function SetCrossFirstOneTitle(sysarg)
	local pRanking = Ranking.getRanking(CrossWorldOneConfig.WorldOneRankName)
	if pRanking then
		local pItem = Ranking.getItemFromIndex(pRanking,0)
		if pItem then
			if Ranking.getId(pItem) == Actor.getIntProperty( sysarg, PROP_ENTITY_ID ) then
				--Actor.setTopTitle(sysarg,CrossWorldOneConfig.nTitleId,true)
			end
		end
	end
end

--设置c++上的属性值
function OnSetCppProp(sysarg)
	local sVar = Actor.getStaticVar(sysarg)
	local awardFlag = sVar.GuildAwardFlag or 0
	local todayCoin = sVar.GuildTodayCoin or 0
	Actor.setGuildCoinAwardFlag(sysarg, awardFlag, todayCoin)
end

function OnRemoveLastSbkLeader(sysarg)
		
	local newSbkLeaderId = Guild.getSbkCityOwner()
	--local oldSbkLeaderId = Guild.getLastSbkOwnerId()
	local actorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	if newSbkLeaderId ~= actorId then  --
		local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
		local nBuffType = 12
		if nJob == 2 then 
			nBuffType = 16; 
		elseif nJob == 3 then 
			nBuffType = 20; 
		end
		Actor.delBuff(sysarg,nBuffType,206)
	end
	
	local nItem = Item.getItemByType(sysarg,1,true)
	if nItem then
		if Item.getItemId(nItem) == 834 and Item.getItemProperty(sysarg, nItem, Item.ipItemLuck, 0) > 7	then
			Item.setItemProperty(sysarg, nItem, Item.ipItemLuck, 7);
		end
	end
end

function OnAddPet(sysarg)
	--宝宝上线加载

	local var = Actor.getStaticVar(sysarg)
	if var.petInfo then
		local ai = {260, 261, 262}
		local petId = var.petInfo[1]
		local nCurHp = var.petInfo[2]
		local nIndex = Pet.addPet(sysarg,petId,1,ai[petId-255],0)
		local petPtr = Pet.getPetById(sysarg,nIndex)
		var.petId = nIndex
		Actor.setIntProperty(petPtr,PROP_CREATURE_HP,nCurHp)
		Actor.setSocialMask(sysarg,smisHasPet,true)
		if var.addTempAck and var.addTempAck[1] then
			local nCurTime = System.getCurrMiniTime()
			if nCurTime - var.addTempAck[1]	< 0 then
				local combatAttr = {}
				for i = 13,22 do	--最小物理攻击属性开始到最大魔法防御TypeId
					table.insert(combatAttr,Actor.getIntProperty(petPtr,i))
				end
				
				local attrType = {9,11,13,15,17,19,21,23,25,27}
				for key,value in ipairs(attrType) do
					Pet.setIntAddAttr(petPtr,value,combatAttr[key]*(var.addTempAck[2]-1))
				end
				Actor.collectOperate(petPtr,0)
				
				local npack = DataPack.allocPacket(sysarg, 34, 1)
				if not npack then return end 
				DataPack.writeInt(npack,var.addTempAck[1]-nCurTime)
				DataPack.writeByte(npack,var.addTempAck[2])	
				DataPack.flush(npack)
			else
				var.addTempAck = nil
			end
		end
	else
		Actor.setSocialMask(sysarg,smisHasPet,false)
	end 
end

function OnLoginCheckEMoLingAddUpExp(sysarg)	
	if System.isCrossServer() ==true then
		return 
	end

	local var = Actor.getStaticVar(sysarg)	
	if var.EMoLingAddUpExp ~= nil and var.EMoLingAddUpExp > 0 then
		-- 弹窗提示到NPC领取经验
		Actor.sendTipmsg(sysarg, "您有经验没有领取, 请到<(c0xFF00FF00)威龙城>的<(c0xFF00FF00)炼狱>处领取", ttDialog)
	end
end

function QuestFuBen(sysarg)

	if not AcceptQuestCfg then return end

	for _,QuestData in pairs(AcceptQuestCfg) do
		
		local nFatherQuest = Actor.isFinishQuest(sysarg,QuestData.FatherQuestID)
		local nCurQuest = Actor.isFinishQuest(sysarg,QuestData.CurQuestID)
		if nFatherQuest and not nCurQuest then
			local Hfuben = Fuben.createFuBen(QuestData.FubenID)
			Actor.enterFuBen(sysarg,Hfuben,QuestData.SceneID,unpack(QuestData.Pos))
			return
		elseif nCurQuest and not Actor.canFinishQuest(QuestData.SonQuestID) and not Actor.isFinishQuest(sysarg,QuestData.SonQuestID) then
			local Hfuben = Fuben.createFuBen(QuestData.FubenID)
			Actor.enterFuBen(sysarg,Hfuben,QuestData.SceneID,unpack(QuestData.Pos))
			return
		end
	end
	
end

function SetAlchemyTime(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	if not var.AlchemyTime then
		return
	end
	
	if var.AlchemyTime > 0 then
		Actor.addTimer(sysarg,ActorTimerIds.Alchemy,1000)
	end
end

function TianGuanTimes(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local times = InitTimeGuanTimes(sysarg)
	UpdateTimeGuanTimes(sysarg,times)
end

function EscortPrincessTimes(sysarg)
	
	--local var = Actor.getStaticVar(sysarg)
	--local d = var.d

	--if d[80] then
	--	UpdateEscortPrincessTimes(sysarg,d[80])
	--end
end

function ClearCombinedAwardData(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	
	local CombineDays = System.getDaysSinceCombineServer()
	if CombineDays <= 5 and CombineDays > 0 then

		if not var.LastCombineTimeTime then
			var.LastCombineTimeTime = 0
		end
		local nCombineTime = System.getServerCombineTime()
		if nCombineTime > var.LastCombineTimeTime then
			ClearActorCombinedFlag(sysarg)
			 var.LastCombineTimeTime = nCombineTime
		end
	else
		ClearCombinedFlag(sysarg)
	end
end

-- datetime：活动时间（字符串），格式：2016-1-1 2016-1-15
function AllActivityButtonState(sysarg,Type,State, datetime)
	if System.isCrossServer() == true then return end
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sActivityIconStatus)
	DataPack.writeByte(netPack,Type)  	--类型 ，对应客户端图标图片的ID
	DataPack.writeByte(netPack,State)	--0：隐藏， 1：显示
	if State ~= 0 then -- 开启
		DataPack.writeUInt(netPack,0) -- 开启时间
		DataPack.writeUInt(netPack,0) -- 结束时间
	end
	
	if datetime ~= nil then
		DataPack.writeString(netPack, datetime)
	end
	
	DataPack.flush(netPack)	
end

function ClearActorCombinedFlag(sysarg)
	
	local var = Actor.getStaticVar(sysarg)

	if var.CombineLoginGift then var.CombineLoginGift = nil end
	if var.CombineCumulativeFlag then var.CombineCumulativeFlag = nil end
	if var.SuperBagGift then var.SuperBagGift = nil end
	if var.CombineCumulative then var.CombineCumulative = nil end
	if var.CombineLotteryScore then var.CombineLotteryScore = nil end
	if var.CombineLotteryId then var.CombineLotteryId = nil end
	if var.CombineLoginDay then var.CombineLoginDay = nil end
end

function ClearCombinedFlag(sysarg)
	
	ClearActorCombinedFlag(sysarg)
	local sVar = System.getStaticVar()
	if sVar.CombineSbkLeader then sVar.CombineSbkLeader = nil end
	if sVar.CombineSbkMasses then sVar.CombineSbkMasses = nil end	
end

function LearnSkill(sysarg)
	
	local vLv = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE);
	local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	
	local skillId = 
	{
		--战士
		{},	
		--法师
		{},	
		 --道士
		{{skill_Id = 71,needLevel = 80,needCircle = 0}},  --学习技能：技能ID，达到所需的等级、转数
	}
	local nJobSkill = assert(skillId[nJob],"skill table is nil")
	for _,skill in ipairs(nJobSkill) do
		if Actor.getSkillLevel(sysarg,skill.skill_Id) <= 0 and Actor.checkActorLevel(sysarg,skill.needLevel,skill.needCircle) then
			-- if vLv > 0 then
			-- 	Actor.startLearnSkill(sysarg,skill.skill_Id,3)
			-- else
				Actor.startLearnSkill(sysarg,skill.skill_Id,1)
			-- end
		end
	end		
end

function SendPlatformData(sysarg)
	
	local nSpId = System.getSpid()
	
	local var = Actor.getStaticVar(sysarg)
	if nSpId == 11 then
		if var.Send7KPayFlag then
			local pack = DataPack.allocPacket(sysarg, 139, 130)
			DataPack.writeByte(pack,1)
			DataPack.flush(pack)
		end
	end
	if nSpId == 17 then
		if var.SendBtyouPayFlag then
			local pack = DataPack.allocPacket(sysarg, 139, 130)
			DataPack.writeByte(pack,1)
			DataPack.flush(pack)
		end
	end
	if nSpId == 2 then
		if var.SendXYPayFlag then
			local pack = DataPack.allocPacket(sysarg, 139, 130)
			DataPack.writeByte(pack,1)
			DataPack.flush(pack)
		end
	end

end

--如果领取微信礼包就不下发
function SendHideWeixin(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.HasGetWeixinGiftFlag then
		local pack = DataPack.allocPacket(sysarg,139,131)
		DataPack.writeByte(pack,1)
		DataPack.flush(pack)
	end
end

--在线跨天
function OnActorEventNewDayAcrrive(sysarg,arg)
	-- 注意：因为要记录昨天的数据，所以要在清除每日数据之前调用
	SaveHistoryTaskData(sysarg)
	
	OnPlayerCrossDay(sysarg)	
	
	local nYear,nMonth,nDay = System.getDate();
	if nDay == 1 then
		local var = Actor.getStaticVar(sysarg)
		var.SigninGift = {} -- 跨月清0
		var.ljqdAward = nil;		-- 累计签到奖领取标记
	end
	
	SynchDataWhenLoginOrCrossDay(sysarg)
	
	OnLuaEvent(LuaEventId.ActorNewDayAcrrive, sysarg)
	
	--OnActorOnlineCrossDayFuGuiShou(sysarg)
	
	--OnDEggPlayerOnlineCrossDay(sysarg) -- 双“蛋”活动
end

-- 新的一天6点
function OnActorEventNewDaySixClock(sysarg, arg)
	--屏蔽每日清0
	-- local var = Actor.getStaticVar(sysarg)
	-- var.LXTimes = nil;						-- 翅膀每阶亮星次数
	-- loadSwingInfo(sysarg, var);
end

EventCallDispatcher.MiniLogin = function (sysarg,arg)
    --print("微端登录")
	OnFinish_Liveness(sysarg,3)--触发活跃度
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.WDLogin = 1
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeMiniLogin, EventCallDispatcher.MiniLogin)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogin, EventCallDispatcher.defaultHandlerPlayerLogin)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeSetHeadTitle, EventCallDispatcher.defaultHandlerSetHeadTitle)

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeNewDayArrive, OnActorEventNewDayAcrrive)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeNewDaySixClock, OnActorEventNewDaySixClock)