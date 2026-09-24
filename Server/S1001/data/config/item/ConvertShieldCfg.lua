--兑换盾牌配置
ConvertShieldConfig = 
{
	--青龙之盾
	{
		id = 1,
		probability = 30,	--几率
		consume = 			--材料
		{
			{type = 0,id = 240,count = 1,strong = 7},
			{type = 0,id = 246,count = 1,strong = 7},
			{type = 0,id = 252,count = 1,strong = 7},
		},
		successRemove = nil,--成功后还要删除的上一阶的装备
		award = {type = 0,id = 479,count = 1},	--兑换奖励
		protect = {type = 15,id = 0,count = 0}	--100%成功消耗
	},
	
	--白虎之盾
	{
		id = 2,
		probability = 35,
		consume = 
		{
			{type = 0,id = 260,count = 1,strong = 7},
			{type = 0,id = 266,count = 1,strong = 7},
			{type = 0,id = 272,count = 1,strong = 7},
		},
		successRemove = {type = 0,id = 479,count = 1},
		award = {type = 0,id = 480,count = 1},
		protect = {type = 15,id = 0,count = 0}
	},
	
	--朱雀之盾
	{
		id = 3,
		probability = 40,
		consume = 
		{
			{type = 0,id = 279,count = 1,strong = 8},
			{type = 0,id = 285,count = 1,strong = 8},
			{type = 0,id = 291,count = 1,strong = 8},
		},
		successRemove = {type = 0,id = 480,count = 1},
		award = {type = 0,id = 481,count = 1},
		protect = {type = 15,id = 0,count = 0}
	},
	
	--玄武之盾
	{
		id = 4,
		probability = 45,
		consume = 
		{
			{type = 0,id = 292,count = 1,strong = 8},
			{type = 0,id = 298,count = 1,strong = 8},
			{type = 0,id = 304,count = 1,strong = 8},
		},
		successRemove = {type = 0,id = 481,count = 1},
		award = {type = 0,id = 482,count = 1},
		protect = {type = 15,id = 0,count = 0}
	},
	
	--混沌之盾
	{
		id = 5,
		probability = 50,
		consume = 
		{
			{type = 0,id = 311,count = 1,strong = 9},
			{type = 0,id = 317,count = 1,strong = 9},
			{type = 0,id = 323,count = 1,strong = 9},
		},
		successRemove = {type = 0,id = 482,count = 1},
		award = {type = 0,id = 483,count = 1},
		protect = {type = 15,id = 0,count = 0}
	},
	
	--神罚之盾
	{
		id = 6,
		probability = 53,
		consume = 
		{
			{type = 0,id = 14,count = 1,strong = 9},
			{type = 0,id = 15,count = 1,strong = 9},
			{type = 0,id = 16,count = 1,strong = 9},
		},
		successRemove = {type = 0,id = 483,count = 1},
		award = {type = 0,id = 484,count = 1},
		protect = {type = 15,id = 0,count = 29800}
	},
	
	--天刹之盾
	{
		id = 7,
		probability = 56,
		consume = 
		{
			{type = 0,id = 17,count = 1,strong = 10},
			{type = 0,id = 18,count = 1,strong = 10},
			{type = 0,id = 19,count = 1,strong = 10},
		},
		successRemove = {type = 0,id = 484,count = 1},
		award = {type = 0,id = 485,count = 1},
		protect = {type = 15,id = 0,count = 59600}
	},
	
	--飞瀑之盾
	{
		id = 8,
		probability = 59,
		consume = 
		{
			{type = 0,id = 20,count = 1,strong = 10},
			{type = 0,id = 21,count = 1,strong = 10},
			{type = 0,id = 22,count = 1,strong = 10},
		},
		successRemove = {type = 0,id = 485,count = 1},
		award = {type = 0,id = 486,count = 1},
		protect = {type = 15,id = 0,count = 107280}
	},
	
	--裂天之盾
	{
		id = 9,
		probability = 62,
		consume = 
		{
			{type = 0,id = 23,count = 1,strong = 10},
			{type = 0,id = 24,count = 1,strong = 10},
			{type = 0,id = 25,count = 1,strong = 10},
		},
		successRemove = {type = 486,id = 0,count = 1},
		award = {type = 0,id = 487,count = 1},
		protect = {type = 15,id = 0,count = 171000}
	},
	
	--宙斯之盾
	{
		id = 10,
		probability = 65,
		consume = 
		{
			{type = 0,id = 26,count = 1,strong = 10},
			{type = 0,id = 27,count = 1,strong = 10},
			{type = 0,id = 28,count = 1,strong = 10},
		},
		successRemove = {type = 0,id = 487,count = 1},
		award = {type = 0,id = 488,count = 1},
		protect = {type = 15,id = 0,count = 240300}
	},
}