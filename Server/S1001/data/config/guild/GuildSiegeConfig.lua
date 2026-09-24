--lua script

--沙巴克攻城战配置
GuildSiegeConfig = {
	callGuardCoin = 0,		--召唤弓箭护卫需要的行会资金
	repairWallCoin = 0,		--维修城墙需要的行会资金
	AwardYb = 0,			--开服第一个占领的行会头领奖励的元宝
	SbkLeaderWeapons = 834,	--城主专属武器

	ManmMnsterFashion = { type = 0, id = 270, count = 0, strong = 0, quality = 0, bind = 1 },	--城主时装id（男）
	WomanMonsterFashion = { type = 0, id = 271, count = 0, strong = 0, quality = 0, bind = 1 },	--城主时装id（女）

	countDown = 12,			--发财大家发倒计时 单位秒

	--effectId 发财大家发的金币特效id
	--effectLastTime特效持续的时间 单位秒
	-- effectType 特效的类型 无效果=0,挥洒=1,投掷=2,飞行=3,爆炸=4,脚下持续=5,持续=6
	sbkeffect = {effectId = 2,effectLastTime = 30,},
	
	freeAwardLevel = 65,	--攻城战皇宫送经验金币等级
	freeExp = 3000,			--每两秒赠送的经验
	freeCoin = 150,			--每两秒赠送的金币
	freeMoneyType = 0,		--绑金类型

	SbkSceenId = 83,			--盟重土城场景id
	PalaceSceenId = 10,		--皇城场景id
	FightSceenId = 11,		--皇宫场景id
	exitPos = {140,163,10,10},	--退出的坐标  （140，163） 以半径10随机
	SbkPillars = {172,173,174,175,176},		--皇城柱子
	PostPos = {108,114},


	MiDaoEnterPalace =		--从密道进入的坐标
	{
		{enterPos = {14,17,3,3},},
		{enterPos = { 8,21,1,1},},
		{enterPos = {10,24,1,1},},
		{enterPos = {12,18,3,3},},
		{enterPos = {14,12,1,1},},
		{enterPos = {16,15,3,3},},
		{enterPos = {19,14,2,2},},
		{enterPos = { 9,17,1,1},},
	},

	LimitLevel = 45,		--能通过沙巴克密道的最低等级

	MaxTaxing = 3000000,		--税收上限
	taxingRate = 10,		--税率10%

	MaxCanGetTaxing = 800000000,			--可领取的税收最大上限 8亿

	LoopTime = 30000,		--沙巴克皇宫的经验奖励30秒循环时间 单位毫秒
	LoopExp = { type = 20, id = 2, count = 0, strong = 0, quality = 0, bind = 0 },	--经验库2 的经验奖励
	TrackMinLevel = 40,				--攻城追踪信息显示的最低等级
	SbkActivityTime = 2 * 60 * 60,		--沙巴克战持续时间

	--沙巴克领取福利的信息
	AwardSbkPostion =
	{
		{
			posId = 1,	--城主职位id
			itemId = 501,	--领取的物品id（大宝印）
			itemNum = 0,	--领取的数量
			itemBind = 1,	--绑定
		},

		{
			posId = 2,	--城主夫人
			itemId = 501,
			itemNum = 0,
			itemBind = 1,
		},

		{
			posId = 3,	--副城主
			itemId = 501,
			itemNum = 0,
			itemBind = 1,
		},
		{
			posId = 4,	--大长老
			itemId = 501,
			itemNum = 0,
			itemBind = 1,
		},
		{
			posId = 5,	--左护法
			itemId = 501,
			itemNum = 0,
			itemBind = 1,
		},

		{
			posId = 6,	--右护法
			itemId = 501,
			itemNum = 0,
			itemBind = 1,
		},
	},

	--传送门
	teleport =
	{
		{ Sceneid = 8, posx = 326, posy = 242,toSceneid = 9,toPosx =  9, toPosy = 21,modelid = 50001,name = Lang.SceneName.s50001 },  --盟重土城→沙巴克皇宫左城墙
		{ Sceneid = 8, posx = 329, posy = 241,toSceneid = 9,toPosx = 12, toPosy = 21,modelid = 50002,name = Lang.SceneName.s50002 },  --盟重土城→沙巴克皇宫中城墙
		{ Sceneid = 8, posx = 336, posy = 234,toSceneid = 9,toPosx = 19, toPosy = 15,modelid = 50003,name = Lang.SceneName.s50003 },  --盟重土城→沙巴克皇宫右城墙

	},

	--城墙配置
	wallMonsters =
	{
		{Sceneid = 8, nMonsterID = 115, posX1 = 326, posX2 = 326,  posY = 242, nCount = 1, nLiveTime = 0,},	--左城墙
		{Sceneid = 8, nMonsterID = 116, posX1 = 329, posX2 = 329,  posY = 242, nCount = 1, nLiveTime = 0,},	--中城墙
		{Sceneid = 8, nMonsterID = 261, posX1 = 336, posX2 = 336,  posY = 235, nCount = 1, nLiveTime = 0,},	--右城墙
	},

	--弓箭手配置
	archerConfig =
	{
		{Sceneid = 8, nMonsterID = 114, posX1 = 377, posX2 = 377,  posY = 296, nCount = 1, nLiveTime = 0,},	--弓箭护卫1
		{Sceneid = 8, nMonsterID = 114, posX1 = 381, posX2 = 381,  posY = 292, nCount = 1, nLiveTime = 0,},	--弓箭护卫2
		{Sceneid = 8, nMonsterID = 114, posX1 = 372, posX2 = 372,  posY = 301, nCount = 1, nLiveTime = 0,},	--弓箭护卫3
		{Sceneid = 8, nMonsterID = 114, posX1 = 368, posX2 = 368,  posY = 305, nCount = 1, nLiveTime = 0,},	--弓箭护卫4
		{Sceneid = 8, nMonsterID = 114, posX1 = 357, posX2 = 357,  posY = 270, nCount = 1, nLiveTime = 0,},	--弓箭护卫5
		{Sceneid = 8, nMonsterID = 114, posX1 = 360, posX2 = 360,  posY = 270, nCount = 1, nLiveTime = 0,},	--弓箭护卫6
		{Sceneid = 8, nMonsterID = 114, posX1 = 346, posX2 = 346,  posY = 265, nCount = 1, nLiveTime = 0,},	--弓箭护卫7
		{Sceneid = 8, nMonsterID = 114, posX1 = 344, posX2 = 344,  posY = 262, nCount = 1, nLiveTime = 0,},	--弓箭护卫8
		{Sceneid = 8, nMonsterID = 114, posX1 = 339, posX2 = 339,  posY = 240, nCount = 1, nLiveTime = 0,},	--弓箭护卫9
		{Sceneid = 8, nMonsterID = 114, posX1 = 343, posX2 = 343,  posY = 236, nCount = 1, nLiveTime = 0,},	--弓箭护卫10
		{Sceneid = 8, nMonsterID = 114, posX1 = 333, posX2 = 333,  posY = 246, nCount = 1, nLiveTime = 0,},	--弓箭护卫11
		{Sceneid = 8, nMonsterID = 114, posX1 = 329, posX2 = 329,  posY = 250, nCount = 1, nLiveTime = 0,},	--弓箭护卫12
	},

	FortuneLastTime = 10,			--发财大家发持续的时间

	--发财大家发的奖励（奖励请看经济表的 系统奖励——>沙城争夺战）
	FortuneAwards =
	{
		{
			needCoin = 1000000,			--投入100W行会资金
			nCount = 32,			--奖励类型的个数

			nRate = {1,2,3,4,6,9,10,13,15,27,29,30,32,34,36,38,40,45,43,45,65,70,80,83,90,93,94,95,96,97,98,99,100},				--奖励的概率
			awards=
			{
				-- { type = 0, id = 653, count = 0, bind = 1 },
				-- { type = 0, id = 0, count = 0, bind = 1 },
				-- { type = 0, id = 421, count = 0, bind = 1 },
				-- { type = 0, id = 354, count = 0, bind = 1 },
				-- { type = 0, id = 276, count = 0, bind = 1 },
				-- { type = 0, id = 278, count = 0, bind = 1 },
				-- { type = 0, id = 279, count = 0, bind = 1 },
				-- { type = 0, id = 366, count = 0, bind = 1 },
				-- { type = 0, id = 368, count = 0, bind = 1 },
				-- { type = 0, id = 659, count = 0, bind = 1 },
				-- { type = 0, id = 560, count = 0, bind = 1 },
				-- { type = 0, id = 676, count = 0, bind = 1 },
				-- { type = 0, id = 731, count = 0, bind = 1 },
				-- { type = 0, id = 703, count = 0, bind = 1 },
				-- { type = 0, id = 330, count = 0, bind = 1 },
				-- { type = 0, id = 371, count = 0, bind = 1 },
				-- { type = 0, id = 374, count = 0, bind = 1 },
				-- { type = 0, id = 377, count = 0, bind = 1 },
				-- { type = 0, id = 380, count = 0, bind = 1 },
				-- { type = 0, id = 419, count = 0, bind = 1 },
				-- { type = 0, id = 420, count = 0, bind = 1 },
				-- { type = 0, id = 651, count = 0, bind = 1 },
				-- { type = 0, id = 652, count = 0, bind = 1 },
				-- { type = 0, id = 655, count = 0, bind = 1 },
				-- { type = 0, id = 656, count = 0, bind = 1 },
				-- { type = 0, id = 745, count = 0, bind = 1 },
				-- { type = 0, id = 755, count = 0, bind = 1 },
				-- { type = 0, id = 765, count = 0, bind = 1 },
				-- { type = 0, id = 775, count = 0, bind = 1 },
				-- { type = 0, id = 785, count = 0, bind = 1 },
				-- { type = 0, id = 795, count = 0, bind = 1 },
				-- { type = 0, id = 805, count = 0, bind = 1 },
			},
		},

		{
			needCoin = 5000000,			--投入500W行会资金
			nCount = 32,			--奖励类型的个数

			nRate = {1,2,3,4,6,9,10,13,15,27,29,30,32,34,36,38,40,45,43,45,65,70,80,83,90,93,94,95,96,97,98,99,100},				--奖励的概率
			awards=
			{
				-- { type = 0, id = 654, count = 1, bind = 1 },
				-- { type = 0, id = 0, count = 1, bind = 1 },
				-- { type = 0, id = 422, count = 1, bind = 1 },
				-- { type = 0, id = 354, count = 1, bind = 1 },
				-- { type = 0, id = 276, count = 1, bind = 1 },
				-- { type = 0, id = 278, count = 1, bind = 1 },
				-- { type = 0, id = 279, count = 1, bind = 1 },
				-- { type = 0, id = 367, count = 1, bind = 1 },
				-- { type = 0, id = 369, count = 1, bind = 1 },
				-- { type = 0, id = 660, count = 1, bind = 1 },
				-- { type = 0, id = 560, count = 1, bind = 1 },
				-- { type = 0, id = 677, count = 1, bind = 1 },
				-- { type = 0, id = 731, count = 1, bind = 1 },
				-- { type = 0, id = 704, count = 1, bind = 1 },
				-- { type = 0, id = 626, count = 1, bind = 1 },
				-- { type = 0, id = 372, count = 1, bind = 1 },
				-- { type = 0, id = 375, count = 1, bind = 1 },
				-- { type = 0, id = 378, count = 1, bind = 1 },
				-- { type = 0, id = 381, count = 1, bind = 1 },
				-- { type = 0, id = 420, count = 1, bind = 1 },
				-- { type = 0, id = 421, count = 1, bind = 1 },
				-- { type = 0, id = 652, count = 1, bind = 1 },
				-- { type = 0, id = 653, count = 1, bind = 1 },
				-- { type = 0, id = 656, count = 1, bind = 1 },
				-- { type = 0, id = 657, count = 1, bind = 1 },
				-- { type = 0, id = 746, count = 1, bind = 1 },
				-- { type = 0, id = 756, count = 1, bind = 1 },
				-- { type = 0, id = 766, count = 1, bind = 1 },
				-- { type = 0, id = 776, count = 1, bind = 1 },
				-- { type = 0, id = 786, count = 1, bind = 1 },
				-- { type = 0, id = 796, count = 1, bind = 1 },
				-- { type = 0, id = 806, count = 1, bind = 1 },
			},
		},

		{
			needCoin = 10000000,			--投入1000W行会资金
			nCount = 32,				--奖励类型的个数

			nRate = {1,2,3,4,6,9,10,13,15,27,29,30,32,34,36,38,40,45,43,45,65,70,80,83,90,93,94,95,96,97,98,99,100},				--奖励的概率
			awards=
			{
				-- { type = 0, id = 0, count = 1, bind = 1 },
				-- { type = 0, id = 0, count = 1, bind = 1 },
				-- { type = 0, id = 0, count = 1, bind = 1 },
				-- { type = 0, id = 354, count = 1, bind = 1 },
				-- { type = 0, id = 276, count = 1, bind = 1 },
				-- { type = 0, id = 278, count = 1, bind = 1 },
				-- { type = 0, id = 279, count = 1, bind = 1 },
				-- { type = 0, id = 367, count = 1, bind = 1 },
				-- { type = 0, id = 369, count = 1, bind = 1 },
				-- { type = 0, id = 661, count = 1, bind = 1 },
				-- { type = 0, id = 560, count = 1, bind = 1 },
				-- { type = 0, id = 677, count = 1, bind = 1 },
				-- { type = 0, id = 731, count = 1, bind = 1 },
				-- { type = 0, id = 704, count = 1, bind = 1 },
				-- { type = 0, id = 682, count = 1, bind = 1 },
				-- { type = 0, id = 373, count = 1, bind = 1 },
				-- { type = 0, id = 376, count = 1, bind = 1 },
				-- { type = 0, id = 379, count = 1, bind = 1 },
				-- { type = 0, id = 382, count = 1, bind = 1 },
				-- { type = 0, id = 421, count = 1, bind = 1 },
				-- { type = 0, id = 422, count = 1, bind = 1 },
				-- { type = 0, id = 653, count = 1, bind = 1 },
				-- { type = 0, id = 654, count = 1, bind = 1 },
				-- { type = 0, id = 657, count = 1, bind = 1 },
				-- { type = 0, id = 658, count = 1, bind = 1 },
				-- { type = 0, id = 747, count = 1, bind = 1 },
				-- { type = 0, id = 757, count = 1, bind = 1 },
				-- { type = 0, id = 767, count = 1, bind = 1 },
				-- { type = 0, id = 777, count = 1, bind = 1 },
				-- { type = 0, id = 787, count = 1, bind = 1 },
				-- { type = 0, id = 797, count = 1, bind = 1 },
				-- { type = 0, id = 807, count = 1, bind = 1 },
			},
		},
	},

	hAwardTimeRang = {22,23},						--回收后首个周五占领 领取攻沙元宝奖励的时间 

	nAwardYb = 1000,								--回收后首个周五占领 奖励的元宝
}


