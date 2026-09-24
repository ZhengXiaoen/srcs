--lua script
--喷泉配置
FountainConfig = {
	SceneId = 63,		--所在的场景ID
	RadioVal = 1,			--npc的半径内的玩家
	GetWaterInterval = 10,		--获取水间隔，秒
	durTime = 30*60*1000,	--场景特效有效时间
	nItemId = 974,			--装水物品ID
	nExchangeItemId = 527,  --泉水罐兑换的物品ID
	nMinEnterLevel = 60,	--最小进入等级
	saluteMusic = 33,		--装水音效

	BossId = 154,
	BossTimeInterval = 18000, --5分钟
	BossPos = {{73,52}},

	--这里是相对于泉眼可以装水的坐标点
	points=
	{
		{-3,-3},
		{0,-3},
		{3,-3},
		{-3,0},
		{3,0},
		{-3,3},
		{0,3},
		{3,3},
		{0,6},
		{0,-6},
		{-6,0},
		{6,0},
	},

	pointsCenter = {
		{90,36},
		{56,70},
	},

	MinLevel = 60,		--提示该等级以上的
}