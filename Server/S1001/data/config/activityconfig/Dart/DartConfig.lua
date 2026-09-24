--护送美女
EscortDartConfig =
{
	DartQuestId = 353,	--有这个任务存在，可以不计次数
	LevelLimit = 40,	--参加活动最低等级
	ApplyDely = 1800,	--领取美女护送时间持续(秒)

	OpenTimes = 5,			--非vip每天开始运镖次数
	VipOpenTimes = 5,		--vip每天开启运镖次数

	FreshFreeTimes = 3,		--免费刷新的次数
	FreshFreeVipTimes = 5,		--vip免费刷新的次数

	FreshNeedItem = 816,		--刷新时需要的道具
	FreshNeedCoupons = 5000,	--刷新时需要的金币/绑金
	FreshNeedYb = 200,			--刷新时需要的元宝/绑定元宝

	FreshTimes = 10,		--刷新次数达到10次 给予额外奖励
	AwardRate = 10,			--额外奖励的概率 /100
	
	AwardTime = 16,			--持续半个小时 额外奖励的时间16:30-17
	AwardTimeMut = 30,

	AwardsRate = 2,		--额外奖励的倍率 
	
	DoubleExp = {2,3,5}, --多少倍经验
	DoubleExpYB = {200,500,1000}, --领取多倍经验的元宝
	--美女的档次
	DartHorse =
	{
		--  精铁
		{
			id = 171,				--镖车的id
			livetime =1800,			--存活的时间
			monName = Lang.EntityName.p4,	--镖车名字
			color = "0xFF00FF00",			--镖车的颜色

			freshRate =  --刷新概率
			{			
				{85,95,99,100},	--金币刷新
				{10,40,85,100},	--元宝刷新
			},			
			--奖励
			Awards =
			{
				{type = 20, id = 1, count = 1250000, quality = 0, strong = 0, bind = 0, param = 0},	--经验
				{type = 36, id = 0, count = 175, quality = 0, strong = 0, bind = 0, param = 0},
				{type = 40, id = 0, count = 150, quality = 0, strong = 0, bind = 0, param = 0},--金币
			},

			AwardsMore =				--额外的奖励
			{
				{type = 0, id = 511, count = 1, quality = 0, strong = 0, bind = 1, param = 0},
			},
		},

		--  铜铁
		{
			id = 170,				--镖车的id
			livetime =1800,			--存活的时间
			monName = Lang.EntityName.p5,	--镖车名字
			color = "0xFF0080FF",			--镖车的颜色

			freshRate = 
			{
				{0,95,99,100},
				{10,40,85,100},
			},		--刷新概率 /100
			--奖励
			Awards =
			{
				{type = 20, id = 1, count = 2500000, quality = 0, strong = 0, bind = 0, param = 0},	--经验
				{type = 36, id = 0, count = 350, quality = 0, strong = 0, bind = 0, param = 0},
				{type = 40, id = 0, count = 300, quality = 0, strong = 0, bind = 0, param = 0},--金币			
			},

			AwardsMore =				--额外的奖励
			{
				{type = 0, id = 511, count = 1, quality = 0, strong = 0, bind = 1, param = 0},
			},
		},

		--  银铁
		{
			id = 169,				--镖车的id
			livetime =1800,			--存活的时间
			monName = Lang.EntityName.p6,	--镖车名字
			color = "0xFF200C1",			--镖车的颜色

			freshRate =  
			{
				{30,70,95,100},
				{10,40,85,100},
			},				--刷新概率
			--奖励
			Awards =
			{
				{type = 20, id = 1, count = 5000000, quality = 0, strong = 0, bind = 0, param = 0},	--经验
				{type = 36, id = 0, count = 700, quality = 0, strong = 0, bind = 0, param = 0},
				{type = 40, id = 0, count = 600, quality = 0, strong = 0, bind = 0, param = 0},--金币			
			},

			AwardsMore =				--额外的奖励
			{
				{type = 0, id = 511, count = 1, quality = 0, strong = 0, bind = 1, param = 0},
			},
		},

		-- 
		{
			id = 168,				--镖车的id
			livetime =1800,			--存活的时间
			monName = Lang.EntityName.p7,	--镖车名字
			color = "0xFFFF6600",			--镖车的颜色

			freshRate =  
			{
				{20,30,70,100},
				{10,40,85,100},
			},		--刷新概率 /100
			--奖励
			Awards =
			{
				{type = 20, id = 1, count = 8000000, quality = 0, strong = 0, bind = 0, param = 0},	--经验
				{type = 36, id = 0, count = 1200, quality = 0, strong = 0, bind = 0, param = 0},
				{type = 40, id = 0, count = 1000, quality = 0, strong = 0, bind = 0, param = 0},--金币			
			},

			AwardsMore =				--额外的奖励
			{
				{type = 0, id = 511, count = 1, quality = 0, strong = 0, bind = 1, param = 0},
			},
		},

	},

	Src = {sid = 2, x = 147, y = 174, snpcname = Lang.EntityName.n00222},
	--x、y为目标npc 所在坐标，destsceneid为目标场景，destnpcname为目标NPC名称
	Dest = {destsceneid = 1, x = 73, y = 45, destnpcname = Lang.EntityName.n00223},

	DartSetup =
	{
		succFollowDist = 8,						-- 交镖成功距离
		actionTime = 1800,						-- 护镖活动时间，秒为单位
		-- guargStatus 护镖状态定义
		CampDartStatusIdle = 0,			-- 没有护镖
		CampDartStatusAccept = 1,		-- 已经接镖
		CampDartStatusFinished = 2,		-- 完成镖，但还没有领取奖励
		CampDartStatusGotAward = 3, 		-- 已经领取奖励。实际上此状态不存在。在领取奖励之后，就会重置

		-- guardFailedReason 护镖失败原因
		CampDartFailUnknown = 0,			-- 未知原因
		CampDartFailExpired = 1,  		-- 护镖超时
		CampDartFailOverMaxDist = 2,		-- 玩家和镖车距离过远
		CampDartFailObjDie=3,				-- 镖车死亡
		CampDartFailActorGiveUp=4,		-- 玩家放弃
		CampDartFailActorLogout=5,		-- 玩家退出游戏
		CampDartFailBeLoot = 6,			--玩家死亡 镖车被劫
	},
	
	FinishsuccDist = 30,				--交镖的距离
	AddBuff = 
	{
		{buffType= 49, value=-10, buffGroup= 10,times =1,interval= 1800,needDelete =true,timeOverlay =true,buffName = Lang.Activity.t00093,},
	},
}
