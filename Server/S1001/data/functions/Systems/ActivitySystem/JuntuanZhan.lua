-- 军团战活动
--#include "data\config\activity\StdActivityCfg.lua" once
--#include "data\config\ArdourCamp\ArdourCampCfg.lua" once
-- 场景配置以下属性:
-- aaWar = 3,			// 战斗区域, 不修改PK值
-- asNoDropEquip = 80,	// 所在场景不爆装备
-- aaForcePkMode = 50, // pk 模式

function FiveMinsBeforeStart()
		--判断激情大本营活动是否开启
        local sVar = System.getStaticVar()
        if sVar.ArdourCampPoint ~= nil and sVar.ArdourCampPoint >= ArdourCampCfg.ardourcamppoint  then
            return
        end

		local cfg = StdActivityCfg.JuntuanZhan
		local RwData = cfg.RwData;
		
		local NpcName = string.format("<%s/M%s:%s:%s:%s>", "立即前往", RwData[2], RwData[3], RwData[4], RwData[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], "立即前往");

		System.broadcastTipmsg(string.format("<(c0xFFffff00)军团战活动在5分钟后开始,敬请关注,> %s %s",NpcName, NpctFly), ttChatWindow)
end


function ThirtySecondsBeforeCloseActivity()
		--判断激情大本营活动是否开启
        
        local sVar = System.getStaticVar()
        if sVar.ArdourCampPoint == nil or sVar.ArdourCampPoint >= ArdourCampCfg.ardourcamppoint  then
            return
        end
		local cfg = StdActivityCfg.JuntuanZhan
		local RwData = cfg.RwData;
		
		local NpcName = string.format("<%s/M%s:%s:%s:%s>", "立即前往", RwData[2], RwData[3], RwData[4], RwData[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], "立即前往");

		System.broadcastTipmsg(string.format("<(c0xFFffff00)军团战活动入口30秒后关闭，请抓紧时间,> %s %s",NpcName, NpctFly), ttChatWindow)
end
-- 开始军团战活动
function StartActivity_juntuanzhan()
    --判断激情大本营活动是否开启
    local sVar = System.getStaticVar()
   
    if sVar.ArdourCampPoint ~= nil and sVar.ArdourCampPoint >= ArdourCampCfg.ardourcamppoint  then
        return
    end
	
	
	local dVar = System.getDyanmicVar()
	dVar.juntuanzhanTime = System.getCurrMiniTime()
	
	local sysvar = System.getStaticVar()
	sysvar.juntuanzhanD = {}
	sysvar.JunTuanRanking={}
	-- 共有3个军团
	sysvar.juntuanzhanD[1] = 0
	sysvar.juntuanzhanD[2] = 0
	sysvar.juntuanzhanD[3] = 0
	--一二三排名
	sysvar.JunTuanRanking[1]=0
	sysvar.JunTuanRanking[2]=0
	sysvar.JunTuanRanking[3]=0
	
	-- 排行榜先清0
	Ranking.clear_ranking(2, true)
	
	local cfg = StdActivityCfg.JuntuanZhan
	-- 定时加经验
	local exp = cfg.pdExp
	if exp ~= nil and exp > 0 then
		System.addTimer("juntuanzhan_on_timer", cfg.pdTimerSec * 1000, -1)
	end
end

-- 结束军团战活动
function EndActivity_juntuanzhan()
	--判断激情大本营活动是否开启
--    local sVar = System.getStaticVar()
--    if sVar.ArdourCampPoint ~= nil and sVar.ArdourCampPoint >= ArdourCampCfg.ardourcamppoint  then
--        return
--    end
    local dVar = System.getDyanmicVar()
	if dVar.juntuanzhanTime == nil then
        return
    end
	print("军团战活动 结束")	

	System.deleteTimer("juntuanzhan_on_timer")
	
	dVar.juntuanzhanTime = nil
	
	Ranking.save_ranking(2, true)
	
	juntuanzhan_updata_juntuan_ranking()
	
	local sysvar = System.getStaticVar()
	local JunTuanRanking = sysvar.JunTuanRanking
	
	if JunTuanRanking ~=null then
		local name=""
		if JunTuanRanking[1]==1 then
			name="雷霆军团"
		elseif JunTuanRanking[1]==2 then
			name="光芒军团"
		elseif JunTuanRanking[1]==3 then 
			name="烈焰军团"
		end
		if name ~="" then System.broadcastTipmsg(string.format("<(c0xFFffff00)恭喜><(c0xFF00ff00)%s><(c0xFFffff00)荣获此次军团战积分榜第一，真是强大的军团，附上大礼一份！>", name), ttScreenCenter) end
	end

	local cfg = StdActivityCfg.JuntuanZhan
	local actId = cfg.id	

	local playerList = LuaHelp.getSceneActorListById(cfg.sceenId)		
	if playerList~=nil then 
		for i, v in ipairs(playerList or {}) do	
			exit_juntuanzhan(v, actId)
			Actor.sendTipmsg(v, string.format("活动时间结束,已将您移出活动场景"), ttDialog)
		end
	end

end

function juntuanzhan_updata_juntuan_ranking()
	local sysvar = System.getStaticVar()
	local juntuanzhanD = sysvar.juntuanzhanD
	if juntuanzhanD == nil then
		return
	end
	
	local data = {}
	table.insert(data, {1, juntuanzhanD[1]})
	table.insert(data, {2, juntuanzhanD[2]})
	table.insert(data, {3, juntuanzhanD[3]})
	
	table.sort(data, function(a,b) return a[2] < b[2] end )
	
	juntuanzhanD[1] = data[3][1]
	juntuanzhanD[2] = data[2][1]
	juntuanzhanD[3] = data[1][1]
end

function juntuanzhan_on_timer(leftTimes)
	local dVar = System.getDyanmicVar()
	if dVar.juntuanzhanTime == nil then
		System.deleteTimer("juntuanzhan_on_timer")
		return
	end
	
	local cfg = StdActivityCfg.JuntuanZhan
	local exp = cfg.pdExp
	if exp == nil or exp == 0 then
		return
	end
	
	local playerList = LuaHelp.getSceneAliveActorListById(cfg.sceenId)
	if playerList == nil then return end		
	
	for i, v in ipairs(playerList) do
		juntuanzhan_give_reward(v, exp)
	end
end

function can_enter_juntuanzhan(sysarg, isTip)	
	local legionId = Actor.getLegionId(sysarg)
	if legionId == 0 then
		if isTip then
			Actor.sendTipmsg(sysarg, "请你先加入一个军团", ttFlyTip)
			Actor.autoFindPathToNpc(sysarg,9,"军团使者")
		end
		return false
	end
	
	local dVar = System.getDyanmicVar()
	local juntuanzhanTime = dVar.juntuanzhanTime
	if juntuanzhanTime == nil then -- 活动还没开始
		if isTip then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		end
		return false
	end
	
	local curTime = System.getCurrMiniTime()
	if curTime < juntuanzhanTime then
		if isTip then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
		end
		return false
	end
	
	local cfg = StdActivityCfg.JuntuanZhan
	-- 5 分钟后不能进入
	if (curTime - juntuanzhanTime) >= cfg.enterTimeLimit then
		if isTip then
			Actor.sendTipmsg(sysarg, "活动入口已关闭,请您明天再来吧", ttFlyTip)
		end
		return false
	end
	
	if Actor.checkActorLevel(sysarg, cfg.level, 0) ~= true then
		if isTip then
			Actor.sendTipmsg(sysarg, string.format("<(c0xFFffff00)等级小于><(c0xFF00ff00)%d级><(c0xFFffff00),进入失败.>", cfg.level), ttFlyTip)
		end
		return
	end
	
	local nSceneId = Actor.getSceneId(sysarg)
	if nSceneId == cfg.sceenId then
		if isTip then
			Actor.sendTipmsg(sysarg, "您已经在活动中了", ttFlyTip)
		end
		return false
	end
	
	local var = Actor.getStaticVar(sysarg)
	--运镖中
	if var.ybstate ~= nil and var.ybstate == 1 then
		if isTip then
			Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip)
		end
		return false
	end
	
	-- 在副本中
	local fubenId = Actor.getFubenId(sysarg)
	if fubenId > 0 then
		if isTip then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf568, ttFlyTip) 
		end
		return false
	end

	--if checkActivityTime(cfg.tOpenTime.times) == 0 then
	--	if isTip then
	--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	end
	--	return false
	--end
	
	return true
end

-- 进入活动场景
function enter_juntuanzhan(sysarg)
	if not can_enter_juntuanzhan(sysarg, true) then
		return
	end
	
	local cfg = StdActivityCfg.JuntuanZhan
	
	--local times = cfg.tOpenTime.times
	--local timeIdx = checkActivityTime(times)
	--if timeIdx == 0 then	
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	return
	--end
	--
	--local endHour = times[timeIdx][3]
	--local endMin = times[timeIdx][4]
	--local endSec = 0
	--if endHour == 0 and endMin == 0 then
	--	endHour = 23
	--	endMin = 59
	--	endSec = 59
	--end
	--
	--local leftSecond = System.ResidualTime(endHour, endMin, endSec)
	--if leftSecond == 0 then
	--	Actor.sendTipmsg(sysarg, Lang.ScriptTips.bg00005, ttFlyTip)
	--	return
	--end	
	local dVar = System.getDyanmicVar()
	
	local leftSecond = cfg.tOpenTime.lefttime-(System.getCurrMiniTime() - dVar.juntuanzhanTime)
	local legionId = Actor.getLegionId(sysarg)
	local pos = cfg.initPosList[legionId]
	if pos == nil then
		--print("initPosList error, legionId="..legionId)
		return
	end
	
	if Actor.enterScene(sysarg, cfg.sceenId, pos[1], pos[2]) == false then
		return
	end
		
	-- PK 模式改为军团模式已经在场景的区域属性中配置了
		
	local svar = Actor.getStaticVar(sysarg)
	svar.days.juntuanPoint = 0 -- 军团战积分
	svar.days.joinJuntuan = 1 -- 参与了军团战，可以领取军团奖励
	
	local RwData = cfg.RwData;
	local name = Actor.getName(sysarg)

	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);

	System.broadcastTipmsg(string.format("<(c0xFFe6dfb9)%s><(c0xFFffff00)参加了><(c0xFF00ccff)%s><(c0xFFffff00)活动>%s %s", name, RwData[1], NpcName, NpctFly), ttChatWindow)

	sendJoinActivity(sysarg, cfg.id, leftSecond)
	
	sendJuntuanZhanJuntuanInfo(sysarg)
	sendJuntuanZhanRankingData(sysarg)
	
	OnFinish_Liveness(sysarg,9)
	
end

function exit_juntuanzhan(sysarg, activityid)
	--Actor.exitActivityScene(sysarg)
	Actor.enterScene(sysarg,9,134,161)
	
	if activityid == nil then
		activityid = StdActivityCfg.JuntuanZhan.id
	end
	
	sendExitActivity(sysarg, activityid)
end

-- 定时发一次奖励
function juntuanzhan_give_reward(sysarg, exp)		
	-- 是否还活着
	if Actor.isDeath(sysarg) then return end
	
	local dVar = Actor.getDyanmicVar(sysarg)	
	local juntuanExp = dVar.juntuanExp
	if juntuanExp == nil then
		juntuanExp = exp
	else
		juntuanExp = juntuanExp + exp
	end
	
	dVar.juntuanExp = juntuanExp

	Actor.addExp(sysarg, exp, LogIds.jtzAddExp, 0)
	
	sendJuntuanZhanMyExp(sysarg, juntuanExp)
end

function juntuanzhan_OnPlayerDie(sysarg, killer, killerType)
	if killer == nil or killerType ~= 0 then return end
	
	local legionId = Actor.getLegionId(killer)
	
	if legionId == 0 then return end
	if legionId > 3 then return end
	
	local var = Actor.getStaticVar(killer)
	
	local sysvar = System.getStaticVar()
	local juntuanzhanD = sysvar.juntuanzhanD
	if juntuanzhanD == nil then
		sysvar.juntuanzhanD = {}
		juntuanzhanD = sysvar.juntuanzhanD
	end
		
	local cfg = StdActivityCfg.JuntuanZhan
	local addPoint = cfg.killActorPoint
	
	local totalPoint = juntuanzhanD[legionId]
	if totalPoint == nil then
		totalPoint = addPoint
	else
		totalPoint = totalPoint + addPoint
	end	
	juntuanzhanD[legionId] = totalPoint
	
	--军团排名
	if sysvar.JunTuanRanking[1] ==0 then 
		sysvar.JunTuanRanking[1] = legionId
	elseif sysvar.JunTuanRanking[1] ~= legionId and sysvar.JunTuanRanking[2] ==0 then
		sysvar.JunTuanRanking[2] = legionId
	elseif sysvar.JunTuanRanking[1] ~= legionId and sysvar.JunTuanRanking[2] ~=legionId and sysvar.JunTuanRanking[3] ==0 then
		sysvar.JunTuanRanking[3] = legionId
	end
	
	for i=2,3 do
		if sysvar.JunTuanRanking[i] == legionId then
			if juntuanzhanD[legionId] >  juntuanzhanD[sysvar.JunTuanRanking[i-1]] then
				sysvar.JunTuanRanking[i-1], sysvar.JunTuanRanking[i] = sysvar.JunTuanRanking[i] , sysvar.JunTuanRanking[i-1]
			end
			if i==3 then
				if juntuanzhanD[legionId] >  juntuanzhanD[sysvar.JunTuanRanking[1]] then
					sysvar.JunTuanRanking[1], sysvar.JunTuanRanking[2] = sysvar.JunTuanRanking[2] , sysvar.JunTuanRanking[1]
				end
			end
		end
	end	
	
	
	
	--for i=1,3 do 
		--print(sysvar.JunTuanRanking[i])
	--end
	
	local myJunTuanRanking
	for i=1,3 do
		if sysvar.JunTuanRanking[i]==legionId then
			myJunTuanRanking=i
		end
	end
	
	--print("!!!!!!!!!!"..myJunTuanRanking)
	
	-----
	local myPoint = var.days.juntuanPoint
	if myPoint == nil then
		myPoint = addPoint
	else
		myPoint = myPoint + addPoint
	end
	var.days.juntuanPoint = myPoint
	
	-- 位置(从 0 开始): -1 不在排行榜中;
	local newpos, oldpos = Ranking.update_value(2, killer, myPoint)	
	
	local playerList = LuaHelp.getSceneActorListById(cfg.sceenId)		
	for i, v in ipairs(playerList or {}) do	
		sendJuntuanZhanJuntuanData(v, legionId, totalPoint, myJunTuanRanking)
		
		if newpos >= 0 then -- 在排行榜中
			sendJuntuanZhanRankingData(v)
		end
	end
		
	sendJuntuanZhanMyPoint(killer)
end

-- 发送军团战军团数据
function sendJuntuanZhanJuntuanData(sysarg, legionId, point,myJunTuanRanking)
	local cfg = StdActivityCfg.JuntuanZhan
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, cfg.id) -- 活动类型
	DataPack.writeByte(netPack, 1) -- 军团数据	
	
	DataPack.writeByte(netPack, legionId)
	DataPack.writeUInt(netPack, point)
	DataPack.writeByte(netPack, myJunTuanRanking)
	
	DataPack.flush(netPack)
end

-- 更新活动数据
function sendJuntuanZhanRankingData(sysarg)
	local cfg = StdActivityCfg.JuntuanZhan
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, cfg.id) -- 活动类型
	DataPack.writeByte(netPack, 2) -- 个人排行榜
	
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	
	-- 我的排名, 从0开始, -1则不进排行榜
	local count, myRank = Ranking.packetRankingItems(netPack, 2, -1, actorId)	
	
	local var = Actor.getStaticVar(sysarg)
	local juntuanPoint = var.days.juntuanPoint -- 军团战积分
	if juntuanPoint == nil then juntuanPoint = 0 end
	
	local dVar = Actor.getDyanmicVar(sysarg)	
	local juntuanExp = dVar.juntuanExp
	if juntuanExp == nil then juntuanExp = 0 end	
	
	DataPack.writeByte(netPack, myRank + 1) -- 0 为不上榜
	DataPack.writeUInt(netPack, juntuanPoint)
	DataPack.writeUInt(netPack, juntuanExp)	
	
	DataPack.flush(netPack)
end

function sendJuntuanZhanMyPoint(sysarg)
	local cfg = StdActivityCfg.JuntuanZhan
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, cfg.id) -- 活动类型
	DataPack.writeByte(netPack, 3) -- 军团战积分	
	
	local var = Actor.getStaticVar(sysarg)
	local juntuanPoint = var.days.juntuanPoint -- 军团战积分
	if juntuanPoint == nil then juntuanPoint = 0 end
	
	DataPack.writeUInt(netPack, juntuanPoint)	
	
	DataPack.flush(netPack)
end

function sendJuntuanZhanMyExp(sysarg, exp)
	local cfg = StdActivityCfg.JuntuanZhan
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, cfg.id) -- 活动类型
	DataPack.writeByte(netPack, 4) -- 军团战经验	
	
	DataPack.writeUInt(netPack, exp)	
	
	DataPack.flush(netPack)
end

function sendJuntuanZhanJuntuanInfo(sysarg)
	local cfg = StdActivityCfg.JuntuanZhan
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
	DataPack.writeByte(netPack, cfg.id) -- 活动类型
	DataPack.writeByte(netPack, 5) -- 军团信息	
		
	local sVar = System.getStaticVar()
	local juntuanzhanD = sVar.juntuanzhanD
	
	for i=1,3 do		
		local point = 0
		if juntuanzhanD ~= nil then
			point = juntuanzhanD[i]
		end
		
		DataPack.writeUInt(netPack, point)
	end
			
	DataPack.flush(netPack)
end

-- 领取个人奖励
function get_juntuanzhan_award(sysarg)
	local legionId = Actor.getLegionId(sysarg)
	if legionId == 0 then
		Actor.sendTipmsg(sysarg, "未到领取奖励时间！", ttFlyTip)
		return
	end
	
	local cfg = StdActivityCfg.JuntuanZhan
	local dVar = System.getDyanmicVar()
	if dVar.juntuanzhanTime ~= nil or checkActivityTime(cfg.tOpenTime.times) > 0 then
		Actor.sendTipmsg(sysarg, "活动没有结束不能领取奖励", ttFlyTip)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local juntuanPoint = var.days.juntuanPoint -- 军团战积分
	if juntuanPoint == nil or juntuanPoint == 0 then 
		 Actor.sendTipmsg(sysarg, "您没有达到领取奖励条件，请再接再厉！", ttFlyTip)
		return
	end
	
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	-- 从 0 开始, -1 为没有进排行榜
	local myRank = Ranking.find_actor_ranking(2, actorId)
	myRank = myRank + 1
	
	if myRank < 1 then
		Actor.sendTipmsg(sysarg, "您没有达到领取奖励条件，请再接再厉！", ttFlyTip)
		return
	end
	
	local award = cfg.ActorAwards[myRank]
	if award == nil then return end
	
	if Awards.Give(sysarg, award, LogIds.getjtzActorAward, tostring(myRank)) ~= true then
		return
	end
	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s成就点>",cfg.ActorAwards[myRank][2].count),1);
	if myRank == 1 then
		local name = Actor.getName(sysarg)
		System.broadcastTipmsg(string.format("<(c0xFFffff00)恭喜><(c0xFF00ff00)%s><(c0xFFffff00)玩家荣获此次军团战个人积分榜第一，实至名归，获得大礼一份！>", name), ttScreenCenter)
	end	
	
	var.days.juntuanPoint = nil -- 奖励已领
	
end

-- 领取军团奖励
function get_juntuanzhan_juntuan_award(sysarg)
	local legionId = Actor.getLegionId(sysarg)
	if legionId == 0 then
			Actor.sendTipmsg(sysarg, "未到领取奖励时间！", ttFlyTip)
		return
	end
		
	local cfg = StdActivityCfg.JuntuanZhan
	local dVar = System.getDyanmicVar()
	if dVar.juntuanzhanTime ~= nil or checkActivityTime(cfg.tOpenTime.times) > 0 then
		Actor.sendTipmsg(sysarg, "活动没有结束不能领取奖励", ttFlyTip)
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	-- 参与了军团战，可以领取军团奖励
	if var.days.joinJuntuan == nil then
		Actor.sendTipmsg(sysarg, "您没有参加军团战，领取失败！", ttFlyTip)
		return -- 没有参加军团战
	elseif var.days.joinJuntuan ~= 1 then
		Actor.sendTipmsg(sysarg, "您已经领取了军团战奖励，请勿重复领取！", ttFlyTip)
		return -- 奖励已经领取
	end
	
	local rank = get_juntuanzhan_juntuan_ranking(legionId)
	if rank == 0 then
		Actor.sendTipmsg(sysarg, "您的军团积分为0，领取失败！", ttFlyTip)
		return
	end
	
	local award = cfg.LegionAwards[1]
	if award == nil then return end
	
	--if Awards.Give(sysarg, award, LogIds.getjtzAward, tostring(rank)) ~= true then
	--	return
	--end	
	--add_d_val(sysarg,9,award[1].count);
	--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s(%s)能量>",award[1].count,get_d_val(sysarg,9)),1);
	--Actor.sendTipmsg(sysarg, string.format("您成功领取了军团战奖励: 战无双能量点 x %s", award[1].count), ttFlyTip)
	Actor.setUIntProperty(sysarg, 125, (Actor.getUIntProperty(sysarg, 125) + award[rank]));
	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", award[rank], "宝石结晶"), 1);
	Actor.sendTipmsg(sysarg, string.format("您成功领取了军团战奖励: 宝石结晶 x %s", award[rank]), ttFlyTip)
	Actor.playEnergyEffect(sysarg,4,0)
	
	var.days.joinJuntuan = 2 -- 奖励已经领取
end

function get_juntuanzhan_juntuan_ranking(legionId)
		
	local sysvar = System.getStaticVar()
	local JunTuanRanking = sysvar.JunTuanRanking
	if JunTuanRanking == nil then return 0 end
		
	if legionId == JunTuanRanking[1] then
		return 1
	elseif legionId == JunTuanRanking[2] then
		return 2
	elseif legionId == JunTuanRanking[3] then
		return 3
	else
		return 0
	end		
end