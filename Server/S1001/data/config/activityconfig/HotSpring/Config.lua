
--太虚灵泉配置
HotSpringConfig = 
{
	limitLevel = 30,	--限制等级
	
	actArea = {sid = 84, x = 271, y = 316},	--活动区域
	returnArea = {sid = 8, x = 152, y = 182},	--返回区域
	
	timeAward = 
	{
		interval = 15,	--加经验间隔(秒)
		kissAdd = 0.5,	--亲吻加成倍率
		nomal =			--普通时段
		{
			{type = 20, id = 3, count = 4, quality = 0, param = 2},
		},
		spcial = 		--加成时段
		{
			{type = 20, id = 3, count = 8, quality = 0, param = 2},
		},
	},
	
	Grils = {
		{id = 462, x = 43, y = 67, modelId = 5,liveTime =1200},
		{id = 462, x = 71, y = 72, modelId = 5,liveTime =1200},
		{id = 462, x = 82, y = 67, modelId = 5,liveTime =1200},
		{id = 462, x = 36, y = 61, modelId = 5,liveTime =1200},
		{id = 462, x = 77, y = 55, modelId = 5,liveTime =1200},
		{id = 462, x = 58, y = 56, modelId = 5,liveTime =1200},
		{id = 462, x = 47, y = 49, modelId = 5,liveTime =1200},
	},
	
	buyTimes = 
	{
		{
			type = 15,	--消耗类型
			consume = 
			{
				{1, 10},      --{购买小时，售价},
				{3, 25},
				{5, 45},
				{8, 60},
			}
		},
		{	
			type = 7,	--消耗类型
			consume = 
			{
				{1, 10},      --{购买小时，售价},
				{3, 25},
				{5, 45},
				{8, 60},
			}
		},
	},
	
	
	
	
	--每个单位1小时，作用次数为2次，用钱购买时间就相当于购买作用次数，interval是单位时间，不用变。
	buffId = 65,	--免费泡澡BUFF
}

