--#include "data\functions\SpecialQuest.lua" once
--#include "data\config\activityconfig\QiBingDuoBao.lua" once
--#include "data\functions\TimerFunc.lua" once
--#include "data\functions\MobMonsterTips.lua" once
--#include "data\config\activityconfig\Dart\DartConfig.lua"  once  --基本设置
--#include "data\functions\Activity\Dart\ApplyDartCommon.lua"
--#include "data\config\monster\ModBossTips.lua" once
--#include "data\config\monster\SingleBossCfg.lua" once
--#include "data\config\activity\LevelGrowthReward.lua" once
--#include "data\config\activityconfig\SwinPoolConfig.lua" once
--#include "data\config\misc\PreferentialGoods.lua" once
--#include "data\config\activityconfig\BaGuaSerialConfig.lua" once
--#include "data\config\culture\CultureConfig.lua" once
--#include "data\functions\NpcMiscFun\SanRenNPC\HuoDong\MoneyActivity.lua" once	2016/12/26 zer 移动更新
--#include "data\config\monster\ChallengeBoss.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once 
--#include "data\config\guild\GuildSiegeConfig.lua" once  --行会
--#include "data\config\item\BottlesExpCfg.lua" once
--#include "data\config\monster\CoinFuBen.lua" 
--#include "data\config\activity\OneHundredActivityCfg.lua" once
--#include "data\config\activity\LaborActivityCfg.lua" once
--#include "data\config\circle\HonorValue.lua" once
-- --#include "data\functions\Activity\NationalDay.lua" once
--#include "data\functions\Activity\LivenessActivity.lua" once
--#include "data\functions\Activity\HistoryTask.lua" once
--#include "data\functions\Activity\PublicTest.lua" once
--#include "data\functions\Activity\ChristmasAndNewYear.lua" once
--#include "data\functions\modules\InjectExpRanking.lua" once
--#include "data\functions\modules\wangling.lua" once
--#include "data\functions\modules\garden.lua" once
--#include "data\functions\AchieveEvents.lua" once
--#include "data\config\vip\VipPrivilegesCfg.lua" once
--#include "data\functions\modules\challenge_fuben.lua" once
--#include "data\functions\modules\headtitle.lua" once
--#include "data\config\activity\StdActivityCfg.lua" once
--#include "data\functions\Systems\ActivitySystem\wlzbPaoDianHandle.lua" once
--#include "data\functions\Systems\ActivitySystem\benpaobaHandle.lua" once
--#include "data\functions\Systems\ActivitySystem\camp_battle_handle.lua" once
--#include "data\functions\Systems\ActivitySystem\jumozhichaoHandle.lua" once
--#include "data\functions\Systems\ActivitySystem\JuntuanZhan.lua" once
--#include "data\config\Legion\LegionId.lua" once
--#include "data\functions\Fuben\emoling.lua" once
--#include "data\functions\VipRecovery.lua" once
--#include "data\functions\Systems\ActivitySystem\BiGuanXiuLianHandle.lua" once
--#include "data\functions\Systems\ActivitySystem\jumozhichaoHandle.lua" once
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\ZhanWuShuang.lua" once	--2016/12/26 zer 移动更新
--#include "data\functions\Systems\ActivitySystem\FuBen.lua" once
--#include "data\config\activity\GameFubenCfg.lua" once
--#include "data\functions\ActorEvent\KillTheCollectingMonster.lua" once
--#include "data\functions\Systems\ActivitySystem\MiJingZhiLv.lua" once
--#include "data\functions\Systems\ActivitySystem\YuanbaoJiaNianHua.lua" once
--#include "data\config\vocation\VocationConfig.lua" once
--#include "data\config\activity\OpenServerAwardCfg.lua" ocne  --全民boss
--#include "data\config\monster\SRRefreshMonster.lua" ocne  --定时器刷BOSS配置
--#include "data\functions\Systems\ActivitySystem\taotieshendian.lua" once
--#include "data\config\guide\GuildBossCfgEx.lua" once
--#include "data\config\guild\JiQingGuildCfg.lua" once
--#include "data\config\ArdourCamp\ArdourCampCfg.lua" once
--#include "data\functions\TreasureTrove\TreasureTrove.lua" once
--#include "data\config\item\SenLuoShenJieConfig.lua" once
--#include "data\functions\Activity\GuildBiaoChe\GuildBiaoCheEx.lua"
--#include "data\config\guild\GuildBiaocheCfg.lua" once
--#include "data\functions\SpecialTitle.lua" once
--#include "data\functions\ItemFunc\TresureBox.lua" once
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\YouXiTuiGuangYuan.lua" once
--#include "data\functions\Systems\ActivitySystem\ActivityUtils.lua" once
--#include "data\config\SpecialTitleCfg.lua" once
--#include "data\config\GrowthEquipCfg.lua" once
--#include "data\config\ActorEvent\TianJiangHongBaoCfg.lua" once
--#include "data\config\activity\HeFuconfig.lua" once
--#include "data\functions\Systems\ActivitySystem\YongZheChuangGuang.lua" once
--#include "data\functions\Systems\ActivitySystem\TongtianTa.lua" once
--#include "data\functions\Systems\ActivitySystem\YuanBaoJiaNianHuaNew.lua" once
--#include "data\config\CliffordConfig.lua" once
--#include "data\config\KillBossAddBuff.lua" once
--#include "data\functions\MkzFunc.lua" once
--#include "data\config\activity\QingDianActivityCfg.lua" once
--#include "data\functions\Activity\YuanGuZhanChang.lua" once --远古战场
--#include "data\config\modules\kill_boss_cfg.lua" once --单挑boss配置
--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\SiShengGong.lua" once
--#include "data\config\ActorEvent\TianJiangHongBao_BCfg.lua" once
--#include "data\config\activity\ExpRefiningConfig.lua" once
--#include "data\config\NewZodiac.lua" once
--#include "data\functions\guildOperate\GuildXiangYaoChuMo_Cfg.lua" once
--#include "data\config\equipSynthesis\BrotherQingMiDuTask.lua" once
--#include "data\functions\Systems\ActivitySystem\PalaceFighting.lua" once
--#include "data\functions\OldPlayerReturnFunc.lua" once
--#include "data\functions\Activity\SpringFestivalActivity.lua" once
--#include "data\config\new_activity\festival\activity_DaJiDaLi.lua" once
--#include "data\config\new_activity\festival\activity_jingji.lua" once
--#include "data\config\activity\SanRenHongLiCfg.lua" once
--#include "data\config\NationalDayActivityCfg.lua" once
--#include "data\functions\SuperLuckStarFunc.lua" once
--#include "data\config\equipSynthesis\XinFaSystemCfg.lua" once  --心法系统配置
--#include "data\functions\GuildFubenBossFunc.lua" once
--#include "data\config\item\NormalItemDatas.lua" once
--#include "data\config\item\ZhizunEquipCfg.lua" once --至尊装备套装属性
--#include "data\functions\IdentifyCodeFunc.lua" once
--#include "data\config\NpcMiscCfg\EquipRecyclingCfg.lua" once

-- 清除旧神戒宝盒误写到可叠加戒指材料上的随机属性。
LocalDT.NormalizeSkyRingMaterialStacks = function(sysarg)
	for index = 0, Item.getBagItemCount(sysarg) - 1 do
		local itemPtr = Item.getItemPtrByIndex(sysarg, index)
		if itemPtr then
			local itemId = Item.getItemId(itemPtr)
			if itemId >= 7697 and itemId <= 7700 and Item.getItemProperty(sysarg, itemPtr, Item.ipTaoStrong, 0) > 0 then
				Item.setItemProperty(sysarg, itemPtr, Item.ipTaoStrong, 0)
			end
		end
	end
end

-- 定时 BOSS 的截止时间和当前怪物写入服务器持久变量，重启后可恢复。
LocalDT.GetSRRefreshMonsterSave = function()
	local svar = System.getStaticVar()
	if svar.srRefreshMonsterSave == nil then
		svar.srRefreshMonsterSave = {}
	end
	return svar.srRefreshMonsterSave
end

LocalDT.GetSRRefreshMonsterRecord = function(save, bj)
	if save[bj] == nil then
		save[bj] = {}
	end
	return save[bj]
end

LocalDT.GetSRRefreshMonsterLiveId = function(scene, ref)
	if scene == nil then return 0, 0 end
	if Fuben.getLiveMonsterCount(scene, ref.monid) > 0 then
		return ref.monid, 0
	end
	if ref.nextboss ~= nil then
		for i = 1, #ref.nextboss do
			if Fuben.getLiveMonsterCount(scene, ref.nextboss[i].monid) > 0 then
				return ref.nextboss[i].monid, i
			end
		end
	end
	return 0, 0
end

LocalDT.GetSRRefreshMonsterActiveId = function(ref, record)
	local activeId = tonumber(record.activeId)
	if ref.nextboss ~= nil then
		for i = 1, #ref.nextboss do
			if activeId == ref.nextboss[i].monid then
				return activeId, i
			end
		end
	end
	return ref.monid, 0
end

LocalDT.CreateSRRefreshMonster = function(scene, ref, monid, randomPosition)
	if scene == nil then return nil end
	if not randomPosition then
		return Fuben.createMonster(scene, monid, ref.x, ref.y, 0)
	end
	for i = 1, 20 do
		local x = ref.x + System.getRandomNumber(20)
		local y = ref.y + System.getRandomNumber(20)
		if i == 20 then x, y = ref.x, ref.y end
		local monster = Fuben.createMonster(scene, monid, x, y, 0)
		if monster ~= nil then return monster end
	end
	return nil
end

--//登录游戏触发
function OnPlayerLogin(sysarg, isCrossDay)	

	--转换旧的增值卡数据
	--TransformZengZhiKaData(sysarg)
	
	local actorName = Actor.getName(sysarg)
	LocalDT.NormalizeSkyRingMaterialStacks(sysarg)
	
	-- 变态版一上线就是VIP5，开服清档后关闭
	-- if Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_GRADE) < 5 then
	-- 	Actor.setIntProperty(sysarg, PROP_ACTOR_VIP_GRADE, 5)
	-- 	local sTips = string.format("恭喜玩家<(n%s)>成功将VIP升级到<(c0xFF00fefe)5>级 <查看VIP特权/@@showWin,14,1>", actorName)
	-- 	System.broadcastTipmsg(sTips, ttChatWindow)
	-- end
	
	if get_taskflags_val(sysarg) == 0 then 
		set_taskflags_val(sysarg,1)
		local actorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		System.trace(sysarg,actorID.." reset task...................")
		Actor.addTimer(sysarg,14,5*1000)
	end
	
	--local noticeStr = string.format("喜迎<(n%s)>进入散人传说,有你更精彩.", actorName)
	local noticeStr = string.format("欢迎<(n%s)>来到散人传说,有你更精彩，请勿随意相信陌生人信息，认准官网客服.", actorName)
	
	if System.isCrossServer() ==true then
		
		SendEnterCrossType(sysarg)
		
		local sceneName =  Actor.getSceneName(sysarg,0,0)
		--noticeStr = string.format("<(c0xFF00FF00)%s区><(n%s)>进入%s",Actor.getCrossServerId(sysarg),actorName,sceneName)
        noticeStr = string.format("<(n%s)>进入%s",actorName,sceneName)
		--只可以同一场景看到
		local playerList = LuaHelp.getSceneActorListById(Actor.getSceneId(sysarg))
		if playerList ~= nil then 
			for i, v in ipairs(playerList) do
				if v~=nil then 

					Actor.sendTipmsg(v,noticeStr,ttChatWindow)
				end
			end
		end
        
	else
		System.broadcastCrossAreaTipmsg(noticeStr,128,Actor.getSceneId(sysarg))
	end
	
	--System.broadcastTipmsg(noticeStr, 128)
  
	local var = Actor.getStaticVar(sysarg);
	local svar = System.getStaticVar()
	local serverOpenTime = System.getServerOpenTime()
	local canStartOpenActivities = System.getCurrMiniTime() >= serverOpenTime

	if canStartOpenActivities and (svar.isDringQingDianActivity == nil or svar.isDringQingDianActivity < 1 or (svar.QingDian_openDay ~= nil and svar.isDringQingDianActivity > svar.QingDian_openDay)) then
		qdhdkq(sysarg)
		svar = System.getStaticVar()
	end

	if canStartOpenActivities and (svar.isDringShenMiSD == nil or svar.isDringShenMiSD < 1 or (svar.SHENMISTORE_openDay ~= nil and svar.isDringShenMiSD > svar.SHENMISTORE_openDay)) then
		StartShenMiActivity(svar.SHENMISTORE_openDay or 3, 1)
		svar = System.getStaticVar()
	end

	if canStartOpenActivities and (svar.isDringSanRenHongLi == nil or svar.isDringSanRenHongLi < 1 or svar.isDringSanRenHongLi > 3) then
		srhlkq(sysarg)
		svar = System.getStaticVar()
	end

	-- 3. 大吉大利按三天一轮自动开启，并修复停服期间的活动天数
	if canStartOpenActivities then
		EnsureDaJiDaLiActivity()
		svar = System.getStaticVar()
	end

	-- 4. 周年庆典活动自启动与首日修复
	if canStartOpenActivities and (svar.isDringOneYearAct == nil or svar.isDringOneYearAct < 1 or (svar.StartOneYear_OpenDay ~= nil and svar.isDringOneYearAct > svar.StartOneYear_OpenDay)) then
		local y, m, d = System.getDate()
		svar.StartOneYear_Year = y
		svar.StartOneYear_Month = m
		svar.StartOneYear_Day = d
		svar.StartOneYear_OpenDay = 7
		if StartOneYearActivity ~= nil then
			StartOneYearActivity(7, 1)
		end
		svar = System.getStaticVar()
	end

	-- 5. 竞技活动自启动与首日修复
	if JingJiCompetitionDisabled == true and DisableJingJiCompetition ~= nil then
		DisableJingJiCompetition()
		svar = System.getStaticVar()
	end
	if canStartOpenActivities and (JingJiCompetitionDisabled ~= true or svar.JingJiActivityTypes == 1) and
		(svar.isDringJingJi == nil or svar.isDringJingJi < 1 or
		 (svar.JingJiOpenDay ~= nil and svar.isDringJingJi > svar.JingJiOpenDay)) then
		local y, m, d = System.getDate()
		svar.StartJingJIYear = y
		svar.StartJingjiMonth = m
		svar.StartJingJiDay = d
		svar.JingJiOpenDay = svar.JingJiOpenDay or 3
		if StartJingJi ~= nil then
			StartJingJi(svar.JingJiOpenDay, 1, svar.JingJiActivityTypes)
		end
		svar = System.getStaticVar()
	end

	-- 6. 月末活动自启动与首日修复
	if canStartOpenActivities and EndMonthActivityDisabled ~= true and (svar.isDringEndMonth == nil or svar.isDringEndMonth < 1 or (svar.EndMonth_openDay ~= nil and svar.isDringEndMonth > svar.EndMonth_openDay)) then
		local y, m, d = System.getDate()
		svar.EMActivityYear = y
		svar.EMActivityMonth = m
		svar.EMActivityDay = d
		svar.EndMonth_openDay = svar.EndMonth_openDay or 3
		if StartEndMonthActivity ~= nil then
			StartEndMonthActivity(svar.EndMonth_openDay, 1)
		end
		svar = System.getStaticVar()
	elseif EndMonthActivityDisabled == true and svar.isDringEndMonth ~= nil then
		svar.isDringEndMonth = nil
		System.saveStaticVar()
		svar = System.getStaticVar()
	end

	-- 7. 国庆送礼按七天轮次自动开启并重置玩家本轮领奖状态
	if canStartOpenActivities and EnsureNationalDayActivity ~= nil then
		EnsureNationalDayActivity()
		svar = System.getStaticVar()
	end

	-- 8. 新春活动按周期自动开启，并同步跨期状态
	if canStartOpenActivities then
		ensure_spring_festival_activity(false)
		svar = System.getStaticVar()
	end

	if type(var.zkillmon)=='number' then 
		var.zkillmon=nil
		var.zkillmon={}
		var.zkillmon[1]=0
	end
	
    local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    
    -- 在 saveActorFightData() 这个函数中, 没有检查前端发来的数据, 造成保存了太多的垃圾信息, 这里清除了吧
    var.hook = nil -- 前端说不需要这个数据了    
    
   -- System.TestBackMail(actor_id.."|6|测试物品|物品|576,1,0/577,1,1")
	--System.AddMail(actor_id,6,0,"测试物品","测试",0,0,"576,1,0/577,1,1")
    --System.AddMail(actor_id,7,0,"测试金钱","金钱",0,0,"3,1000")
	--获取上次下线时间和本次登录时间
	local logoutTime = Actor.getLastLogoutTime(sysarg)
	local curTime = System.getCurrMiniTime()
		
	if not System.isSameMonth(curTime,logoutTime) then		
		var.SigninGift = {} -- 跨月清0
		var.ljqdAward = nil;-- 累计签到奖领取标记
	end
	
	--特权
    SpecialTitle_OnActorLogin(sysarg)
	
	--头衔设置
	ht_OnPlayerLogin(sysarg, isCrossDay, var)
		
	--玩家跨天登陆
	if isCrossDay ~= 0 then
		if logoutTime > curTime then
			ClearHistoryTaskData(sysarg)
		else
			local zeroTime = System.getToday() -- 今日凌晨零点的时间秒数
			local diffSec = zeroTime - logoutTime
			if diffSec > 86400 then
				ClearHistoryTaskData(sysarg) -- 跨了两天
			elseif diffSec > 0 then
				-- 注意：因为要记录昨天的数据,所以要在清除每日数据之前调用
				SaveHistoryTaskData(sysarg) -- 跨了一天
			end
		end
		
		ClearActorExactNewDayArriveData(sysarg, var)
		OnPlayerCrossDay(sysarg)
		sevenDaysActivity_WhenLogin(sysarg)
		
		--这个可以精确点的代替days,跨天登录
		var.newdays = {}
	end
	
	if var.newdays == nil then
		var.newdays = {}
	end
	if canStartOpenActivities and EnsureNationalDayRewardCycle ~= nil then
		EnsureNationalDayRewardCycle(sysarg)
		if isCrossDay == 0 and SentNationalDayIndex ~= nil and SentNationalDayInfoNew ~= nil then
			SentNationalDayIndex(sysarg)
			SentNationalDayInfoNew(sysarg)
		end
	end
	
	SynchDataWhenLoginOrCrossDay(sysarg)		

	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	
	--XY 平台显示收藏有礼图标
	--if nActorLevel >= 1 and System.getSpid() == 2 then
    if nActorLevel >= 10000 then
		if var.CollectGame == nil then
			AllActivityButtonState(sysarg,93,1)
		end
	end
	
	--OnActorLoginFuGuiShou(sysarg, isCrossDay, var);	
	--OnNationalDayPlayerLogin(sysarg, isCrossDay) -- 国庆活动
	--OnPublicTestPlayerLogin(sysarg, isCrossDay) -- 公测活动屏蔽
	--OnDEggPlayerLogin(sysarg, isCrossDay) -- 双蛋活动
	on_spring_festival_player_login(sysarg, isCrossDay) -- 春节活动
    --捐献排行
	OnInjectExpRankingPlayerLogin(sysarg, isCrossDay, var)	
	garden_OnPlayerLogin(sysarg, isCrossDay, var)
	--平台
	Platform_OnPlayerLogin(sysarg, isCrossDay, var)
	
	OnLuaEvent(LuaEventId.PlayerLogin, sysarg, isCrossDay ~= 0)
	
	--军团系统
	ShuaXinFengHao(sysarg)
	onLegionMasterChange(sysarg)
	--刷新任务
	Quest_ShuaXin(sysarg)


	--散人传说 每在线10秒自动回收装备设置
	Actor.addTimer(sysarg, 27, 10000);


	
	--清除玩家闭关修炼活动数据
	clearData_Jiqingbiguang(sysarg)
	--清除神威狱活动数据
	clearData_ShenWeiYu(sysarg)
	

	
	--请求显示挑战boss按钮（过早显示会导致这个主线任务过不了）
	if get_taskflags_val(sysarg)~=nil and get_taskflags_val(sysarg)>84 then 
		local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sShowTheChallengeBoss)
		DataPack.flush(netPack)
	end
	
	if get_taskflags_val(sysarg)~=nil and  get_taskflags_val(sysarg)== 23 then --这个任务需要特殊处理
		if var.zhudongtask1==nil then 
			var.zkillmon=nil
			var.zkillmon ={}
			var.zkillmon[1]=0
			
			set_taskflags_val(sysarg,22)
		else
			set_taskflags_val(sysarg,24)
			Quest_ShuaXin(sysarg)
		end
		Quest_ShuaXin(sysarg)
	end

	if get_taskflags_val(sysarg)~=nil and  get_taskflags_val(sysarg)== 37 then --这个任务需要特殊处理
		set_taskflags_val(sysarg,36)
		Quest_ShuaXin(sysarg)
	end

	if get_taskflags_val(sysarg)~=nil and  get_taskflags_val(sysarg)== 58 then --这个任务需要特殊处理
		set_taskflags_val(sysarg,57)
		Quest_ShuaXin(sysarg)
	end
	
	--提示天神护体
	if Actor.hasState(sysarg,esStateShield) then
		local RwData = {"xxxx", "威龙城", 136,141, "威龙城-天神护体"}
		local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
	
		Actor.sendTipmsg(sysarg,string.format("您已自动开启了天神护体获得大量增益属性,死亡后必掉50元宝,可前往%s处关闭%s",NpcName,NpctFly),128);
	end
	

	--清理老的军团BUFF
	local oldjtbuff = {
		{210,11},
		{210,15},
		{210,19},
		{213,66},
		{214,12},
		{214,16},
		{214,20},
	};
	for i = 1,#oldjtbuff do
		Actor.delBuff(sysarg, oldjtbuff[i][2], oldjtbuff[i][1]);
	end


	-- --在安全区上线,满血满蓝
	-- if Actor.hasMapAreaAttri(sysarg,1)==true then
	-- 	local maxhp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP)	
	-- 	local maxmp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)
		
	-- 	Actor.setIntProperty(sysarg,PROP_CREATURE_HP,maxhp)
	-- 	Actor.setIntProperty(sysarg,PROP_CREATURE_MP,maxmp)
	-- end
	--登录时邮件发放补偿礼包
	-- local bclbid = 648;
    -- local serverId = System.getServerId()
    -- if serverId == 50001 or serverId == 50002 then
    --     local bGive = false
    --     local y,m,d = System.getDate()
    --     if m == 3 and (d == 17 or d == 18) then
    --            bGive = true
    --     end
    --     if bGive == true then
    --         if var.bcgift == nil then
    --             local actorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    --             local strTitle = "补偿礼包"
    --             local strDesc = "更新补偿礼包"
    --             System.AddMail(actorID, 6, 0, strTitle, strDesc,0,0, bclbid..",1,1" );
    --             var.bcgift = 1
    --         end
    --     end
    -- end


	-- --收走生肖相关道具(针对2017年4月1号之前大白兔1,2区的数据处理)
	-- local sxdata = {1774,1814,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1826,1827,1828,1829,1830,1831,1832,1833,1834,1835,1836,1837,1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1848,1849};
	-- for i = 1,#sxdata do

	-- end

    --激情大本营
    local sVar = System.getDyanmicVar()
    if sVar.ardourcamping == 1 and  var.ardourlevel ~= nil then
        Actor.setIntProperty(sysarg,PROP_ACTOR_ARDOUR_ATTACK_RATE,var.ardourlevel)
    end
   
   --膜拜武林盟主
    if Actor.hasBuffById(sysarg,162) then
        local cfg = StdActivityCfg.MoBeiChongZhu
	    local times = cfg.tOpenTime.times
        local timeIdx = checkActivityTime(times)
        if timeIdx ~= 0 then
            local endHour = times[timeIdx][3]
	        local endMin = times[timeIdx][4]
	        local endSec = 0
	        if endHour == 0 and endMin == 0 then
		        endHour = 23
		        endMin = 59
		        endSec = 59
            end
            local leftSecond = System.ResidualTime(endHour, endMin, endSec)
	        if leftSecond == 0 then
                Actor.delBuffById(sysarg,162)
            end
	    end
    end

	--特权补偿格子 黄铜
    if IsSpeciaTitleVip(sysarg,1) and var.isGiveDepotGrid == nil then
        local actorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        System.AddMail(actorID, 0, 0, "黄铜特权购买奖励", "尊敬的玩家您好,\\\\您购买了黄铜特权。开启了"..SpecialTitleCfg.depotgridcount.."个仓库格子");
			--赠送格子
		local nCount = Actor.getUserDepotGridCount(sysarg)
		Actor.setUserDepotGridCount(sysarg,nCount + SpecialTitleCfg.depotgridcount)
		var.isGiveDepotGrid = true
        
    end
	--仓库格子补偿
    if Actor.getUserDepotGridCount(sysarg) < 66 then
        Actor.setUserDepotGridCount(sysarg,66)
    end
    if var.isoldDepot == nil then
        if Actor.getUserDepotGridCount(sysarg) > 66 then
            local nAll = Actor.getUserDepotGridCount(sysarg) + 24
            Actor.setUserDepotGridCount(sysarg,nAll) 
        end
        var.isoldDepot = 1
    end
	--祈福活动
    if var.clifford == nil then
        var.clifford = {}
        var.clifford.time = CliffordConfig.FreeTime
        var.clifford.free = 0
        var.clifford.money = 0
        var.clifford.allCount = 0
    end
    if isCrossDay ~= 0 then
        var.clifford.time = CliffordConfig.FreeTime
        var.clifford.free = 0
        var.clifford.money = 0
        var.clifford.allCount = 0
    end
    Actor.addTimer(sysarg,46,CliffordConfig.DecTimer)
	--经验瓶，开服第一天的第一次登录
	--local openServerDay = System.getDaysSinceOpenServer() 
	--if openServerDay==1 then 
	--if var.ExpBottleFirst ==nil then 
	--	var.ExpBottleFirst = 1
		var.EBTime = System.getCurrMiniTime()
	--end
	--end

    --成长武器兼容旧代码------------------------兼容旧服------------------------------------------------------------------------
    local GrowthEquipCfgEx = {}
    for i = 1,table.getn(GrowthEquipCfg) do
        GrowthEquipCfgEx[GrowthEquipCfg[i][1]] = GrowthEquipCfg[i]
    end
    local oldExp =
    {
        {pos=0,val=8,},
        {pos=49,val=117,},
    }
    
    for i=1,table.getn(oldExp) do
        local key = oldExp[i].pos
        local value = oldExp[i].val
        local pWeapon = Item.getEquipByPos(sysarg, key); --佩戴的武器升级的
        if pWeapon ~= nil and get_d_val(sysarg, value) > 0 then
            local nItemId = Item.getItemProperty(sysarg,pWeapon,Item.ipItemID)
            if GrowthEquipCfgEx[nItemId] ~= nil then
                local curExp = get_d_val(sysarg, value) + Item.getItemProperty(sysarg,pWeapon,Item.ipItemForgeProperty1Value)
                Item.setItemProperty(sysarg,pWeapon,Item.ipItemForgeProperty1Value,curExp)
                set_d_val(sysarg, value, 0);
            end
        end
    end

    ------------------------------------------------------------------------------------------------------------------------------------------------
    --副本管理员材料
    HandleLoginFubenManagerEx(sysarg)
	
	--元宝嘉年华时间内，上线之后在场景内
	local cfg = StdActivityCfg.YuanBaoJiaNianHuaNew
	if Actor.getSceneId(sysarg)==cfg.sceneId then   
		EnterYuanBaoJiaNianHuaScene(sysarg)
	end

    --清除vip标记
     
    if var.clearvipflag == nil then
        if Actor.getVipFlags(sysarg) > 0 then
            var.clearvipflag = 1
            Actor.setVipFlags(sysarg,0)
        else
            var.clearvipflag = 1
        end
    end
    LeaseTitleReturn(sysarg)
    ExpRefiningReturn(sysarg)
    if System.isCrossServer() then
    	-- 不能放在 EventCallDispatcher.defaultHandlerPlayerEnterSceneBack 中, 因为这时玩家数据还没有初始化完成, 所以改为放这里
    	RefreshCrossBossInfoUIToActor(sysarg)
    	Actor.addTimer(sysarg,49,30 * 1000)
    end

    --3v3竞技领取奖励
   -- OnRankGiveAward(sysarg)

    --3v3竞技开启状态
     local sysVar = System.getDyanmicVar()
    local nState = 0
    if  sysVar.rankmateactivity == 1 then nState = 1 end
    if System.isCrossServer() == false then 
        SendCrossActivityFlag(sysarg)

    end


    --下发玩家数据
	send_actor_data_on_login(sysarg)

    --qq空间
  
    if  System.getSpid() == 99 and isCrossDay == 1 then
        local var = Actor.getStaticVar(sysarg)
        if var.platformaward == nil then var.platformaward = {} end

        if var.platformaward[2] == nil then
            var.platformaward[2]  = {}
            var.platformaward[2].loginday = 0
            var.platformaward[2].loginmonth = 0
            var.platformaward[2].day = 0
            var.platformaward[2].award = {}
        end 
        var.platformaward[2].award = {}
    end
    --平台礼包
    --MiscExSetPlatformId(sysarg,nil,nil,isCrossDay)
	
	--没有结义，却带了戒指的，要回收回来
	local myBrotherId = Actor.getSocialRelationId(sysarg,7)
	if myBrotherId==0 then 
		local equipItem_ptr = Item.getEquipByPos(sysarg, itBrotherRingPos)
		if equipItem_ptr~=nil then 
			Item.removeEquip(sysarg,equipItem_ptr,"解除结义",GameLog.cLeaveBrother)
		end
	end
	
    --夺宝奇兵bug，在夺宝奇兵活动里，进入跨服活动- 会保留箱子，来到跨服后把这个道具删掉
    if System.isCrossServer() == true then
        local nItemID = 304
        local nCount = Actor.getItemCount(sysarg,nItemID)
        if nCount > 0 then
            --只在活动期间删除该道具
            local h,m,s = System.getTime()
            if h == 21 and m >=5 and m <= 20 then
                 System.trace("夺宝奇兵活动!"..Actor.getName(sysarg))
                 Actor.removeItem(sysarg,nItemID,nCount, -1, -1, -1,"夺宝骑兵",1)
            end
           
            
        end

    end
    --发送快捷方式状态
    SendAiqyDoorState(sysarg)
--    if System.getSpid() == 18 then
--         local sysVar = System.getDyanmicVar()
--         if sysVar.AiqyState== nil then 
--            sysVar.AiqyState = {}
--            sysVar.AiqyState.state = 0
--            sysVar.AiqyState.url = ""
--            sysVar.AiqyState.iconid = 0
--        end
--        local pack = DataPack.allocPacket(player,151,54)
--        DataPack.writeByte(pack,sysVar.AiqyState.state)
--        DataPack.writeString(pack,sysVar.AiqyState.url)
--        DataPack.writeInt(pack,sysVar.AiqyState.iconid)
--        DataPack.flush(pack)

--    end

	
	--计算总的离线时间
	if logoutTime~=0 then 
		local diffTime = System.getCurrMiniTime() -  logoutTime
		if var.allOffLineTime ==nil then 	
			var.allOffLineTime=diffTime
		else
			if var.allOffLineTime<0 then 
				var.allOffLineTime=0
			end
			var.allOffLineTime= var.allOffLineTime+diffTime
		end
	end

    --老兵回归
    OldPlayerReturnLogin(sysarg)
	
	--local opentime = System.getServerOpenTime()
	--local y,m,d,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(opentime)	
	--local y,m,d = System.getDate( 0, 0, 0 )
	--if m==3 and d==13 and y==2018 then  --写相对于更新当天
	--	local var = Actor.getStaticVar(sysarg)
	--	if var.oldplayret == nil then InitOldPlayerReturnInfo(sysarg,true) end 
	--	var.oldplayret.login.day = 1
	--end
	
	
	--腾讯服默认是微端登录
	if System.getSpid() == 99 then
      	OnFinish_Liveness(sysarg,3)--触发活跃度
		local dVar = Actor.getDyanmicVar(sysarg)
		dVar.WDLogin = 1
		Quest_ShuaXin(sysarg)
    end
	
	AskLucklyZP_getAward(sysarg)
	
	--第一次活动弹窗
	local svar = System.getStaticVar()
	
	if (svar.StartOneYear_OpenDay==nil or svar.isDringOneYearAct ==nil or svar.isDringOneYearAct<1 or svar.isDringOneYearAct>svar.StartOneYear_OpenDay)==false then 
		ClearOneYear_Data(sysarg)
		local var = Actor.getStaticVar(sysarg)
		if var.OneYearAct_Data.openW==nil then 
			var.OneYearAct_Data.openW=1
			local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOneYearAct_Acts)
			DataPack.writeByte(netPack,0)
			 DataPack.flush(netPack)
		end
		
	end
    IdentifyCodePlayerLogin(sysarg)

    LogCrossMoneyLogId(sysarg,1)
end

function LogCrossMoneyLogId(sysarg,tag)
    if System.isCrossServer() then
        tag = tonumber(tag)
        local nYBItemCount = Actor.getItemCount(sysarg,815)
        local nYBCount = Actor.getMoneyCount(sysarg,mtYuanbao)
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)  
        local str = "进"
        if tag == 0 then str = "出" end
        str = str .."yb:"..nYBCount.."item:"..nYBItemCount
        System.sendCommonLog(LogIds.crossyblog,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),nYBCount,nYBItemCount,0,str)
       
    end
end

--转换旧的增值卡数据
function TransformZengZhiKaData(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local ZengZhiKa = var.ZengZhiKa
	if ZengZhiKa == nil then return end
	
	local newZengZhiKa = var.newZengZhiKa
	local oldVal = 0
	local newVal = 0
	for i = 1, 250 do
		oldVal = ZengZhiKa[i]
    	if oldVal ~= nil and oldVal > 0 then
    		if newZengZhiKa == nil then
    			var.newZengZhiKa = {}
    			newZengZhiKa = var.newZengZhiKa
    		end
    		
    		newVal = System.setInt64UShort(0, 0, oldVal)
    		newZengZhiKa[i] = newVal
    	end
	end
	
	var.ZengZhiKa = nil -- 清空旧数据
end

function SendCrossActivityFlag(sysarg)
    local brank = 0
    local sysVar = System.getDyanmicVar()
    local byabiao = 0
    local bSingle = 0
    if sysVar.rankmateactivity == 1 then brank = 1 end
    if sysVar.crossyabiaoactivity == 1 then byabiao = 1 end
    if sysVar.singlerankactivity == 1 then bSingle =1 end
    local pack = DataPack.allocPacket(sysarg,46,17)
    DataPack.writeByte(pack,brank)
    DataPack.writeByte(pack,byabiao)
    DataPack.writeByte(pack,bSingle)
    DataPack.flush(pack)
end


function GlobalHandleGiveRankPoint(sysarg,bType,bWin,nAddYuanguPoint,nAddRankPoint,nRankPoint,nAddFirstKillYuanGu,nAddFirstCollectYuanGu,nMvpYuangu)
    local var = Actor.getStaticVar(sysarg)
    var.rankType = tonumber(bType)
    var.rankwin = tonumber(bWin)
    var.rankaddyuangu = tonumber(nAddYuanguPoint)
    var.rankaddpoint = tonumber(nAddRankPoint)
    var.materankpoint = tonumber(nRankPoint)
    var.firstrankkill = tonumber(nAddFirstKillYuanGu)
    var.firstrankcollect = tonumber(nAddFirstCollectYuanGu)
    var.rankmvppoint = tonumber(nMvpYuangu)
    
    OnRankGiveAward(sysarg)
end
function OnRankGiveAward(sysarg)
    local var = Actor.getStaticVar(sysarg)
    if var.rankType == nil then return end
   
    if var.rankwin ~= nil    then
        if var.rankType == 0 then --3v3竞技
            if var.rankaddyuangu  == nil then var.rankaddyuangu = 0 end
            if var.rankaddpoint == nil then var.rankaddpoint = 0 end
            if var.materankpoint == nil then var.materankpoint = 0 end
            if var.firstrankkill  == nil then var.firstrankkill = 0 end
            if var.firstrankcollect  == nil then var.firstrankcollect = 0 end
            if var.rankmvppoint == nil then var.rankmvppoint = 0 end
            if var.rankwin == nil then var.rankwin = 0 end
            if var.rankjjcount == nil then
                local szLog = "OnRankGiveAward error!actorid:%d yuan:%d jing:%d jingzong:%d"
                System.trace(string.format(szLog,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),var.rankaddyuangu,var.rankaddpoint,Actor.getIntProperty(sysarg,PROP_ACTOR_RANKPOINT_VALUE)))
                return
            end
            local nyuangu = Actor.getIntProperty(sysarg,PROP_ACTOR_YUANGU_VALUE) + var.rankaddyuangu
            Actor.setIntProperty(sysarg,PROP_ACTOR_YUANGU_VALUE,nyuangu)
            nyuangu = Actor.getIntProperty(sysarg,PROP_ACTOR_YUANGU_VALUE)
            local nrankpoint = Actor.getIntProperty(sysarg,PROP_ACTOR_RANKPOINT_VALUE) + var.rankaddpoint
            Actor.setIntProperty(sysarg,PROP_ACTOR_RANKPOINT_VALUE,nrankpoint)
            local materrankpoint =  var.materankpoint
            local str  = "";
            local title= "3V3竞技场战报"
            if var.rankwin == 0 then
                 str = "亲爱的玩家：\\\\此次比赛您和您的队友实力不济，失败乃是成功之母，请再接再厉。\\\\本次竞技获胜如下：\\\\1.个人竞技积分%d(当前积分:%d)\\\\2.共获得远古积分%d(当前远古积分:%d)\\\\包括:首杀获得%d远古积分\\\\首采获得%d远古积分\\\\全场MVP获得%d远古积分"
            else
                 str = "亲爱的玩家：\\\\此次比赛您和您的队友实力超群，轻松取得胜利，继续保持！\\\\本次竞技获胜如下：\\\\1.个人竞技积分+%d(当前积分:%d)\\\\2.共获得远古积分+%d(当前远古积分:%d)\\\\包括:首杀获得%d远古积分\\\\首采获得%d远古积分\\\\全场MVP获得%d远古积分"
            end
            str = string.format(str,var.rankaddpoint,nrankpoint,var.rankaddyuangu,nyuangu,var.firstrankkill,var.firstrankcollect,var.rankmvppoint)

            local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
            System.AddMail(nActorId,0,0,title,str)
           local szStr = "输"
           if var.rankwin == 1 then szStr = "赢" end
            System.sendCommonLog(LogIds.CrossRankRelust,nActorId,Actor.getName(sysarg),0,0,0,nil,nil,szStr.." 远:"..var.rankaddyuangu.." 竞:"..var.rankaddpoint.." 竞总:"..nrankpoint)


            --统计排位信息
            if var.rankinfo == nil then var.rankinfo = {} end
            if var.rankinfo.win == nil then var.rankinfo.win = 0 end        --成功场次
            if var.rankinfo.failed == nil then var.rankinfo.failed = 0 end --失败场次

            if var.rankwin == 0 then
                var.rankinfo.failed = var.rankinfo.failed + 1
            else
                var.rankinfo.win = var.rankinfo.win + 1
            end
            var.rankwin = nil
            var.rankaddyuangu = nil
            var.rankaddpoint = nil
            var.materankpoint = nil
            var.rankType = nil
       
            var.rankjjcount = var.rankjjcount - 1
            if var.rankjjcount < 0 then var.rankjjcount = 0 end
            send_actor_data_on_login(sysarg)
        
		--大吉大利活动参加3v3
		--if (svar.isDringDaJiDaLi ==nil or svar.isDringDaJiDaLi<2 or svar.isDringDaJiDaLi>3)==false then 
			--ClearDaJiDaLi_Data(sysarg)
			if var.days.enter3V3Count==nil then 
				var.days.enter3V3Count = 1
			else 
				var.days.enter3V3Count = var.days.enter3V3Count +1
			end

        elseif var.rankType == 1 then --个人竞技
            local nThor = 0
            if var.rankwin == 1 then
                nThor = 15 --赢的仙力
            else  
                nThor = 5 --输的仙力
            end

            if var.singleinfo == nil then 
                var.singleinfo = {} 
                var.singleinfo.win = 0 --胜利次数
           
                var.singleinfo.count = 0 --参与场次
            end
            var.singleinfo.count = var.singleinfo.count + 1
            if var.singleinfoday == nil then var.singleinfoday  = 0 end
            var.singleinfoday = var.singleinfoday + 1
            Actor.setThorEquipValue(sysarg,Actor.getThorEquipValue(sysarg) + nThor)
            
            if var.singlerankpoint == nil then var.singlerankpoint = 1000 end
            var.singlerankpoint = var.singlerankpoint + var.rankaddpoint
            if var.singlemonthcount == nil then var.singlemonthcount = 0 end
            var.singlemonthcount = var.singlemonthcount + 1
            local title= "个人竞技场战报"
            if var.rankwin == 0 then
                 str = "亲爱的玩家：\\\\此次比赛您实力不济，失败乃是成功之母，请再接再厉。\\\\本次竞技获胜如下：\\\\1.个人竞技积分%d(当前积分:%d)\\\\2.仙力+%d(当前仙力:%d)"
            else
                 str = "亲爱的玩家：\\\\此次比赛您实力超群，轻松取得胜利，继续保持！\\\\本次竞技获胜如下：\\\\1.个人竞技积分+%d(当前积分:%d)\\\\2.仙力+%d(当前仙力:%d)"
            end
            str = string.format(str,var.rankaddpoint,var.singlerankpoint,nThor,Actor.getThorEquipValue(sysarg))

            local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
            System.AddMail(nActorId,0,0,title,str)
            local szStr = "输"
           if var.rankwin == 1 then 
                szStr = "赢" 
                var.singleinfo.win = var.singleinfo.win + 1
           end
            System.sendCommonLog(LogIds.SingRank,nActorId,Actor.getName(sysarg),0,0,0,nil,nil,szStr.." 竞:"..var.rankaddpoint.." 竞总:"..var.singlerankpoint.."仙:"..nThor.."仙总:"..Actor.getThorEquipValue(sysarg))
            System.sendCommonLog(LogIds.ThorEquipValueChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getThorEquipValue(sysarg) -nThor , Actor.getThorEquipValue(sysarg), "","","个人竞技","","")
             var.rankwin = nil
            var.rankaddyuangu = nil
            var.rankaddpoint = nil
            var.materankpoint = nil
            var.rankType = nil
            send_actor_data_on_login(sysarg)
        end
  
		--end
    end
end
--经验炼制返还
function ExpRefiningReturn(sysarg)
--经验炼制屏蔽 2017.1.0.17
--    local retTable =ExpRefiningConfig.ReturnDay
--    local nOpenDay = System.getDaysSinceOpenServer()
--    local var = Actor.getStaticVar(sysarg)
--    if var.retexpyb == nil then return end
--    for i=1,#retTable do
--        if nOpenDay >= retTable[i] then
--            if var.retexpyb[i] ~= nil and var.retexpyb[i] ~= -1 and var.retexpyb[i] ~= 0 then

--                local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
--                local szTitle = "第"..i.."天经验炼制返还元宝"
--                local str ="尊敬的玩家您好\\您开服第"..i.."天验炼制消耗"..var.retexpyb[i].."元宝。现全部返还！请查收！\\祝游戏愉快！"
--                System.AddMail(actor_id,7,0,szTitle,str,1,0,"3,"..var.retexpyb[i])
--                var.retexpyb[i] = -1 ---1标识为已返还

--            end
--        end
--    end

end 
----元宝租赁返还
function LeaseTitleReturn(sysarg)
    	
    local nOpenDay = System.getDaysSinceOpenServer()
    if nOpenDay > 7 then
          local var = Actor.getStaticVar(sysarg)
            if var.leasetitleid ~= nil and var.leasetitleid > 0 then
                local cfg =OpenServerAward[10].list[var.leasetitleid]
                --返还元宝
                local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
                System.AddMail(actor_id,7,0,"称号租赁返还","称号租赁返还",1,0,"3,"..cfg.price)
                --撤销称号
                Actor.setTopTitle(sysarg,cfg.conditions.params[1],false) 
                var.leasetitleid = nil
            end
    end
end
--//退出游戏触发
function OnPlayerLogout(sysarg)
   
	ht_OnPlayerLogout(sysarg)
	Pet.delAllPet(sysarg)

	OnLuaEvent(LuaEventId.PlayerLogout, sysarg)

    --夺宝奇兵活动，有持宝人宝箱的情况下直接爆出
    
    local dVar = System.getDyanmicVar()
	if dVar.duobaoqibingTime ~= nil then
        local nCount = 0
        nCount = Actor.getItemCount(sysarg,304)
        if nCount  > 0 then
            Actor.removeItem(sysarg,304,nCount)
            --重新在场景内爆出
            local pItem = Item.createItem(304,1)
            Item.createDropItem(sysarg,pItem,LogIds.chibaoren,"chibaoren",nil)
        end
    end

    --游戏推广员，实时更新vip与等级信息
    local actorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    local cfg = GetExtendInfo(actorid)
    cfg.vip = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)
    cfg.level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)


    local var = Actor.getStaticVar(sysarg)
    local sVar = System.getDyanmicVar()
    if sVar.ardourcamping == 1 then
        var.ardourlevel = Actor.getIntProperty(sysarg,PROP_ACTOR_ARDOUR_ATTACK_RATE)
    end

	--删除屠魔印记buff
	Actor.delBuff(sysarg,KillBossAddBuff.buffType,KillBossAddBuff.buffGroup)
    --删除幻形buff
    local nMagicShapeId = Actor.getMagicShapeId(sysarg)
    if nMagicShapeId > 0 then
        for i = 1,#MagicShapeItem do
            if MagicShapeItem[i].shapeid == nMagicShapeId then
                for j= 1,#MagicShapeItem[i].addbuffid do
                    Actor.delBuffById(sysarg,MagicShapeItem[i].addbuffid[j])
                end
                break
            end
        end
    end
    IdentifyCodePlayerLogout(sysarg)
    LogCrossMoneyLogId(sysarg,0)
end


--//升级触发
function OnPlayerLevelUp(sysarg, oldLevel)
	local var = Actor.getStaticVar(sysarg);
	local d = var.d;
	if not d then var.d = {}; d = var.d; end

	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	local pCir = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)

    --功能礼包箭头索引
--    if pLv == 72 then
--        local pack = DataPack.allocPacket(sysarg,26,84)
--        DataPack.flush(pack)
--    end

	if pLv >=55 and var.give55LvGift==nil then 

		local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		System.AddMail(myID,6,0,"恭喜升至55级","亲爱的玩家,\\\\恭喜您升至55级，您的传奇之旅开启啦！\\\\<(c0xFFff0000)宝石><(c0xFF00b050)主要功能>介绍：\\\\1.<(c0xFF00b050)攻击伤害>：<(c0xFFff0000)大幅度提高基础伤害>.\\\\2.<(c0xFF00b050)战力飙升>：瞬间提高战斗力<(c0xFFff0000)碾压其他玩家>.\\\\祝游戏愉快！",0,0,"609,1,1")	
		var.give55LvGift = 1
	end
	
	

	if pLv >=73 and var.give73LvGift==nil then 
		local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		System.AddMail(myID,6,0,"恭喜升至73级","亲爱的玩家,\\\\恭喜您升至73级，您的传奇之旅开启啦！\\\\<(c0xFFff0000)圣珠><(c0xFF00b050)主要功能>介绍：\\\\1.<(c0xFF00b050)暴击几率>：<(c0xFFff0000)有几率触发暴击伤害>.\\\\2.<(c0xFF00b050)暴击伤害>：在攻击目标时触发<(c0xFFff0000)额外暴击伤害>.\\\\祝游戏愉快！",0,0,"613,1,1")	
		var.give73LvGift = 1
	end
		
		
	--行会推荐
      
    if pLv >= 72 and  Actor.getGuildId(sysarg) == 0 and var.warring70 == nil then
        Actor.sendRecommendGuild(sysarg)
        var.warring70 = 1
    end
	--//发送激活佣兵消息
	if pLv >=40 and var.give40LvGift==nil then 
		-- local awardIdAndCount=0
		local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		-- awardIdAndCount=System.setInt2Byte(awardIdAndCount,true,1)
		-- awardIdAndCount=System.setInt2Byte(awardIdAndCount,false,605)
		System.AddMail(myID,0,0,"恭喜升至40级","亲爱的玩家,\\\\恭喜您升至40级，您的传奇之旅开启啦！\\\\游戏<(c0xFF00b050)主要功能>介绍：\\\\1.<(c0xFF00b050)战将>：<(c0xFFff0000)吸引BOSS火力>的最佳选择.\\\\2.<(c0xFF00b050)翅膀>：不仅拥有<(c0xFFff0000)炫丽的外观>，<(c0xFFff0000)升阶>属性为角色<(c0xFFff0000)提升实力>.\\\\3.<(c0xFF00b050)锻造>：强化<(c0xFFff0000)套装属性>增加其他属性.\\\\祝游戏愉快！")	
		var.give40LvGift = 1
	end
	--学习召唤术
    local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
  
    if  pLv == 10 and job == 3 then
      
        Actor.learnSkill(sysarg,170,1)
    end
	if pLv >=68 and var.give68LvGift==nil then 
		-- local awardIdAndCount=0
		local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		-- awardIdAndCount=System.setInt2Byte(awardIdAndCount,true,1)
		-- awardIdAndCount=System.setInt2Byte(awardIdAndCount,false,617)
		System.AddMail(myID,0,0,"新征程即将开启","亲爱的玩家，\\\\<(c0xFFff0000)特戒功能>已经开启，新的旅程即将开启。激活可拥有<(c0xFFff0000)独特属性>和<(c0xFFff0000)外观>。\\\\您也可以通过以下<(c0xFF00b050)方式变强>：\\\\1.升至70级后可加入<(c0xFF00b050)行会>，开启无兄弟不传奇的旅程\\\\2.<(c0xFF00b050)炼狱>、<(c0xFF00b050)经验炼制>可快速升级\\\\3.<(c0xFF00b050)探索宝藏>、<(c0xFF00b050)BOSS之家>、<(c0xFF00b050)散人殿堂>等方式快速获得装备\\\\充点小钱玩玩，礼包多多哟！\\\\祝游戏愉快！")	
		var.give68LvGift = 1
	end
	
	if pLv >=70 and var.GuildTip==nil then 
		local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		System.AddMail(myID,0,0,"快来加入行会","亲爱的玩家，\\\\恭喜您升至70级，加入一个强大的<(c0xFF00b050)行会>将真正的开启无兄弟不传奇的追日旅程。\\\\加入行会您将获得以下<(c0xFF00b050)主要福利>：\\\\1.<(c0xFF00b050)互换装备>：使用贡献值可兑换行会仓库中的装备，装备打不到再也不用愁了！\\\\2.<(c0xFF00b050)行会加成>：加入行会即可获得攻击力加成\\\\3.<(c0xFF00b050)行会活动>：王城霸主、行会激战等众多行会专属活动等待着您的参加。\\\\并且<(c0xFF00b050)创建>或<(c0xFF00b050)加入>行会后，可拿到<(c0xFF00b050)行会礼包>，海量奖励领到手软。\\\\祝游戏愉快！")
		var.GuildTip = 1
	end 
	
	if pLv >=72 and var.give72LvGift==nil then 
		-- local awardIdAndCount=0
		local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		-- awardIdAndCount=System.setInt2Byte(awardIdAndCount,true,1)
		-- awardIdAndCount=System.setInt2Byte(awardIdAndCount,false,4735)
		System.AddMail(myID,0,0,"恭喜升至72级","亲爱的玩家，\\\\您也可以通过以下方式<(c0xFF00b050)变强>：\\\\1.升级<(c0xFF00b050)战将>协助您怒刷boss,爆神装；\\\\2.<(c0xFF00b050)炼狱>、<(c0xFF00b050)经验炼制>可快速升级；\\\\3.<(c0xFF00b050)探索宝藏>、<(c0xFF00b050)幸运转转箱>、<(c0xFF00b050)BOSS之家>、<(c0xFF00b050)散人殿堂>、<(c0xFF00b050)野外BOSS>等方式快速获得装备；\\\\充点小钱玩玩，礼包多多哟！\\\\祝游戏愉快！")	
		var.give72LvGift = 1
	end
	if pLv>=10 then
		Actor.setTopTitle(sysarg, 0, true)
	end

	--if pLv >= 65 and get_taskflags_val(sysarg) == 24 then
		--System.broadcastTipmsg(string.format("<(c0xFFd4ab6f)恭喜玩家><(n%s)><(c0xFFd4ab6f)出了><新手村><(c0xFFd4ab6f),获得幸运之神的祝福:生命值和魔法值永久提升100倍!!!>",Actor.getName(sysarg),NpcName,Item.getItemLinkMsg(itemid)),128+2);
		--set_taskflags_val(sysarg, 25);
		--Quest_ShuaXin(sysarg);
	--end
	--主线任务检查是否触发完成任务
	checkIsFinishTask(sysarg,2)
	--微端登录
--    if pLv >= 79 and var.viduan == nil then
--        local dyVar = Actor.getDyanmicVar(sysarg)
--        if dyVar.WDLogin == nil then
--           local netPack = DataPack.allocPacket(sysarg, 6, 14)
--           DataPack.flush(netPack)
--           var.viduan = 1
--        end 


--    end

	-- if pLv >= 72 and pLv <= 73 then
	-- 	if var.GodFurnace[5] == nil or var.GodFurnace[5] == 0 then
	-- 		var.GodFurnace[5] = 1
	-- 		SendGodFurnaceInfo(sysarg)
	-- 	end
	-- end
	-- if pLv >= 49 and d[81] == 0 then
	-- 	d[81] = 1;	--触发获得支线任务
	-- 	Actor.addEffect(sysarg,160,6,600,0);
	-- end
	-- if pLv >= 36 then
	-- 	Quest_ShuaXin(sysarg);
	-- end
	
	-- --XY 平台显示收藏有礼图标
	-- if pLv >= 30 and System.getSpid() == 1 then
	-- 	if var.CollectGame == nil then
	-- 		AllActivityButtonState(sysarg,93,1)
	-- 	end
	-- end
	
	--OnPlayerLevelUpFuGuiShou(sysarg, pLv, oldLevel)

	--等级大礼包提示 现在没有等级礼包
	-- local nLevelMark = {[50] = 7,[60] = 8,[70] = 9,[80] = 10,[1] = 11,[2] = 12,[3] = 13,}
	-- local Globalvar = System.getStaticVar()
	-- if not Globalvar.GlevelGiftBag then Globalvar.GlevelGiftBag = {} end
	-- local GloballevelGiftBag = Globalvar.GlevelGiftBag
	-- for i = 1,#LevelGrowthReward do
	-- 	local nRequre = LevelGrowthReward[i].Require
	-- 	local nGiftId = LevelGrowthReward[i].id
	-- 	local nMaxActorNum = LevelGrowthReward[i].MaxActorNum
	-- 	if GloballevelGiftBag[nGiftId] and GloballevelGiftBag[nGiftId] < nMaxActorNum or nMaxActorNum == -1 then
	-- 		if LevelGrowthReward[i].type == 0 and nRequre <= pLv and pCir == 0 then		
	-- 			if Actor.getActorFlag(sysarg,nLevelMark[nRequre]) < 1 then 
	-- 				--local nStr = string.format(Lang.ScriptTips.leveltips001,pLv,nRequre)
	-- 				--SendRecommendTips(sysarg,nStr)
	-- 				Actor.setActorFlag(sysarg,nLevelMark[nRequre])
	-- 				local npack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sLevelGrowAward)  --申请一个数据包
	-- 				DataPack.writeByte(npack,nGiftId)
	-- 				DataPack.writeByte(npack,pLv)
	-- 				DataPack.flush(npack);
	-- 				break
	-- 			end
	-- 		elseif LevelGrowthReward[i].type == 1 and nRequre == pCir then
	-- 			if GloballevelGiftBag[nGiftId] and GloballevelGiftBag[nGiftId] < nMaxActorNum then 		
	-- 				if Actor.getActorFlag(sysarg,nLevelMark[nRequre]) < 1 then 				
	-- 					local nStr = string.format(Lang.ScriptTips.leveltips002,pCir,nRequre)
	-- 					SendRecommendTips(sysarg,nStr)
	-- 					Actor.setActorFlag(sysarg,nLevelMark[nRequre])
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- end	

    --满内功值
    local nMaxNG = Actor.getIntProperty(sysarg,PROP_ACTOR_MAX_INNER)
    Actor.setIntProperty(sysarg,PROP_ACTOR_INNER,nMaxNG)
	
	
	--体验卡
	if var.TiyanCard~=nil and  var.TiyanCard == 1 then 
		if pLv>=82 then 
			var.TiyanCard = 2 --体验卡过期了
			
			local netPack = DataPack.allocPacket(sysarg,139,230)
			DataPack.writeByte(netPack,0)--过期了
			DataPack.flush(netPack)
			
			local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
			System.AddMail(actorID,0,0,"VIP回收体验结束","尊敬的玩家您好,\\\\由于您已经达到82级，vip随身回收体验已经结束。\\\\VIP2将永久拥有随身回收，更多VIP体验和豪礼赠送请查看\\\\VIP界面。\\\\祝您游戏愉快！")
		end
	end
	
	--天降红包的弹出
	local var = Actor.getStaticVar(sysarg)
	local TJHB_index = var.TJHB_index
	if TJHB_index ==nil then 
		TJHB_index = 0
	end
	if TJHB_index~=0 then
	
		if pLv >=TianJiangHongBaoCfg.startLevel1 and var.TJHBtanchuang ==nil then 
			var.TJHBtanchuang= 1
			local netPack = DataPack.allocPacket(sysarg, 139, 232)
			DataPack.writeByte(netPack,1)
			DataPack.flush(netPack)
		end
		
		if pLv >=TianJiangHongBaoCfg.startLevel2 and var.TJHBtanchuang ~=nil and var.TJHBtanchuang ==1 then 
			var.TJHBtanchuang= 2
			local netPack = DataPack.allocPacket(sysarg, 139, 232)
			DataPack.writeByte(netPack,1)
			DataPack.flush(netPack)
		end
		
		if pLv >=TianJiangHongBaoCfg.startLevel3 and var.TJHBtanchuang ~=nil and var.TJHBtanchuang ==2 then 
			var.TJHBtanchuang= 3
			local netPack = DataPack.allocPacket(sysarg, 139, 232)
			DataPack.writeByte(netPack,1)
			DataPack.flush(netPack)
		end
		
		if pLv >=TianJiangHongBaoCfg.startLevel4 and var.TJHBtanchuang ~=nil and var.TJHBtanchuang ==3 then 
			var.TJHBtanchuang= 4
			local netPack = DataPack.allocPacket(sysarg, 139, 232)
			DataPack.writeByte(netPack,1)
			DataPack.flush(netPack)
		end
	
		if pLv >=TianJiangHongBaoCfg.startLevel5 and var.TJHBtanchuang ~=nil and var.TJHBtanchuang ==4 then 
			var.TJHBtanchuang= 5
			local netPack = DataPack.allocPacket(sysarg, 139, 232)
			DataPack.writeByte(netPack,1)
			DataPack.flush(netPack)
		end
		
	else--天降红包b的弹出
		if var.TJHBtanchuang2==nil then var.TJHBtanchuang2={} end
		for i=1,#TianJiangHongBaoCfg2 do 
			if pLv >=TianJiangHongBaoCfg2[i].startLevel  and var.TJHBtanchuang2[i] ==nil then 
				var.TJHBtanchuang2[i] =1
				local netPack = DataPack.allocPacket(sysarg, 139, 232)
				DataPack.writeByte(netPack,1)
				DataPack.flush(netPack)
			end
		end
			
	end
	
	--卡等级的任务，当等级足够了，就主动去找npc
	local ta = task_all[get_taskflags_val(sysarg)]
	if ta~=nil then 
		if ta.lv~=0 and ta.lv <= pLv then
			if Actor.getSceneId(sysarg)==9 then 
				Actor.autoFindPathToNpc( sysarg,ta.mapid,ta.npcname)
			end 
		end
	end
	--搜狗平台称号
    --[[if System.getSpid() == 5 and pLv >= 65 and var.sgfristtitle == nil  then

        var.sgfristtitle = 1
        local headtitleVal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE)
        local title1 = System.getIntByte(headtitleVal, 0)
        local title2 = System.getIntByte(headtitleVal, 1)
        local bRe = false
      
        if title1 == 36 then title1 = 0 bRe = true end
        if title2 == 36 then title2 = 0 bRe = true end
      
        if bRe == true then
           headtitleVal = 0
           headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	       headtitleVal = System.setIntByte(headtitleVal, 1, title2)
           ht_set_actor_current_head_title(sysarg,headtitleVal)
           
        end
    end
    --7k7k
    if System.getSpid() == 14 and pLv >= 65 and var.sgfristtitle == nil  then
        var.sgfristtitle = 1
        local headtitleVal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE)
        local title1 = System.getIntByte(headtitleVal, 0)
        local title2 = System.getIntByte(headtitleVal, 1)
        local bRe = false
      
        if title1 == 47 then title1 = 0 bRe = true end
        if title2 == 47 then title2 = 0 bRe = true end
      
        if bRe == true then
           headtitleVal = 0
           headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	       headtitleVal = System.setIntByte(headtitleVal, 1, title2)
           ht_set_actor_current_head_title(sysarg,headtitleVal)
        end
    end
	
	
	--爱奇艺平台普通称号
    if System.getSpid() == 18 and pLv >= 65 and var.sgfristtitle == nil  then
        var.sgfristtitle = 1
        local headtitleVal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE)
        local title1 = System.getIntByte(headtitleVal, 0)
        local title2 = System.getIntByte(headtitleVal, 1)
        local bRe = false
      
        if title1 == 48 then title1 = 0 bRe = true end
        if title2 == 48 then title2 = 0 bRe = true end
      
        if bRe == true then
           headtitleVal = 0
           headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	       headtitleVal = System.setIntByte(headtitleVal, 1, title2)
           ht_set_actor_current_head_title(sysarg,headtitleVal)
        end
    end
	
	
	--趣酷平台
    if System.getSpid() == 16 and pLv >= 65  and  var.sgfristtitle == nil then
        var.sgfristtitle = 1
        local headtitleVal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE)
        local title1 = System.getIntByte(headtitleVal, 0)
        local title2 = System.getIntByte(headtitleVal, 1)
        local bRe = false
      
        if title1 == 50 then title1 = 0 bRe = true end
        if title2 == 50 then title2 = 0 bRe = true end
   
        if bRe == true then
           headtitleVal = 0
           headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	       headtitleVal = System.setIntByte(headtitleVal, 1, title2)
           ht_set_actor_current_head_title(sysarg,headtitleVal)
        end
    end
	
    	--747平台
    if System.getSpid() == 21 and pLv >= 65  and  var.sgfristtitle == nil then
        var.sgfristtitle = 1
        local headtitleVal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE)
        local title1 = System.getIntByte(headtitleVal, 0)
        local title2 = System.getIntByte(headtitleVal, 1)
        local bRe = false
      
        if title1 == 60 then title1 = 0 bRe = true end
        if title2 == 60 then title2 = 0 bRe = true end
   
        if bRe == true then
           headtitleVal = 0
           headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	       headtitleVal = System.setIntByte(headtitleVal, 1, title2)
           ht_set_actor_current_head_title(sysarg,headtitleVal)
        end
    end

    --9377平台
    if System.getSpid() == 24 and pLv >= 65  and  var.sgfristtitle == nil then
        var.sgfristtitle = 1
        local headtitleVal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE)
        local title1 = System.getIntByte(headtitleVal, 0)
        local title2 = System.getIntByte(headtitleVal, 1)
        local bRe = false
      
        if title1 == 61 then title1 = 0 bRe = true end
        if title2 == 61 then title2 = 0 bRe = true end
   
        if bRe == true then
           headtitleVal = 0
           headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	       headtitleVal = System.setIntByte(headtitleVal, 1, title2)
           ht_set_actor_current_head_title(sysarg,headtitleVal)
        end
    end

	--酷爱玩平台
    if System.getSpid() == 29 and pLv >= 65  and  var.sgfristtitle == nil then
        var.sgfristtitle = 1
        local headtitleVal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE)
        local title1 = System.getIntByte(headtitleVal, 0)
        local title2 = System.getIntByte(headtitleVal, 1)
        local bRe = false
      
        if title1 == 74 then title1 = 0 bRe = true end
        if title2 == 74 then title2 = 0 bRe = true end
   
        if bRe == true then
           headtitleVal = 0
           headtitleVal = System.setIntByte(headtitleVal, 0, title1)
	       headtitleVal = System.setIntByte(headtitleVal, 1, title2)
           ht_set_actor_current_head_title(sysarg,headtitleVal)
        end
    end]]--
	Quest_ShuaXin(sysarg)
	
end



--使用技能攻击对方- 
--返回值为 返回值伤害
--参数说明
--attackPtr 攻击者指针
--defensePtr 防御者指针
--damage  伤害值
--skillId 技能id
--skillId 为0的话是普攻。local monId = Actor.getIntProperty(defensePtr,PROP_ENTITY_ID);
function OnSkillAttackEntity(attackPtr,defensePtr,damage,skillId)

	if Actor.getEntityType(attackPtr) == 0 then	--判断攻击者是玩家
        --怒刷白猪
        local cfg = StdActivityCfg.QuanFuShuangBei.refresh
        
        if Actor.getSceneId(attackPtr) == cfg.sceneid and Actor.getEntityType(defensePtr) == 1 then
           local dVar = System.getDyanmicVar()
           if dVar.QFDoubleExpTime ~= nil and dVar.baizhuHandle ~= nil then
                local handle = Actor.getHandle(defensePtr)
                for i = 1,table.getn(cfg.point) do
                    if handle == dVar.baizhuHandle[i].handle then
                        local nAddExp = math.floor(damage * cfg.exprate)
                        if nAddExp > 0 then
                            Actor.addExp(attackPtr,nAddExp,0,0)
                            --Actor.sendTipmsg(attackPtr,"获得经验:"..nAddExp,ttFlyTip)
                            Actor.BroadcastLifeFuck(attackPtr,nAddExp)
                        end
                        break
                    end
                end
           end
        end

        --合服王城boss血量公告
       
        local sVar = System.getDyanmicVar()
        if sVar.CombineKingCityBossing ~= nil then
             local cfg = HeFuConfig.WangChengBoss          
             if Actor.getSceneId(attackPtr) == cfg.sceneId then            
                if sVar.combinekingboss.handle == Actor.getHandle(defensePtr) then
                    local nMaxHp = Actor.getIntProperty(defensePtr,PROP_CREATURE_MAXHP) 
                    local nCurrHp = Actor.getIntProperty(defensePtr,PROP_CREATURE_HP) - damage
                    local rate = nCurrHp / nMaxHp * 100 
                    for j =1,table.getn(cfg.hpNocite) do
                       
                        if rate <= cfg.hpNocite[j] and sVar.combinekingboss.hp[j] == 0 then
                            local ex = "我也要参加<(x"..Fuben.getSceneNameById(cfg.sceneId)..":"..cfg.x..":"..cfg.y..":[传])>"
                            local str = "王城BOSS还剩<(c0xFFFF0000)"..cfg.hpNocite[j].."%>,击杀必掉<(c0xFF2FD04F)7转装备>，请火速前往击杀！"..ex
                            sVar.combinekingboss.hp[j] = 1
                            
                            System.broadcastTipmsg(str,ttScreenCenter+ ttChatWindow)
                        end
                    end
                end 
             
             end   
        end
		
		
		
		--庆典活动王城boss血量公告
        local sVar = System.getDyanmicVar()
        if sVar.QingDianActivityBossing ~= nil then
             local cfg = QingDianActivityCfg.QingDianActivityWangChengBoss     
             if Actor.getSceneId(attackPtr) == cfg.sceneId then            
                if sVar.QingDianActivityboss.handle == Actor.getHandle(defensePtr) then
                    local nMaxHp = Actor.getIntProperty(defensePtr,PROP_CREATURE_MAXHP) 
                    local nCurrHp = Actor.getIntProperty(defensePtr,PROP_CREATURE_HP) - damage
                    local rate = nCurrHp / nMaxHp * 100 
                    for j =1,table.getn(cfg.hpNocite) do
                       
                        if rate <= cfg.hpNocite[j] and sVar.QingDianActivityboss.hp[j] == 0 then
                            local ex = "我也要参加<(x"..Fuben.getSceneNameById(cfg.sceneId)..":"..cfg.x..":"..cfg.y..":[传])>"
                            local str = "庆典boss黑罗刹还剩<(c0xFFFF0000)"..cfg.hpNocite[j].."%>,击杀必掉<(c0xFF2FD04F)7转装备>，请火速前往击杀！"..ex
                            sVar.QingDianActivityboss.hp[j] = 1
                            
                            System.broadcastTipmsg(str,ttScreenCenter+ ttChatWindow)
                        end
                    end
                end 
             
             end   
        end
		
		
		--国庆活动王城boss血量公告
		local sVar = System.getDyanmicVar()
        if sVar.NalDayActivityBossing ~= nil then
             local cfg = NationalDayActivityCfg.NalDayActivityWangChengBoss
             if Actor.getSceneId(attackPtr) == cfg.sceneId then            
                if sVar.NalDayActivityboss.handle == Actor.getHandle(defensePtr) then
                    local nMaxHp = Actor.getIntProperty(defensePtr,PROP_CREATURE_MAXHP) 
                    local nCurrHp = Actor.getIntProperty(defensePtr,PROP_CREATURE_HP) - damage
                    local rate = nCurrHp / nMaxHp * 100 
                    for j =1,table.getn(cfg.hpNocite) do
                       
                        if rate <= cfg.hpNocite[j] and sVar.NalDayActivityboss.hp[j] == 0 then
                            local ex = "我也要参加<(x"..Fuben.getSceneNameById(cfg.sceneId)..":"..cfg.x..":"..cfg.y..":[传])>"
                            local str = "国庆boss还剩<(c0xFFFF0000)"..cfg.hpNocite[j].."%>,击杀必掉<(c0xFF2FD04F)7转装备>，请火速前往击杀！"..ex
                            sVar.NalDayActivityboss.hp[j] = 1
                            
                            System.broadcastTipmsg(str,ttScreenCenter+ ttChatWindow)
                        end
                    end
                end 
             
             end   
        end
		
		--首充积分武器相关
		--积分武器效果配置
		local EffectIntegralWeapons = {

			{id = 3624, type = 1, data = {5, 1000}, },--神龙·裁决审判Lv1
			{id = 3625, type = 1, data = {6, 2000}, },--神龙·裁决审判Lv2
			{id = 3626, type = 1, data = {7, 3000}, },--神龙·裁决审判Lv3
			{id = 3627, type = 1, data = {8, 4000}, },--神龙·裁决审判Lv4
			{id = 3628, type = 1, data = {10, 5000}, },--神龙·裁决审判LvMax
			{id = 3629, type = 1, data = {11, 6000}, },--神龙·圣界怒斩Lv1
			{id = 3630, type = 1, data = {12, 7000}, },--神龙·圣界怒斩Lv2
			{id = 3631, type = 1, data = {13, 8000}, },--神龙·圣界怒斩Lv3
			{id = 3632, type = 1, data = {14, 9000}, },--神龙·圣界怒斩Lv4
			{id = 3633, type = 1, data = {15, 10000}, },--神龙·圣界怒斩LvMax

			{id = 3634,  type = 2, data = {10, 50, 1}, },--伏魔·龙骨权杖Lv1
			{id = 3635,  type = 2, data = {11, 60, 1}, },--伏魔·龙骨权杖Lv2
			{id = 3636,  type = 2, data = {12, 70, 1}, },--伏魔·龙骨权杖Lv3
			{id = 3637,  type = 2, data = {13, 80, 1}, },--伏魔·龙骨权杖Lv4
			{id = 3638,  type = 2, data = {15, 90, 1}, },--伏魔·龙骨权杖LvMax
			{id = 3639,  type = 2, data = {20, 100, 2}, },--伏魔·圣界龙牙Lv1
			{id = 3640,  type = 2, data = {30, 125, 2}, },--伏魔·圣界龙牙Lv2
			{id = 3641,  type = 2, data = {40, 150, 2}, },--伏魔·圣界龙牙Lv3
			{id = 3642,  type = 2, data = {45, 175, 2}, },--伏魔·圣界龙牙Lv4
			{id = 3643,  type = 2, data = {50, 200, 2}, },--伏魔·圣界龙牙LvMax

			};
		local itemPtr = Item.getEquipByPos(attackPtr, 49);
		if itemPtr then
			local ItemID = Item.getItemId(itemPtr);
			for i = 1,#EffectIntegralWeapons do
				if EffectIntegralWeapons[i].id == ItemID then

					if EffectIntegralWeapons[i].type == 1 and skillId ~= 157 then
						local Probability = EffectIntegralWeapons[i].data[1];
						local Restore = EffectIntegralWeapons[i].data[2];
						local nTemp = math.random(1,100);
						if nTemp <= Probability then
							local maxhp = Actor.getIntProperty(attackPtr,PROP_CREATURE_MAXHP);
							local hp = Actor.getIntProperty(attackPtr,PROP_CREATURE_HP);
							local addhp = (hp + Restore);
							if addhp > maxhp then
								Actor.setIntProperty(attackPtr, PROP_CREATURE_HP, maxhp);
							else
								Actor.setIntProperty(attackPtr, PROP_CREATURE_HP, addhp);
							end
							Actor.addEffect(attackPtr, 1012, 6, 1000, 0);
							Actor.sendTipmsg(attackPtr, string.format("<(c0xFF00FF00)裁决:> <(c0xFFFFFF00)恢复%s点生命值>", Restore), 1);
						end
					end

					local SceneId = Actor.getSceneId(attackPtr);
					if EffectIntegralWeapons[i].type == 2 and skillId == 9 and SceneId == 341 and Actor.getEntityType(defensePtr) == 1 then

						local Probability = EffectIntegralWeapons[i].data[1];
						local Restore = EffectIntegralWeapons[i].data[2];
						local MonNum = EffectIntegralWeapons[i].data[3];
						local nTemp = math.random(1,100);
						if nTemp <= Probability then
							local monId = Actor.getIntProperty(defensePtr,PROP_ENTITY_ID);
							local NowMonBB = Pet.getPetCountById(attackPtr, monId);
							--local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL);
							if NowMonBB < MonNum then
                                damage = Actor.getIntProperty(defensePtr,PROP_CREATURE_MAXHP)
								Pet.addPet(attackPtr,monId,1,228);
								System.broadcastTipmsg(string.format("<(n%s)>在<青青草原>召唤到了1只<%s>.", Actor.getName(attackPtr), System.getMonsterNameById(monId) ), 128);
								Actor.sendTipmsg(attackPtr, string.format("<(c0xFF00FF00)伏魔:> <(c0xFFFFFF00)召唤%s成功>", System.getMonsterNameById(monId)), 1);
							else
								Actor.sendTipmsg(attackPtr, string.format("您当前佩戴的成长武器最多可召唤<%s>只<%s>.", MonNum, System.getMonsterNameById(monId)), 256);
							end
						end
					end



					return damage;
				end
			end
		end
		---------------------------------------------------



	end








    return damage

end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
function gotoXYFM(sysarg)
	--System.telportScene(sysarg,2,117,128)
	--Actor.autoFindPathToNpc( sysarg, 2, "望月殿堂");
	--local NpcStr = Fuben.getNpcPtrById(2,287);
	--Actor.npcTalk(sysarg,NpcStr,"main")
end

--function gotoEML(sysarg)
--	--System.telportScene(sysarg,5,137,178)
--	Actor.autoFindPathToNpc( sysarg, 5, "恶魔岭接引人");
--end

--//死亡触发(死者,杀手)
function OnPlayerDie(sysarg, killer)
	local killerType = Actor.getEntityType(killer)
	local fubenId = Actor.getFubenId(sysarg)
	local nSceneId = Actor.getSceneId(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	-- 暂存一下被击杀数据, handleSendActorByKilledMail() 用到
	local myDVar = Actor.getDyanmicVar(sysarg)
	myDVar.maildata = {}
	myDVar.maildata.killerType = killerType
	myDVar.maildata.killerName = Actor.getName(killer)
	myDVar.maildata.sceneName = Actor.getSceneName(sysarg)
	--------------	
	
	if nSceneId == 58 then -- 武林争霸中
		if var.days.WuLinZhengBaSignUpFlag then
			var.days.WuLinZhengBaSignUpFlag = 2
		end
		
		--exit_wlzb(sysarg) -- 玩家死亡则退出武林争霸
	elseif nSceneId == 216 then -- 奔跑吧兄弟
		pbpxd_OnPlayerDie(sysarg, killer, killerType)
	elseif nSceneId == 66 then -- 阵营战
		camp_battle_OnPlayerDie(sysarg, killer, killerType)
	elseif nSceneId == 107 then -- 军团战
		juntuanzhan_OnPlayerDie(sysarg, killer, killerType)
	end
	
	if fubenId == challenge_fuben_cfg.fubenId then
		on_challenge_fuben_player_die(sysarg, killer)
	end

    --角色被杀,镖车算失败
    if var.ybstate ~= nil and  var.ybstate == 1 then
        	-- 清除镖车
	    if (var.bcHandle ~= nil and var.bcHandle ~= 0) then
		    if bDelayRemove == false then
			    Fuben.clearMonster(var.bcHandle,false)
            end
            DeleteActorDartInfo(sysarg, var.bcHandle);
		end
		
	
        OnActorDartFailed(sysarg, StdActivityCfg.DuoBeiYaSong.DartSetup.CampDartFailObjDie,killer)
		Quest_ShuaXin(sysarg);
    end
	-----------------------------------------------------------------------------------------------------------------
	--军团军衔 掠夺印记 相关
	-- if Actor.getEntityType(killer) == 0 then --杀手是角色才掠夺
	-- 	if get_d_val(sysarg,110) > 0 and get_d_val(killer,110) > 0 then
	-- 		local temp_ld = {20,40,60,80,100,150,200,250,300,500};
	-- 		if temp_ld[get_d_val(killer,110)] then
	-- 			local delnum = temp_ld[get_d_val(killer,110)]; --获取杀手的军衔等级每次掠夺的数量
	-- 			if get_d_val(sysarg,113) >= delnum then
	-- 				del_d_val(sysarg,113,delnum);
	-- 				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)失去> <(c0xFF0090ff)%s(%s)财神印记属性>",delnum,get_d_val(sysarg,113)),1);
	-- 				add_d_val(killer,114,delnum);
	-- 				Actor.sendTipmsg(killer, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s(%s)掠夺印记属性>",delnum,get_d_val(killer,114)),1);
	-- 				ShuaXinFengHao(sysarg,113);
	-- 				ShuaXinFengHao(killer,114);
	-- 			else
	-- 				Actor.sendTipmsg(killer, string.format("对方财神印记属性不足<(c0xFF0090ff)%s>,掠夺失败.",delnum),1);
	-- 			end
	-- 		end
	-- 	end
	-- end
	-----------------------------------------------------------------------------------------------------------------

	if Actor.hasState(sysarg,esStateShield) then

		local RwData = {"xxxx", "威龙城", 136,141, "威龙城-天神护体"}
		local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
		local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
		Actor.sendTipmsg(sysarg,string.format("因开启了天神护体,死亡后掉落50元宝,可前往%s处关闭%s.",NpcName,NpctFly),128);
	end
	
--[[ 暂时屏蔽
	-- 击杀玩家增加荣誉值
	if killerType == 0 and sysarg ~= killer and Actor.isMatch(killer) == false and Actor.getChallenge(killer) == 0 then
		local kvar = Actor.getStaticVar(killer)
		local killCount = kvar.days.killCount
		if killCount == nil then killCount = 0 end
		
		-- 每人每天前100次击杀能获得荣誉（沙巴克战其间并在皇宫中则不计次数,但荣誉值还是要加）
		if Guild.getSbkWarFlag() == 0 or Actor.getSceneId(killer) ~= 51 then	
			killCount = killCount + 1		
			kvar.days.killCount = killCount		
		end		
			
		-- 因为 Guild.getSbkWarFlag() 可能为0,所以 kvar.days.killCount 这时有可能为 nil
		if killCount <= 100 then		
			local addHonorValue = 0
			local circle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
			if circle > 0 then
				addHonorValue = CircleHonorValueCfg.honorValues[circle]
				if addHonorValue == nil then
					addHonorValue = CircleHonorValueCfg.honorValues[#CircleHonorValueCfg.honorValues]
				end
			else
				local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
				if level >= 80 then
					addHonorValue = CircleHonorValueCfg.circle0
				end
			end
			
			if addHonorValue > 0 then
				local honorValue = Actor.getUIntProperty(killer, PROP_ACTOR_HONOR_VALUE)
				honorValue = honorValue + addHonorValue
				Actor.setUIntProperty(killer, PROP_ACTOR_HONOR_VALUE, honorValue)
				Actor.sendTipmsg(killer, string.format("您杀死了<(c0xFF00ff00)%s>,获得<(c0xFF00aaff)%d荣誉值>,您当前荣誉值<(c0xFF00aaff)%d>",Actor.getName(sysarg), addHonorValue, honorValue), ttFlyTip)
			end
		end			
	end
--]]

	-- 活跃度活动(不加了吧)
	--if killerType == 0 and sysarg ~= killer and Actor.isMatch(killer) == false and Actor.getChallenge(killer) == 0 then
	--	if nSceneId ~= 107 then -- 军团战
	--		OnLivenessPlayerDie(sysarg, killer)
	--	end
	--end
	--激情行会
    if killerType == 0 and nSceneId == JiQingGuildCfg.MapID then

        if Actor.hasBuffById(killer,JiQingGuildCfg.WuDiBuffID) == false then
            --更新排行榜
			local nPoint=0
            local nGuildID = Actor.getIntProperty(killer,PROP_ACTOR_GUILD_ID)
            local pRank = Ranking.getRanking(JiQingGuildCfg.RankName)
            if pRank ~= nil then
                local pRankItem = Ranking.getItemPtrFromId(pRank,nGuildID)
                if pRankItem == nil then
                    pRankItem = Ranking.addItem(pRank,nGuildID,1)
                    Ranking.setSub(pRankItem,0,Actor.getGuildName(killer))
                else 
                   nPoint = Ranking.getPoint(pRankItem) + 1 --加1点行会积分
                   Ranking.updateItem(pRankItem,nPoint)
                end
               
            end
            --更新个人积分
            local targetVar = Actor.getStaticVar(killer)
            if targetVar.JiQingKillV  == nil then
                targetVar.JiQingKillV  = 0
            end
            targetVar.JiQingKillV = targetVar.JiQingKillV + 1
			
			
			--广播行会积分
			local playerList = LuaHelp.getSceneActorListById(JiQingGuildCfg.MapID)		--获取某场景玩家对象列表
			if playerList ~= nil then
				for j = 1, #playerList do
					local player = playerList[j]
					if player then
						local netPack = DataPack.allocPacket(player, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
						DataPack.writeByte(netPack, 23) -- 活动类型
						DataPack.writeByte(netPack, 2) -- 行会排行榜信息
						DataPack.writeString(netPack, System.getGuildName(nGuildID))
						DataPack.writeUInt(netPack, nPoint)
						DataPack.flush(netPack)
					end
				end
			end

			--自己添加积分
			local netPack = DataPack.allocPacket(killer, LogicCmd.activitySys.sysID, LogicCmd.activitySys.sub.sUpdateActivityData)
			DataPack.writeByte(netPack, 23) -- 活动类型
			DataPack.writeByte(netPack, 3) -- 行会排行榜信息
			DataPack.writeUInt(netPack, targetVar.JiQingKillV)
			DataPack.flush(netPack)
			
        end
    end

    if killerType == 0 and System.isCrossServer() == false then
      --万人斩称号
        local tagrtVar = Actor.getStaticVar(killer)
        if tagrtVar.campKillCount == nil then tagrtVar.campKillCount = 0 end
        tagrtVar.campKillCount = tagrtVar.campKillCount + 1
        if tagrtVar.campKillCount >= 1000 then
            Actor.setTopTitle(killer,Title.CampKill,true)
        end
         send_headtitle_data(killer)
    end
    --激情大本营
--    if killerType == 0 and nSceneId == ArdourCampCfg.mapid then
--         --万人斩称号
--        local tagrtVar = Actor.getStaticVar(killer)
--        if tagrtVar.campKillCount == nil then tagrtVar.campKillCount = 0 end
--        tagrtVar.campKillCount = tagrtVar.campKillCount + 1
--        if tagrtVar.campKillCount >= 1000 then
--            Actor.setTopTitle(killer,Title.CampKill,true)
--        end
--        send_headtitle_data(killer)
--        if Actor.hasBuffById(killer,ArdourCampCfg.wudibuffid) == false then
--            local broadst={diename="",diepoint=0,killname="",killpoint=0,guildname="",guildpoint=0,}
--            --增加击杀者的攻击等级
--            local actorId = Actor.getIntProperty(killer,PROP_ENTITY_ID)
--            local dieActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
--            local pRank = Ranking.getRanking(ArdourCampCfg.rankname)

--            if pRank ~= nil then

--                local pRankItem = Ranking.getItemPtrFromId(pRank,actorId)
--                local pDieRankItem = Ranking.getItemPtrFromId(pRank,dieActorId)


--                if pRankItem ~= nil and pDieRankItem ~= nil  then
--                    local nDiePoint = Ranking.getPoint(pDieRankItem)
--                    local nPoint = Ranking.getPoint(pRankItem);
--                    if nDiePoint >= ArdourCampCfg.point then
--                        nDiePoint = nDiePoint - ArdourCampCfg.point
--                        Ranking.updateItem(pRank,dieActorId,-ArdourCampCfg.point)


--                        Actor.setIntProperty(sysarg,PROP_ACTOR_ARDOUR_ATTACK_RATE,nDiePoint  / ArdourCampCfg.point )
--                        Actor.collectOperate(sysarg,0)
--                        nPoint = Ranking.getPoint(pRankItem) + ArdourCampCfg.point --加10点积分
--                        Ranking.updateItem(pRank,actorId,ArdourCampCfg.point)
--                         --更新大本营攻击倍数
--                        --if nPoint> ArdourCampCfg.initpoint then
--                        Actor.setIntProperty(killer,PROP_ACTOR_ARDOUR_ATTACK_RATE,nPoint / ArdourCampCfg.point )


--                        --重新计算属性
--                        Actor.collectOperate(killer,0)


--                    end
--                    broadst.diename = Actor.getName(sysarg) 
--                    broadst.diepoint = nDiePoint
--                    broadst.killname = Actor.getName(killer)
--                    broadst.killpoint = nPoint 
--                end

--            end

--            --增加行会积分排行榜
--            pRank = Ranking.getRanking(ArdourCampCfg.guildrankname)
--            local nKillGuildId = Actor.getGuildId(killer)
--            if pRank ~= nil and nKillGuildId > 0 then
--                 pRankItem = Ranking.getItemPtrFromId(pRank,nKillGuildId)
--                 if pRankItem ~= nil then
--                    Ranking.updateItem(pRank,nKillGuildId,ArdourCampCfg.guildpoint)

--                    broadst.guildname = Ranking.getSub(pRankItem,0)
--                    broadst.guildpoint = Ranking.getPoint(pRankItem)

--                 end
--            end

----             print("guildname:"..broadst.guildname.."guildpoint:"..broadst.guildpoint)
----             print("diename:"..broadst.diename.."diepoint:"..broadst.diepoint)
----             print("killname:"..broadst.killname.."killpoint:"..broadst.killpoint)
--            --广播排行榜信息
--            local playerList = LuaHelp.getSceneActorListById(ArdourCampCfg.mapid)
--	        if playerList ~= nil then
--		        for i = 1, #playerList do
--			        local player = playerList[i]
--			        if player ~= nil then

--				       local netPack = DataPack.allocPacket(player,139,227)
--                       DataPack.writeString(netPack,broadst.guildname)
--                       DataPack.writeInt(netPack,broadst.guildpoint)
--                       DataPack.writeString(netPack,broadst.diename)
--                       DataPack.writeInt(netPack,broadst.diepoint)
--                       DataPack.writeString(netPack,broadst.killname)
--                       DataPack.writeInt(netPack,broadst.killpoint)
--                       DataPack.flush(netPack)
--			        end
--		        end
--	        end	
--        end

--    end
	
	--每日第一次挂都要发这个东西给前端
	if var.days.FirstDead ==nil then 
		local netPack = DataPack.allocPacket(sysarg, 139, 214)  --申请一个数据包
		if netPack then
			DataPack.flush(netPack)
		end
		var.days.FirstDead=1
	end

    --70级以后死亡的时候，森罗神戒的推荐
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if nActorLevel>70 then 
		if var.SLSJdieTime ==nil then 
			var.SLSJdieTime=1 
		elseif var.SLSJdieTime<=9 then 
			var.SLSJdieTime =var.SLSJdieTime +1
		end
		if var.SLSJdieTime==10 then 
			local equipItem_ptr = Item.getEquipByPos(sysarg, 48)
			if equipItem_ptr==nil then 
				local netPack = DataPack.allocPacket(sysarg, 139, 217)
				DataPack.flush(netPack)
			end
			var.SLSJdieTime=0
		end
	end
    --沙巴克击杀提示
    if System.IsInSBKWar() and Actor.getSceneId(sysarg) == 10 and killerType == 0 then
        local nGuildId = Actor.getGuildId(sysarg)
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        local sTips = ""
        local tipsType = ttScreenCenter
        --if nGuildId > 0 then
            --王城城主被击杀
            if Guild.getSbkCityOwner() == nActorId then
                local killGuildName = Actor.getGuildName(killer)
                if killGuildName ~= "" then
                    killGuildName = killGuildName.."行会"
                end
                sTips = string.format("震惊！%s<(n%s)>手起刀落，竟然将城主%s击败,其实力非凡,真是令人刮目相看.",killGuildName,Actor.getName(killer),Actor.getName(sysarg))
            else
                tipsType = ttChatWindow
                local killGuildName = Actor.getGuildName(killer)
                local killPosName = ""
                if killGuildName ~= "" then
                    killGuildName = killGuildName.."行会"
                end

                local guildPos = Actor.getGuildPos(killer)
                if guildPos ~= 0 and killGuildName ~= "" then
                     killPosName = GetGuildPosName(guildPos)
                end

                --自己的行会
                local selfGuildName = Actor.getGuildName(sysarg)
                local selfPosName = ""

                if selfGuildName ~= "" then
                    selfGuildName = selfGuildName.."行会"
                end
                 guildPos = Actor.getGuildPos(sysarg)
                if guildPos ~= 0 and selfGuildName ~= "" then
                   selfPosName = GetGuildPosName(guildPos)
                end
                if killPosName ~= nil and string.len(killPosName) > 0 then
                    killPosName = "【"..killPosName.."】"
                end

                if selfPosName ~= nil and string.len(selfPosName) > 0 then
                    selfPosName= "【"..selfPosName.."】"
                end
                sTips = string.format("%s%s<(n%s)>反身一击,将%s%s<(n%s)>击败,并且大喊一声:老虎不发威你当我是病猫?",killGuildName,killPosName,Actor.getName(killer),selfGuildName,selfPosName,Actor.getName(sysarg))
            end
            
            System.broadcastTipmsg(sTips,tipsType)

        --end

    end
    --连斩杀
 
    if killerType == 0 then
        if System.isCrossServer() then
            local dVar = Actor.getDyanmicVar(killer )
            if dVar.damagerate == nil then dVar.damagerate = 1 end
            if dVar.killguildactor == nil then
                dVar.killguildactor = {}
                dVar.killguildactor.count = 0
                dVar.killguildactor.actor={}
            end
            local bFind = false
            for qqq = 1,dVar.killguildactor.count do
                if dVar.killguildactor.actor[qqq] == Actor.getIntProperty(sysarg,PROP_ENTITY_ID) then
                    bFind = true
                    break
                end
            end
            if bFind == false then
                dVar.damagerate = dVar.damagerate + 0.05
                if dVar.damagerate >= 2 then dVar.damagerate = 2 end --最多100%

                dVar.killguildactor.count = dVar.killguildactor.count + 1
                dVar.killguildactor.actor[dVar.killguildactor.count] = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
            end
            


            dVar = Actor.getDyanmicVar(sysarg)
            if dVar.damagerate == nil then dVar.damagerate = 1 end
            dVar.damagerate = dVar.damagerate - 0.05
            if dVar.damagerate < 1 then dVar.damagerate = 1 end
            Actor.collectOperate(sysarg,0)
            Actor.collectOperate(killer,0)

        end

        
        local killVar = Actor.getDyanmicVar(killer)
       
        if killVar.eventcut == nil then killVar.eventcut = {}  end
        if killVar.eventcut.count == nil then killVar.eventcut.count = 0 end
        if killVar.eventcut.time == nil then killVar.eventcut.time = System.getCurrMiniTime() end
       
        killVar.eventcut.count = killVar.eventcut.count +1
       local killGuildName = Actor.getGuildName(killer)
       
        if killGuildName ~= "" then
            killGuildName =killGuildName.."行会"
        end
      
        local killPosName = ""
        local guildPos = Actor.getGuildPos(killer)
        if guildPos ~= 0 and killGuildName ~= "" then
                killPosName = GetGuildPosName(guildPos)
        end
        local broadcatCfg = 
        {
            [2] = 
            {
                time = 5, --分钟
                text = "%s%s<(n%s)>在<(c0xFF00CCFF)%s>击杀了<(n%s)>,完成了双杀，已经杀红了眼啊！",
            },
            [3] = 
            {
                time = 10, --分钟
                text = "%s%s<(n%s)>在<(c0xFF00CCFF)%s>击杀了<(n%s)>,手起刀落,帅气的完成了三杀,此时已经发狂中~",             
            },
            [4] =
            {
                time = 15, --分钟
                text = "%s%s<(n%s)>在<(c0xFF00CCFF)%s>击杀了<(n%s)>,连续击杀四人,已经暴走,谁可以治他？", 
            },
            [5] =
            {
                time = 20, --分钟
                text = "%s%s<(n%s)>在<(c0xFF00CCFF)%s>击杀了<(n%s)>,连续击杀五人,已经无人可挡,这是单方面的屠杀吗?", 
            },
            [6] =
            {
                time = 30, --分钟
                text = "%s%s<(n%s)>在<(c0xFF00CCFF)%s>击杀了<(n%s)>,连续击杀六人,传闻他已经入魔了,正义人士正在商议如何制裁.", 
            },
            [7] =
            {
                time = 40, --分钟
                text = "%s%s<(n%s)>在<(c0xFF00CCFF)%s>击杀了<(n%s)>,连续击杀七人,一夫当关万夫莫开,这或许就是男人吧", 
            },
            [8] =
            {
                time = 60, --分钟
                text = "%s%s<(n%s)>在<(c0xFF00CCFF)%s>击杀了<(n%s)>,连续击杀%d人,纵横威龙大陆,似乎无可匹敌,实力之强恐怕不输于城主啊.", 
            }
        }
        local cfg = nil
       
        if killVar.eventcut.count >= 8 then
            cfg = broadcatCfg[8]
        else
            cfg = broadcatCfg[killVar.eventcut.count]
        end

        if cfg ~= nil then
            --超出连斩时间 归0
           
            if System.getCurrMiniTime() - killVar.eventcut.time > cfg.time * 60 then
                killVar.eventcut.count = 1
            else
                --广播
                local sTips = ""
                if killVar.eventcut.count >= 8 then
                    sTips = string.format(cfg.text,killGuildName,killPosName,Actor.getName(killer),Actor.getSceneName(sysarg),Actor.getName(sysarg),killVar.eventcut.count)
                else
                     sTips = string.format(cfg.text,killGuildName,killPosName,Actor.getName(killer),Actor.getSceneName(sysarg),Actor.getName(sysarg))
                end
				
				--跨服屏蔽显示
				if System.isCrossServer() ~=true then
					System.broadcastTipmsg(sTips,ttChatWindow+ttScreenCenter)
				end
            end
           
            killVar.eventcut.time = System.getCurrMiniTime()
        end

        --连斩清零
        local selfvar = Actor.getDyanmicVar(sysarg)
        --正在连杀 终结连杀
        if selfvar.eventcut ~= nil and selfvar.eventcut.count >= 2 then
             local selfGuildName = Actor.getGuildName(sysarg)
            if selfGuildName ~= "" then
                selfGuildName =selfGuildName.."行会"
            end
            local selfPosName = ""
            guildPos = Actor.getGuildPos(sysarg)
            if guildPos ~= 0 and selfGuildName ~= "" then
                   selfPosName = GetGuildPosName(guildPos)
            end
            local sTips = string.format("%s%s<(n%s)>看不下去了,直接终结了%s%s<(n%s)>的连杀,吃瓜群众惊呼道,这下有好戏看了.",killGuildName,killPosName,Actor.getName(killer),selfGuildName,selfPosName,Actor.getName(sysarg) )
            System.broadcastTipmsg(sTips,ttChatWindow+ttScreenCenter)
        end
        selfvar.eventcut = nil 
    end
	
	
	--删除屠魔印记buff
	Actor.delBuff(sysarg,KillBossAddBuff.buffType,KillBossAddBuff.buffGroup)
	
	
	
	--大吉大利活动期间杀人
	local svar = System.getStaticVar()
	if (svar.isDringDaJiDaLi ==nil or svar.isDringDaJiDaLi<1 or svar.isDringDaJiDaLi>3)==false then 
		local tagrtVar = Actor.getStaticVar(killer)
		if killerType==0 and nSceneId==110 then
			ClearDaJiDaLi_Data(killer,6)
			if tagrtVar.DJDL_Data.killIn110==nil then 
				tagrtVar.DJDL_Data.killIn110=1
			else 
				tagrtVar.DJDL_Data.killIn110 = tagrtVar.DJDL_Data.killIn110 +1
			end
		end
		
		if killerType==0 and nSceneId==234 then
			ClearDaJiDaLi_Data(sysarg,7)
			if tagrtVar.DJDL_Data.killIn234==nil then 
				tagrtVar.DJDL_Data.killIn234=1
			else 
				tagrtVar.DJDL_Data.killIn234 = tagrtVar.DJDL_Data.killIn234 +1
			end
		end
	end

end
--根据行会位置获取职务名称
function GetGuildPosName(guildPos)
    local PosName = ""
     if guildPos == 1 then
        PosName  ="青龙堂主"
    elseif guildPos == 2 then
        PosName= "朱雀堂主"
    elseif guildPos == 3 then
        PosName = "白虎堂主"
    elseif guildPos == 4 then
        PosName = "玄武堂主"
    elseif guildPos == 5 then
        PosName = "副首领"
    elseif guildPos == 6 then
        PosName = "首领"
    elseif guildPos == 0 then
        PosName= "行会成员"
    end
    return PosName
end
function seth(sysarg, val)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE, val)
end

function GetBossKillPayMoneyReward(nBossLevel, nBossMaxHp)
	local svar = System.getStaticVar()
	if svar ~= nil and svar.disableBossPayMoney == 1 then
		return 0, 0, 1, false, false
	end

	nBossLevel = tonumber(nBossLevel) or 0
	nBossMaxHp = tonumber(nBossMaxHp) or 0
	if nBossLevel < 100 then return 0, 0, 1, false, false end
	if nBossMaxHp < 0 then nBossMaxHp = 0 end

	local nMinRate = math.floor(nBossMaxHp / 2000000)
	local nMaxRate = math.floor(nBossMaxHp / 1000000)
	if nMinRate < 10 then nMinRate = 10 end
	if nMaxRate < nMinRate then nMaxRate = nMinRate end
	if nMaxRate > 100 then nMaxRate = 100 end
	if nMinRate > 100 then nMinRate = 100 end
	local nRate = nMinRate
	if nMaxRate > nMinRate then
		nRate = nRate + System.getRandomNumber(nMaxRate*100 - nMinRate*100 + 1) / 100
	end

	-- 动态调整的基础倍率 (默认为 1.0)
	local baseRateMult = 1.0
	if svar ~= nil and svar.bossPayMoneyBaseRate ~= nil then
		baseRateMult = tonumber(svar.bossPayMoneyBaseRate) or 1.0
	end
	nRate = nRate * baseRateMult

	local nLuckRate = 1
	local bLuckyTriggered = false
	local bLuckyExtraTriggered = false
	if System.getRandomNumber(100) < 20 then
		nLuckRate = (System.getRandomNumber(101) + 100) / 100
		bLuckyTriggered = true
		if System.getRandomNumber(100) < 10 then
			nLuckRate = nLuckRate * (System.getRandomNumber(301) + 200) / 100
			bLuckyExtraTriggered = true
		end
	end
	return math.floor(nBossLevel * nRate * nLuckRate + 0.5), nBossLevel, nLuckRate, bLuckyTriggered, bLuckyExtraTriggered
end

function BossKillPayMoney(sysarg, nYuanBao, nYuanGu, szBossName, szSceneName, nLuckRate, bLuckyTriggered, bLuckyExtraTriggered)
	nYuanBao = tonumber(nYuanBao) or 0
	nYuanGu = tonumber(nYuanGu) or 0
	nLuckRate = tonumber(nLuckRate) or 1
	bLuckyTriggered = bLuckyTriggered == true
	bLuckyExtraTriggered = bLuckyExtraTriggered == true
	szBossName = szBossName or ""
	szSceneName = szSceneName or ""
	if nYuanBao <= 0 and nYuanGu <= 0 then return false end

	local var = Actor.getStaticVar(sysarg)
	if var == nil then return false end
	if var.days == nil then var.days = {} end

	local awards = {}
	if nYuanBao > 0 then
		awards[#awards + 1] = {type = 15, id = 0, count = nYuanBao}
	end
	if nYuanGu > 0 then
		awards[#awards + 1] = {type = 69, id = 0, count = nYuanGu}
	end

	if Awards.Give(sysarg, awards, GameLog.cKillBossAward, "击杀Boss模拟充值奖励") ~= true then
		return false
	end

	-- 杀怪额外奖励：根据boss等级(nYuanGu)给予对应的灵力，boss等级随机5-10倍
	if nYuanGu > 0 then
		-- boss等级对应的灵力 (按元宝幸运暴击模式缩放)
		local baseLingli = nYuanGu
		local lingliReward = baseLingli
		local curLingli = Actor.getUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE) or 0
		Actor.setUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE, curLingli + lingliReward)
		Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", lingliReward, "灵力值"), 1)


		-- 参考元宝的模式给内功 boss等级随机5-10倍数，支持两位小数
        local randMult = System.getRandomNumber(501) + 500
        local baseInnerExp = math.floor(nYuanGu * randMult / 100)
		local innerExpReward = baseInnerExp
		Actor.addInnerExp(sysarg, innerExpReward)
		Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", innerExpReward, "内功经验"), 1)
	end

	if nYuanBao > 0 then
		Actor.addVipPoint(sysarg, nYuanBao)

		-- 同步首充状态、总提取/充值元宝数量
		if var.FirstRechargeFlag == nil or var.FirstRechargeFlag == 0 then
			var.FirstRechargeFlag = 1
		end
		
		local curDrawYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_DRAW_YB_COUNT)
		Actor.setUIntProperty(sysarg, PROP_ACTOR_DRAW_YB_COUNT, curDrawYb + nYuanBao)
		
		local YuanBao = var.nYuanBao
		if not YuanBao then 
			var.nYuanBao = nYuanBao
		else
			var.nYuanBao = var.nYuanBao + nYuanBao
		end
		
		-- 通知客户端首充状态已更新
		if MiscsImplement ~= nil and MiscsImplement.GetFirstRechargeInfo ~= nil then
			MiscsImplement.GetFirstRechargeInfo(sysarg)
		end

		local nowTime = System.getCurrMiniTime()
		local lastPeyTime = var.lastPeyTime
		if lastPeyTime == nil then lastPeyTime = nowTime end
		if System.isSameDay(nowTime, lastPeyTime) == false then
			var.days.PeyNum = 0
			var.days.PeyFlag = 0
		end
		var.days.PeyNum = (var.days.PeyNum or 0) + nYuanBao
		var.lastPeyTime = nowTime


		local svar = System.getStaticVar()

		-- 直接更新散人福利/万服庆典/大吉大利/国庆送礼/新春活动/百服活动/劳动节等累计充值相关变量
		-- 1. 散人福利/散人红利
		if SanRenHongLiCfg ~= nil and SanRenHongLiCfg.EveryTotalPay ~= nil then
			if (svar.isDringSanRenHongLi == nil or svar.isDringSanRenHongLi < 1 or svar.isDringSanRenHongLi > 3) == false then
				if ClearSanRenHongLi_Data ~= nil then ClearSanRenHongLi_Data(sysarg) end
				local cfg = SanRenHongLiCfg.EveryTotalPay
				if var.SRHL_Data == nil then var.SRHL_Data = {} end
				if var.SRHL_Data.payTotal == nil then var.SRHL_Data.payTotal = {} end
				if var.days.hongliPayTime == nil then var.days.hongliPayTime = {} end
				for i = 1, #cfg do
					if cfg[i].needPay <= var.days.PeyNum then
						if var.SRHL_Data.payTotal[i] == nil then
							var.SRHL_Data.payTotal[i] = 1
							var.days.hongliPayTime[i] = 1
						else
							if svar.isDringSanRenHongLi ~= nil and var.SRHL_Data.payTotal[i] >= svar.isDringSanRenHongLi then
							else
								if var.days.hongliPayTime[i] == nil then
									var.SRHL_Data.payTotal[i] = 1 + var.SRHL_Data.payTotal[i]
									var.days.hongliPayTime[i] = 1
								end
							end
						end
					end
				end
				-- 推送散人红利最新进度给客户端
				if GetSanRenHongLiInfo ~= nil then
					GetSanRenHongLiInfo(sysarg, 1)
					GetSanRenHongLiInfo(sysarg, 3)
				end
			end
		end

		-- 2. 万服庆典/庆典活动
		if QingDianActivityCfg ~= nil and QingDianActivityCfg.EveryTotalPay ~= nil then
			if (svar.isDringQingDianActivity == nil or svar.isDringQingDianActivity < 1 or svar.QingDian_openDay == nil or svar.isDringQingDianActivity > svar.QingDian_openDay) == false then
				if ClearQingDian_Data ~= nil then ClearQingDian_Data(sysarg) end
				local cfg = QingDianActivityCfg.EveryTotalPay
				if var.QDHD_Data == nil then var.QDHD_Data = {} end
				if var.QDHD_Data.payTotal == nil then var.QDHD_Data.payTotal = {} end
				if var.days.qingdianPayTime == nil then var.days.qingdianPayTime = {} end
				for i = 1, #cfg do
					if cfg[i].needPay <= var.days.PeyNum then
						if var.QDHD_Data.payTotal[i] == nil then
							var.QDHD_Data.payTotal[i] = 1
							var.days.qingdianPayTime[i] = 1
						else
							if svar.isDringQingDianActivity ~= nil and var.QDHD_Data.payTotal[i] >= svar.isDringQingDianActivity then
							else
								if var.days.qingdianPayTime[i] == nil then
									var.QDHD_Data.payTotal[i] = 1 + var.QDHD_Data.payTotal[i]
									var.days.qingdianPayTime[i] = 1
								end
							end
						end
					end
				end
			end
		end

		-- 3. 大吉大利
		if activity_DaJiDaLi ~= nil and activity_DaJiDaLi.payGiveAwardNew ~= nil and activity_DaJiDaLi.payGiveAwardNew.needMoney ~= nil then
			if (svar.isDringDaJiDaLi == nil or svar.isDringDaJiDaLi < 1 or svar.isDringDaJiDaLi > 3) == false then
				if ClearDaJiDaLi_Data ~= nil then ClearDaJiDaLi_Data(sysarg, 3) end
				local cfg = activity_DaJiDaLi.payGiveAwardNew.needMoney
				if var.days.dajidaliAddFlag == nil then var.days.dajidaliAddFlag = {} end
				for i = 1, #cfg do
					if var.days.PeyNum >= cfg[i] and var.days.dajidaliAddFlag[i] == nil then
						var.days.dajidaliAddFlag[i] = 1
						if var.DJDL_Data == nil then var.DJDL_Data = {} end
						if var.DJDL_Data.chongzhiDataNew == nil then var.DJDL_Data.chongzhiDataNew = {} end
						if var.DJDL_Data.chongzhiDataNew[i] == nil then
							var.DJDL_Data.chongzhiDataNew[i] = 1
						else
							var.DJDL_Data.chongzhiDataNew[i] = 1 + var.DJDL_Data.chongzhiDataNew[i]
						end
						if var.DJDL_Data.chongzhiDataNew[i] > svar.isDringDaJiDaLi then
							var.DJDL_Data.chongzhiDataNew[i] = svar.isDringDaJiDaLi
						end
					end
				end
				if GetDaJiDaLiInfo ~= nil then GetDaJiDaLiInfo(sysarg, 12) end
			end
		end

		-- 4. 竞技大赛（累计充值天数）
		if activity_jingji ~= nil and activity_jingji.payGiveAwardNew ~= nil and activity_jingji.payGiveAwardNew.needMoney ~= nil then
			if (svar.isDringJingJi == nil or svar.isDringJingJi < 1 or svar.JingJiOpenDay == nil or svar.isDringJingJi > svar.JingJiOpenDay) == false then
				if ClearJingJi_Data ~= nil then ClearJingJi_Data(sysarg) end
				local cfg = activity_jingji.payGiveAwardNew.needMoney
				if var.days.jingjiAddFlag == nil then var.days.jingjiAddFlag = {} end
				if var.JingJi_Data == nil then var.JingJi_Data = {} end
				for i = 1, #cfg do
					if var.days.PeyNum >= cfg[i] and var.days.jingjiAddFlag[i] == nil then
						var.days.jingjiAddFlag[i] = 1
						if var.JingJi_Data.chongzhiDataNew == nil then
							var.JingJi_Data.chongzhiDataNew = {}
						end
						if var.JingJi_Data.chongzhiDataNew[i] == nil then
							var.JingJi_Data.chongzhiDataNew[i] = 1
						else
							var.JingJi_Data.chongzhiDataNew[i] = 1 + var.JingJi_Data.chongzhiDataNew[i]
						end

						if var.JingJi_Data.chongzhiDataNew[i] > svar.isDringJingJi then
							var.JingJi_Data.chongzhiDataNew[i] = svar.isDringJingJi
						end
					end
				end
				if GetJingjiiInfo ~= nil then GetJingjiiInfo(sysarg, 3) end
			end
		end

		-- 5. 新春活动/新春送礼
		if is_spring_festival_time ~= nil and is_spring_festival_time() == true then
			if ClearAllSpringData ~= nil then ClearAllSpringData(sysarg) end
			if SpringFestivalCfg ~= nil and SpringFestivalCfg.EveryTotalPay ~= nil and get_spring_festival_day_count ~= nil then
				local cfg = SpringFestivalCfg.EveryTotalPay
				if var.Spring_Data == nil then var.Spring_Data = {} end
				if var.Spring_Data.payTotal == nil then var.Spring_Data.payTotal = {} end
				if var.days.spring_payTime == nil then var.days.spring_payTime = {} end
				local springOpenDay = get_spring_festival_day_count()
				for i = 1, #cfg do
					if cfg[i].needPay <= var.days.PeyNum then
						if var.Spring_Data.payTotal[i] == nil then
							var.Spring_Data.payTotal[i] = 1
							var.days.spring_payTime[i] = 1
						else
							if var.Spring_Data.payTotal[i] >= springOpenDay then
							else
								if var.days.spring_payTime[i] == nil then
									var.Spring_Data.payTotal[i] = 1 + var.Spring_Data.payTotal[i]
									var.days.spring_payTime[i] = 1
								end
							end
						end
					end
				end
				if GetSpringLiJiChongzhi ~= nil then
					GetSpringLiJiChongzhi(sysarg)
				end
			end
		end

		-- 6. 百服活动
		if System.getHundredServerStatus ~= nil and System.getHundredServerStatus() == 1 and OneHundredActivityCfg ~= nil and OneHundredActivityCfg.MissionStepGift ~= nil then
			local config = OneHundredActivityCfg.MissionStepGift[1]
			if var.MissionStep == nil then var.MissionStep = 0 end
			if var.oneHundredPay == nil then var.oneHundredPay = 0 end
			if var.MissionStep < 1 then
				var.oneHundredPay = var.oneHundredPay + nYuanBao
				if var.oneHundredPay >= config.finishCount then
					var.MissionStep = 1
					if Lang ~= nil and Lang.ScriptTips ~= nil and Lang.ScriptTips.zf356 ~= nil then
						Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf356, var.MissionStep), ttDialog)
					end
				end
			end
		end

		-- 7. 劳动节活动
		if IsOpenActivity ~= nil and LaborActivityCfg ~= nil and LaborActivityCfg.SinglePay ~= nil and IsOpenActivity(LaborActivityCfg) == 5 then
			if var.LaborSinglePayValue == nil then var.LaborSinglePayValue = 0 end
			if var.LaborSinglePayValue == 0 then
				var.LaborSinglePayValue = nYuanBao
			else
				if not var.LobarSinglePayFlag then var.LobarSinglePayFlag = {} end
				local nGiveId = 0
				for i = 1, #LaborActivityCfg.SinglePay do
					if var.LobarSinglePayFlag[i] then
						nGiveId = i
						break
					end
				end
				if nGiveId <= 0 and var.LaborSinglePayValue < nYuanBao then
					var.LaborSinglePayValue = nYuanBao
				end
			end
			if var.LaborCumulativePayValue == nil then var.LaborCumulativePayValue = 0 end
			var.LaborCumulativePayValue = var.LaborCumulativePayValue + nYuanBao
		end

		if daily_pay_ranking_sync_pay ~= nil then
			daily_pay_ranking_sync_pay(sysarg)
		end

		if foot_print_add_weekly_pay_money_by_killboss ~= nil then
			foot_print_add_weekly_pay_money_by_killboss(sysarg, nYuanBao)
		else
			-- 兜底：避免模块加载顺序导致函数未定义时，足迹/神盾周累充不累计
			var.FootPrintPayMoney = (var.FootPrintPayMoney or 0) + nYuanBao
			if send_foot_print_pay_data ~= nil then
				send_foot_print_pay_data(sysarg)
			end
		end

		var.RechInt = (var.RechInt or 0) + nYuanBao

		local openServerDay = System.getDaysSinceOpenServer()
		if openServerDay <= 7 then
			var.nYuanBao_timedGift = (var.nYuanBao_timedGift or 0) + nYuanBao
			var.OpenServerLotteryScore = (var.OpenServerLotteryScore or 0) + nYuanBao
		end

		if var.days.PeyNum >= 1000 and OnFinish_Liveness ~= nil then
			OnFinish_Liveness(sysarg, 7)
		end

		if System.isCrossServer() == false then
			local payPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendTodayPay)
			DataPack.writeInt(payPack, var.days.PeyNum)
			DataPack.flush(payPack)
		end

		if openServerDay >= 1 and openServerDay <= 7 and System.isCrossServer() == false then
			if var.OScontinuePay == nil then var.OScontinuePay = {} end
			var.OScontinuePay[openServerDay] = var.days.PeyNum

			local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOpenSeverContinuePay)
			DataPack.writeByte(netPack, 0)
			for i = 1,7 do
				if var.OScontinuePay[i] == nil then
					DataPack.writeInt(netPack, 0)
				else
					DataPack.writeInt(netPack, var.OScontinuePay[i])
				end
			end
			DataPack.flush(netPack)
		end

		local combineDays = System.getDaysSinceCombineServer()
		if combineDays > 0 and combineDays <= 5 then
			var.CombineCumulative = (var.CombineCumulative or 0) + nYuanBao
			if SendCombineData ~= nil then SendCombineData(sysarg) end
		end

		if Pay_Rank_UpdateItem ~= nil then
			local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
			Pay_Rank_UpdateItem(actorID, Actor.getName(sysarg), nYuanBao)
		end

		if OnLuaEvent ~= nil and LuaEventId ~= nil and LuaEventId.ActorPayMoney ~= nil then
			OnLuaEvent(LuaEventId.ActorPayMoney, sysarg, nYuanBao)
		end
	end

	local szRewardTip = string.format("<(c0xFFd4ab6f)击败Boss><(c0xFFFF0000)【%s】><(c0xFFd4ab6f)！地点：%s 掉落：><(c0xFFFFD700)元宝直充+%d><(c0xFFd4ab6f)，远古积分+%d>", szBossName, szSceneName, nYuanBao, nYuanGu)
	local szBroadcastTip = string.format("<(n%s)><(c0xFFd4ab6f)在><%s><(c0xFFd4ab6f)击败Boss><(c0xFFFF0000)【%s】><(c0xFFd4ab6f)，获得><(c0xFFFFD700)元宝直充+%d>", Actor.getName(sysarg), szSceneName, szBossName, nYuanBao)
	if bLuckyTriggered then
		szRewardTip = string.format("<(c0xFFd4ab6f)击败Boss><(c0xFFFF0000)【%s】><(c0xFFd4ab6f)！地点：%s 触发><(c0xFF00FF00)幸运暴击><(c0xFFd4ab6f)！掉落：><(c0xFFFFD700)元宝直充+%d><(c0xFF00FF00)（%.2f倍）><(c0xFFd4ab6f) 远古积分+%d>", szBossName, szSceneName, nYuanBao, nLuckRate, nYuanGu)
		szBroadcastTip = string.format("<(n%s)><(c0xFFd4ab6f)在><%s><(c0xFFd4ab6f)击败Boss><(c0xFFFF0000)【%s】><(c0xFFd4ab6f)触发><(c0xFF00FF00)幸运暴击><(c0xFFd4ab6f)！获得><(c0xFFFFD700)元宝直充+%d><(c0xFF00FF00)（%.2f倍）>", Actor.getName(sysarg), szSceneName, szBossName, nYuanBao, nLuckRate)
		if bLuckyExtraTriggered then
			szRewardTip = string.format("<(c0xFFd4ab6f)击败Boss><(c0xFFFF0000)【%s】><(c0xFFd4ab6f)！地点：%s 触发><(c0xFFFF6600)神级暴击><(c0xFFd4ab6f)！！掉落：><(c0xFFFFD700)元宝直充+%d><(c0xFFFF6600)（%.2f倍）><(c0xFFd4ab6f) 远古积分+%d>", szBossName, szSceneName, nYuanBao, nLuckRate, nYuanGu)
			szBroadcastTip = string.format("<(n%s)><(c0xFFd4ab6f)在><%s><(c0xFFd4ab6f)击败Boss><(c0xFFFF0000)【%s】><(c0xFFd4ab6f)触发><(c0xFFFF6600)神级暴击><(c0xFFd4ab6f)！！获得><(c0xFFFFD700)元宝直充+%d><(c0xFFFF6600)（%.2f倍）>", Actor.getName(sysarg), szSceneName, szBossName, nYuanBao, nLuckRate)
		end
	end

	Actor.sendTipmsg(sysarg, szRewardTip, ttFlyTip)
	System.broadcastTipmsg(szBroadcastTip, 128)
	return true
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function OnMonsterByKilled(monster, sysarg, monId, fubenId, sceneId,fuBenPtr)
	if Actor.getEntityType(sysarg) ~= 0 then
		return
	end
	
	--//读取私人变量d
	local var = Actor.getStaticVar(sysarg);
	if var == nil then return end -- 玩家登出时这里有可能为 nil
	local d = var.d;
	
	local entityType = Actor.getEntityType(monster)
	local monsterType = System.getMonsterTypeById(monId);
	local SceneName = Fuben.getSceneNameById(sceneId);

	--副本显示刷新
	if sceneId >= 91 and sceneId <= 97 then
		Quest_ShuaXin(sysarg);
	end

	--军团军衔 屠魔印记 相关
	-- if get_d_val(sysarg,110) > 0 and monsterType == 4 then
	-- 	add_d_val(sysarg,112,1);
	-- 	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s％(%s％)屠魔印记属性>",1,get_d_val(sysarg,112)),1);
	-- 	ShuaXinFengHao(sysarg,112);
	-- end

    

    --中毒死的boss情况，角色和boss不在同一场景2017.11.22
    local nBossSceneId = sceneId
    if monsterType == 4 then 
        if nBossSceneId ~= Actor.getSceneId(monster) then
            nBossSceneId  = Actor.getSceneId(monster)
        end
    end
---------------------------------------------------------------------------击杀定时刷的BOSS处理

   local bIdentCode = false
	local refreshSave = LocalDT.GetSRRefreshMonsterSave()
	for i = 1,#RefreshMonsterData do
		local ref = RefreshMonsterData[i];
        local refreshRecord = refreshSave[ref.bj]
        local svar = System.getDyanmicVar(sysarg);
		local s = svar.srRefreshMonster;		--记录是否存活,1为存活,0为没有
        local nextboss = svar.srRefreshMonsterBoss;--记录下一级boss
        if nextboss == nil then svar.srRefreshMonsterBoss = {} end
        nextboss = svar.srRefreshMonsterBoss
        if nextboss[ref.bj] == nil then nextboss[ref.bj] = tonumber(refreshRecord and refreshRecord.nextIndex) or 0 end

        --验证码
        if ref.monid == monId then
            bIdentCode = true
        end
		if (ref.monid == monId or (ref.nextboss ~= nil and nextboss[ref.bj] > 0 and nextboss[ref.bj] <= #ref.nextboss and ref.nextboss[nextboss[ref.bj]].monid == monId)) and nBossSceneId == ref.mapid then
			refreshRecord = LocalDT.GetSRRefreshMonsterRecord(refreshSave, ref.bj)
			local remaining = svar.srrmRemaining;	--记录刷怪剩余时间,如果等于0就刷
			if s == nil then svar.srRefreshMonster = {}; s = svar.srRefreshMonster; end
			if remaining == nil then svar.srrmRemaining = {}; remaining = svar.srrmRemaining; end
            --几率触发下一级boss
            local bNext = false
            if ref.nextboss ~= nil then
                nextboss[ref.bj] = nextboss[ref.bj] + 1
                
                if nextboss[ref.bj] <= #ref.nextboss then
                
                   if System.getRandomNumber(10000)+ 1 <= ref.nextboss[nextboss[ref.bj]].rand then
                        bNext = true
                        s[ref.bj] = 1
                        remaining[ref.bj] = 0
                        local SceneHandle = Fuben.getSceneHandleById(ref.mapid);
                        local MonsterPtr = Fuben.createMonster(SceneHandle, ref.nextboss[nextboss[ref.bj]].monid,ref.x, ref.y, 0);
                        if MonsterPtr ~= nil then
							refreshRecord.activeId = ref.nextboss[nextboss[ref.bj]].monid
							refreshRecord.nextIndex = nextboss[ref.bj]
							refreshRecord.nextTime = 0
                            local str ="恭喜 <(n%s)>玩家在%s地图，打死%sBOSS，惹得它爸爸出现了！击杀后有更大几率获得高转武器衣服！"
                            str = string.format(str,Actor.getName(sysarg),Fuben.getSceneNameById(ref.mapid),System.getMonsterNameById(monId))
                            System.broadcastTipmsg(str,ttChatWindow)
                        else
                            System.trace("RefreshMonsterData ref error!"..ref.monid.." index:"..nextboss[ref.bj])
                            bNext = false
                            nextboss[ref.bj] = 0
                        end

                    end
                else
                    nextboss[ref.bj] = 0
                end

               
            end
            if bNext == false then
				s[ref.bj] = 0;
			    remaining[ref.bj] = ref.rsftime;
			    nextboss[ref.bj] = 0
			    refreshRecord.activeId = 0
			    refreshRecord.nextIndex = 0
			    refreshRecord.nextTime = System.getCurrMiniTime() + ref.rsftime * 60
			    --HandlePlayerEnterSceneBossTips(sysarg,sceneId);
			    --给当前地图的玩家广播
			    local playerList = LuaHelp.getSceneActorListById(nBossSceneId)
			    if playerList ~= nil then
				    for i, v in ipairs(playerList) do
					    if v~=nil then 
						    HandlePlayerEnterSceneBossTips(v,nBossSceneId)
					    end
				    end
			    end
            end
			System.saveStaticVar()

			--Actor.sendTipmsg(sysarg, string.format("BOSSID:%s,BOSS:%s,BJ:%s,remaining:%s", monId, System.getMonsterNameById(monId), ref.bj, remaining[ref.bj]),128);
			break;
		end
	end
    if bIdentCode == true then
        addKillBossCount(sysarg,monster,1)
    end
---------------------------------------------------------------------------主线任务相关
	local tMkm = var.zkillmon;	--主线杀怪数记录
    local ta = task_all[get_taskflags_val(sysarg)]
	local taNext = task_all[get_taskflags_val(sysarg)+1]--预测下一任务类型


    if ta ~= nil then
	
		local cond=false 
		if ta.mapid == 1 then 
			for _,v in ipairs(ActorInitConfig.nCreateInitFb[1].createPos) do 
				if v.nScenceID == sceneId then 
					cond = true
				end
			end
		end
        if ta.type == 3 and (sceneId == ta.mapid or cond == true )then
        	if ta.monid == 0 then
        		tMkm[1] = tMkm[1] + 1;
				if tMkm[1] >= ta.monnum then
					tMkm[1] = ta.monnum;
					checkIsFinishTask(sysarg,1)--检查任务是否完成
				end
        	else
        		if ta.monid == monId then
	        		tMkm[1] = tMkm[1] + 1;
					if tMkm[1] >= ta.monnum then
						tMkm[1] = ta.monnum;
						checkIsFinishTask(sysarg,1)
					end
        		end
        	end
			Quest_ShuaXin(sysarg);
		end
    end

--------------------------------------------------------------------------日常除魔任务 
	if var.RiChangRenWuType ~= nil and var.RiChangRenWuType == 0 then --日常除魔任务类型是打怪物的类型
		if var.RiChangRenWuFlag~=nil and var.RiChangRenWuFlag == 1 then 
			if var.RiChangRenWuFinish ==nil or var.RiChangRenWuFinish ==0 then 
				local t=GetNpcRiChangChuMo()
				--print("t[var.RiChangRenWuIndex].monsterId"..t[var.RiChangRenWuIndex].monsterId)
				if monId == t[var.RiChangRenWuIndex].monsterId or t[var.RiChangRenWuIndex].monsterId == 0 then 
				
					--处理战无双在散人殿堂打怪分流问题
					local sameSceen =false 
					if t[var.RiChangRenWuIndex].mapId== 99 then
						for i,v in pairs(GetNpcANYINMIDIAN().data.scene2.sceneId2) do 
							if v==sceneId then 
								sameSceen =true
							end
						end
					elseif t[var.RiChangRenWuIndex].mapId== 100 then
						for i,v in pairs(GetNpcANYINMIDIAN().data.scene3.sceneId3) do 
							if v==sceneId then 
								sameSceen =true
							end
						end
					elseif t[var.RiChangRenWuIndex].mapId== 98 then
						for i,v in pairs(GetNpcANYINMIDIAN().data.scene1.sceneId1) do 
							if v==sceneId then 
								sameSceen =true
							end
						end
					end
			
					if t[var.RiChangRenWuIndex].mapId == sceneId or sameSceen ==true then 
						var.RiChangRenWuKillMonsters = var.RiChangRenWuKillMonsters+1
						if var.RiChangRenWuKillMonsters >= t[var.RiChangRenWuIndex].monsterNum then
							--控制只在第一次完成的时候弹出
							local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
							if pLv<=73 and var.RiChangRenWuKillMonsters == t[var.RiChangRenWuIndex].monsterNum then
								WhenFinishRichangchumo(sysarg)
							end
							var.RiChangRenWuKillMonsters = t[var.RiChangRenWuIndex].monsterNum
							var.RiChangRenWuFinish = 1--完成任务
							

						end
						Quest_ShuaXin(sysarg)
					end
				end
			end
		end
	end

---------------------------------------------------------------------------------材料副本杀怪
	local nowSceneId = Actor.getSceneId(sysarg)
	if (nowSceneId>=91 and nowSceneId<=97 or nowSceneId==427 or nowSceneId==643 or nowSceneId==649 or nowSceneId==665 or nowSceneId==696)and (nowSceneId == Actor.getSceneId(monster)) then 
		OnKillFubenMonster(sysarg)
	end
	
	
----------------------------------------------------------------------------------个人副本杀怪
	local fubenid = Actor.getFubenId(sysarg)
	for _,v in ipairs(GameFubenCfg.fubenList) do
		if v.fubenId == fubenid  and Actor.getSceneId(monster) ==sceneId then 
			local nMonsterNum = Fuben.getMonsterNum(sysarg)	
			local netPack = DataPack.allocPacket(sysarg, 139,125)
			DataPack.writeByte(netPack, nMonsterNum)
			DataPack.flush(netPack)	
		end
	end

---------------------------------------------------------------------------成长装备相关
	--此列表地图内杀怪不计算成长装备值. 目前就是新手村,威龙城,转生前的野外地图都在以内了


	local GrowthEquipCfgEx = {}
	for i = 1,table.getn(GrowthEquipCfg) do
		GrowthEquipCfgEx[GrowthEquipCfg[i][1]] = GrowthEquipCfg[i]
	end
	for i =0,49 do --itMaxEquipPos

		local GrowNoMap = {1,3,4,5,6,7,8,9,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};
		local GrowNo = 0;
		for j = 1,#GrowNoMap do
			if GrowNoMap[j] == sceneId and i ~= 0 then
				GrowNo = 1;
			end
		end

		local pEquip = Item.getEquipByPos(sysarg, i);
		if i == 0 then
			GrowNo = 0;
		end
		--print(string.format("i:%s,GrowNo:%s",i,GrowNo))
		if pEquip ~= nil then
			local nItemId = Item.getItemProperty(sysarg,pEquip,Item.ipItemID)
			if GrowthEquipCfgEx[nItemId] ~= nil and GrowNo == 0 then
			
				local nMaxGrowExp = GrowthEquipCfgEx[nItemId][3]
				local nCurrGrowExp = Item.getItemProperty(sysarg,pEquip,Item.ipItemForgeProperty1Value)
				nCurrGrowExp = nCurrGrowExp + 1
				if nCurrGrowExp >= nMaxGrowExp then
					nCurrGrowExp = 0
					Item.setItemProperty(sysarg,pEquip,Item.ipItemID,GrowthEquipCfgEx[nItemId][2])
					Actor.collectOperate(sysarg,0); -- 重新计算角色属性
					Actor.sendTipmsg(sysarg, string.format("恭喜您的成长装备[%s]成功升级为[%s]", Item.getItemName(nItemId), Item.getItemName(GrowthEquipCfgEx[nItemId][2])), 256);
				else
					Actor.sendTipmsg(sysarg, string.format("[%s]<(c0xFFb90303)增加> <(c0xFF00FF00)%s(%s/%s)成长经验>",Item.getItemName(nItemId),1, nCurrGrowExp,nMaxGrowExp ), 1);
				end
				Item.setItemProperty(sysarg,pEquip,Item.ipItemForgeProperty1Value,nCurrGrowExp)
			end
		end
	end


	--杀怪武器升级的配置
--	local upWeapon = {
--						{1,4,18,1},
--						{4,13,40,1},
--						{13,22,54,1},
--						{22,31,75,1},
--						{31,40,81,1},
--						{40,49,165,1},

--	};

--	local pWeapon = Item.getEquipByPos(sysarg, 0); --佩戴的武器升级的
--	local WeaponId;
--	if pWeapon then
--		WeaponId = Item.getItemProperty(sysarg, pWeapon, Item.ipItemID, 0);
--		local WeaponName = Item.getItemName(WeaponId);
--		for i = 1,#upWeapon do
--			if WeaponId == upWeapon[i][1] then
--				if get_d_val(sysarg, 8) < upWeapon[i][3]-1 then
--					add_d_val(sysarg, 8, 1);
--					Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)增加> <(c0xFF00FF00)%s(%s/%s)武器成长经验>", 1, get_d_val(sysarg, 8), upWeapon[i][3]), 1);
--				else
--					if Item.getBagEmptyGridCount(sysarg) > 0 then
--						local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
--						set_d_val(sysarg, 8, 0);
--						Item.removeEquip(sysarg, pWeapon);
--						local pNewItem = Item.createItem(upWeapon[i][2],1,0,0,upWeapon[i][4]);
--						-- if nJob == 3 then
--						-- 	Item.setItemProperty(sysarg,pNewItem,ipTaoStrong,6);
--						-- end
--						Item.addItem(sysarg,pNewItem,"武器成长",2617);
--						Actor.useItem(sysarg,pNewItem);
--						Actor.collectOperate(sysarg,0); -- 重新计算角色属性
--						Actor.sendTipmsg(sysarg, string.format("恭喜您的成长武器[%s]成功升级为[%s]", WeaponName, Item.getItemName(upWeapon[i][2])), 256);
--					end
--				end
--				break;
--			end
--		end
--	end

--	--杀怪首充武器升级的配置
--	local upWeaponEx = {

--						{3624,3625,5000,1},--神龙·裁决审判Lv1
--						{3625,3626,10000,1},--神龙·裁决审判Lv2
--						{3626,3627,20000,1},--神龙·裁决审判Lv3
--						{3627,3628,50000,1},--神龙·裁决审判Lv4

--						{3629,3630,100000,1},--神龙·圣界怒斩Lv1
--						{3630,3631,200000,1},--神龙·圣界怒斩Lv2
--						{3631,3632,300000,1},--神龙·圣界怒斩Lv3
--						{3632,3633,500000,1},--神龙·圣界怒斩Lv4


--						{3634,3635,5000,1},--伏魔·龙骨权杖Lv1
--						{3635,3636,10000,1},--伏魔·龙骨权杖Lv2
--						{3636,3637,20000,1},--伏魔·龙骨权杖Lv3
--						{3637,3638,50000,1},--伏魔·龙骨权杖Lv4

--						{3639,3640,100000,1},--伏魔·圣界龙牙Lv1
--						{3640,3641,200000,1},--伏魔·圣界龙牙Lv2
--						{3641,3642,300000,1},--伏魔·圣界龙牙Lv3
--						{3642,3643,500000,1},--伏魔·圣界龙牙Lv4


--						{3644,3645,5000,1},--灵兽·龙纹道意Lv1
--						{3645,3646,10000,1},--灵兽·龙纹道意Lv2
--						{3646,3647,20000,1},--灵兽·龙纹道意Lv3
--						{3647,3648,50000,1},--灵兽·龙纹道意Lv4

--						{3649,3650,100000,1},--灵兽·圣界逍遥Lv1
--						{3650,3651,200000,1},--灵兽·圣界逍遥Lv2
--						{3651,3652,300000,1},--灵兽·圣界逍遥Lv3
--						{3652,3653,500000,1},--灵兽·圣界逍遥Lv4

--	};

--	pWeapon = Item.getEquipByPos(sysarg, 49); --佩戴的首充武器升级的
--	if pWeapon then
--		WeaponId = Item.getItemProperty(sysarg, pWeapon, Item.ipItemID, 0);
--		local WeaponName = Item.getItemName(WeaponId);
--		for i = 1,#upWeaponEx do
--			if WeaponId == upWeaponEx[i][1] then
--				if get_d_val(sysarg, 117) < upWeaponEx[i][3]-1 then
--					add_d_val(sysarg, 117, 1);
--					Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)增加> <(c0xFF00FF00)%s(%s/%s)武器成长经验>", 1, get_d_val(sysarg, 117), upWeaponEx[i][3]), 1);
--				else
--					if Item.getBagEmptyGridCount(sysarg) > 0 then
--						local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
--						set_d_val(sysarg, 117, 0);
--						Item.removeEquip(sysarg, pWeapon);
--						local pNewItem = Item.createItem(upWeaponEx[i][2],1,0,0,upWeaponEx[i][4]);
--						-- if nJob == 3 then
--						-- 	Item.setItemProperty(sysarg,pNewItem,ipTaoStrong,6);
--						-- end
--						Item.addItem(sysarg,pNewItem,"首充武器成长",2617);
--						Actor.useItem(sysarg,pNewItem);
--						Actor.collectOperate(sysarg,0); -- 重新计算角色属性
--						Actor.sendTipmsg(sysarg, string.format("恭喜您的首充武器[%s]成功升级为[%s]", WeaponName, Item.getItemName(upWeaponEx[i][2])), 256);
--						System.broadcastTipmsg(string.format("恭喜<(n%s)>的首充成长武器升级为[%s].", Actor.getName(sysarg), Item.getItemLinkMsg(upWeaponEx[i][2])), 128);
--					end
--				end
--				break;
--			end
--		end
--	end
---------------------------------------------------------------------------采集怪
	if entityType == 12 and monsterType ~= 10 then -- monsterType == 10 为 boss尸体
		for i,v in ipairs (CollectingMonsterCfg) do 
			if v.monsterid == monId then 
				OnKillTheCollection(sysarg,i,sceneId,Actor.getHandle(monster))
				break
			end
		end
	end


--------------------------------------------------------------------------------秦始皇陵
	if sceneId >=266 and sceneId <= 268 then 
		local nHandle = Fuben.getSceneHandleById(sceneId, 0)
		if Fuben.getLiveMonsterCount(nHandle) == 0 then 
			Actor.sendTipmsg(sysarg,"当前地图怪物已经全部被清除.",ttFlyTip)
		else 
			Actor.sendTipmsg(sysarg,string.format("当前地图剩下%s只怪物.",Fuben.getLiveMonsterCount(nHandle)),ttFlyTip)
		end
	end


-------------------------------------------------------------------------------秘境之旅
		if sceneId >=220 and sceneId<=229 then 
			MiJingZhiLv_OnMonsterByKilled(monster, sysarg, monId, monsterType,sceneId)
		end
		
--------------------------------------------------------------------------------饕餮
		if sceneId == 318 then 
			TTSDKillmonster()
		end

------------------------------------------------------荒古怪处理
	if string.find(SceneName,"荒古") then
		local hgdata = {
			map = {279,280,281,282,283,284,285,286},
			mon = {628,658,629,659,630,660,631,661,632,662,633,663,634,664,635},
		};
		for i = 1,#hgdata.mon do
			if monId == hgdata.mon[i] then
				local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
				local addVal = 0;
				if monsterType == 4 then
					addVal = pLv * 80;
				else
					addVal = pLv * 10;
				end
				local nCurrMana = Hero.getHeroMana(sysarg);
				nCurrMana = nCurrMana + addVal;
				if nCurrMana > 4294967295 then
					nCurrMana = 4294967295
				end
				Hero.setHeroMana(sysarg, nCurrMana);

				local str = string.format("<获得> <(c0xFF00FF00)%s%s>", tostring(addVal), "战将灵力");
				Actor.sendTipmsg(sysarg, str, 1);
			end
		end
	end
--------------------------------------------------------------------------------开服活动的击杀boss
	if monsterType == 4 then --是boss
		local openDay = System.getDaysSinceOpenServer()
		local itemCfg = OpenServerAward[7].list[1].boss
	
		if openDay<=7 then 
			for _,v in pairs(itemCfg) do 
				if v.id == monId then --击杀对了
					if var.qmBoss == nil then 
						var.qmBoss =0
					end
					local data = var.qmBoss
					data = System.setIntBit(data, (v.index-1), true)
					var.qmBoss =data
					System.broadcastTipmsg(string.format("<(n%s)>完成了新区全民BOSS活动,击杀了BOSS:<%s>.",Actor.getName(sysarg), v.name ),ttChatWindow);
					--print("data="..data)
					local svar = System.getDyanmicVar(sysarg);
					if svar.qmBossTime == nil then svar.qmBossTime={} end
					if svar.qmBossisKill == nil then svar.qmBossisKill={} end --0为生存，1为被杀
					svar.qmBossTime[v.id]=v.times
					svar.qmBossisKill[v.id]=1
					local bossSave = System.getStaticVar()
					if bossSave.qmBossNextTime == nil then bossSave.qmBossNextTime = {} end
					bossSave.qmBossNextTime[v.id] = System.getCurrMiniTime() + v.times * 60
					System.saveStaticVar()
				end
			end
		end
		
		
		--boss首杀
		if openDay<=7 then 
			local Cfg2 = OpenServerAward[11].list
			for index,v in pairs(Cfg2) do 
				for _,w in pairs(v.bossId) do 
					if w == monId then --击杀对了
						
						--开启天数未够，不算首杀
						if  v.openDay~=nil then 
							if openDay < v.openDay then 
								break
							end
						end
						
						--是否被杀了
						local sysVar = System.getStaticVar()
						if sysVar.OpenSeverFirstKill ==nil then 
							sysVar.OpenSeverFirstKill = {}
						end
						if sysVar.OpenSeverFirstKill[index]==nil then  --首杀
							if var.OSFirstKill==nil then 
								var.OSFirstKill={}
							end
							var.OSFirstKill[index]=1
							
							sysVar.OpenSeverFirstKill[index] = Actor.getName(sysarg)
							
							--恭喜xx玩家成为首次击败XXBOSS的大神,荣获至高荣誉~ 我也要去 
							System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家成为首次击败%sBOSS的大神,荣获至高荣誉",Actor.getName(sysarg),v.name),ttScreenCenter + ttChatWindow)
							
						end
					end
				end
			end
		end
		
		-- 变态版boss首杀
		if openDay >= 1 and openDay <= 7 then
			local sysVar = System.getStaticVar()
			if sysVar.OpenSeverBossFirstKills == nil then 
				sysVar.OpenSeverBossFirstKills = {}
			end
						
			for _, bossGroup in ipairs(EquipRecyclingCfg.firstKillBossList) do
				for _, v in ipairs(bossGroup) do
					if v.bossId == monId then
						if sysVar.OpenSeverBossFirstKills[monId] == nil then -- 首杀
							sysVar.OpenSeverBossFirstKills[monId] = Actor.getName(sysarg)
							
							-- 发奖励
							local killerActorId = Actor.getUIntProperty(sysarg, PROP_ENTITY_ID)
							System.AddMail(killerActorId,6,0,"BOSS首杀","BOSS首杀奖励",0,0,v.mailAward)
							
							local bossName = v.bossName
							if bossName == nil then bossName = "" end
							System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家成为首次击败%sBOSS的大神,荣获至高荣誉",Actor.getName(sysarg), bossName),ttScreenCenter + ttChatWindow)
						end
					end
				end
			end
		end
	end
---------------------------------------------------------------------------
	--统计杀怪总数
	var.killMonsterNum = var.killMonsterNum or 0 
	if var.killMonsterNum < 200000000 then
		var.killMonsterNum = var.killMonsterNum + 1
		Actor.triggerAchieveEvent(sysarg, 97,var.killMonsterNum)
		
		--local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sAskAchieveKillBoss)
		--DataPack.writeByte(pack,0) 
		--DataPack.writeUint64(pack,var.killMonsterNum) 
		--DataPack.flush(pack)
	end

	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	local mLv = Actor.getIntProperty(monster,PROP_CREATURE_LEVEL);

	local bossMaxHp = Actor.getIntProperty(monster,PROP_CREATURE_MAXHP)
	if monsterType == 4 and mLv >= 100 and bossMaxHp >= 1000000 then
		local bossRewardLevel = mLv
		if bossRewardLevel > 200 then bossRewardLevel = 200 end
		local vipPointReward, yuanGuReward, nLuckRate, bLuckyTriggered, bLuckyExtraTriggered = GetBossKillPayMoneyReward(bossRewardLevel, bossMaxHp)
		local bossName = System.getMonsterNameById(monId) or Actor.getName(monster)
		BossKillPayMoney(sysarg, vipPointReward, yuanGuReward, bossName, SceneName, nLuckRate, bLuckyTriggered, bLuckyExtraTriggered)
	end


	--支线任务的一些判断 暂时不支持同时两个支线  hwei
	if var.BranchTaskKillMonsterStart and var.BranchTaskKillMonsterStart == 1 then
		if var.BranchTaskKillMonsterScene == nil or var.BranchTaskKillMonsterScene == sceneId then  -- 如果需要判断场景特定怪物的
			if var.BranchTaskillMonsterCount == nil then
				var.BranchTaskillMonsterCount = 0
			end
			if var.BranchTaskillMonsterLimit == nil then
				var.BranchTaskillMonsterCount = var.BranchTaskillMonsterCount + 1
			else
				for i=1,#var.BranchTaskillMonsterLimit do
					if var.BranchTaskillMonsterLimit[i] == monId then
						var.BranchTaskillMonsterCount = var.BranchTaskillMonsterCount + 1
						Quest_ShuaXin(sysarg)
					end
				end
			end
		end
	end
	
	--镖车被杀
    --离线镖车被杀
   
    local nBCActorId = Actor.getBCMonsterOwnerId(monster)
   
    if nBCActorId > 0  then
        --离线的情况下
         local sysVar = System.getStaticVar()
         for i =1,sysVar.officebiaoche.count do
            if sysVar.officebiaoche.l[i] ~= nil  and sysVar.officebiaoche.l[i].id == nBCActorId then
                sysVar.officebiaoche.l[i].time = 0
                sysVar.officebiaoche.l[i].tag = 2
                sysVar.officebiaoche.l[i].bcHandle = 0
                break
            end
        end
         local player = System.getEntityPtrByActorID(nBCActorId)
         if player == nil then
             OnActorDartFailed(nil, StdActivityCfg.DuoBeiYaSong.DartSetup.CampDartFailObjDie,sysarg,monster)
         else
            player = Actor.getMonsterOwner(monster)
         
	        local ownerVar = Actor.getStaticVar(player)
	        local killname = Actor.getName(sysarg)
	        if ownerVar and ownerVar.ybstate ~= nil and ownerVar.ybstate == 1 then
               
		        -- 记录当前位置
		        local x, y = Actor.getEntityPosition(monster, 0, 0)		--获取实体X Y坐标
		        ownerVar.bcposx = x;
		        ownerVar.bcposy = y;
	        --	if var.buybx == 1 then
	        --		Actor.monsterRealDropItemExp(pKill, sysarg);
	        --	end
		        --因为是镖车被杀，C++内部会自动删除这个镖车，所以ResetActorDartInfo()的第二个参数不能是false，以避免两次删除同一个实体造成出错
		        --第5个参数bDelayDestroy要为true,不能是false
		        OnActorDartFailed(player, StdActivityCfg.DuoBeiYaSong.DartSetup.CampDartFailObjDie,sysarg,nil,true)
		        Quest_ShuaXin(player);
	        end
         end
        
    end

   
	
	
	--声望活动杀怪
	local prestige = {{120,1},{121,5},{122,20}}
	for i = 1 ,#prestige do
		if prestige[i][1] == monId then
			if d[12] then
				d[12] = d[12] + prestige[i][2]
				Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf130,Actor.getName(monster),prestige[i][2],d[12]),ttFlyTip)
				break
			else
				d[12] = prestige[i][2]
				Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf130,Actor.getName(monster),prestige[i][2],d[12]),ttFlyTip)
				break
			end
		end
	end
	
	--杀死黑龙魔君
	if monId == TreasureBossCfg.bossId then
		StartMoneyActivity()
		--System.broadcastTipmsg(Lang.ScriptTips.zf174,128+2)
	end
	
	--屠魔圣殿
	local FubenID = Actor.getFubenId(sysarg)
	if FubenID == 65 then
		local EMoLingMonster = var.EMoLingMonster
		if EMoLingMonster ~= nil then
			EMoLingMonster = EMoLingMonster + 1
		else
			EMoLingMonster = 1
		end		
		var.EMoLingMonster = EMoLingMonster

		Actor.changeActivityProgress(sysarg,-2,EMoLingMonster,-2,-2)
	end

--	if FubenID == 5 then
--		local nLilian = 0
--		if monId >= 96 and monId <= 99 then
--			nLilian = 1000
--		elseif monId == 148 then
--			nLilian = 5000
--		end

--		if nLilian > 0 then
--			Actor.addAchievePoint(sysarg, nLilian)			
--			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf684,nLilian),ttFlyTip)
--		end
--	end

	-- 更新前端副本小窗口界面的剩余怪物数量
	--if (FubenID >= 3 and FubenID <= 10) or FubenID == 100 then
	--	local nMonsterNum = Fuben.getMonsterNum(sysarg)	
	--	local netPack = DataPack.allocPacket(sysarg, 139,125)
	--	DataPack.writeByte(netPack, nMonsterNum)
	--	DataPack.flush(netPack)	
	--end
	
	if FubenID ~= 0 and FubenID == challenge_fuben_cfg.fubenId then
		challenge_fb_OnMonsterByKilled(monster, sysarg)
	end
	
	--挑战BOSS
	local nIndex = 0
	local config = ChallengeBossConfig.ChallengeBoss.BossInfo
	for Index,BossConfig in ipairs(config or {}) do
		if BossConfig.FuBenId == FubenID and BossConfig.BossId == monId then
			nIndex = Index
			break
		end
	end

	if nIndex > 0 then
		if not var.days.FinishChallengeBoss then
			var.days.FinishChallengeBoss = {}
		else
			var.days.FinishChallengeBoss[nIndex] = 1
		end
		if Awards.CheckBagGridCount(sysarg,config[nIndex].award) then
			Awards.Give(sysarg,config[nIndex].award,980,"挑战副本BOSS奖励")
			local awardName = {"绑金*%d,","灵珠碎片*%d  "}
			local str = ""
			for _,awardType in ipairs(config[nIndex].award) do
				if awardType.type == 5 then
					str = str .. string.format(awardName[1],awardType.count)
				elseif awardType.type == 42 then
					str = str .. string.format(awardName[2],awardType.count)
				end
			end
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf206,str),2048)
		end
		SendAllChallengeBossInfo(sysarg)
	end
	
	--护送公主死亡
	--if fubenId == 99 and  monId == 407 then
	--	local actorList = LuaHelp.getFbActorList(fuBenPtr)
	--	for k, ptr in ipairs(actorList or {}) do
	--		Actor.messageBox(ptr,0,0,"公主已死亡,护送失败","离开副本/TeamReturnCity",NULL,NULL)
	--	end
	--end
	
	--[[ 屏蔽双蛋活动
	local nDoubleEgg = false
	local nYear,nMonth,nDate = System.getDate();
	if (nMonth == 12 and nDate >= 25) or (nMonth == 1 and nDate <= 3) then
		nDoubleEgg = true
	end
	--]]
	
	--检测杀死地图BOSS
	-- 为了效率,先检查杀的是否 BOSS
  
	if monsterType == 4 then
        --王城基金-怪物等级*1
        local sVar = System.getStaticVar()
        if sVar.wangchengMoney == nil then  sVar.wangchengMoney = 0 end
        sVar.wangchengMoney = sVar.wangchengMoney + mLv * 1
		if sVar.wangchengMoney >= 10000000 then 
			sVar.wangchengMoney = 10000000
		end
        ---------------------------------------------------------
		for _, boss in ipairs(ModBossConfig) do                                    --7.杀BOSS获得BOSS积分的这个暂时屏蔽掉, 我们暂未开启这个BOSS兽魂的功能  tzh 
			if boss.BossId == monId and boss.award ~= nil and boss.award[1] ~= nil   and boss.award[1].type ~= 36  then
				--暂时屏蔽给予兽魂 2016.9.18 hwei
		--		Awards.Give(sysarg,boss.award,GameLog.cKillBossAward,"击杀BOSS奖励")
				
				
				--local str = string.format(Lang.ScriptTips.zf239,Actor.getName(sysarg),System.getMonsterNameById(monId),boss.award[1].count,boss.award[2].count)
				local str = string.format(Lang.ScriptTips.zf239,Actor.getName(sysarg),System.getMonsterNameById(monId),boss.award[1].count)
				
				System.broadcastTipmsg(str,2)
				Actor.sendTipmsg(sysarg,str, 2048)
				--[[
				--双蛋活动
				if nDoubleEgg then
					local var = Actor.getStaticVar(sysarg)
					if not var.DoubleEggBossScore then
						var.DoubleEggBossScore = 0
					end
					var.DoubleEggBossScore = var.DoubleEggBossScore +  boss.Alchemy
				end
				--]]
				break
			end
		end
	end

	--个人BOSS杀死
	-- 为了效率,先检查杀的是否 BOSS
	if monsterType == 4 then
		for _, singleBoss in ipairs(SingleBossCfg) do
			if singleBoss.BossId == monId then
				Awards.Give(sysarg,singleBoss.award,GameLog.cKillBossAward,"击杀BOSS奖励")
				--[[ 屏蔽消息Lang.ScriptTips.zf239
				local str = string.format(Lang.ScriptTips.zf239,Actor.getName(sysarg),System.getMonsterNameById(monId),singleBoss.award[1].count)
				System.broadcastTipmsg(str,2)
				Actor.sendTipmsg(sysarg,str, 2048)
				--]]
				break
			end
		end
	end
	
	--野外boss被杀死
	-- 为了效率,先检查杀的是否 BOSS
	if monsterType == 4 then
		for _, outsideBoss in ipairs(ModBossConfig) do
			if outsideBoss.BossId == monId then
				local sVar = System.getStaticVar()
				if sVar.outsideBossKilledTime==nil then sVar.outsideBossKilledTime={} end
				sVar.outsideBossKilledTime[outsideBoss.BossId] = System.getCurrMiniTime()
			end
		end
	end

	--行会争霸刷BOSS给胜利行会
	--if monId >= 417 and monId < 426 then
	--	local hScene = Fuben.getSceneHandleById(142, 0)
	--	local pMonster = Fuben.createMonster(hScene, monId+1, 51, 46,0)
	--	local playerList = LuaHelp.getSceneActorListById(142)
	--	for _,player in ipairs(playerList or {}) do
	--		if monId ~= 425 then
	--			Actor.sendTipmsg(player, string.format(Lang.Activity.w00120,System.getMonsterNameById(monId+1)), 2048)
	--		else
	--			Actor.sendTipmsg(player, string.format(Lang.Activity.w00121,System.getMonsterNameById(monId+1)), 2048)
	--		end
	--	end
	--end

	if sceneId >= 53 and sceneId <= 56 then
		if (monId >= 315 and monId <= 333) or (monId >= 340 and monId <= 341) then
			if not var.CelestineNum then
				var.CelestineNum = 0
			end
			if var.CelestineNum >= 100 then
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf256,ttFlyTip)
				return
			end
			var.CelestineNum = var.CelestineNum + 1
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf255,var.CelestineNum),ttFlyTip)
		end
	end
	
	--for _, monsterCfg in ipairs(CoinMonster) do
	--	if monsterCfg.monsterId == monId then
	--		local nRandomCoin = math.random(unpack(monsterCfg.coinNum))
	--		Actor.giveAward(sysarg,5,0,nRandomCoin,0,0,0,0,1012,"金钱副本获得绑金")
	--		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf281,nRandomCoin),ttFlyTip)
	--		break
	--	end
	--end
	
	if sceneId == 171 and (monId >= 439 and monId <= 441) then
		local nAward = {2,3,5}
		local awardVal = nAward[monId - 439 + 1]
		
		local val = Actor.getUIntProperty(sysarg, PROP_ACTOR_SHIELD_SPIRIT)
		Actor.setUIntProperty(sysarg, PROP_ACTOR_SHIELD_SPIRIT, val + awardVal)
		
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf291,awardVal,val + awardVal),ttFlyTip)
	end
		
	--击杀BOSS成就
	if monsterType == 4 then
		if var.killBossN == nil then
			var.killBossN = 0
		end
		var.killBossN = var.killBossN + 1
		Actor.triggerAchieveEvent(sysarg, 112,var.killBossN )
		
		--local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sAskAchieveKillBoss)
		--DataPack.writeByte(pack,1) 
		--DataPack.writeUint64(pack,var.killBossN) 
		--DataPack.flush(pack)
		
		--神威狱杀怪
		local shenWeiYuBossbossId = {
					290,
					293,
					296,
					299,
					302,
					306,
					309,
					312,
					315,
					575,
				}
		for i=1,#shenWeiYuBossbossId do 
			if shenWeiYuBossbossId[i] ==monId then 
				System.trace("shenweiyu kill boss in the world"..monId)
				jmzc_OnMonsterByKilled(monster, sysarg, monId, monsterType)
			end
		end
	
	end
	--成就
	--[[if monId >= 339 and monId <= 341 then
		local achvKillTimes = GetActorVarAchieveData(sysarg, 1, 4 + monId-339)
		achvKillTimes = achvKillTimes + 1
		SetActorVarAchieveData(sysarg, 1, 4 + monId-339, achvKillTimes)
		Actor.triggerAchieveEvent(sysarg, 111, monId, achvKillTimes)
	end]]--	
	
	if sceneId == wangling_cfg.scene_id then -- 王陵
		wangling_on_monster_by_Killed(monster, sysarg, monId, sceneId)
	end
	if sceneId >= 216 and sceneId<= 218 then -- 奔跑吧兄弟
		pbpxd_OnMonsterByKilled(monster, sysarg, monId, monsterType,sceneId)
	elseif sceneId == 66 then -- 阵营战
		camp_battle_OnMonsterByKilled(monster, sysarg, monId, monsterType)
	--elseif (sceneId >= 111 and sceneId <= 118 )or  sceneId == 120 or sceneId == 121 then -- 巨魔之巢活动
	--	jmzc_OnMonsterByKilled(monster, sysarg, monId, monsterType)
	end
	
	OneHundredKillMonster(sysarg)
	
	--开服活动:击杀BOSS
	if monsterType == 4 then
		OnOpenServerKillBoss(sysarg,monId)
	end
	--补刀王
    if monId == 666 then
        local sVar = System.getStaticVar()
        local titleid =24
        if sVar.bdking ~= nil then
           
            local bdkptr = System.getEntityPtrByActorID(sVar.bdking)
            if bdkptr ~= nil then
                Actor.setTopTitle(bdkptr,titleid,false)
            end
        end
        sVar.bdking = Actor.getUIntProperty(sysarg,PROP_ENTITY_ID)
        
        Actor.setTopTitle(sysarg,titleid,true)
        --玩家使出浑身解数,释放了最强一击将世界BOSS击杀,为此获得补刀王称号
        System.broadcastTipmsg(string.format("<(n%s)>玩家使出浑身解数,释放了最强一击将世界BOSS击杀,为此获得补刀王称号!",Actor.getName(sysarg)),ttScreenCenter + ttChatWindow)
    end
    --行会boss活动
    if sceneId == GuildBossCfgEx.MapID then
        System.addTimer("OnExitGuildBossMapCountDown", 60 * 1000 * 3 - 10000, -1) --二分50秒退出地图
        System.addTimer("OnExitGuildBossMap", 60 * 1000 * 3 , -1) --三分钟后退出地图
       
       
    end

    --沙巴克雕像被击杀后
    if sceneId == 10 and monId == 714 then
        System.broadcastTipmsg("震惊！守城雕像竟然被打爆,皇宫大门已开！今日攻城之战看来免不了一场大战了！",ttChatWindow + ttScreenCenter)
        --清除投石车
        local hScene = Fuben.getSceneHandleById(sceneId, 0)  --获得场景句柄 普通场景0
        Fuben.clearMonster(hScene,778)
    end

    --投石车被击杀后掉落10个50元宝
    if sceneId == 10 and monId == 778 then
         for i = 1,10 do
            Item.createDropMoneyItem(monster,mtYuanbao,50,LogIds.dropsbkweapon,"投石车被击杀",nil)
        end
    end
    
    --行会镖车被击杀
    if monId == 779 then
        local sVar = System.getDyanmicVar()
        if sVar.guildChe ~= nil and Actor.getHandle(monster) == sVar.guildChe.Ptr then
            
            local nGuildId = Actor.getGuildId(sysarg)
            if nGuildId > 0 then
                sVar.guildChe.win = nGuildId --记录行会镖车获胜的镖车
                sVar.guildChe.Ptr = nil   
                local str = " 震惊！！%s行会竟然…爆发了惊人实力,掠夺了由王城行会护送的皇家镖车,其行会会长<(n%s)>获得"..GuildBiaoCheCfg.GongXuan.."点功勋值,其行会成员均获得"..GuildBiaoCheCfg.GongXuan.."功勋值!劫镖奖励请到王城九殿下处领取.<(x热血王城:90:43:[传])>"
                local szGuildName = Guild.getGuildName(nGuildId)
                local szGuildLeader = Guild.getGuildLeaderName(nGuildId)
                System.broadcastTipmsg(string.format(str,szGuildName,szGuildLeader),ttChatWindow)
                System.sendCommonLog(GameLog.cGuildBiaoChe,sVar.guildChe.masterId,Actor.getName(sysarg),0,0,0,"失败,被击杀");
                sVar.guildbiaochegive = 1 
                --被其他行会击杀也掉落元宝
                local nCount = GuildBiaoCheCfg.YuanBao / 100
                for i = 1,nCount do
                    Item.createDropMoneyItem(monster,mtYuanbao,100,LogIds.guildchedrop,"行会镖车爆炸",nil)
                end
            else
                EndGuildBiaoChe(monster)
            end

        end
    end
    ---------------------------------怒刷白猪
--    local cfg = StdActivityCfg.QuanFuShuangBei.refresh
--    if Actor.getSceneId(sysarg) == cfg.sceneid and monId  == cfg.monid then
--        local dVar = System.getDyanmicVar()
--        if dVar.QFDoubleExpTime ~= nil and dVar.baizhuHandle ~= nil then
--            local handle = Actor.getHandle(monster)
--            for i = 1,table.getn(cfg.point) do
--                if handle == dVar.baizhuHandle[i].handle then
--                    local hScene = Fuben.getSceneHandleById(cfg.sceneid, 0)
--                     local pMonster = Fuben.createMonster(hScene, cfg.monid, cfg.point[i].x, cfg.point[i].y, 0)
--                     dVar.baizhuHandle[i].handle = Actor.getHandle(pMonster)
--                    break
--                end
--            end
--        end
--    end
	--------------------------------------------------------勇闯天关
	onKilMonsterInYongZheChuangGuang(sysarg,monId)
	
	onKilMonsterInTongTianTa(sysarg,monId)  ---通天塔
    
	--军魂之地boss击杀
    MkzKillMonster(sysarg,monId)
	--屏蔽屠魔印记
	--OnOpenServerKillBossAddBuff(sysarg,monId)
	
	--单挑boss里面杀怪----------------------------------------------------------------------------------------------------------
	local var = Actor.getStaticVar(sysarg) 
	local curFBId = Actor.getFubenId( sysarg )
	for j=1,#kill_boss_cfg do 
		if curFBId==kill_boss_cfg[j].fubenId then 
			for i=1,#kill_boss_cfg do 
				if kill_boss_cfg[i].BossId==monId then 
					
					--杀boss的时候才算他一次次数
					--if var.kill_boss_flags==nil then
					--	var.kill_boss_flags =0
					--end
					if var.kill_boss_flags1==nil then
						var.kill_boss_flags1 =0
					end
					
					var.kill_boss_flags1 = var.kill_boss_flags1+1
					--var.kill_boss_flags = System.setIntBit(var.kill_boss_flags, i-1, true)
					
					local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sKillBoss)
					DataPack.writeByte(netPack,0)
					--DataPack.writeInt(netPack,var.kill_boss_flags)
					DataPack.writeInt(netPack,var.kill_boss_flags1)
					DataPack.flush(netPack)
					
					System.sendCommonLog(LogIds.dantiaofubentongguan,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,i.."单挑boss通关")
					
					--告诉前端怪物已经杀死，倒计时出来
					local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sKillBoss)
					DataPack.writeByte(netPack,2)
					DataPack.flush(netPack)
					break 
				end
			end
		end
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	
	--处理最后的一个特殊任务杀怪
	if monsterType == 4 then
		if var.betonSHENJIAFinish ~=nil and var.betonSHENJIAFinish==1 and (pLv >=82 or var.speicltaskKM ~=nil)then --在这个任务状态中
			local monsterLv = Actor.getIntProperty(monster,PROP_CREATURE_LEVEL)
			if monsterLv >=76 then 
				if var.speicltaskKM ==nil or var.speicltaskKM==0 then 
					var.speicltaskKM = 1
				else 
					var.speicltaskKM = var.speicltaskKM +1
					if var.speicltaskKM>=5 then 
						var.speicltaskKM=5
					end
				end
				Quest_ShuaXin(sysarg)
			end	
		end
	end
	
	--在跨服服务器里面杀怪！！！
	if System.isCrossServer() ==true then
		--if sceneId >= 403 and sceneId <= 412 and monsterType == 4 then --是boss
		--之后会加分流地图先屏蔽地图限制
		if  monsterType == 4 then --是boss
			--屠魔点
			local kuafuTMDian = var.days.kuafuTMDian
			
			if kuafuTMDian == nil then
				var.days.kuafuTMDian = 300 - 100 --初始化就有300点
			elseif kuafuTMDian > 0 then
				--每杀一只怪物,减少100屠魔点
				kuafuTMDian = kuafuTMDian - 100			
				if kuafuTMDian < 0 then kuafuTMDian = 0	end		
				var.days.kuafuTMDian = kuafuTMDian
			end	
			
			--翻牌次数增加
			if var.days.FanPaiTime==nil then  
				var.days.FanPaiTime=0 
			end	
			var.days.FanPaiTime = var.days.FanPaiTime + 1
	
			local dVar = System.getDyanmicVar()
			if dVar.kfBossBeK==nil then 
				dVar.kfBossBeK={}
			end
			dVar.kfBossBeK[monId] = System.getCurrMiniTime()
			
			local next_refresh_time = System.getCurrMiniTime() + 3 * 60 --远古战场刷怪
			System.YGZC_OnBossDie(sceneId, monId, next_refresh_time, true)
			
			--大吉大利活动消耗屠魔点
			--if (svar.isDringDaJiDaLi ==nil or svar.isDringDaJiDaLi<2 or svar.isDringDaJiDaLi>3)==false then 
					--ClearDaJiDaLi_Data(sysarg)
					if var.days.spendTuMoDianCount==nil then 
						var.days.spendTuMoDianCount=100
					else 
						var.days.spendTuMoDianCount = var.days.spendTuMoDianCount +100
					end
					

			--end
		end
	end
	
	--在四圣宫里面杀怪
	local data = GetNpcSiShengGong().data
	for i=1,#data do 
		if data[i].sceneId ==nBossSceneId then  --场景对应
			if data[i].bossId ==monId then --怪物对应
				--提示i.	Xx(BOSS名称)竟被xx玩家击败,丰富的宝藏掉落了一地!
				System.broadcastTipmsg(string.format("%s竟被<(n%s)>玩家击败，丰富的宝藏掉落一地",data[i].bossName,Actor.getName(sysarg)), 128)
				--判断是否首杀
				local sVar = System.getStaticVar()
				if sVar.siShenGong==nil then 
					sVar.siShenGong ={}
				end
				--首杀
				if sVar.siShenGong[data[i].bossId] ==nil then 

					System.broadcastTipmsg(string.format("<(n%s)>玩家成为了本服首次击杀%s的王者,系统奖励9888元宝!!",Actor.getName(sysarg),data[i].bossName), ttScreenCenter+ttChatWindow)
					
					local strAward = ""
					--local award = data[i].awards[1]
					--strAward = strAward ..award.id..","..award.count..","..award.bind
					--for j=2,#data[i].awards do 
					--	local award = data[i].awards[j]
					--	strAward = strAward.."/"..award.id..","..award.count..","..award.bind
					--end
					
					local actorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
					--print(strAward.."")
					--System.AddMail(actorID,6,0,"首杀boss","尊敬的玩家您好,\\\\恭喜您成为了本服首次击杀"..data[i].bossName.."的王者,特赠大奖一份以此表彰!",0,0,strAward)			
					System.AddMail(actorID,7,0,"首杀boss["..data[i].bossName.."]","尊敬的玩家您好,\\\\恭喜您成为了本服首次击杀"..data[i].bossName.."的王者,系统奖励9888元宝!!",1,0,"3,9888")
				
					local szLocalServer=""
					local nLocalServerId = System.getLocalServerId()
                                   
                    if  nLocalServerId >= 50000 and nLocalServerId <= 59999 then
                        szLocalServer = "不删档"..(nLocalServerId - 50000)
                    else
                        szLocalServer = nLocalServerId
                    end
										
					System.SendPlatformMsg(string.format("<(c0xFF00c0ff)%s区>玩家<(n%s)>首次击杀该服%s,系统奖励9888元宝!!",szLocalServer,Actor.getName(sysarg),data[i].bossName), ttMousePosTip)
					--发送邮件
					sVar.siShenGong[data[i].bossId] = 1
					System.saveStaticVar()
					
					System.sendCommonLog(LogIds.sishenggongFirstKill,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"","",data[i].bossName.."首杀")
				end
			end
		end
	end
	
	--在帮会除魔
	if var.Guild_xycmFlag~=nil and var.Guild_xycmFlag==2 then--接了任务
		if var.Guild_xycmIndex~=nil then --有任务索引
			local cfg2= GuildXiangYaoChuMo_Cfg.ForClient
			local mapId=cfg2[var.Guild_xycmIndex].mapId
			local mid = Actor.getSceneId(sysarg)
			local monsterId= cfg2[var.Guild_xycmIndex].monsterId
			local monsterNumber = cfg2[var.Guild_xycmIndex].monsterNum
			if mapId==mid then --场景对应
				if(monsterId==0 or monsterId==monId) then--怪物对应
					if var.Guild_xycmKillC==nil then 
						var.Guild_xycmKillC=1
					else 
						var.Guild_xycmKillC = var.Guild_xycmKillC+1
					end
					if var.Guild_xycmKillC>cfg2[var.Guild_xycmIndex].monsterNum then --太大要恢复
						var.Guild_xycmKillC=cfg2[var.Guild_xycmIndex].monsterNum
					else --小于或等于，发送信息
						local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sGuildXiangYaoChuMo)
						DataPack.writeByte(pack,1) --杀怪的信息
						if var.Guild_xycmKillC==nil then 
							var.Guild_xycmKillC=0 
						end
						DataPack.writeByte(pack,var.Guild_xycmKillC)	--当前xx只
						DataPack.flush(pack)
						
						Quest_ShuaXin(sysarg)
					end
				end
			end
		end
	end
	
	--杀怪，完成brother任务
	local myBrotherId = Actor.getSocialRelationId(sysarg,7)
	--结义了
	if myBrotherId~=0 then 
		for i=1,#BrotherTasks[1] do
			for j=1,#BrotherTasks[1][i].monsterId do 
				if monId==BrotherTasks[1][i].monsterId[j] then 
					if var.newdays.brotherTaskCon==nil then 
						var.newdays.brotherTaskCon={}
					end
					if var.newdays.brotherTaskCon[1]==nil then 
						var.newdays.brotherTaskCon[1]={}
					end
					if var.newdays.brotherTaskCon[1][i]==nil then 
						var.newdays.brotherTaskCon[1][i]=0
					end
					--还不够，就加上
					if var.newdays.brotherTaskCon[1][i]<BrotherTasks[1][i].needKillCount then 
						var.newdays.brotherTaskCon[1][i]= var.newdays.brotherTaskCon[1][i]+1	
					end
				end
			end
		end
	end
	
	if sceneId == 10 or sceneId == 575 then
    	PalaceFighting_OnMonsterByKilled(monster, sysarg, monId, sceneId)    
    end
	
	--生肖宫殿
	if monId>=1113 and monId<=1125 then 
		System.trace("kill shengxiao bossid:"..monId)
	end
	
	
	--大吉大利活动期间杀怪
	local svar = System.getStaticVar()
	if (svar.isDringDaJiDaLi ==nil or svar.isDringDaJiDaLi<1 or svar.isDringDaJiDaLi>3)==false then 
		
		--killboss
		if monsterType == 4 then
			local monsterLv = Actor.getIntProperty(monster,PROP_CREATURE_LEVEL)
			if monsterLv >=80 then 
				ClearDaJiDaLi_Data(sysarg,8)
				if  var.DJDL_Data.killBoss==nil then 
					var.DJDL_Data.killBoss =1
				else 
					var.DJDL_Data.killBoss = var.DJDL_Data.killBoss +1
				end
			end
		end
		
		--10闯地图
		local cfg =activity_DaJiDaLi.chuangdituGiveAward.Info
		if svar.isDringDaJiDaLi==3 then --第3天开启
			for i=1,#cfg  do 
				local isIn =false
				for j=1,#cfg[i].sceneId do 
					if nBossSceneId==cfg[i].sceneId[j] then 
						isIn=true
					end
					if isIn==true then --在这地图里面杀怪了
						if cfg[i].needBoss==false then 
						end
						if (cfg[i].needBoss==true and monsterType==4) or  cfg[i].needBoss==false then 
							if var.days.djdl_ChuangCount==nil then
								var.days.djdl_ChuangCount={}
							end
							if var.days.djdl_ChuangCount[i]==nil then 
								var.days.djdl_ChuangCount[i]=1
							else	
								var.days.djdl_ChuangCount[i]= var.days.djdl_ChuangCount[i] +1
							end
						end
						break
					end
				end
				
			end
		end
		
		
		--11杀小怪
		cfg = activity_DaJiDaLi.killMonsterGiveAward.Info
		if svar.isDringDaJiDaLi==3 then --第3天开启
			if var.days.djdl_killMonsters==nil then
				var.days.djdl_killMonsters = 1 
			else 
				var.days.djdl_killMonsters = var.days.djdl_killMonsters +1
			end
		end
	end

    --行会boss副本
    HandleGuildFubenBossKill(sysarg, monId, fubenId,monster)
    
    if sceneId == 668 then -- 熊猫林，前端要显示还剩余多少只怪
    	BroadcastXiongMaoLinMonsterCount()
    end
end

--要是是上一次的数据，那就把数据给全清了
function ClearDaJiDaLi_Data(sysarg,n)
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg) 
	--跨服不改变数据
	if System.isCrossServer()==true then 
		return 
	end
	
	if n==nil then n=0 end 
	 
	--if svar.StartDJDLtime ==nil or svar.StartDJDLtime==0 then 
	--	svar.StartDJDLtime = 1
	--end
    --
	--local var = Actor.getStaticVar(sysarg) 
	--if var.DJDLtime ==nil or var.DJDLtime~=svar.StartDJDLtime then --重来就没有参与过/参与的是上一次活动
	--	
	--	
	--	--打印跟踪数据....
	--	if var.DJDLtime==nil then 
	--		var.DJDLtime =0
	--	end
	--	local actorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	--	System.trace(actorid.." clear dajidali date , on the way "..n.."    var.DJDLtime="..var.DJDLtime..",svar.StartDJDLtime="..svar.StartDJDLtime)
	--	
	--	var.DJDLtime = svar.StartDJDLtime
	--	var.DJDL_Data ={} --把所有的数据清了
	--end
	
	if var.DJDL_Data==nil then 
		var.DJDL_Data ={}
	end
	
	--大吉大利还没有开
	if svar.StartDJDL_MiNitime ==nil then 
		return 
	end
	
	if var.DJDL_MiNitime ==nil or var.DJDL_MiNitime~=svar.StartDJDL_MiNitime then 
		
		if var.DJDL_MiNitime==nil then 
			var.DJDL_MiNitime=0
		end
		
		local actorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		System.trace(actorid.." clear dajidali date , on the way "..n.."    var.DJDL_MiNitime="..var.DJDL_MiNitime..",svar.StartDJDL_MiNitime="..svar.StartDJDL_MiNitime)
		
		var.DJDL_MiNitime = svar.StartDJDL_MiNitime
		var.DJDL_Data ={} --把所有的数据清了
	end

end

--要是是上一次的数据，那就把数据给全清了
function ClearOneYear_Data(sysarg)
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg) 
	 
	--if svar.StartOneYearActtime ==nil or svar.StartOneYearActtime==0 then 
	--	svar.StartOneYearActtime = 1
	--end
    --
	--local var = Actor.getStaticVar(sysarg) 
	--if var.OneYearActtime ==nil or var.OneYearActtime~=svar.StartOneYearActtime then --重来就没有参与过/参与的是上一次活动
	--	var.OneYearActtime = svar.StartOneYearActtime
	--	var.OneYearAct_Data ={} --把所有的数据清了
	--elseif var.OneYearAct_Data == nil then
	--	var.OneYearAct_Data ={}
	--end
	
	if svar.StartOneYear_Minitime==nil then 
		return 
	end
	
	if var.OneYear_Minitime==nil or  var.OneYear_Minitime~=svar.StartOneYear_Minitime then 
		var.OneYear_Minitime = svar.StartOneYear_Minitime
		var.OneYearAct_Data ={} --把所有的数据清了
	elseif var.OneYearAct_Data == nil then
		var.OneYearAct_Data ={}
	end

end


--要是是上一次的数据，那就把数据给全清了
function ClearQingDian_Data(sysarg)
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg) 
	--跨服不改变数据
	if System.isCrossServer()==true then 
		return 
	end
	
	--if svar.StartQDHDtime ==nil or svar.StartQDHDtime==0 then 
	--	svar.StartQDHDtime = 1
	--end
    --
	--local var = Actor.getStaticVar(sysarg) 
	--if var.QDHD_time ==nil or var.QDHD_time~=svar.StartQDHDtime then --重来就没有参与过/参与的是上一次活动
	--	var.QDHD_time = svar.StartQDHDtime
	--	var.QDHD_Data ={} --把所有的数据清了
	--elseif var.QDHD_Data == nil then
	--	var.QDHD_Data ={}
	--end
	
	if  var.QDHD_Data == nil then
		var.QDHD_Data ={}
	end
	
	--活动没有开起来
	if svar.StartQDHD_MiNitime ==nil then 
		return 
	end
	
	if var.QDHD_MiNitime ==nil or var.QDHD_MiNitime~=svar.StartQDHD_MiNitime then 
		var.QDHD_MiNitime = svar.StartQDHD_MiNitime
		var.QDHD_Data ={}
	end
end



--要是是上一次的数据，那就把数据给全清了
function ClearSanRenHongLi_Data(sysarg)
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg) 
	--跨服不改变数据
	if System.isCrossServer()==true then 
		return 
	end
	
	if var.SRHL_Data==nil then 
		var.SRHL_Data ={}
	end
	
	--散人红利还没有开
	if svar.StartSRHL_MiNitime ==nil then 
		return 
	end
	
	if var.RRHL_MiNitime ==nil or var.RRHL_MiNitime~=svar.StartSRHL_MiNitime then 
		
		if var.RRHL_MiNitime==nil then 
			var.RRHL_MiNitime=0
		end
		
		local actorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		--System.trace(actorid.." clear dajidali date , on the way "..n.."    var.RRHL_MiNitime="..var.RRHL_MiNitime..",svar.StartSRHL_MiNitime="..svar.StartSRHL_MiNitime)
		
		var.RRHL_MiNitime = svar.StartSRHL_MiNitime
		var.SRHL_Data ={} --把所有的数据清了
	end

end



--要是是上一次的数据，那就把数据给全清了
function ClearJingJi_Data(sysarg)
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg) 
	--跨服不改变数据
	if System.isCrossServer()==true then 
		return 
	end
	
	if var.JingJi_Data==nil then 
		var.JingJi_Data ={}
	end
	
	--散人红利还没有开
	if svar.StartJingJi_MiNitime ==nil then 
		return 
	end
	
	if var.StartJingJi_MiNitime ==nil or var.StartJingJi_MiNitime~=svar.StartJingJi_MiNitime then 
		
		if var.StartJingJi_MiNitime==nil then 
			var.StartJingJi_MiNitime=0
		end
		
		local actorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		--System.trace(actorid.." clear dajidali date , on the way "..n.."    var.StartJingJi_MiNitime="..var.StartJingJi_MiNitime..",svar.StartJingJi_MiNitime="..svar.StartJingJi_MiNitime)
		
		var.StartJingJi_MiNitime = svar.StartJingJi_MiNitime
		var.JingJi_Data ={} --把所有的数据清了
	end

end


--在开服活动前7天中，击杀特定怪物，便为角色增加一个临时的经验buff.
function OnOpenServerKillBossAddBuff(sysarg,bossId)
	--开区前7天有效
	local nOpenDays = System.getDaysSinceOpenServer()
	if nOpenDays > 7 then
		return
	end
	local dvar = Actor.getDyanmicVar(sysarg)
	for i=1,#KillBossAddBuff.buffInfo do 
		if bossId ==KillBossAddBuff.buffInfo[i].bossId then --杀到了特定怪物
			
			--本来就有buff了，就要对比一下
			if Actor.hasBuff(sysarg,KillBossAddBuff.buffType,KillBossAddBuff.buffGroup)==true then 
				if dvar.TuMobuffExp~=nil and dvar.TuMobuffExp>=KillBossAddBuff.buffInfo[i].addExp then --buff不能覆盖
					return 
				end
			end
			--加buff
			dvar.TuMobuffExp = KillBossAddBuff.buffInfo[i].addExp
			Actor.delBuff(sysarg,KillBossAddBuff.buffType,KillBossAddBuff.buffGroup) --删除buff，因为有可能是覆盖的
			Actor.addBuff(sysarg,KillBossAddBuff.buffType,KillBossAddBuff.buffGroup,KillBossAddBuff.buffInfo[i].addExp,KillBossAddBuff.buffInfo[i].time,KillBossAddBuff.buffInfo[i].interval,KillBossAddBuff.buffName,false,0,0,0,0,KillBossAddBuff.buffIcon,KillBossAddBuff.buffdes)
			

			local var = Actor.getStaticVar(sysarg)
			if var.firstTuMo ==nil then 
				var.firstTuMo = 1
				Actor.sendTipmsg(sysarg,string.format("<(n%s)>玩家玩家击杀了%s,获得屠魔印记buff,经验持续增长！<查看活动/@@showWin,180,7>",Actor.getName(sysarg),System.getMonsterNameById(bossId)),ttChatWindow)
			end
			
			--增加的是第几个buff
			local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sSendTuMoYinJiIndex)
			DataPack.writeByte(pack,i)
			DataPack.flush(pack)
		end
	end	
end



function WhenFinishRichangchumo(sysarg)
	local okBtn = string.format("%s/richangchumo_sureFunc", "确定")
	local cancelBtn = string.format("%s/richangchumo_cancelBtn", "取消")
	Actor.messageBox(sysarg, 0, 0, "已经完成任务,是否马上去提交", okBtn, cancelBtn, NULL,5000,0,NULL,0,1)
end

function richangchumo_sureFunc(sysarg)
	System.telportScene(sysarg, 9, 135, 130, true)
	local dvar = Actor.getDyanmicVar(sysarg)
	dvar.HelpToStrongIndex = 7
	Actor.addTimer(sysarg,26,1000)
end
function richangchumo_cancelBtn(sysarg)
	
end

--怪物被队友杀死  怪物死亡属于贡献
function OnMonsterByTeammeta(sysarg, monId)

	local var = Actor.getStaticVar(sysarg);
	if var == nil then return end -- 玩家登出时这里有可能为 nil
	local d = var.d;
	
	local monsterType = System.getMonsterTypeById(monId)
--	if monsterType == 4 then 
	--支线任务的一些判断 暂时不支持同时两个支线  hwei
		if var.BranchTaskKillMonsterStart and var.BranchTaskKillMonsterStart == 1 then
			if var.BranchTaskillMonsterCount == nil then
				var.BranchTaskillMonsterCount = 0
			end
			if var.BranchTaskillMonsterLimit == nil then
				var.BranchTaskillMonsterCount = var.BranchTaskillMonsterCount + 1
			else
				for i=1,#var.BranchTaskillMonsterLimit do
					if var.BranchTaskillMonsterLimit[i] == monId then
						var.BranchTaskillMonsterCount = var.BranchTaskillMonsterCount + 1
						Quest_ShuaXin(sysarg)
					end
				end
			end
		end
	--end
end

--百服活动杀怪
function OneHundredKillMonster(sysarg)
	
	-- 获得白服活动状态（0:关闭,1:开启,2:结束且显示图标）
	if System.getHundredServerStatus() ~= 1 then
		return
	end
	
	if not OneHundredActivityCfg then return end
	local config = OneHundredActivityCfg.MissionStepGift[2]
	
	local var = Actor.getStaticVar(sysarg)
	
	if not var.MissionStep then
		return
	elseif var.MissionStep ~= 1 then 
		return
	end
	
	if not var.HundreaKillMonsterNum then
		var.HundreaKillMonsterNum = 0
	end
	
	var.HundreaKillMonsterNum = var.HundreaKillMonsterNum + 1
	if var.HundreaKillMonsterNum >= config.finishCount then
		var.MissionStep = 2
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf356,var.MissionStep),ttDialog)
	end
end

function OnOpenServerKillBoss(sysarg,monsterId)
	
	local nOpenDays = System.getDaysSinceOpenServer()
	if nOpenDays > 7 then
		return
	end
		
	local config = PreferentialGift.TimelimitBoss
	if not config then return end
	
	local nId  = 0
	local var = Actor.getStaticVar(sysarg)
	if not var.TimelimitKillBoss then
		var.TimelimitKillBoss = {}
	end
	
	for _,bossList in ipairs(config) do
		for _,boss in ipairs(bossList.BossId) do
			nId = nId + 1
			for _,bossId in ipairs(boss) do
				if bossId == monsterId then
					--print(bossId,monsterId,nId)
					var.TimelimitKillBoss[nId] = 1
					return
				end
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------

--//佩戴装备触发(装备ID, 装备数量)
function OnPlayerDressEquiment(sysarg, equimentId, equimentCount, slotPos)

	--OnTakeOnEquimentAutoLearnSkill(sysarg, equimentId)

	-- local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
	-- if nJob == 3 then


	-- end

	if slotPos == itDragonSlayingPos or (slotPos >= itZhizunDressPos and slotPos <= itZhizunShoesPos) then
		OnTakeOnZhizunEquip(sysarg, equimentId, equimentCount, slotPos)
	end

	Quest_ShuaXin(sysarg)
	--Actor.sendTipmsg(sysarg,equimentId,256);
end

--//脱下装备触发(装备ID, 装备数量)
function OnPlayerDelEquiment(sysarg, equimentId, equimentCount)
	Quest_ShuaXin(sysarg)
	--print("equimentId, equimentCount===",equimentId, equimentCount)
end


--//商城购买物品触发(购买的物品名字,购买的物品ID,购买物品价格类型,价格)
function OnStoreBuyItem(sysarg, itemId, itemCount)
end

function TestEnterFb(sysarg, fbId)
	--print("--------------TestEnterFb ID="..fbId)
	StartEnterFb(sysarg, fbId)	
end

function ClearFbNum(sysarg, fdId)
	local sVar = Actor.getStaticVar(sysarg)	
	if sVar.fb then
		if fdId then
			sVar.fb[fdId] = {}
		else
			sVar.fb = {}
		end
	end
end

--宠物附加属性清空
function OnBackNormalAttr(sysarg,pet)
	
	local var = Actor.getStaticVar(sysarg)
	if var.addTempAck then 
		local nCurTime = System.getCurrMiniTime()
		if nCurTime >= var.addTempAck[1] then
			Pet.setIntAddAttr(pet,0,0)
			Actor.collectOperate(pet,0)
			var.addTempAck = nil
		end
	end
end

--因为一次可能加几个格子的物品,而且存在叠加的情况,所以提供物品指针是不合理的.
--参数分别代表：玩家指针,物品id,物品数量
function OnAddItemEvent(sysarg,itemId,itemCount)
	
	--得到东西检测完成条件
	local var = Actor.getStaticVar(sysarg)
	
	--用私人变量保存矿石，然后直接扣
	--if itemId>=4699 and itemId<= 4702 then 
	--	if var.days.kuangshi_RCCM ==nil then 
	--		var.days.kuangshi_RCCM ={}
	--	end
	--	if var.days.kuangshi_RCCM[itemId]==nil then 
	--		var.days.kuangshi_RCCM[itemId] = 1
	--	else 
	--		var.days.kuangshi_RCCM[itemId] = var.days.kuangshi_RCCM[itemId] + 1
	--	end
	--end
	
	--if var.RiChangRenWuType ~= nil and var.RiChangRenWuType == 1 then --日常除魔收集矿石
	--	if var.RiChangRenWuFlag~=nil and var.RiChangRenWuFlag == 1 then 
	--		local t=GetNpcRiChangChuMo()
	--		if itemId == t.kuangshi[var.RiChangRenWuIndex].needItem then 
	--			
	--			local itemCount = Actor.getItemCount(sysarg,itemId)
	--			if itemCount>=t.kuangshi[var.RiChangRenWuIndex].needcount then 
	--				var.RiChangRenWuFinish = 1
	--			else 
	--				var.RiChangRenWuFinish = 0
	--			end
	--			
	--			--if var.days.kuangshi_RCCM ==nil then 
	--			--	var.days.kuangshi_RCCM ={}
	--			--end
	--			--if var.days.kuangshi_RCCM[itemId]==nil then 
	--			--	var.days.kuangshi_RCCM[itemId] = 1 
	--			--end
	--			--if var.days.kuangshi_RCCM[itemId]>=t.kuangshi[var.RiChangRenWuIndex].needcount then 
	--			--	var.RiChangRenWuFinish = 1
	--			--else 
	--			--	var.RiChangRenWuFinish = 0
	--			--end
	--			
	--			Quest_ShuaXin(sysarg)
	--		end
	--	end
	--end
	
	local ta = task_all[get_taskflags_val(sysarg)]
	if ta~=nil and ta.type==7 then--以免刷新太频繁
		Quest_ShuaXin(sysarg)
	end


	
	checkIsFinishTask(sysarg,3)

	local mid = Actor.getSceneId(sysarg);
	--if mid == 86 and itemId == 312 then
    --    Quest_ShuaXin(sysarg)
	--	local n = Actor.getItemCount(sysarg,312);
	--	Actor.sendTipmsg(sysarg, "当前 <降妖除魔证明数量> 数量: <"..n..">", 256);
	--end
	
	--if itemId ==499 or itemId==500 or itemId ==501 then 
	--	addTheCoin(sysarg,itemCount)
	--end

    --持宝人宝箱
    if itemId == 304 and Actor.getSceneId(sysarg) == 234 then
        local dVar = System.getDyanmicVar()
	    if dVar.duobaoqibingTime ~= nil then
            Actor.addTimer(sysarg,ActorTimerIds.DBQBAddYuanBao,5000)
            --增加夺宝人称号
            Actor.setTopTitle(sysarg,25,true)

            System.broadcastTipmsg(string.format("<(n%s)>一举夺得夺宝人称号,丰富的宝藏就在眼前,羡慕嫉妒恨.",Actor.getName(sysarg)),ttChatWindow)
        end
        
    end


	--猪洞里面捡到了武器
	if itemId==439 or (itemId>=4707 and itemId<=4712) then 
		var.zhudongtask1 =1
	end







	--local mid = Actor.getSceneId(sysarg);
	--if mid == 46 then
		-- local var = Actor.getStaticVar(sysarg);
		-- local d = var.d;
		-- if d then
		-- 	if d[30] == 2 then
		-- 		local CYNUM1 = Actor.getItemCount(sysarg,697,-1,-1,-1);
		-- 		local CYNUM2 = Actor.getItemCount(sysarg,698,-1,-1,-1);
		-- 		d[32] = CYNUM1 + CYNUM2;
		-- 		if d[32] < 10 then
		-- 			Quest_ShuaXin(sysarg);
		-- 		else
		-- 			d[30] = 3;
		-- 			d[32] = 0;
		-- 			Quest_ShuaXin(sysarg);
		-- 			Actor.sendTipmsg(sysarg,"<(c0xFF00ff00)恭喜您完成采集珍珠任务,回去交任务吧!>",128);
		-- 			Actor.addEffect(sysarg,161,6,600,0);
		-- 			CollectNPC(sysarg)
		-- 			--local str = string.format("收集珍珠完成,今日剩余收集次数: %d",d[31])
		-- 			--Actor.messageBox(sysarg,0,0,str,Lang.ScriptTips.zf121.."/CollectNPC",NULL,NULL)
		-- 		end
		-- 	end
		-- end
	--end
	
	--[[	
	--如果是夺宝奇兵的宝箱,给他一个称号
	if itemId == QiBingDuoBaoConfig.propId and Actor.getSceneId(sysarg) == QiBingDuoBaoConfig.SceneId then
		Actor.setTopTitle(sysarg,QiBingDuoBaoConfig.titleId,true)
		Actor.addTimer(sysarg, ActorTimerIds.DuoBaoQiBing, QiBingDuoBaoConfig.timerInterval)

		System.broadcastTipmsg(string.format(Lang.Activity.qbdb0006,Actor.getName(sysarg),Item.getItemName(QiBingDuoBaoConfig.propId)),2+128)
	end
	--]]
	
	--[[
	--如果是腾讯霸者之刃2
	if System.GetGameIndex() == GameIndexDef.TencentBaZheZhiRen2 then
		local notice = false
		
		if TencentConfigs.WeiChatGift.ItemID == itemId then
			--微信礼包
			var.WeiChatGift = 1
			
			--关闭图标
			AllActivityButtonState(sysarg, TencentConfigs.WeiChatGift.IconID, 0)
			notice = true		
		end
		
		--通知
		if notice then
			System.broadcastTipmsg(string.format(Lang.ScriptTips.TXzf626, Actor.getName(sysarg), "活动大厅面板", Item.getItemName(itemId)), ttScreenCenter)
		end
	end
	--]]

    
    --2144平台 手机验证礼包
    if System.getSpid() == 7 and  itemId == 6017 then
        local netPack = DataPack.allocPacket(sysarg, 139, 196);
		DataPack.writeByte(netPack,1)
		DataPack.flush(netPack);

    end
end

--删除一个物品回调函数
function OnDeleteItemEvent(sysarg,itemId,itemCount,series)
	--[[
	--如果是夺宝奇兵的宝箱,删除他身上的称号
	if itemId == QiBingDuoBaoConfig.propId then
		Actor.setTopTitle(sysarg,QiBingDuoBaoConfig.titleId,false)
		Actor.deleteTimer(sysarg,ActorTimerIds.DuoBaoQiBing)

		local dVar = Actor.getDyanmicVar(sysarg)
		if dVar.SpidTitle then
			Actor.setTopTitle(player,31,true)
		end
	end
	--]]
		--失去的东西检测完成条件
	local var = Actor.getStaticVar(sysarg)
	--if var.RiChangRenWuType ~= nil and var.RiChangRenWuType == 1 then --日常除魔收集矿石
	--	if var.RiChangRenWuFlag~=nil and var.RiChangRenWuFlag == 1 then 
	--		local t=GetNpcRiChangChuMo()
	--		if itemId == t.kuangshi[var.RiChangRenWuIndex].needItem then 
	--			
	--			local itemCount = Actor.getItemCount(sysarg,itemId)
	--			if itemCount>=t.kuangshi[var.RiChangRenWuIndex].needcount then 
	--				var.RiChangRenWuFinish = 1
	--			else 
	--				var.RiChangRenWuFinish = 0
	--			end
	--			Quest_ShuaXin(sysarg)
	--		end
	--	end
	--end
	
	--失去了物品的时候要刷新任务显示
	local ta = task_all[get_taskflags_val(sysarg)]
	if ta~=nil and ta.type==7 then--以免刷新太频繁
		Quest_ShuaXin(sysarg)
	end
	
	if ta~=nil and ta.type==3 and  ta.needItem~=nil then--以免刷新太频繁
		Quest_ShuaXin(sysarg)
	end
	
        --持宝人宝箱
    if itemId == 304 then
        local dVar = System.getDyanmicVar()
	    if dVar.duobaoqibingTime ~= nil and Actor.existTimer(sysarg,ActorTimerIds.DBQBAddYuanBao) then
            Actor.deleteTimer(sysarg,ActorTimerIds.DBQBAddYuanBao)
            --删除持宝人称号
            Actor.setTopTitle(sysarg,25,false)
        end
        
    end

    --幻形
    
     for i = 1,#MagicShapeItem do
        if MagicShapeItem[i].item_id == itemId then
            System.AddMail(Actor.getIntProperty(sysarg,PROP_ENTITY_ID),0,0,"幻形道具到期消失","您的"..MagicShapeItem[i].name.."限时幻形已过期消失,可以选择使用其他幻形")
            break
        end
     end
     local nMagicShapeId = Actor.getMagicShapeId(sysarg)
      
     if nMagicShapeId > 0 and series > 0 then
          local dVar = Actor.getDyanmicVar(sysarg)
          if  dVar.magicshapeser == nil then  dVar.magicshapeser = 0 end
           
          if series ==  dVar.magicshapeser then
           
                 for i = 1,#MagicShapeItem do
                    if MagicShapeItem[i].shapeid == nMagicShapeId then
                        for j= 1,#MagicShapeItem[i].addbuffid do
                            Actor.delBuffById(sysarg,MagicShapeItem[i].addbuffid[j])
                        end
                        break
                    end
                end
                Actor.setMagicShapeId(sysarg,0)
                Actor.collectOperate(sysarg,1)
                dVar.magicshapeser = 0
          end
     end
end

--增加一个捡金币的触发
function OnLootAddMoneyEvent(sysarg,types,count)
	if types== 1 then 
		addTheCoin(sysarg,types,count)
	end
end

function OnBuyStoreItemEvent(sysarg,itemId,itemCount)
	--print("itemId:"..itemId,"itemCount:"..itemCount)
	
	--在商城购买药水的任务
	local taNext = task_all[get_taskflags_val(sysarg)+1]
	local ta = task_all[get_taskflags_val(sysarg)]
	if ta~=nil and ta.type == 5 then 
		if itemId ==79 then 
			local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
			set_taskflags_val(sysarg, ta.nvar)
			Quest_ShuaXin(sysarg)
			if taNext ~= nil then
				if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=86 then
					Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
				elseif taNext.type ==3 and get_taskflags_val(sysarg)~=85 then
					Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
				end
			end
		end
	end
end

--//玩家定时器回调
function OnActorTimer(sysarg, timerId)
	return TimerFunc[timerId](sysarg)
end

--//玩家完成任务
function OnPlayerFinishQuest(sysarg, questId)
end

--vip升级回调
function OnVipLevelUp(sysarg,newVipLevel,oldVipLevel)	
	
	if newVipLevel <= 0 then return end
	
	local vip_data = 
	{
		{nAddUseNum = 30,},
		{nAddUseNum = 50,},
		{nAddUseNum = 70,},
		{nAddUseNum = 100,},
		{nAddUseNum = 140,},
		{nAddUseNum = 190,},
		{nAddUseNum = 250,},
		{nAddUseNum = 320,},
		{nAddUseNum = 400,},
		{nAddUseNum = 490,},
		{nAddUseNum = 600,},
	}
	--//读取私人变量d
	local var = Actor.getStaticVar(sysarg);
	local d = var.d;

	if newVipLevel >= 10 then newVipLevel = 10; end
	if oldVipLevel >= 10 then oldVipLevel = 10; end
	local nAddNum = vip_data[newVipLevel+1].nAddUseNum - vip_data[oldVipLevel+1].nAddUseNum
	d[16] = d[16] + nAddNum
	d[17] = d[17] + nAddNum
	d[28] = d[28] + nAddNum		
	
	--清空VIP领取标识
	if var.days.vipPrivilege then
		var.days.vipPrivilege[1] = nil
		var.days.vipPrivilege[2] = nil
		var.days.vipPrivilege[5] = nil
	end

	if var.days.VipFreeRelive then var.days.VipFreeRelive = nil end		--清空每日免费复活次数
	SendFreeRelive(sysarg)
	
	-- local skillIds = {
	-- 		{1,2,3,4,5,6,63,64},
	-- 		{8,9,10,12,14,15,16,65,66},
	-- 		{17,20,19,22,21,24,67,69,71}}	
			
	-- local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	-- local nJobSkill = assert(skillIds[nJob],"skill table is nil")
	-- for _,skill_Id in ipairs(nJobSkill) do
	-- 	-- 如果没有学习返回0
	-- 	local skillLevel = Actor.getSkillLevel(sysarg,skill_Id)
	-- 	-- 如果没有该技能则要帮他加
	-- 	if skillLevel < 3 then
	-- 		Actor.startLearnSkill(sysarg,skill_Id,3)
	-- 	end
	-- end
	
	ht_OnVipLevelUp(sysarg,newVipLevel)
	
	--发送邮件，告知有什么好的东西
	if newVipLevel<5 then 
	
		local cloth = {
			{4646,4647},
			{4655,4656},
			{4664,4665},
		}
		local weapon ={
			4645,
			4654,
			4663,
		}
		local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
		local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)+1
		
		local mycloth = cloth[job][nSex]
		local myweapon = weapon[job]
		
		local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		System.AddMail(actor_id, 0, 0, "尊敬的VIP玩家", "<(c0xFFffff00)《尊敬的VIP玩家您好》：>\\\\\\\\<(c0xFFdad4c2)您可在技能栏左侧VIP按钮进入VIP系统,查看各级VIP奖励!\\\\\\\\1.VIP共有12级,每一级赠送的奖励都不同,但都很丰富!\\\\2.您获得VIP的同时将会提升大量战斗力!\\\\3.每日可领取三倍经验BUFF,助您飞速升级!>\\\\\\\\<(c0xFFFF00FF)《特此说明》>\\\\<♥><(c0xFFdad4c2):VIP3级送本职业5转衣服!>"..Item.getItemLinkMsg(mycloth).."\\\\<♥><(c0xFFdad4c2):VIP4级送本职业5转武器!>"..Item.getItemLinkMsg(myweapon).."\\\\\\\\<(c0xFFffff00)更多VIP好礼，就在VIP系统中!>")
	end

end

--装备过期了
function OnItemOverTime(sysarg,itemId)
    if System.isCrossServer() == true then return end
	itemId = tonumber(itemId)
	
	--森罗神戒
	for i=1,#SenLuoShenJieConfig.RingId do 
		if itemId == SenLuoShenJieConfig.RingId[i] then 
			--物品过期的了。
			local netPack = DataPack.allocPacket(sysarg, 139, 207)
			DataPack.writeByte(netPack, 3) -- 3过期了
			DataPack.flush(netPack)
			local sVar = Actor.getStaticVar(sysarg)
			sVar.SLSJTime = nil
		end
	end
end

--元宝提取回调
function OnPayExtractWing(sysarg,nYuanBao)
	if nYuanBao then
		local var = Actor.getStaticVar(sysarg);

		--首次提取元宝
		if Actor.getActorFlag(sysarg,14) < 1 then
			if nYuanBao~=0 then 
				OnFinish_Liveness(sysarg,2)
			end
			--SendRecommendTips(sysarg,Lang.ScriptTips.getfirstyb001)
			--SendRecommendTips(sysarg,Lang.ScriptTips.betaAward)
			Actor.openDialogs(sysarg,34)
			Actor.openarrowsguide(sysarg,34,584,455,1)
			Actor.setActorFlag(sysarg,14)
			var.days.TodayIsFisrtYb =1 --判断进入是不是首冲日
		else
			if not var.days.getNewDayYB then
				var.days.getNewDayYB = 0
			end
			if var.days.getNewDayYB and var.days.getNewDayYB <= 0 then
				--SendRecommendTips(sysarg,Lang.ScriptTips.edfirstyb001)
				if nYuanBao~=0 then
					OnFinish_Liveness(sysarg,2)--每日首次充值
				end
				var.days.getNewDayYB = 1
			end
		end
		
		-- 暂时屏蔽,需要再打开
		--TXActorRecharge(sysarg, nYuanBao)

		----------------------------------------------------------------------------
		--军团军衔 土豪印记 相关
		-- if get_d_val(sysarg,110) > 0 then
		-- 	local temp_num,temps = math.modf(nYuanBao / 5000);
		-- 	add_d_val(sysarg,115,temp_num);
		-- 	Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s％(%s％)土豪印记属性>",temp_num,get_d_val(sysarg,115)),1);
		-- 	ShuaXinFengHao(sysarg,115);
		-- end
		----------------------------------------------------------------------------
	end
end
--------------------------------------------------------------------------------------------------------------

--当一个怪物刷新出来的时候调用(StdMonster.txt 该怪物需要配置属性bMobTriggerScript)
function OnRefreshMonsterEvent(monsterPtr, monsterId, scenePtr, sceneId, x, y)

	if sceneId == 175 and monsterId == 338 then
		Fuben.sendMsgToSceneEx(scenePtr,MobMonsterTips[monsterId],2048)
	end
end

-- 当 refreshXX.lua脚本的刷怪配置项中的 entityid == 0 时不刷怪, 只是用于通知下脚本, 比如要广播一下第几波怪正在到来等, curCount 从 1 开始
function OnRefreshMonsterProgressEvent(scenePtr, sceneId, fubenPtr, fubenId, curCount, progress, mapx, mapy, range)
	if fubenId == fuben_emoling_cfg.fubenid then
		emoling_OnRefreshMonsterProgressEvent(scenePtr, sceneId, fubenPtr, fubenId, curCount, progress, mapx, mapy, range)
	end
end

--周四收回王城
function OnRecoveryGuild(nGuildId)
	local pActor = System.getEntityPtrByActorID(Guild.getGuildLeader(nGuildId))
	if pActor then
		local JOB = Actor.getIntProperty(pOActor,PROP_ACTOR_VOCATION)
		local LX = 12
		if JOB == 2 then LX = 16; elseif JOB == 3 then LX = 20; end
		Actor.delBuff(pOActor,LX,206)
	end
end

--踢场景玩家下线
function kickScenePlayer(sceneName,level)
	--[[ local nSceneId = System.getSceneIdByName(sceneName)
	local playerList = LuaHelp.getSceneAliveActorListById(nSceneId)		--获取某场景玩家对象列表
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player and not Actor.checkActorLevel(player,level+1 , 0) then	
				Actor.killActor(player)
			end
		end
	end]]--
end

--获取某个场景玩家数量
function ScenePlayer(actorName,nSceneId)
	local player = Actor.getActorByName(actorName)
	if not player then return end
	local playerList = LuaHelp.getSceneAliveActorListById(nSceneId)		--获取某场景玩家对象列表
	if playerList ~= nil then
		Actor.sendTipmsg(player,string.format("current scene num is:%d",#playerList),1)
	else
		Actor.sendTipmsg(player,0,1)
	end
end

--系统推荐提示tips框
function SendRecommendTips( sysarg , nStr)
	local npack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sSendRecommendTips)  --申请一个数据包
	if npack == nil then
		print("allocPacket is nil!")
		return
	end
	DataPack.writeString(npack,nStr)
	DataPack.flush(npack)
end

--装备的佩戴条件
function EquipDress(sysarg,pUserItem)
	local ItemId = Item.getItemId(pUserItem);
	local ItemName = Item.getItemName(ItemId);
	local Job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
	if Job == 1 and string.find(ItemName,"护身") then
		Actor.sendTipmsg(sysarg,"战士无法佩戴护身特戒.",256);
		return false;
	end
	if Job == 2 and string.find(ItemName,"麻痹") then
		Actor.sendTipmsg(sysarg,"法师无法佩戴麻痹特戒.",256);
		return false;
	end
	return true;
end

function clearActorFunc(actorName,FundType)
	if actorName and FundType then 
		local player = Actor.getActorByName(actorName)
		if player then
			local var = Actor.getStaticVar(player)
			if var.getFundGift[FundType] then
				var.getFundGift[FundType] = {}
			end
		end
	end
end


function OnClearSbkBuff(OldSbkId)
	
	local pOActor = System.getEntityPtrByActorID(OldSbkId)
	if pOActor then
		local nJob = Actor.getIntProperty(pOActor,PROP_ACTOR_VOCATION)
		local nBuffType = 12
		if nJob == 2 then 
			nBuffType = 16; 
		elseif nJob == 3 then 
			nBuffType = 20; 
		end
		Actor.delBuff(pOActor,nBuffType,206)
	end
end


--更新玩家累积登录多少天
function AddLoginAwardInfo(sysarg)
	
	
	local var = Actor.getStaticVar(sysarg);
	if not var.SevenDayFlag then
		var.SevenDayFlag = 0
	end
	var.SevenDayFlag = var.SevenDayFlag + 1
	local nCombineDay = System.getDaysSinceCombineServer()
	
	if (nCombineDay > 0 and nCombineDay < 6) and Actor.checkActorLevel(sysarg,MergerServerCfg.LoginAward.needLevel,MergerServerCfg.LoginAward.needCircle) then
		if var.CombineLoginDay then
			var.CombineLoginDay = var.CombineLoginDay + 1
		else
			var.CombineLoginDay = 1
		end
	end
	
	--[[
	if IsOpenActivity(LaborActivityCfg) == 5 and Actor.checkActorLevel(sysarg,LaborActivityCfg.LoginGift.needLevel,LaborActivityCfg.LoginGift.needCircle) then
		if var.LaborLoginDay then
			var.LaborLoginDay = var.LaborLoginDay + 1
		else
			var.LaborLoginDay = 1
		end
		
		var.LaborSinglePayValue = nil
		var.LobarSinglePayFlag = nil
	else
	--]]
		var.LaborLoginDay = nil
		var.LaborLoginDayFlag = nil
		var.LaborSinglePayValue = nil
		var.LobarSinglePayFlag = nil
		
	--end
end

function AllLoginAwardInfo(sysarg)
	
	local var = Actor.getStaticVar(sysarg);
	local SevenDayAwardFlag
	if not var.SevenDayAwardFlag then
		var.SevenDayAwardFlag = {}
	end
	if not var.SevenDayFlag then
		var.SevenDayFlag = 0
	end
	SevenDayAwardFlag = var.SevenDayAwardFlag
	
	local npack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sSendLoginAwardInfo)  --申请一个数据包
	DataPack.writeByte(npack,var.SevenDayFlag)
	DataPack.writeByte(npack,#SevenDayAwardCfg)
	for i = 1, table.getn(SevenDayAwardCfg) do
		if SevenDayAwardFlag[i] then
			DataPack.writeByte(npack,2)  --已领取
		elseif i > var.SevenDayFlag then
			DataPack.writeByte(npack,0)	 --不能领取
		else
			DataPack.writeByte(npack,1)   --可以领取
		end
	end
	DataPack.flush(npack);
end

function SendAllChallengeBossInfo(sysarg)
	
	if not ChallengeBossConfig then return end
	local config = ChallengeBossConfig.ChallengeBoss.BossInfo
	
	local FinishChallengeBoss,ChallengeBossNum,buyChallengeBossNum
	local var = Actor.getStaticVar(sysarg)
	if not var.days.FinishChallengeBoss then
		var.days.FinishChallengeBoss = {}
	end

	if not var.days.ChallengeBossNum then
		var.days.ChallengeBossNum = ChallengeBossConfig.ChallengeBoss.MaxChallengeNum
	end
	
	if not var.days.buyChallengeBossNum then
		var.days.buyChallengeBossNum = 0
	end
	
	FinishChallengeBoss = var.days.FinishChallengeBoss
	ChallengeBossNum = var.days.ChallengeBossNum
	buyChallengeBossNum = ChallengeBossConfig.BuyChallgeBoss.MaxBuyNum - var.days.buyChallengeBossNum
	
	local npack = DataPack.allocPacket(sysarg,49,2)  --申请一个数据包
	if npack == nil then
		print("allocPacket is nil!")
		return
	end
	
	DataPack.writeByte(npack,ChallengeBossNum)
	DataPack.writeByte(npack,buyChallengeBossNum)
	
	local len = table.getn(config)
	DataPack.writeByte(npack,len)
	for i = 1,len do
		if FinishChallengeBoss[i] then
			DataPack.writeByte(npack,1)
		else
			DataPack.writeByte(npack,0)
		end
	end
	DataPack.flush(npack)
end

function GmStartSbkGuildWar()
	StartSbkGuildWar()
end

function GmResetStartSbkTimes(times)
	local var = System.getStaticVar()
	if not var.StartSbkTimes then
		var.StartSbkTimes = 0
	end
	
	var.StartSbkTimes = times
	
	System.setSbkGuildId(0)
end

function GmCheckSceneSbk()
	Fuben.detectOnlyOneGuild(51)
end

function GmEndSbkGuildWarOp()
	EndSbkGuildWarOp()
end

function CheckFuBenQuest_CanFinish(sysarg)	
    return true
--	local nCurFuBenId = Actor.getFubenId(sysarg)
--	if nCurFuBenId <= 0 then		
--		return true
--	end

--	if not AcceptQuestCfg then return true end
--	local QuestData = AcceptQuestCfg[nCurFuBenId]
--	if not QuestData then return true end

--	-- 飞到该副本交当前任务,然后接下一个任务,完成下一个任务后才能退出副本,所以没有交当前任务或者没有完成下一个任务则不能退出副本
--	local canExit = false	

--	if Actor.isFinishQuest(sysarg,QuestData.CurQuestID) then
--		-- 如果子任务已经交了或者子任务完成了（即可以交了）	
--		if Actor.isFinishQuest(sysarg,QuestData.SonQuestID) or Actor.canFinishQuest(sysarg,QuestData.SonQuestID) then
--			canExit = true
--		end
--	else
--		--血域殿、虹魔殿、模拟皇宫[副本],有玩家反映传到了这个副本但是没接这个任务以至于出不去,所以这里自动帮他接一下
--		--if (QuestData.CurQuestID == 59 or QuestData.CurQuestID == 35 or QuestData.CurQuestID == 62) and not Actor.hasQuest(sysarg, QuestData.CurQuestID) then
--		if (not Actor.hasQuest(sysarg, QuestData.CurQuestID)) then -- 自动帮他接一下
--			Actor.addQuest(sysarg, QuestData.CurQuestID)
--		end
--	end

--	if not canExit then
--		Actor.sendTipmsg(sysarg,"请完成任务后再来传送",256);
--	end

--	return canExit
end

function OnChangeSBKLeader(oldLeaderId,newLeaderId)
--[[	>屏蔽城主专属武器相关逻辑
	local sysarg = System.getEntityPtrByActorID(oldLeaderId)
	local nCount = Actor.getItemCount(sysarg,GuildSiegeConfig.SbkLeaderWeapons,0,0,-1,-1,nil,true)
	if nCount > 0 then
		Actor.removeItem(sysarg,GuildSiegeConfig.SbkLeaderWeapons,1,-1,-1,-1,"帮主禅让删除王城城主的专属武器",2,-1,true)
	end  ]]
	
	local sVar = System.getStaticVar()
	if not sVar.LeaderPrivilege then
		sVar.LeaderPrivilege = {}
	end
	sVar.LeaderPrivilege[1] = nil
	
end

function SendFreeRelive(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	
	local nVipLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)
	if nVipLevel <= 0 then return end
	
	if not VipConfig then return end
	
	local reliveCount = VipPrivilegesCfg[nVipLevel].relive;
	if not reliveCount then return end		
	if not var.days.VipFreeRelive then
		var.days.VipFreeRelive = 0
	end
	
	local npack = DataPack.allocPacket(sysarg, 139, 122)  --申请一个数据包
	if (npack == nil) then return end
	DataPack.writeByte(npack, reliveCount - var.days.VipFreeRelive)
	DataPack.flush(npack)
end

--屏蔽经验瓶
--[[
function SendBottlesExpNum(sysarg)
	
	local config = BottlesExpConfig
	if not config then return end
		
	if not Actor.checkActorLevel(sysarg,GlobalConfig.nOpenBottlesLevel) then
		return
	end
	if System.getDaysSinceOpenServer() < 2 then
		return
	end
		
	local var = Actor.getStaticVar(sysarg)
	if not var.days.UseBottesNum then
		var.days.UseBottesNum = 0
	end
	
	local netPack = DataPack.allocPacket(sysarg, 139,124)
	DataPack.writeByte(netPack, config.MaxUse-var.days.UseBottesNum)
	DataPack.flush(netPack)
end
--]]

function SendShieldFlag(sysarg)
	
	local nOpenDay = System.getDaysSinceOpenServer()
	local var = Actor.getStaticVar(sysarg)
	
	if nOpenDay < 3 then
		return
	elseif var.GiveShieldFlag then
		return
	end
	
	local netPack = DataPack.allocPacket(sysarg, 139,126)
	DataPack.writeByte(netPack, 1)  -- 1：盾牌
	if nOpenDay == 3 and not var.firstShield then
		DataPack.writeByte(netPack, 2)
		var.firstShield = 1
	else
		DataPack.writeByte(netPack, 1)
	end
	DataPack.flush(netPack)
end

function SendDiamondCrystalFlag(sysarg)
	
	local nOpenDay = System.getDaysSinceOpenServer()
	local var = Actor.getStaticVar(sysarg)
	
	if nOpenDay < 4 then
		return
	end
	
	if nOpenDay == 4 and not var.firstDiamond then
		local netPack = DataPack.allocPacket(sysarg, 139,126)
		DataPack.writeByte(netPack, 2)  -- 2：钻晶
		DataPack.flush(netPack)
		var.firstDiamond = 1
	end	
end

function SendEquipMedalFlag(sysarg)
	local nOpenDay = System.getDaysSinceOpenServer()
	local var = Actor.getStaticVar(sysarg)
	
	if nOpenDay < 2 then
		return
	end
	
	if nOpenDay == 2 and not var.firstEquipMedal then
		local netPack = DataPack.allocPacket(sysarg, 139,126)
		DataPack.writeByte(netPack, 3)  -- 2：钻晶
		DataPack.flush(netPack)
		var.firstEquipMedal = 1
	end	

end

function deleteAllPet()
	
	local playerList = LuaHelp.getAllActorList()
	
	if not playerList then
		return
	end
	
	for _,player in ipairs(playerList) do
		if player then
			local nPetCount = 0
			for i = 256,258 do
				local petCount = Pet.getPetCountById(player,i)
				if petCount > 1 then
					Pet.delPetById(player,i)
				end
			end
		end
	end
end

function clearCumulativeFlag()
	
	local playerList = LuaHelp.getAllActorList()
	
	if not playerList then
		return
	end

	for _,player in ipairs(playerList) do
		if player then
			local var = Actor.getStaticVar(player)
			if var.CombineCumulative then 
				var.CombineCumulative = nil 
			end		
		end
	end
end

function clearCumulativeByName(name)
	
	local player = System.getActorPtr(name)
	if not player then return end

	local var = Actor.getStaticVar(player)
	var.CombineCumulative = nil
	var.CombineLoginGift = nil
	var.CombineCumulativeFlag = nil
	var.SuperBagGift = nil
	var.CombineLotteryScore = nil
	var.CombineLotteryId = nil
end

function addCumulativeFlag(name,score)
	
	local player = System.getActorPtr(name)
	if not player then return end

	local var = Actor.getStaticVar(player)
	if not var.CombineCumulative then 
		var.CombineCumulative = 0 
	end
	
	var.CombineCumulative = var.CombineCumulative + score
end

function GmaddVipPoint(name,score)
	
	local player = System.getActorPtr(name)
	if not player then return end

	Actor.addVipPoint(player,score)
end
	
function IsOneHundredActivity(sysarg,isRecord)
	
	local nSpid = System.getSpid()
	local config = OneHundredActivityCfg.PlatformCfg[nSpid]
	if not config then return false end
	if nSpid ~= config.spId then
		return false
	end

	local nResult = IsOpenActivity(config)
	if nResult ~= 5 then
		if isRecord then
			AllActivityButtonState(sysarg,81,0)
		end
		return false 
	elseif sysarg then
		AllActivityButtonState(sysarg,81,1)
	end
	
	return true
end

function IsOpenActivity(config)
	
	local nYear,nMonth,nDate = System.getDate();
	if string.len(config.OpenActivitytTime) > 0 then	
		
		local nSFid,nSLid,nOpenYear,nOpenMonth,nOpenDay = string.find(config.OpenActivitytTime,"(%d+),(%d+),(%d+)")
		local nEFid,nELid,nCloseYear,nCloseMonth,nCloseDay = string.find(config.CloseActivitytTime,"(%d+),(%d+),(%d+)")
		nOpenYear = tonumber(nOpenYear)
		nOpenMonth = tonumber(nOpenMonth)
		nOpenDay = tonumber(nOpenDay)
		
		nCloseYear = tonumber(nCloseYear)
		nCloseMonth = tonumber(nCloseMonth)
		nCloseDay = tonumber(nCloseDay)
	
		--[[ 这样写有bug
		if nMonth ~= nOpenMonth and nMonth ~= nCloseMonth then
			return 1
		elseif nMonth == nOpenMonth and nDate < nOpenDay then
			return 2
		elseif nMonth == nCloseMonth and nDate > nCloseDay then
			return 3
		end
		--]]
		
		if System.isInDateRange(nOpenYear, nOpenMonth, nOpenDay, 0, 0, 0, nCloseYear, nCloseMonth, nCloseDay, 23, 59, 59) == false then
			return 1
		end
		
	else
		return 4
	end
	
	return 5
end

function ClearOneHundredData(sysarg)

	local var = Actor.getStaticVar(sysarg)
	
	var.HundredOnlineTime = nil
	var.HundredOnlineAward = nil
	var.MissionStep = nil
	var.MissionStepAward = nil
	var.oneHundredPay = nil
	var.HundreaKillMonsterNum = nil
	var.HundreaKillActorNum = nil
	var.HundreaRecoverEquipNum = nil
	var.HundreaSynthesisEquipNum = nil
end
    
function ClearSpringFestivalData(sysarg)

	local var = Actor.getStaticVar(sysarg)

	var.FirecrackersGiftFlag = nil
end

--@func Gmtestsss GM调用 参数 数值直接写, 文字需要""
function Gmtestsss(sysarg,a)
	--Actor.changeMoney(sysarg, mtYuanbao, 元宝数, 138, "")
	Actor.sendTipmsg(sysarg,a,256)
end

function GmCalcSwingRank()
	AccountSwingTpoicActivity()
end

function GmCalcRideRank()
	OnAccountRide()
end

function GmChangeCultureLevel(sysarg,level)
	System.setCultureLevel(level)
end

function GmChangeStaticValue(sysarg,actorName,nStaticId,nValue)
	local player = Actor.getActorByName(actorName)
	if player ~= nil then
		local var = Actor.getStaticVar(player)
		if var ~= nil then
			var.GodFurnace[nStaticId] = nValue
		end
	end
end

function GmChangeBranchTask(sysarg,actorName,index)
	local player = Actor.getActorByName(actorName)
	if player ~= nil then
		local var = Actor.getStaticVar(player)
		if var ~= nil then
			var.BranchTaskComplete[index] = 1
		end
	end
end

function GmChangeArtifactLevel(sysarg,actorName,level)
	local player = Actor.getActorByName(actorName)
	if player ~= nil then
		local var = Actor.getStaticVar(player)
		if var ~= nil then
			var.equipWeaponLevel = level
		end
	end
end

function GmAddLinli(sysarg,nCount)
	local val = Actor.getUIntProperty(sysarg, PROP_ACTOR_AVOIDINJURY_EXP)
	Actor.setUIntProperty(sysarg, PROP_ACTOR_AVOIDINJURY_EXP, val + nCount)
end

--手动清除双倍行会活动次数
function clearGuildDoubleActiveCount()
	System.clearGuildDoubleActiveCount()
end

function GmCalcLevelRank()
	EndLevelingActivty()
end

function addDreamPoint(sysarg,count)
	local var = Actor.getStaticVar(sysarg)
  	var.TreasureHuntValue = count
end

function setOtherCrossDaybyGm(sysarg,actorName)
	local player = Actor.getActorByName(actorName)
	if player then
		OnPlayerCrossDay(player)
	end
end

function SendCombineData(sysarg)
    if System.isCrossServer() == true then return end
	local CombineDays = System.getDaysSinceCombineServer()
	if CombineDays < 1 and CombineDays > 5 then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local sVar = System.getStaticVar()
	
	local netPack = DataPack.allocPacket(sysarg, 139, 75)
	
	DataPack.writeByte(netPack,#MergerServerCfg.LoginAward.award)
	
	if not var.CombineLoginDay then
		local nLevel = MergerServerCfg.LoginAward.needLevel
		local nCircle = MergerServerCfg.LoginAward.needCircle
		if Actor.checkActorLevel(sysarg,nLevel,nCircle) then
			var.CombineLoginDay = 1
		else
			var.CombineLoginDay = 0
		end
	end
	local nDay = var.CombineLoginDay
	
	for i = 1,#MergerServerCfg.LoginAward.award do
		if nDay >= i then
			if not var.CombineLoginGift or var.CombineLoginGift == 1 then
				var.CombineLoginGift = {}
			end
			if var.CombineLoginGift[i] then
				DataPack.writeByte(netPack,2)
			else
				DataPack.writeByte(netPack,1)
			end
		else
			DataPack.writeByte(netPack,0)
		end		
	end
	
	
	local nMaxCumulativeAward = #MergerServerCfg.CumulativeAward
	DataPack.writeByte(netPack,nMaxCumulativeAward)
	if not var.CombineCumulativeFlag then
		var.CombineCumulativeFlag = {}
	end
	local CombineCumulativeFlag = var.CombineCumulativeFlag	
	for i = 1,nMaxCumulativeAward do
		if CombineCumulativeFlag[i] then
			DataPack.writeByte(netPack,2)
		else
			if not var.CombineCumulative then
				DataPack.writeByte(netPack,0)
			elseif var.CombineCumulative >= MergerServerCfg.CumulativeAward[i].needCumulative then
				DataPack.writeByte(netPack,1)
			else
				DataPack.writeByte(netPack,0)
			end
		end
	end
	
	DataPack.writeByte(netPack,2)
	local nSbkLeaderId = Guild.getSbkCityOwner()
	local nSbkGuildId = Guild.getSbkCityOwnerGuildId()
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local nGuildId Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
	
	if nSbkGuildId <= 0 or nGuildId ~= nSbkGuildId then
		DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,0)
	else
		if nActorId == nSbkLeaderId then
			if sVar.CombineSbkLeader then
				DataPack.writeByte(netPack,1)
				DataPack.writeByte(netPack,1)
			else
				DataPack.writeByte(netPack,0)
				DataPack.writeByte(netPack,1)
			end
		else
			if not sVar.CombineSbkMasses then
				sVar.CombineSbkMasses = {}
			end
			
			if sVar.CombineSbkMasses[nActorId] then			
				DataPack.writeByte(netPack,1)
				DataPack.writeByte(netPack,1)
			else
				DataPack.writeByte(netPack,0)
				DataPack.writeByte(netPack,1)
			end
		end
	end
	
	
	local nMaxSuperBag = #MergerServerCfg.SuperBag
	if not var.SuperBagGift then
		var.SuperBagGift = {}
	end
	local SuperBagGift = var.SuperBagGift
	DataPack.writeByte(netPack,nMaxSuperBag)
	for i = 1,nMaxSuperBag do
		if SuperBagGift[i] then
			DataPack.writeByte(netPack,1)
		else
			DataPack.writeByte(netPack,0)
		end
	end

	
	local flags = var.days.CombineFirstPayFlag
	if flags == nil then flags = 0 end
	DataPack.writeByte(netPack,flags)	

	DataPack.writeByte(netPack,nDay)
	
	DataPack.writeInt(netPack, var.CombineCumulative or 0)
	
	DataPack.flush(netPack)

end

function OnTakeOnEquimentAutoLearnSkill(sysarg, equimentId)

	--散人未用到 170420 zer备注
	Actor.sendTipmsg(sysarg,string.format("",Item.getItemName(equimentId)), ttFlyTip) 
	
	-- 穿戴2阶的霸者神器和神甲后自动学习霸者之怒技能
	-- 2阶神器(736) 2阶男神甲(762) 2阶女神甲(763)
	local level = 1
	local checkType = 0
	if equimentId == 736 then
		checkType = Item.itFashionDress
		level = 1
	elseif equimentId == 737 then
		checkType = Item.itFashionDress
		level = 2	
	elseif equimentId == 762 or equimentId == 763 then
		checkType = Item.itWeaponExtend
		level = 1
	elseif equimentId == 764 or equimentId == 765 then
		checkType = Item.itWeaponExtend
		level =2
	else
		return
	end
	
	local weaponPtr = Item.getEquipByType(sysarg, checkType)
	if not weaponPtr then return end

	local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	local skillIds = {68, 72, 73, 75, 76, 77}
	local sillId = skillIds[job+(level-1)*3]
	if sillId == nil then return end

	-- 如果没有学习返回0
	local skillLevel = Actor.getSkillLevel(sysarg, sillId)
	if skillLevel > 0 then return end
	
	Actor.startLearnSkill(sysarg,sillId,1)
end

--@gfunc OpenCompensateGifts
function OpenCompensateGifts()
	local dVar = System.getDyanmicVar()
	if dVar.openCompensate == nil or dVar.openCompensate ~= 1 then
		dVar.openCompensate = 1
	end
	
	print("打开补偿成功,第2天自动关闭")
end

--玩家每次登录调用- 军团长被挤出的情况下
function onLegionMasterChange(sysarg)
	local legionId = Actor.getLegionId(sysarg)
	local sVar = System.getStaticVar()
	if legionId > 0 and sVar.legion ~= nil then
		if Actor.HasHeadTitle(sysarg,LEGIONID[legionId].HeadTitle) and
		  Actor.getName(sysarg)~=  sVar.legion[legionId].Master then
			--撤下称号
			Actor.setTopTitle(sysarg,LEGIONID[legionId].HeadTitle,false)
			--Actor.GiveupTitle(sysarg,LEGIONID[legionId].HeadTitle)
		end
		--判断是否开启了双倍经验
		if sVar.legion[legionId].Exp ~= nil and sVar.legion[legionId].Exp > 0 then
			Actor.addBuff(sysarg,64,199,1,1,sVar.legion[legionId].Exp * 60,"军团双倍经验",false,0,0,57)
		end
	end
	

end
	
--三个条件同时满足,1杀怪数量,2等级,3拥有的物品
function checkIsFinishTask(sysarg,types)
	
	--//读取私人变量d
	local var = Actor.getStaticVar(sysarg);
	if var == nil then return  end  -- 玩家登出时这里有可能为 nil
	local tMkm = var.zkillmon;	--主线杀怪数记录
    local ta = task_all[get_taskflags_val(sysarg)]
	local taNext = task_all[get_taskflags_val(sysarg)+1]--预测下一任务类型
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	local actormapid = Actor.getSceneId(sysarg)
	
	if tMkm==nil then 
		tMkm={}
	end
	if tMkm[1] ==nil then
		tMkm[1]=0
	end
	if ta ~= nil and ta.type ==3 then
	
		if tMkm[1] >= ta.monnum then--判断条件1杀怪数量
			if pLv>=ta.lv then --判断条件2
				if #ta.needItem ~= 0 then--如果有需要的物品
					local flag=1
					for i=1,9 do
						if ta.needItem[i]~=nil then
							--print(ta.needItem[i].count)
							local bindCount   = Actor.getItemCount(sysarg,ta.needItem[i].item,0,-1,1,-1, nil, true);  --绑定的数量
							local noBindCount = Actor.getItemCount(sysarg,ta.needItem[i].item,0,-1,0,-1, nil, true);  --不绑定的数量
							if  bindCount+noBindCount < ta.needItem[i].count then
								break
							end
						end
						flag=i
					end
					if flag == 9 then--全部的数量都满足
					--3个条件都满足,触发完成任务
						tMkm[1] = 0;
						set_taskflags_val(sysarg, ta.nvar);
						Actor.addEffect(sysarg,161,6,500,0);
						if taNext ~= nil then
							if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=86 and get_taskflags_val(sysarg)~=92 and get_taskflags_val(sysarg)~=97 then
								if ta.nexmapid == 1 then 
									Actor.autoFindPathToNpc( sysarg, actormapid, ta.nexnpc);
								else
									Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
								end
							elseif taNext.type ==3 and get_taskflags_val(sysarg)~=85 and get_taskflags_val(sysarg)~=91 and get_taskflags_val(sysarg)~=95 then
								if taNext.mapid == 1 then 
									Actor.autoFindPathToKillMonster(sysarg, actormapid , taNext.mx , taNext.my , taNext.monid)
								else 
									Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
								end
								
							end
						end

					end
					
				else --如果没有需要的物品
				
				tMkm[1] = 0;
				set_taskflags_val(sysarg, ta.nvar);
				Actor.addEffect(sysarg,161,6,500,0);
				if taNext ~= nil then
					if taNext.type ~=3 and  taNext.lv <= pLv and get_taskflags_val(sysarg)~=86 and get_taskflags_val(sysarg)~=92 and get_taskflags_val(sysarg)~=97 then --95直接到97了
						if ta.nexmapid == 1 then 
							Actor.autoFindPathToNpc( sysarg, actormapid, ta.nexnpc);
						else
							Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
						end
					elseif taNext.type ==3 and get_taskflags_val(sysarg)~=85 and get_taskflags_val(sysarg)~=91 and get_taskflags_val(sysarg)~=95 then
						if taNext.mapid == 1 then 
							Actor.autoFindPathToKillMonster(sysarg, actormapid , taNext.mx , taNext.my , taNext.monid)
						else 
							Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
						end
					end
				end
				
				end
	
			end
		end
		Quest_ShuaXin(sysarg);
		
	elseif ta ~= nil and ta.type ==2 and types == 2 then --NPC对话任务
		Quest_ShuaXin(sysarg);
	--	Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc)
	elseif ta ~= nil and ta.type ==4 and types == 2 then --升级触发的指导任务
		Quest_ShuaXin(sysarg);
	--	Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc)
	elseif ta ~= nil and ta.type == 6 then --锻造装备触发的任务
		if get_taskflags_val(sysarg)== 89 then 
			local count = Item.getStrongEquipNumByStrong(sysarg,2)
			if count>=1 then--完成了任务   (因为升级还没有返回c++,升级还不算完成,所以需要减1)
				set_taskflags_val(sysarg, ta.nvar)
				if taNext ~= nil then
					if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=86 then
						Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
					elseif taNext.type ==3 and get_taskflags_val(sysarg)~=85 then
						Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
					end
				end
				Quest_ShuaXin(sysarg)
			end
		elseif get_taskflags_val(sysarg)== 99 then 
			local count = Item.getStrongEquipNumByStrong(sysarg,3)
			if count>=1 then--完成了任务
				set_taskflags_val(sysarg, ta.nvar)
				if taNext ~= nil then
					if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=86 then
						Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
					elseif taNext.type ==3 and get_taskflags_val(sysarg)~=85 then
						Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
					end
				end
				Quest_ShuaXin(sysarg)
			end
		end
	elseif ta ~=nil and ta.type == 7 and types == 3 then --收集套装中的任意几件
		local startId=ta.collectItem.startId
		local endId=ta.collectItem.endId --套装开始和结束id,写死
		local needCount=ta.collectItem.count
		local totalNum=0
		for i=startId,endId do
			local bindCount   = Actor.getItemCount(sysarg,i,0,-1,1,-1, nil, true);  --绑定的数量
			local noBindCount = Actor.getItemCount(sysarg,i,0,-1,0,-1, nil, true);  --不绑定的数量
			if  bindCount+noBindCount >=1 then
				totalNum = totalNum + 1
			end
		end
		if totalNum >= needCount then --完成了任务
			set_taskflags_val(sysarg, ta.nvar);
			Actor.addEffect(sysarg,161,6,500,0);
			if taNext ~= nil then
				if taNext.type ~=3 and taNext.lv <= pLv and get_taskflags_val(sysarg)~=86 then
					Actor.autoFindPathToNpc( sysarg, ta.nexmapid, ta.nexnpc);
				elseif taNext.type ==3 and get_taskflags_val(sysarg)~=85 then
					Actor.autoFindPathToKillMonster(sysarg, taNext.mapid , taNext.mx , taNext.my , taNext.monid)
				end
			end
		end
	Quest_ShuaXin(sysarg)
    end
end
--7天活动(跨天登录,在线跨天都要调用)
function sevenDaysActivity_WhenLogin(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.sevenDActivity ==nil then 
		var.sevenDActivity = 1
	else 
		var.sevenDActivity=var.sevenDActivity+1
		if var.sevenDActivity>=7 then 
			var.sevenDActivity = 7
		end
	end
end

--查看开区合区天数
function whatday(sysarg)
	local openday = System.getDaysSinceOpenServer(); --获取现在是开服的第几天
	local combineday = System.getDaysSinceCombineServer(); --合服以来的第几天
	Actor.sendTipmsg(sysarg, string.format("当前合服天数第<%s>天,开区第<%s>天.",combineday,openday), 256);
end

--调整玩家主线
--调整玩家主线任务 @func settask 10
function settaskex(name,n)
    local sysarg = System.getActorPtr(name)
   
	if not n then Actor.sendTipmsg(sysarg, "<err>",256); end
	n = tonumber(n);
	Actor.sendTipmsg(sysarg, get_taskflags_val(sysarg).."==>"..n, 1)
	set_taskflags_val(sysarg, n);
	Quest_ShuaXin(sysarg);
end
--调整玩家主线任务 @func settask 10
function settask(sysarg,n)
	if not n then Actor.sendTipmsg(sysarg, "<err>",256); end
	n = tonumber(n);
	Actor.sendTipmsg(sysarg, get_taskflags_val(sysarg).."==>"..n, 1)
	set_taskflags_val(sysarg, n);
	Quest_ShuaXin(sysarg);
end
--杀死所有的怪,测试用的 @func killAll 
function killAll(sysarg)
	local hScene = Actor.getSceneHandle(sysarg)
	Fuben.killAllMonsters(sysarg, hScene, true)
	
	print("PROP_ACTOR_CIRCLE="..Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE))
end

--服务器自启动后每分钟检测BOSS刷新以及提示
--SRRefreshMonsterEx是运行是刷新,只会运行1次
--SRRefreshMonster是正常根据时间刷新
function SRRefreshMonsterEx()
	local svar = System.getDyanmicVar()
	if svar.srRefreshMonster == nil then svar.srRefreshMonster = {} end
	if svar.srrmRemaining == nil then svar.srrmRemaining = {} end
	if svar.srRefreshMonsterBoss == nil then svar.srRefreshMonsterBoss = {} end
	local s = svar.srRefreshMonster
	local remaining = svar.srrmRemaining
	local nextboss = svar.srRefreshMonsterBoss
	local refreshSave = LocalDT.GetSRRefreshMonsterSave()
	local now = System.getCurrMiniTime()
	for i = 1,#RefreshMonsterData do
		local r = RefreshMonsterData[i]
		local record = LocalDT.GetSRRefreshMonsterRecord(refreshSave, r.bj)
		local scene = Fuben.getSceneHandleById(r.mapid)
		local liveId, liveIndex = LocalDT.GetSRRefreshMonsterLiveId(scene, r)
		local nextTime = tonumber(record.nextTime) or 0
		if nextTime > 0 then
			-- 启动恢复只执行一次，已死亡 BOSS 的截止时间额外提前 30 分钟。
			nextTime = nextTime - 30 * 60
			record.nextTime = nextTime
		end
		if liveId ~= 0 then
			s[r.bj], remaining[r.bj], nextboss[r.bj] = 1, 0, liveIndex
			record.activeId, record.nextIndex, record.nextTime = liveId, liveIndex, 0
		elseif nextTime > now then
			s[r.bj] = 0
			remaining[r.bj] = math.ceil((nextTime - now) / 60)
			nextboss[r.bj] = 0
		else
			local activeId, activeIndex = LocalDT.GetSRRefreshMonsterActiveId(r, record)
			if nextTime > 0 then activeId, activeIndex = r.monid, 0 end
			local monster = LocalDT.CreateSRRefreshMonster(scene, r, activeId, false)
			if monster ~= nil then
				s[r.bj], remaining[r.bj], nextboss[r.bj] = 1, 0, activeIndex
				record.activeId, record.nextIndex, record.nextTime = activeId, activeIndex, 0
			else
				s[r.bj], remaining[r.bj], nextboss[r.bj] = 0, 0, activeIndex
			end
		end
	end

	-- 开服全民 BOSS 的击杀状态也按持久截止时间恢复。
	local bossSave = System.getStaticVar()
	if bossSave.qmBossNextTime == nil then bossSave.qmBossNextTime = {} end
	if svar.qmBossTime == nil then svar.qmBossTime = {} end
	if svar.qmBossisKill == nil then svar.qmBossisKill = {} end
	for _, boss in pairs(OpenServerAward[7].list[1].boss) do
		local nextTime = tonumber(bossSave.qmBossNextTime[boss.id]) or 0
		if nextTime > 0 then
			nextTime = nextTime - 30 * 60
			bossSave.qmBossNextTime[boss.id] = nextTime
		end
		if nextTime > now then
			svar.qmBossisKill[boss.id] = 1
			svar.qmBossTime[boss.id] = math.ceil((nextTime - now) / 60)
		else
			svar.qmBossisKill[boss.id] = 0
			svar.qmBossTime[boss.id] = 0
		end
	end
	System.saveStaticVar()
end

function SRRefreshMonster()
    local svar = System.getDyanmicVar()
    if svar.srRefreshMonsterTime == nil then svar.srRefreshMonsterTime = 0 end
    svar.srRefreshMonsterTime = svar.srRefreshMonsterTime + 1
    if svar.srRefreshMonster == nil then svar.srRefreshMonster = {} end
    if svar.srrmRemaining == nil then svar.srrmRemaining = {} end
    if svar.srRefreshMonsterBoss == nil then svar.srRefreshMonsterBoss = {} end
    local s = svar.srRefreshMonster
    local remaining = svar.srrmRemaining
    local nextboss = svar.srRefreshMonsterBoss
    local refreshSave = LocalDT.GetSRRefreshMonsterSave()
    local now = System.getCurrMiniTime()
    local openday = System.getDaysSinceOpenServer()
    local staticChanged = false

    for i = 1, #RefreshMonsterData do
        local r = RefreshMonsterData[i]
        local record = LocalDT.GetSRRefreshMonsterRecord(refreshSave, r.bj)
        local scene = Fuben.getSceneHandleById(r.mapid)
        local liveId, liveIndex = LocalDT.GetSRRefreshMonsterLiveId(scene, r)
        local nextTime = tonumber(record.nextTime) or 0
        if liveId ~= 0 then
            s[r.bj], remaining[r.bj], nextboss[r.bj] = 1, 0, liveIndex
            if record.activeId ~= liveId or record.nextIndex ~= liveIndex or nextTime ~= 0 then
                record.activeId, record.nextIndex, record.nextTime = liveId, liveIndex, 0
                staticChanged = true
            end
        elseif nextTime > now then
            s[r.bj] = 0
            remaining[r.bj] = math.ceil((nextTime - now) / 60)
            nextboss[r.bj] = 0
        else
            local activeId, activeIndex = LocalDT.GetSRRefreshMonsterActiveId(r, record)
            if nextTime > 0 then activeId, activeIndex = r.monid, 0 end
            local monster = LocalDT.CreateSRRefreshMonster(scene, r, activeId, true)
            if monster == nil then
                s[r.bj], remaining[r.bj], nextboss[r.bj] = 0, 0, activeIndex
            else
                s[r.bj], remaining[r.bj], nextboss[r.bj] = 1, 0, activeIndex
                record.activeId, record.nextIndex, record.nextTime = activeId, activeIndex, 0
                staticChanged = true
                if openday <= r.ts then
                    if System.isCrossServer() ~= true then
                        local MonName = System.getMonsterNameById(activeId)
                        local SceneName = Fuben.getSceneNameById(r.mapid)
                        System.broadcastTipmsg(string.format("<%s>出现在<%s(%s,%s)>.", MonName, SceneName, r.x, r.y), ttChatWindow);
                    end
                    local playerList = LuaHelp.getSceneActorListById(r.mapid)
                    if playerList ~= nil then
                        for _, player in ipairs(playerList) do
                            if player ~= nil then
                                HandlePlayerEnterSceneBossTips(player, r.mapid)
                            end
                        end
                    end
                end
            end
        end
    end

	--全服活动 BOSS 的显示状态也使用绝对截止时间。
	if svar.qmBossTime == nil then svar.qmBossTime = {} end
	if svar.qmBossisKill == nil then svar.qmBossisKill = {} end
	local bossSave = System.getStaticVar()
	if bossSave.qmBossNextTime == nil then bossSave.qmBossNextTime = {} end
	if openday <= 7 then
		for _, boss in pairs(OpenServerAward[7].list[1].boss) do
			local nextTime = tonumber(bossSave.qmBossNextTime[boss.id]) or 0
			if nextTime > now then
				svar.qmBossisKill[boss.id] = 1
				svar.qmBossTime[boss.id] = math.ceil((nextTime - now) / 60)
			else
				svar.qmBossisKill[boss.id] = 0
				svar.qmBossTime[boss.id] = 0
				if nextTime > 0 then
					bossSave.qmBossNextTime[boss.id] = 0
					staticChanged = true
				end
			end
		end
	end
	if staticChanged then System.saveStaticVar() end
	
end

--@func qlck2 清理当前角色的寻宝仓库物品和寻宝积分,清理寻宝次数变量
function qlck2(sysarg)
	Dmkj.clearStore(sysarg);
	local var = Actor.getStaticVar(sysarg);
	var.TreasureHuntValue = 0;

	set_d_val(sysarg,199,0);
end

--查看当前地图ID
function ckmapid(sysarg)
	local nSceneId = Actor.getSceneId(sysarg);
	Actor.sendTipmsg(sysarg, "当前地图ID: "..nSceneId, 256);
end

--测试特效
function cstx(sysarg,id,type,time)
	id = tonumber(id)
	type = tonumber(type)
	time = tonumber(time)
	--print(id, type, time)
	Actor.addEffect(sysarg, id, type, time, 0)
end

function OnExitGuildBossMap()
    
    System.deleteTimer("OnExitGuildBossMap")
    local playerList = LuaHelp.getSceneActorListById(GuildBossCfgEx.MapID)
    if playerList ~= nil then
		for i = 1, #playerList do
			local player = playerList[i]
			if player then		
                Actor.returnCity(player)
				
			end
		end
	end
end

function OnExitGuildBossMapCountDown()
    System.deleteTimer("OnExitGuildBossMapCountDown")
 
    local playerList = LuaHelp.getSceneActorListById(GuildBossCfgEx.MapID)
    if playerList ~= nil then
		for i = 1, #playerList do
			local player = playerList[i]
			if player then		
                local netPack = DataPack.allocPacket(player,139,175)
                DataPack.writeByte(netPack,0)
                DataPack.writeUInt(netPack,10) --十秒倒计时
                DataPack.flush(netPack)
			end
		end
	end
end

--按ID刷套装
function GiveTotal(sysarg,str)
	if str == nil or str == 0 or str == "" then str = 1; end

	local keyMap = {
		{ "霸主", 1 }, { "通天", 2 }, { "毁灭", 3 }, { "上古", 4 }, 
		{ "起源", 5 }, { "誓言", 6 }, { "冲天", 7 }, { "菩提", 9 }, 
		{ "无尘", 11 }, { "芙蓉", 13 },
		{ "十一", 11 }, { "十三", 13 }, 
		{ "一", 1 }, { "二", 2 }, { "三", 3 }, { "四", 4 }, 
		{ "五", 5 }, { "六", 6 }, { "七", 7 }, { "九", 9 }
	}

	local key = nil
	if type(str) == "number" then
		key = str
	elseif type(str) == "string" then
		local num = tonumber(str)
		if num then
			key = num
		else
			for _, v in ipairs(keyMap) do
				if string.find(str, v[1]) then
					key = v[2]
					break
				end
			end
		end
	end

	local tz = {
		[1] = { name = "霸主一转套", startId = 430 },
		[2] = { name = "通天二转套", startId = 439 },
		[3] = { name = "毁灭三转套", startId = 448 },
		[4] = { name = "上古四转套", startId = 577 },
		[5] = { name = "起源五转套", startId = 586 },
		[6] = { name = "誓言六转套", startId = 595 },
		[7] = { name = "冲天七转套", startId = 87 },
		[9] = { name = "菩提九转套", startId = 114 },
		[11] = { name = "无尘十一转套", startId = 141 },
		[13] = { name = "芙蓉十三转套", startId = 168 },
	};

	if key and tz[key] then
		local a = tz[key].startId;
		local job = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION);
		if job == 2 then
			a = a + 9;
		elseif job == 3 then
			a = a + 18;
		end

		for i = 1, 9 do
			local itemid = a + i - 1;
			local num = 1;
			if i == 6 or i == 7 then
				num = 2;
			end
			Actor.addItem(sysarg, itemid, 0, 0, num);
		end
		Actor.sendTipmsg(sysarg, "成功获取 [" .. tz[key].name .. "] 全套！", 1);
	else
		Actor.sendTipmsg(sysarg, "没有找到相关套装,请重新输入.", 256);
	end
end

--gfunc GmGiveLongTeng 套衣
--大天·龙腾圣装发放 (支持性别判断，修正手镯戒指两个，腰带/圣带一个)
function GmGiveLongTeng(sysarg)
	local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)
	-- 男圣甲: 7274, 女圣衣: 7275
	local clothId = 7274
	if nSex == 1 then
		clothId = 7275
	end

	local items = {
		{ id = 7273, count = 1 }, -- 大天·龙腾圣武
		{ id = clothId, count = 1 }, -- 衣服/圣甲/圣衣 (按性别)
		{ id = 7276, count = 1 }, -- 大天·龙腾圣盔
		{ id = 7277, count = 1 }, -- 大天·龙腾圣链
		{ id = 7278, count = 2 }, -- 大天·龙腾圣镯 (手镯2个)
		{ id = 7279, count = 2 }, -- 大天·龙腾圣戒 (戒指2个)
		{ id = 7280, count = 1 }, -- 大天·龙腾圣带 (圣带/腰带1个)
		{ id = 7281, count = 1 }, -- 大天·龙腾圣靴 (圣靴1个)
	}

	for _, v in ipairs(items) do
		Actor.addItem(sysarg, v.id, 0, 0, v.count, 1, 0, "GM大天龙腾套发放")
	end
	Actor.sendTipmsg(sysarg, "大天·龙腾圣装全套发放成功！", ttFlyTip)
end

--gfunc GmGiveZhiZun 套衣
--神·至尊屠龙刀发放 (支持性别判断)
function GmGiveZhiZun(sysarg)
	local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)
	-- 男神甲: 7622, 女神衣: 7623
	local clothId = 7622
	if nSex == 1 then
		clothId = 7623
	end

	local items = {
		{ id = 7621, count = 1 }, -- 神·至尊屠龙刀 (圣武)
		{ id = clothId, count = 1 }, -- 衣服/至尊甲/至尊衣 (按性别)
		{ id = 7624, count = 1 }, -- 神·至尊屠龙盔
		{ id = 7625, count = 1 }, -- 神·至尊屠龙链
		{ id = 7626, count = 2 }, -- 神·至尊屠龙戒 (戒指2个)
		{ id = 7627, count = 2 }, -- 神·至尊屠龙镯 (手镯2个)
		{ id = 7628, count = 1 }, -- 神·至尊屠龙带 (至尊带/腰带1个)
		{ id = 7629, count = 1 }, -- 神·至尊屠龙靴
	}

	for _, v in ipairs(items) do
		Actor.addItem(sysarg, v.id, 0, 0, v.count, 1, 0, "GM神至尊套发放")
	end
	Actor.sendTipmsg(sysarg, "神·至尊屠龙全套发放成功！", ttFlyTip)
end

--gfunc GmOneKeyFullAttribute 给属性拉满
-- 属性21亿调整GM命令
function GmOneKeyFullAttribute(sysarg)
	local fullValue = 2100000000

	-- 1. 等级调整为255级
	Actor.setIntProperty(sysarg, PROP_CREATURE_LEVEL, 255)

	Actor.setUIntProperty(sysarg, PROP_ACTOR_MAGIC_SOUL, fullValue)       -- 护符碎片
	Actor.setUIntProperty(sysarg, PROP_ACTOR_SHIELD_SPIRIT, fullValue)     -- 护盾碎片
	Actor.setUIntProperty(sysarg, PROP_ACTOR_GEM_CRYSTAL, fullValue)       -- 宝石结晶
	Actor.setUIntProperty(sysarg, PROP_ACTOR_PEARL_CHIP, fullValue)        -- 圣珠结晶
	Actor.setUIntProperty(sysarg, PROP_ACTOR_RING_CRYSTAL, fullValue)      -- 特戒结晶
	Actor.setUIntProperty(sysarg, PROP_ACTOR_ACIEVEPOINT, fullValue)       -- 成就值/成就点
	Actor.setUIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL, fullValue)       -- 转生灵力/转生经验
	Actor.setUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE, fullValue)       -- 功勋值/荣誉值

	-- 4. 斗笠精华 / 军魂值 / 心法值 / 元神灵力 / 注魂值 / 灵力 / 龙灵经验值 / 灵宠献祭点数
	local var = Actor.getStaticVar(sysarg)
	if var ~= nil then
		if var.newdays == nil then var.newdays = {} end
		var.MianJinZhi = fullValue -- 斗笠精华值
		var.JunGuZhi = fullValue   -- 军魂值
	end

	-- 斗笠界面通知同步
	if SendMianJuInfo ~= nil then
		SendMianJuInfo(sysarg)
	end
	
	-- 军鼓界面通知同步
	if SendJunGuInfo ~= nil then
		SendJunGuInfo(sysarg)
	end

	-- 心法值 / 内功经验
	Actor.setUIntProperty(sysarg, PROP_ACTOR_INNER_EXP, fullValue)
    -- 心法值 (XinFa 材料积累量)
    Actor.setXinFaValue(sysarg, fullValue)
    -- 心法等级 --- 设置为配置最大等级
    if XinFaSystemCfg ~= nil and XinFaSystemCfg.XinFaLevelUp ~= nil then
        Actor.setXinFaData(sysarg, #XinFaSystemCfg.XinFaLevelUp)
    end

	-- 元神灵力
	Actor.setUIntProperty(sysarg, PROP_ACTOR_YUANSHEN_EXP, fullValue)

	-- 注魂值
	if Actor.setSoulValue ~= nil then
		Actor.setSoulValue(sysarg, fullValue)                             -- 注魂值
	end

	-- 灵力 / 灵宠灵力
	Actor.setUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE, fullValue)

	-- 龙灵经验值
	Actor.setUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_EXP, 100000)  -- 龙灵

	-- 灵宠献祭点数
	if Actor.setSpiritPetExp ~= nil then
		Actor.setSpiritPetExp(sysarg, fullValue)                           -- 祭祀/灵宠献祭值
	end

	-- 血炼精华
	Actor.setXueLianValue(sysarg, fullValue)

	-- 5. 个人变量级及声望等辅助备份
	if var ~= nil then
		if var.d == nil then var.d = {} end
		var.d[12] = fullValue -- 额外声望/功勋值
		var.godSoulValue = fullValue -- 神魂/注魂备份值
		var.allOffLineTime = fullValue
	end

	Actor.collectOperate(sysarg, 0) -- 重新核算人物最新属性属性
	Actor.sendTipmsg(sysarg, "各类材料一键21亿及255满级设置成功！", ttFlyTip)
end

--临时调整函数
function skilltest(sysarg,skillid,lv)
	Actor.delSkill(sysarg,skillid);
	Actor.startLearnSkill(sysarg,skillid,lv);
end


--刷毒龙测试装备给指定玩家,测试职业平衡用的GM命令
--@func csitem "锦衣卫"
function csitem(sysarg,name)
	local player = Actor.getActorPtrByName(name);
	--print(name,player)
	if player then
		local d = {
			{683,709,710},
			{683,711,712},
			{683,713,714},
		};
		local job = Actor.getIntProperty(player,PROP_ACTOR_VOCATION);
		d = d[job];
		for i = 1,#d do
			Actor.addItem(player, d[i], 0, 0, 1, 1);
		end
		Actor.sendTipmsg(sysarg, "给予玩家["..name.."]测试套装OK.", 256);
	else
		Actor.sendTipmsg(sysarg, "给予失败,请输入需要给予的玩家名字.", 256);
	end
end

function fuwen(sysarg,id)
	if id == nil or id == 0 then id = 1 end
	id = tonumber(id);
	local d = BossRuneCfg.drop;
	if d[id] then d = d[id]; end

	for i = 1,#d.item do
		local itemid = d.item[i];
		local pUserItem = Item.createItem(itemid,1,0,0,1);
		
		for k = 1,5 do
			Item.SetItemRuneAttr(sysarg, pUserItem, (k-1), d.attr[k].type, d.attr[k].value[7]);
		end
		
		Item.addItem(sysarg,pUserItem);
	end



	Actor.sendTipmsg(sysarg, "ok", 256);






end

function setd(sysarg,var,n)
	if not var then
		Actor.sendTipmsg(sysarg,"<no var>",256);
		return;
	end
	if not n then
		Actor.sendTipmsg(sysarg,"<no n>",256);
		return;
	end
	var = tonumber(var);
	n = tonumber(n);
	local oldvar = get_d_val(sysarg,var);
	set_d_val(sysarg,var,n);
	Actor.sendTipmsg(sysarg,string.format("var<%s> = <%s> -> <%s>",var,oldvar,get_d_val(sysarg,var)),256+128);

end

function addm(sysarg)
	local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	print("actor_id="..actor_id)
    System.AddMail(actor_id,6,0,"测试邮件","邮件标题",0,0,"6014,1,1/7039,2,1/")
   -- System.AddMail(actor_id,0,0,"测试邮件","亲爱的玩家，\\\\恭喜您升至70级，加入一个强大的行会将真正的开启无兄弟不传奇的追日旅程。\\\\加入行会您将获得以下主要福利：\\\\1.互换装备：使用贡献值可兑换行会仓库中的装备，装备打不到再也不用愁了！\\\\2.行会加成：加入行会即可获得攻击力加成\\\\3.行会活动：王城霸主、行会激战等众多行会专属活动等待着您的参加。\\\\并且创建或加入行会后，可拿到行会大礼包，海量奖励领到手软。\\\\祝游戏愉快！")
end


--测试转职
function TestChangeJob(sysarg,Job)
    Job = tonumber(Job)
    Actor.changeVocation(sysarg,Job)

end

function TestExpBall(sysarg)
    local itemId =482
    local itemPtr = Item.createItem(itemId,1)
    Item.addItem(sysarg,itemPtr)
    local maxDua = Item.getItemPropertyById(itemId, Item.ipItemStaticDuaMax)
   
    Item.changeHpPotValue(sysarg,itemPtr,maxDua)
   
end

function ChangeEquipForId(sysarg,id)

    id  = tonumber(id)
    local pItemPtr = Item.getEquipByPos(sysarg,0)
    Item.setItemProperty(sysarg,pItemPtr,Item.ipItemID,id) 
end
function TestZhenBaoXiang(sysarg,count)
    count = tonumber(count)

    local item={}
    for i =1,count do
       OnTresureBoxInit(sysarg,true)
       local itemid = 0  --=  GetTresureBoxItem(sysarg,0,true) 
      -- print( GetTresureBoxItem(sysarg,0,true))
 
        for j =1,4 do
            YaoTresureBoxItem(sysarg,true)
            itemid = GetTresureBoxItem(sysarg,1,true) 
           
             table.insert(item,itemid)   
        end
    end
    local str =""
    for i = 1,table.getn(item) do
       
        str = str..Item.getItemName(item[i]).."\n"
    end
    
    Actor.sendTipmsg(sysarg,str,ttDialog)
end

function HandleFubenManager()
    local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
    for k, plyPtr in ipairs(playerList or {}) do
         HandleLoginFubenManagerEx(plyPtr)
       
    end
    --System.trace("清除副本材料成功"..msg)
end

function HandleLoginFubenManagerEx(sysarg)
    local arr_Var = {
        {type = 20,value=124,count=10000,},
        {type = 21,value=126,count=10000,},
        {type = 22,value=125,count=800,},
        {type = 23,value=127,count=800,},
--        {type = 24,value=1,count=80,},
--        {type = 25,value=1,count=80,},
        {type = 32,value=134,count=2500,},}
    local szName = Actor.getName(sysarg)
    local szVarMsg = ""
    local bClear = false
    for i = 1,table.getn(arr_Var) do
        local varCount = get_d_val(sysarg,arr_Var[i].type)
        if varCount < 0 then
            local decNum = math.abs(varCount* arr_Var[i].count) 
            local oldValue = Actor.getIntProperty(sysarg,arr_Var[i].value)
            oldValue = oldValue -decNum 
            if oldValue < 0 then
                oldValue = 0
                decNum = Actor.getIntProperty(sysarg,arr_Var[i].value)
            end
            Actor.setUIntProperty(sysarg,arr_Var[i].value,oldValue)
            
            szVarMsg = szVarMsg.."type:"..arr_Var[i].type.."count:"..varCount.."value:"..decNum
            set_d_val(sysarg,arr_Var[i].type,0)
           
            bClear = true
        end
    end
    if bClear then 
        System.trace("清除副本材料成功"..szVarMsg.."玩家:"..szName)
        --return   szName,szVarMsg 
       
         
    end
    return nil
end

function setzs(sysarg,n)
	Actor.setActorCircle(sysarg,tonumber(n));
end

function TestOpenUpdateGift(sysarg,state)

    SetUpdateGiftState(state)
end

--勿删，全局函数会调用
function SetUpdateGiftState(state)
    state = tonumber(state)
    local sVar = System.getDyanmicVar()
    sVar.openupdategift = state
    if sVar.openupdategift == 1 then
        sVar.GiveUpdateGift = nil
    end
end

function ChangeDuanZiShou(sysarg,szName,nPos) 
    local actorPtr = System.getActorPtr(szName)
    if actorPtr == nil then 
        Actor.sendTipmsg(sysarg,szName.."玩家不在线！",ttFlyTip)
        return
    end
    if Actor.getGuildId(actorPtr) == 0 then
        ctor.sendTipmsg(sysarg,szName.."该玩家没有加入帮派！",ttFlyTip)
        return
    end 

    if nPos == nil then nPos = 0 end
    nPos = tonumber(nPos)
    for i=0,6 do
        if nPos ~= i then
            Actor.setSocialMask(actorPtr,i,false)
        else
             Actor.setSocialMask(actorPtr,i,true) 
        end
    
    end
    Actor.sendTipmsg(sysarg,szName.."成功。",ttFlyTip)
end

function DeleteBuffToPlayer(sysarg,szName,buffType,group)
    buffType = tonumber(buffType)
    group = tonumber(group)
    local pActor = System.getActorPtr("最后的抉择")
    if pActor ~= nil then
        Actor.delBuff(pActor,buffType,group)
        Actor.sendTipmsg(sysarg,"成功",ttDialog)
        return
    end
    Actor.sendTipmsg(sysarg,"失败",ttDialog)
end


function TestOldPlayerPay(sysarg)
    local var = Actor.getStaticVar( sysarg )
	var.FirstRechargeFlag = 2 
    var.buyoldgod = nil
end

function TestEquipGemLevel(sysarg,nLevel)
    nLevel= tonumber(nLevel)	
	for i=1,20 do 
		for j=1,6 do 
			Actor.setEquipSlotGemLevel(sysarg,i,j,0)
		end 
	end
    local nIndex = 0
    for i =1,20 do
        for j=1,6 do 
            if nIndex >= nLevel then break end
			Actor.setEquipSlotGemLevel(sysarg,i,j,5)
            nIndex=nIndex + 5
           
		end 
    end
    Actor.collectOperate(sysarg,0)
end

function TestStopAutoFight(sysarg)
    Actor.stopAutoFight(sysarg)

end

function TestcampKillCount(sysarg,nCount)
    if nCount == nil then nCount = 0 end
    local svar = Actor.getStaticVar(sysarg)
     svar.campKillCount = nCount
    if svar.campKillCount >= 1000 then
		Actor.setTopTitle(sysarg,Title.CampKill,true)
    else 
        Actor.setTopTitle(sysarg,Title.CampKill,false)
	end
     send_headtitle_data(sysarg)

end


function ClearVIPAwardInfo()
    local sDvar = System.getDyanmicVar()
    sDvar.clearvipflag = 1
    local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
	for k, plyPtr in ipairs(playerList or {}) do
        local var = Actor.getStaticVar(plyPtr)
        Actor.setVipFlags(plyPtr, 0)
        var.clearvipflag = 1
    end
    

end

function BossRefresTest()
    local svar = System.getDyanmicVar(sysarg);
    svar.aaa = svar.aaa + 1
--	local s = svar.srRefreshMonster;		--记录是否存活,1为存活,0为没有
--	local remaining = svar.srrmRemaining;	--记录刷怪剩余时间,如果等于0就刷
--	if s == nil then svar.srRefreshMonster = {}; s = svar.srRefreshMonster; end
--	if remaining == nil then svar.srrmRemaining = {}; remaining = svar.srrmRemaining; end
--	for i = 1,#RefreshMonsterData do
--		local r = RefreshMonsterData[i];
--		local SceneHandle = Fuben.getSceneHandleById(r.mapid);

--        Fuben.clearMonster(SceneHandle,r.monid)
--	end
--    svar.srRefreshMonster = nil
--    svar.srrmRemaining = nil
--    SRRefreshMonsterEx()
--    System.addTimer("SRRefreshMonsterEx", 1000, 1);
--	System.addTimer("SRRefreshMonster", 60000, -1);
end

--function LookOpenServerDay(sysarg)
--    local nDay = System.getDaysSinceOpenServer()
--    local nDayEx = 0
--    local svar = System.getStaticVar()
--    if svar.tehuinewday ~= nil then
--        nDayEx = svar.tehuinewday
--    end
--    Actor.sendTipmsg(sysarg,"当前开区天数:"..nDay.."竞技礼包:"..nDayEx,ttDialog)

--end
--function JingjiGiftSync(sysarg,nDay)
--    nDay = tonumber(nDay)
--     local svar = System.getStaticVar()
--     svar.tehuinewday = nDay
--end


function BiaoCheNearEntity(sysarg)
    local entityList = LuaHelp.getNearEntityList( sysarg, 20)
    if entityList == nil then return end
    print("数量:"..#entityList)
	for k, ptr in ipairs(entityList or {}) do
		print("类型:"..Actor.getEntityType( ptr ).."name:"..Actor.getName(ptr))
	end

end

function ClearBiaoChe(sysarg)
    local sVar = Actor.getStaticVar(sysarg)
    sVar.days.darttms = 0
end

function TestOpenAward(sysarg,type,index)
    type = tonumber(type)
    index = tonumber(index)
    GiveOpenServerAward(sysarg,type,index)
end

--下发玩家数据
function send_actor_data_on_login(sysarg)
   
	local svar = Actor.getStaticVar(sysarg)
    if svar.rankinfo == nil then svar.rankinfo = {} end
    if svar.rankinfo.win == nil then svar.rankinfo.win = 0 end        --成功场次
    if svar.rankinfo.failed == nil then svar.rankinfo.failed = 0 end --失败场次
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sSendActorDataOnLogin)
    if svar.rankjjcount == nil then svar.rankjjcount = 5 end
    DataPack.writeByte(netPack,svar.rankjjcount)
    DataPack.writeInt(netPack,svar.rankinfo.win);
    DataPack.writeInt(netPack,svar.rankinfo.failed)

    --个人竞技
    if svar.singlerankpoint == nil then svar.singlerankpoint = 1000 end
    if svar.singleinfo == nil then 
        svar.singleinfo = {} 
        svar.singleinfo.win = 0 --胜利次数 
        svar.singleinfo.count = 0 --参与场次
    end
    DataPack.writeInt(netPack,svar.singlerankpoint)
    DataPack.writeInt(netPack,svar.singleinfo.win)
    DataPack.writeInt(netPack,svar.singleinfo.count)
    if svar.singleinfoday == nil then svar.singleinfoday = 0 end
    DataPack.writeInt(netPack,svar.singleinfoday)
    DataPack.writeInt(netPack,svar.xianzuan)
	DataPack.flush(netPack)
end

--跨服完成
function OnCrossFinshed(sysarg, crossType)	
	local sceneName=""
	local pCir = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
	if pCir<3 then 
		return 
	end
	
	local index = math.floor((pCir-3)/2)+1
	--if CrossServer.EnterScene[index]==nil then 
	--if CrossServerConfig.EnterScene[index] ==nil then 
	--	return 
	--end
	
	--local sceneName = Fuben.getSceneNameById( GlobalConfig.CrossServer.EnterScene[index].nSceneId)  
	--local noticeStr = string.format("<(n%s)>进入%s,掉落稀有远古战装！<我也要去/@@showWin,222>",Actor.getName(sysarg),sceneName)	
	local noticeStr = nil
	if crossType == 1 then -- 远古押镖
		noticeStr = string.format("<(n%s)>进入远古押镖场景,奖励大量远古积分!<我也要去/@@showWin,222,3>",Actor.getName(sysarg))
	elseif crossType == 0 then --远古战场
		noticeStr = string.format("<(n%s)>进入%s,掉落稀有远古战装!<我也要去/@@showWin,222>",Actor.getName(sysarg),"远古战场")
    elseif crossType == 2 then --3v3竞技场
        noticeStr = string.format("<(n%s)>进入%s,挥洒热血,战斗不休！<我也要去/@@showWin,222>",Actor.getName(sysarg),"3v3竞技场")
	end
	if noticeStr ~= nil then
        System.broadcastTipmsg(noticeStr, 128)
    end
	
end

--测试进入场景
--function enters (sysarg ,sid)
--	sid=tonumber(sid)
--	Actor.enterScene(sysarg,sid,-1,-1)
--end

function TetstRefReliveCD(sysarg)
    Actor.setReliveTimeCD(sysarg,0,0)
end

function SendEnterCrossType(sysarg)
	local enterCrossType = Actor.getEnterCrossType(sysarg)
	if enterCrossType == -1 then return end
	    --一个调试信息
    if enterCrossType == 2 then
        local nSceneId = Actor.getSceneId(sysarg)
        if nSceneId ~= 563 then
            System.trace(string.format("entercrosstype==%d,sceneid:$d,actorid:%d",enterCrossType,nSceneId,Actor.getIntProperty(sysarg,PROP_ENTITY_ID)))
            Actor.killActor(sysarg)
            return
        end

    end
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sEnterCrossType)	
	DataPack.writeByte(netPack, enterCrossType)	
	DataPack.flush(netPack)

end

function SetRankPoint(sysarg,nvalue)
 nvalue = tonumber(nvalue)
  Actor.setIntProperty(sysarg,PROP_ACTOR_RANKPOINT_VALUE,nvalue)
end
function AddYuanGuJiFen(sysarg,nvalue)
    nvalue = tonumber(nvalue)
    Actor.setIntProperty(sysarg,PROP_ACTOR_YUANGU_VALUE,nvalue)

end

function SetDayRankPoint(sysarg,nPoint)
    nPoint = tonumber(nPoint)
    local var = Actor.getStaticVar(sysarg)
    var.rankjjcount = nPoint

end
--function GetPlayerRankPoint(sysarg,actorname)
--    local ptr = System.getActorPtr(actorname)
--    if ptr ~= nil then
--         local nPoint = Actor.getIntProperty(ptr,PROP_ACTOR_RANKPOINT_VALUE)
--         Actor.sendTipmsg(sysarg,"竞技积分:"..nPoint,ttFlyTip)

--    end

--end


function SetDayDayRankCount(sysarg,nPoint)
    nPoint = tonumber(nPoint)
    local playerList = LuaHelp.getAllActorList()
	for k, ptr in ipairs(playerList or {}) do
		local sVar = Actor.getStaticVar(ptr)
        sVar.rankjjcount = nPoint
        send_actor_data_on_login(ptr)
	end

end


function InitNewZodiacInfo(sysarg)
    local svar = Actor.getStaticVar(sysarg)
    if svar.newzodiac == nil then 
        svar.newzodiac = {}
        for i = 1,#NewZodiacCfg.BasicAttr do
            svar.newzodiac[i] = {}
            svar.newzodiac[i].level = -1
            svar.newzodiac[i].exp = 0
        end

    end
    if svar.newzodiaclevel == nil then svar.newzodiaclevel = 0 end --生肖套装操作次数

end
function SendNewZodiacInfo(sysarg,pack)
   InitNewZodiacInfo(sysarg) 
   local bflush = false
  
   local svar = Actor.getStaticVar(sysarg)
   if pack == nil then
     pack = DataPack.allocPacket(sysarg,151,45)
     bflush = true
   end
  
   DataPack.writeInt(pack,svar.newzodiaclevel)
   for i = 1,table.getn(NewZodiacCfg.BasicAttr) do
        DataPack.writeChar(pack,svar.newzodiac[i].level)
        DataPack.writeInt(pack,svar.newzodiac[i].exp)

   end
   if bflush == true then
        DataPack.flush(pack)
   end
   

end

--设置十二生肖套装等级
function SetNewZodiaclevel(sysarg,level)
    level = tonumber(level)
    local svar = Actor.getStaticVar(sysarg)
    svar.newzodiaclevel = level
    Actor.collectOperate(sysarg,0)
end

--设置行会旗帜经验
function SetGuildFlagExp(sysarg,nValue)
    local nGuildId = Actor.getGuildId(sysarg)
    if nGuildId <= 0 then
        Actor.sendTipmsg(sysarg,"无行会,无法设置!",ttFlyTip)
        return
    end

    Guild.setFlagExp(nGuildId,tonumber(nValue))
end

--设置行会旗帜等级
function SetGuildFlagLevel(sysarg,nLevel)
    nLevel = tonumber(nLevel)
    local nGuildId = Actor.getGuildId(sysarg)
    if nGuildId <= 0 then
        Actor.sendTipmsg(sysarg,"无行会,无法设置!",ttFlyTip)
        return
    end
    Guild.setFlagLevel(nGuildId,nLevel)
end

function GetSomeBodyTopBattle(sysarg,name)
	local name =tostring(name)
	--print(name)
	local pActor = Actor.getActorByName(name)
	if pActor then
		local svar = Actor.getStaticVar(pActor)
		if svar.myTopBatter~=nil then 	
			Actor.sendTipmsg(sysarg,"此人最高战力"..svar.myTopBatter,ttFlyTip)
		end
	else 
		Actor.sendTipmsg(sysarg,"没有这人",ttFlyTip)
	end
end

function ekillMonster(sysarg,nMonsterId)
    local hScene = Fuben.getSceneHandleById(Actor.getSceneId(sysarg), 0)
    nMonsterId = tonumber(nMonsterId)
    Fuben.clearMonster(hScene,nMonsterId)

end

--得到发现boss是否开启的天数
function GetkillBossOpenDay()
	
	local opentime = System.getServerOpenTime()
	local y,m,d,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(opentime)	
	if m==1 and d>=10 and d<=15 and y==2018 then  --写相对于更新当天，开区天数为2~7天的开服日期   -d=当天更新日期-1.  再减6 
		local refreshTime = System.encodeNumTime(2018,1,16,0,0,0) --写当天的更新日期
		local nNowDt = System.getCurrMiniTime()
		local diffTime = nNowDt-refreshTime
		--print("days="..(math.floor(diffTime/86400)+1))
		return (math.floor(diffTime/86400)+1)
	else
		--print("days="..System.getDaysSinceOpenServer())
		return System.getDaysSinceOpenServer()
	end
	
end

--修复某个人的任务
function fixTask(sysarg,name)
	local name =tostring(name)
	--print(name)
	local pActor = Actor.getActorByName(name)
	if pActor then
		local svar = Actor.getStaticVar(pActor)
		svar.zkillmon=nil
		svar.zkillmon={}
		svar.zkillmon[1]=0
		Actor.sendTipmsg(sysarg,"修复成功",ttFlyTip)
		Quest_ShuaXin(pActor)
	else 
		Actor.sendTipmsg(sysarg,"没有这人",ttFlyTip)
	end
end

function setRuneCount(sysarg,nCount)
    nCount = tonumber(nCount)
    local var = Actor.getStaticVar(sysarg)
    if var.RuneCount == nil then var.RuneCount = 0 end
    var.RuneCount = nCount

end

--直接设置灵力值
--@func setSB_LingLi "xxx" 100
function setSB_LingLi(sysarg,name,lingli)
	local name =tostring(name)
	local lingli = tonumber(lingli)
	--print(name)
	local pActor = Actor.getActorByName(name)
	if pActor then
		Actor.setUIntProperty(pActor, PROP_ACTOR_LINGLI_VALUE,lingli) --给灵力值
		Actor.sendTipmsg(sysarg,"设置成功当前灵力:"..Actor.getUIntProperty(pActor, PROP_ACTOR_LINGLI_VALUE),ttFlyTip)
	else 
		Actor.sendTipmsg(sysarg,"没有这人",ttFlyTip)
	end
end

-- 穿戴至尊装备回调
function OnTakeOnZhizunEquip(sysarg, equimentId, equimentCount, slotPos)

	local var = Actor.getStaticVar(sysarg)
	local ZhizunEquipMaxCount = var.ZhizunEquipMaxCount
	if ZhizunEquipMaxCount == nil then
		ZhizunEquipMaxCount = 0
	else
		if ZhizunEquipMaxCount >= 10 then -- 最大10件
			-- 都提示过了
			return
		end
	end
	
	local pos_list = { itDragonSlayingPos, itZhizunDressPos, itZhizunHelmetPos, itZhizunNecklacePos, itZhizunLeftRingPos, 
		itZhizunRightRingPos, itZhizunLeftBraceletPos, itZhizunRightBraceletPos, itZhizunGirdlePos, itZhizunShoesPos }
	
	local equipCount = 0
	for i, v in ipairs(pos_list) do
		local equipItem_ptr = Item.getEquipByPos(sysarg, v)
		if equipItem_ptr ~= nil then
			equipCount = equipCount + 1
		end
	end
	
	if equipCount < 4 or equipCount <= ZhizunEquipMaxCount then
		return -- 提示过了
	end	

	if equipCount == 4 or equipCount == 6 or equipCount == 8 or equipCount == 10 then
		var.ZhizunEquipMaxCount = equipCount
		-- 激活至尊装备套装属性全平台广播
		local szLocalServer = ""
		local nLocalServerId = System.getLocalServerId()
                       
        if  nLocalServerId >= 50000 and nLocalServerId <= 59999 then
            szLocalServer = "不删档"..(nLocalServerId - 50000)
        else
            szLocalServer = tostring(nLocalServerId)
        end
							
		System.SendPlatformMsg(string.format("<(c0xFF00c0ff)%s区>玩家<(n%s)>太强了,竟然集齐了%d件至尊屠龙,实力逆天啊！<我也要至尊屠龙/@@showWin,200,2>",szLocalServer,Actor.getName(sysarg),equipCount), ttMousePosTip+ttChatWindow)
	
	end

end

-- 广播熊猫林还剩余多少只怪（前端要显示）
function BroadcastXiongMaoLinMonsterCount()
	local hScene = Fuben.getSceneHandleById(668)
	local count = Fuben.getLiveMonsterCount(hScene, 0)
	
	local playerList = LuaHelp.getSceneActorListById(668)		
	for i, v in ipairs(playerList or {}) do		
		local netPack = DataPack.allocPacket(v, 151, LogicCmd.miscSysEx.sub.sXiongMaoLinMonsterCount)
		DataPack.writeInt(netPack, count)	
		DataPack.flush(netPack)
	end
end

function testAddBuff(sysarg , id)
	id = tonumber(id)
	Actor.addBuffById(sysarg, id)
end

function testdelBuff(sysarg , id)
	id = tonumber(id)
	Actor.delBuffById(sysarg, id)
end


-- 开启散人红利活动的 GM 命令函数
function srhlkq(sysarg)
    local svar = System.getStaticVar()
    -- 设置活动开启状态为第 1 天
    svar.isDringSanRenHongLi = 1
    -- 记录活动开始的分钟时间
    svar.StartSRHL_MiNitime = System.getCurrMiniTime()
    -- 保存系统静态变量
    System.saveStaticVar()

    -- 启动散人红利每日充值排行榜
    daily_pay_ranking_start(svar.isDringSanRenHongLi, 3, 0)

    -- 记录活动开启的日志
    System.trace("start SanRenHongLi, StartSRHL_MiNitime =".. svar.StartSRHL_MiNitime)
end    

-- 开启庆典活动的 GM 命令函数
function qdhdkq(sysarg)
    local svar = System.getStaticVar()
	-- 调用清理函数
    ClearHongYunDangTouSystemData()

	-- 初始化庆典开启天数，避免首日时开关判定直接返回。
	if svar.QingDian_openDay == nil or svar.QingDian_openDay < 1 then
		svar.QingDian_openDay = 3
	end
	if svar.QingDian_type == nil then
		svar.QingDian_type = 0
	end

    -- 设置庆典活动开启状态为第 1 天
    svar.isDringQingDianActivity = 1

	-- 兼容庆典活动的正式字段，首日必须写入该时间戳用于玩家数据重置。
	if svar.StartQDHDtime == nil or svar.StartQDHDtime == 0 then
		svar.StartQDHDtime = 1
	else
		svar.StartQDHDtime = svar.StartQDHDtime + 1
	end

	local nowMiniTime = System.getCurrMiniTime()
	svar.StartQDHD_MiNitime = nowMiniTime
	-- 保留旧字段，兼容历史逻辑。
	svar.StartCelebration_MiNitime = nowMiniTime

    -- 保存系统静态变量
    System.saveStaticVar()

	OnYbConsumeRanking_ActivityStart(svar.StartQDHDtime)

    -- 启动庆典活动每日充值排行榜
    daily_pay_ranking_start(svar.isDringQingDianActivity, 3, 0)

    -- 记录庆典活动开启的日志
    System.trace("start CelebrationActivity, StartQDHD_MiNitime =".. svar.StartQDHD_MiNitime .. ", QingDian_openDay=" .. svar.QingDian_openDay)
end

-- 1. 等级调整GM命令
-- @func setlevel 255
function setlevel(sysarg, val)
	val = tonumber(val) or 255
	Actor.setIntProperty(sysarg, PROP_CREATURE_LEVEL, val)
	Actor.collectOperate(sysarg, 0) -- 重新核算人物最新属性属性
	Quest_ShuaXin(sysarg) -- 刷新任务
	Actor.sendTipmsg(sysarg, string.format("设置等级为 %d 级成功！", val), ttFlyTip)
end

-- 2. 护符碎片设置GM命令
-- @func sethufu 50000
function sethufu(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_MAGIC_SOUL, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「护符碎片」为 %d 成功！", val), ttFlyTip)
end

-- 3. 护盾碎片设置GM命令
-- @func setdun 50000
function setdun(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_SHIELD_SPIRIT, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「护盾碎片」为 %d 成功！", val), ttFlyTip)
end

-- 4. 宝石结晶设置GM命令
-- @func setbaoshi 50000
function setbaoshi(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_GEM_CRYSTAL, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「宝石结晶」为 %d 成功！", val), ttFlyTip)
end

-- 5. 圣珠结晶设置GM命令
-- @func setshengzhu 50000
function setshengzhu(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_PEARL_CHIP, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「圣珠结晶」为 %d 成功！", val), ttFlyTip)
end

-- 6. 特戒结晶设置GM命令
-- @func settejie 50000
function settejie(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_RING_CRYSTAL, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「特戒结晶」为 %d 成功！", val), ttFlyTip)
end

-- 7. 成就点设置GM命令
-- @func setchengj 50000
function setchengj(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_ACIEVEPOINT, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「成就点」为 %d 成功！", val), ttFlyTip)
end

-- 8. 转生灵力设置GM命令
-- @func setzsll 50000
function setzsll(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「转生灵力」为 %d 成功！", val), ttFlyTip)
end

-- 9. 功勋/荣誉值设置GM命令
-- @func setgongxun 50000
function setgongxun(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「功勋/荣誉值」为 %d 成功！", val), ttFlyTip)
end

-- 10. 斗笠精华设置GM命令
-- @func setdouli 50000
function setdouli(sysarg, val)
	val = tonumber(val) or 2100000000
	local var = Actor.getStaticVar(sysarg)
	if var ~= nil then
		if var.newdays == nil then var.newdays = {} end
		var.MianJinZhi = val
	end
	if SendMianJuInfo ~= nil then
		SendMianJuInfo(sysarg)
	end
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「斗笠精华」为 %d 成功并同步！", val), ttFlyTip)
end

-- 11. 军魂值设置GM命令
-- @func setjunhun 50000
function setjunhun(sysarg, val)
	val = tonumber(val) or 2100000000
	local var = Actor.getStaticVar(sysarg)
	if var ~= nil then
		if var.newdays == nil then var.newdays = {} end
		var.JunGuZhi = val
	end
	if SendJunGuInfo ~= nil then
		SendJunGuInfo(sysarg)
	end
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「军魂值」为 %d 成功并同步！", val), ttFlyTip)
end

-- 12. 心法值设置GM命令
-- @func setxinfa 50000
function setxinfa(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setXinFaValue(sysarg, val)
	if XinFaSystemCfg ~= nil and XinFaSystemCfg.XinFaLevelUp ~= nil then
		Actor.setXinFaData(sysarg, #XinFaSystemCfg.XinFaLevelUp)
	end
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「心法值」为 %d 且满重成功！", val), ttFlyTip)
end

-- 12_2. 内功经验/内功能量设置GM命令
-- @func setneigong 50000
function setneigong(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_INNER_EXP, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「内功经验/内功能量」为 %d 成功！", val), ttFlyTip)
end

-- 13. 元神灵力设置GM命令
-- @func setyuanshen 50000
function setyuanshen(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_YUANSHEN_EXP, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「元神灵力」为 %d 成功！", val), ttFlyTip)
end

-- 14. 注魂值设置GM命令
-- @func setzhuhun 50000
function setzhuhun(sysarg, val)
	val = tonumber(val) or 2100000000
	if Actor.setSoulValue ~= nil then
		Actor.setSoulValue(sysarg, val)
	end
	local var = Actor.getStaticVar(sysarg)
	if var ~= nil then
		var.godSoulValue = val
	end
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「注魂值」为 %d 成功！", val), ttFlyTip)
end

-- 15. 注灵值设置GM命令
-- @func setlingli 50000
function setlingli(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「灵力/灵宠灵力」为 %d 成功！", val), ttFlyTip)
end

-- 16. 龙灵经验设置GM命令
-- @func setlongling 100000
function setlongling(sysarg, val)
	val = tonumber(val) or 100000
	Actor.setUIntProperty(sysarg, PROP_ACTOR_GUARD_DRAGON_EXP, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「龙灵经验」为 %d 成功！", val), ttFlyTip)
end

-- 17. 灵宠献祭值设置GM命令
-- @func setspiritpet 50000
function setspiritpet(sysarg, val)
	val = tonumber(val) or 2100000000
	if Actor.setSpiritPetExp ~= nil then
		Actor.setSpiritPetExp(sysarg, val)
	end
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「灵宠物自暴献祭经验」为 %d 成功！", val), ttFlyTip)
end

-- 18. 一键发放军团及职位升级全套资料与装备GM命令
-- @func givelegion
function givelegion(sysarg)
	-- 包裹格子检查提示
	if Item.getBagEmptyGridCount ~= nil and Item.getBagEmptyGridCount(sysarg) < 30 then
		Actor.sendTipmsg(sysarg, "注意：当前包裹空位不足 30 格，部分材料或装备可能掉落或无法领取，请清理后重试！", ttFlyTip)
	end

	-- 一元、两仪、三才、五行、六合、八荒、九宫
	local arr_normal = {
		{ name = "一元", weapon = 319, m_cloth = 320, f_cloth = 321 },
		{ name = "两仪", weapon = 328, m_cloth = 329, f_cloth = 330 },
		{ name = "三才", weapon = 337, m_cloth = 338, f_cloth = 339 },
		{ name = "五行", weapon = 355, m_cloth = 356, f_cloth = 357 },
		{ name = "六合", weapon = 364, m_cloth = 365, f_cloth = 366 },
		{ name = "八荒", weapon = 403, m_cloth = 404, f_cloth = 405 },
		{ name = "九宫", weapon = 412, m_cloth = 413, f_cloth = 414 },
	}

	-- 1. 为每个段位循环添加：武器+男女衣服各一套 (各添加一个)
	for _, v in ipairs(arr_normal) do
		Actor.addItem(sysarg, v.weapon, 0, 0, 1, 1, 0, "GM军团升级材料发放-武器")
		Actor.addItem(sysarg, v.m_cloth, 0, 0, 1, 1, 0, "GM军团升级材料发放-男衣服")
		Actor.addItem(sysarg, v.f_cloth, 0, 0, 1, 1, 0, "GM军团升级材料发放-女衣服")
	end

	-- 2. 十方武器+男女衣服各两套
	Actor.addItem(sysarg, 421, 0, 0, 2, 1, 0, "GM军团升级材料发放-十方武器")
	Actor.addItem(sysarg, 422, 0, 0, 2, 1, 0, "GM军团升级材料发放-十方男衣")
	Actor.addItem(sysarg, 423, 0, 0, 2, 1, 0, "GM军团升级材料发放-十方女衣")

	-- 3. 书页 30个 (ID: 469)
	Actor.addItem(sysarg, 469, 0, 0, 30, 1, 0, "GM军团材料-书页")

	-- 4. 一二三转武器各一把 (霸主血刃: 430, 通天神剑: 439, 毁灭灵斩: 448)
	Actor.addItem(sysarg, 430, 0, 0, 1, 1, 0, "GM军团材料-一转武器")
	Actor.addItem(sysarg, 439, 0, 0, 1, 1, 0, "GM军团材料-二转武器")
	Actor.addItem(sysarg, 448, 0, 0, 1, 1, 0, "GM军团材料-三转武器")

	Actor.sendTipmsg(sysarg, "全套军团及职位晋升物资发放成功！(含一元至九宫武器男女衣、十方套衣两组、30书页、1-3转武)", ttFlyTip)
end

-- 19. 血炼精华设置GM命令
-- @func setxuelian 50000
function setxuelian(sysarg, val)
	val = tonumber(val) or 2100000000
	Actor.setXueLianValue(sysarg, val)
	Actor.collectOperate(sysarg, 0)
	Actor.sendTipmsg(sysarg, string.format("设置「血炼精华」为 %d 成功！", val), ttFlyTip)
end

-- 20. 开启/关闭 Boss战爆元宝/爆充值功能 GM命令
-- @func togglebosspay [0或1]
function togglebosspay(sysarg, state)
	local svar = System.getStaticVar()
	if state == nil then
		-- 不带参数时，自动切换当前状态
		if svar.disableBossPayMoney == 1 then
			svar.disableBossPayMoney = 0
		else
			svar.disableBossPayMoney = 1
		end
	else
		state = tonumber(state)
		if state == 0 then
			svar.disableBossPayMoney = 1  -- 0 代表关闭功能
		else
			svar.disableBossPayMoney = 0  -- 1 代表开启功能
		end
	end
	System.saveStaticVar()

	local status = "开启"
	if svar.disableBossPayMoney == 1 then
		status = "关闭"
	end
	Actor.sendTipmsg(sysarg, string.format("【神炉控制】已将「Boss战爆元宝直充」功能设置为：%s！", status), ttDialog)
end

-- 21. 动态设置/调整 Boss战爆元宝的「基础奖励倍率」GM命令
-- @func setbossrate [基础倍率值, 如 1.5 表示 1.5 倍爆率]
function setbossrate(sysarg, rate)
	if rate == nil then
		local svar = System.getStaticVar()
		local curRate = 1.0
		if svar ~= nil and svar.bossPayMoneyBaseRate ~= nil then
			curRate = tonumber(svar.bossPayMoneyBaseRate) or 1.0
		end
		Actor.sendTipmsg(sysarg, string.format("当前Boss爆充值的基础奖励倍率为：%.2f。用法: @setbossrate [倍率浮点值，如2.0/0.5]", curRate), ttDialog)
		return
	end

	rate = tonumber(rate)
	if rate == nil or rate < 0 then
		Actor.sendTipmsg(sysarg, "错误：倍率数值必须是大于或等于 0 的数字！", ttFlyTip)
		return
	end

	local svar = System.getStaticVar()
	svar.bossPayMoneyBaseRate = rate
	System.saveStaticVar()

	Actor.sendTipmsg(sysarg, string.format("【神炉控制】已成功将「Boss战爆元宝/爆充值」的「基础奖励倍率」调整为：%.2f 倍！", rate), ttDialog)
end
