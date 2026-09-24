--lua script

ActFireConfig = {
	FireSceneId = 8,		--小篝火所在的场景ID
	RadioVal = 1,			--npc的半径内的玩家
	GetExpInterval = 6,		--获取经验间隔，秒
	FireExpRate = 10,		--基础经验的比率，万分之几
	VipAddRate = 5000,			--vip的加成，万分之几
	TableIndex = 3,			--在基础表的第几张表

	--换模型
	ViewNpcRadio = 8,		--广播npc半径内的玩家
	BurnModelId = 4,		--燃烧着的火模型
	UnBurnModelId = 5,		--熄灭着的火模型
    LandscapeModelid=2,     --场景那个模型的id
	durTime =30*60*1000,        --场景特效的时间(30分钟)
	--这里是相对于篝火+经验的坐标点
	points=
	{
		{-2,-2},
		{0,-2},
		{2,-2},
		{-2,0},
		{2,0},
		{-2,2},
		{0,2},
		{2,2},
	},
	
	--活动期间支持的经验倍数
	fiveRateExp = 3,
	MinLevel = 40,		--提示该等级以上的


	--cointype表示货币类型 1金币，3元宝
	--value表示旺度，负数表示需要扣掉的旺度
	--木材
	WoodShop = {
		{id=2001,count = 1, cointype=1, coinval = 1000, value = 10},
		{id=2002,count = 1, cointype=1, coinval = 5000, value = 11},
		{id=2003,count = 1, cointype=1, coinval = 20000, value = 12},
		{id=2004,count = 1, cointype=1, coinval = 100000, value = 13},
		{id=2005,count = 1, cointype=3, coinval = 10, value = 14},
	},

	--value表示旺度，负数表示需要扣掉的旺度
	--水
	WaterShop = {
		{id=2006,count = 1, cointype=1, coinval = 180000, value = -10},
		{id=2007,count = 1, cointype=1, coinval = 360000, value = -11},
		{id=2008,count = 1, cointype=1, coinval = 600000, value = -12},
	},

	--酒
	WineShop = {
		{id=2013, count = 1, cointype=3, coinval = 3, value = 0},
	},

	--基础系数
	BaseRate = 1.5,
	MinFireVal = 50,	--最小旺度
	MaxFireVal = 200,	--最大旺度
	BuffId = 55,  --女儿红BUFF的ID
}