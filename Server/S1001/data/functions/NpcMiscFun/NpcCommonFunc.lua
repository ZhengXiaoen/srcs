
--#include "data\config\store\NPCStore.lua" once
--#include "data\functions\player.lua" once
--#include "data\config\quest\CircleQuest.lua" once  -- 跑环任务

NpcCommonFunc.NPCTradeInfoToClient = function(sysarg, npcId, typeid)
	typeid = tonumber( typeid ) 
	local sellconfig = NPCStore[typeid]

	if not sellconfig or sellconfig.npcid ~= (typeid-1) then
		return
	end

	sellconfig = NPCStore[typeid+1]
	local netPack = DataPack.allocPacket(sysarg,133,3)  --申请一个数据包
	if netPack then
		local len_c_pack = table.getn(sellconfig)
		DataPack.writeChar(netPack,len_c_pack)
		for i = 1, len_c_pack do
			local s = sellconfig[i]
			DataPack.writeString(netPack,s.selltip)

			local silen = table.getn(s.items)
			DataPack.writeByte(netPack,silen)

			for x = 1, silen do
				DataPack.writeWord(netPack, s.items[x])
			end
		end
		DataPack.writeChar(netPack, typeid)
		DataPack.flush(netPack)
	
	end
end


-- 对话框 取消 按钮的函数
function NpcCommonFunc.OnCancleBtn(sysarg, npcId)
end

function continueQuestTalk(sysarg)
	--如果交任务后还有可继续的任务状态，则返回主界面
	local newState = Actor.getQuestStateType( sysarg )
	if newState == 1 or newState == 2 then
		return commonQuestNpcMain(sysarg)
	else
		Actor.closeNPCDialog( sysarg )
	end
end


--显示一个任务的内容，ms是任务的配置表，state 0： 可接 1： 可完成 	2： 进行中
function NpcCommonFunc.ShowQuestDetail(sysarg, npcId, questId,state, boMulti)
	questId = tonumber(questId)
	state = tonumber(state)
	local content = System.getQuestDialog(questId, state)
	local btnstr = ""
	if state == 0 then		
		btnstr = "<#BN"..Lang.Event.e00003.."/@commonAcceptMissions," .. questId .. ">"
	elseif state == 1 then
		local doubleRwd = ""
		local doubleState, multiAward, mustUseYB = getQuestDoubleExpGold(sysarg, questId)
		if doubleState > 0 then
			local tipsFormat = Lang.ScriptTips.zf058
			if mustUseYB then
				tipsFormat = Lang.ScriptTips.zf059
			end
			local multiStr = string.format(Lang.Event.e00005B, multiAward)
			local tipStr = string.format(tipsFormat, doubleState,multiAward)
			doubleRwd = string.format("<#BN%s/@getDoubleReward,%d,%d><#BT%s/@OnCancleBtn>", multiStr, questId, doubleState, tipStr)
		end
		btnstr = "<#BN"..Lang.Event.e00003A.."/@CompleteMession," .. questId .. ">" .. doubleRwd
	else
		if System.getQuestType(questId) > 0 then
			btnstr = string.format("<#BN%s/@requestGiveupQuest,%d>", Lang.Event.e00031, questId)
		end
		if boMulti  then
			btnstr = string.format("<#BN%s/@commonQuestNpcMain,1>%s", Lang.Event.e00010, btnstr)
		else
			btnstr = string.format("<#BN%s/@exit>%s", Lang.Event.e00032, btnstr)
		end
		
	end
	return string.format("%s<(c0x0025E18D)%s>\\\\%s<@QuestAwardDesc,%d>\\%s",Lang.Event.e00029,System.getQuestTitle(questId),content,questId,btnstr)
end

function NpcCommonFunc.requestGiveupQuest( sysarg, npcId, questId )
	questId = tonumber(questId)
	if Actor.giveupQuest(sysarg, questId) then
		local questName = System.getQuestTitle( questId )
		Actor.sendTipmsg( sysarg, string.format(Lang.ScriptTips.x00200, questName),ttFlyTip )
		return main(sysarg)
	end
end


function getQuestDoubleExpGold( sysarg, nQid, boAgain )
	local questGold = 0
	local questRate = 0
	local questMulti = 0
	local mustUseYB = false
	local finTimes = Actor.getQuestTimes(sysarg, nQid, boAgain)
	if boAgain then
		questGold = Actor.getQuestAcceptAgain(sysarg, nQid)
		finTimes = finTimes + 1
		questRate = GlobalConfig.fQuestAcceptAgainRate
	else
		questGold, questMulti, mustUseYB = Actor.getQuestDoubleInfo(sysarg, nQid, 0, mustUseYB)
		finTimes = finTimes - 1
		if finTimes < 0 then
			finTimes = 0
		end
		questRate = GlobalConfig.fQuestDoubleAwardRate
	end
	if questGold > 0 then
		return math.floor(questGold * ( 1 + finTimes * questRate)), questMulti,mustUseYB
	end
	return 0, questMulti,mustUseYB
end

function NpcCommonFunc.getDoubleReward( sysarg, npcId, mission )
	local nQid = tonumber(mission)
	if Actor.getDoubleQuestAward(sysarg, nQid) then
		return continueQuestTalk( sysarg )
	end
end

function NpcCommonFunc.useYbAccpetQst( sysarg, npcId, questId )
	questId = tonumber(questId)
	if Actor.hasQuest(sysarg, questId) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf107, ttFlyTip)		
		return
	end
	return NpcCommonFunc.commonAcceptMissions( sysarg, npcId, questId, true)
end


function NpcCommonFunc.commonAcceptMissions(sysarg, npcId, mission, boAction)

	-- local idx = Actor.getRTIntValue( sysarg, MISSION_RTV_IDX_MISSIONIDX )
	local questId = tonumber(mission)
	--[[if ms.PromCheck then
		ck,id = QuestCheckFunc[ms.PromCheck](sysarg,mission, unpack(ms.PromCheckArg or {}))
		if not ck then
			Actor.sendTipmsg(sysarg,id,ttDialog)
		end
	end]]
  
	if Actor.getQuestCount(sysarg) >= 30 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.x00044,ttTipmsgWindow)
	else
		local acceptResult = false
		local questAgainGold = getQuestDoubleExpGold(sysarg, questId, true)
		if questAgainGold > 0 then
			local myGold = Actor.getIntProperty(sysarg,PROP_ACTOR_YUANBAO)
			if myGold < questAgainGold then
				local msgStr = string.format(Lang.ScriptTips.zf048, questAgainGold)
				Actor.sendTipmsg(sysarg, msgStr, ttDialog)
				return
			end
			if boAction then
				if Actor.changeMoney(sysarg, mtYuanbao, -questAgainGold, GameLog.clUseEntrust, Lang.LogTips.yb002) then
					acceptResult = Actor.addQuest( sysarg, questId, true )
				end
			else
				local NPChandle = Actor.getTargetHandle(sysarg)
				local noticeStr = string.format(Lang.ScriptTips.zf106, questAgainGold)
				local ensureStr = string.format("%s/useYbAccpetQst,%d", Lang.ScriptTips.mt00021, questId)
				Actor.messageBox(sysarg, NPChandle,0, noticeStr, ensureStr, Lang.ScriptTips.mt00022.."/OnCancleBtn", nil)
				return
			end
		else
			acceptResult = Actor.addQuest( sysarg, questId)
		end
		if acceptResult then
			--if ms.PromCallBack then
				--QuestAcceptFunc[ms.PromCallBack](sysarg,mission, unpack(ms.PromCallBackArg or {}))
			--end
			return continueQuestTalk( sysarg )
		end
	end
	Actor.closeNPCDialog( sysarg )
end



function NpcCommonFunc.CompleteMession(sysarg, npcId, mission, ...)
	-- local idx = Actor.getRTIntValue( sysarg, MISSION_RTV_IDX_MISSIONIDX )
	local questId = tonumber(mission)
	
	local award = -1
	if arg.n > 0 then 
		award = arg[1]
	end
 
	--[[local ck,rt
	if ms.CompCheck then
		ck,rt = ms.CompCheck(sysarg,mission)
		if not ck then
			return rt
		end
	end]]
	if Actor.finishQuest( sysarg, questId, award ) then
		OnPlayerFinishQuest(sysarg, questId)
		--rt = onFinishQuest(sysarg, mid, ms)
		if not rt or type(rt) ~= "string" then
			return continueQuestTalk( sysarg )
		end
	end
	
	Actor.closeNPCDialog( sysarg )
end

function onFinishQuest(sysarg, qid, ms)
	qid = tonumber(qid)
	if not ms then
		for i,v in pairs(CompMs) do
			if v.id == qid then			
				ms = v
				break
			end
		end
	end
	local rt = nil
	if ms and ms.CompCallBack then	
		if QuestFinishFunc[ms.CompCallBack] then
			rt = QuestFinishFunc[ms.CompCallBack](sysarg, qid, unpack(ms.CompCallbackArg or {}))
		end
	end
	return rt
end

function NpcCommonFunc.ShowQuestTalk(sysarg, npcId, questId, state, boOnly)
	questId = tonumber(questId)
	state = tonumber(state)
	local content = System.getQuestDialog(questId, state)
	local btnstr = ""
	if state == 0 then		
		btnstr = "<#BN"..Lang.Event.e00003.."/@commonAcceptMissions," .. questId .. ">"
	elseif state == 1 then
		local doubleRwd = ""
		local doubleState, multiAward, mustUseYB = getQuestDoubleExpGold(sysarg, questId)
		if doubleState > 0 then
			local tipsFormat = Lang.ScriptTips.zf058
			if mustUseYB then
				tipsFormat = Lang.ScriptTips.zf059
			end
			local multiStr = string.format(Lang.Event.e00005B, multiAward)
			local tipStr = string.format(tipsFormat, doubleState,multiAward)
			doubleRwd = string.format("<#BN%s/@getDoubleReward,%d,%d><#BT%s/@OnCancleBtn>", multiStr, questId, doubleState, tipStr)
		end
		btnstr = "<#BN"..Lang.Event.e00003A.."/@CompleteMession," .. questId .. ">" .. doubleRwd
	else
		if System.getQuestType(questId) > 0 then
			btnstr = string.format("<#BN%s/@requestGiveupQuest,%d>", Lang.Event.e00031, questId)
		end
		if boMulti  then
			btnstr = string.format("<#BN%s/@commonQuestNpcMain,1>%s", Lang.Event.e00010, btnstr)
		else
			btnstr = string.format("<#BN%s/@exit>%s", Lang.Event.e00032, btnstr)
		end
		
	end
	return string.format("%s<(c0x0025E18D)%s>\\\\%s<@QuestAwardDesc,%d>\\%s",Lang.Event.e00029,System.getQuestTitle(questId),content,questId,btnstr)
end

---------------------------------------------------------------------------------------
-- 过程任务（对话任务）
function NpcCommonFunc.talkWithNPC(sysarg, npcId, qid, tid)
	local qid = tonumber(qid)
	local tid = tonumber(tid)
	local q
	
	for idx, quest in ipairs(PassMs or {}) do
		if quest.id == qid then
			q = quest
			break
		end
	end
	if not q then
		return ""
	end
	local index = 1

	--[[for i = 1,#q.target do
		if q.target[i].id == tid then
			index = i
		end
	end ]]

	Actor.setQuestValue(sysarg,qid,tid,1)
	if q.PassMsTip[index] then
		return string.format("%s<#BL%s/@CloseNpcDialog>", q.PassMsTip[index], Lang.ScriptTips.x00079)
	else
		Actor.closeNPCDialog(sysarg)
	end
	return 
end

function NpcCommonFunc.CloseNpcDialog(sysarg, npcId)
	Actor.closeNPCDialog(sysarg)
end

function GetCfgFromTab( qid, qSubTab )
	for k, v in ipairs(qSubTab or {}) do
		if v.id == qid then
			return v
		end
	end
	return nil
end

function NpcCommonFunc.OnQuestTalk( sysarg, npcId, qid, targetId )
	local strTalk = ""
	if Actor.hasQuest(sysarg, qid) and not Actor.canFinishQuest(sysarg, qid ) then
		local randId = Actor.getQuestRandId(sysarg, qid)
		if randId >= 0 then
			local q = GetCfgFromTab(qid, PassMs)
			if q then
				local qCfg = q.target[randId + 1]
				if qCfg and qCfg.id == targetId then
					local questType = System.getQuestTypeName(qid)
					local questTitle = System.getQuestTitle(qid)
					if questType and questTitle then
						questTitle = string.format("（%s）%s", questType, questTitle)
					else
						questTitle = Lang.Event.e00028
					end
					strTalk = string.format("<\n%s/@talkWithNPC,%d,%d>", questTitle, qid, targetId)
				end
			end
		end
	end
	return strTalk
end

-- 和法随机索引
function GetRandIndex(tbl) -- 权重表,例如 {1,3,7}
	local totalWeight = 0;
	for i = 1, #(tbl) do
		totalWeight = totalWeight + tbl[i] or 0;
	end
	local r = math.random(totalWeight);
	local s = 0;
	for i = 1, #(tbl) do
		s = s + tbl[i] or 0;
		if s >= r then
			return i;
		end
	end
end

-- StdNpc.txt 中的 script ="DayCircleQuest"
function NpcCommonFunc.DayCircleQuest(sysarg, npcId, questId)
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL);
	if level < CircleQuestCfg.needLevel then
		return
	end
	
	questId = tonumber(questId)	
	local questCfg = CircleQuestCfg.List[questId]
		
	if questCfg == nil then
		--print("error! CircleQuestCfg.List["..questId.."]==nil")
		return
	end
		
	local var = Actor.getStaticVar(sysarg)
	local curQuestId = var.days.CircleQuestId and (var.days.CircleQuestId + 1) or 1
	
	if curQuestId ~= questId then -- 还没到该任务		
		return
	end
	
	local exp = 0
	local bindCoin = 0
	for i,v in ipairs(questCfg.awards) do
		if v.type == 2 then
			exp = exp + v.count
		elseif v.type == 5 then
			bindCoin = bindCoin + v.count
		end
	end
	
	--exp = math.floor(exp/10000) -- 转换为万
	
	local awardStr = "<(c0x00FAAA17)任务奖励:>\\<(iaward#2#1)><(c0xFF00FF00)经验 + "..exp..">"
	awardStr = awardStr .. "\\<(iaward#5#1)><(c0xFF00FF00)绑金 + "..bindCoin..">"

	local str = string.format("%s\\\\%s<#BN完成任务/@CompleteCircleQuest,%d>", questCfg.talk, awardStr, questId)
	
	return str
end

function NpcCommonFunc.CompleteCircleQuest(sysarg, npcId, questId)
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL);
	if level < CircleQuestCfg.needLevel then
		return
	end
	
	questId = tonumber(questId)	
	local questCfg = CircleQuestCfg.List[questId]
		
	if questCfg == nil then
		--print("error! CircleQuestCfg.List["..questId.."]==nil")
		return
	end
	
	-- 玩家可能会篡改 questId，所以这里要校验一下
	if questCfg.npcId ~= npcId then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local curQuestId = var.days.CircleQuestId and (var.days.CircleQuestId + 1) or 1
	
	if curQuestId ~= questId then -- 还没到该任务		
		return
	end

	if Awards.Give(sysarg, questCfg.awards, GameLog.cDayQuestCircle, tostring(questId)) == false then
		return
	end
	
	var.days.CircleQuestId = curQuestId -- 完成该任务
	
	-- 提示
	local exp = 0
	local bindCoin = 0
	for i,v in ipairs(questCfg.awards) do
		if v.type == 2 then
			exp = exp + v.count
		elseif v.type == 5 then
			bindCoin = bindCoin + v.count
		end
	end
	
	exp = math.floor(exp/10000) -- 转换为万
	bindCoin = math.floor(bindCoin/10000) -- 转换为万
	
	if curQuestId < #CircleQuestCfg.List then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf680, curQuestId, exp, bindCoin), ttFlyTip)
	else
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf681, curQuestId, exp, bindCoin), ttFlyTip) -- 当天的跑环任务已做完
	end
	
	-- 刷新任务
	Quest_ShuaXin(sysarg)
end
