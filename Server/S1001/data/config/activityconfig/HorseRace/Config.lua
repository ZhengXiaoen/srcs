
--热血赛马配置
HorseRaceConfig = 
{
	limitLevel = 40,
	actTime = 1800,
	readyTime = 180,
	countDown = 30,
	actScene = {115, 117},	--活动场景ID，按开始到终点的顺序
	skill =
	{
		{id = 96, level = 1},
		{id = 97, level = 1},
		{id = 98, level = 1},
	},
	barrier = {sid = 115, mid = 389, pos = {{64,75}, {63,74}, {62,73}, {61,72},{61,71},{60,72},{59,73}, {60,71}, {59,70}, {58,71}, {59,72}, {60,73}, {61,74}, {72,75}, {62,76}, {63,77}, {64,76}, {63,75}, {62,74}, {61,73}, {60,70}, {59,71}}},		--栏栅
	readyScene =  {sid = 115, range = {67,65,3,3},},	--sid层场景ID  range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h} 
	returnScene = {sid = 2, range = {218,236,3,3}},	--sid层场景ID  range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h} 
	
	--第一名领奖刷BOSS
	winBoss = 
	{
		mid = 631,			--怪物ID
		liveTime = 1800,	--生存期
		range = {x1=69, y1=49, x2 = 75, y2 = 65},	--刷怪范围 两个坐标组成的矩形
	},
	
	rankAward =		--排行榜奖励 配置floorAward = {} 或去掉则不会奖励
	{
		{
			rankInterval = {1,1},		--排名区间
			--奖励
			awards=
			{
				{type = 20, id = 2, count = 3000,quality = 0, strong = 0, bind = 0},  --经验奖励
				{type = 21, id = 0, count = 15000,quality = 0, strong = 0, bind = 0},  --荣誉奖励
				{type = 0, id = 824, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
			},
		},
		{
			rankInterval = {2,2},		--排名区间
			--奖励
			awards=
			{
				{type = 20, id = 2, count = 2700,quality = 0, strong = 0, bind = 0},  --经验奖励
				{type = 21, id = 0, count = 12750,quality = 0, strong = 0, bind = 0},  --荣誉奖励
				{type = 0, id = 825, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
			},
		},
		{
			rankInterval = {3,3},		--排名区间
			--奖励
			awards=
			{
				{type = 20, id = 2, count = 2400,quality = 0, strong = 0, bind = 0},  --经验奖励
				{type = 21, id = 0, count = 10838,quality = 0, strong = 0, bind = 0},  --荣誉奖励
				{type = 0, id = 826, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
			},
		},
		{
			rankInterval = {4,10},		--排名区间
			--奖励
			awards=
			{
				{type = 20, id = 2, count = 2200,quality = 0, strong = 0, bind = 0},  --经验奖励
				{type = 21, id = 0, count = 9212,quality = 0, strong = 0, bind = 0},  --荣誉奖励
				{type = 0, id = 827, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
			},
		},
		{
			rankInterval = {11,20},		--排名区间
			--奖励
			awards=
			{
				{type = 20, id = 2, count = 2000,quality = 0, strong = 0, bind = 0},  --经验奖励
				{type = 21, id = 0, count = 7830,quality = 0, strong = 0, bind = 0},  --荣誉奖励
				{type = 0, id = 827, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物			
			},
		},
		{
			rankInterval = {21,50},		--排名区间
			--奖励
			awards=
			{
				{type = 20, id = 2, count = 1800,quality = 0, strong = 0, bind = 0},  --经验奖励
				{type = 21, id = 0, count = 6656,quality = 0, strong = 0, bind = 0},  --荣誉奖励
			},
		},
		{
			rankInterval = {51,10000},		--排名区间
			--奖励
			awards=
			{
				{type = 20, id = 2, count = 1600,quality = 0, strong = 0, bind = 0},  --经验奖励
			},
		},
	},
	
	
	
	--[[
	--这里配置随机出现的buff,可以配置任意个，最终脚本会在这里的buff随机选，再放到随机的陷阱区域中,每个陷阱区域一个buff
	--这里配置的是字符串，多个整数，用逗号隔开,分别表示：[buff类型][buff的groupid][周期（秒][次数][buff值] ,注意：groupid最后分配个特殊的，这里都用同一样的吧，免得和其他buff重复，次数最好设置有限的（0表示不限制)
	randomBuff = {
		"1,15,86,1,10,-50",					--这是加速buff，groupid是21（随便写的示范），每1秒加一次，每次加100，作用5次,最前面数字固定是1，表示这个区域只加1个buff，详细见 data\envir\区域属性定义说明.txt 中aaAddBuff的说明
		"1,52,86,1,5,0",						--禁止移动的buff，作用5次，禁止5秒
		"1,15,86,1,10,50",					--减慢移动速度buff，减速到750，持续10秒
		"1,53,86,1,5,0",						--眩晕的buff，作用5次，禁止5秒
		"1,15,86,1,10,-100",				--这是加速buff，加速到600，持续10秒
		"1,15,86,1,10,100",					--这是减速buff，减速到800，持续10秒
		"1,74,86,1,10,20",					--这是增加轻功（原名跳跃体力）buff，增加20，持续10秒
		"1,74,86,1,10,30",					--这是增加轻功（原名跳跃体力）buff，增加30，持续10秒
		"1,74,86,1,10,-10",					--这是减少轻功（原名跳跃体力）buff，减少10，持续10秒
		"1,74,86,1,10,-20",					--这是减少轻功（原名跳跃体力）buff，减少20，持续10秒
		"1,11,86,1,10,-50",					--这是减少HPbuff，减少50，持续10秒
		"1,11,86,1,10,50",					--这是减少HPbuff，恢复50，持续10秒
	},
	--场景区域相关的配置，这些区域都是用于设置陷阱的，每次活动会动态改变
	trapArea = {
		{sid = 40, startArea = 3, endArea = 10, maxTrap = 0, },		--这里表示场景1（飞仙峡）的第一到20区域是特殊区域，最大陷阱数是10（只是最大值，实际可能是10以下任何数字，但不会超过10个），则：活动开始时，会随机在这20个区域选6个作为陷阱，并在上面的buff中随机选6个放到这6个陷阱中.当然由于是随机的，不同的陷阱有可能出现相同的buff，注意：第一个区域通常是保留作为全场景的通用属性
	},
	--]]
	
}