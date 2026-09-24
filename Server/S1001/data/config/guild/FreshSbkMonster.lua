--王城怪物进攻

SbkGuildMonsterConfig =
{
	--刷怪 王城危机怪物进攻
	monsters =
	{
		nMonsterID = 306,
		nSceenId = 4, 
		posX = 96, posY =  100,
		nCount = 1, 
		nLiveTime = 3600,
	},

	--沙巴克易主刷宝箱
	SbkBoxs =
	{
		{nMonsterID = 596, nSceenId = 9, posX1 = 16, posX2 = 16,  posY = 15, nCount = 1, nLiveTime = 600,},
	},

	--沙城荣誉神殿
	nSceenId = 119,						--沙城荣誉神殿的场景id
	nSceenRange = {152,158,4,4},		--进入荣誉神殿的坐标
	minLevel = 40,						--进入沙城荣誉神殿的最低等级

	broadPerMin = 1 * 60,				--开启后每隔一分钟播报的消息 单位秒

	nonActivityTime = {19,22},			--沙城荣誉神殿 这个时间不能开启
	needGuildCoin = 1000000,				--开启沙城荣誉神殿需要的行会资金
	freeOpenTimes = 1,						--免费开启的次数
	totalOpenTimes = 2,						--总共开启的次数

	--需要的行会钱票的个数 itemId表示行会钱票物品id，count表示需要的个数
	nDrafts = {itemId = 315,count = 2,},
	openNeedYb = 100,					--开启需要的元宝
	halfOpenYb = 50,					--有一个行会银票，需要扣除的行会银票

	fressBossTime = 5 * 60 * 1000,			--5 * 60 * 1000 5分种后才刷出boss	单位毫秒

	sbkTimeUp = 30 * 60,					--30 * 60沙城荣誉神殿的时间 30分钟 单位秒

	--沙城荣誉神殿刷出将军 存活20分钟
	cityMonster =
	{
		{nMonsterID = 589, nSceenId = 119, posX1 = 98, posX2 = 143,  posY = 126, nCount = 1, nLiveTime = 1200,},
	},

	outSceenId = 9,						--退出沙城荣誉神殿的场景id
	outRange = {14,16,2,2},			--退出荣誉神殿回到原来场景的坐标

	perTime = 30000,				--30000沙城荣誉神殿每隔多少时间给经验等 单位毫秒：30秒

	--沙城荣誉神殿定时给经验等
	GiveExpOnTime =
	{
		{ type = 20, id = 1, count = 30, strong = 0, quality = 0, bind = 0 },
		{ type = 21, id = 0, count = 250, strong = 0, quality = 0, bind = 0 },
	},
	
	monsterRaid = 
	{
		sceneid = 3,
		monsterMaxNum = {3,3,3,3}, --每个地点刷多少只
		monsterRange = {307,313},	--怪物的范围ID
		createPos = {{96,122},{154,137},{150,91},{107,83}},		--创建怪物的中心坐标
		posDeviation = {-5,5},	--坐标偏差
		nLiveTime = 1800,
	}
}
