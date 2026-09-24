--城主雕像膜拜的配置
WorshipSbkConfig = 
{
	minLevel = 40,						--膜拜的最低等级
	openDays = 4,						--开服第四天开始才能膜拜

	maxMoTimes = 20,					--可以膜拜的最大次数
	maxAddTimes = 20,					--可增加的最大膜拜次数
	freeFreshTimes = 10,				--今日免费刷新的次数

	addMobaiNeedYb = 3,					--增加膜拜次数需要的元宝

	freshNeedLj = 3,					--刷新一次需要的绑定元宝
	freshNeedYb = 3,					--刷新一次需要的元宝
	
	doubleHour = 12,					--双倍时间小时
	doubleTime = {10,30},				--双倍时间 12：10-12：30
	
	baseExp = { type = 20, id = 1, count = 30, strong = 0, quality = 0, bind = 1 },		--基础的奖励经验
	
	moreAward =				--惊喜奖励
	{
		{ type = 0, id = 830, count = 1, strong = 0, quality = 0, bind = 1 },
	},
	
	--刷惊喜的概率
	moreRate = {5},

	--奖励的不同档次	
	AwardLev = {1,2,3,5,10},

	--奖励的档次的概率
	nRate =
	{
		{20,70,85,95,100},		--档次为1的时候
		{0,35,75,90,100},
		{0,0,55,85,100},
		{0,0,0,70,100},
	},
}
