
--#include "data\functions\GlobalDefine.lua" once
--#include "data\config\activityconfig\Answer\AnswerConfig.lua" once
--#include "..\CombineActivity\MysiticShopOp.lua" once

Type_Answer = 0
Type_Double = 1
Type_Remove = 2
Type_Right = 3
Type_Over = 4		--结束答题
Type_RequestAnswer = 5  --请求答题

SC_AnswerOver = 4
SC_CanFreeAnswer = 5
SC_InitAnswerUi = 6
SC_ExtGetExp = 7
SC_SecondsToBegin = 8		--开始倒计时

SubType_Free = 0
SubType_Coin = 1

AnswerSceneId = 161		--答题活动场景

--同意免费答题
--在副本中不可以答题，玩家同意后传送到答题场景，等待答题活动开始
--当客户端发送61消息，的5时触发
--如果已经在答题场景中，则保持
function StartFreeAnswer( sysarg )
	print("AnswerCommon.StartFreeAnswer()")
	local SceneId = Actor.getSceneId(sysarg)
	if SceneId == 161 then	--已经再答题场景中
		return
	end
	
	local fbid = Actor.getFubenId(sysarg)		--获取玩家副本ID
	if  fbid > 0  then 	--玩家在副本中
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00058,ttFly)
		return
	else	--传送到答题场景中
		EnterAnswerScene(sysarg)
	end	
end

--进入答题场景
--初始化答题面板
function EnterAnswerScene(sysarg)
	print("AnswerCommon.EnterAnswerScene()")
	local nHour,nMin,nSec = System.getTime(0,0,0)
	--if nHour == 11 and 25 <= nMin and nMin <= 59	then
	if true then
		local sysVar = System.getDyanmicVar()
		if sysVar.DoAnswer and sysVar.DoAnswer == 1 then
			if Actor.enterScene(sysarg, AnswerSceneId, 45, 45) == true then
				SendAnswerPack(sysarg, SC_InitAnswerUi, SubType_Free, GetMyRanking(sysarg), GetMyPoint(sysarg), GetSecondToBegin(sysarg))	--初始化答题面板
				SendAnswerAreaCenter(sysarg)
				Actor.initActivityWind(sysarg, Lang.Activity.an0001, 0, "")
			else
				return false
			end
		else
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.ans022, ttFlyTip)
			return false
		end
	else
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.ans021, ttFlyTip)
		return false
	end
end


--开始免费答题（点击按钮后触发）
--注意：在指定场景中必须有NPC
--在副本中不可以答题
--开始答题，要传送到专门的答题场景
function StartFreeAnswerOld( sysarg )
	print("AnswerCommon.StartFreeAnswerOld()")
	local fbid = Actor.getFubenId(sysarg)		--获取玩家副本ID
	if  fbid > 0  then 	--玩家在副本中
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00058,ttFly)
		return
	else	--传送到Npc附近
		SendToPositionRand(sysarg, 2, 135)
	end
	
	local sysVar = System.getDyanmicVar()
	local dVar = Actor.getDyanmicVar(sysarg)
	if not dVar.FreeAnswerFlag or dVar.FreeAnswerFlag ~= 0 then
		return
	end
	dVar.FreeAnswerFlag = 1
	if sysVar.SysCurAnsIdx then
		local answerIdx = sysVar.SysAnswerList[sysVar.SysCurAnsIdx]
		local answerCfg = AnswerConfig.AnswerLib[answerIdx]
		if answerCfg then
			SendAnswerPack( sysarg, SC_InitAnswerUi, SubType_Free, GetMyRanking(sysarg), GetMyPoint(sysarg))
			local nNowDt = System.getCurrMiniTime()
			JustSendSysCurAnswer( sysarg, answerCfg, sysVar.SysCurAnsIdx, sysVar.NextAnswerDt - nNowDt)
		end
	else
		local useCount = GetTodayAnswerTime(sysarg)
		local lastCount = AnswerConfig.CoinCount
		if useCount > 0 then
			lastCount = lastCount - useCount
		end
		SendAnswerPack(sysarg, SC_AnswerOver, SubType_Free, useCount, lastCount, GetNextAnswerFee(sysarg))
	end
end

--随机传送到某场景的NPC旁，在一定距离之内随机
function SendToPositionRand(sysarg, ScendId, NpcId)
	local NpcPtr = Fuben.getNpcPtrById(ScendId, NpcId)
	local	x, y	=	Actor.getEntityPosition(NpcPtr,0,0)
	x  = x + math.random(-3,3)
	y  = y + math.random(-3,3)
	return Actor.enterScene(sysarg, 2, x, y)
end


--系统答题开始（免费答题活动）
function BeginFreeAnswer()
	print("AnswerCommon.BeginFreeAnswer()")
	local SysVar = System.getDyanmicVar()
	SysVar.SysAnswerList = {}
	local allAnsCount = #AnswerConfig.AnswerLib
	for i = 1, AnswerConfig.AnswerCount do
		SysVar.SysAnswerList[i] = math.random(1,allAnsCount)
	end
	SysVar.SysCurAnsIdx = 0	
	local nHandle = Fuben.getSceneHandleByName(Lang.SceneName.s00002,0)
	local NpcPtr = Fuben.getNpcPtrByName(nHandle,Lang.EntityName.n00135)
		
	local playerList = LuaHelp.getSceneActorListById(AnswerSceneId)  --获取答题场景中玩家对象列表
	if playerList ~= nil then
		for i = 1, #playerList do
			local player = playerList[i]
			if player then		--初始化玩家的答题面板
				PlayerBeginFreeAnswer(player)
			end
		end
	end

	Actor.regScriptTimer(NpcPtr, 0, 0, AnswerConfig.AnswerSecs*1000, AnswerConfig.AnswerCount+1, "NewSendSysAnswerContent")
end


--玩家开始免费答题
function PlayerBeginFreeAnswer(sysarg)
	print("AnswerCommon.PlayerBeginFreeAnswer()")
	local dVar = Actor.getDyanmicVar(sysarg)
	if not dVar.FreeAnswerFlag then
		dVar.FreeAnswerFlag = 1
	elseif dVar.FreeAnswerFlag == 0 then
		dVar.FreeAnswerFlag = 1
	else		--已经在答题中
		return
	end
	dVar.SysCurAnsSel = -1
end

function GetMyRanking( sysarg )
	local ranking = Ranking.getRanking( Lang.Rank.AnswerRank )
	if ranking then
		local myId = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
		local index = Ranking.getItemIndexFromId( ranking, myId)
		if index >= 0 then
			return index + 1
		end
	end
	return 0
end

--设置我的答题积分
function SetMyPoint( sysarg, addPoint )
	local sVar = Actor.getStaticVar(sysarg)
	sVar.AnswerPoints = GetMyPoint(sysarg) + addPoint
	local nNowDt = System.getCurrMiniTime()
	sVar.LastGetAnswerPtDt = nNowDt
	Actor.setUIntProperty(sysarg, PROP_ACTOR_KNOWLEDGE_POINT, sVar.AnswerPoints)
	local ranking = Ranking.getRanking( Lang.Rank.AnswerRank )
	if ranking then
		local myId = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
		local item = Ranking.getItemPtrFromId( ranking, myId)
		if item then
			Ranking.updateItem(ranking, myId, addPoint)
		else
			item = Ranking.addItem(ranking, myId, addPoint)
			if item then
				local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
				local myLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
				local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
				local levelStr = myLevel
				if nCircle > 0 then
					levelStr = string.format("[%d]%d", nCircle, myLevel)
				end
				Ranking.setSub(item, 0, Actor.getName(sysarg))
				Ranking.setSub(item, 1, Job_cn[myJob])
				Ranking.setSub(item, 2, levelStr)
				Ranking.setSub(item, 3, "")
			end
		end
		--Ranking.save(ranking, Lang.Rank.AnswerRank)
	end
end

function GetMyPoint( sysarg )
	return Actor.getIntProperty( sysarg, PROP_ACTOR_KNOWLEDGE_POINT)
	--local sVar = Actor.getStaticVar(sysarg)
	--return sVar.AnswerPoints or 0
end

--个人的题库（金币答题）
function GetPerAnswerList(sysarg)
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.PerAnswerList = {}
	dVar.PerCurAnsIdx = 0
	local allAnsCount = #AnswerConfig.AnswerLib	--题库
	for i = 1, AnswerConfig.CoinAnswerCount do
		dVar.PerAnswerList[i] = math.random(1,allAnsCount)
	end
	SendAnswerPack( sysarg, SC_InitAnswerUi, SubType_Coin, GetMyRanking(sysarg), GetMyPoint(sysarg))	--使客户端初始化答题框
	Actor.unregScriptCallback(sysarg, "SendPerAnswerContent")
	--Actor.regScriptCallback(sysarg, sysarg, 0, AnswerConfig.AnswerSecs*1000, AnswerConfig.CoinAnswerCount, "doloop")	--此用法已废弃
	Actor.regScriptTimer(sysarg, 0, 0, AnswerConfig.AnswerSecs*1000, AnswerConfig.CoinAnswerCount+1, "SendPerAnswerContent")
end

--选择答案（免费答题与金币答题）
--答对了，给与奖励
function SelectAnswer( sysarg, ansType, optResult )
	print("CommonAnswer.SelectAnswer(),	ansType="..ansType)
	print("CommonAnswer.SelectAnswer(),	optResult="..optResult)
	local dVar = Actor.getDyanmicVar(sysarg)
	
	if not dVar.SysCurAnsSel then
		dVar.SysCurAnsSel = -1
	end
	
	if ansType == SubType_Free then
		local SysVar = System.getDyanmicVar()
		if not SysVar.SysCurAnsIdx then
			return
		end
		local curIdx = SysVar.SysCurAnsIdx
		if curIdx > AnswerConfig.AnswerCount or dVar.SysCurAnsSel >= 0 then		--已经选过了就不能再选
			return
		end	
		local answerIdx = SysVar.SysAnswerList[curIdx]
		local answerCfg = AnswerConfig.AnswerLib[answerIdx]
		print("CommonAnswer.SelectAnswer(),	answerIdx="..answerIdx)
		if answerCfg then
			local actExpCfg = AnswerConfig.Exps[answerCfg.star]
			local baseActExp = Actor.getActivityExp(sysarg, actExpCfg.tabIdx, actExpCfg.rate, actExpCfg.vipRate)
			local myExp = baseActExp * AnswerConfig.FreeAwardRate
			local point = AnswerConfig.Points[answerCfg.star] * AnswerConfig.FreeAwardRate
			if dVar.SysExtFlag == Type_Double then
				myExp = AnswerConfig.ExtDouble * myExp
				point = AnswerConfig.ExtDouble * point
			end
			local result = 0 
			print("CommonAnswer.SelectAnswer(),	SysVar.SysCurRightOpt="..SysVar.SysCurRightOpt)
			if optResult ~= SysVar.SysCurRightOpt then		-----选择错误
				myExp = AnswerConfig.ErrorAnsRate * myExp
				point = 0
				if optResult == 0 then
					result = -1
				else
					result = -2  --SysVar.SysCurRightOpt	
				end
				
				
				--答题错误，接受惩罚
				if SysVar.PunishIdx == 1 then
					Actor.addBuffById(sysarg, 59)
				elseif SysVar.PunishIdx == 2 then
					Actor.addBuffById(sysarg, 60)
				elseif SysVar.PunishIdx == 3 then
					Actor.addBuffById(sysarg, 69)
				end
			end
			CalcPlayerPoint( sysarg, myExp, point)
			SendAnswerPack( sysarg, Type_Answer, SubType_Free, result, myExp, point)
			dVar.SysCurAnsSel = optResult
		end
	else
		local curIdx = dVar.PerCurAnsIdx
		local result = dVar.PerCurRightOpt
		local oldCfg = AnswerConfig.AnswerLib[dVar.PerAnswerList[curIdx]]
		if not oldCfg or dVar.PerCurAnsSel >= 0 then
			return
		end
		local actExpCfg = AnswerConfig.Exps[oldCfg.star]
		local myExp = Actor.getActivityExp(sysarg, actExpCfg.tabIdx, actExpCfg.rate, actExpCfg.vipRate)
		local point = AnswerConfig.Points[oldCfg.star]
		if dVar.PerExtFlag == Type_Double then
			myExp = AnswerConfig.ExtDouble * myExp
			point = AnswerConfig.ExtDouble * point
		end
		if optResult > 0 and optResult == dVar.PerCurRightOpt then		--答正确
			result = 0    --回答正确
		else
			myExp = myExp * AnswerConfig.ErrorAnsRate
			point = 0
		end		
		CalcPlayerPoint( sysarg, myExp, point)
		SendAnswerPack( sysarg, Type_Answer, SubType_Coin, result, myExp, point)
		dVar.PerCurAnsSel = optResult
	end
	local curCount = getTodayFlag(sysarg, DayAnswerCount) or 0
	curCount = curCount + 1
	setTodayFlag(sysarg, DayAnswerCount, curCount)
	Actor.triggerAchieveEvent(sysarg,44, 10, curCount)
end

--发送题目
function SendAnswerPack( sysarg, retType, ansType, retParam1, retParam2, retParam3 )
	print("AnswerCommon.SendAnswerPack()  retType="..retType)
	print("AnswerCommon.SendAnswerPack()  ansType="..ansType)
	if retParam1 then print("AnswerCommon.SendAnswerPack()  retParam1="..retParam1) end
	if retParam2 then print("AnswerCommon.SendAnswerPack()  retParam2="..retParam2)	end
	if retParam3 then print("AnswerCommon.SendAnswerPack()  retParam3="..retParam3) end
	
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sSendAnswerOp)  --申请一个数据包
	if netPack then
		DataPack.writeByte(netPack, retType)
		DataPack.writeByte( netPack, ansType)
		DataPack.writeInt(netPack, retParam1)
		DataPack.writeInt(netPack, retParam2)
		DataPack.writeInt( netPack, retParam3 or 0)
		DataPack.flush(netPack)
	end
end

--清空答题中的变量
function ClearAnswerSVar( sysarg, ansType )
	local dVar = Actor.getDyanmicVar(sysarg)
	if ansType == SubType_Coin then
		Actor.unregScriptCallback(sysarg, "SendPerAnswerContent")
		dVar.PerCurAnsIdx = nil
		dVar.PerCurAnsSel = nil
		dVar.PerExtFlag = nil
	else
		dVar.FreeAnswerFlag = nil
		dVar.SysCurAnsSel = nil    --当前题目的做答
		dVar.SysExtFlag = nil
	end
end

--发送题目
--重置 dVar.SysCurAnsSel为-1
function JustSendSysCurAnswer( sysarg, answerCfg, curIdx, lastSecs )
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.SysCurAnsSel = -1    --当前题目的做答
	dVar.SysExtFlag = 0		 --扩展记录
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sSendAnswerQuestion)  --申请一个数据包
	if netPack and answerCfg then
		DataPack.writeByte(netPack, SubType_Free)
		DataPack.writeByte(netPack, curIdx)
		DataPack.writeByte(netPack, AnswerConfig.AnswerCount)
		DataPack.writeByte(netPack, answerCfg.star)
		DataPack.writeString( netPack, answerCfg.qstDesc)
		DataPack.writeByte(netPack, lastSecs or AnswerConfig.AnswerSecs)
		DataPack.writeByte(netPack, #answerCfg.ansOpt)
		for k, str in ipairs(answerCfg.ansOpt) do
			DataPack.writeString(netPack, str)
		end
		DataPack.flush(netPack)
	end
end


--校验答题是否正确
function CheckSysAnswer(sysarg, answerCfg)
	print("AnswerCommon.CheckSysAnswer()")
	local sysVar = System.getDyanmicVar()
	local dVar = Actor.getDyanmicVar(sysarg)
	if dVar.FreeAnswerFlag and dVar.FreeAnswerFlag > 0 and dVar.SysCurAnsSel == -1 then
		local actExpCfg = AnswerConfig.Exps[answerCfg.star]
		local baseExp = Actor.getActivityExp(sysarg, actExpCfg.tabIdx, actExpCfg.rate, actExpCfg.vipRate)
		local myExp = baseExp * AnswerConfig.FreeAwardRate
		local point = AnswerConfig.Points[answerCfg.star] * AnswerConfig.FreeAwardRate
		if dVar.SysExtFlag == Type_Double then
			myExp = AnswerConfig.ExtDouble * myExp
			--point = AnswerConfig.ExtDouble * point
		end
		local result = sysVar.SysCurRightOpt
		myExp = AnswerConfig.ErrorAnsRate * myExp
		point = 0
		CalcPlayerPoint( sysarg, myExp, point)
		SendAnswerPack( sysarg, Type_Answer, SubType_Free, result, myExp, point)
	end
end


--结束免费答题
function OverSysAnswer( playerList )
	print("AnswerCommon.OverSysAnswer()")
	for k, v in ipairs(playerList or {}) do
		local dVar = Actor.getDyanmicVar(v)
		if true then	--场景中的玩家
			dVar.FreeAnswerFlag = nil
			PassAnswerAward(v, SubType_Free)
			local useCount = GetTodayAnswerTime(v)
			local lastCount = AnswerConfig.CoinCount
			if useCount > 0 then
				lastCount = lastCount - useCount
			end
			SendAnswerPack(v, SC_AnswerOver, SubType_Free, useCount, lastCount, GetNextAnswerFee(v))
			ClearAnswerSVar(v, SubType_Free)
		end
	end
	local nHandle = Fuben.getSceneHandleByName(Lang.SceneName.s00002,0)
	local NpcPtr = Fuben.getNpcPtrByName(nHandle,Lang.EntityName.n00135)
	Actor.unregScriptCallback(NpcPtr, "JudgeAnswerFree")
	Actor.unregScriptCallback(NpcPtr, "NewSendSysAnswerContent")
	OnSystemAnswerOver()
end

--答题场景中的玩家传出答题场景
function OnSystemAnswerOver()
	local playerList = LuaHelp.getSceneActorListById(AnswerSceneId)  --获取答题场景中玩家对象列表
	if playerList ~= nil then
		for i = 1, #playerList do
			local player = playerList[i]
			if player then
				ExitAnswerMap(player)
			end
		end
	end
end

--离开答题场景
function ExitAnswerMap(sysarg)
	if SendToPositionRand(sysarg, 2, 135) == true then
		Actor.closeActivityWind(sysarg)
	end
end


--获取答题区域
--return 1-A区域，2-B区域，3-C区域，4-D区域，0-都不是
function GetPlayerAnswerIdx(sysarg)
	local answerArea = Actor.getMapAttriValue(sysarg, aaAnswerArea)
	if answerArea >= 1 and answerArea <= 4 then
		return answerArea
	else
		return 0
	end
end

function get_right_answer_idx(answerIdx)
	local answerCfg = AnswerConfig.AnswerLib[answerIdx]
	for k, str in ipairs(answerCfg.ansOpt) do
		if str == answerCfg.right then
			return k				--正确答案的idx
		end
	end
end


--根据区域坐标范围，判断玩家是否答题正确
function JudgeAnswerFree(npcObj)
	print("AnswerCommon.JudgeAnswerFree()")
	local SysVar = System.getDyanmicVar()
	if not SysVar.SysCurAnsIdx then
		return
	end
	
	SysVar.PunishIdx = math.random(1,3)
	local playerList = LuaHelp.getSceneActorListById(AnswerSceneId)   --获取在线玩家对象列表
	local oldAnsIdx = SysVar.SysAnswerList[SysVar.SysCurAnsIdx]
	if oldAnsIdx then
		local oldAnsCfg = AnswerConfig.AnswerLib[oldAnsIdx]
		for k, v in ipairs(playerList or {}) do
			AnswerIdx = GetPlayerAnswerIdx(v)
			OnAnswerSelectedFree(v, Type_Answer, SubType_Free, AnswerIdx )	--有可能玩家中途加入，但还是算他答对
		end
	end
end


--系统答题（免费）
--每20秒调用一次
--要能支持新加入玩家、玩家中途掉线等情况
function NewSendSysAnswerContent(npcObj)
	print("AnswerCommon.NewSendSysAnswerContent()")
	local SysVar = System.getDyanmicVar()
	if not SysVar.SysCurAnsIdx then
		return
	end
	
	local playerList = LuaHelp.getSceneActorListById(AnswerSceneId)   --获取在线玩家对象列表
	local curIdx = SysVar.SysCurAnsIdx + 1
	if curIdx > AnswerConfig.AnswerCount then		--答题完毕
		OverSysAnswer( playerList )
		SysVar.SysCurAnsIdx = nil
		SysVar.DoAnswer = nil
		Ranking.save(ranking, Lang.Rank.AnswerRank)	--活动完毕，保存排行榜数据
		return
	end
	local answerIdx = SysVar.SysAnswerList[curIdx]
	local answerCfg = AnswerConfig.AnswerLib[answerIdx]
	for k, str in ipairs(answerCfg.ansOpt) do
		if str == answerCfg.right then
			SysVar.SysCurRightOpt = k
		end
	end
	for k, v in ipairs(playerList or {}) do				--给每个玩家发送答题
		PlayerBeginFreeAnswer(v)	--初始化答题面板，玩家可能是中途加入的，已经初始化过了则跳过
		JustSendSysCurAnswer(v, answerCfg, curIdx)	--发送题目
	end
	SysVar.SysCurAnsIdx = curIdx
	local nNowDt = System.getCurrMiniTime()
	SysVar.NextAnswerDt = nNowDt + AnswerConfig.AnswerSecs
	Actor.regScriptTimer(npcObj, 0, 16*1000, AnswerConfig.AnswerSecs*1000, 1, "JudgeAnswerFree")
end

--系统答题（免费）
function SendSysAnswerContent(npcObj)
	--print("AnswerCommon.SendSysAnswerContent()")
	local SysVar = System.getDyanmicVar()
	if not SysVar.SysCurAnsIdx then
		return
	end
	local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
	local oldAnsIdx = SysVar.SysAnswerList[SysVar.SysCurAnsIdx]
	if oldAnsIdx then
		local oldAnsCfg = AnswerConfig.AnswerLib[oldAnsIdx]
		for k, v in ipairs(playerList or {}) do
			CheckSysAnswer( v, oldAnsCfg)
		end
	end
	local curIdx = SysVar.SysCurAnsIdx + 1
	if curIdx > AnswerConfig.AnswerCount then		--答题完毕
		OverSysAnswer( playerList )
		SysVar.SysCurAnsIdx = nil
		return
	end
	local answerIdx = SysVar.SysAnswerList[curIdx]
	local answerCfg = AnswerConfig.AnswerLib[answerIdx]
	for k, str in ipairs(answerCfg.ansOpt) do
		if str == answerCfg.right then
			SysVar.SysCurRightOpt = k
		end
	end
	for k, v in ipairs(playerList or {}) do				--给每个玩家发送答题
		JustSendSysCurAnswer(v, answerCfg, curIdx)
	end
	SysVar.SysCurAnsIdx = curIdx
	local nNowDt = System.getCurrMiniTime()
	SysVar.NextAnswerDt = nNowDt + AnswerConfig.AnswerSecs
end



function CalcPlayerPoint( sysarg, expVal, pointVal )
	local nRate = GetCombineActivityRate()

	if expVal and expVal > 0 then
		Actor.addExp( sysarg, expVal * nRate, 0, 0)
	end
	if pointVal and pointVal > 0 then
		SetMyPoint( sysarg, pointVal)
	end	
end

--获取今日答题次数
function GetTodayAnswerTime( sysarg )
	local sVar = Actor.getStaticVar(sysarg)
	if sVar.AnswerTimes then
		local baseNum = math.pow(10,2)
		local y,m,d = System.getDate( 0, 0, 0 )
		local curDt = y * math.pow(10,4) + m *math.pow(10,2) + d
		if curDt == math.floor(sVar.AnswerTimes / baseNum) then
			return sVar.AnswerTimes % baseNum
		end
	end
	return 0
end

function PassAnswerAward( sysarg, ansType )
	local extExp = Actor.getActivityExp(sysarg, AnswerConfig.ExtExps.tabIdx, AnswerConfig.ExtExps.rate,  AnswerConfig.ExtExps.vipRate)
	if extExp > 0 then
		local extPoint = AnswerConfig.ExtPoints
		CalcPlayerPoint( sysarg, extExp, extPoint)
		SendAnswerPack( sysarg, SC_ExtGetExp, ansType, 0, extExp, extPoint)
	end
end

--答题，判断答题是否正确，并下发题目
function SendPerAnswerContent( sysarg )
	--print("AnswerCommon.SendPerAnswerContent()")
	local dVar = Actor.getDyanmicVar(sysarg)
	local curIdx = dVar.PerCurAnsIdx
	if not curIdx then
		return
	end
	if curIdx > 0 then
		if dVar.PerCurAnsSel == -1 then		--没做答
			local result = dVar.PerCurRightOpt
			local oldCfg = AnswerConfig.AnswerLib[dVar.PerAnswerList[curIdx]]
			if not oldCfg then
				return
			end
			local actExpCfg = AnswerConfig.Exps[oldCfg.star]
			local myExp = Actor.getActivityExp(sysarg, actExpCfg.tabIdx, actExpCfg.rate, actExpCfg.vipRate)
			local point = 0
			if dVar.PerExtFlag == Type_Double then
				myExp = AnswerConfig.ExtDouble * myExp
				--point = AnswerConfig.ExtDouble * point
			end
			myExp = myExp * AnswerConfig.ErrorAnsRate
		
			CalcPlayerPoint( sysarg, myExp, point)
			SendAnswerPack( sysarg, Type_Answer, SubType_Coin, result, myExp, point)
		end
		if curIdx >= AnswerConfig.CoinAnswerCount then
			local useCount = GetTodayAnswerTime(sysarg)
			local lastCount = AnswerConfig.CoinCount
			if useCount > 0 then
				lastCount = lastCount - useCount
			end
			PassAnswerAward( sysarg, SubType_Coin)
			SendAnswerPack(sysarg, SC_AnswerOver, SubType_Coin, useCount, lastCount, GetNextAnswerFee(sysarg))
			ClearAnswerSVar(sysarg, SubType_Coin)
			return
		end
		curIdx = curIdx + 1
	else
		curIdx = 1
	end
	dVar.PerCurAnsIdx = curIdx
	local answerCfg = AnswerConfig.AnswerLib[dVar.PerAnswerList[curIdx]]
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sSendAnswerQuestion)  --申请一个数据包
	if netPack and answerCfg then
		dVar.PerCurRightOpt = -1
		DataPack.writeByte(netPack, SubType_Coin)
		DataPack.writeByte(netPack, curIdx)
		DataPack.writeByte(netPack,AnswerConfig.CoinAnswerCount)
		DataPack.writeByte(netPack, answerCfg.star)
		DataPack.writeString( netPack, answerCfg.qstDesc)
		DataPack.writeByte(netPack, AnswerConfig.AnswerSecs)
		DataPack.writeByte(netPack, #answerCfg.ansOpt)
		for k, str in ipairs(answerCfg.ansOpt) do
			DataPack.writeString(netPack, str)
			if str == answerCfg.right then
				dVar.PerCurRightOpt = k
				
			end
		end
		DataPack.flush(netPack)
		dVar.PerCurAnsSel = -1    --当前题目的做答
		dVar.PerExtFlag = 0		 --扩展记录
	end
end

--双倍、排除、一击必中
--对于免费答题，每种操作的第三次操作需要VIP3级
function SetAnswerExtOpt( sysarg, optType, ansType )
	local Param1 = 0
	local Param2 = 0
	local dVar = Actor.getDyanmicVar(sysarg)
	if ansType == SubType_Coin then
		if dVar.PerExtFlag and dVar.PerExtFlag > 0 then
			--Actor.sendTipmsg(sysarg, Lang.ScriptTips.ans006, ttFlyTip)
			return
		end		
		dVar.PerExtFlag = optType
		if optType == Type_Remove then
			local t = {}
			for i = 1, 4 do
				if i ~= dVar.PerCurRightOpt then
					table.insert(t, i)
				end
			end
			Param1 = table.remove(t, math.random(1,#t))
			Param2 = table.remove(t, math.random(1,#t))
			
		elseif optType == Type_Right then
			Param1 = dVar.PerCurRightOpt
		end
	else
		if dVar.SysExtFlag and dVar.SysExtFlag > 0 then
			--Actor.sendTipmsg(sysarg, Lang.ScriptTips.ans006, ttFlyTip)
			return
		end
		local SysVar = System.getDyanmicVar()
		dVar.SysExtFlag = optType
		if optType == Type_Remove then
			local t = {}
			for i = 1, 4 do
				if i ~= SysVar.SysCurRightOpt then
					table.insert(t, i)
				end
			end
			Param1 = table.remove(t, math.random(1,#t))
			Param2 = table.remove(t, math.random(1,#t))
		elseif optType ==  Type_Right then
			Param1 = SysVar.SysCurRightOpt		--把正确选项发到客户端
		end
	end
	SendAnswerPack( sysarg, optType, ansType, Param1, Param2 )
end

--设置今日答题次数
function SetTodayAnswerTime( sysarg, count )
	local baseNum = math.pow(10,2)
	local sVar = Actor.getStaticVar(sysarg)
	local y,m,d = System.getDate( 0, 0, 0 )
	local curDt = y * math.pow(10,4) + m *math.pow(10,2) + d
	local newCount = count
	if sVar.AnswerTimes and curDt == math.floor(sVar.AnswerTimes/baseNum) then
		local lastCount = sVar.AnswerTimes % baseNum
		newCount = lastCount + count
	end
	sVar.AnswerTimes = curDt * baseNum + newCount
end

--金币答题
function CoinAnswer( sysarg )
	--print("AnswerCommon.CoinAnswer()")
	local nHour,nMin,nSec = System.getTime(0,0,0)
	local noTimeTab = AnswerConfig.NoAnswerTime[nHour]
	if noTimeTab and nMin >= noTimeTab[1] and nMin <= noTimeTab[2] then	--该段时间不能答题
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.ans017, ttFlyTip)
		return
	end
	if not Actor.checkActorLevel(sysarg, AnswerConfig.CoinMinLevel, 0) then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.ans005, AnswerConfig.CoinMinLevel), ttFlyTip)
		return
	end
	local myCoin = Actor.getIntProperty( sysarg, PROP_ACTOR_COIN )
	local todayCount = GetTodayAnswerTime(sysarg)		--今日答题次数
	local answerFee = AnswerConfig.CoinFee * (todayCount + 1)
	if myCoin < answerFee then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.ans011,answerFee), ttFlyTip)
		return
	end
	local dVar = Actor.getDyanmicVar(sysarg)
	if dVar.PerCurAnsSel and dVar.PerExtFlag then		--已经在答题中
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.ans012, ttFlyTip)
		return
	end

	local useCount = GetTodayAnswerTime(sysarg)
	local lastCount = AnswerConfig.CoinCount
	if useCount > 0 then
		lastCount = lastCount - useCount
	end
	if lastCount <= 0 then		--答题次数用完
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.ans016, AnswerConfig.CoinCount), ttFlyTip)
		return
	end
	Actor.closeNPCDialog(sysarg)
	if Actor.changeMoney( sysarg, mtCoin, -answerFee, GameLog.clEquipForgeMoney, Lang.LogTips.yb004) then
		SetTodayAnswerTime( sysarg, 1)
		GetPerAnswerList(sysarg)	--获取答题列表
		Actor.setWorkDayMask(sysarg, 0, 10, true)
		--SendPerAnswerContent(sysarg)
	end
	--SendAnswerContent(sysarg)
end

function GetNextAnswerFee( sysarg )
	local todayCount = GetTodayAnswerTime(sysarg)
	return AnswerConfig.CoinFee * (todayCount + 1)
end

--提示金币答题
function NoticeCoinAnswer( sysarg )
	local useCount = GetTodayAnswerTime(sysarg)
	local lastCount = AnswerConfig.CoinCount
	if useCount > 0 then
		lastCount = lastCount - useCount
	end
	if lastCount <= 0 then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.ans016, AnswerConfig.CoinCount), ttFlyTip)
	else
		local noticeStr = string.format(Lang.ScriptTips.ans009, GetNextAnswerFee(sysarg))
		local ensureStr = string.format("%s/CoinAnswer", Lang.ScriptTips.ans010)
		local cancelStr = string.format("%s/cancelFunc", Lang.ScriptTips.x00051)
		Actor.messageBox(sysarg, 0, 0, noticeStr, ensureStr, cancelStr, NULL)
	end
end

--玩家答案选择（免费答题）
--答对了，给与奖励
function OnAnswerSelectedFree(sysarg, optType, ansType, optResult)
	print("CommonAnswer.OnAnswerSelectedFree(),	optType="..optType)
	print("CommonAnswer.OnAnswerSelectedFree(),	ansType="..ansType)
	print("CommonAnswer.OnAnswerSelectedFree(),	optResult="..optResult)

	if ansType == SubType_Coin then
		return
	end

	if optType == Type_Answer then
		SelectAnswer( sysarg, ansType, optResult)
	elseif optType == Type_Over then
		local useCount = GetTodayAnswerTime(sysarg)
		local lastCount = AnswerConfig.CoinCount
		if useCount > 0 then
			lastCount = lastCount - useCount
		end
		SendAnswerPack(sysarg, SC_AnswerOver, ansType, useCount, lastCount, GetNextAnswerFee(sysarg))
		ClearAnswerSVar(sysarg, ansType)
	elseif optType == Type_RequestAnswer then
		if ansType == SubType_Free then
			StartFreeAnswer( sysarg )
		else
			NoticeCoinAnswer(sysarg)
		end
	else	--双倍，排除、一击命中
		SetAnswerExtOpt( sysarg, optType, ansType )
	end
end

--答案选择(金币答题)
--此方法，接受客户端的请求；
--对于答题，服务器每20秒判断一次，客户端在第17秒的时候讲答案发给服务器，并同时判断正确、错误或者超时
function OnAnswerSelected( sysarg, optType, ansType, optResult )
	print("CommonAnswer.OnAnswerSelected(),	optType="..optType)
	print("CommonAnswer.OnAnswerSelected(),	ansType="..ansType)
	print("CommonAnswer.OnAnswerSelected(),	optResult="..optResult)
	
	if ansType == SubType_Free then
		if optType == Type_Answer then	--免费答题，不接受外部传入答案
			return
		else
			OnAnswerSelectedFree(sysarg, optType, ansType, optResult)
		end
	end

	if optType == Type_Answer then
		SelectAnswer( sysarg, ansType, optResult)
	elseif optType == Type_Over then
		local useCount = GetTodayAnswerTime(sysarg)
		local lastCount = AnswerConfig.CoinCount
		if useCount > 0 then
			lastCount = lastCount - useCount
		end
		SendAnswerPack(sysarg, SC_AnswerOver, ansType, useCount, lastCount, GetNextAnswerFee(sysarg))
		ClearAnswerSVar(sysarg, ansType)
	elseif optType == Type_RequestAnswer then
		if ansType == SubType_Free then
			StartFreeAnswer( sysarg )
		else
			NoticeCoinAnswer(sysarg)
		end
	else
		SetAnswerExtOpt( sysarg, optType, ansType )
	end
end

function cancelFunc( sysarg )

end

function InitPaTaRanking()
	local ranking = Ranking.getRanking( Lang.Rank.FubenRank )
	if not ranking then
		ranking = Ranking.add( Lang.Rank.FubenRank, 1000, 1, 10 )
		if ranking then			
			if not Ranking.load(ranking, Lang.Rank.FubenRank) then
				Ranking.addColumn(ranking, "name")
				Ranking.addColumn(ranking, "job")
				Ranking.addColumn(ranking, "level")
			end
			Ranking.addRef( ranking )
		end
		--Ranking.save(ranking, Lang.Rank.FubenRank)
	end
	return ranking
end

function InitLastWeekRank()
	local ranking = Ranking.getRanking( Lang.Rank.LastWeekAnswer )
	if not ranking then
		ranking = Ranking.add( Lang.Rank.LastWeekAnswer, 10, 0)
		if ranking then
			if not Ranking.load(ranking, Lang.Rank.LastWeekAnswer) then
				Ranking.addColumn(ranking, "name")
				Ranking.addColumn(ranking, "reward")
			end
			Ranking.addRef( ranking )
		end
		--Ranking.save(ranking, Lang.Rank.LastWeekAnswer)
	end
	return ranking
end

function InitRanking()
	local ranking = Ranking.getRanking( Lang.Rank.AnswerRank )
	if not ranking then
		ranking = Ranking.add( Lang.Rank.AnswerRank, 1000, 1, 10 )
		if ranking then			
			if not Ranking.load(ranking, Lang.Rank.AnswerRank) then
				Ranking.addColumn(ranking, "name")
				Ranking.addColumn(ranking, "job")
				Ranking.addColumn(ranking, "level")
				Ranking.addColumn(ranking, "title")
			end
			Ranking.addRef( ranking )
		end
		--Ranking.save(ranking, Lang.Rank.AnswerRank)		
	end
	return ranking
end

function ClearPlayerAnsPoint( sysarg )
	local sVar = Actor.getStaticVar(sysarg)
	sVar.AnswerPoints = nil
	sVar.LastGetAnswerPtDt = nil
	Actor.setUIntProperty(sysarg, PROP_ACTOR_KNOWLEDGE_POINT, 0)
end

--充值答题数据
--每周日23点59分点调用（ScriptTimer.lua）
function ResetAnswerRank()
	local sysVar = System.getStaticVar()
	local ranking = Ranking.getRanking( Lang.Rank.AnswerRank )	--获取本周答题排行榜
	local lastRanking = Ranking.getRanking( Lang.Rank.LastWeekAnswer )	--获取上周答题排行榜
	if not ranking or not lastRanking then
		return
	end
	local lastItem = Ranking.getItemFromIndex(lastRanking, 0)
	if lastItem then
		local oldTopName = Ranking.getSub(lastItem, 0)
		local oldTopPtr = Actor.getActorPtrByName(oldTopName)
		if oldTopPtr then
			--Actor.setTopTitle(oldTopPtr, AnswerConfig.TitleId, false)
		end
	end
	local size = AnswerConfig.TopCount - 1
	Ranking.clearRanking( lastRanking )
	for i = 0, size do
		local item = Ranking.getItemFromIndex(ranking, i)
		if item then
			local myName = Ranking.getSub(item, 0)
			local myId = Ranking.getId(item)
			local myPoint = Ranking.getPoint(item)
			local lastItem = Ranking.addItem(lastRanking, myId, myPoint)
			if lastItem then
				Ranking.setSub(lastItem, 0, myName)
				Ranking.setSub(lastItem, 1, "0")
			end
			if i == 0 then
				local newTopPtr = Actor.getActorPtrByName(myName)
				if newTopPtr then
					--Actor.setTopTitle(newTopPtr, AnswerConfig.TitleId, true)
				end
			end
		end
	end
	--Ranking.save(lastRanking, Lang.Rank.LastWeekAnswer)
	sysVar.AnswerResetDt = System.getCurrMiniTime()
	local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
	for k, v in ipairs(playerList or {}) do
		ClearPlayerAnsPoint(v)
	end		
	Ranking.clearRanking(ranking)
	--Ranking.save(ranking, Lang.Rank.AnswerRank)
end

function SendAnswerAwardList( sysarg )
	local netPack = DataPack.allocPacket(sysarg, 139, 52)  --申请一个数据包
	if not netPack then
		return
	end
	local size = AnswerConfig.TopCount
	DataPack.writeByte(netPack, size)
	for i = 1, size do
		local idx = i
		if idx > 4 then
			idx = 4
		end
		local awardCfg = AnswerConfig.AnswerAward[idx]
		if awardCfg then
			DataPack.writeByte( netPack, awardCfg.type)
			DataPack.writeInt(netPack, awardCfg.id)
			DataPack.writeInt(netPack, awardCfg.count)
		end
	end
	DataPack.flush(netPack)
end


function SendToCenterCity( sysarg )
	local pos = AnswerConfig.CityPos
	if Actor.canTelport(sysarg, pos[1]) then	
		System.telportScene(sysarg, pos[1], pos[2], pos[3])
	end
end

--发送答题区域中心点
function SendAnswerAreaCenter(sysarg)
	print("AnswerCommon.SendAnswerAreaCenter()")
	local answerAreaCenter = AnswerConfig.AnswerAreaCenter
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sSendAnswerAreaCenter)  --申请一个数据包
	if netPack then
		DataPack.writeShort(netPack, answerAreaCenter.areaA[1])
		DataPack.writeShort(netPack, answerAreaCenter.areaA[2])
		DataPack.writeShort(netPack, answerAreaCenter.areaB[1])
		DataPack.writeShort(netPack, answerAreaCenter.areaB[2])
		DataPack.writeShort(netPack, answerAreaCenter.areaC[1])
		DataPack.writeShort(netPack, answerAreaCenter.areaC[2])
		DataPack.writeShort(netPack, answerAreaCenter.areaD[1])
		DataPack.writeShort(netPack, answerAreaCenter.areaD[2])
		DataPack.flush(netPack)
	end
end

--开始答题到的秒数
function GetSecondToBegin(sysarg)
	local sysVar = System.getDyanmicVar()
	local seconds1 = System.getCurrMiniTime() - sysVar.DoAnswerTime
	print("AnswerCommon.GetSecondToBegin() seconds1="..seconds1)
	local seconds2 = 300 - seconds1
	if seconds2 < 0 then
		seconds2 = 0
	end
	return seconds2
end