	--lua script

EntrustReward =
{
	BookQuestId = 8063,			--天书任务id
	BookQuestLevel = 53,		--最小等级
	AgainAccpetTimes = 10,		--每天额外可接的次数
	CoinTimes = 80,				--金币刷星最多次数
	Levels = {					--每个等级区域对应最高刷星等级
		--区域段的配置信息：最小等级，最大等级，能刷到最高级数，领取2倍奖励元宝数，领取3倍元宝数，刷星一次消耗金币,刷星一次消耗元宝
		{min=40,max=44,maxLevel=10, doubleAward = 12, thriceAward = 15, flushCoin = 100, flushYb=1, againAcceptBaseYb = 4, speedFinYb = 1},
		{min=45,max=49,maxLevel=10, doubleAward = 15, thriceAward = 20, flushCoin = 500, flushYb=2, againAcceptBaseYb = 5, speedFinYb = 2},
		{min=50,max=54,maxLevel=15, doubleAward = 18, thriceAward = 25, flushCoin = 5000, flushYb=3, againAcceptBaseYb = 6, speedFinYb = 3},
		{min=55,max=59,maxLevel=15, doubleAward = 20, thriceAward = 30, flushCoin = 10000, flushYb=3, againAcceptBaseYb = 7, speedFinYb = 4},
		{min=60,max=64,maxLevel=20, doubleAward = 25, thriceAward = 35, flushCoin = 20000, flushYb=4, againAcceptBaseYb = 8, speedFinYb = 5},
		{min=65,max=100,maxLevel=20, doubleAward = 30, thriceAward = 40, flushCoin = 30000, flushYb=5, againAcceptBaseYb = 9, speedFinYb = 6},
	},
	LevelRate = 0.04,    	--公式:(1+等级)*等级/2*系数+(100%-系数)
	YbFlushLevels = {
		--停留概率, 升1级概率,升2级概率,....
		{0,54,14,10,7,5,4,3,2,1},
		{0,60,14,9,6,4,3,2,1,1},
		{0,66,13,8,5,3,2,1,1,1},
		{10,60,13,7,4,2,1,1,1,1},
		{20,54,12,6,3,1,1,1,1,1},
		{28,48,12,5,2,1,1,1,1,1},
		{35,44,11,4,1,1,1,1,1,1},
		{40,40,11,3,1,1,1,1,1,1},
		{45,37,10,2,1,1,1,1,1,1},
		{49,34,9,2,1,1,1,1,1,1},
		{53,32,8,1,1,1,1,1,1,1},
		{57,30,7,1,1,1,1,1,1},
		{61,28,6,1,1,1,1,1},
		{65,26,5,1,1,1,1},
		{69,24,4,1,1,1},
		{73,22,3,1,1},
		{76,21,2,1},
		{79,20,1},
		{80,20},
		{80,20},
	},
	CoinFlushLevels = {
		--停留概率, 升1级概率,升2级概率,....
		{0,81,10,5,3,1},
		{10,75,9,4,2},
		{18,70,8,3,1},
		{25,65,7,2,1},
		{33,60,6,1},
		{38,56,5,1},
		{43,52,4,1},
		{48,48,3,1},
		{53,44,2,1},
		{59,40,1},
		{64,35,1},
		{69,30,1},
		{71,28,1},
		{73,26,1},
		{76,24},
		{78,22},
		{79,21},
		{80,20},
		{80,20},
		{80,20},
	},
	MinLvToSurpId = 9,				--至少这个等级才会出现惊喜
	SurpriseRate = 5000,				--万分数
	SurpriseItemId = {
		--最小星级，最大星级，{概率1，物品ID1,概率2，物品ID2,...}
		{min = 9, max = 10, itemRate = {20,1183,20,1182,20,1181,}},
		{min = 11, max = 12, itemRate = {20,1124,15,1183,15,1182,15,1181,}},
		{min = 13, max = 15, itemRate = {25,1124,10,1183,10,1182,10,1181,10,816}},
		{min = 16, max = 20, itemRate = {35,665,20,1124,5,1183,5,1182,5,1181,10,816}},
	},
}