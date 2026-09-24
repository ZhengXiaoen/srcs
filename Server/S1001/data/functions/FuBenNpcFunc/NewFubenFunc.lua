--#include "data\language\LangCode.txt" once
--#include "data\envir\FuBen.txt" once
--#include "data\envir\FubenCountConfig.lua" once
--#include "OnEnterFubenFunc.lua" once
--#include "data\envir\specialFb\FubenQuestMap.lua" once
--#include "data\envir\FuBenTongGuan.lua" once
--#include "data\envir\specialFb\MogongConfig.lua" once

function get_fb_default_enter_times(fubenId)
	local fubenCfg = FuBen[fubenId]
	if not fubenCfg or fubenCfg.fbid == nil then
		print("config error, FuBen[fubenId] == nil")
		return 0
	end

	local times = FubenCountConfig[fubenCfg.groupId]
	if times == nil then times = 0 end

	return times
end

-- 获得进入某个副本的剩余次数,购买的次数,默认次数
function get_fb_left_times(sysarg, fubenId)
	local enter_times = 0
	local buy_times = 0

	local sVar = Actor.getStaticVar(sysarg)
	if sVar.days.fbtms then
		local _fbtms = sVar.days.fbtms[fubenId]
		if _fbtms then
			enter_times = _fbtms[1]
			buy_times = _fbtms[2]
		end
	end

	if enter_times == nil then enter_times = 0 end
	if buy_times == nil then buy_times = 0 end

	local default_times = get_fb_default_enter_times(fubenId)
	local total_times = default_times + buy_times
	if enter_times >= total_times then
		return 0, buy_times, default_times
	end

	return (total_times - enter_times), buy_times, default_times
end

-- 增加进入副本的次数
function add_enter_fb_times(sysarg, fubenId)
	local sVar = Actor.getStaticVar(sysarg)
	if not sVar.days.fbtms then sVar.days.fbtms = {} end
	if not sVar.days.fbtms[fubenId] then sVar.days.fbtms[fubenId] = {} end

	local enter_times = sVar.days.fbtms[fubenId][1]
	if not enter_times then enter_times = 0 end

	sVar.days.fbtms[fubenId][1] = enter_times + 1
end

--设置进入副本的次数
function set_enter_fb_timesTo(sysarg,name, fubenId,n)

	local name =tostring(name)
	n = tonumber(n)
	--print(name)
	local pActor = Actor.getActorByName(name)
	if pActor then
		local sVar = Actor.getStaticVar(pActor)
		if not sVar.days.fbtms then sVar.days.fbtms = {} end
		if not sVar.days.fbtms[fubenId] then sVar.days.fbtms[fubenId] = {} end
	
		local enter_times = sVar.days.fbtms[fubenId][1]
		if not enter_times then enter_times = 0 end
	
		sVar.days.fbtms[fubenId][1] = n
	else 
		Actor.sendTipmsg(sysarg,"没有这人",ttFlyTip)
	end
end

function buy_fb_times(sysarg, fubenId)
	local cfg, idx = GetFubenInfoByFubenId(fubenId)
	if cfg == nil then return false end

	local but_times = 0
	local sVar = Actor.getStaticVar(sysarg)
	if sVar.days.fbtms and sVar.days.fbtms[fubenId] then
		but_times = sVar.days.fbtms[fubenId][2]
		if not but_times then but_times = 0 end
	end

	-- 购买次数限制（-1则不限）
	if cfg.buyTimesLimit ~= nil and cfg.buyTimesLimit > 0 then
		if but_times >= cfg.buyTimesLimit then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf204, ttFlyTip)
			return false
		end
	end

	local buyTimesConsume = cfg.buyTimesConsume
	
	--这三个副本特殊处理，因为他的第一，第二次购买扣除的金钱是不一样的
	if fubenId == 113 or fubenId == 114 or fubenId == 115 then 
		if but_times == 1 then --这是第2次
			buyTimesConsume = cfg.buyTimesConsume2
		end
	end
	
	local consumeData = {}
	local ret = CheckOneConsume(sysarg, false, buyTimesConsume, true, consumeData)
	if not ret then return false end

	ret = DeductOneConsume(sysarg, false, buyTimesConsume, GameLog.cNewBuyEnterFuBenTimes, cfg.fubenName)
	if not ret then return false end

	if not sVar.days.fbtms then sVar.days.fbtms = {} end
	if not sVar.days.fbtms[fubenId] then sVar.days.fbtms[fubenId] = {} end

	sVar.days.fbtms[fubenId][2] = but_times + 1

	return true
end

function can_enter_fuben( memPtr, leaderPtr )
	local sVar = Actor.getStaticVar(memPtr)
	if sVar.ybstate == 1 then	--正在押送镖车
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

--点击进入副本按钮执行的函数，对玩家进入判断，成功则将玩家传到副本场景里
function start_enter_fuben(sysarg, FbID)
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
	
	local nowVar =get_taskflags_val(sysarg)
	local groupid = fbdata.groupId
	local circleVal = fbdata.circle or 0
	--进入单人副本模式
	if fbdata.minPlayCount == 1 and fbdata.maxPlayCount == 1 then
		--由于副本中掉落的装备是否能穿戴只判断了等级没有判断转数，所以进入副本的条件也要改下
		local lvl = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL);
		--if not Actor.checkActorLevel(sysarg, fbdata.minLevel, circleVal) then
		if lvl < fbdata.minLevel then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00011, ttFlyTip) --输出提示由于等级不够进入不了副本
			return false
		end

		local leftTimes, buyTimes = get_fb_left_times(sysarg, FbID)
		if leftTimes <= 0 and not(nowVar== 85 and FbID==100) and not(nowVar== 91 and FbID==101) and not(nowVar== 95 and FbID==102)   then--85副本任务,进入副本1不检测次数
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00015, ttFlyTip)
			--notice_notime_to_fb(sysarg, FbID)
			return false
		end

		if not can_enter_fuben(sysarg, sysarg) then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.fuben036, ttFlyTip)
			return false
		end

		Hfuben = Fuben.createFuBen(FbID)
		if not Actor.enterFuBen(sysarg,Hfuben,-1,-1,-1) then
			return false
		end

		--进入副本，其中场景坐标按需要更改

		Actor.clearKillMonsterCount(sysarg)
--		if fbdata.groupId ~= 14 then
--			add_enter_fb_times(sysarg, FbID)
--		end
		if not(nowVar== 85 and FbID==100) and not(nowVar== 91 and FbID==101) and not(nowVar== 95 and FbID==102) then--85副本任务,进入副本1不扣次数
			add_enter_fb_times(sysarg, FbID)
		end
		if OnEnterCopyMap[FbID] then
			OnEnterCopyMap[FbID].OnEnterFubenFunc(sysarg,Hfuben, FbID)
		end
		Actor.closeDialogs(sysarg,diFubenTeam)
		Actor.triggerQuestEvent(sysarg, 39, FbID, 1)
		GetQuestStrByFubenId(sysarg, FbID)
		set_enter_fuben(sysarg)
		return true;
	else
		local TeamMemb = LuaHelp.getTeamMemberList(sysarg)		--获取该队伍的成员
		if TeamMemb == nil then
			print("not team")
			return false
		end
		local captainPtr = TeamFun.getTeamCaptain( Actor.getTeamId(sysarg))
		local capSceneName, capX, capY = Actor.getSceneName( captainPtr, 0, 0 )
		for k, memPtr in ipairs(TeamMemb) do
			--由于副本中掉落的装备是否能穿戴只判断了等级没有判断转数，所以进入副本的条件也要改下
			local lvl = Actor.getIntProperty(memPtr, PROP_CREATURE_LEVEL);
			--if not Actor.checkActorLevel(memPtr, fbdata.minLevel, circleVal) then
			if lvl < fbdata.minLevel then
				Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.tf00068, Actor.getName(memPtr)),ttFlyTip)
				return false
			end

			local leftTimes, buyTimes = get_fb_left_times(memPtr, FbID)
			if leftTimes <= 0 then
				if memPtr == sysarg then
					Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00015, ttFlyTip)
					--notice_notime_to_fb(sysarg, FbID)
				else
					Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.tf00069, Actor.getName(memPtr)), ttFlyTip)
				end
				return false
			end
			if not can_enter_fuben(memPtr, captainPtr) then
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
			add_enter_fb_times(memPtr, FbID)
			Actor.closeDialogs(TeamMemb[i],diFubenTeam)
			Actor.triggerQuestEvent(TeamMemb[i], 39, FbID, 1)
			GetQuestStrByFubenId(TeamMemb[i], FbID)
			set_enter_fuben(memPtr)
		end
		if OnEnterCopyMap[FbID] then
			OnEnterCopyMap[FbID].OnEnterFubenFunc(sysarg,Hfuben, FbID)
		end

		return true
	end
end

function set_enter_fuben(sysarg)
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
