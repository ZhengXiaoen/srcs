--lua script

--#include "PaTaCommon.lua" once


PaTaSystemImplement = function (sysarg, systemid, msgid, packet)
	if msgid == cInitData then
		local sysVar = System.getStaticVar()
		local netPack = DataPack.allocPacket(sysarg, systemid, sInitData)  --申请一个数据包
		if netPack then
			DataPack.writeInt(netPack, GetMyRank(sysarg))
			local arrLen = 0
			for k, v in ipairs(PaTaFBConfig) do
				arrLen = arrLen + #v.fubens
			end
			local useTimes, allTimes = GetFubenTimes(sysarg)
			DataPack.writeByte(netPack, useTimes)
			DataPack.writeByte(netPack, allTimes)
			DataPack.writeByte(netPack, arrLen)
			for k, v in ipairs(PaTaFBConfig) do
				for _, fbCfg in ipairs(v.fubens) do
					DataPack.writeByte(netPack, fbCfg.fubenId)
					local masterName = "-"
					if sysVar.PaTaBossMasters and sysVar.PaTaBossMasters[fbCfg.fubenId] then
						masterName = sysVar.PaTaBossMasters[fbCfg.fubenId]
					end
					DataPack.writeString(netPack, masterName )
				end
			end
			DataPack.flush(netPack)
		end
	elseif msgid == cGetReward then
		SendFbReward(sysarg, systemid)
	elseif msgid == cFubenOpt then
		local optType = DataPack.readByte(packet)
		local param1 = DataPack.readByte(packet)
		local param2 = DataPack.readByte(packet)
		FubenOpt( sysarg, optType, param1, param2 )
	end
end

function FubenOpt( sysarg, optType, param1, param2 )
	if optType == Opt_EnterFuben then
		local ptInfo = GetGloPaTaInfo(sysarg)
		if ptInfo then
			return
		end
		if Actor.canTelport(sysarg, 0) then
			readyEnterFB(sysarg, param1)
			local useTimes, allTimes = GetFubenTimes(sysarg)
			SendPaTaFubenPack(sysarg, SendOpt_AllTimes, useTimes, allTimes)
		end
	elseif optType == Opt_StartPass then
		StartPassFb(sysarg, param1, param2)
	elseif optType == Opt_OverPass then		
		ClearGloPaTaInfo(sysarg)
		SendPaTaFubenPack(sysarg, SendOpt_OverPass)
	elseif optType == Opt_ImmediatelyFin then
		ImmediatelyFinish(sysarg)
	elseif optType == Opt_AddTimes then
		AddPaTaTimes( sysarg, param1 )
	elseif optType == Opt_Challenge then
		ChallengeMaster( sysarg, param1 )
	end
end

function ImmediatelyFinish( sysarg )
	local ptInfo = GetGloPaTaInfo(sysarg)
	if ptInfo then
		local fbCfg = GetPaTaFbCfg(ptInfo.fubenId)
		if not fbCfg then
			return
		end
		local dVar = System.getDyanmicVar()
		if dVar.PataRankFlag then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.pataNotice023, ttFlyTip)
			return
		end

		local needMoney = (ptInfo.selectTimes - ptInfo.times) * fbCfg.speedFin.count
		if needMoney <= 0 then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.pataNotice004, ttFlyTip)
			return
		end
		local moneyName = moneyTypeName[fbCfg.speedFin.type]
		if fbCfg.speedFin.type == mtYuanbao then				--如果是元宝，优先消耗绑定的
			local moneyName = moneyTypeName[fbCfg.speedFin.type]
			local bindYbCount = Actor.getIntProperty( sysarg, moneyTypeMap[mtBindYuanbao])
			local ybCount = Actor.getIntProperty( sysarg, moneyTypeMap[mtYuanbao])
			local allMyMoney = bindYbCount + ybCount
			if allMyMoney < needMoney then
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.pataNotice005, needMoney, moneyName), ttFlyTip)
				return
			end
			if bindYbCount > 0 then
				local consumeBindCount = needMoney
				if bindYbCount < needMoney then
					consumeBindCount = bindYbCount
				end
				if Actor.changeMoney(sysarg, mtBindYuanbao, -consumeBindCount, GameLog.clFinishPaTa, Lang.LogTips.yb027) then
					needMoney = needMoney - consumeBindCount
				end
			end
			if needMoney > 0 then
				Actor.changeMoney(sysarg, mtYuanbao, -needMoney, GameLog.clFinishPaTa, Lang.LogTips.yb027)
			end
			OnImmediatelyFubens(sysarg, ptInfo.fubenId)
		else		--其他币种，有什么就指定消耗什么			
			local moneyPropId = moneyTypeMap[fbCfg.speedFin.type]
			local myMoney = Actor.getIntProperty( sysarg, moneyPropId)
			if myMoney < needMoney then
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.pataNotice005, needMoney,moneyName), ttFlyTip)
				return
			end
			if Actor.changeMoney(sysarg, fbCfg.speedFin.type, -needMoney, GameLog.clFinishPaTa, Lang.LogTips.yb027) then
				OnImmediatelyFubens(sysarg, ptInfo.fubenId)
			end
		end
	end
end

function StartPassFb( sysarg, fubenId, passTimes )
	if not Actor.hasMapAreaAttri(sysarg, aaSaftRelive) or not Actor.hasMapAreaAttri(sysarg, aaSaft) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.pataNotice002, ttFlyTip)
		return
	end
	if passTimes <= 0 then
		return
	end
	local useTimes, allTimes = GetFubenTimes(sysarg)
	if useTimes + passTimes > allTimes then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.pataNotice006, ttFlyTip)
		return
	end
	local ptInfo = GetGloPaTaInfo(sysarg)
	if ptInfo then
		if ptInfo.selectTimes > ptInfo.times then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.pataNotice001, ttFlyTip)
			return
		end
	end
	local fbCfg, minLv = GetPaTaFbCfg( fubenId )
	if fbCfg then
		if fbCfg.circle and not Actor.checkActorLevel(sysarg, minLv, fbCfg.circle) then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.pataNotice024, fbCfg.circle, minLv), ttFlyTip)
			return
		end
		local moneyName = moneyTypeName[fbCfg.needCoin.type]
		local moneyPropId = moneyTypeMap[fbCfg.needCoin.type]
		local myMoney = Actor.getIntProperty(sysarg, moneyPropId )
		if myMoney < fbCfg.needCoin.count then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.pataNotice003, fbCfg.needCoin.count,moneyName), ttFlyTip)
			return
		end
		if Actor.changeMoney( sysarg, fbCfg.needCoin.type, -fbCfg.needCoin.count, GameLog.clAddQuest, Lang.LogTips.yb028) then
			local needSecs = fbCfg.OneFbSecs * passTimes
			local nNowDt = System.getCurrMiniTime()
			Actor.regScriptCallback(sysarg, 0, fbCfg.OneFbSecs * 1000, fbCfg.OneFbSecs * 1000, passTimes, "OnFinishFubenPass", fubenId)
			SendPaTaFubenPack(sysarg, SendOpt_StartPass, needSecs)
			SetGloPaTaInfo(sysarg, fubenId, passTimes, nNowDt + needSecs)
			Actor.addState(sysarg, esPaTaFubenBattle)
			Actor.triggerQuestEvent(sysarg, 127, 50096, 1)
		end
	end
end


function SendFbReward( sysarg, systemid )
	local netPack = DataPack.allocPacket(sysarg, systemid, sSendReward)  --申请一个数据包
	if netPack then
		DataPack.writeByte(netPack, #PaTaReward)
		for k, v in ipairs(PaTaReward) do
			DataPack.writeByte(netPack, v.type)
			DataPack.writeInt(netPack, v.id)
			DataPack.writeInt(netPack, v.count)
		end
		DataPack.flush(netPack)
	end
	
end


function OnImmediatelyFubens( sysarg, fubenId )
	local fbCfg = GetPaTaFbCfg( fubenId )
	if fbCfg then
		local ptInfo = GetGloPaTaInfo(sysarg)
		if ptInfo then
			local curTimes = ptInfo.times + 1
			for i = curTimes, ptInfo.selectTimes do
				ptInfo.award[i] = {}
				DropProbabilityIndexAward(sysarg, fbCfg.finishAwards, ptInfo.award[i])
				DeductFubenTimes(sysarg, fubenId)
				AddPoints(sysarg, fubenId)
			end

			local netPack = DataPack.allocPacket(sysarg, 142, sSendImmediatelyAward)  --申请一个数据包
			if netPack then
				DataPack.writeByte(netPack, ptInfo.selectTimes - ptInfo.times)				
				for i = curTimes, ptInfo.selectTimes do
					local t = ptInfo.award[i]
					local count = #t
					DataPack.writeByte(netPack, i)
					DataPack.writeByte(netPack, count)
					for k = 1, count do
						DataPack.writeByte(netPack, t[k][1])
						DataPack.writeInt(netPack, t[k][2])
						DataPack.writeInt(netPack, t[k][3])
					end
				end
				DataPack.flush(netPack)   --做一个包发送完
			end
			ptInfo.times = ptInfo.selectTimes
			ptInfo.deadline = 0
			local useTimes, allTimes = GetFubenTimes(sysarg)
			SendPaTaFubenPack(sysarg, SendOpt_AllTimes, useTimes, allTimes)
			ClearGloPaTaInfo(sysarg)
		end
	end
end

SystemHandlerDispatcher.registerSystemHander(BaseTypes.SystemId.paTaSystem, PaTaSystemImplement)