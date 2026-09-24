--每日签到奖励表
EveryDayCheck = 
{
	-- 补签消耗
	supplementConsume = {type = 15, count = 10},
	
	-- 每月天数
	monthDays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	rewardList = {--要改数量，count和countOnce一起改
		{ reward = {type = 0, id = 507, count = 1, bind = 1, countOnce = 1}},---金条
		{ reward = {type = 0, id = 678, count = 40, bind = 1, countOnce = 40}},---副本传送卷
		{ reward = {type = 0, id = 537, count = 1, bind = 1, countOnce = 1}},---宝石结晶
		{ reward = {type = 0, id = 678, count = 40, bind = 1, countOnce = 40}},---副本传送卷
		{ reward = {type = 0, id = 463, count = 1, bind = 1, countOnce = 1}},---战将附体令

		{ reward = {type = 0, id = 535, count = 2, bind = 1, countOnce = 2}},---护符碎片(1000颗)
		{ reward = {type = 0, id = 507, count = 2, bind = 1, countOnce = 2}},---金条
		{ reward = {type = 0, id = 678, count = 40, bind = 1, countOnce = 40}},---副本传送卷
		{ reward = {type = 0, id = 569, count = 2, bind = 1, countOnce = 2}},---护盾碎片(1000颗)
		{ reward = {type = 0, id = 537, count = 1, bind = 1, countOnce = 50}},---宝石结晶

		{ reward = {type = 0, id = 459, count = 100, bind = 1, countOnce = 100}},---星纹强化石
		{ reward = {type = 0, id = 464, count = 50, bind = 1, countOnce = 50}},---1级羽毛
		{ reward = {type = 0, id = 551, count = 1, bind = 1, countOnce = 1}},---战将灵力丹
		{ reward = {type = 0, id = 507, count = 3, bind = 1, countOnce = 3}},---金条
        { reward = {type = 0, id = 560, count = 1, bind = 1, countOnce = 1}},---天山雪莲

		{ reward = {type = 0, id = 463, count = 3, bind = 1, countOnce = 3}},---战将附体令
		{ reward = {type = 0, id = 537, count = 1, bind = 1, countOnce = 1}},---宝石结晶
		{ reward = {type = 0, id = 678, count = 40, bind = 1, countOnce = 40}},---副本传送卷
		{ reward = {type = 0, id = 537, count = 1, bind = 1, countOnce = 1}},---宝石结晶
		{ reward = {type = 0, id = 507, count = 1, bind = 1, countOnce = 1}},---金条
		{ reward = {type = 0, id = 572, count = 1, bind = 1, countOnce = 1}},---圣珠结晶
		{ reward = {type = 0, id = 682, count = 1, bind = 1, countOnce = 1}},---复活丹
		{ reward = {type = 0, id = 507, count = 1, bind = 1, countOnce = 1}},---金条
		
		{ reward = {type = 0, id = 507, count = 2, bind = 1, countOnce = 2}},---金条
		{ reward = {type = 0, id = 464, count = 20, bind = 1, countOnce = 20}},---1级羽毛
		{ reward = {type = 0, id = 463, count = 1, bind = 1, countOnce = 1}},---战将附体令
		{ reward = {type = 0, id = 459, count = 20, bind = 1, countOnce = 20}},---星纹强化石
		{ reward = {type = 0, id = 510, count = 1, bind = 1, countOnce = 1}},---赎罪药水
		{ reward = {type = 0, id = 459, count = 100, bind = 1, countOnce = 100}},---星纹强化石
		{ reward = {type = 0, id = 464, count = 50, bind = 1, countOnce = 50}},---1级羽毛
		{ reward = {type = 0, id = 507, count = 1, bind = 1, countOnce = 1}},---金条


	},
	
	-- 签到累积天数的奖励
	AccumulatedDaysAward = 
	{
		--签到两天
		{
			days = 2,
			--普通奖励
			reward =--要改数量，count和countOnce一起改
			{
				{type = 0, id = 464, count = 100, quality = 0, strong = 0, bind = 1, countOnce = 100},--1级羽毛
				{type = 0, id = 511, count = 1, quality = 0, strong = 0, bind = 1, countOnce = 1},--经验丹(小)X2
				{type = 0, id = 507, count = 1, quality = 0, strong = 0, bind = 1, countOnce = 1},--金条
			},
		},
		--签到5天
		{
			days = 5,
			reward = --要改数量，count和countOnce一起改
			{
				{type = 0, id = 464, count = 200, quality = 0, strong = 0, bind = 1, countOnce = 200},--1级羽毛
				{type = 0, id = 511, count = 1, quality = 0, strong = 0, bind = 1 , countOnce = 1 },--经验丹(中)X2
				{type = 0, id = 507, count = 1,  quality = 0, strong = 0, bind = 1, countOnce = 1 },--金条
			},
		},
		--签到10天
		{
			days = 10,
			reward = --要改数量，count和countOnce一起改
			{
			    {type = 0, id = 459, count = 1000, quality = 0, strong = 0, bind = 1, countOnce = 1000},--星纹强化石
				{type = 0, id = 511, count = 1, quality = 0, strong = 0, bind = 1, countOnce = 1},--经验丹(大)X2
				{type = 0, id = 507, count = 1,  quality = 0, strong = 0, bind = 1, countOnce = 1},--金条
			},
		},
		--签到17天
		{
			days = 17,
			reward = --要改数量，count和countOnce一起改
			{
				{type = 0, id = 459, count = 1500, quality = 0, strong = 0, bind = 1, countOnce = 1500},--星纹强化石
				{type = 0, id = 511, count = 1, quality = 0, strong = 0, bind = 1, countOnce = 1},--经验丹(大)X4
				{type = 0, id = 507, count = 1,  quality = 0, strong = 0, bind = 1, countOnce = 1},--金条
			},
		},
		--签到26天
		{
			days = 26,
			reward = --要改数量，count和countOnce一起改
			{
				{type = 0, id = 459, count = 3000, quality = 0, strong = 0, bind = 1, countOnce = 3000},--星纹强化石
				{type = 0, id = 511, count = 1, quality = 0, strong = 0, bind = 1, countOnce = 1},--经验丹(大)X5
				{type = 0, id = 507, count = 1,  quality = 0, strong = 0, bind = 1, countOnce = 1},--金条
			},
		},
	}
}