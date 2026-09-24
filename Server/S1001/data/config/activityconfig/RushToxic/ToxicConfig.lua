--勇闯龙坛
ToxicConfig =
{
	limitLev = 35,		--进入限制等级
	FubId = 1,		--副本的id
	EnterScreen= 61,		--进入场景id

	nLimitLevel = 35,		--进入的最低等级

	nMapX = 31,		--进入场景坐标X
	nMapY = 66,		--进入场景坐标Y

	LastTime = 1800,	--副本持续的时间

	freeTimes = 1,	--进入的免费次数
	needCoin = 500000,	--开启需要的行会资金
	AddCoin = 500000,	--每次开启递增的行会资金
	
	ExitSceenId = 3,	--退出副本的id
	eMapX = 26,		--退出的x坐标
	eMapY = 35,		--退出的y坐标

	minNum = 30,		--至少击杀30只怪,才上当天排行榜

	mosterCount = {22,34,44,56,70,70,80,80,100,113}, --每波怪物的总数量每波减少约5个 原：{25,37,49,61,73,75,87,87,101,113}
	--刷怪
	monsters =
	{

		--第一波
		{
			{nMonsterID = 197, posX1 = 48, posX2 = 50,  posY = 46, nCount = 1, nLiveTime = 1800, exp = 4140256,},
			{nMonsterID = 198, posX1 = 33, posX2 = 40,  posY = 52, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 198, posX1 = 33, posX2 = 40,  posY = 54, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 198, posX1 = 39, posX2 = 46,  posY = 60, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 198, posX1 = 39, posX2 = 46,  posY = 62, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 198, posX1 = 53, posX2 = 60,  posY = 58, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 198, posX1 = 53, posX2 = 60,  posY = 60, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 198, posX1 = 61, posX2 = 68,  posY = 49, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 198, posX1 = 61, posX2 = 68,  posY = 51, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 198, posX1 = 46, posX2 = 53,  posY = 31, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 198, posX1 = 46, posX2 = 53,  posY = 33, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 198, posX1 = 33, posX2 = 40,  posY = 39, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 198, posX1 = 33, posX2 = 40,  posY = 41, nCount = 2, nLiveTime = 1800,},

		},

		--第二波
		{
			{nMonsterID = 199, posX1 = 48, posX2 = 50,  posY = 46, nCount = 1, nLiveTime = 1800, exp = 6900427,},
			{nMonsterID = 200, posX1 = 33, posX2 = 40,  posY = 52, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 200, posX1 = 33, posX2 = 40,  posY = 54, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 200, posX1 = 39, posX2 = 46,  posY = 60, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 200, posX1 = 39, posX2 = 46,  posY = 62, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 200, posX1 = 53, posX2 = 60,  posY = 58, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 200, posX1 = 53, posX2 = 60,  posY = 60, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 200, posX1 = 61, posX2 = 68,  posY = 49, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 200, posX1 = 61, posX2 = 68,  posY = 51, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 200, posX1 = 46, posX2 = 53,  posY = 31, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 200, posX1 = 46, posX2 = 53,  posY = 33, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 200, posX1 = 33, posX2 = 40,  posY = 39, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 200, posX1 = 33, posX2 = 40,  posY = 41, nCount = 3, nLiveTime = 1800,},

		},

		--第三波
		{
			{nMonsterID = 201, posX1 = 48, posX2 = 50,  posY = 46, nCount = 1, nLiveTime = 1800, exp = 10350640,},
			{nMonsterID = 202, posX1 = 33, posX2 = 40,  posY = 52, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 202, posX1 = 33, posX2 = 40,  posY = 54, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 202, posX1 = 39, posX2 = 46,  posY = 60, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 202, posX1 = 39, posX2 = 46,  posY = 62, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 202, posX1 = 53, posX2 = 60,  posY = 58, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 202, posX1 = 53, posX2 = 60,  posY = 60, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 202, posX1 = 61, posX2 = 68,  posY = 49, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 202, posX1 = 61, posX2 = 68,  posY = 51, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 202, posX1 = 46, posX2 = 53,  posY = 31, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 202, posX1 = 46, posX2 = 53,  posY = 33, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 202, posX1 = 33, posX2 = 40,  posY = 39, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 202, posX1 = 33, posX2 = 40,  posY = 41, nCount = 4, nLiveTime = 1800,},

		},

		--第四波
		{
			{nMonsterID = 203, posX1 = 48, posX2 = 50,  posY = 46, nCount = 1, nLiveTime = 1800, exp = 13800853,},
			{nMonsterID = 204, posX1 = 33, posX2 = 40,  posY = 52, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 204, posX1 = 33, posX2 = 40,  posY = 54, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 204, posX1 = 39, posX2 = 46,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 204, posX1 = 39, posX2 = 46,  posY = 62, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 204, posX1 = 53, posX2 = 60,  posY = 58, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 204, posX1 = 53, posX2 = 60,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 204, posX1 = 61, posX2 = 68,  posY = 49, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 204, posX1 = 61, posX2 = 68,  posY = 51, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 204, posX1 = 46, posX2 = 53,  posY = 31, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 204, posX1 = 46, posX2 = 53,  posY = 33, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 204, posX1 = 33, posX2 = 40,  posY = 39, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 204, posX1 = 33, posX2 = 40,  posY = 41, nCount = 5, nLiveTime = 1800,},

		},

		--第五波
		{
			{nMonsterID = 205, posX1 = 48, posX2 = 50,  posY = 46, nCount = 1, nLiveTime = 1800, exp = 17251067,},
			{nMonsterID = 206, posX1 = 33, posX2 = 40,  posY = 52, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 33, posX2 = 40,  posY = 54, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 39, posX2 = 46,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 39, posX2 = 46,  posY = 62, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 53, posX2 = 60,  posY = 58, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 53, posX2 = 60,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 61, posX2 = 68,  posY = 49, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 61, posX2 = 68,  posY = 51, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 46, posX2 = 53,  posY = 31, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 46, posX2 = 53,  posY = 33, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 33, posX2 = 40,  posY = 39, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 33, posX2 = 40,  posY = 41, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 47, posX2 = 50,  posY = 51, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 47, posX2 = 50,  posY = 41, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 43, posX2 = 45,  posY = 46, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 206, posX1 = 53, posX2 = 55,  posY = 46, nCount = 3, nLiveTime = 1800,},

		},

		--第六波
		{
			{nMonsterID = 207, posX1 = 48, posX2 = 50,  posY = 46, nCount = 1, nLiveTime = 1800, exp = 20701280,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 52, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 54, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 39, posX2 = 46,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 39, posX2 = 46,  posY = 62, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 53, posX2 = 60,  posY = 58, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 53, posX2 = 60,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 61, posX2 = 68,  posY = 49, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 61, posX2 = 68,  posY = 51, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 53,  posY = 31, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 53,  posY = 33, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 39, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 41, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 50,  posY = 51, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 50,  posY = 41, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 43, posX2 = 47,  posY = 46, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 51, posX2 = 55,  posY = 46, nCount = 3, nLiveTime = 1800,},

		},

		--第七波
		{
			{nMonsterID = 209, posX1 = 48, posX2 = 50,  posY = 46, nCount = 1, nLiveTime = 1800, exp = 31051920,},
			{nMonsterID = 210, posX1 = 27, posX2 = 30,  posY = 42, nCount = 1, nLiveTime = 1800,},
			{nMonsterID = 210, posX1 = 27, posX2 = 30,  posY = 44, nCount = 1, nLiveTime = 1800,},
			{nMonsterID = 210, posX1 = 48, posX2 = 51,  posY = 24, nCount = 1, nLiveTime = 1800,},
			{nMonsterID = 210, posX1 = 48, posX2 = 51,  posY = 26, nCount = 1, nLiveTime = 1800,},
			{nMonsterID = 210, posX1 = 72, posX2 = 75,  posY = 46, nCount = 1, nLiveTime = 1800,},
			{nMonsterID = 210, posX1 = 72, posX2 = 75,  posY = 48, nCount = 1, nLiveTime = 1800,},
			{nMonsterID = 210, posX1 = 52, posX2 = 55,  posY = 70, nCount = 1, nLiveTime = 1800,},
			{nMonsterID = 210, posX1 = 52, posX2 = 55,  posY = 68, nCount = 1, nLiveTime = 1800,},
			{nMonsterID = 210, posX1 = 47, posX2 = 50,  posY = 45, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 210, posX1 = 47, posX2 = 50,  posY = 47, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 52, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 54, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 39, posX2 = 46,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 39, posX2 = 46,  posY = 62, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 53, posX2 = 60,  posY = 58, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 53, posX2 = 60,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 61, posX2 = 68,  posY = 49, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 61, posX2 = 68,  posY = 51, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 53,  posY = 31, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 53,  posY = 33, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 39, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 41, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 50,  posY = 51, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 50,  posY = 41, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 43, posX2 = 47,  posY = 46, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 51, posX2 = 55,  posY = 46, nCount = 3, nLiveTime = 1800,},

		},

		--第八波
		{
			{nMonsterID = 211, posX1 = 48, posX2 = 50,  posY = 46, nCount = 1, nLiveTime = 1800, exp = 35341375,},
			{nMonsterID = 212, posX1 = 27, posX2 = 30,  posY = 42, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 212, posX1 = 27, posX2 = 30,  posY = 44, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 212, posX1 = 48, posX2 = 51,  posY = 24, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 212, posX1 = 48, posX2 = 51,  posY = 26, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 212, posX1 = 72, posX2 = 75,  posY = 46, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 212, posX1 = 72, posX2 = 75,  posY = 48, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 212, posX1 = 52, posX2 = 55,  posY = 70, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 212, posX1 = 52, posX2 = 55,  posY = 68, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 212, posX1 = 47, posX2 = 50,  posY = 45, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 212, posX1 = 47, posX2 = 50,  posY = 47, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 52, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 54, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 39, posX2 = 46,  posY = 60, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 39, posX2 = 46,  posY = 62, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 53, posX2 = 60,  posY = 58, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 53, posX2 = 60,  posY = 60, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 61, posX2 = 68,  posY = 49, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 61, posX2 = 68,  posY = 51, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 53,  posY = 31, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 53,  posY = 33, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 39, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 41, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 50,  posY = 51, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 50,  posY = 41, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 43, posX2 = 47,  posY = 46, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 51, posX2 = 55,  posY = 46, nCount = 4, nLiveTime = 1800,},

		},

		--第九波
		{
			{nMonsterID = 213, posX1 = 48, posX2 = 50,  posY = 46, nCount = 1, nLiveTime = 1800, exp = 43398089,},
			{nMonsterID = 214, posX1 = 27, posX2 = 30,  posY = 42, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 214, posX1 = 27, posX2 = 30,  posY = 44, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 214, posX1 = 48, posX2 = 51,  posY = 24, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 214, posX1 = 48, posX2 = 51,  posY = 26, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 214, posX1 = 72, posX2 = 75,  posY = 46, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 214, posX1 = 72, posX2 = 75,  posY = 48, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 214, posX1 = 52, posX2 = 55,  posY = 70, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 214, posX1 = 52, posX2 = 55,  posY = 68, nCount = 2, nLiveTime = 1800,},
			{nMonsterID = 214, posX1 = 47, posX2 = 50,  posY = 45, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 214, posX1 = 47, posX2 = 50,  posY = 47, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 52, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 54, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 39, posX2 = 46,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 39, posX2 = 46,  posY = 62, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 53, posX2 = 60,  posY = 58, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 53, posX2 = 60,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 61, posX2 = 68,  posY = 49, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 61, posX2 = 68,  posY = 51, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 53,  posY = 31, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 53,  posY = 33, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 39, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 41, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 45, posX2 = 50,  posY = 51, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 45, posX2 = 50,  posY = 41, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 43, posX2 = 50,  posY = 46, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 48, posX2 = 55,  posY = 47, nCount = 4, nLiveTime = 1800,},

		},

		--第十波
		{
			{nMonsterID = 215, posX1 = 48, posX2 = 50,  posY = 46, nCount = 1, nLiveTime = 1800, exp = 57888985,},
			{nMonsterID = 216, posX1 = 27, posX2 = 30,  posY = 42, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 216, posX1 = 27, posX2 = 30,  posY = 44, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 216, posX1 = 48, posX2 = 51,  posY = 24, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 216, posX1 = 48, posX2 = 51,  posY = 26, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 216, posX1 = 70, posX2 = 75,  posY = 46, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 216, posX1 = 70, posX2 = 75,  posY = 48, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 216, posX1 = 52, posX2 = 55,  posY = 70, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 216, posX1 = 52, posX2 = 55,  posY = 68, nCount = 3, nLiveTime = 1800,},
			{nMonsterID = 216, posX1 = 45, posX2 = 50,  posY = 45, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 216, posX1 = 45, posX2 = 50,  posY = 47, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 52, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 54, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 39, posX2 = 46,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 39, posX2 = 46,  posY = 62, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 53, posX2 = 60,  posY = 58, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 53, posX2 = 60,  posY = 60, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 61, posX2 = 68,  posY = 49, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 61, posX2 = 68,  posY = 51, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 53,  posY = 31, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 46, posX2 = 53,  posY = 33, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 39, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 33, posX2 = 40,  posY = 41, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 45, posX2 = 50,  posY = 51, nCount = 4, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 45, posX2 = 50,  posY = 41, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 43, posX2 = 50,  posY = 46, nCount = 5, nLiveTime = 1800,},
			{nMonsterID = 208, posX1 = 48, posX2 = 55,  posY = 47, nCount = 4, nLiveTime = 1800,},

		},
	},

	--周排行榜第一名行会获得奖励
	GuildCoin = 500000,		--行会资金
	awards=
	{
		--荣誉
		{ type = 21, id = 0, count = 30000, strong = 0, quality = 0, bind = 1 },
	},
}
