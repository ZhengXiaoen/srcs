--lua script

--#include "data\language\LangCode.txt" once --语言包

--#include "data\config\guild\GuildSiegeConfig.lua" once 
--#include "data\config\guild\FreshSbkMonster.lua" once 
--#include "data\config\activityconfig\OpenServerTenDays\OpenServerConfig.lua" once
--#include "data\functions\Activity\WuLinZhengBa\GmWulinMaster.lua" once
--#include "data\functions\Activity\CrossServerSbk\CrossCommon.lua" once
--#include "data\config\guild\Guild.lua" once
--#include "data\config\activity\OpenServerAwardCfg.lua" once

--行会一些定时执行的函数

--新区第3天首次攻城
function CheckSbkGuildWarTime()
	local SbkSignUpTime = GuildConfig.SbkSignUpTime
	
	local nDays = System.getDaysSinceOpenServer()
    --新区第三天
   
	if nDays < SbkSignUpTime.openDay[1] then
		return false
--	elseif nDays == SbkSignUpTime.openDay then
--		return true
	end
     for i = 1,table.getn(SbkSignUpTime.openDay) do
       if nDays ==  SbkSignUpTime.openDay[i] then
            return true
       end
     end
	--合服3 4 5天
	if table.getn(SbkSignUpTime.combineDay) >= 0 then
		nDays = System.getDaysSinceCombineServer()
		if nDays > 0 then -- 合过服了
			if nDays < SbkSignUpTime.combineDay[1] then
				return false
			else
                for i = 1,table.getn(SbkSignUpTime.combineDay) do
                    if nDays == SbkSignUpTime.combineDay[i] then
                        
                        return true
                    end
                end
			end
		end		
	end
  
	--正常 2 4 6
	nDays = System.getDayOfWeek()
    for i = 1,table.getn(SbkSignUpTime.week) do
        if nDays == SbkSignUpTime.week[i] then
            return true
        end
    end
--	local state = SbkSignUpTime.weekStates[nDays + 1]
--	if state == 0 then
--		-- 0 为可能是攻成时间,如首次攻城或合服后首次攻城, 上面已经判断了, 所以这里不会是攻城时间
--		return false
--	elseif state == 1 then -- 报名时间
--		return false 
--	elseif state == 2 then -- 攻城时间
--		return true
--	end	
	
	return false	-- 非攻城时间
end

function SbkGuildWarNoticeBefor30()
	if System.isCrossServer() ==true then
		return 
	end
	
	if not CheckSbkGuildWarTime() then return end
	System.addTimer("SBK_on_timer", 300 * 1000, 5)
end

function SBK_on_timer(sysarg)
	if System.isCrossServer() ==true then
		return 
	end
	System.broadcastTipmsg("攻占王城,争夺宝座,各路豪杰群雄荟萃,今晚8点热血王城!准时开战,无需多言,胜者为王败者为寇.王城城主睥睨天下.",2+128) 
end

--沙巴克战预告
function SbkGuildWarNotice()
	--local nDays = System.getDaysSinceOpenServer()		
	--if System.getDefendSbkGuildId() > 0 and System.getDayOfWeek() == 4 then return end

	if not CheckSbkGuildWarTime() then return end
	
	System.broadcastTipmsg(Lang.GuildLang.z00056,2+128) -- 攻城战将在10分钟后开启
end

--沙巴克战20:30全服公告
function SbkGuildWarNoticeEight()
	if System.isCrossServer() ==true then
		return 
	end
	
	if not CheckSbkGuildWarTime() then return end
		
	if System.getDefendSbkGuildId() > 0 then return end

	System.broadcastTipmsg(Lang.GuildLang.z00151,2+128) -- 城主宝座虚位以待，这是一个为兄弟，为情义，为荣誉而激战的时刻!
end

--沙巴克战21:00全服公告
function SbkGuildWarNoticeNine()
	if System.isCrossServer() ==true then
		return 
	end
	if not CheckSbkGuildWarTime() then return end	
	if System.getDefendSbkGuildId() > 0  then return end
	System.broadcastTipmsg(Lang.GuildLang.z00152,2+128) -- 新一代城主即将诞生，勇士们仍旧浴血奋战，放弃只属于弱者!
end

--沙巴克开始
function StartSbkGuildWar()
	
	if System.isCrossServer() ==true then
		return 
	end
	
	--local nDays = System.getDaysSinceOpenServer()		
	--if System.getDefendSbkGuildId() > 0 and System.getDayOfWeek() == 4 then return end
	
	if not CheckSbkGuildWarTime() then return end

	System.broadcastTipmsg(Lang.GuildLang.z00057,128+2) -- 攻城战正式开始,请各路英雄进入王城激情吧!
	for i = 1,2 do
		System.broadcastTipmsg(Lang.GuildLang.z00057,2048)
	end
	
	--屏蔽场景类的所有npc
	Fuben.setSceneNpcCanNotSee(GuildSiegeConfig.SbkSceenId,true)
	Fuben.setSceneNpcCanNotSee(GuildSiegeConfig.PalaceSceenId,true)
	
	System.startSbkGuildWar()

	local playerList = LuaHelp.getSceneActorListById(GuildSiegeConfig.PalaceSceenId)		
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then	
				Actor.updateActorName(player)
			end
		end
	end

	local memplayer = LuaHelp.getSceneActorListById(GuildSiegeConfig.SbkSceenId)		
	if memplayer ~= nil then
		for j = 1, #memplayer do
			local player = memplayer[j]
			if player then	
				Actor.updateActorName(player)
			end
		end
	end

	local var = System.getStaticVar()
	var.getSbkWealState = nil
	var.GetSbkFashionFlag = nil
	var.HaveGetSbkAwardFlag = nil
	var.CombineServerKingMark = nil

	local gVar = System.getDyanmicVar()
	gVar.StartSbkWarFlag = 1
	gVar.FreshSbkMonsterTimes = nil

	CombineSbkGuild()
	--ShowSbkWarActivityForm()

	--Actor.regScriptCallback(thisNPC, thisNPC, GuildSiegeConfig.LoopTime, GuildSiegeConfig.LoopTime, -1, "GiveSbkGuildMemExp")
	--local dlgStr = string.format("@TeleportKingPos,%d",GuildSiegeConfig.PalaceSceenId)
	System.registerTimeCall(thisNPC, "OnStartSbkGuild", NULL, 2, false)
end

function OnStartSbkGuild()
	local sbkGuildId = System.getOldSbkGuildId()
	local playerList = LuaHelp.getSceneActorListById(GuildSiegeConfig.FightSceenId)		--获取某场景玩家对象列表
	if playerList ~= nil then
		for _,player in ipairs(playerList) do
			if player then
				if Actor.getSceneAreaFlag(sysarg) == 1 then
					if Actor.checkActorLevel(player,GuildSiegeConfig.freeAwardLevel) == true then
						Actor.addExp(player,GuildSiegeConfig.freeExp)
						Actor.changeMoney(player,GuildSiegeConfig.freeMoneyType,GuildSiegeConfig.freeCoin,GameLog.clGuildWarTimeAward,"攻城战皇宫定时奖励")
					end
				end
			end
		end
	end
	
	local playerList = LuaHelp.getSceneActorListById(GuildSiegeConfig.PalaceSceenId)		--获取某场景玩家对象列表
	if playerList ~= nil then
		for _,player in ipairs(playerList) do
			if player then
				if Actor.getSceneAreaFlag(sysarg) == 1 then
					if Actor.checkActorLevel(player,GuildSiegeConfig.freeAwardLevel) == true then
						Actor.addExp(player,GuildSiegeConfig.freeExp)
						Actor.changeMoney(player,GuildSiegeConfig.freeMoneyType,GuildSiegeConfig.freeCoin,GameLog.clGuildWarTimeAward,"攻城战皇宫定时奖励")
					end
				end
			end
		end
	end

end

--定时给沙皇宫
function GiveSbkGuildMemExp()
	local gVar = System.getDyanmicVar()
	if gVar.StartSbkWarFlag == nil then
		gVar.StartSbkWarFlag = 0
	end
	
	if gVar.StartSbkWarFlag == 0 then return end
	
	local sbkGuildId = System.getOldSbkGuildId()
	local playerList = LuaHelp.getSceneActorListById(GuildSiegeConfig.PalaceSceenId)		--获取某场景玩家对象列表
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then
				local nGuildId = Actor.getIntProperty( player, PROP_ACTOR_GUILD_ID )
				if nGuildId > 0 and nGuildId ~= sbkGuildId and Actor.isSignUpSbkWar(player) == 1 then
					Actor.giveAward(player,GuildSiegeConfig.LoopExp.type,GuildSiegeConfig.LoopExp.id,GuildSiegeConfig.LoopExp.count,GuildSiegeConfig.LoopExp.quality,GuildSiegeConfig.LoopExp.strong,GuildSiegeConfig.LoopExp.bind,0,205,"sbkPalace award")
				end
			end
		end
	end
end

function CombineSbkGuild()

	if System.getDaysSinceCombineServer() <= 0 or System.getDaysSinceCombineServer() > 5 then
		return 
	end
	
	local var = System.getStaticVar()
	if var.CombineSbkLeader then var.CombineSbkLeader = nil end
	if var.CombineSbkMasses then var.CombineSbkMasses = nil end
end

--初始化沙巴克开始的追踪信息显示
function ShowSbkWarActivityForm()
	local nTime = GuildSiegeConfig.SbkActivityTime
	local sname = ""
	local nGuildId = System.getSbkGuildId()
	if nGuildId > 0 then
		sname = System.getGuildName(nGuildId)
	end
	local str1 = string.format(Lang.GuildLang.z00123,sname)

	local playerList = LuaHelp.getAllActorList()		--获取某场景玩家对象列表
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then
				local guildId = Actor.getIntProperty( player, PROP_ACTOR_GUILD_ID )
				if (guildId == nGuildId or Actor.isSignUpSbkWar(player) == 1) and Actor.getIntProperty(player, PROP_CREATURE_LEVEL) >= GuildSiegeConfig.TrackMinLevel then
					Actor.initActivityWind(player,Lang.GuildLang.z00122,nTime,str1)
				end
			end
		end
	end
end

--沙巴克战结束预告
function EndSbkGuildWarNotice()
	if System.isCrossServer() ==true then
		return 
	end
	if not CheckSbkGuildWarTime() then return end	
	--if System.getDefendSbkGuildId() > 0 and System.getDayOfWeek() == 4 then return end

	System.broadcastTipmsg(Lang.GuildLang.z00058,2+128) -- 攻城战将在10分钟后结束
	--local gVar = System.getDyanmicVar()
	--gVar.StartSbkWarFlag = nil

end

--沙巴克战结束
function EndSbkGuildWarOp()
	if System.isCrossServer() ==true then
		return 
	end
	if not CheckSbkGuildWarTime() then return end		
	--if System.getDefendSbkGuildId() > 0 and System.getDayOfWeek() == 4 then return end
	System.endSbkGuildWar()
	Fuben.setSceneNpcCanNotSee(GuildSiegeConfig.SbkSceenId,false)
	Fuben.setSceneNpcCanNotSee(GuildSiegeConfig.PalaceSceenId,false)

	local sbkGuildId = System.getSbkGuildId()

	local playerList = LuaHelp.getSceneActorListById(GuildSiegeConfig.PalaceSceenId)		--获取某场景玩家对象列表
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then	
				local nGuildId = Actor.getIntProperty( player, PROP_ACTOR_GUILD_ID )

				if sbkGuildId == 0 or sbkGuildId ~= nGuildId then
					--Actor.enterScene(player,GuildSiegeConfig.SbkSceenId,unpack(GuildSiegeConfig.exitPos))
					Actor.updateActorName(player)
				end
			end
		end
	end
	local timerH = System.getTimeCall(thisNPC, "OnStartSbkGuild")
	System.unregisterTimeCall(timerH)
	
	local sVar = System.getStaticVar()
	if sVar.sbkAward then 

        sVar.sbkAward = nil 
  
    end
    --记录合服攻城胜利天数- 防止第二天领取合服奖励
    local combineDay = System.getDaysSinceCombineServer()
    if combineDay > 0 then
        sVar.sbkcombineday = combineDay
    end
	if sVar.LeaderPrivilege then sVar.LeaderPrivilege = nil end
		
	-- 第几次攻城战
	-- CGuildComponent::m_GuildWarTimes 这个不一定准，所以这里另开一个字段保存
	local nOpenDay = System.getDaysSinceOpenServer()
	if nOpenDay >= GuildConfig.SbkSignUpTime.openDay[1] then -- 开服第3天才有第1次攻城战
		if sVar.gwarTimes ~= nil then
			sVar.gwarTimes = sVar.gwarTimes + 1
		else
			sVar.gwarTimes = 1
		end
	else
		sVar.gwarTimes = 0
	end
	
	
	local gVar = System.getDyanmicVar()
	gVar.StartSbkWarFlag = nil

	if System.getSbkIsChangOwner() == 1 then	--易主刷宝箱
		for i=1,table.getn(SbkGuildMonsterConfig.SbkBoxs) do
			local hScene = Fuben.getSceneHandleById(SbkGuildMonsterConfig.SbkBoxs[i].nSceenId, 0)
			Fuben.createMonsters(hScene, SbkGuildMonsterConfig.SbkBoxs[i].nMonsterID, SbkGuildMonsterConfig.SbkBoxs[i].posX1, SbkGuildMonsterConfig.SbkBoxs[i].posX2, SbkGuildMonsterConfig.SbkBoxs[i].posY, SbkGuildMonsterConfig.SbkBoxs[i].nCount, SbkGuildMonsterConfig.SbkBoxs[i].nLiveTime)
		end
	end
    local str = "恭喜%s行会占领王城,5分钟后皇家镖车将装载完毕,恭请城主前来威龙城-天心道人处接取,护送至热血王城-九殿下处可获得大量功勋;有效期时间21:05-21:20,过时无效"
    if System.getSbkGuildId() > 0 then
        System.broadcastTipmsg(string.format(str,Guild.getGuildName(System.getSbkGuildId())),ttChatWindow)
    end
	gVar.guildbiaochegive = nil
	--开服活动(7天以内第一个城主)	
	--print("sVar.TheFirstLeader",sVar.TheFirstLeader)
	--if sVar.TheFirstLeader == nil then 
	--	if Guild.getSbkCityOwner() ~=0 then
	--		sVar.TheFirstLeader = Guild.getSbkCityOwner()
	--		if nOpenDay <= 7 then 
	--			local award = OpenServerAward[4].list[1].award[1]
	--			local myID = sVar.TheFirstLeader
	--			local awardIdAndCount=0
	--			awardIdAndCount=System.setInt2Byte(awardIdAndCount,true,award.count)
	--			awardIdAndCount=System.setInt2Byte(awardIdAndCount,false,award.id)
	--			System.AddMail(myID,6,0,"开服活动奖励","此开服活动首位成为城主的奖励，只要按一键提取就可以领取奖品",awardIdAndCount,0)
	--		end
	--	end
	--end
end
--星期四回收王城
function SbkGuildStateFresh()
	if System.isCrossServer() ==true then
		return 
	end
	--local nWeek = System.getDayOfWeek()
	--if nWeek == 4 then
	--	--清除王城BUFF		
	--	local KingId = Guild.getSbkCityOwner()
	--	local nPlayerPtr = System.getEntityPtrByActorID(KingId)
	--	if nPlayerPtr then
	--		local JOB = Actor.getIntProperty(nPlayerPtr,PROP_ACTOR_VOCATION)
	--		local LX = 12
	--		if JOB == 2 then LX = 16 elseif JOB == 3 then LX = 20 end			
	--		Actor.delBuff(nPlayerPtr,LX,206)		
	--	end
	--end
	System.guildSignUpFlagFresh()
end


--沙巴克开始10分钟的处理
function SkbStartFiveMins()
	if System.isCrossServer() ==true then
		return 
	end
	if not CheckSbkGuildWarTime() then return end	
	
	Fuben.detectOnlyOneGuild(GuildSiegeConfig.FightSceenId)
end

--初始化沙巴克城的状态 
function OnInitSbkState()
--	for i=0,2 do
--		local nState = System.getSbkWallState(i+1)

--		--城墙是好的
--		if nState == 0 then
--			local hScene = Fuben.getSceneHandleById(GuildSiegeConfig.wallMonsters[i+1].Sceneid, 0)
--			Fuben.clearMonster(hScene,GuildSiegeConfig.wallMonsters[i+1].nMonsterID)
--			local nMonster = Fuben.createOneMonsters(hScene, GuildSiegeConfig.wallMonsters[i+1].nMonsterID, GuildSiegeConfig.wallMonsters[i+1].posX1, GuildSiegeConfig.wallMonsters[i+1].posX2, GuildSiegeConfig.wallMonsters[i+1].posY, GuildSiegeConfig.wallMonsters[i+1].nCount, GuildSiegeConfig.wallMonsters[i+1].nLiveTime)
--			System.setWallTepotVisible(true,hScene,GuildSiegeConfig.teleport[i+1].posx,GuildSiegeConfig.teleport[i+1].posy)
--			Actor.setMonsterCanMove(nMonster,true)
--			local nMp = Actor.getIntProperty( nMonster, PROP_CREATURE_MAXHP )
--			System.setSbkWallInfo(nMonster,i+1,0,nMp)
--			Actor.setNpcGuildId(nMonster,System.getSbkGuildId())
--		else
--			local hScene = Fuben.getSceneHandleById(GuildSiegeConfig.wallMonsters[i+1].Sceneid, 0)
--			System.setWallTepotVisible(false,hScene,GuildSiegeConfig.teleport[i+1].posx,GuildSiegeConfig.teleport[i+1].posy)
--		end
--	end

--	local nCount = System.getGuardCount()

--	--召唤存在的守卫
--	for i=1,nCount do
--		local nid = System.getGuardId(i-1)

--		if nid>0 then
--			local nMp = System.getGuardMp(i-1)

--			if nMp > 0 then
--				CallSbkGuard(nid,nMp)
--			end
--		end
--	end

	--if System.isCommonServer() == true then
		--InitCrossSbkWall()
	--end
end

--召唤沙巴克守卫
function CallSbkGuard(nIndex,nMp)
	if nIndex > 0 and nIndex <= table.getn(GuildSiegeConfig.archerConfig) then
		local hScene = Fuben.getSceneHandleById(GuildSiegeConfig.archerConfig[nIndex].Sceneid, 0)
		Fuben.clearMonster(hScene,GuildSiegeConfig.archerConfig[nIndex].nMonsterID)
		local nMonster = Fuben.createOneMonsters(hScene, GuildSiegeConfig.archerConfig[nIndex].nMonsterID, GuildSiegeConfig.archerConfig[nIndex].posX1, GuildSiegeConfig.archerConfig[nIndex].posX2, GuildSiegeConfig.archerConfig[nIndex].posY, GuildSiegeConfig.archerConfig[nIndex].nCount, GuildSiegeConfig.archerConfig[nIndex].nLiveTime)

		if (nMonster ~= nil) then
			Actor.setNpcGuildId(nMonster,System.getSbkGuildId())
			local nHandle = Actor.getHandle(nMonster)

			System.setSbkGuardState(nMonster,nIndex,nMp)
			Actor.setMonsterCanMove(nMonster,true)
		end
	end
end

--城墙怪物死亡
function OnWallMonsterDie(nx,ny)
	if System.isCommonServer() == false then		--如果不是公共服
		local nCount = table.getn(GuildSiegeConfig.wallMonsters)
		--print("OnWallMonsterDienx:"..nx)
		--print("OnWallMonsterDieny:"..ny)
		for i=1,nCount do
			if GuildSiegeConfig.wallMonsters[i].posX1 == nx and  GuildSiegeConfig.wallMonsters[i].posY == ny then
				local hScene = Fuben.getSceneHandleById(GuildSiegeConfig.wallMonsters[i].Sceneid, 0)
				System.setWallTepotVisible(false,hScene,GuildSiegeConfig.teleport[i].posx,GuildSiegeConfig.teleport[i].posy)
				System.setSbkWallState(i,1)
				return
			end
		end
	else
		OnCrossWallDie(nx,ny)
	end
end

--沙巴克守卫死亡
function OnSbkGuardDie(nx,ny)
	local nCount = table.getn(GuildSiegeConfig.archerConfig)
	for i=1,nCount do
		if GuildSiegeConfig.archerConfig[i].posX1 == nx and  GuildSiegeConfig.archerConfig[i].posY == ny then
			System.delSbkGuard(i)
		end
	end
end

--提前主题活动第二天预告
function PreDayNotice()
	System.broadcastTipmsg(Lang.Activity.w00084,2+128)
end

--第二日主题活动预告
function TopicActivityNotice()
	System.broadcastTipmsg(Lang.Activity.w00085,2+128)
end

--全民活动播报
function SecWhloeActivityNotice()
	System.broadcastTipmsg(Lang.Activity.k00025,2+128)
end

--23点主题活动结算
function EndSbkTopicActivity()
	local gId = System.getSbkOwnGuildid()
	if gId > 0 then
		local var = System.getStaticVar()		
		local nLeaderId = Guild.getGuildLeaderId(gId)
		var.TopGuild = gId
		System.sendTopOfflineAward(OpenServerConfig.activitys[5].openDays,OpenServerConfig.activitys[5].needValue,nLeaderId,1186,39)
		BroadWinSbkEffect()
		System.broadcastTipmsg(Lang.Activity.k00023,2+128)
		System.finishTenDaysToFile(5)
		System.onAccountAllActivity(OpenServerConfig.activitys[5].openDays,OpenServerConfig.activitys[5].needValue)
		--BroadSbkTopicMsg()
		--System.broadcastTipmsg(Lang.Activity.k00026,2+128)
	end
end

--23点后没6分钟播放一次
function BroadSbkTopicMsg()
	local gId = System.getSbkOwnGuildid()
	
	if gId > 0 then
		local ranking = Ranking.getRanking(OpenServerConfig.activitys[3].rankName)
				
		if ranking then
			local bItem = Ranking.getItemFromIndex(ranking,0)
			
			if bItem then
				local sname = Ranking.getSub(bItem,3)
				local gName = System.getGuildName(gId)
				if sname ~= nil then
					local str1 = string.format(Lang.Activity.w00087,gName,sname)
					System.broadcastTipmsg(str1,2+128)

					local str = string.format(Lang.Activity.w00086,sname,Item.getItemName(OpenServerConfig.activitys[3].awards[1].id))
					System.broadcastTipmsg(str,2+128)
				end
			end
		end
	else
		System.broadcastTipmsg(Lang.Activity.w00088,2+128)
	end
end

--播放庆典烟花
function BroadWinSbkEffect()
	local gId = System.getSbkOwnGuildid()
	
	if gId > 0 then
		System.broadcastTipmsg(Lang.Activity.t00068,2)
		local playerList = LuaHelp.getAllActorList()		
		if playerList ~= nil then
			for j = 1, #playerList do
				local player = playerList[j]
				if player then
					Actor.playScrEffectCode(player,OpenServerConfig.activitys[5].effectId,OpenServerConfig.activitys[5].lastTime)
				end
			end
		end
	end
end

--沙巴克怪物进攻刷新
function FreshSbkMonsterOnTime()

	if not SbkGuildMonsterConfig then return end
	
	local config = SbkGuildMonsterConfig.monsters
	if not config then return end
	local hScene = Fuben.getSceneHandleById(config.nSceenId, 0)
	local monsterPtr = Fuben.createMonster(hScene, config.nMonsterID, config.posX, config.posY, config.nLiveTime)
	if monsterPtr then
		System.broadcastTipmsg(Lang.GuildLang.z00144,2+128)
		local dlgStr = string.format("@OnEnterMonsterSiege,%d",config.nSceenId)
		StrTipsFunc(dlgStr,activityTips[11].tips,11) 
	else
		print("create monster fail, the monster id = "..config.nMonsterID)
	end

end

--取消
function CancleOpenSbkFuben(sysarg)
	return nil
end

--行会资金不够的处理
function OnOpenSbkFubenByYb(sysarg)
	local nGuildId = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID )
	local str = string.format( Lang.GuildLang.z00131,System.getGuildName(nGuildId))
	local nCount = Actor.getItemCount(sysarg,SbkGuildMonsterConfig.nDrafts.itemId)
	if nCount >= SbkGuildMonsterConfig.nDrafts.count then		--行会银票足够
		Actor.removeItem(sysarg,SbkGuildMonsterConfig.nDrafts.itemId,SbkGuildMonsterConfig.nDrafts.count,0,0,0,Lang.GuildLang.z00126)
		OnOpenSbkGuildFubenSuc(sysarg)
		System.broadcastTipmsg(str,2+128)
	else
		local nYb = Actor.getIntProperty(sysarg,PROP_ACTOR_YUANBAO)

		if nCount == 1 and nYb >= SbkGuildMonsterConfig.halfOpenYb then				--只有一个行会银票
			Actor.removeItem(sysarg,SbkGuildMonsterConfig.nDrafts.itemId,1,0,0,0,Lang.GuildLang.z00126)
			Actor.changeMoney(sysarg,3,-SbkGuildMonsterConfig.halfOpenYb,GameLog.clActivityConsume,Lang.GuildLang.z00126)
			OnOpenSbkGuildFubenSuc(sysarg)
			System.broadcastTipmsg(str,2+128)
		else
			if nYb >= SbkGuildMonsterConfig.openNeedYb then
				Actor.changeMoney(sysarg,3,-SbkGuildMonsterConfig.openNeedYb,GameLog.clActivityConsume,Lang.GuildLang.z00126)
				OnOpenSbkGuildFubenSuc(sysarg)
				System.broadcastTipmsg(str,2+128)
			else
				Actor.sendTipmsg( sysarg, Lang.GuildLang.z00133,ttFlyTip )
			end
		end
	end
end

--成功开启沙城荣誉神殿副本
function OnOpenSbkGuildFubenSuc(sysarg)
	local sVar = System.getStaticVar()
	local dVar = System.getDyanmicVar()
	local nGuildId = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID )

	if nGuildId <= 0 then return end

	dVar.haveOpenSbkGuildFubenFlag = 1
	if sVar.OpenSbkGuildFubenTimes == nil then
		sVar.OpenSbkGuildFubenTimes = {}
	end
	if sVar.OpenSbkGuildFubenTimes[nGuildId] == nil then
		sVar.OpenSbkGuildFubenTimes[nGuildId] = 0
	end
	sVar.OpenSbkGuildFubenTimes[nGuildId] = sVar.OpenSbkGuildFubenTimes[nGuildId] + 1

	Actor.enterScene(sysarg, SbkGuildMonsterConfig.nSceenId, unpack(SbkGuildMonsterConfig.nSceenRange))

	local nHandle = Fuben.getSceneHandleById(SbkGuildMonsterConfig.outSceenId,0)
	local NpcPtr = Fuben.getNpcPtrByName(nHandle,Lang.EntityName.n00053)
	
	dVar.StartOpenSbkFubenTime = System.getCurrMiniTime()
	Actor.initActivityWind(sysarg,Lang.GuildLang.z00138,SbkGuildMonsterConfig.sbkTimeUp,Lang.GuildLang.z00137)

	Actor.regScriptCallback(NpcPtr, NpcPtr, SbkGuildMonsterConfig.fressBossTime, SbkGuildMonsterConfig.fressBossTime, 1, "OnFreshMonsterTenMin")

	Actor.regScriptCallback(NpcPtr, NpcPtr, SbkGuildMonsterConfig.sbkTimeUp * 1000, SbkGuildMonsterConfig.sbkTimeUp *1000, 1, "OnSbkFubenTimeUp")

	Actor.regScriptCallback(NpcPtr, NpcPtr, SbkGuildMonsterConfig.perTime, SbkGuildMonsterConfig.perTime, -1, "OnGiveMemExpOnTimeInSbk")

	Actor.regScriptCallback(NpcPtr, NpcPtr, SbkGuildMonsterConfig.broadPerMin * 1000, SbkGuildMonsterConfig.broadPerMin * 1000, 5, "onBroadOpenFubenTips")

end

--播报沙巴克回收给所有人的播报
function BroadSbkReturnToAll()
	--local nDays = System.getDaysSinceOpenServer()		
	if System.getSbkOwnGuildid() > 0 then
		System.broadcastTipmsg(Lang.GuildLang.z00139,2+128)
	end
end

function SbkReturnToAll()

end


--初始化城主雕像名字
function InitNpcStatueName()
	local nScene = Fuben.getSceneHandleById(GuildSiegeConfig.SbkSceenId,0)
	local pNpc = Fuben.getNpcPtrByName(nScene,Lang.EntityName.n00214)
	if pNpc then
		local pRanking = Ranking.getRanking("GuildCrossSbkOwn")
		if pRanking then
			local pItem = Ranking.getItemFromIndex(pRanking,0)
			if pItem then
				Actor.changeShowName(pNpc,20,Ranking.getSub(pItem,2))
			end
		end
	end
end

--初始化跨服城主雕像名字
function OnResetWorldFirstNpc()
	local RankNameList = Ranking.getRanking(CrossWorldOneConfig.WorldOneRankName)
	if RankNameList then
		local nScene = Fuben.getSceneHandleById(GuildSiegeConfig.SbkSceenId,0)
		local pNpc = Fuben.getNpcPtrByName(nScene,Lang.EntityName.n00213)
		if pNpc then
			local pItem = Ranking.getItemFromIndex(RankNameList,0)
			if pItem then
				Actor.changeShowName(pNpc,20,Ranking.getSub(pItem,0))
			else
				Actor.changeShowName(pNpc,20,Lang.EntityName.n00213)
			end
		end
	end
end

function StartMonsterRaid()
	
	if not SbkGuildMonsterConfig then return false end
	local config = SbkGuildMonsterConfig.monsterRaid
	if not config then return end

	local hScene = Fuben.getSceneHandleById(config.sceneid, 0)
	local posX = 0
	local posY = 0
	local nMonsterId = 0
	for idx, monsterNum in ipairs(config.monsterMaxNum) do
		for i = 1, monsterNum do
			nMonsterId = math.random(config.monsterRange[1],config.monsterRange[2])
			posX = config.createPos[idx][1]+math.random(config.posDeviation[1],config.posDeviation[2])
			posY = config.createPos[idx][2]+math.random(config.posDeviation[1],config.posDeviation[2])
			Fuben.createMonster(hScene, nMonsterId, posX, posY, config.nLiveTime)
		end
	end
	
	local dlgStr = string.format("@OnEnterMonsterRaid,%d",config.sceneid)
	StrTipsFunc(dlgStr,activityTips[7].tips,7) 
	
	System.broadcastTipmsg(Lang.GuildLang.z00153,128+2)
end

function EndMonsterRaid()
	
	if not SbkGuildMonsterConfig then return false end
	local config = SbkGuildMonsterConfig.monsterRaid
	if not config then return end

	local hScene = Fuben.getSceneHandleById(config.sceneid, 0)
	for i = config.monsterRange[1],config.monsterRange[2] do	
		Fuben.clearMonster(hScene,i)
	end
	
end