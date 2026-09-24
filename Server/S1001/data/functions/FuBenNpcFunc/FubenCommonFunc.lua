--[[File:FubenCommonFunc.lua]]

--#include "data\language\LangCode.txt" once
--#include "data\envir\FuBen.txt" once
--#include "data\envir\FubenCountConfig.lua" once
--#include "OnEnterFubenFunc.lua" once
--#include "data\envir\specialFb\FubenQuestMap.lua" once
--#include "data\envir\FuBenTongGuan.lua" once
--#include "data\envir\specialFb\MogongConfig.lua" once
--#include "data\functions\StdTask.lua" once
EnterWaitSecs = 10

--返回fubenId在当天购买过几次
function getTodayFBItemTimes( sysarg, fubenId )
	local times = 0
	local actorVar = Actor.getStaticVar(sysarg)
	if not actorVar.fubenItems then
		actorVar.fubenItems = {}
	end
	return actorVar.fubenItems[fubenId] or 0
end

--设置itemId在今天使用过几次
function setTodayFBItemTimes( sysarg, fubenId, times )
	local actorVar = Actor.getStaticVar(sysarg)
	if not actorVar.fubenItems then	
		actorVar.fubenItems = {}
	end
	actorVar.fubenItems[fubenId] = times
end

function GetFuBenName( fbId )
	for _, info in ipairs(FuBen) do
		if info.fbid == fbId then
			return info.fbname
		end
	end
	return ""
end

function CanEnterFuben( memPtr, leaderPtr )
	local sVar = Actor.getStaticVar(memPtr)
	if sVar.ybstate ~= nil and sVar.ybstate == 1 then	--正在押送镖车
		if memPtr == leaderPtr then
			Actor.sendTipmsg(leaderPtr,Lang.ScriptTips.fuben022, ttFlyTip)
		else
			Actor.sendTipmsg(leaderPtr, string.format(Lang.ScriptTips.fuben023,Actor.getName(memPtr)), ttFlyTip)
		end
		return false
	end	
	if Actor.hasState(memPtr, esStateStall) then
		if memPtr == leaderPtr then
			Actor.sendTipmsg(leaderPtr,Lang.ScriptTips.fuben036, ttFlyTip)
		else
			Actor.sendTipmsg(leaderPtr, string.format(Lang.ScriptTips.fuben037,Actor.getName(memPtr)), ttFlyTip)
		end
		return false
	end
	return true
end

function checkEnterFbTimes( sysarg, fubenId )
	local fubenCfg = FuBen[fubenId]
	if not fubenCfg then
		return false
	end
	local fbcount = GetEnterFubenTimes(sysarg, fubenId)
	if fbcount < 1 then
		local questResult = false
		for k, qid in ipairs(fubenCfg.quests or {}) do
			if Actor.hasQuest(sysarg, qid) and not Actor.isFinishQuest(sysarg, qid) and not Actor.canFinishQuest(sysarg, qid) then
				questResult = true
			end
		end
		if not questResult then
			return false
		end
	end
	return true
end

function NoticeNoTimeToFb( sysarg, fubenId )
	local fubenCfg = FuBen[fubenId]
	if not fubenCfg then
		return
	end
	local times = getTodayFBItemTimes(sysarg, fubenId)
	local enterTimesCfg = fubenCfg.enterTimes or 0
	if times >= enterTimesCfg then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben033, ttFlyTip)
		OpenGuideUi(sysarg)
		return
	end
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00015, ttFlyTip)
end

--点击进入副本按钮执行的函数，对玩家进入判断，成功则将玩家传到副本场景里
function StartEnterFb(sysarg, FbID )
	FbID = tonumber(FbID)

	local var = Actor.getStaticVar(sysarg)
	if var.ybstate ~= nil and var.ybstate == 1 then
		Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip) 
		return false
	end
	
	local curFBId = Actor.getFubenId( sysarg )
	if curFBId > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.tf00040,ttDialog)		
		return false
	end

	local challengeid = Actor.getChallenge(sysarg)
	if challengeid ~= 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00019,ttDialog) 
		return false
	end
	local fbdata = FuBen[FbID]
	if ( fbdata == nil ) then
		print("error FuBen["..FbID.."] == nil")
		return false
	end
	
	local groupid = fbdata.groupId
	local circleVal = fbdata.circle or 0
	--进入单人副本模式
	if fbdata.minPlayCount == 1 and fbdata.maxPlayCount == 1 then
		if Actor.checkActorLevel(sysarg, fbdata.minLevel, circleVal) then
			if not checkEnterFbTimes(sysarg, FbID, circleVal) then
				NoticeNoTimeToFb(sysarg, FbID)
				return false
			end
			if not CanEnterFuben(sysarg, sysarg) then
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.fuben036, ttFlyTip)
				--print("Can not enter fuben["..FbID.."]")
				return false
			end
			Hfuben = Fuben.createFuBen(FbID)		 
			if Actor.enterFuBen(sysarg,Hfuben,-1,-1,-1) then	 --进入副本，其中场景坐标按需要更改
				Actor.clearKillMonsterCount(sysarg)
--				if fbdata.groupId ~= 14 then
--					DeductFubenTimes(sysarg, FbID) 
--				end	
					add_enter_fb_times(sysarg, FbID)			
				if OnEnterCopyMap[FbID] then
					OnEnterCopyMap[FbID].OnEnterFubenFunc(sysarg,Hfuben, FbID)
				end
				Actor.closeDialogs(sysarg,diFubenTeam)
				Actor.triggerQuestEvent(sysarg, 39, FbID, 1)
				GetQuestStrByFubenId(sysarg, FbID)
				SetEnterFuben(sysarg)
				return true;
			else
				return false
			end
		else 
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00011, ttFlyTip)                   --输出提示由于等级不够进入不了副本
			return false
		end
	else
		local TeamMemb = LuaHelp.getTeamMemberList(sysarg)		--获取该队伍的成员
		if TeamMemb == nil then
			print("not team") 
			return false
		end
		local captainPtr = TeamFun.getTeamCaptain( Actor.getTeamId(sysarg))
		local useItemsEnter = {}
		local capSceneName, capX, capY = Actor.getSceneName( captainPtr, 0, 0 )
		for k, memPtr in ipairs(TeamMemb) do
			if not Actor.checkActorLevel(memPtr, fbdata.minLevel, circleVal) then
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.tf00068, Actor.getName(memPtr)),ttFlyTip)
				return false
			end
			if not checkEnterFbTimes(memPtr, FbID) then
				if memPtr == sysarg then
					NoticeNoTimeToFb(sysarg, FbID)
				else
					Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.tf00069, Actor.getName(memPtr)), ttFlyTip)
				end				
				return false
			end
			if not CanEnterFuben(memPtr, captainPtr) then
				return false
			end
			if memPtr ~= captainPtr then
				local memSceneName, memX, memY = Actor.getSceneName( memPtr, 0, 0 )
				if capSceneName ~= memSceneName or (math.abs(capX - memX) > 10 and math.abs(capY - memY) > 10) then
					Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.fuben004, Actor.getName(memPtr)), ttFlyTip)
					return false
				end
			end
		end

		if table.getn(TeamMemb) < fbdata.minPlayCount then		--判断队伍的人数是否满足条件
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00001, ttFlyTip)
			return false
		end
		if table.getn(TeamMemb) > fbdata.maxPlayCount then
			--Actor.sendTipmsgWithId(sysarg,tpTeamMemberFull) 		--队伍人数超过最多人数，不能进入副本
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00002,ttFlyTip)
			return false
		end
		Hfuben = Fuben.createFuBen(FbID)
		for k, memPtr in ipairs(TeamMemb) do		--如果满足条件将队伍的成员逐个传送到副本场景				
			Actor.enterFuBen(memPtr,Hfuben,-1,-1,-1)
			Actor.clearKillMonsterCount(memPtr)
			local itemTimes = useItemsEnter[memPtr]
			if itemTimes then
				Actor.removeItem( sysarg, fbdata.itemId, fbdata.itemNum, -1, -1, -1, "enter fuben items", 5 )
				setTodayFBItemTimes( sysarg, FbID, itemTimes + 1 )
			else
				DeductFubenTimes(memPtr, FbID)
			end			
			Actor.closeDialogs(TeamMemb[i],diFubenTeam)	
			Actor.triggerQuestEvent(TeamMemb[i], 39, FbID, 1)
			GetQuestStrByFubenId(TeamMemb[i], FbID)
			SetEnterFuben(memPtr)
			return true;
		end
		if OnEnterCopyMap[FbID] then
			OnEnterCopyMap[FbID].OnEnterFubenFunc(sysarg,Hfuben, FbID)
		end
		
		return true
	end
end

function SetEnterFuben( sysarg )
	local fubenPtr = Actor.getFubenPrt( sysarg )
	if fubenPtr then
		local fbVar = Fuben.getDyanmicVar( fubenPtr )
		local myId = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
		if not fbVar.enterMems then
			fbVar.enterMems = {}
		end
		fbVar.enterMems[myId] = true
	end
end

function EnterFubenAgain(sysarg, fubenId)
	local fubenCfg = FuBen[fubenId]
	if not fubenCfg then
		return false
	end
	local teamFubenPtr = nil
	local hasTeamEnterFB = false
	local myId = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
	local TeamMemb = LuaHelp.getTeamMemberList(sysarg)		--获取该队伍的成员
	for k, memPtr in ipairs(TeamMemb) do
		local fubenPtr = Actor.getFubenPrt( memPtr )
		if fubenPtr and Fuben.getFubenNameByPtr(fubenPtr) == fubenCfg.fbname then
			hasTeamEnterFB = true
			teamFubenPtr = fubenPtr
			local fbVar = Fuben.getDyanmicVar( fubenPtr )
			if fbVar.enterMems and fbVar.enterMems[myId] then
				local fubenHandle = Fuben.getFubenHandle(fubenPtr)
				Actor.enterFuBen(sysarg,fubenHandle,-1,-1,-1)
				return true
			end
		end
	end
	if hasTeamEnterFB then --需要扣次数
		local circleVal = fubenCfg.circle or 0
		if Actor.checkActorLevel(sysarg, fubenCfg.minLevel) then
			if checkEnterFbTimes(sysarg, fubenId) then
				DeductFubenTimes(sysarg, fubenId)
				local fubenHandle = Fuben.getFubenHandle(teamFubenPtr)
				Actor.enterFuBen(sysarg,fubenHandle,-1,-1,-1)
				SetEnterFuben( sysarg )
				return true
			else
				NoticeNoTimeToFb(sysarg, fubenId)
			end
		end
	end
	return false
end

function readyEnterFB( sysarg, fubenId )
	fubenId = tonumber(fubenId)
	local fubenCfg = FuBen[fubenId]
	print("fubenIdfubenIdfubenIdfubenId=============",fubenId)
	if not fubenCfg then
		return
	end
	local teamId = Actor.getTeamId( sysarg )
	if teamId > 0 then
		if fubenCfg.minPlayCount == 1 and  fubenCfg.maxPlayCount == 1 then
			StartEnterFb( sysarg, fubenId )
			return
		end
		if EnterFubenAgain(sysarg, fubenId) then
			return
		end
		local captainPtr = TeamFun.getTeamCaptain( teamId )
		if captainPtr ~= sysarg then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben003, ttFlyTip)
			return
		end
		local circleStr = ""
		if fubenCfg.circle then
			circleStr = string.format(Lang.ScriptTips.fuben042, fubenCfg.circle)
		end
		local enterNotice = string.format(Lang.ScriptTips.fuben002, fubenCfg.fbname, circleStr, fubenCfg.minLevel)
		local capEnsureBtn = string.format("%s/enterTeamFbByLeader,%d", Lang.ScriptTips.tf00063, fubenId)
		local cancelBtn = string.format("%s/cancelTeamFbByLeader,%d", Lang.ScriptTips.tf00064, fubenId)
		Actor.messageBox( sysarg, Actor.getTargetHandle(sysarg), 0, enterNotice, capEnsureBtn, cancelBtn, NULL)
	else
		if fubenCfg.minPlayCount == 1 and  fubenCfg.maxPlayCount > 1 then
			if  checkEnterFbTimes(sysarg, fubenId) then
				local ensureFuncStr = string.format("%s/CreateSingleTeam,%d", Lang.ScriptTips.zf009, fubenId)
				local capCancelBtn = string.format("%s/CancelCreateTeam", Lang.ScriptTips.tf00062)
				Actor.messageBox( sysarg, 0, 0, Lang.ScriptTips.fuben001, ensureFuncStr, capCancelBtn, NULL )
			else
				NoticeNoTimeToFb(sysarg, fubenId)
			end			
			return
		end
		StartEnterFb( sysarg, fubenId )
	end
end

function CancelCreateTeam( sysarg )

end

function CreateSingleTeam( sysarg, fubenId )
	fubenId = tonumber(fubenId)
	Actor.createTeam(sysarg)
	StartEnterFb( sysarg, fubenId )
end

function enterTeamFbByLeader( sysarg, fbId )
	fbId = tonumber(fbId)
	local teamId = Actor.getTeamId( sysarg )
	if teamId > 0 then
		local captainPtr = TeamFun.getTeamCaptain( teamId )
		if captainPtr ~= sysarg then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben003, ttFlyTip)
			return
		end
		StartEnterFb( sysarg, fbId )
	end
end

function cancelTeamFbByLeader( sysarg, fbId )
end

function GetExtBuyTimes( sysarg, groupId )
	local sVar = Actor.getStaticVar(sysarg)		
	return sVar.fbenter and sVar.fbenter[groupId] or 0
end

--重置每天进入副本的次数
function ResetDayFubenTimes( sysarg )
	local sVar = Actor.getStaticVar(sysarg)
	sVar.fb = {}
	for idx, times in ipairs(FubenCountConfig) do
		sVar.fb[idx] = times -- 可进入副本次数
	end
	sVar.fbenter = {}     --副本进入次数
	sVar.fubenItems = nil
end

function IncExtBuyTimes( sysarg, groupId ) 
	local sVar = Actor.getStaticVar(sysarg)	
	if not sVar.fbenter then
		sVar.fbenter = {}
	end
	sVar.fbenter[groupId] = (sVar.fbenter[groupId] or 0) + 1
end

--扣除进入副本次数
function DeductFubenTimes( sysarg, fubenId )
	local fubenCfg = FuBen[fubenId]
	if not fubenCfg then
		return
	end
	--local groupId = fubenCfg.groupId
	local sVar = Actor.getStaticVar(sysarg)	
	if not sVar.fb then
		sVar.fb = {}
	end
	local fbTab = sVar.fb
	--fbTab[groupId] = fbTab[groupId] - 1
	fbTab[fubenId] = fbTab[fubenId] - 1
end

--获取总共可以进入副本的次数
function GetEnterFubenTimes( sysarg, fubenId )
	local fubenCfg = FuBen[fubenId]
	if not fubenCfg or fubenCfg.fbid == nil then
		return -1
	end
	local groupid = fubenCfg.groupId
	local sVar = Actor.getStaticVar(sysarg)	
	if not sVar.fb then
		sVar.fb = {}
	end
	local fbTab = sVar.fb
	local groupTimes = fbTab[fubenId]
	--return groupTimes;
	if not groupTimes or groupTimes > FubenCountConfig[groupid] then
		groupTimes = FubenCountConfig[groupid]
		fbTab[fubenId] = groupTimes
	end
	local count = groupTimes + GetExtBuyTimes(sysarg, groupid)
	return count >= 0 and count or 0
end

-- 获取副本额外进入次数
function getFBAddCount(sysarg)
	local var = Actor.getDyanmicVar(sysarg)
 	local fb = var.fb
 	if fb == nil then 
    var.fb = {}
    fb = var.fb
  end
  
  local fbAddCount = 0
  if (fb.addFbCount ~= nil) then
  	fbAddCount = fb.addFbCount
  end  
  --print("fbAddCount = " .. fbAddCount)
  return fbAddCount
end

--退出副本的函数
function onExitFubenFunc(sysarg, isTimeout)	
	local FbID = Actor.getFubenId(sysarg)
	local fbPtr = Actor.getFubenPrt(sysarg)
	if FbID == 0 then 
		Actor.exitFuben(sysarg)
		return
	end

	local fbdata = FuBen[FbID]
 
	if fbdata == nil then return end
	if not Actor.isInTeam(sysarg) then 			--如果是单人副本，直接退出副本
		if isTimeout ~= nil and isTimeout == false then
			local nMonsterNum = Fuben.getMonsterNum(sysarg)
			if FbID >= 3 and FbID <= 10 and nMonsterNum == 0 then  --检测奖励领取没，没领取提示玩家领取奖励
				local var = Actor.getStaticVar(sysarg)
				if var.fuBenAwardFlag == nil or var.fuBenAwardFlag == 0 then
					Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf187,ttFlyTip)
					return
				end
			end
		end
		
		--Actor.exitFuben(sysarg)
		--个人副本的主线任务，特殊处理
        --if get_taskflags_val(sysarg) ==86 then
        --    System.trace("shiwang task"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
        --    System.trace("尸王任务:"..Actor.getName(sysarg))
        --
        --end
		--if get_taskflags_val(sysarg) ==86 then
		--	--Actor.addTimer(sysarg,14,1000)
		--	--在这里弹窗
		--	local dvar = Actor.getDyanmicVar(sysarg)
		--	if dvar.hasChangeTheTask86==nil then 
        --        System.trace("shiwang task success")
		--		Actor.addTimer(sysarg,48,5000)
		--		dvar.hasChangeTheTask86=1
        --    else
        --         System.trace("shiwang task failed x:"..Actor.getIntProperty(sysarg,PROP_ENTITY_POSX).."y:"..Actor.getIntProperty(sysarg,PROP_ENTITY_POSY))
		--	end
		--end
		
		--个人副本的主线任务，特殊处理
		--if get_taskflags_val(sysarg) ==92 then
		--	Actor.addTimer(sysarg,14,5000)
		--	System.trace("92task5s:"..Actor.getName(sysarg))
		--end
		--if get_taskflags_val(sysarg) ==97 then
		--	Actor.addTimer(sysarg,14,5000)
		--	System.trace("97task5s:"..Actor.getName(sysarg))
		--end
		
		--记录下离开100副本的任务号
		--if FbID==100 then 	
		--	 System.trace("byFbId=100 task Id="..get_taskflags_val(sysarg).."crossFuben actorId="..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
		--end
        Actor.returnCity(sysarg,131,167)
	
		
	else
		if Fuben.getFubenProgress(fbPtr) == FB_FS_GETAWARD then
			local teamid = Actor.getTeamId(sysarg)
			TeamFun.setTeamFubenId(teamid,0)
		end
       
		Actor.exitFuben(sysarg)
	end
	
	local pack = DataPack.allocPacket(sysarg, 20, 10)
	DataPack.writeInt(pack, FbID)		
	DataPack.flush(pack)
	if fbdata.groupId == 14 then
		DeductFubenTimes(sysarg, FbID) 
	end	
	--OnExitFubenFunc(sysarg, FbID) -- 放到OnPlayerExitFuben()，否则会死循环，因为C++会触发aeOnExitFuben
	if fbdata.noaward then		--没有奖励
		return
	end
	local myId = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
	local fbVar = Fuben.getDyanmicVar( fbPtr )
	if not fbVar.PassReward then
		fbVar.PassReward = {}
	end
	if fbVar.PassReward[myId] then
		return
	end
	fbVar.PassReward[myId] = 1
	local netPack = DataPack.allocPacket(sysarg,139, 16)  --申请一个数据包
	if netPack then
		DataPack.writeByte(netPack, 1)
		DataPack.writeString(netPack, Lang.ScriptTips.fuben035)
		DataPack.writeInt( netPack, FbID)
		DataPack.writeByte(netPack, #FubenPassReward)
		for k, v in ipairs(FubenPassReward) do
			DataPack.writeByte(netPack, v.type)
			DataPack.writeInt(netPack, v.id)
			DataPack.writeInt(netPack, v.count)
		end
		local dVar = Actor.getDyanmicVar(sysarg)
		if not dVar.MarkPassRewardList then
			dVar.MarkPassRewardList = {}
		end
		local randIdx = math.random(1, #FubenPassReward)
		dVar.MarkPassRewardList[FbID] = randIdx
		DataPack.writeInt(netPack, FubenPassReward[randIdx].id)
		DataPack.flush(netPack)
	end	
	--local btnStr = string.format("%s/GetPassAward", Lang.ScriptTips.fuben019)
	--Actor.messageBox(sysarg, 0,0,Lang.ScriptTips.fuben018,btnStr,NULL,NULL,0,1)
end

--领取通关奖励
function GetPassAward( sysarg, fubenId )
	local dVar = Actor.getDyanmicVar(sysarg)
	if dVar.MarkPassRewardList then
		local curIdx = dVar.MarkPassRewardList[fubenId]
		if curIdx then
			local v = FubenPassReward[curIdx]
			if v then
				Actor.giveAward(sysarg, v.type, v.id, v.count, v.quality, v.strong, v.bind, 0, 55, "GetPassAward")
			end
			dVar.MarkPassRewardList[fubenId] = nil
		end
	end
end

function ensureFunc(sysarg)
end

function acceptQuest( sysarg, qid )
	qid = tonumber(qid)
	if Actor.addQuest(sysarg, qid) then
		local questTitle = System.getQuestTitle(qid) or ""
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf013, questTitle), ttTipmsgWindow)
	end
end

--招募队友
function RecruitTeamer(sysarg, fubenId)
	fubenId = tonumber(fubenId)
	local teamId = Actor.getTeamId(sysarg)
	if teamId == 0 or TeamFun.getTeamCaptain(teamId) ~= sysarg then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben013, ttFlyTip)
		return
	end
	local fubenCfg = FuBen[fubenId]
	if not fubenCfg then
		return
	end
	local dVar = Actor.getDyanmicVar(sysarg)
	local nNowDt = System.getCurrMiniTime()
	if dVar and dVar.RecruitTeamerDt and dVar.RecruitTeamerDt > nNowDt then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.fuben008, dVar.RecruitTeamerDt - nNowDt), ttFlyTip)
		return
	end
	dVar.RecruitTeamerDt = nNowDt + 10
	local myName = Actor.getName(sysarg)
	local noticeStr = string.format(Lang.ScriptTips.fuben005, fubenCfg.fbname, fubenCfg.minLevel, myName, myName)
	System.broadcastTipmsgLimitLev(noticeStr, ttChatWindow, fubenCfg.minLevel)
end


--购买次数
function BuyEnterTimes( sysarg, fubenId )
	fubenId = tonumber(fubenId)
	local fubenCfg = FuBen[fubenId]
	if not fubenCfg then
		return
	end
	local times = getTodayFBItemTimes(sysarg, fubenId)
	if times >= fubenCfg.enterTimes then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben028, ttFlyTip)
		return
	end
	local itemName = Item.getItemLinkMsg(fubenCfg.itemId )
	local noticeStr = string.format(Lang.ScriptTips.fuben020, fubenCfg.fbname, itemName, fubenCfg.itemNum )
	local ensureStr = string.format("%s/ensureBuyEnterTimes,%d", Lang.ScriptTips.x00076, fubenId)
	local canelFunc = string.format("%s/CanelFunc,%d", Lang.ScriptTips.x00077, fubenId)
	Actor.messageBox(sysarg, Actor.getTargetHandle(sysarg),0, noticeStr, ensureStr, canelFunc,NULL)
end

function CanelFunc( sysarg, fubenId )

end

function ensureBuyEnterTimes( sysarg, fubenId )
	fubenId = tonumber(fubenId)
	local fubenCfg = FuBen[fubenId]
	if not fubenCfg then
		return
	end
	
	local times = getTodayFBItemTimes(sysarg, fubenId)
	if times >= fubenCfg.enterTimes then
		return
	end
	if fubenCfg.itemId and Actor.getItemCount( sysarg, fubenCfg.itemId) >= fubenCfg.itemNum then
		Actor.removeItem( sysarg, fubenCfg.itemId, fubenCfg.itemNum, -1, -1, -1, "enter fuben items", 5 )
		setTodayFBItemTimes( sysarg, fubenId, times + 1 )
		IncExtBuyTimes( sysarg, fubenCfg.groupId)
		return OnEnterFubenFunc(sysarg, fubenId)
	else
		Actor.openDialogs(sysarg,diBuyAnItem,tostring(fubenCfg.itemId))
		--local itemName = Item.getItemLinkMsg(fubenCfg.itemId)
		--Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.fuben021, fubenCfg.itemNum, itemName), ttFlyTip)
	end	
end

--队伍集结
function TeamerMass( sysarg, fubenId )
	fubenId = tonumber(fubenId)
	local teamId = Actor.getTeamId(sysarg)
	if teamId == 0 or TeamFun.getTeamCaptain(teamId) ~= sysarg then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben014, ttFlyTip)
		return
	end
	local fubenCfg = FuBen[fubenId]
	if not fubenCfg then
		return
	end
	local dVar = Actor.getDyanmicVar(sysarg)
	local nNowDt = System.getCurrMiniTime()
	if dVar and dVar.TeamerMassDt and dVar.TeamerMassDt > nNowDt then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.fuben008, dVar.TeamerMassDt - nNowDt), ttFlyTip)
		return
	end
	dVar.TeamerMassDt = nNowDt + 10
	local npcName = Actor.getName(thisNPC)
	local npcSceneId = Actor.getSceneId(thisNPC)
	local messageStr = string.format(Lang.ScriptTips.fuben009, fubenCfg.fbname, npcName)
	local pathFinding = string.format("%s/AutoPathFinding,%d,%s", Lang.ScriptTips.fuben011, npcSceneId, npcName)
	local npcSceName,npcX,npcY = Actor.getSceneName(thisNPC, 0, 0)
	local freeMove = string.format("%s/MoveToFbNpc,%s,%d,%d", Lang.ScriptTips.fuben012, npcSceName,npcX,npcY)
	local canelFunc = string.format("%s/CanelFunc,%d", Lang.ScriptTips.x00077, 0)
	local TeamMemb = LuaHelp.getTeamMemberList(sysarg)
	local massNoticeStr = Lang.ScriptTips.fuben016
	for k, v in ipairs(TeamMemb) do
		if v ~= sysarg then
			local memSceName, memX, memY = Actor.getSceneName(v, 0, 0)
			if npcSceName ~= memSceName or (math.abs(memX - npcX) > 10 and math.abs(memY - npcY) > 10) then
				Actor.messageBox( v, 0, 0, messageStr, pathFinding, freeMove, canelFunc, 0, 2)
				massNoticeStr = Lang.ScriptTips.fuben015
			end
		end
	end
	Actor.sendTipmsg(sysarg, massNoticeStr, ttFlyTip)
end

function AutoPathFinding( sysarg, sceneId, npcName )
	Actor.autoFindPathToNpc(sysarg, tonumber(sceneId), npcName)
end

--免费传送
function MoveToFbNpc( sysarg, sceneName, x, y )
	x = tonumber(x)
	y = tonumber(y)
	if Actor.getFubenId(sysarg) > 0 then
		onExitFubenFunc(sysarg)
	else
		if Actor.hasMapAreaAttriValue(sysarg,aaNotBeTran,4) == true then
			Actor.sendTipmsg( sysarg, Lang.ScriptTips.pataNotice022,ttFlyTip )
			return
		end

		if Actor.canTelport(sysarg, 0, sceneName) then
			System.telportSceneByName(sysarg, sceneName, x, y)
		end		
	end
	
end

function StayInTeam( sysarg )

end

function DestroyTeam( sysarg )
	Actor.exitTeam(sysarg)
end

function GetQuestStrByFubenId( sysarg, fubenId )
	local questList = FubenQuestMap[fubenId]
	if questList then
		for k, qid in ipairs(questList) do
			if not Actor.hasQuest(sysarg, qid) and Actor.addQuest(sysarg, qid, false) then
				local questTitle = System.getQuestTitle(qid) or ""
				local noticeStr = string.format(Lang.ScriptTips.zf010, GetFuBenName(fubenId), questTitle)
				local ensureStr = string.format(Lang.ScriptTips.zf011, questTitle, qid)
				Actor.messageBox(sysarg, 0,0, noticeStr, ensureStr,Lang.ScriptTips.zf012,NULL) 
				return
			end
		end
	end
end

function GetFubenAllTimes( sysarg, fubenId )
	local fubenCfg = FuBen[fubenId]
	if fubenCfg and fubenCfg.fbid then
		return FubenCountConfig[fubenCfg.groupId] + getTodayFBItemTimes(sysarg, fubenCfg.fbid)
	end
	return -1
end

function SendEnterFbTimes(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 20, 11)
	if not netPack then
		return
	end
	local size = #FuBen
	DataPack.writeByte(netPack, size)	
	for _, fubenCfg in ipairs(FuBen) do	
		local count = GetEnterFubenTimes(sysarg, fubenCfg.fbid)
		local allCount = GetFubenAllTimes(sysarg, fubenCfg.fbid)
		DataPack.writeInt(netPack, fubenCfg.fbid)
		DataPack.writeByte(netPack, allCount - count)	
		DataPack.writeByte(netPack, allCount)	
	end
	DataPack.flush(netPack)
end

function OpenGuideUi( sysarg )
	local netPack = DataPack.allocPacket(sysarg, 139, 53)
	if netPack then
		DataPack.flush(netPack)
	end
end

function OnGetStoryFbItem( sysarg )
	local fubenId = Actor.getFubenId(sysarg)
	local itemTab = StoryEquipMap[fubenId]
	if itemTab then
		local weaponPtr = Item.getEquipByType(sysarg, Item.itWeapon)
		if weaponPtr and Item.getItemId(weaponPtr) == itemTab.id then
			return
		end
		local bagItCount = Actor.getItemCount(sysarg, itemTab.id)
		if bagItCount > 0 then
			return
		end
		local newItemPtr = 	Item.createItem(itemTab.id, itemTab.count, itemTab.strong, itemTab.quality, itemTab.bind)
		if Item.addItem(sysarg,newItemPtr, "renown buy item", 63,1) then
			Item.equipItem(sysarg, newItemPtr)
		end
	end
end

--检查背包格子数是否够
function checkPaTaBagGrids( sysarg, awardComCfg )
	local count = 0
	if not awardComCfg then
		return false
	end
	for k, v in ipairs( awardComCfg ) do
		if v.type == 0 then
			count = count + Item.getAddItemNeedGridCount( sysarg, v.id, v.count, v.quality, v.strong, v.bind)
		end
	end
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if bagIdxs < count then
		Actor.sendTipmsg( sysarg,string.format(Lang.ScriptTips.tf00008, count),ttFlyTip )
		return false
	end
	return true
end

function checkOneBagItem( sysarg, oneCfg )
	if not oneCfg or oneCfg.type > 0 then
		return true
	end
	local count = Item.getAddItemNeedGridCount( sysarg, oneCfg.id, oneCfg.count, oneCfg.quality, oneCfg.strong, oneCfg.bind)
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if bagIdxs < count then
		Actor.sendTipmsg( sysarg,string.format(Lang.ScriptTips.tf00008, count),ttFlyTip )
		return false
	end
	return true
end

OnMoGoogMopOp = {}
OnMoGoogMopOp[1] = function(sysarg,fbId) 
	if not MoGoogConfigTable[fbId] then
		return
	end
	local actorVar = Actor.getStaticVar(sysarg)
	if actorVar.mogoogTimes and actorVar.mogoogTimes[fbId] and actorVar.mogoogTimes[fbId] ~= 0 then
		return
	end
	if not actorVar.mogoogTimes then
		actorVar.mogoogTimes = {} 
	end

	actorVar.mogoogTimes[fbId] = MoGoogConfigTable[fbId].needTime + System.getCurrMiniTime()
	Actor.getMoGoogMopInfo(sysarg,fbId)
end

--快速扫荡，将时间置零
OnMoGoogMopOp[2] = function(sysarg,fbId)
	if not MoGoogConfigTable[fbId] then
		return
	end
	local actorVar = Actor.getStaticVar(sysarg)
	if not actorVar.mogoogTimes then
		return
	end
	--已经领取
	if not actorVar.mogoogTimes[fbId] then
		return
	end
	actorVar.mogoogTimes[fbId] = System.getCurrMiniTime()
	Actor.getMoGoogMopInfo(sysarg,fbId)
end

--提前结束，将该魔宫时间请空
OnMoGoogMopOp[3] = function(sysarg,fbId) 
	if not MoGoogConfigTable[fbId] then
		return
	end
	local actorVar = Actor.getStaticVar(sysarg)
	if actorVar.mogoogTimes and actorVar.mogoogTimes[fbId] then
		actorVar.mogoogTimes[fbId] = 0
	else
		return
	end
	--Actor.getMoGoogMopInfo(sysarg,fbId)
end

--领取魔晶
OnMoGoogMopOp[4] = function(sysarg,fbId) 
	if not MoGoogConfigTable[fbId] then
		return
	end
	local actorVar = Actor.getStaticVar(sysarg)
	if not actorVar.mogoogTimes then
		return
	end
	--已经领取
	if not actorVar.mogoogTimes[fbId] then
		return
	end
	--时间未到，不可领取
	if actorVar.mogoogTimes[fbId] > System.getCurrMiniTime() then
		return	
	end
	actorVar.mogoogTimes[fbId] = nil
	Actor.setUIntProperty(sysarg, PROP_ACTOR_CRYSTAL, 100)
	--Actor.getMoGoogMopInfo(sysarg,fbId)
end



