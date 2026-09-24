SbkAward = 
{
	guildAward = 
	{
		--第一次攻城奖励
		firstAward = 
		{
			{{type = 15, id = 0, count = 10000},},--帮主
			{{type = 6, id = 0, count = 0},},--副帮主
			{{type = 6, id = 0, count = 0},},--堂主
			{{type = 6,id = 0  , count = 0},},--胜利方会员
			{{type = 2,id = 0  , count = 0},{type = 5, id = 0, count = 0},},--失败全民
		},
		--第4-7天攻城奖励5000元宝
        fourtoSevenAward =
        {
            {{type = 15, id = 0, count = 5000},},--帮主
			{{type = 6, id = 0, count = 0},},--副帮主
			{{type = 6, id = 0, count = 0},},--堂主
			{{type = 6,id = 0  , count = 0},},--胜利方会员
			{{type = 2,id = 0  , count = 0},{type = 5, id = 0, count = 0},},--失败全民
        },
		--第七天之后攻城奖励
		normalAward = 
		{
			{{type = 15, id = 0, count = 2000},},--帮主
			{{type = 6, id = 0, count = 0},},
			{{type = 6, id = 0, count = 0},},
			{{type = 6,id = 0  , count = 0},{type = 5, id = 0, count = 0},},--胜利全民
			{{type = 2,id = 0  , count = 0},{type = 5, id = 0, count = 0},},--失败全民
		},
        
        --合服第三天攻城奖励
        combineOneDay = 
		{
			{{type = 15, id = 0, count = 10000},},--帮主
			{{type = 6, id = 0, count = 0},},--副帮主
			{{type = 6, id = 0, count = 0},},--堂主
			{{type = 6,id = 0  , count = 0},},--胜利方会员
			{{type = 2,id = 0  , count = 0},{type = 5, id = 0, count = 0},},--失败全民
		},
        --合服第四天攻城奖励
        combineTwoDay = 
		{
			{{type = 15, id = 0, count = 20000},},--帮主
			{{type = 6, id = 0, count = 0},},--副帮主
			{{type = 6, id = 0, count = 0},},--堂主
			{{type = 6,id = 0  , count = 0},},--胜利方会员
			{{type = 2,id = 0  , count = 0},{type = 5, id = 0, count = 0},},--失败全民
		},
        --合服第四天攻城奖励
        combineThreeDay = 
		{
			{{type = 15, id = 0, count = 30000},},--帮主
			{{type = 6, id = 0, count = 0},},--副帮主
			{{type = 6, id = 0, count = 0},},--堂主
			{{type = 6,id = 0  , count = 0},},--胜利方会员
			{{type = 2,id = 0  , count = 0},{type = 5, id = 0, count = 0},},--失败全民
		},
	},
	
	LeaderPrivilege = 
	{
		--城主专属武器
		sbkWeapon = 
		{
			id = 1,
			award = 
			{
				{type = 0, id = 834, count = 1}
			}
		},
		--城主专属称号
		sbkTitle = 
		{
			id = 2,
			Titleid = 30,
		},
		--城主专属商城
		sbkStore = 
		{
			id = 3,
			store = 
			{
				{typeId = 1,itemId = 561,bind=1,price = {type = 3,price = 48}}, --仙品雪莲(大)--采用元宝
				{typeId = 2,itemId = 678,bind=1,price = {type = 3,price = 70}},--副本传送卷--元宝
				{typeId = 3,itemId = 838,bind=1,price = {type = 3,price = 120}},--圣境传送卷--元宝
				{typeId = 4,itemId = 549,bind=1,price = {type = 3,price = 45}},--攻击药水
				{typeId = 5,itemId = 550,bind=1,price = {type = 3,price = 45}},--魔法药水
                {typeId = 6,itemId = 551,bind=1,price = {type = 3,price = 45}},--道术药水
				{typeId = 7,itemId = 504,bind=1,price = {type = 3,price = 28}},--2倍经验2小时
			},
		},
	}
}