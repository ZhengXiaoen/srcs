--//游戏启动触发函数
--#include "data\functions\SpecialQuest.lua" once
-- --#include "data\functions\Activity\NationalDay.lua" once --国庆活动
--#include "data\functions\Activity\ChristmasAndNewYear.lua" once --双蛋活动
--#include "data\functions\modules\InjectExpRanking.lua" once -- 天神之力 排行榜
--#include "data\functions\modules\YbConsumeRanking.lua" once -- 月度活动 元宝消耗排行榜
--#include "data\functions\modules\wangling.lua" once -- 王陵
--#include "data\functions\OnTimeRunFunction.lua" once
--#include "data\functions\modules\OpenServer_Pay_Rank.lua" once
--#include "data\config\NoticeTipsCfg.lua" once
--#include "data\functions\MonsterDropNotice.lua" once
--#include "data\config\guild\JiQingGuildCfg.lua" once
--#include "data\config\ArdourCamp\ArdourCampCfg.lua" once
--#include "data\functions\EntityAttrCalc.lua" once
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\YouXiTuiGuangYuan.lua" once
--#include "data\functions\Activity\YuanGuZhanChang.lua" once --远古战场
--#include "data\functions\Activity\YuanGuBiaoCheUtils.lua" once --远古押镖
--#include "data\config\CrossServerConfig.lua" once --跨服配置
--#include "data\functions\Systems\ActivitySystem\PalaceFighting.lua" once
--#include "data\functions\RedPacketFunc.lua" once    
--#include "data\functions\SuperLuckStarFunc.lua" once
--#include "data\functions\OldPlayerReturnFunc.lua" once
--#include "data\functions\Activity\SpringFestivalActivity.lua" once

function OnStartedLogicServer()
	
	local crossDayStarted = false -- 是否跨天启动服务器
	local svar = System.getStaticVar()
	if svar.SaveServerNewDayArriveTime ~= nil then
		local y,m,d,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(System.getCurrMiniTime())	
		local nNowDt = System.encodeNumTime(y,m,d,0,0,0)
		if svar.SaveServerNewDayArriveTime ~= nNowDt then -- 跨天启动服务器
			crossDayStarted = true
			svar.SaveServerNewDayArriveTime = nNowDt
			print("----跨天启动服务器----")
		end
	end
	
	if svar.days == nil then
		svar.days = {}
	end
	
	static_data_on_logic_server_started()
	EnsureDaJiDaLiActivity()
	svar = System.getStaticVar()
	if DisableJingJiCompetition ~= nil then
		DisableJingJiCompetition() -- 关闭开关启用时清理旧活动状态
		svar = System.getStaticVar()
	end
	if EnsureNationalDayActivity ~= nil then
		EnsureNationalDayActivity() -- 启动时恢复国庆送礼的七天轮次
	end

	CheckCombineServerStatus()	
	
	--//天下第一变量初始化		
	if not svar.StartSbkTimes then
		svar.StartSbkTimes = 0
	end	
	
	--local nTime = svar.StartSbkTimes
	--Guild.setSbkWarTimes(nTime)
	
	--[[
	--国庆七天全服双倍经验
	if IsNationalDayTime() then
		print("------国庆活动开启--------")
		if IsNationalDayDoubleExp(false) then
			--local bResult = System.setActivtyExpRate(1,0) --通过玩家Buff加了，这里就不加了	
			print("------国庆七天全服双倍经验开启--------")
		end		
	end
	--]]
	
	wangling_on_server_started()
	
	--OnDEggActivityRefreshItems(true) -- 双蛋活动刷新物品
	
	InjectExpRanking_load() -- 装载天神之力排行榜
	YbConsumeRanking_load() -- 装载[元宝消耗]排行榜
			
	InitSystemTimer();
	InitLegionInfo(); --初始化军团信息
	
	Pay_Rank_StartServer()
   
	System.addTimer("VIPnotice_on_timer", 1800* 1000, -1)
	if System.getDaysSinceOpenServer() <=4 then 
		System.addTimer("OpenServerDayIn4", 3600* 1000, -1)
	end
	--公告
	InitNoticeTips()

	--定时刷怪加播报,1分钟无限循环检测,函数在player.lua,配置在: data\config\monster\SRRefreshMonster.lua

    
	System.addTimer("SRRefreshMonsterEx", 1000, 1);
	System.addTimer("SRRefreshMonster", 60000, -1);
    

    --开服特惠礼包- 神魂礼包与宝石礼包- 第八天开始
--    if svar.tehuinewday == nil and System.getDaysSinceOpenServer() > 7 then
--        svar.tehuinewday = 8
--    end
    --没有到合服时间，同步开区时间
--    if System.getDaysSinceCombineServer() == 0 then
--        svar.tehuinewday = System.getDaysSinceOpenServer()
--    end
    --初始化军魂之地刷新信息
    MkzInitServer()
	
	--庆典活动神秘商城的刷新
	Fre_ShenMiInitServer()

    --离线超时镖车
    System.addTimer("OfficeBiaocheDelay",5000,-1)
	
	--远古战场刷怪定时器
	YuanGuZhanChangInitServer()

    --快捷方式
    System.addTimer("LoopAiqyIconState",1000 * 60,-1)   

	--初始化抢红包信息
    InitRedPacket()
    
    -- 春节活动
    on_spring_festival_started_logic_server()
	
	--开启打印boss消失信息
	local dvar = System.getDyanmicVar()
	if dvar.printKillBoss == nil then
		dvar.printKillBoss = 1
	end
	
	OnLuaEvent(LuaEventId.ServerStarted)
	
	if crossDayStarted then
		checkDaJiDaLiAndOneYearDayCount()
		
		svar.days = {}
	end
end

--离线超时镖车
function OfficeBiaocheDelay()
 
    local sVar = System.getStaticVar()
    if sVar.officebiaoche == nil then
        sVar.officebiaoche ={}
        sVar.officebiaoche.count = 0
        sVar.officebiaoche.l = {}
    end
   
    if sVar.officebiaoche.count <= 0 then 
        return
    end
    local cfg = StdActivityCfg.DuoBeiYaSong;
    local nTime = System.getCurrMiniTime()
    for i =1,sVar.officebiaoche.count do
        if sVar.officebiaoche.l[i] ~= nil  and sVar.officebiaoche.l[i].time > 0 then
            
			local lastTime = sVar.officebiaoche.l[i].time + cfg.time - nTime
           
            if lastTime <= 0 then 
                sVar.officebiaoche.l[i].time = 0
                sVar.officebiaoche.l[i].tag = 1
                
                Fuben.clearMonster(sVar.officebiaoche.l[i].bcHandle,false)
                sVar.officebiaoche.l[i].bcHandle = 0
            end
        end

    end
end

function OnStopLogicServer()
	 SaveYouXiTuiGuangYuanInfo()
	 YbConsumeRanking_save()
     Pay_Rank_StopServer()
     
     if LuaStaticData_is_dirty then
		save_static_data()
	 end
	
	 System.deleteTimer("VIPnotice_on_timer")
	 System.deleteTimer("OpenServerDayIn4")
	 
	 OnLuaEvent(LuaEventId.ServerStop)
end
--vip提示
function VIPnotice_on_timer()
	System.broadcastTipmsg("<(c0xFFff0000)成为VIP即可享受诸多特权,实力更加强劲.><点我了解VIP特权/@@showWin,14>", ttChatWindow)
end
--游戏聊天频道里，设定开区前4天，每1个小时，播放俩条消息。
function OpenServerDayIn4()
	System.broadcastTipmsg("<(c0xFFff0000)更多高级技能书在沙漠土城的秦始皇陵NPC处获得,商铺可直接购买获得强化召唤术.>", ttChatWindow)
end

-- 连接上后台后的回调
function ViewSysState()
end

function CheckCombineServerStatus()
	local combineDay = System.getDaysSinceCombineServer()
	if combineDay ~= 1 then return end -- 保险点，只判断是否等于 1
		
	--获取服务器合区时间
	local csTime = System.getServerCombineTime()
	if csTime == nil or csTime <= 0 then return end

	local s_var = System.getStaticVar()
	
	-- 保存旧值，排行榜需要用
	s_var.ranking_csTime = s_var.csTime
	
	--有可能是第2次合服
	if s_var.csTime == nil or s_var.csTime ~= csTime then
		s_var.csTime = csTime
		print("---------合服后第一次启动---------")
		CombineServerSetup()


	end
end

-- 合服后第一次启动
function CombineServerSetup()
	local var = System.getStaticVar()
	var.legion = nil --清除军团信息
	
	-- 避免合服后被合服的玩家再次领取补偿礼包，所以合服后补偿礼包要失效
	if LuaStaticData.FuLiGuanYuan ~= nil then
		LuaStaticData.FuLiGuanYuan = nil
		
		set_static_data_dirty()
		save_static_data()
	end

    LoadYouXiTuiGuangYuanInfo()

	--因为c++那边修改过，系统静态变量还没初始化完，所以开启活动失败。用别的方法把活动开起来
	--合服时候开启神秘商店
	--StartShenMiActivity(3,1)
	local dvar = System.getDyanmicVar()
	dvar.isCombineStartShenMi =1
    InitRedPacket(true)
	
	--四圣宫，首杀重置
	var.siShenGong =nil
	
end

-- 清除合服后第一次启动的标志
function ClearCombineServerSetupFlag()
	print("---------清除合服后第一次启动的标志---------")
	local s_var = System.getStaticVar();
	s_var.csTime = nil
end

-- 服务器跨天
function OnServerNewDayArrive()
	if DisableJingJiCompetition ~= nil then
		DisableJingJiCompetition()
	end
	-- 零点清除所有的黑龙神殿怪
	ClearHeiLongShenDianMonsters()
	
	local dVar = System.getDyanmicVar()
	if dVar.openCompensate ~= nil then -- 关闭补偿
		dVar.openCompensate = nil
	end
	
	dVar.mbczNum = nil;		-- 膜拜城主人数
	dVar.psczNum = nil;		-- 鄙视城主人数
	
	local svar = System.getStaticVar()
	local canStartOpenActivities = System.getCurrMiniTime() >= System.getServerOpenTime()
	local y,m,d,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(System.getCurrMiniTime())
	local nNowDt = System.encodeNumTime(y,m,d,0,0,0)		
	svar.SaveServerNewDayArriveTime = nNowDt
	
	svar.bpbxdRank = nil	 -- 奔跑吧兄弟活动排行榜清0
	
	svar.days = {}
	if EnsureNationalDayActivity ~= nil then
		EnsureNationalDayActivity() -- 跨天推进国庆送礼，七天后直接进入下一轮
	end

	--OnNationalDayServerNewDayArrive() -- 国庆活动
	OnInjectExpRankingNewDayArrive()
	

    --王城城主每日可领取20000绑定元宝
	local sysVar = System.getStaticVar()
    sysVar.KingGiveMoney = nil
    sysVar.KingBossMap = nil --行会boss活动

    --激情行会排行榜
    JiQingGuildCfg.SignUp ={}
    local pRank = Ranking.getRanking(JiQingGuildCfg.RankName)
    if pRank ~= nil then
        Ranking.clearRanking(pRank)
    end
    --激情大本营排行榜
    pRank = Ranking.getRanking(ArdourCampCfg.rankname)
    if pRank ~= nil then
        Ranking.clearRanking(pRank)
    end  
    pRank = Ranking.getRanking(ArdourCampCfg.guildrankname)
    if pRank ~= nil then
        Ranking.clearRanking(pRank)
    end
	
	--月末活动
	local svar = System.getStaticVar()
	if svar.EndMonth_openDay ==nil then 
		svar.EndMonth_openDay=3
	end
	
	if svar.isDringEndMonth ~=nil and svar.isDringEndMonth ~=0 then 
		if svar.isDringEndMonth<svar.EndMonth_openDay then 
			svar.isDringEndMonth = svar.isDringEndMonth+1
			--第2日就要关闭双倍经验
			if svar.isDringEndMonth==2 then 
				EndMonthQuanFuShuangbei_CLOSE()
			end
			System.saveStaticVar()
		else --第4日自动关闭
			svar.isDringEndMonth =nil 
			System.saveStaticVar()
		end
	end
	
	
	--庆典活动
	local svar = System.getStaticVar()
	--默认为3天
	if svar.QingDian_openDay ==nil then 
		svar.QingDian_openDay=3
	end
	
	if svar.isDringQingDianActivity ~=nil and svar.isDringQingDianActivity ~=0 then 
		if svar.isDringQingDianActivity<svar.QingDian_openDay then 
			svar.isDringQingDianActivity = svar.isDringQingDianActivity+1
			System.saveStaticVar()
		else --第4日自动关闭
            EndQingDianActivity()
--			svar.isDringQingDianActivity =nil 
--			System.saveStaticVar()
		end
	end
	
	--神秘商店活动
	local svar = System.getStaticVar()
	--默认为3天
	if svar.SHENMISTORE_openDay ==nil then 
		svar.SHENMISTORE_openDay=3
	end
	if svar.isDringShenMiSD ~=nil and svar.isDringShenMiSD ~=0 then 
		if svar.isDringShenMiSD<svar.SHENMISTORE_openDay then 
			svar.isDringShenMiSD = svar.isDringShenMiSD+1
			System.saveStaticVar()
		else --第4日自动关闭
			svar.isDringShenMiSD =nil 
			System.saveStaticVar()
		end
	end
	
    --矿石
    local sdVar = System.getDyanmicVar()
    sdVar.Mineral = nil

    local svar = System.getStaticVar()
     --开服特惠礼包- 神魂礼包与宝石礼包- 第八天开始
--    if svar.tehuinewday == nil  and System.getDaysSinceOpenServer() > 7 then
--        svar.tehuinewday = 8
--    elseif svar.tehuinewday ~= nil then
--        svar.tehuinewday = svar.tehuinewday + 1
--    end
	
	
	--庆典活动开启
	if canStartOpenActivities and svar.QingDianActivityYear~=nil and svar.QingDianActivityMonth~=nil and svar.QingDianActivityDay~=nil then
		local y,m,d = System.getDate( 0, 0, 0 )
		if svar.QingDianActivityYear==y and svar.QingDianActivityMonth==m and svar.QingDianActivityDay==d then 
			if svar.QingDian_openDay==nil then 
				svar.QingDian_openDay =3 
			end
			if svar.QingDian_type == nil then 
				svar.QingDian_type = 0
			end
			StartQingDianActivity(svar.QingDian_openDay,1,svar.QingDian_type)
		end
	end
	
	--神秘商店活动开启
	if canStartOpenActivities and svar.SHENMISTORE_Year~=nil and svar.SHENMISTORE_Month~=nil and svar.SHENMISTORE_Day~=nil then
		local y,m,d = System.getDate( 0, 0, 0 )
		if svar.SHENMISTORE_Year==y and svar.SHENMISTORE_Month==m and svar.SHENMISTORE_Day==d then 
			if svar.SHENMISTORE_openDay==nil then 
				svar.SHENMISTORE_openDay=3
			end
			StartShenMiActivity(svar.SHENMISTORE_openDay,1)
		end
	end
	
	--月末活动开启
	local y,m,d = System.getDate( 0, 0, 0 )
	if canStartOpenActivities and EndMonthActivityDisabled ~= true and svar.EMActivityYear~=nil and svar.EMActivityMonth~=nil and svar.EMActivityDay~=nil then
		if svar.EMActivityYear==y and svar.EMActivityMonth==m and svar.EMActivityDay==d then 
			if svar.EndMonth_openDay==nil then 
				svar.EndMonth_openDay=3
			end
			StartEndMonthActivity(svar.EndMonth_openDay,1)
		end
	end
	
	-- 按实际起始日推进大吉大利，结束后开启下一轮。
	EnsureDaJiDaLiActivity()
	svar = System.getStaticVar()
	
	
	--竞技活动开启
	if (JingJiCompetitionDisabled ~= true or svar.JingJiActivityTypes == 1) and svar.isDringJingJi ~=nil and svar.JingJiOpenDay ~=nil and svar.isDringJingJi ~=0 then
		if svar.isDringJingJi<svar.JingJiOpenDay then 
			svar.isDringJingJi = svar.isDringJingJi+1
			System.saveStaticVar()
		else --第4日自动关闭
            EndJingJi()
		end
	end
	
	
	
	--竞技活动开启
	if canStartOpenActivities and (JingJiCompetitionDisabled ~= true or svar.JingJiActivityTypes == 1) and svar.StartJingJIYear~=nil and svar.StartJingjiMonth~=nil and svar.StartJingJiDay~=nil then
		local y,m,d = System.getDate( 0, 0, 0 )
		if svar.StartJingJIYear==y and svar.StartJingjiMonth==m and svar.StartJingJiDay==d and svar.JingJiOpenDay~=nil and svar.JingJiActivityTypes~=nil then 
			StartJingJi(svar.JingJiOpenDay,1,svar.JingJiActivityTypes) --当前第一天
		end
	end
	
	
	
	
	--周年活动结束
	if svar.isDringOneYearAct ~=nil and svar.isDringOneYearAct ~=0 then 
		if svar.StartOneYear_OpenDay==nil then 
			svar.StartOneYear_OpenDay=7
		end
		if svar.isDringOneYearAct<svar.StartOneYear_OpenDay then 
			svar.isDringOneYearAct = svar.isDringOneYearAct+1
			System.saveStaticVar()
		else --第4日自动关闭
            EndOneYearActivity()
		end
	end
	
	
	
	--周年活动开启
	if canStartOpenActivities and svar.StartOneYear_Year~=nil and svar.StartOneYear_Month~=nil and svar.StartOneYear_Day~=nil then
		local y,m,d = System.getDate( 0, 0, 0 )
		if svar.StartOneYear_Year==y and svar.StartOneYear_Month==m and svar.StartOneYear_Day==d then 
			if svar.StartOneYear_OpenDay==nil then 
				svar.StartOneYear_OpenDay=7
			end
		
			StartOneYearActivity(svar.StartOneYear_OpenDay,1) --当前第一天
		end
	end
	
	
	--散人红利活动开启
	if svar.isDringSanRenHongLi ~=nil and svar.isDringSanRenHongLi ~=0 then 
		if svar.isDringSanRenHongLi<3 then 
			svar.isDringSanRenHongLi = svar.isDringSanRenHongLi+1
			System.saveStaticVar()
		else --第4日自动关闭
            EndSanRenHongLi()
		end
	end
	
	--散人红利活动开启
	if canStartOpenActivities and svar.StartSanRenHongLiYear~=nil and svar.StartSanRenHongLiMonth~=nil and svar.StartSanRenHongLiDay~=nil then
		local y,m,d = System.getDate( 0, 0, 0 )
		if svar.StartSanRenHongLiYear==y and svar.StartSanRenHongLiMonth==m and svar.StartSanRenHongLiDay==d then 
			StartSanRenHongLi(1) --当前第一天
		end
	end
	
	
	--散人红利活动新年时候连续开启4次
	local y,m,d = System.getDate( 0, 0, 0 )
	if canStartOpenActivities and 2019==y and ( 2==m and 2==d  or 2==m and 5==d or 2==m and 8==d or 2==m and 11==d) then
		StartSanRenHongLi(1) --当前第一天
	end
	
	
	
	
	--老兵回归，跨天
    OldPlayerReturnSystemCrossDay()
	ClearGuildFlagExpLog()
	PalaceFighting_NewDayArrive()

    --清除抢红包活动
    RedPacketCross()
    
    -- 春节活动跨天
    on_spring_festival_new_day_arrive()
    
    OnYbConsumeRankingNewDayArrive()
    
	
	OnLuaEvent(LuaEventId.ServerNewDayArrive)
	
	------------------
	-- 这句放在最后
	NotifyAllActorsNewDayArrive()
	
	local playerList = LuaHelp.getSceneActorListById(632)
	if playerList == nil then playerList={} end
	for i, v in ipairs(playerList) do
		Actor.enterScene(v,9,137,149)
	end
end

function NotifyAllActorsNewDayArrive()
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		OnActorExactNewDayArrive(player)
	end
end

-- 精确的玩家跨天(不延迟)
function OnActorExactNewDayArrive(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	ClearActorExactNewDayArriveData(sysarg, var)
	
	
	--7日活动。
	if var.sevenDActivity ==nil then 
		var.sevenDActivity = 1
	else 
		var.sevenDActivity=var.sevenDActivity+1
		if var.sevenDActivity>=7 then 
			var.sevenDActivity = 7
		end
	end
	
	--这个可以精确点的代替days
	var.newdays = {}
	
	var.newdays.Guild_xycmTime = GuildXiangYaoChuMo_Cfg.DailyCount
	var.newdays.Guild_xycmSingleTask = 1
	
	on_spring_festival_online_cross_day(sysarg)
	
	OnLuaEvent(LuaEventId.ActorExactNewDayArrive, sysarg)
end

-- 零点清除黑龙神殿所有怪
function ClearHeiLongShenDianMonsters()
	 --local scenePtr = Fuben.getScenePtrByName(Lang.SceneName.s00062)
	 --if not scenePtr then return end
	 --
	 --print("---------零点清除黑龙神殿所有怪---------")
	 --Fuben.clearSceneAllMonsters(scenePtr)
end

-- 重装脚本前(@rsf)
function OnPreReloadScript()
	 print("---------准备重装脚本---------") 
	 
	 save_static_data() -- 保存 LuaStaticData
	 save_dyanmic_data() -- 保存 LuaDyanmicData
	 
	 YbConsumeRanking_save() -- 先保存，否则 @rsf 后 YbConsumeRanking 将会是空	 

     
     OnLuaEvent(LuaEventId.PreReloadScript)

end


-- 重装脚本完成后(@rsf)
function OnReloadScriptFinish()
	print("---------重装脚本完成---------") 
	
	load_static_data_from_file() -- 装载 LuaStaticData
	load_dyanmic_data_from_file() -- 装载 LuaDyanmicData

    
end

-- 脚本排行榜跨天
function OnScriptRankingNewDayArrive()
	OnLuaEvent(LuaEventId.ScriptRankingNewDayArrive)
end

-- 玩家是否能进入跨服
function IsActorCanEnterCrossServer(sysarg, enterCrossType)
	if System.isCrossServer() then return false end
	local nHour,nMin,nSec = System.getTime(0,0,0)
    local bEnter = false
	if enterCrossType == 0 then -- 普通场景
		--是否在活动时间
         
        if nHour >= 9 and nHour <= 11 then
            bEnter = true
        end
        if bEnter == false then
            if nHour >= 15 and nHour <= 18 then
                bEnter = true
            end
        end
        if bEnter == false then
            if nHour >= 21 and nHour <= 23 then
                bEnter = true
            end
        end
        if bEnter == false then 
            Actor.sendTipmsg(sysarg,"活动时间未到!",ttFlyTip)
            return
         end
		local var = Actor.getStaticVar(sysarg)
		
		if var.ybstate ~= nil and var.ybstate == 1 then
			Actor.sendTipmsg(sysarg, "正在压镖中，请完成后再进入跨服", ttFlyTip)
			return false
		end
		
		-- 跨服屠魔点为0，不可以进入
--		local kuafuTMDian = var.days.kuafuTMDian
--		if kuafuTMDian ~= nil and kuafuTMDian <= 0 then 	
--			return false
--		end	
		
		
		if System.getDaysSinceOpenServer() <CrossServerConfig.YuanGuZhanChangOpenDay and CanPassCrossServer()==false then 
			Actor.sendTipmsg(sysarg,"开服第"..CrossServerConfig.YuanGuZhanChangOpenDay.."天开启,尽请期待！", ttFlyTip)
			return false
		end
		
		--活动时间未到
		local times = YuanGuZhanChangCfg.times
		local timeIdx = checkActivityTime(times)
		if timeIdx == 0 then	
			Actor.sendTipmsg(sysarg,"入口时间未到", ttFlyTip)
			return false
		end
		

		
	elseif enterCrossType == 1 then -- 远古押镖场景
		
        if nHour == 11 and nMin < 30 then
            bEnter = true
        end
        if bEnter == false then
            if nHour == 17 and nMin < 30 then
                bEnter = true
            end
        end
         if bEnter == false then
            if nHour == 21  then
                bEnter = true
            end
        end
         if bEnter == false then 
            Actor.sendTipmsg(sysarg,"活动时间未到!",ttFlyTip)
            return
         end
		local var = Actor.getStaticVar(sysarg)
		
		if var.ybstate ~= nil and var.ybstate == 1 then
			Actor.sendTipmsg(sysarg, "正在压镖中，请完成后再进入跨服", ttFlyTip)
			return false
		end
		
		-- 押镖次数用完也可以进跨服场景
		if not IsCanCrossYaBiao(sysarg, false) then
			return false
		end
		
		if System.getDaysSinceOpenServer() <CrossServerConfig.YuanGuYaBiAoOpenDay  and CanPassCrossServer()==false then 
			Actor.sendTipmsg(sysarg,"开服第"..CrossServerConfig.YuanGuYaBiAoOpenDay.."天开启,尽请期待！", ttFlyTip)
			return false
		end
		
    elseif enterCrossType == 2 then --匹配战场
        if nHour >= 12 and nMin >= 30 and nHour <= 13 then
           bEnter = true
        end
        if bEnter == false then
            if nHour >= 19 and nMin >= 30 and nHour <= 20 then
                bEnter = true
            end
        end
        if bEnter == false then 
            Actor.sendTipmsg(sysarg,"活动时间未到!",ttFlyTip)
            return
         end
		if System.getDaysSinceOpenServer() <CrossServerConfig.ThreeVThreeOpenDay and CanPassCrossServer()==false then 
			Actor.sendTipmsg(sysarg,"开服第"..CrossServerConfig.ThreeVThreeOpenDay.."天开启,尽请期待！", ttFlyTip)
			return false
		end
		
        return true
	elseif enterCrossType == 3 then --个人竞技 
        local dayofMonth = {31,28,31,30,31,30,31,31,30,31,30,31}
        local nYear,nMonth,nDay = System.getDate(0,0,0)
        if nDay == dayofMonth[nMonth] then
            if nHour >= 12 then
                Actor.sendTipmsg(sysarg,"奖励正在结算中!",ttFlyTip)
                return false
            end
        end

   
        local day = System.getDayOfWeek()
        local bEnter = false
        if day == 2 or day == 4 or day == 6 then
            if nHour >= 10 and nHour < 11 then 
                bEnter = true
            elseif nHour >= 14 and nHour < 15 then
                bEnter = true
            elseif nHour >= 19 and nHour < 20 then
                bEnter = true
            end
        end
        --bEnter = true
        if bEnter == false then
            Actor.sendTipmsg(sysarg,"活动时间未到!",ttFlyTip)
            return false
        end
        local var = Actor.getStaticVar(sysarg)
        if var.singleinfoday == nil then var.singleinfoday = 0 end

        if var.singleinfoday >= 10 then
            Actor.sendTipmsg(sysarg,"今日进入次数不足，无法再匹配！",ttFlyTip)
            return false
        end
    elseif enterCrossType == 4 then --行会
        local svar = System.getDyanmicVar()
        if svar.yuanGuZhanChangguildTime == nil then
            Actor.sendTipmsg(sysarg,"活动时间未到!",ttFlyTip)
             return false
        end
        --20分钟后入口时间关闭
        if System.getCurrMiniTime() - svar.yuanGuZhanChangguildcd > 60 * 20 then
            Actor.sendTipmsg(sysarg,"活动入口已关闭,无法进入!",ttFlyTip)
            return false
        end
        local nGuildId = Actor.getGuildId(sysarg)
        if nGuildId <= 0 then
            Actor.sendTipmsg(sysarg,"没有加入行会,无法进入!",ttFlyTip)
            return false
        end

        local var = Actor.getStaticVar(sysarg)
        local batter = Actor.getIntProperty(sysarg,PROP_ACTOR_BATTLE_POWER)
        if var.myTopBatter ~= nil then 
            batter = var.myTopBatter

        end
        if batter < 3000000 then
            Actor.sendTipmsg(sysarg,"三百万以上战力才可进入!",ttFlyTip)
            return false
        end
    else   
		return false
	end
	
	return true
end

function setSingleRankPoint(szName,nPoint)
    local pActor = Actor.getActorByName(szName)
    if pActor ~= nil then
        local var = Actor.getStaticVar(pActor)
        var.singlerankpoint = tonumber(nPoint)
    end
end
CanPassCrossServer =function()
	local opentime = System.getServerOpenTime()
	local y,m,d,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(opentime)	
	
	local canPass =false
	
	if m==11 and d>=3 and d<=12 and y==2017 then 
		canPass=true
	end
	
	return canPass
end



function InitAiqyIconState()
    local sys = System.getStaticVar()
    if sys.iconstate == nil then 
        sys.iconstate = {} 
        sys.iconstate.count = 0
        sys.iconstate.arr = {}
     end
     return sys

end
--一分钟循环一次
function LoopAiqyIconState()
    local nCurrentTime  = System.getCurrSystemTime()
     local sys = InitAiqyIconState()
    local nCount = sys.iconstate.count
    while nCount > 0  do
        local info = sys.iconstate.arr[nCount]
        if info ~= nil and nCurrentTime >= info.endtime then
            DeleteAiqyIconState(info.iconid)
        end 

        nCount = nCount - 1
    end
    
end
function SendAiqyDoorState(sysarg)
    local sys = InitAiqyIconState()
    local nCurrentTime  = System.getCurrSystemTime()
    local nCount = sys.iconstate.count
    while nCount > 0  do
        local info = sys.iconstate.arr[nCount]
        if info ~= nil and nCurrentTime < info.endtime and nCurrentTime >= info.starttime and info.url ~= nil and string.len(info.url) > 0 then
            SendAllAiqyIconState(1,info.url,info.iconid)
        end 

        nCount = nCount - 1
    end
end

function SendAllAiqyIconState(nState,szUrl,nIconId)

    local playerList = LuaHelp.getAllActorList()		
	if playerList ~= nil then

		for j = 1, #playerList do
			local player = playerList[j]
			if player then
                local pack = DataPack.allocPacket(player,151,54)
                DataPack.writeByte(pack,nState)
                DataPack.writeString(pack,szUrl)
                DataPack.writeInt(pack,nIconId)
                DataPack.flush(pack)

            end
        end
    end
end

function DeleteAiqyIconState(nIconId)
    nIconId = tonumber(nIconId)
     local sys = InitAiqyIconState()
     local i = 0
     for i =1,sys.iconstate.count do
        local info = sys.iconstate.arr[i]
        if info ~= nil and info.iconid == nIconId then
            --发送广播
            SendAllAiqyIconState(0,info.url,info.iconid)
            sys.iconstate.arr[i] = nil
            
            break
        end
     end
     for j=i,sys.iconstate.count do
        if  sys.iconstate.arr[j + 1] == nil then break end
        sys.iconstate.arr[j].iconid = sys.iconstate.arr[j + 1].iconid
        sys.iconstate.arr[j].url = sys.iconstate.arr[j + 1].url
        sys.iconstate.arr[j].starttime = sys.iconstate.arr[j + 1].starttime
        sys.iconstate.arr[j].endtime = sys.iconstate.arr[j + 1].endtime
     end
     sys.iconstate.arr[sys.iconstate.count] = nil
     sys.iconstate.count = sys.iconstate.count - 1
end
function SetAiqyDoorState(nState,szUrl,nIconId,nStartTime,nEndTime)
    
     if nState == nil then nState = 0 end
     if szUrl == nil then szUrl = "" end
     if nStartTime == nil then nStartTime = 0 end
     if nEndTime == nil then nEndTime = 0 end
     nState = tonumber(nState)
     nIconId = tonumber(nIconId)
     nStartTime = tonumber(nStartTime)
     nEndTime = tonumber(nEndTime)
     local sys = InitAiqyIconState()
     --删除
     if nState == 0 then
        DeleteAiqyIconState(nIconId)
        return
     end
     local i = 1
     for i =1,sys.iconstate.count do
        if  sys.iconstate.arr[i] ~= nil and sys.iconstate.arr[i].iconid == nIconId then
            sys.iconstate.arr[i].iconid = nIconId
            sys.iconstate.arr[i].url = szUrl
            sys.iconstate.arr[i].starttime = nStartTime
            sys.iconstate.arr[i].endtime =nEndTime
            SendAllAiqyIconState(1,szUrl,nIconId)
            return
        end
     end
     sys.iconstate.count = sys.iconstate.count + 1
      i = sys.iconstate.count
      sys.iconstate.arr[i] = {}
     sys.iconstate.arr[i].iconid = nIconId
     sys.iconstate.arr[i].url = szUrl
     sys.iconstate.arr[i].starttime = nStartTime
      sys.iconstate.arr[i].endtime =nEndTime
      local nCurrentTime  = System.getCurrSystemTime()
     if nCurrentTime >= nStartTime   then
         SendAllAiqyIconState(1,szUrl,nIconId)

      end
     

end

function checkDaJiDaLiAndOneYearDayCount()
	-- 有可能0点前关服，0点后再开服，导致 活动天数 没有加 1, 这里修改复一下
	local svar = System.getStaticVar()
	
	local y,m,d,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(System.getCurrMiniTime())
	
	--大吉大利活动开启
	if svar.isDringDaJiDaLi ~=nil and svar.isDringDaJiDaLi ~=0 then 
		local Year = svar.StartDaJiDaLiYear 
		local Month = svar.SpringDaJiDaLiMonth
		local Day = svar.StartDaJiDaLiDay
		if Year ~= nil and Month ~= nil and Day ~= nil then
			local startDt = System.encodeNumTime(Year,Month,Day,0,0,0)
			local curDt = System.encodeNumTime(y,m,d,0,0,0)
			local diffTime = curDt - startDt
			if diffTime > 0 then
				local openDay = (math.floor(diffTime/86400)+1)
				if svar.isDringDaJiDaLi ~= openDay then
					local oldDay = svar.isDringDaJiDaLi
					svar.isDringDaJiDaLi = openDay
					System.trace("修复大吉大利活动当前活动天数，oldDay" .. oldDay .. ",newDay="..openDay)
					if openDay >= 4 then
						System.trace("修复大吉大利活动当前活动天数之后，活动结束")
						EndDaJiDaLi()
					end
				end
			end			
		end	
	end
	
	--周年活动结束
	if svar.isDringOneYearAct ~=nil and svar.isDringOneYearAct ~=0 then 
		local Year = svar.StartOneYear_Year
		local Month = svar.StartOneYear_Month
		local Day = svar.StartOneYear_Day
		local _OpenDay = svar.StartOneYear_OpenDay
		
		if Year ~= nil and Month ~= nil and Day ~= nil and _OpenDay ~= nil then
			local startDt = System.encodeNumTime(Year,Month,Day,0,0,0)
			local curDt = System.encodeNumTime(y,m,d,0,0,0)
			local diffTime = curDt - startDt
			if diffTime > 0 then
				local openDay = (math.floor(diffTime/86400)+1)
				if svar.isDringOneYearAct ~= openDay then					
					local oldDay = svar.isDringOneYearAct
					svar.isDringOneYearAct = openDay
					System.trace("修复周年活动当前活动天数，oldDay" .. oldDay .. ",newDay="..openDay)
					
					if openDay > _OpenDay then
						System.trace("修复周年活动当前活动天数之后，活动结束")
						EndOneYearActivity()
					end
				end
			end			
		end		
	end
end

