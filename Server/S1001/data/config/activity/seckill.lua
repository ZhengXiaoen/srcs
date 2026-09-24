
--秒活动
--如果要去掉活动项  需把level配置为 0 
--且客户端配置去掉其配置ID seckillId = 0
--下次如果有新活动 直接可以替换上 将等级配置到需要的等级
--ID一旦配置上 请不要注释掉
SecKill =
{
	--智力答题
	{
		id = 1,			--ID
		level = 20,		--活动限定等级
		consume = { itemId = 817, count = 2, yb = 5 },	--itemId:道具消耗ID, count:道具消耗数量, yb:每个道具元宝数
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 600 },
		},
	},

	--行会战
	{
		id = 2,			--ID
		level = 0,		--活动限定等级
		consume = { itemId = 817, count = 0, yb = 0 },
		awards = 	--单次奖励
		{
			{ type = 7, id = 0, count = 0 },
		},
	}, 
	--勇士角斗场
	{
		id = 3,			--ID
		level = 20,		--活动限定等级
		consume = {itemId = 817, count = 4, yb = 5},
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 1200 },
		},
	},
	
	--热血赛马
	{
		id = 4,			--ID
		level = 40,		--活动限定等级
		consume = {itemId = 817, count = 4, yb = 5},
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 1200 },
		},
	},
	
	--战神争霸
	{
		id = 5,			--ID
		level = 30,		--活动限定等级
		consume = { itemId = 817, count = 5, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 21, id = 0, count = 6000 },
		},
	},

	--魔幻星空
	{
		id = 6,			--ID
		level = 50,		--活动限定等级
		consume = { itemId = 817, count = 7, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 2100 },
		},
	},

	--部落战场
	{
		id = 7,			--ID
		level = 0,		--活动限定等级
		consume = { itemId = 817, count = 0, yb = 0 },
		awards = 	--单次奖励
		{
			{ type = 7, id = 0, count = 0 },
		},
	},

	
	--战队竞技
	{
		id = 8,			--ID
		level = 60,		--活动限定等级
		consume = { itemId = 817, count = 0, yb = 0 },
		awards = 	--单次奖励
		{
			{ type = 7, id = 0, count = 0 },
		},
	},
	
	--抢夺玫瑰
	{
		id = 9,			--ID
		level = 99,		--活动限定等级
		consume = { itemId = 817, count = 6, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 0, id = 355, count = 3 },
		},
	},
	
	--金币答题
	{
		id = 10,			--ID
		level = 40,		--活动限定等级
		consume = { itemId = 817, count = 1, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 300 },
		},
	},
	
	--行会运镖
	{
		id = 11,			--ID
		level = 35,		--活动限定等级
		consume = { itemId = 817, count = 0, yb = 0 },
		awards = 	--单次奖励
		{
			{ type = 7, id = 0, count = 0 },
		},
	},
	
	--太虚灵泉
	{
		id = 12,			--ID
		level = 30,		--活动限定等级
		consume = { itemId = 817, count = 2, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 600 },
		},
	},
	--护送美女
	{
		id = 13,			--ID
		level = 35,		--活动限定等级
		consume = { itemId = 817, count = 2, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 600 },
		},
	},
	
	--安全挂机
	{
		id = 14,			--ID
		level = 40,		--活动限定等级
		consume = { itemId = 817, count = 2, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 600 },
		},
	},
	
	--玫瑰种植
	{
		id = 15,			--ID
		level = 99,		--活动限定等级
		consume = { itemId = 817, count = 2, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 0, id = 354, count = 12 },
		},
	},

	--龙影坛
	{
		id = 16,			--ID
		level = 0,		--活动限定等级
		consume = { itemId = 817, count = 0, yb = 0 },
		awards = 	--单次奖励
		{
			{ type = 7, id = 0, count = 0 },
		},
	},

	
	--妖月峡谷
	{
		id = 17,			--ID
		level = 30,		--活动限定等级
		consume = { itemId = 817, count = 1, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 300 },
		},
	},
	
	--万年古墓
	{
		id = 18,			--ID
		level = 40,		--活动限定等级
		consume = { itemId = 817, count = 2, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 600 },
		},
	},
	
	--赤月天魔
	{
		id = 19,			--ID
		level = 40,		--活动限定等级
		consume = { itemId = 817, count = 3, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 900 },
		},
	},
	
	--宝矿洞窟
	{
		id = 20,			--ID
		level = 42,		--活动限定等级
		consume = { itemId = 817, count = 2, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 600 },
		},
	},
	
	--天地宝窟
	{
		id = 21,			--ID
		level = 45,		--活动限定等级
		consume = { itemId = 817, count = 1, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 300 },
		},
	},
	--魔龙神殿
	{
		id = 22,			--ID
		level = 50,		--活动限定等级
		consume = { itemId = 817, count = 5, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 1500 },
		},
	},
	
	--水域龙都
	{
		id = 23,			--ID
		level = 50,		--活动限定等级
		consume = { itemId = 817, count = 3, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 900 },
		},
	},
	--神灯传奇
	{
		id = 24,			--ID
		level = 50,		--活动限定等级
		consume = { itemId = 817, count = 3, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 900 },
		},
	},
	
	--转生炼狱
	{
		id = 25,			--ID
		level = 60,		--活动限定等级
		consume = { itemId = 817, count = 9, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 1500 },
			{ type = 22, id = 0, count = 50 },
		},
	},
	
	--魔剑封印
	{
		id = 26,			--ID
		level = 60,		--活动限定等级
		consume = { itemId = 817, count = 4, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 1200 },
		},
	},
	
	--地狱结界
	{
		id = 27,			--ID
		level = 65,		--活动限定等级
		consume = { itemId = 817, count = 8, yb = 5 },
		awards = 	--单次奖励
		{
			{ type = 20, id = 2, count = 2400 },
		},
	},
	
}