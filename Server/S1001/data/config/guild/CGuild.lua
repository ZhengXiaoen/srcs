--这里定义帮派相关的配置信息，主要是各个帮派等级的限制条件，比如人数上限等，还包括一些全局的帮派设定，比如创建帮派需要的达到的角色等级、
--绑定银两（银两）等
GuildConfig = {
	--升级经验物品配置
	itemToExp = {
		{id = 683,count=1,score=2,exp=2,money=2}, --小纯金牛
		{id = 684,count=1,score=5,exp=5,money=5}, --中纯金牛
		{id = 685,count=1,score=10,exp=10,money=10}, --大纯金牛
	},

	
	--金币兑换升级经验
	goldToExp={
		exp=100,count=100000,score=100,guildMoney=100,
	},
	--贡献值兑换金币
	scoreToGold = {
		{score=10,money=90000}, --10点贡献兑换9万绑金
	},
	--捐赠行会基金送积分
	goldToFund={
		count=1000,score=10,
	},
	--升级镇帮之宝物品配置
	itemToSealExp = 
	{
		{id = 683,count=1,exp=2}, --小令牌
		{id = 684,count=1,exp=5}, --中令牌
		{id = 685,count=1,exp=10}, --大令牌
	},
	--镇帮之宝升级经验配置 一般类型有杀怪BUFF 双倍采集  双倍降妖除魔 双倍押镖  行会BOSS
	guildSealLevel = 
	{
		{
			sealLevel = 1,  --等级
			needExp = 0,  --需要的宝物经验
			needGuildLevel = 2, --需要行会等级
			buff = 
			{
				{type=0,value=30,count=0},  --杀怪经验
			},
		},
		{
			sealLevel = 2,  --等级
			needExp = 8000,  --需要的宝物经验
			needGuildLevel = 3, --需要行会的等级
			buff = 
			{
				{type=0,value=30,count=0},  --杀怪经验
				{type=1,value=2,count=3},   --采集倍数
			},
		},
		{
			sealLevel = 3,  --等级
			needExp = 20000,  --需要的宝物经验
			needGuildLevel = 4, --需要行会的等级
			buff = 
			{
				{type=0,value=30,count=0},  --杀怪经验
				{type=1,value=2,count=3},   --采集倍数
				{type=2,value=2,count=3},	--降妖倍数
			},
		},
		{
			sealLevel = 4,  --等级
			needExp = 50000,  --需要的宝物经验
			needGuildLevel = 5, --需要行会的等级
			buff = 
			{
				{type=0,value=30,count=0},  --杀怪经验
				{type=1,value=2,count=3},   --采集倍数
				{type=2,value=2,count=3},	--降妖倍数
				{type=3,value=2,count=3},	--押镖倍数
			},
		},
		{
			sealLevel = 5,  --等级
			needExp = 100000,  --需要的宝物经验
			needGuildLevel = 6, --需要行会的等级
			buff = 
			{
				{type=0,value=30,count=0},  --杀怪经验
				{type=1,value=2,count=3},   --采集倍数
				{type=2,value=2,count=3},	--降妖倍数
				{type=3,value=2,count=3},	--押镖倍数
				{type=4,value=0,count=0},  	--击杀行会boss
			},
		},
	},

	--以下是各个等级的配置
	--注意：如果达到一定的等级后，以后所有的配置都一样的话，可以只配置到这个等级，以后的等级配置按照这个配置
	--比如，如果帮派达到20级后，大于或等于20级的帮派都是按照20级的配置，那么这里配置文件就只需配置到20级，以后的级数不用再配置
	guildLevel = {
		{
			level = 1,		--帮派等级,这个值起始是1，每次递增1级
			maxFBZ = 5,		--副帮主数量的上限
			maxMember = 200,		--该等级帮派所有成员的人数上限		
			maxDepotBagCount = 70,	--该等级的帮派仓库最大数量
			needYb = 0,           --这个是升级到下一级需要的元宝
			needExp= 100000,            --该等级需要的经验		
		},

		{
			--帮派等级2的配置
			level = 2,
			maxFBZ = 5,
			maxMember = 180,
			maxDepotBagCount = 120,
			needYb = 0,
			needExp = 400000,  
		},

		{
			--帮派等级3的配置
			level = 3,
			maxFBZ = 5,
			maxMember = 160,
			maxDepotBagCount = 180,
			needYb = 300,
			needExp= 800000,
		},

		{
			--帮派等级4的配置
			level = 4,
			maxFBZ = 5,
			maxMember = 140,
			maxDepotBagCount = 250,
			needYb = 0,
			needExp= 1600000, 
		},

		{
			--帮派等级5的配置
			level = 5,
			maxFBZ = 5,
			maxMember = 130,
			maxDepotBagCount = 330,
			needYb = 0,
			needExp= 30000000, 
		},
		{
			--帮派等级6的配置
			level = 6,
			maxFBZ = 5,
			maxMember = 120,
			maxDepotBagCount = 400,
			needYb = 0,
			needExp= 80000000, 
		},
		{
			--帮派等级7的配置
			level = 7,
			maxFBZ = 5,
			maxMember = 110,
			maxDepotBagCount = 500,
			needYb = 0,
			needExp= 200000000, 
		},
		{
			--帮派等级8的配置
			level = 8,
			maxFBZ = 5,
			maxMember = 100,
			maxDepotBagCount = 600,
			needYb = 0,
			needExp= 500000000, 
		},
	},
	FirstSbkAwards =				--首次沙巴克占领着获取奖励
	{
		{type = 15, id = 1, count = 50000, quality = 0, strong = 0, bind = 1, param = 0},
	},
	--主殿等级对应的最大行会资金
	BuildLevelMaxCoin = {10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000,10000000},


	--首次守沙三次行会首领的奖励
	DefendSbkThreeAward = 
	{
		{type = 15, id = 1, count = 20000, quality = 0, strong = 0, bind = 1, param = 0},
	},
	GuildFlagBufs =
	{
		-- 行会1到4级
		{
			-- 王城地图
			{
				{type=9,value=3,},{type=11,value=14,},
			},
			-- 其他地图
			{
				{type=9,value=2,},{type=11,value=8,},
			},
		},

		-- 行会5到8级
		{
			-- 王城地图
			{
				{type=9,value=3,},{type=11,value=14,},
			},
			-- 其他地图
			{
				{type=9,value=2,},{type=11,value=8,},
			},
		},

		-- 行会9到12级
		{
			-- 王城地图
			{
				{type=9,value=3,},{type=11,value=14,},
			},
			-- 其他地图
			{
				{type=9,value=2,},{type=11,value=8,},
			},
		},

		-- 行会13到16级
		{
			-- 王城地图
			{
				{type=9,value=3,},{type=11,value=14,},
			},
			-- 其他地图
			{
				{type=9,value=2,},{type=11,value=8,},
			},
		},

		-- 行会17到20级
		{
			-- 王城地图
			{
				{type=9,value=3,},{type=11,value=14,},
			},
			-- 其他地图
			{
				{type=9,value=2,},{type=11,value=8,},
			},
		},
	},
}

