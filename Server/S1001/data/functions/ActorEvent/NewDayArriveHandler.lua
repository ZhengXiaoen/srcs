--lua script
--To do something about Login and Logout
--[[需要凌晨初始化的数据：1、副本次数(fb)；2、好友祝贺次数(friendCong)；3、打坐时间(medi)；4、副本挑战书的使用次数(fbBC)； 

]]

--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "data\config\godWealth\WealthEventConfig.lua" once
--#include "data\functions\ActorEvent\DoCrossDayData.lua" once  --处理跨天数据
--#include "data\functions\player.lua" once
--#include "data\functions\SpecialTitle.lua" once --特权
--#include "data\config\ArdourCamp\ArdourCampCfg.lua" once
--#include "data\config\CliffordConfig.lua" once
--#include "data\functions\RedPacketFunc.lua" once
--#include "data\functions\SuperLuckStarFunc.lua" once
--#include "data\functions\OldPlayerReturnFunc.lua" once
--#include "data\functions\BlueVipFunc.lua" once

LocalDT.NEWDAY = {}
LocalDT.NEWDAY.MEDITIME = 21600   
LocalDT.NEWDAY.FRIENDCONG = 20      
LocalDT.NEWDAY.FBBC = 3                                                                           
LocalDT.NEWDAY.GETCAMPAWARDCOUNT = 1

--在线跨天或跨天登陆
function OnPlayerCrossDay(sysarg)
	local sVar = System.getDyanmicVar()
	local var = Actor.getStaticVar(sysarg) 
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	var.daygiveitem = nil --大礼包
    var.hldjdayc = 3    --混乱地界进入次数
	var.ArdourCampPoint = ArdourCampCfg.daymaxcount
	--每天副本次数 
	ResetDayFubenTimes(sysarg)
	var.ngexchangecount = nil --等级兑换内功
	-- ACTIVE_CLICK_FIRSTPAY = 1 << 25,		//每天第一次打开首冲礼包
	local flag = Actor.getActorFlag(sysarg,25)
	if flag > 0 then
		Actor.clearActorFlag(sysarg,25)
	end
	var.daygodsoul = {} --神魂值兑换
    --var.tehuigift = {} --神魂特惠与宝石特惠礼包
	if sVar.OpenActivity then sVar.OpenActivity = {} end

    --每天3v3进入次数-- 可累加
    if var.rankjjcount == nil then var.rankjjcount = 0 end
	var.rankjjcount = var.rankjjcount + 5
    if var.rankjjcount > 10 then var.rankjjcount = 10 end
    --下发重置数据
    send_actor_data_on_login(sysarg)
    --祈福跨天重置
   
    if Actor.existTimer(sysarg,46) then
        Actor.deleteTimer(sysarg,46)
    end
    var.clifford = {}
    var.clifford.time = CliffordConfig.FreeTime
    var.clifford.free = 0
    var.clifford.money = 0
    var.clifford.allCount = 0
    Actor.addTimer(sysarg,46,CliffordConfig.DecTimer)
    --每天使用的道具限制次数
    var.useDayItem = nil
	-- 每天统计一次副本进入次数
	if var.d then
		if var.d.fbbuytms and var.days.clfbtms then
			tStaticId = {1, 2, 3, 4, 5,}
			for i = 1, #tStaticId do
				local tms = var.d.fbbuytms[tStaticId[i]];
				if tms ~= nil and tms > 0 and var.days.clfbtms[i] ~= nil then
					if var.days.clfbtms[i] >= tms then
						var.d.fbbuytms[tStaticId[i]] = nil;
					else
						var.d.fbbuytms[tStaticId[i]] = tms - var.days.clfbtms[i];
					end
				end
			end
		end
	end
	
--[[
	var.days = {
		fbtms,											-- 重置副本每天进入次数
		ASMultiple,
		getNewDayYB,								-- 清空每日提取元宝
		allreward,									-- 灵兽献瑞奖励统计={总获得的经验,总获得的绑金}
		PeyNum,											-- 充值数
		PeyFlag,										-- 充值标记
		RepairTime,
		CombineEveryDayGift,
		CombineEveryDayFlag,
		YYGiftFlag,									-- YY领取标识
		mobaiTimes,									-- 城主雕像膜拜次数
		mobaiExp,									-- 城主雕像膜拜经验
		paodianTime,								-- 城主雕像当天参加泡点活动时间
		paodianExp,									-- 城主雕像泡点经验
		mobaiRewardIdx,								-- 城主雕像膜拜奖励索引
		maxBuyTime,									-- 进入副本最大购买次数
		buyPetNum,
--		WuLinZhengBaSignUpFlag,			-- nil=没有报名   1：已经报名   2：在里面被击败了或主动离开场景
		
		--初始化是否显示购买降妖除魔、送皇杠、采集珍珠
		BuyXYChMFlag,								-- 购买降妖除魔标识
--		BuyHuangGangFlag,						-- 购买护送皇杠标识
		BuyCaiJiZhenZhuFlag,				-- 购买采集珍珠标识
		vipPrivilege,								-- 清除VIP每天领取物品的标识
		ExChangeContribution,				-- 每日行会贡献兑换经验次数
		UseBottesNum,								-- 每日领取经验瓶次数
		VipFreeRelive,							-- 清空每日免费复活次数
		freeRideTimes,							-- 清空每日免费进阶坐骑次数
		ChallengeBossNum,						-- 每日可进入挑战BOSS的次数
		buyChallengeBossNum,				-- 每日购买挑战BOSS的次数
		FinishChallengeBoss,				-- 每日完成挑战BOSS的次数
		BuyPetNum,									-- 清空每日召唤宝宝次数
		freeSwingTimes,							-- 清空免费翅膀次数
		EveryDayCircleNum,					-- 清空每日转生次数
		GuildCompeteFlag, 					-- 清空行会争霸进入标志
		failureAward,								-- 清空每日攻城战败安慰奖标志

		civyAward,									-- 清空每日攻城王城全民奖标志
		DoubleEggPay, 							-- 清空双蛋活动每日充值金额
		WholePeople,								-- 清空双蛋全民奖励标记
		FreeDoubleEggAward, 				-- 清空双蛋许愿标识
		GiveAwardCelestineNum, 			-- 清空圣境次数
		BuyMissionFlag, 						-- 清空圣境次数	
		BetaWholePeople, 						-- 清空购买标识			
		ExpRefiningFlag,						-- 清空精炼经验次数
		newEveryDayGiftFlag,  			-- 重置每日充值标识
		newEveryDayPay,							-- 重置每日充值金额数量(该变量不要了，因为已经上线，所以先留着以便上线清除该变量，以后再删除这一行吧)
		CombineFirstPayFlag,				-- 清空合区首冲标记
		everyDayPreferenceFlag,			-- 清空每日购买特惠礼包标记
		guardCount,									-- 每天护镖次数 
		Yabiao6,										-- 六倍押镖清零
		GetPraySnowmanAward,				-- 每天领取雪人礼物
		lootCampDartTimes,					-- 每日劫镖次数
		GetWishItem,								-- 每天领取梦想神符
		ShutupList,									-- 每天禁言列表
		spyCamp,										-- 每天刺探敌营次数
		ZYcount,										-- 每天领取阵营俸禄的次数
		VipFreeTelCnt,							-- 每天速传的次数
		ExtCSValToday,							-- 每日兑换的战魂值数量

		expbox1,
		expbox2,
		xiuweiBoxTime,
		dmkjmj,
		isVoteForImpeach,
		GuildDartOpenTimes,					-- 帮派运镖开启次数
		GuildBossTimes1,
		GuildBossTimes2,
		mygetSbkWealState,					-- 沙巴克福利状态
		getConsumeAwardFlag,
		jadeTime,										-- 经验玉次数
--		ActorApplyTimes,						-- 护送皇杠次数
--		ActorBuyApplyTimes,					-- 购买护送皇杠次数
		FreshFreeTimes,
		--GuildDartTimes,
		enterMiYueTimes,						-- 每天密月次数
		GetBaiFashionFlag,					-- 领取时装标记
		getGrowSeed,								-- 每天领取玫瑰种子
		hotSpring,									-- 每天免费叫鸡
		InteractTimes,							-- 温泉限制项
		heavenFlag,									-- 九天冰宫
		HellFlag,										-- 深渊烈域

		CoinQuestTimes,							-- 天书任务
		VipRewardDate,							-- vip领取每日奖励标记
		OLRWDFlags,									-- 清除领取在线奖励标志
		TReclaimExp, 								-- 清空每天回收的经验总数
		dayflags, 									-- 清空每天状态标志
		CircleQuestId, 							-- 清空每天跑环任务
		killCount, 									-- 清空每天杀死的玩家数
		HonorUC, 										-- 清空每天荣誉令牌使用次数
		DartTimes, 									-- 清空每天护送皇杠完成次数
		xycmCount, 									-- 清空每天降妖除魔完成次数
		cjzzCount, 									-- 清空每天采集珍珠完成次数

		NationalData,								-- 国庆活动数据已经无用了，清空它
		LivenessData,								-- 清空活跃度活动数据
		useLingli,									-- 清空每日使用灵力丹次数
		shopRefresh,								-- 公共商店物品刷新时间
		shopItems,									-- 公共物品
		shopBuyFlags,								-- 公共时间刷新标记
		dmkjTimes, 									-- 清空每日寻宝次数	
		wanglingTimes,							-- 王陵次数
		prctroom, 									-- 当天练功房
		bowlD,
		TGTimes,			 							-- 每日进入天关次数 
		chjTimes,										-- 成就次数标记-- 物品使用次数每日刷新
		barsNum,										-- 金条次数标记
		leftCircle, 								-- 今天剩余的转数(默认是3次)
		activityVal, 								-- 玩家的活跃度清0
		CompensateData,							-- 清空补偿礼包
		ExChangeEneryTimes,					-- 每日等级兑换圣魂值次数
		qdAgain,										-- 再签一次标记
		vipexpbuff,									-- 领取vip经验buff标记
		saodang,									-- 扫荡次数
		freeXYCHM,									-- 已接受免费降妖除魔次数
		buyXYCHM,										-- 购买降妖除魔次数
		clfbtms,										-- 进入材料副本次数
		buyclfbtms,									-- 购买进入材料副本次数
		wzhadtms,										-- 进入未知暗殿次数
		pzxstms,										-- 镖车品质刷新次数
		darttms,										-- 押镖次数
		mbsxidx,										-- 膜拜城主的刷新奖励索引
	};
--]]
	var.days = {};
	
	var.bpbjlType = nil;					-- 奔跑吧兄弟奖励类型 1=一名, 2=二名, 3=三名, 4参与奖 c++有用到
	var.wlzbjlType = nil;					-- 武林争霸奖励类型2=盟主奖,1=参与奖 c++有用到
	var.DeifyCount = nil;									-- 初始化每日封神次数c++有用
	if var.BuyPearlTimes then var.BuyPearlTimes = 3 end  	-- 重置珍珠购买次数
	
	ClearOneHundredData(sysarg)
	ClearSpringFestivalData(sysarg)
	AddLoginAwardInfo(sysarg)
	PlatformEveryDayClear(sysarg, var) --每日平台数据清理
	
	--每天好友祝贺次数 
	local friendCong = var.friendCong
	if friendCong == nil then 
		var.friendCong = {}
		friendCong = var.friendCong
	end
	friendCong[1] = LocalDT.NEWDAY.FRIENDCONG 
	--打坐时间
	Actor.setDefaultPracticeTime(sysarg,LocalDT.NEWDAY.MEDITIME)
	
	--副本挑战书的次数
	local fbBC = var.fbBC
	if fbBC == nil then 
		var.fbBC = {}
		fbBC = var.fbBC
	end
	fbBC[1] = LocalDT.NEWDAY.FBBC  
	
	resetPkExpGetOrDropTimes(sysarg)	--重置玩家每日PK获取或掉落经验次数
	
	Actor.setQuestBookInfo(sysarg, 0, -1, -1)
	
	--重设秒活动副本参加数据
	ResetSecKill(sysarg)
	
	ResetDayData(sysarg)
	--清空锋利值
	--Actor.clearEquipSharp(sysarg)
	
	--清除当天没完成的任务
	removeOldQuests(sysarg)
	
	if Actor.hasQuest(sysarg,WealthEventConfig.events[9].nQuestId[1]) == true then		--有财神任务，放弃财神任务
		Actor.giveupQuest(sysarg,WealthEventConfig.events[9].nQuestId[1])
	end
	
	Actor.setFinishState(sysarg,1)
	
	Actor.setGuildCoinAwardFlag(sysarg, 0, 0)
	Actor.setVipAwardFlag(sysarg, 0)
	
	OnPublicTestPlayerCrossDay(sysarg, var) -- 公测活动(月度活动)
	
	--OnNationalDayPlayerCrossDay(sysarg, var) -- 国庆活动
	
    --VipRecoveryInit_Equip(sysarg) --vip5回收装备新版已屏蔽此功能暂时
	
	--跨天刷新任务栏
	Quest_ShuaXin(sysarg)
	
	local openDay = System.getDaysSinceOpenServer()
	if openDay ==3 and var.SZstart==nil then 
		local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		--System.AddMail(myID,9,0,"开启新系统•神装","")--前端特殊处理了
		var.SZstart = 1
	end 
	
	--特权，每日奖励
	local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
	if IsSpeciaTitleVip(sysarg,1) ==true then 
		var.days.EDspecialR1 =1
		local strAward = ""..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].id..","..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].count..","..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].bind
		System.AddMail(actorID,6,0,"黄铜特权每日奖励","尊敬的玩家您好,\\\\您购买的黄铜特权每日免费奖励。可获得"..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].name.."*"..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].count,0,0,strAward)
	end	
	if IsSpeciaTitleVip(sysarg,2) ==true then 
		var.days.EDspecialR2 =2
		local strAward = ""..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].id..","..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].count..","..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].bind
		System.AddMail(actorID,6,0,"白银特权每日奖励","尊敬的玩家您好,\\\\您购买的白银特权每日免费奖励。可获得"..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].name.."*"..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].count,0,0,strAward)
	end	
	if IsSpeciaTitleVip(sysarg,3) ==true then 
		var.days.EDspecialR3 =3
		local strAward = ""..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].id..","..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].count..","..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].bind
		System.AddMail(actorID,6,0,"黄金特权每日奖励","尊敬的玩家您好,\\\\您购买的黄金特权每日免费奖励。可获得"..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].name.."*"..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].count,0,0,strAward)
	end	
	
	for i =1,table.getn(SpecialTitleCfg.title) do
		if IsSpeciaTitleVip(sysarg,i) == true then
			local sec ,day =GetSpecialTitleSurplusTime(sysarg,i)
			--print("sec="..sec)
			if sec<259200 then 
				if i==1 then 
					System.AddMail(actorID,0,0,"黄铜特权即将到期","尊敬的玩家您好,\\\\您购买的黄铜特权即将到期,请注意续费。")
				elseif i==2 then
					System.AddMail(actorID,0,0,"白银特权即将到期","尊敬的玩家您好,\\\\您购买的白银特权即将到期,请注意续费。")
				elseif i==3 then 
					System.AddMail(actorID,0,0,"黄金特权即将到期","尊敬的玩家您好,\\\\您购买的黄金特权即将到期,请注意续费。")	
				end
			end
        else
            SpecialTitle_OnActorLogin(sysarg)
		end
	end
    --激情大本营 清空数据
    var.ardourlevel = nil
    Actor.setIntProperty(sysarg,PROP_ACTOR_ARDOUR_ATTACK_RATE,0)
    var.ardourenter = 0
	
	--在线跨天的时候，完成微端登录活跃度
	local dVar = Actor.getDyanmicVar(sysarg)
	if dVar.WDLogin~=nil and dVar.WDLogin==1 then 
		OnFinish_Liveness(sysarg,3)--触发活跃度
	end
	
	LeaseTitleReturn(sysarg)
    ExpRefiningReturn(sysarg) --经验炼制返还
    --搜狗平台累积登录
    local dVar = Actor.getDyanmicVar(sysarg)
   
    if dVar.platformid  ~= nil then
        if var.platformaward == nil then var.platformaward = {} end
        if var.platformaward[2] == nil then 
            var.platformaward[2] = {} 
            var.platformaward[2].day = 0 
        end
      
        local var = Actor.getStaticVar(sysarg)
        local year,month,day = System.getDate(0,0,0)
        var.platformaward[2].loginday = day
        var.platformaward[2].loginmonth = month
         print(var.platformaward[2].day)
        var.platformaward[2].day  = var.platformaward[2].day  + 1

        --累计登录
        if var.platformaward[2].award == nil then
            var.platformaward[2].award = {}
        end
        var.platformaward[2].award[1] = nil

    end
    --抢红包-
    RedPacketCrossPlayer(sysarg)
    if System.getSpid() == 3 then
        if var.platformaward == nil then  var.platformaward = {} end
        if var.platformaward[2] == nil then var.platformaward[2] = {} end
        var.platformaward[2].award = {}
        var.platformaward[2].day = 0 
    end

    --51工资进度 跨月清零
     local nLast = Actor.getLastLogoutTime(sysarg)
     local year,month,day,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(nLast)	
     local y,m,d = System.getDate( 0, 0, 0 )
     if d == 1 or month ~= m then
        local var  = Actor.getStaticVar(sysarg)
        var.mainprogress = {}
     end
     --老兵回归跨天
     OldPlayerReturnCrossDay(sysarg)
	 
	 --腾讯服默认是微端登录
	if System.getSpid() == 99 then
      	OnFinish_Liveness(sysarg,3)--触发活跃度
		local dVar = Actor.getDyanmicVar(sysarg)
		dVar.WDLogin = 1
		Quest_ShuaXin(sysarg)
    end
	
	
	
	
	
	
	--完成个人数据跨天的时候告诉前端一下
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sHouDuanCrossDay)
	DataPack.flush(netPack)

	--是否在大吉大利活动时间里面，是的话，累加登录次数
	local svar = System.getStaticVar()
	if (svar.isDringDaJiDaLi ==nil or svar.isDringDaJiDaLi<1 or svar.isDringDaJiDaLi>3)==false then 
		ClearDaJiDaLi_Data(sysarg,1) --清除上次活动的数据
		if var.DJDL_Data.login ==nil then 
			var.DJDL_Data.login = 1
		else 
			if var.DJDL_Data.login<svar.isDringDaJiDaLi then --登录天数，不可能大于活动开始天数
				var.DJDL_Data.login = var.DJDL_Data.login + 1
			end
		end
	end
	
	
	
	--是否在周年活动时间里面，是的话，累加登录次数
	if (svar.isDringOneYearAct ==nil or svar.isDringOneYearAct<1 or  svar.StartOneYear_OpenDay==nil or svar.isDringOneYearAct>svar.StartOneYear_OpenDay)==false then 
		ClearOneYear_Data(sysarg) --清除上次活动的数据
		if var.OneYearAct_Data.login ==nil then 
			var.OneYearAct_Data.login = 1
		else 
			--因为不精准跨天，玩家有可能先领取了一次，累计登录已经有天数了。 累计登录天数 不能比 活动开启天数大
			if svar.isDringOneYearAct ~=nil and var.OneYearAct_Data.login>=svar.isDringOneYearAct then 
				--什么都不做
			else 
				var.OneYearAct_Data.login = var.OneYearAct_Data.login + 1
			end
		end
	end
	
	
	
	--是否在庆典活动里面，是的话，累加登录次数
	if (svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or  svar.QingDian_openDay==nil or svar.isDringQingDianActivity>svar.QingDian_openDay)==false then 
		ClearQingDian_Data(sysarg) --清除上次活动的数据
		if var.QDHD_Data.login ==nil then 
			var.QDHD_Data.login = 1
		else 
			--因为不精准跨天，玩家有可能先领取了一次，累计登录已经有天数了。 累计登录天数 不能比 活动开启天数大
			if svar.isDringQingDianActivity ~=nil and var.QDHD_Data.login>=svar.isDringQingDianActivity then 
				--什么都不做
			else 
				var.QDHD_Data.login = var.QDHD_Data.login + 1
			end
		end
	end
	
	
    BlueVipPlayerCross(sysarg)
    
    --boss跨天
    local var = Actor.getStaticVar(sysarg)
    var.guildbosskill = nil

    --个人竞技次数清空
    local nLastTime = Actor.getLastLogoutTime(sysarg)
    local year,month,day,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(nLastTime)
    local nYear,nMonth,nDay = System.getDate(0,0,0)
    if nDay == 1 or month ~= nMonth then
        var.singlemonthcount = nil
        var.singleinfo = nil
        var.singlegive = nil
        if var.cleartag == nil then
            var.singlerankpoint = nil
            var.cleartag = 1
        end
        send_actor_data_on_login(sysarg)
    end
    if nDay ~= 1 then
        var.cleartag = nil
    end
    var.singleinfoday = nil
    send_actor_data_on_login(sysarg)
	
	
	--国庆活动(告诉前端开启图标)
	local svar = System.getStaticVar()
	if svar.isDringNational ~= nil and svar.isDringNational > 0 then
		if SentNationalDayIndex ~= nil then
			SentNationalDayIndex(sysarg)
		end
		if SentNationalDayInfoNew ~= nil then
			SentNationalDayInfoNew(sysarg)
		end
	end
end


-- 清除玩家精确跨天数据
function ClearActorExactNewDayArriveData(sysarg, var)	
	-- 以下变量不能延迟清空，所以放这里
	-------------
	var.dayConsumeYB = nil -- 清空每天消耗元宝数
	var.InjectExp = nil -- 清空注入经验
	var.dayoldplayerconsume = nil
	var.dayConsumeYBCanChangeRun = nil --抽奖用的，消耗元宝数量
	var.dayCountRunLuck =nil --抽奖用的。
	
	
	var.dayConsumeYB_WUYI = nil -- 清空51活动每天消耗元宝数
end
                                              
-- 同步数据在玩家登录或者跨天时
function SynchDataWhenLoginOrCrossDay(sysarg)
	local var = Actor.getStaticVar(sysarg);
	local sVar = System.getDyanmicVar()
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	RefreshActorZero(sysarg);

	if var.JobHeadTitle then
		Actor.setTopTitle(sysarg,var.JobHeadTitle,true);
	end

	--登陆器领取标识
    if System.isCrossServer() == false then
    	local netPack1 = DataPack.allocPacket(sysarg, 139, 86)
	    if not var.LoginMark then
		    DataPack.writeByte(netPack1, 0)
	    else
		    DataPack.writeByte(netPack1,var.LoginMark)
	    end
	    DataPack.flush(netPack1)

    end

			
	--玩家复活时间处理
	if var.NextHpReliveCd then 
		Actor.setReliveTimeCD(sysarg,var.NextHpReliveCd,1)
    else
        Actor.setReliveTimeCD(sysarg,0,1)
	end	
	--[[
	--膜拜城主标记
	if var.days.worshipFlag then
		local nHour,nMin,nSec = System.getTime(0,0,0)
		if var.days.worshipFlag[2] == 11 or var.days.worshipFlag[2] == 12 then
			if nHour > var.days.worshipFlag[2] and nHour > 12 and nHour <= 18 then
				var.days.worshipFlag = nil
			end
		end
	end
	--]]
	--上线判断世界等级的经验buff
	if nActorLevel >= WordCultureConfig.minStartLevel then
		local nCurMaxLevel = System.getCultureLevel()
		if nActorLevel >= nCurMaxLevel then
			-- for key ,value in ipairs(WordCultureConfig.CultureCfg) do
			-- 	if Actor.hasBuffById(sysarg, value.buffId) then
			-- 		Actor.delBuffById(sysarg,value.buffId)
			-- 	end
			-- end
			System.setCultureLevel(nActorLevel)
		-- else
		-- 	local nGapLevel = nCurMaxLevel-nActorLevel
		-- 	for key ,value in ipairs(WordCultureConfig.CultureCfg) do
		-- 		if nGapLevel >= value.minLevel and nGapLevel <= value.maxLevel then
		-- 			for k ,v in ipairs(WordCultureConfig.CultureCfg) do
		-- 				if Actor.hasBuffById(sysarg, v.buffId) then
		-- 					Actor.delBuffById(sysarg,v.buffId)
		-- 				end
		-- 			end
		-- 			Actor.addBuffById(sysarg,value.buffId)
		-- 			break
		-- 		end
		-- 	end
		end
	end
	
	--跨天和登陆下发本日挑战BOSS信息
	SendAllChallengeBossInfo(sysarg)
	--记录累积登陆天数
	--AllLoginAwardInfo(sysarg)
	--下发剩余免费复活次数
	SendFreeRelive(sysarg)
	--下发今天充值的元宝数
	SendTodayPay(sysarg);
	
	--屏蔽经验瓶
	--下发剩余使用经验瓶次数
	--SendBottlesExpNum(sysarg)
	
	--盾牌标识
	SendShieldFlag(sysarg)
	SendDiamondCrystalFlag(sysarg)
	SendEquipMedalFlag(sysarg)	
	
	SendExpRefiningTimes(sysarg)
	--合区数据
	SendCombineData(sysarg)
	--下发当天装备回收总经验
	SendTodayTotalReclaimExp(sysarg)
	--下发玩家标志
	SendActorExtflags(sysarg)
	
	--SendNationalDayIconStatus(sysarg) -- 下发国庆活动信息
	
	--下发活跃度活动图标状态
	SendLivenessIconStatus(sysarg)
	
end