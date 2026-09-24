--武林争霸的一些公共逻辑处理
----#include "data\config\activity\StdActivityCfg.lua" once

--获取武林盟主的名字
function GetWLMZName()
	local var = System.getStaticVar()
	local KingVar = var.KingVar
	if KingVar and KingVar[9] then 
		return KingVar[9]
	end
end

--设置武林盟主的名字
function SetWLMZName(sysarg)
	local var = System.getStaticVar()
	if var.WuLinZhengBaStartFlag then
		var.WuLinZhengBaStartFlag = 0
	end
	if not var.KingVar then
		var.KingVar = {}
	end
	
	local KingVar = var.KingVar
	if KingVar then KingVar[9] = Actor.getName(sysarg) end
end

--清空武林盟主
function ClearWLMZName()
	local var = System.getStaticVar()
	local KingVar = var.KingVar
	if KingVar and KingVar[9] then 
		KingVar[9] = nil
	end
end

--获取武林盟主的ID
function GetWLMZId()
	local player = Actor.getActorByName(GetWLMZName())
	if player then
		return Actor.getIntProperty(player,PROP_ENTITY_ID)
	end
end

--活动开始
function OnActivityStart()
	local nActorId =GetWLMZId()
	local pPlayer = System.getEntityPtrByActorID(nActorId)
	if pPlayer then
		Actor.setSocialMask(pPlayer,smIsWulinMaster,false)
		Actor.setTopTitle(pPlayer,Title.WuLinMaster,false)
		OnWuLinMasterAddBuff(pPlayer,false)
	end
	--清除武林盟主
	ClearWLMZName()
	local svar = System.getDyanmicVar()
	if svar.WuLinZhengBaStartFlag == nil then		--开始武林争霸的标志
		svar.WuLinZhengBaStartFlag = 0
	end

	svar.WuLinZhengBaStartFlag = 1

	if svar.WuLinEnterFlag == nil then		--30分钟后不能再进入武林争霸的标志
		svar.WuLinEnterFlag = 0
	end
	clearWuLinZhengBaMonster()
	svar.WuLinEnterFlag = 0
	local hScene = Fuben.getSceneHandleById(StdActivityCfg.WuLinZhengBa.lowSceenId, 0)
	--Fuben.setSceneTime(hScene,StdActivityCfg.WuLinZhengBa.lastTime)
end

--活动结束
function EndWuLinZhengBa()

	local svar = System.getDyanmicVar()
	svar.WuLinZhengBaStartFlag = nil
	--svar.WuLinEnterFlag = nil
	OnEndWuLinActivity()
end

function clearWuLinZhengBaMonster()
	local timerH = System.getTimeCall(thisNPC, "LoopCreatSuperWLZBBoss")
	if timerH then
		System.unregisterTimeCall(timerH)
	end
	local handleScene = Fuben.getSceneHandleById( StdActivityCfg.WuLinZhengBa.lowSceenId, 0)
	Fuben.clearMonster(handleScene, StdActivityCfg.WuLinZhengBa.SuperBossId)
	Fuben.clearMonster(handleScene, StdActivityCfg.WuLinZhengBa.BossId)
end

--活动结束的一些处理
function OnEndWuLinActivity()
	local nPrimId =GetWLMZId()
	local nHandle = Fuben.getSceneHandleById(StdActivityCfg.WuLinZhengBa.outSceenId,0)
	
	local playerList = LuaHelp.getSceneAliveActorListById(StdActivityCfg.WuLinZhengBa.lowSceenId)		--获取某场景玩家对象列表
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then	
				if (not nPrimId or nPrimId <= 0) and table.getn(playerList) == 1 then
					local nActorId = Actor.getIntProperty(player,PROP_ENTITY_ID)
					local nName = Actor.getName(player)
					--clearWuLinZhengBaMonster()
					local nPrimId = GetWLMZId()
					if nPrimId and nPrimId > 0 then
						if nPrimId == nActorId then
							Actor.sendTipmsg(player, Lang.Activity.w00025, ttFlyTip)
						else
							Actor.sendTipmsg(player, Lang.Activity.w00114, ttFlyTip)
						end
						return
					end
					if Awards.CheckBagGridCount(player,StdActivityCfg.WuLinZhengBa.awardsMaster) == false then
						return
					end
					BeWuLinChief(player,1,nActorId,nName)
					Actor.setSocialMask(player,smIsWulinMaster,true)
				else
					Actor.exitActivityScene(player)
				end
			end
		end
	end
	System.broadcastTipmsg(Lang.Activity.wlzb0004,2 + 128)
end

function ClearWiLinScene()
	
end

--开始前5分钟预告
function WuLinZhengBaNotice()
	System.broadcastTipmsg(Lang.Activity.wlzb0001,ttFlyTip)
end

--武林争霸开始30分钟
function OnWuLinZhengBaTenMin()
	local svar = System.getDyanmicVar(sysarg)

	if svar.WuLinEnterFlag == nil then		--30分钟后不能再进入武林争霸的标志
		svar.WuLinEnterFlag = 0
	end

	svar.WuLinEnterFlag = 1
	local handleScene = Fuben.getSceneHandleById(StdActivityCfg.WuLinZhengBa.lowSceenId, 0)	
	Fuben.sendMsgToScene( handleScene, Lang.Activity.wlzb0006, ttScreenCenter+ttChatWindow)
end

--结束预告
function EndWLZBNotice()	
	System.broadcastTipmsg(Lang.Activity.wlzb0003,2+128)
end

--通过申请或者活动时间结束给玩家武林盟主封号并且加上奖励
function BeWuLinChief(sysarg,nIndex,nActorId,nName)
	--武林盟主名字
	SetWLMZName(sysarg)
	local str1 = string.format(Lang.Activity.w00006,nName)
	System.broadcastTipmsg(str1,128)
	local str2 = string.format(Lang.Activity.w00109,nName)
	System.broadcastTipmsg(str2,2)
	Actor.setTopTitle(sysarg,Title.WuLinMaster,true)
	System.sendCommonLog(1087,nActorId,nName,0,0,0,"Become Extreme martial arts")
	--Actor.sendTipmsg(sysarg, Lang.Activity.w00108, ttFlyTip)
	OnWuLinMasterAddBuff(sysarg,true)
	--奖励在此加上
	GetWulinMengzhuAward(sysarg)
	--领完奖励传送出场景
	local nPosX = System.getRandomNumber(WuLinZhengBaConfig.outMapX[2]-WuLinZhengBaConfig.outMapX[1])
	nPosX = nPosX + WuLinZhengBaConfig.outMapX[1]

	local nPosY = System.getRandomNumber(WuLinZhengBaConfig.outMapY[2]-WuLinZhengBaConfig.outMapY[1])
	nPosY = nPosY + WuLinZhengBaConfig.outMapY[1]
	local bResult = Actor.enterScene(sysarg,WuLinZhengBaConfig.outSceenId,126,109)
	if bResult then
		OnAddPet(sysarg)
	end
end

--武林盟主属性加成
function OnWuLinMasterAddBuff(sysarg,bFlag)
	local nRate = 0
	local fValue = 0
	if bFlag == true then
		Actor.addBuff(sysarg,StdActivityCfg.WuLinZhengBa.AddBuff[1].buffType,StdActivityCfg.WuLinZhengBa.AddBuff[1].buffGroup,StdActivityCfg.WuLinZhengBa.AddBuff[1].value,StdActivityCfg.WuLinZhengBa.AddBuff[1].times,StdActivityCfg.WuLinZhengBa.AddBuff[1].interval,StdActivityCfg.WuLinZhengBa.AddBuff[1].buffName)
	else
		Actor.delBuff(sysarg,StdActivityCfg.WuLinZhengBa.AddBuff[1].buffType,StdActivityCfg.WuLinZhengBa.AddBuff[1].buffGroup)
	end
end

--领取奖励,申请成为武林盟主的时候奖励或者活动时间到期的时候加上
function GetWulinMengzhuAward(sysarg)
	local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	local nName = Actor.getName(sysarg)
	local nPrimId =GetWLMZId()
    if nPrimId and nActorId == nPrimId then
		if Awards.CheckBagGridCount(sysarg,StdActivityCfg.WuLinZhengBa.awardsMaster) then
			for i=1,table.getn(StdActivityCfg.WuLinZhengBa.awardsMaster) do
				local awardTab = StdActivityCfg.WuLinZhengBa.awardsMaster[i]
				Actor.giveAward(sysarg, awardTab.type,awardTab.id,awardTab.count,awardTab.quality,awardTab.strong,awardTab.bind,0,0,Lang.Activity.a00081)
			end
		end

	else
		Actor.sendTipmsg(sysarg, Lang.Activity.w00106, ttFlyTip)
	end
end

