-- 膜拜城主活动

--#include "data\config\activity\StdActivityCfg.lua" once

-- 开始膜拜城主活动
function StartActivity_Worship(timeIdx)
	print("膜拜城主活动 开始")
	
	local dVar = System.getDyanmicVar()
	dVar.WorshipActiviteTime = System.getCurrMiniTime()
	
	-- 每8秒一次
	System.addTimer("worship_on_timer", 8 * 1000, -1)
end

-- 结束膜拜城主活动
function EndActivity_Worship(timeIdx)
	print("膜拜城主活动 结束")	
	
	System.deleteTimer("worship_on_timer")
	
	local dVar = System.getDyanmicVar()
	dVar.WorshipActiviteTime = nil
end

function worship_on_timer(leftTimes)
	local dVar = System.getDyanmicVar()
	local activiteTime = dVar.WorshipActiviteTime
	if activiteTime == nil then -- 活动已经结束
		return
	end
	
	local cfg = StdActivityCfg.MoBeiChongZhu
	
	if checkActivityTime(cfg.tOpenTime.times) == 0 then
		return -- 活动已经结束
	end	
	
	local scenePtr = Fuben.getSceneById(cfg.sceneId, 0)
	if scenePtr == nil then return end
	
	-- NPC 雕像位置
	local npcX = cfg.RwData[3]
	local npcY = cfg.RwData[4]
	local playerList = LuaHelp.getNearEntityListFromRange(scenePtr, npcX, npcY, 10, 10, 0)
	if playerList == nil then return end
	
	for i, v in ipairs(playerList) do
		worship_give_exp(v, cfg, activiteTime)
	end
end

function worship_give_exp(sysarg, cfg, activiteTime)	
	-- 是否还活着
	if Actor.isDeath(sysarg) then return end	
		
	local var = Actor.getStaticVar(sysarg)
	local varDays = var.days
	
	local oldPaodianExp = 0
	if varDays.paodianTime == nil or varDays.paodianTime ~= activiteTime then
		-- 非本次活动是活动数据清0
		varDays.paodianTime = activiteTime
		varDays.paodianExp = 0
	else
		oldPaodianExp = varDays.paodianExp
		if oldPaodianExp == nil then oldPaodianExp = 0 end
	end	
	
	-- 这次活动获得的泡点经验
	local addexp = worship_get_paodian_exp_award(sysarg, cfg.pdAward)
	if addexp == 0 then return end
	
	oldPaodianExp = oldPaodianExp + addexp
	varDays.paodianExp = oldPaodianExp
	
	Actor.addExp(sysarg, addexp, LogIds.paodianAddExp, 0)
	
	local mobaiExp = varDays.mobaiExp
	if mobaiExp == nil then mobaiExp = 0 end
	local mobaiTimes = varDays.mobaiTimes
	if mobaiTimes == nil then mobaiTimes = 0 end
	
	sendActivityDataWorship(sysarg, oldPaodianExp, mobaiExp, mobaiTimes)
end

-- 计算经验奖励
function worship_get_paodian_exp_award(sysarg, pdAward)
	local nExp = 0;
	local plv = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	for i, v in ipairs(pdAward) do
		if (plv >= v.minlv and (plv <= v.maxlv or v.maxlv == -1)) then
			nExp = v.exp
			break
		end
	end
	return nExp
end

-- 更新活动数据
function sendActivityDataWorship(sysarg, paodianExp, mobaiExp, mobaiTimes)
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, 5) -- 活动类型
	
	DataPack.writeUInt(netPack, paodianExp) -- 泡点经验
	DataPack.writeUInt(netPack, mobaiExp) -- 膜拜经验
	DataPack.writeByte(netPack, mobaiTimes) -- 膜拜次数
	
	DataPack.flush(netPack)
end

-- 获得膜拜界面数据
function GetWorshipDialogData(sysarg)	
	local sGuildName = "无"	
	local sMasterName = "无"	
	local guildid = Guild.getSbkCityOwnerGuildId()
	if guildid > 0 then
		sGuildName = Guild.getGuildName(guildid)
		sMasterName = Guild.getSbkCityOwnerName()
	end
	
	local cfg = StdActivityCfg.MoBeiChongZhu
	local tTimes = cfg.tOpenTime.times
	local sActivityTime = string.format("%02d:%02d-%02d:%02d %02d:%02d-%02d:%02d", tTimes[1][1], tTimes[1][2], tTimes[1][3], tTimes[1][4], tTimes[2][1], tTimes[2][2], tTimes[2][3], tTimes[2][4]);
	
	local var = Actor.getStaticVar(sysarg)
	local mobaiRewardIdx = var.days.mobaiRewardIdx
	if not mobaiRewardIdx then mobaiRewardIdx = 1 end
	
	local multiple = 1
	if cfg.psmbAward[mobaiRewardIdx] ~= nil then
		multiple = cfg.psmbAward[mobaiRewardIdx].multiple
	end
	
	local sysdvar = System.getDyanmicVar();
	local nDespise = sysdvar.psczNum;			-- 鄙视人数
	if not nDespise then nDespise = 0; end
	
	local nWorship = sysdvar.mbczNum;			-- 膜拜人数
	if not nWorship then nWorship = 0; end
	
	local nTotal = nDespise + nWorship;				-- 总人数
	local psPercen = 0;
	local mbPercen = 0;
	if nDespise > 0 then
		psPercen = tonumber(string.format("%.0f", (nDespise/nTotal)*100));
	end
	
	if nWorship > 0 then
		mbPercen = tonumber(string.format("%.0f", (nWorship/nTotal)*100));
	end
	
	local mobaiTimes = var.days.mobaiTimes			-- 今天膜拜鄙视次数
	if not mobaiTimes then mobaiTimes = 0 end

	local sData = sMasterName..","..sActivityTime..","..sGuildName..","..multiple..","..psPercen..","..mbPercen..","..mobaiTimes
	return sData;
end

function OpenWorshipDialog(sysarg)
	local sData = GetWorshipDialogData(sysarg)	
	Actor.openDialogs(sysarg, diWorshipDlg, sData)
end

-- 刷新奖励
function WorshipRefreshAward(sysarg, packet)
	local nType = DataPack.readByte(packet) -- 1=刷新奖励, 2=一键十倍
		
	local dVar = System.getDyanmicVar()
	if dVar.WorshipActiviteTime == nil then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.mb00011, ttFlyTip)
	end
	
	local cfg = StdActivityCfg.MoBeiChongZhu
	if checkActivityTime(cfg.tOpenTime.times) == 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.mb00011, ttFlyTip)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local mobaiRewardIdx = var.days.mobaiRewardIdx
	if not mobaiRewardIdx then mobaiRewardIdx = 1 end
	
	local psmbAward = cfg.psmbAward
	if mobaiRewardIdx >= #psmbAward then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.mb00003, ttFlyTip)
		return
	end
	
	if nType == 1 then
		if Actor.changeMoney(sysarg, mtBindCoin, -cfg.bindcoinRefresh, LogIds.mobaiRefreshConsume, Lang.LogTips.bc0001) == false then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mb00007, cfg.bindcoinRefresh/10000), ttFlyTip)
			return
		end
		
		if math.random(1, 10000) > psmbAward[mobaiRewardIdx + 1].rate then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mb00001, psmbAward[mobaiRewardIdx].multiple), ttFlyTip)
			return
		end
		
		mobaiRewardIdx = mobaiRewardIdx + 1
		var.days.mobaiRewardIdx = mobaiRewardIdx
	else
		if Actor.changeMoney(sysarg, mtYuanbao, -cfg.ybRefresh, LogIds.ybRefreshMultipleConsume, Lang.LogTips.yb051) == false then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mb00006, cfg.ybRefresh), ttFlyTip)
			return
		end		
		
		mobaiRewardIdx = #psmbAward
		var.days.mobaiRewardIdx = mobaiRewardIdx
	end
	
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mb00002, psmbAward[mobaiRewardIdx].multiple), ttFlyTip)
	
	-- 下发刷新成功
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sWorshipRefreshAward)
	DataPack.writeByte(netPack, mobaiRewardIdx)
	DataPack.flush(netPack)
end

-- 膜拜或者鄙视皇城城主
function DespiseOrWorshipWCCZ(sysarg, packet)
	local supportType = DataPack.readByte(packet) -- 支持类型 1=膜拜, 2=鄙视
	
	local dVar = System.getDyanmicVar()
	if dVar.WorshipActiviteTime == nil then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.mb00011, ttFlyTip)
	end
	
	local cfg = StdActivityCfg.MoBeiChongZhu
	if checkActivityTime(cfg.tOpenTime.times) == 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.mb00011, ttFlyTip)
		return
	end
		
	local var = Actor.getStaticVar(sysarg)
	local mobaiTimes = var.days.mobaiTimes
	if not mobaiTimes then mobaiTimes = 0 end
	
	if mobaiTimes >= cfg.maxTimes then
		Actor.sendTipmsg(sysarg, "您今天的膜拜次数已经用完了,请您明天再来!", ttFlyTip)
		return
	end
	
	local mobaiRewardIdx = var.days.mobaiRewardIdx
	if not mobaiRewardIdx then mobaiRewardIdx = 1 end
	
	local addexp = 0
	local awardItem = cfg.psmbAward[mobaiRewardIdx]
	if awardItem ~= nil then
		addexp = awardItem.exp
	else
		addexp = cfg.psmbAward[1].exp
	end
	
	if supportType == 1 then
		Actor.addExp(sysarg, addexp, LogIds.mobaiAddExp, 0)
	else
		Actor.addExp(sysarg, addexp, LogIds.bishiAddExp, 0)
	end
	
	var.days.mobaiRewardIdx = nil
	
	local oldMobaiExp = var.days.mobaiExp
	if oldMobaiExp ~= nil then
		oldMobaiExp = oldMobaiExp + addexp
	else
		oldMobaiExp = addexp
	end
	var.days.mobaiExp = oldMobaiExp
	
	mobaiTimes = mobaiTimes + 1
	var.days.mobaiTimes = mobaiTimes	
	
	local nWorship = dVar.mbczNum		-- 膜拜人数
	if not nWorship then nWorship = 0 end
	
	local nDespise = dVar.psczNum		-- 鄙视人数
	if not nDespise then nDespise = 0 end
	
	if supportType == 1 then -- 1=膜拜, 2=鄙视
		nWorship = nWorship + 1
		dVar.mbczNum = nWorship
	else
		nDespise = nDespise + 1
		dVar.psczNum = nDespise
	end
	
	local nTotal = nDespise + nWorship -- 总人数
	local psPercen = 0;
	local mbPercen = 0;
	if nDespise > 0 then
		psPercen = tonumber(string.format("%.0f", (nDespise/nTotal)*100));
	end
	
	if nWorship > 0 then
		mbPercen = tonumber(string.format("%.0f", (nWorship/nTotal)*100));
	end	
	
	local RwData = cfg.RwData
	local name = Actor.getName(sysarg)
	local rwDataIdx = 0
	local opName = ""
	if supportType == 1 then		-- 膜拜
		rwDataIdx = 6
		opName = RwData[8]
	else
		rwDataIdx = 5
		opName = RwData[7]
	end
	
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[rwDataIdx], RwData[2], RwData[3], RwData[4], RwData[rwDataIdx])
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[rwDataIdx])
	System.broadcastTipmsg(string.format(Lang.ScriptTips.mb00008, name, RwData[1], opName, addexp), ttScreenCenter)
	System.broadcastTipmsg(string.format(Lang.ScriptTips.mb00005, name, RwData[1], opName, addexp, NpcName, NpctFly), ttChatWindow)
		
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mb00012, addexp, cfg.maxTimes - mobaiTimes), ttFlyTip)
	
	-- 下发支持率
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sStatueWorshipBack)
	DataPack.writeByte(netPack, 1)	-- 刷新倍
	DataPack.writeByte(netPack, psPercen)	-- 鄙视百分比
	DataPack.writeByte(netPack, mbPercen) -- 膜拜百分比
	DataPack.flush(netPack)
end