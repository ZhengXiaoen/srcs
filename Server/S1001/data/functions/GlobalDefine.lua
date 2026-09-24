--lua script
--#ifndef _GLOBAL_DEFINES_INCLUDED_
--#define _GLOBAL_DEFINES_INCLUDED_

--#include "data\language\LangCode.txt" once

--这里定义全局的常量
--这里定义和客户端的通信协议号

--子系统消息号
LogicCmd = 
{
	otherSys = 		--杂七杂八子系统
	{
		sysId = 26,
		sub = 
		{
			sOpenRank = 30,		--打开排行榜
		},
	},
	--139系统协议号装不下了 用一个新的协议号
--    miscSysEx =
--    {
--        sysId = 180,
--        sub = 
--        {
--            ---客户端
--            cShakeRandomBox = 1, --摇奖-
--            cGiveRandomBox = 2, --领取宝箱奖励


--            --服务端
--            sInitRandomBox = 1, --初始化宝箱  参数: string 宝箱名称 byte 总领取次数 结构体{int 需要的元宝[0代表免费领取]}  byte 宝箱数量 结构体{ ushort 道具id byte 数量 byte 是否绑定 [第一个成员为免费领取]}
--            sShakeRandomBox = 2,    --摇奖返回 byte 摇到的道具索引
--            sGiveRandomBox = 3, --领取宝箱奖励返回 参数: byte 可领取次数 

--        },
--    },
	miscSys = 
	{
		sysId = 139,		--misc子系统
		sub = 
		{
			--客户端上传
			cQuestTargetSpaceMoveHandler=7,  --疾风令飞往任务目标地点
			cGetOfflineAward = 9, --领取离线奖励
			cGetAward = 13,	--用户领取副本奖励（开箱）
			cFlower = 21,	--客户端发送鲜花系统的信息
			cTelCampKingNpc=26, -- 传送玩家到盟主NPC
			cChangeIcon = 27,	
			cClickReliveIcon = 35,	--客户端点击复活按钮
			cGetUpdateList = 41, --请求更新列表
			
			cGetWuLinZhengBaData = 39,	--客户端请求武林争霸赛赛程数据
			cApplyWuLinZhengBaIcon = 40,	--客户端点击武林争霸参加晋级赛
			cGetWuLinZhengBaFinalEight = 42,	--客户端请求武林争霸八强奖励名单
			cGetWuLinZhengBaFinalEightAward = 43,	--客户端请求领取武林争霸八强奖励
			cWuLinMasterSetShutup = 44,	--武林盟主禁言
			cGetAthleticsPointActorData = 45,	--客户端请求竞技积分个人排行信息
			cGetAthleticsPointAward = 46,	--客户端请求领取竞技积分奖励

			cActivitySceneLeave	=	59,					--离开活动场景
			cAnswerSelectOpt	=	61,				--进行答题操作（选择答题、一击必中等）
			
			cSpecialSpringAction	= 64,		--温泉特殊互动，搓背、拥吻、按摩、同游等
			cWishBottleOpt = 71,			--
			cAutoAcceptSpringAction = 76,	--是否自动接受温泉互动请求
			cCircle = 82, --客户端转身请求
			cExchangeCircleTimes = 83, --兑换转身次数
			cReceivePreferentialGoods = 84, --领取特惠礼包
			cGrowGiftBag = 85,			--请求领取成长礼包
			cGetLoginToolsGift = 87,	--请求领取登陆器奖励
			cGetPeyMoney = 88,			--请求领取每日充值大礼包结果(该协议已经不用了，新协议是145)
			cGetPeyFlag = 89,			--请求获取领取礼包标示

			cGetFirstCharge = 92,       --首充礼包信息
			cTakeFirstCharge = 93,       --领取首充礼包
			cGetReceiveGift = 94,		--请求领取成长礼包的玩家数量		
			cDailyLottery = 90, --客户端请求抽奖
			cExchangeLotteryTimes = 91, --兑换抽奖次数 
			cGetChargeGift = 96, --获取充值赠送礼包
			cGetChargeGiftflag = 97, --请求领取数据
			cEnterCFGCReq = 98, --请求进入财富广场
			cGiveCheckGift = 99,--领取每日签到奖励
			cCheckGiftflag = 100,--每日签到标识
			cGetGiveBigGift = 101,--大礼包领取按钮
			
			cGetCdkeyGift = 102,	--激活卡领取奖励
			cSendAllActivityTips = 103, --获取活动tips
			cGetQuestOtherAward	= 104,		--获取任务额外奖励
			cGetCoinItemUseCount = 105,		--获取招财符的使用次数
			cGetFirstClickPanelFlag = 106,	--获取第一次打开右上角图标活动面板
			cBuyBombAndLaunchBomb = 107,	--购买炸弹和发射炸弹
			cActorReliveTimeHandle = 108,	--玩家复活时间操作
			cDeify = 109, --客户端封神请求
			cSendDeifyTimes = 110, --请求封神次数
			cExchangeDeifyTimes = 111, --兑换封神次数
			cGetFund = 112,			--领取基金 or 购买基金
			cGetFundFlag = 113,		--领取基金的标识
			cGetNewServerEightDaysInfo = 114,		--获取开区八天信息
			cGetMergerServerGift = 115,			--领取合服奖励
			cGetDiscountGift = 116,				--领取打折商店
			cGetCombineServerCumulative = 117,	--获取合服充值排行榜
			cPlatformCmd = 118, --平台消息
			cConvertShield = 119,	--请求兑换盾牌
			cDiamodLevelUp = 120, --请求升级钻石(已经屏蔽)
			cEnterBossScene = 121,	--请求进入BOSS场景
			cGetSpecialEquip = 122,		--领取赠送特殊装备
			cGetBottlesExp = 123,		--获取经验瓶经验
			cGetAddPayMoneyAward = 124,	--获取累积充值奖励
			cGetSevenDayLoginAward = 125, --领取7天登陆奖励
			cEnterActivityScene = 126,		--活动面板进去活动场景
			cGiveOpenServerAward = 127, --领取开服奖励
			cBuyShield = 128, --购买盾牌
			cMaterialRelated = 129,	--血炼石、升级石操作
			cEquipStove = 130,	--锻造炉装备操作
			cEnterTianGuan = 131, --请求进入天关
			cChristmasAndNewYear = 132, --双"蛋"活动
			cQueryEquipMedal = 133,   --生肖纹章信息返回
			cQueryArtifactLevel = 134, --神器等级返回
			cGetOneHundredActivity = 135,  --百服活动
			cSpringFestivalActivity = 136,	--春节活动
			cGetValentineDayGift = 137,	--情人节活动
			cGetExpRefining = 138,		--获取精炼经验
			cGetOpenServerAwardInfo = 139, --获得开服奖励信息
			cGetFubenInfo = 140, --请求获取副本信息
			cEnterFuben = 141, --请求进入副本
			cGetFubenPassAward = 142, --领取副本通关奖励
			cExitFuben = 143, --退出副本
			cFubenBuyTimes = 144, --购买进入副本次数
			cGetNewEveryDayAward = 145, --领取每日充值礼包
			cGetBranchAward = 146, --领取支线奖励
			cGetLaborInfo = 147, --请求51活动信息
			--cGodFurnaceInfo = 148, --请求神炉等级信息
			cGetSevenDayLoginAwardInfo = 149, --获取7天登陆奖励信息
			cCollectGame = 150,	--收藏游戏
			cQuestBuyExp = 151, --购买主线经验
			cQueryQuestBuyExp = 152, --请求购买主线经验信息
			cGetFuGuiShouBubenInfo = 153, --获取富贵兽副本信息
			cEnterFuGuiShouBuben = 154, --请求进入富贵兽副本
			cExitFuGuiShouBuben = 155, --请求退出富贵兽副本
			cFuGuiShouDoubleExp = 156, --请求富贵兽双倍经验
			cCreateFuGuiShou = 157, --请求刷出富贵兽
			cEquipExchange = 158, --盾牌、宝石、灵珠兑换盾灵、宝石结晶、灵珠碎片
			cGetOperation = 159, --请求获取
			cNationalDayActivity = 161, --国庆活动	
			cLivenessActivity = 162, --活跃度活动	
			cHistoryTask = 163, --昨天未完成的任务
			cWarpathModule = 164, -- 征途
			cPublicTest = 165, -- 公测活动
			cCharItemsExchange = 166, -- 集字活动字帖兑换
			cInjectExpRanking = 167, -- 注入经验排行榜
			cBuyEveryDayPreference = 168, --购买每日特惠礼包
			cWangling = 169, -- 王陵场景
			cWardrobeModule = 170, -- 衣橱
			cGardenModule = 171, -- 果园
			cPracticeRoomModule = 172, -- 练功房
			cGoldbowlModule = 173, -- 聚宝盆
			cGetLeftCircle = 174,	-- 获取今天剩余转生次数(已经改为今天兑换修为剩余次数)
			cOfficeModule = 175, -- 军印
			cGetAccumulatedDaysAward = 176, -- 领取累积天数奖励
			cChallengeFubenModule = 177, -- 勇者闯关
			cHeadTitleModule = 178, -- 称号
			cLegionDonate = 179,	--捐献			
			cEMoLingFuben = 180, --恶魔岭副本(炎龙守卫副本)
			cExtend = 181,          --推广
			cGuildFightInspire = 182,   --鼓舞 参数 byte 类型[1.个人攻击鼓舞 2.个人防御鼓舞 3.团队攻击鼓舞]
            cGuildFightExit = 183,  --退出抵御入侵
			cGetOpenServerPayRank = 184, --开服活动 充值排行
			cGetBossReliveTime = 185, --得到野外boss的复活时间
            cGetFunctionGiftInfo = 186, --获取功能礼包状态
            cGiveFunctionGiftInfo = 187,    --领取功能礼包
            cSevenDaysActivityOpt=188,--7天活动操作
            cGiveTreasureTrove = 189,   --领取宝藏
            cGetTreasureTrove = 190,    --摇宝藏
			cGiveOpenServerAward2 = 191,--领取开服奖励（新增的）
			cLingShiSync = 192, --灵石合成
            cEquipPunch = 193,  --装备打孔 参数: double 装备的guid byte:位置
			cEquipSet = 194,    --宝石镶嵌 参数: double 装备的guid byte:镶嵌位置 double 镶嵌宝石guid
            cEquipPick = 195,   --宝石摘取 参数: double 装备的guid byte:镶嵌位置 byte:摘取位置
			cGetExpUplevelTo=196,--经验炼制，达到多少级
			cGiveOpenServerAward3=197,--全民boss信息
			cGetPhoneAwards=198,--得到手机礼包奖励
            cLookRobotEquip = 199,  --查看机器人装备
            cGodEquipUp = 200,  --神装升级 参数: double 道具序列id 
            cGodEquipChange = 201,   --神装兑换  参数: byte 装备位置
            cGodEquipResolve = 202, --神装分解   参数: byte 分解数量 double 道具序列号id
			cWorldBossBuff = 203,   --提升攻击buff
            cGetBoosKillInfo = 204, --获取boss击杀信息
            cBossListInfo = 205,    --获取boss列表信息- 参数:byte 0 获取左侧列表 1.获取右侧列表 string 场景名称  2.单击回调 string 回调函数 byte参数数量 foreach(string 参数)
			cOpenGuildRedPack = 206,	--发送行会红包,参数:byte 金币类型 int 每个在线玩家的数量
			cShenLuoShenJie = 207, --森罗神戒的信息
			cJiangHuLing = 208, --江湖令
			cFuWenChange = 209, -- 符文兑换
			cBPbuff = 210, -- 奔跑兄弟buff
			cSbkState =211, --请求沙巴克状态
            cAnswerQuest =212,--答中了题目
            cGetSurplusActivityCount = 213, --请求活动剩余次数
			cSpecialRightInfo = 214,--请求特权信息
			cBuySpecialRight =215,--请求购买特权
			cClearPk = 216, --清洗PK值
			cMineralSystem=217,--矿石系统
			cDBQBbuff=218,--夺宝奇兵buff
			cUseExpBall = 219, --使用经验玉			
			cGiveTresureBox = 220,	--领取珍宝箱 byte 0.免费领取  1.元宝领取
			cYaoTresureBox = 221,	--摇奖
            cDuihuanNeiGong = 222,  --兑换内功经验
            cGetDuihuanNgCount = 223,   --获取兑换内功剩余次数
            cGetArdourCampIsOpen = 224, --检测大本营是否开放
            cKillBossInfo = 225,    --获取可击杀BOSS
			cExpBottle =226,--经验瓶
			cTiYanCardIsUse = 227,--是否使用体验卡
			cGetNewDayFirstYB = 228,--每日首冲
			cTianJiangHongBao = 229,--天降红包
			cHeFuActivity = 230, --合服活动
			cFatherDayActivity =231, --父亲节活动
			cGiveUpdateGift = 232,  --领取更新公告礼包
			cGetUpdateGiftState = 233,   --获取更新公告礼包状态
			cChuanYinLaBaState =234,  --传音喇叭的状态
			cActivateGodDress = 235,    --激活神甲
            cGodEquipUpLev = 236,       --神器升级
            cGodSoulExChange = 237,     --神魂兑换
            cGetGodSoul = 238,          --获取当前神魂值
			cBuyOldGodEquip = 239,  --老区玩家购买神装
			cVipGuaJi = 240,--vip挂机地图
			cGetBuyGodEquip = 241,  --是否购买了神器的标记
			cGetDayGodSoulExChange = 242,   --获取神器 神装兑换状态
			cYongChuangTianGuan = 243, --勇闯天关
			cGetTeHuiGiftInfo = 244,    --获取神魂、宝石特惠礼包信息
			cBuyTeHuiGiftInfo = 245,    --购买神魂、宝石特惠礼包
			cJingJiLiBao =246, --新的竞技礼包
            cGetTehuiNewDay = 247,  --获取新加的二个特惠礼包开服时间
			cShakeRandomBox = 248, --摇奖-
            cGiveRandomBox = 249, --领取宝箱奖励
			cSendYiJianWanChengBox = 250,--发送一键完成
            cFourGuard = 251,   --神炉守护
            cGetFourGuardInfo = 252,--获取神炉信息，        

			--服务器下发
			sFbResult = 16,	--发送通关评价窗口的信息
			sGetAward = 17,--广播玩家领取了奖励的消息
			
			sFlower = 22,	--通知赠花		
			sChangeIcon = 27,	--修改头像结果
			
			sOpenReliveDialog = 34, --服务端请求打开复活面板
			sSendActivityDialog = 39,	--服务端请求打开面板右边的提示框
			sSendUpdateList = 41,	--下发更新列表
			
			sSendWuLinZhengBaData = 40,	--服务端返回武林争霸赛程数据
			sSendWuLinZhengBaFinalEight = 42,	--服务端返回武林争霸八强奖励名单
			sSendWuLinZhengBaEnter = 43,	--可进入晋级赛标志  0不可进入 1可进入
			sSendAthleticsPointActorData = 44,	--下发竞技积分个人排行信息

			sSendAnswerQuestion	=	50,		--发送问题
			sSendAnswerOp	=	51,					--发送答题选项
			sSendWithBottleInfo = 62,
			sSendFlushResult = 63,		
			sSendCombinedAwardFlag = 75, -- 下发合区面板标记
			sAutoAcceptSpringAction = 76,		--下发自动接受其他玩家温泉互动请求
			sSendAnswerAreaCenter = 79,		--发送答题区域中心点
			sActivityIconStatus = 80,		--活动图标状态
			sDoubleEgg = 81,			-- 双"蛋"活动
			sCircle = 82, --下发转身结果
			sExchangeCircleTimes = 83, --下发兑换转身次数结果
			sSendGrowGiftBag = 85,		--领取成长礼包
			sSendLoginGiftMark = 86,	--下发领取登陆器标识
			sSendLoginGiftResult = 87,			--下发领取登录器奖励结果
			sSendPeyMoneyResult = 88,				--下发每日充值大礼包结果
			sSendPeyFlag = 89,					--领取每日充值大礼包标识
			sGetFirstCharge = 92,       --首充礼包信息
			sTakeFirstCharge = 93,       --领取首充礼包
			sSendGetReceiveGift = 94,		--下发已领取成长礼包的玩家数量
			sDailyLottery = 90, --下发请求结果
			sTipsEffects = 95, --下发特效提示
			sGetChargeGift = 96, --下发充值赠送礼包结果
			sChargeGiftflag = 97,--赠送礼包领取标识
			sGiveCheckGift = 99, --每日签到奖品
			sCheckGiftflag = 100,--每日签到标识
			sSendBigGiftBag = 101,--下发大礼包配置
			sSendOpenSystemTips = 102, --系统开启Tips
			sSendAllActivityTips = 103, --获取活动tips
			sSendEffectsSound = 104,	--播放某些特效有音效
			sSendAReliveInfo = 105,  --复活是否成功信息
			sSendCoinItemUseCount = 106,		--发送金钱物品的使用次数
			sSendRecommendTips = 107,		--推荐提示tips框
			sSendActorFirstLogin = 108,		--玩家首次登陆
			sSendfbRandScene = 109,		--玩家在天关摇塞子
			sSendLingShouBombNum = 110,	-- 下发天雷弹数量
			sActorReliveTimeHandle = 111,	-- 玩家复活时间操作
			sDeify = 112, --下发封神结果
			sGameFundState = 113,	--更新领取基金的按钮状态
			sSendNewServerEightDaysInfo = 114,		--下发开区八天信息
			sSendCombineServerCumulative = 115,		--下发合区累计充值列表
			sPlatformCmd = 116, --平台消息
			sLevelGrowAward = 117, --等级成长奖励
			sCircleSuccess = 118, --转生成功下发
			sSendSpecialEquipInfo = 119, --下发赠送装备的信息
			sSendLoginAwardInfo = 120,  --下发7天登陆领取信息
			sSendSpecialPacksFlag = 121,  --下发特惠礼包
			sSendFreeReliveNum = 122,		--下发今天剩余复活次数
			sSendTodayPay = 123, --下发今天充值的元宝数
			sSendBottlesExpNum = 124, --下发经验瓶次数
			sSendFubenMonsterNum = 125, --下发副本怪物数量	
			sSendBuyShieldFlag = 126, --下发购买盾牌标识
			sSendTianGuanTimes = 127, --下发今天剩余天关剩余次数
			sEquipMedalFlagInfo = 128, --下发是否领取奖励和进化是否成功
			sEquipArtifactLevel = 129, --下发是神器神甲法宝等级
			sSend7KPlatformPay = 130, --7K平台充值
			sSendWeChatGift = 131, --微信礼包
			sSendOneHundredActivityData = 132, --百服活动数据下发
			sSendSpringFestivalData = 133,	--春节数据下发
			sSendValentineDayData = 134,	--情人节数据下发
			sSendExpRefiningTimes = 135,	--精炼经验次数下发
			sGiveOpenServerAward = 136,	--下发玩家领取开服奖励结果
			sGetOpenServerAwardInfo = 137, --下发开服奖励信息
			sSendFubenInfo = 138, --下发副本信息
			sSendFubenPassAward = 139, --下发副本通关奖励
			sSendGetPassAwardResult = 140, --下发领取通关奖励结果
			sSendFubenLeftTimes = 141, --下发副本剩余次数
			sSendNewEveryDayFlag = 142, --下发新每日充值礼包数据
			sSendLobarLuckyDrawInfo = 143, --下发51活动抽奖信息
			sSendLobarDataInfo = 144, 	--下发51面板信息
			sSendEquipStoveResult = 145, --下发装备升级结果
			sSendQuestBuyExpInfo = 146, --下发主线购买经验
			sSendFuGuiShouBubenInfo = 147, --下发富贵兽副本信息
			sEnterFuGuiShouBubenResult = 148, --下发进入富贵兽副本结果			
			sFuGuiShouDoubleExpResult = 149, --下发富贵兽双倍经验结果
			sCreateFuGuiShouResult = 150, --下发刷出富贵兽结果
			sSendActorExtflags = 151, --下发玩家标志
			sSendHyperLink = 152, --下发前端执行的超链接
			sNationalDayActivity = 153, --国庆活动
			sLivenessActivity = 154, --下发活跃度活动信息
			sHistoryTask = 155, --下发昨天未完成的任务信息
			sWarpathModule = 156, -- 征途
			sPublicTest = 157, -- 公测活动
			sSendCombineShopData = 158, -- 下发合服商店数据
			sInjectExpRanking = 159, -- 天神之力排行榜
			sWanglingMiasma = 160, -- 下发王陵瘴气
			sWanglingData = 161, -- 下发王陵数据
			sWardrobeModule = 162, -- 衣橱
			sGardenModule = 163, -- 果园
			sPracticeRoomModule = 164, -- 练功房
			sGoldbowlModule = 165, -- 聚宝盆
			sSendLeftCircle = 166,	-- 下发今天剩余转生次数(已经改为今天兑换修为剩余次数)
			sOfficeModule = 167, -- 军印
			sLJQDAwardFlags = 168,	-- 累计签到领奖标记
			sQDAgainFlags = 169,	-- 再签一次到标记
			sChallengeFubenModule = 170, -- 勇者闯关
			sHeadTitleModule = 171, -- 称号
			sLegionDonate = 172,	--捐献
			sUseItem = 173,	--使用一个道具
			sEMoLingFuben = 174, --恶魔岭副本(炎龙守卫副本)
			sUpdateFubenData = 175, -- 更新副本数据
            sExtend = 176,          --推广
            sGuildFightOpen = 177,  --打开行会活动抵御入侵面板 int 活动剩余时间[秒] int下一波时间[秒] int当前波数[秒] int怪物数量
            sGuildFightClose = 178, --关闭行会活动抵御入侵面板
            sGuildFightUpdate = 179,    --更新行会活动抵御入侵面板 参数: int 金币 int 经验 int 护盾碎片 int怪物数量
            sGuildFightNextTime = 180,  --下一波刷怪时间 int 时间 int 当前波数 int 怪物数量
            sGuildFightBuffInfo = 181,  --buff信息 int 个人攻击buff等级 int 个人防御buff等级 int 团队buff等级
            sOpenServerPayRank = 182,   --下发开服活动充值排行
			sGetBossReliveTime = 183, --下发野外boss的复活时间
			sShowTheChallengeBoss=184,--下发显示挑战boss
            sGetFunctionGiftInfo = 185, --下发功能礼包完成任务状态
            sTreasureTroveInfo = 186,   --宝藏信息
            sGetTreasureTrove = 187,    --摇宝藏返回
			sSevenDaysActivityResut=188,--7天活动信息下发
			sGiveOpenServerAward2 = 189,   --下发开服活动信息（新增的）
            sLingShiSync = 190,         --灵石合成返回
            sEquipPunch = 191,          --装备打孔返回
            sEquipSet = 192,            --镶嵌灵石返回
            sEquipPick = 193,               --摘取灵石返回
			sGetExpUplevelTo=194,--经验炼制，达到多少级
			sGiveOpenServerAward3=195,--全民boss信息
			sGetPhoneAwards=196,--成功领取返回
            sLookRobotEquip = 197,  --查看机器人装备返回
            sGodEquipUp = 198,  --神装升级返回成功 无参
            sGodEquipChange = 199,   --神装兑换返回成功 无参
            sGodEquipResolve = 200, --神装分解返回成功 无参
			sHuiShouZhuangbei = 201,--回收装备，播放特效用的
            sWorldBossBuff = 202,   --世界bossbuff
            sGetBoosKillInfo = 203,     --获取boss击杀信息
            sBossListInfo = 205,    --获取boss列表信息- 参数:byte 0 获取左侧列表 byte 数量 foreach(string 场景名称) 1.获取右侧列表 string 文本  
			sGuildRedGuild = 206,--打开行会发送红包输入框 参数: byte 行会当前在线人数[红包数量]
			sShenLuoShenJie = 207, --下发森罗神戒协议
			sFuWenChange = 208, --下发符文兑换协议
			sRuneCount = 209,	--下发符文碎片数量协议
			sBPbuff =210, --奔跑兄弟buff
			sBPCounter =211, --奔跑兄弟倒数5秒
			sSbkState =212, --请求沙巴克状态
            sGetSurplusActivityCount  = 213,    --下发活动剩余次数
			sSendFirstDeadOnToday = 214, --今日第一次死
			sWeiDuan=215,--下发打开微端连接
			sSpecialRight=216,--下发特权信息
			sSpecialRingExDeath=217, --80级以后第一次和第五次死亡，推荐神罗神戒
			sMineralSystem=218,--矿石系统
			sDBQBbuff=219,--夺宝奇兵buff
			sUseExpBall=220,	--经验玉返回
			sTresureBoxInfo =221,	--下发珍宝箱信息 byte 格子数量 for 格子数量{参数 ushort 道具id}
			sGiveTresureInfo = 222, --领取珍宝箱返回: byte 类型:0.免费领取 1.元宝领取 byte 元宝领取第几次
			sYaoTresureInfo = 223,	--下发摇宝箱 ushort 道具id
            sGetNGCount = 224,  --返回内功兑换次数 byte: 次数
            sGetArdourCampIsOpen = 225, --检测大本营是否开放
			sArdourCampRankInfo = 226,	--激情大本营排行榜信息
			sUpdateArdourCampRankInfo =227,	--更新激情大本营排行榜信息
            sGetKillBossInfo = 228, --返回可击杀BOSS信息
			sExpBottle =229,--经验瓶
			sTiYanCardIsUse = 230,--是否使用体验卡
			sGetNewDayFirstYB = 231,--每日首冲奖励
			sTianJiangHongBao = 232,--天降元宝
			sKingCityBossTime = 233,--合服王城boss倒计时 参数: int 倒计时时间/秒
			sHeFuActivity = 234, --合服活动
			sFatherDayActivity =235, --父亲节活动
			sGeRenFuBenDaoShu =236,--个人副本倒数
            sHunDunWorldTime = 237, --混沌世界倒计时
            sGetUpdateGiftState = 238, --更新公告礼包状态
			sChuanYinLaBaState =239,  --传音喇叭的状态
            sGetGodSoul = 240, --获取神魂值返回
			sVipGuaJi = 241,--vip挂机地图
			sVipGuaJiInfo = 242, --挂机的总收益
            sGetBuyGodEquip = 243,  --是否购买了神器的标记
            sGetDayGodSoulExChange = 244,   --获取神器 神装兑换状态
			sYongChuangTianGuan = 245, --勇闯天关
            sBuyOldGodRet = 246,    --老区玩家购买新版神器成功返回
            sGetTeHuiGiftInfo = 247,    --获取神魂、宝石特惠礼包信息
			sJingJiLiBao =248, --新的竞技礼包
            sGetTehuiNewDay = 249,  --获取新加的二个特惠礼包开服时间
            sInitRandomBox = 250, --初始化宝箱  参数: string 宝箱名称 byte 总领取次数 结构体{int 需要的元宝[0代表免费领取]}  byte 宝箱数量 结构体{ ushort 道具id byte 数量 byte 是否绑定 [第一个成员为免费领取]}
            sShakeRandomBox = 251,    --摇奖返回 byte 摇到的道具索引
            sGiveRandomBox = 252, --领取宝箱奖励返回 参数: byte 可领取次数 
            sGodEquipUpLevSuc = 253,--神器升级成功后返回
			sGetYiJianWanChengBox = 254,--接受一键完成
          
		},
	},
	
	
	miscSysEx = 
	{
		sysId = 151,		--misc子系统
		sub = 
		{	
			--客户端上传
			cTestNewMis = 1,
			cGetCliffordInfo = 2,   --获取祈福信息
            cCliffordInfo = 3,      --祈福 参数byte 0.金币祈福 1.元宝祈福
			cHeCheng =4,            --请求合成
			cEndMonthActivity =5 ,  --请求月末活动
			cEndMonthActivityIsOpen =6, --月末活动是否开启
			cGetJunGuInfo=7,		--得到军鼓的信息
			cGetJunHunPingAward =8,  --获取军鼓瓶奖励
			cGetShenQiJingYanYu=9,	--得到神器经验玉奖励
			cQingDianActivity=10,	--庆典活动
			cQingDianActivityIsOpen=11,	--庆典活动是否开启
			cShenMiShangDianIsOpen=12, --神秘商店是否开启
			cKuaiJieYu = 13,--请求快捷语
			cGetMianJuInfo=14,--得到面具的信息
			cOpenTianShenHuTi = 15,--打开天神护体
			cMianjinTeHui = 16, --面具特惠
			c7dCosume = 17,--7日消费
			cKillBoss = 18, --单挑BOSS
            cLeaseTitle = 19, --租赁称号 参数byte: 1.第一个 2.第二个 3.第三个
			cyuanGuFanPai=20,--远古翻牌
			cWarEquipUplev = 21,    --战装升级
			cKuafuTuMoDian = 22,  --跨服屠魔点
            cSetPlatformId = 23,--设置平台id
            cGivePlatformAward = 24, --领取平台奖励
            cGetPlatformAwardState = 25, --获取平台奖励内容
			cTianJiangHongBao2 = 26, --天降红包2
			cZiYuanXunHui=27, --资源找回
			cNatDayActivity =28, --国庆活动
            cGetMapPlayerInfo = 29, --获取地图内玩家信息
			cCrossYaBiao = 30, --跨服押镖
            cRingDamo = 31, --戒指打磨
            cGetSportsTitleInfo = 32,   --获取竞技称号等级信息
            cUpSportsTitleLev = 33, --升级竞技称号
			cTakeFirstChargeEx	= 34, --首冲拓展
			cShengXiaoGongDian = 35, --生肖宫殿
            cGetNewZodiacInfo = 36, --获取十二生肖信息
            cUplevNewZodiac = 37,   --激活/升级十二生肖信息
			cAiQiYiVIPLogin = 38, --爱奇艺vip登录
			cGuildXiangYaoChuMo = 39, --行会降妖除魔
			cGuildFlagUplevel = 40, --行会旗帜升级
			cIsInYuanGuZhanChangTime =41, --是否在远古战场的时间内
			cBrotherRing=42,--结义戒指
			cBrotherInfo = 43,-- 结义的信息
			cBrotherTask = 44, --结义任务
			cAskAchieveKillBoss = 45,  --请求杀怪数据
			cTreasureSystem=46,	--宝物系统
			cGetFlowerCount = 47,--得到花的数量
			cYuanshen = 48, -- 元神系统
			cNeujahrActivity = 49, --元旦活动
			cPalaceFighting = 50, -- 皇宫大乱斗
			cOffLineAward = 51,	--离线奖励
			cGetRedPacketInfo = 52, --获取红包信息
            cRobRedPacket = 53, --抢红包
            cSendRedPacket = 54,    --发红包
            cGetSuperLuckStarInfo = 55, --获取超级幸运星信息
            cDrawSuperLuckStarInfo = 56,--抽奖
            cGiveSuperLuckStar = 57,    --领取奖励
            cUpdateLevLegendEquip = 58, --传世装备升级
            cGetGodWeaponInfo = 59, --获得神兵信息
            cActiveGodWeapon = 60,  --激活神兵
            cUpdateGodWeapon = 61,  --升级神兵等级
            cGetOldPlayerReturnInfo = 62,   --获取老兵回归标记信息
            cGiveOldPlayerReturnInfo = 63,--领取老兵回归奖励
			cFuHunHandle = 64,		--附魂操作
			cHappyBirthday = 65,    --生日烟花
			cOpenSeverFirstKill = 66, --开服活动首杀boss
			cOpenSeverContinuePay = 67, --开服活动累计充值
			cYCTG_yijianwancheng = 68, --勇闯天关一键完成
			cBossSlotUplevel = 69,  --boss符文槽升级
            cBossSlotExchange = 70, --符文兑换
            cFestivalActs = 71, --节日活动相关
            cUpdateGodWeaponEx = 72, --神兵扩展升级
			cDaJiDaLi_isOpen = 73, --大吉大利是否开启
			cDaJiDaLi_Acts = 74,--大吉大利活动相关
			cXiaoFeiZhuanPan = 75, --消费转盘
			cGuildFubenBoss = 76,   --行会boss副本 - 
            cBlueVipOperat = 77,    --蓝钻vip信息
			cOneYearAct_isOpen = 78, --周年活动是否开启
			cOneYearAct_Acts = 79,--周年活动活动相关
			cGuardDragon = 80, --龙灵守护系统
			cFootPrint = 81, --足迹系统
            cIdentityCode = 82, --验证码验证
			cOpenServerReturnAndTreasureStore =83 ,--开服活动材料返利和珍宝商店
			cHeChengByGrid =84,            --请求合成
            cGetSingleRankAward = 85,   --领取个人竞技参与奖奖励
            cXiongMaoLinMonsterCount = 86, --获取熊猫林还剩余多少只怪
			cLongTengZhuanPan = 87, -- 龙腾转盘
			cRingGodSystem = 88,	--戒灵
			cNationalDayActivityNew =89,  --庆典活动
			cShenDunSystem=90,--神盾系统
			cSkyRingOper = 91,   --天戒操作 1.获取信息 2.升级
            cSanRenHongLi_IsOpen = 92, --散人红利是否开启
            cSanRenHongLi = 93, --散人红利协议
            cTianJiangHongLiOper = 94, --天降红利 1.获取天降红利信息 2.领取天降红利礼包
			cTongTianTa = 95,		--通天塔
            cXianZhuangOper = 96,   --仙装操作
			cXianGongZhuanPan = 97, --仙装转盘
			cJingJI_isOpen = 98, --竞技是否开启
			cJingJI_Acts = 99,--大吉大利活动相关
			cJingJIZhuanPan =100, --竞技转盘

			--服务端下发
			sTestNewMis = 1,
            sGetCliffordInfo = 2,   --下发祈福信息 参数: int 免费祈福剩余领取时间/秒 byte 免费祈福次数 byte 元宝祈福次数
			sSendTuMoYinJiIndex = 3 , --发送屠魔印记的索引
			sHeCheng = 4,             --返回合成成功/失败
			sEndMonthActivity =5 ,  --发送月末活动数据
			sEndMonthActivityIsOpen =6, --月末活动是否开启
			sSendJunGuInfo =7,		--返回军鼓的信息
			sSendMkzBossInfo = 8,		--返回军魂之地BOSS刷新信息
			sUpdateMkzValue = 9,		--刷新玩家获得的军魂值
			sGetJunHunPingAward =10,  --获取军鼓瓶奖励结果
			sGetShenQiJingYanYu=11,	--获取神奇经验玉结果
			sQingDianActivity=12,	--庆典活动
			sQingDianActivityIsOpen =13, --庆典活动是否开启
			sYaoHaoBoDonghua =14, --摇号播动画
			sQingDianActivitySendOneLog = 15,--发送一条数据
			sQingDianActivitySendAllLog = 16,--发送全部数据
			sShenMiShangDianIsOpen=17, --神秘商店是否开启
			sJunHunMangIs = 18,--军魂瓶满了
			sKuaiJieYu = 19,--请求快捷语
			sGetMianJuInfo=20,--得到面具的信息
			sMianjinTeHui = 21, --面具特惠
			s7dCosume = 22, --7日消费
			sHouDuanCrossDay = 23, --后端跨天，数据更新			
            sFourGuard = 24,    --激活/升级神炉守护成功
			sKillBoss = 25,		--单挑boss
            sSendActorDataOnLogin = 26, --下发玩家数据在登录时
            sLeaseTitle = 27, --租赁称号成功返回 参数byte : 第几个索引
			syuanGuFanPai=28, --远古翻牌
			sKuafuTuMoDian = 29,  --跨服屠魔点
            sWarEquipUplev = 30, --战装升级成功返回
            sGetFourGuardInfo = 31,--获取守护消耗与属性
            sGetPlatformAwardState = 32, --获取平台奖励内容
			sTianJiangHongBao2 = 33, --天降红包2
			sZiYuanXunHui=34, --资源找回
			sNatDayActivity =35, --国庆活动
            sGetMapPlayerInfo = 36, --获取地图内玩家信息
			sCrossYaBiao = 37, --跨服押镖
            sDamoSuccess = 38,--打磨成功返回
            sEnterCrossType = 39, --进入跨服类型
            sGetSportsTitleInfo = 40,   --返回竞技称号信息
            sUpSportsTitleLev = 41, --升级竞技称号返回
			sSendLinShiTitleTime = 42, --限时称号的倒计时，发给前端
			sTakeFirstChargeEx	= 43, --首冲拓展
			sShengXiaoGongDian = 44, --生肖宫殿
            sSendNewZodiacInfo = 45,    --发送十二生肖信息
            sUpdateNewZodiac = 46,  --激活/升级十二生肖成功返回
			sGuildXiangYaoChuMo = 47, --行会降妖除魔
			sYuanGuZhanChangStart = 48,--通知前端远古战场开启
			sBrotherRing=49,--结义戒指
			sBrotherInfo = 50,-- 结义的信息
			sBrotherTask = 51, --结义任务
			sAskAchieveKillBoss = 52, --下发杀怪数据
			sTreasureSystem=53,	--宝物系统
			sAiqystate = 54,	--爱奇艺快捷方式状态
			sGetFlowerCount = 55,--得到花的数量
			sYuanshen = 56, -- 元神系统
			sNeujahrActivity = 57, --元旦活动
			sPalaceFighting = 58, -- 皇宫大乱斗
			sOffLineAward = 59,	--离线奖励
            sGetRedPacketInfo = 60, --发送红包信息
            sGetRedPacketLog = 61, --发送红包日志
            sGetSuperLuckStarInfo = 62, --获取超级幸运星信息
			sDrawSuperLuckStarInfo = 63,--抽奖
			sSuperLuckStarLogInfo = 64,  --超级幸运星抽奖日志
			sRedPacketMoneyChange = 65,  --抢红包元宝池被改变
			sGetGodWeaponInfo = 66,  --获取神兵信息
			sGetOldPlayerReturnInfo = 67,   --获取老兵回归标记信息
			sBroadDiffEffect = 68,   --播放各种特效(以后播放特效后端下发这个协议) ,类型1新年爆竹
			sOldPlayerReturn = 69,--召回成功返回信息-
			sFuHunHandle = 70,		--附魂操作
			sOpenSeverFirstKill = 71, --开服活动首杀boss
			sOpenSeverContinuePay = 72, --开服活动累计充值
			sYCTG_yijianwancheng = 73, --勇闯天关一键完成
            sBossSlotPanelInfo = 74,  --boss符文盘扩展信息
            sFestivalActs = 75, --节日活动相关
			sDaJiDaLi_isOpen = 76, --大吉大利是否开启
			sDaJiDaLi_Acts = 77,--大吉大利活动相关
			sXiaoFeiZhuanPan = 78, --消费转盘
            sGuildFubenBoss = 79,   --行会boss副本 - 
            sBlueVipOperat = 80, --蓝钻vip信息
			sOneYearAct_isOpen = 81, --周年活动是否开启
			sOneYearAct_Acts = 82,--周年活动活动相关
			sGuardDragon = 83, --龙灵守护系统
			sFootPrint = 84, --足迹系统
            sIdentifyCode = 85, --下发验证码状态
            sIdentReturn = 86,  --验证码下发结果
			sOpenServerReturnAndTreasureStore =87 ,--开服活动材料返利和珍宝商店
			sHeChengByGrid =88,            --请求合成
			sXiongMaoLinMonsterCount = 89, --熊猫林还剩余多少只怪
			sLongTengZhuanPan = 90, -- 龙腾转盘
			sCrossGuildState = 91,   --跨服行会信息
			sRingGodSystem = 92,	--戒灵
			sNationalDayActivityNew =93,  --庆典活动
			sShenDunSystem=94,--神盾系统
			sSkyRingOper = 95,   --天戒操作
            sSanRenHongLi_IsOpen = 96, --散人红利是否开启
			sSanRenHongLi = 97, --散人红利协议
            sTianJiangHongLiOper = 98, --天降红利
			sTongTianTa = 99,		--通天塔
            sXianZhuangOper = 100,  --仙装操作
			sXianGongZhuanPan = 101, --仙装转盘
			sJingJI_isOpen = 102, --竞技是否开启
			sJingJI_Acts = 103,--大吉大利活动相关
			sJingJIZhuanPan =104, --竞技转盘
            
		},
	},
	
	
	
	acuSys = 
	{
		sysId = 137,		--经脉子系统
		sub = 
		{
			--客户端上传
			cLevelUp = 1,	--经脉升级
			cGetInfo = 2,	--获取经脉数据
			
			--服务器下发
			sLevelUp = 1,	--经脉升级结果
			sGetInfo = 2,	--经脉数据
		},
	},
	csSys =
	{
		sysId = 144,	--跨服子系统
		sub =
		{
			--客户端上传
			cGetActData = 1,
			cEnterCS = 2,
			
			--服务端下发
			sSendBossList = 1,
			sSendBossEnter = 2,
			
		},
	},
	activitySys = 
	{
		sysID = 145,	-- 活动子系统
		sub = 
		{
			cRecoverEquip = 1,
			cRequireStoneConfig = 2,
			cFreshActorDart = 3,		--刷新个人镖车
			cStartActorDart = 4,			--开始押镖
			cWorshipMsg = 5,				--膜拜或者鄙视
			cFreshWorshipRate = 6,		--膜拜刷新倍率
			cAddWorshipTimes = 7,		--增加膜拜的次数
			cOpenYBDialog = 8,			-- 请求打开押镖对话框
			cSubmitDart = 9,				-- 请求交镖
			cExchangeEquip = 14,			--装备转换
			cExchangeEquipComfire = 16,	--装备转换
			cExchangeEquipTimes = 17,	--装备转换剩余次数查询
			cOnEnterScene = 18,			--请求进入场景
			cGetGiveUpDart = 19,		--护送押镖面板请求放弃护送
			cExitActivity = 20, 		-- 退出活动
			cEnterNextLayer = 21,		-- 进入下一层
			cContinueEscort = 22,		-- 继续护送
			cUseInvincibleSkill = 23, -- 无敌镖车技能
			cUseGuildHelpSkill = 24, -- 行会求救技能
			cGetActivityData = 25,  -- 获得活动数据
            cAutoStopDart = 26,     --暂停押镖护送 关闭定时器
			
			
			-- 服务端下发
			sSendStoneConfig = 1,
			sSendRecoverResult = 2,
			sStartActorDart = 3,		-- 开始押镖
			sOpenEscortWin = 4,			-- 打开护送窗口
			sUpdateDartInfo = 5, 	-- 更新押镖信息
--			sDartFinished = 7,		-- 完成押镖

			sDartSurplusTimes = 8,	-- 剩余押镖次数
			sDartTipsBuyVIP = 9,		-- 提示购买VIP
			sStatueUpdateInfo = 10,			-- 膜拜信息
			sStatueInfoBack = 11,			-- 膜拜信息返回
			sStatueAddWorshipBack = 12,			-- 增加膜拜次数返回
			sStatueWorshipBack = 13,			-- 鄙视或膜拜
			
			sJoinActivity = 20,			-- 参与活动
			sUpdateActivityData = 21,	-- 更新活动数据
			sExitActivity = 22, 			-- 退出活动
			sSendOpenYBDlgData = 23,	-- 押镖对话框数据
			sDartRefreshPuality = 24,	-- 镖车刷新品质
			sSubmitDartResult = 25,		-- 交镖结果
			sAbandonEscort = 26,		-- 放弃护送结果
			sMoveToDartPos = 27,		-- 移动到镖车旁
			sWorshipRefreshAward = 28, -- 膜拜刷新奖励
			sPauseAutoDart = 29,			-- 暂停自动护送
			sEnterNextLayer = 30,		-- 进入下一层
            sGuildSOS = 31,             --行会求救
            sDartFail = 32,             --押镖失败
			
		},
	},
}


--MISSION_RTV_IDX开头的变量是代表保存在玩家任务系统里的100个整数的索引，每个整数存储不同的数据
MISSION_RTV_IDX_MISSIONID   = 0   -- 任务ID的存储位置
MISSION_RTV_IDX_MISSIONIDX  = 1   -- 人物在NPC当前表的索引位置
MISSION_RTV_IDX_MISSIONSTEP = 2   -- 玩家对话的步骤存储的位置（初始值为 1）

--货币的类型和属性的对应
moneyTypeMap = 
{
  [0] = PROP_ACTOR_BIND_COIN,
	[1] = PROP_ACTOR_COIN,
	[2] = PROP_ACTOR_BIND_YUANBAO,
	[3] = PROP_ACTOR_YUANBAO,
	[4] = PROP_ACTOR_RENOWN,
	[5] = PROP_ACTOR_ZHANHUN,
}

moneyTypeName = {
	[0] = Lang.ScriptTips.coin000,
	[1] = Lang.ScriptTips.coin001,
	[2] = Lang.ScriptTips.coin002,
	[3] = Lang.ScriptTips.coin003,	
}

--以下是副本相关的定义
--这是副本的状态定义
FB_FS_GETAWARD = 100			--领奖状态
FB_BS_FINISHED = 99				--已完成

--这是副本的存储的值的索引
FB_FR_IDX_LEVEL = 1				--副本完成后的等级，发奖励要用
FB_FR_IDX_BOX = 10				--保存箱子是否开启的值，1个int，记录10个箱子的开启情况，0-4位是银箱，5-9是金箱

--阵营对应的中文名
Zy_cn = 
{
	Lang.Misc.m000200,
	Lang.Misc.m000201,
	Lang.Misc.m000202,
}
--职业对应的中文名

Job_cn = {
	Lang.ScriptTips.rank0001,
	Lang.ScriptTips.rank0002,
	Lang.ScriptTips.rank0003,
}

Sex_cn = 
{
	[0] = Lang.ScriptTips.mt00020,
	[1] = Lang.ScriptTips.mt00019,
}

--奖励对应中文名
Award_cn = 
{
	Lang.Misc.m000450,
	Lang.Misc.m000451,
	Lang.Misc.m000452,
	Lang.Misc.m000453,
	Lang.Misc.m000454,
	Lang.Misc.m000455,
	Lang.Misc.m000456,
	Lang.Misc.m000457,
	Lang.Misc.m000458,
	Lang.Misc.m000459,
	Lang.Misc.m000460,
	Lang.Misc.m000461,
	Lang.Misc.m000462,
	Lang.Misc.m000463,
	Lang.Misc.m000464,
	Lang.Misc.m000465,
	Lang.Misc.m000466,
	Lang.Misc.m000467,
	Lang.Misc.m000468,
	Lang.Misc.m000469,
	Lang.Misc.m000470,
	Lang.Misc.m000471,

}

--阵营关系
CampRelation =
{
	Enemy = 1,
	Union = 2,
	Same  = 3,
}

--打开角色属性窗口ID定义
OpenDialogID =
{
	diItem = 0,	--物品窗口
	diActor = 1,	--角色属性窗口
	diQuest = 2,	--任务
	diSkill = 3,	--技能
	diStrong = 4,	--强化
	diGuild = 5,	--帮派
	diSell = 6,		--寄卖
	diSystem = 7,	--系统
	diStore = 8,	--商城
	diFubenTeam = 9,--副本系统中的窗口
	diFubenList = 10,--列出所有的副本队伍的窗口
	diBuyAnItem = 11,--显示某个物品的购买窗口
	diFuncDia = 12,		--显示自定义功能窗口，附带的参数为字符串，包含按钮连接
	diMemoDia = 13,		--一个文本内容的对话框，"标题,内容"
	diRenown = 14,	--声望商店
	diStartPlay = 100,--开始游戏
}

--特效ID定义
EffectID = 
{
	eFlower = 1,		--花瓣
	eMoneyCommon = 2,	--普通金钱雨
	eMoneySpecial = 3,	--特殊金钱雨
	eSnow = 4,			--雪花
}

--金钱物品ID
ITEM_COIN_ID = 475
ITEM_BIND_COIN_ID = 476
ITEM_YB_ID = 477
ITEM_BIND_YB = 478


--#endif //end of _GLOBAL_DEFINES_INCLUDED_
