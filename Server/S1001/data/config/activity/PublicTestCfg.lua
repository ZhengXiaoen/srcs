--公测活动配置，公测活动过后“绝版称号活动”和“投资活动(按等级)”依然有效,(改为月度庆典)
PublicTestCfg =
{
	isOpen = true, -- 活动是否开启
	
	-- 定义在 PlatformDef.lua 的 GameIndexDef，注明是哪个游戏的月度活动, 0则所有游戏都开
	gameIndex = 2, -- 霸者之刃2
	
	--活动时间（开始-结束(包括结束当天)）
	time = {2016,4,1, 2016,4,9},
	
	-- 绝版称号活动 -----------------------------------------------
	TitleCfg = {
		consume = {type = 15, count = 88888}, --  消耗元宝
		titleId = 4, -- 称号ID：霸者天下
		validDay = 7, -- 有效时间：几天
		-- 奖励
		award = { 
			-- {type = 0, id = 847, count = 1, bind = 1},--4倍经验卷2小时
		    --       {type = 0, id = 540, count = 4, bind = 1},--历练卷轴*4=20元
			--   {type = 0, id = 530, count = 4, bind = 1},--盾灵卷轴*4=40元
			--   {type = 0, id = 562, count = 2, bind = 1},--高级圣魂丹*1-40元
			--   {type = 0, id = 509, count = 10, bind = 1},
		},--金条大*10=17元
		
		staitcAttrs =	--静态属性表，静态属性指头像原本具备的且不会改变的属性
		{
			--一个属性的配置示范，type为属性类型，value为属性值
			--属性配置方法同物品配置类似
			{ type = 12, value = 0.06 },--物理攻击倍数
			{ type = 16, value = 0.06 },--魔法攻击倍数
			{ type = 20, value = 0.06 },--道术攻击倍数
			{ type = 6, value = 0.08 },--HP倍数
	
		},
	},
	
	-- 投资活动(按天) -----------------------------------------------
	InvestmentByDayCfg = {
		buyTime = {2015,11,6, 2015,11,14}, -- 投资有效时间
		investmentCount = 8800, -- 投资元宝数--88元---5倍奖励
		-- 返回绑定元宝
		returnTable = {7500,6000,6000,6000,6000,6000,7500},---45000绑定元宝=22500元宝=225元
		costRecoveringIndex = 1, --收回成本索引,前端使用
	},
	
	-- 投资活动(按等级) -----------------------------------------------
	InvestmentByLevelCfg = {
		buyTime = {2015,11,6, 2015,11,20}, -- 投资有效时间
		investmentCount = 12800, -- 投资元宝数--128元--6倍奖励
		-- 返回绑定元宝 {达到转数,达到等级,返回绑定元宝}
		returnTable = {{0,60,8000},{0,70,9000},{0,75,10000},{0,80,11000},{1,80,12000},{2,80,13000},{3,80,14000}},
		costRecoveringIndex = 1, --收回成本索引,前端使用
	},	
		
	-- 团购活动 -----------------------------------------------
	GroupBuyCfg = {
		--现在只能配置 4 个
		{
			ybCount = 1000, -- 10元
			buyCount = 200, -- 团购人数
			award = { 
				--{type=0, id=677, count=1, bind=1},{type=0, id=676, count=1, bind=1}
				 }, -- 超级金币箱*1    超级经验丹*1
		},
		{
			ybCount = 5000, -- 50元
			buyCount = 100, -- 团购人数
			award = { 
				--{type=0, id=451, count=2, bind=1},{type=0, id=542, count=2, bind=1} 
				}, -- 佣兵经验卷*1   初级转生修为丹
		},
		{
			ybCount = 20000, -- 200元
			buyCount = 40, -- 团购人数
			award = { 
				--{type=0, id=451, count=4, bind=1},{type=0, id=543, count=2, bind=1}
				 }, -- 佣兵经验卷*4   中级转生修为丹*2
		},
		{
			ybCount = 50000, -- 500元
			buyCount = 15, -- 团购人数
			award = { 
				--{type=0, id=451, count=8, bind=1},{type=0, id=544, count=2, bind=1} 
				}, -- 佣兵经验卷*8   高级转生修为丹*2
		},
	},
	
	-- 元宝消费排行 -----------------------------------------------
	YbConsumeRanking = {
		minConsume = 25000,
		awardList = {
			-- 周年庆典、万服庆典共用消费榜并分别发奖；奖品与散人红利充值榜一致。
			{
				minConsume = 2000000,
				mailAward = "7039,5,1/6820,1,1/6364,1,1/5384,5,1",
				award = {
					{type = 0, id = 7039, count = 5, bind = 1},--至尊屠龙碎片
					{type = 0, id = 6820, count = 1, bind = 1},--龍装Ⅱ装备箱
					{type = 0, id = 6364, count = 1, bind = 1},--九转装备箱
					{type = 0, id = 5384, count = 5, bind = 1},--4阶宝石袋
				},
			},
			{
				minConsume = 1000000,
				mailAward = "7039,2,1/6887,1,1/6365,1,1/5384,4,1",
				award = {
					{type = 0, id = 7039, count = 2, bind = 1},--至尊屠龙碎片
					{type = 0, id = 6887, count = 1, bind = 1},--龍装Ⅰ装备箱
					{type = 0, id = 6365, count = 1, bind = 1},--七转装备箱
					{type = 0, id = 5384, count = 4, bind = 1},--4阶宝石袋
				},
			},
			{
				minConsume = 500000,
				mailAward = "7039,1,1/7650,1,1/7047,1,1/5384,3,1",
				award = {
					{type = 0, id = 7039, count = 1, bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650, count = 1, bind = 1},--龙腾首饰礼盒
					{type = 0, id = 7047, count = 1, bind = 1},--坐骑礼盒
					{type = 0, id = 5384, count = 3, bind = 1},--4阶宝石袋
				},
			},
			{
				minConsume = 250000,
				mailAward = "6675,1,1/6363,3,1/7051,1,1/5384,2,1",
				award = {
					{type = 0, id = 6675, count = 1, bind = 1},--女娲宝藏
					{type = 0, id = 6363, count = 3, bind = 1},--豪礼宝箱
					{type = 0, id = 7051, count = 1, bind = 1},--三国时装礼盒
					{type = 0, id = 5384, count = 2, bind = 1},--4阶宝石袋
				},
			},
		},
	},
	
	-------佣兵神装---------------------------------------------------------
	HeroSuperCloth = {
		-- {type=0, id=791, count=1, bind=1},
		-- {type=0, id=797, count=1, bind=1},
		-- {type=0, id=803, count=1, bind=1},
	},
	
	-------绝版足迹---------------------------------------------------------
	Footprint = {
		{type=0, id=703, count=1, bind=1},
	},
	
	-- 每日充值礼包
	PayGift = 
	{
		needMoney = 20000,  --需要充值元宝
		award = 
		{
			-- {type = 0, id = 652, count = 1, bind = 1},--疯狂苹果 X 1
			-- {type = 0, id = 700, count = 1, bind = 1},--20万灵力丹*1
			-- {type = 0, id = 696, count = 2, bind = 1},--翅膀魂石宝箱*2
			-- {type = 0, id = 846, count = 1, bind = 1},--4倍经验卷1小时*1
		}
	},
	-- 送红包留言选择
	RedPacketSays = 
	{
		"有钱就是任性!","哥有钱,拿去随便花!","有钱没地方花，分你点!","生日快乐，心想事成!","恭喜发财，万事如意!",
	},
	--璀璨烟花
	FireworkGift =
	{
		item_id = 915,--烟花礼包id
		buyNeedYb = 2000, --购买烟花礼包需要的元宝
		itemList = {
			-- 男
			{
				-- 概率范围(万分之几)
				--------------------------------
				{---1/100			
					rand = {0, 100},
					award = {
						--type = 0, id = 725,count = 1,bind = 1
						},--时装·东瀛武士
				},
				{			
					rand = {101, 200},
					award = {
						--type = 0, id = 727,count = 1,bind = 1
						},--时装·菊之诱惑
				},
				{			
					rand = {201, 300},
					award = {
						--type = 0, id = 729,count = 1,bind = 1
						},--时装·迷幻波斯
				},
				----1/100
				{			
					rand = {301, 400},
					award = {
						--type = 0, id = 717,count = 3,bind = 1
						},--神装石
				},
				{			
					rand = {401, 500},
					award = {
						--type = 0, id = 719,count = 3,bind = 1
						},--龙纹石
				},
				{			
					rand = {501, 600},
					award = {
						--type = 0, id = 724,count = 3,bind = 1
						},--陨铁
				},
				{			
					rand = {601, 700},
					award = {
						--type = 0, id = 722,count = 3,bind = 1
						},--金丝
				},
				----
				----
				{			
					rand = {701, 800},
					award = {
						--type = 0, id = 859,count = 1,bind = 1
						},--10000元宝
				},
				----
				{			
					rand = {801, 950},
					award = {},
				},
				{			
					rand = {951, 1100},
					award = {},
				},
				{			
					rand = {1101, 1250},
					award = {},
				},
				{			
					rand = {1251, 1400},
					award = {},
				},
				--------
				--------
				{			
					rand = {1401, 1700},
					award = {},
				},
				{			
					rand = {1701, 2000},
					award = {},
				},
				{			
					rand = {2001, 2300},
					award = {},
				},
				{			
					rand = {2301, 2600},
					award = {},
				},
				----
				{			
					rand = {2601, 3100},
					award = {},
				},
				{			
					rand = {3101, 3600},
					award = {},
				},
				{			
					rand = {3601, 4100},
					award = {},
				},
				{			
					rand = {4101, 4600},
					award = {},
				},
				----
				{			
					rand = {4601, 5200},
					award = {},
				},
				{			
					rand = {5201, 5800},
					award = {},
				},
				{			
					rand = {5801, 6400},
					award = {},
				},
				{			
					rand = {6401, 7000},
					award = {},
				},
				----
				{			
					rand = {7001, 7300},
					award = {},
				},
				{			
					rand = {7301, 7600},
					award = {},
				},
				{			
					rand = {7601, 7900},
					award = {},
				},
				----
				{			
					rand = {7901, 8500},
					award = {},
				},
				{			
					rand = {8501, 9500},
					award = {},
				},
				{			
					rand = {9501, 10000},
					award = {},
				},

							
			},
			-- 女
			{
				-- 概率范围(万分之几)
				{---1/100			
					rand = {0, 100},
					award = {},--时装·东瀛武士
				},
				{			
					rand = {101, 200},
					award = {},--时装·菊之诱惑
				},
				{			
					rand = {201, 300},
					award = {},--时装·迷幻波斯
				},
				----1/100
				{			
					rand = {301, 400},
					award = {},--神装石
				},
				{			
					rand = {401, 500},
					award = {},--龙纹石
				},
				{			
					rand = {501, 600},
					award = {},--陨铁
				},
				{			
					rand = {601, 700},
					award = {},--金丝
				},
				----
				----
				{			
					rand = {701, 800},
					award = {},--10000元宝
				},
				----
				{			
					rand = {801, 950},
					award = {},--神装石
				},
				{			
					rand = {951, 1100},
					award = {},--龙纹石
				},
				{			
					rand = {1101, 1250},
					award = {},--陨铁
				},
				{			
					rand = {1251, 1400},
					award = {},--金丝
				},
				--------
				--------
				{			
					rand = {1401, 1700},
					award = {},--神装石
				},
				{			
					rand = {1701, 2000},
					award = {},--龙纹石
				},
				{			
					rand = {2001, 2300},
					award = {},--陨铁
				},
				{			
					rand = {2301, 2600},
					award = {},--金丝
				},
				----
				{			
					rand = {2601, 3100},
					award = {},--神装石碎片
				},
				{			
					rand = {3101, 3600},
					award = {},--龙纹石碎片
				},
				{			
					rand = {3601, 4100},
					award = {},--金丝碎片
				},
				{			
					rand = {4101, 4600},
					award = {},--陨铁碎片
				},
				----
				{			
					rand = {4601, 5200},
					award = {},--神装石碎片
				},
				{			
					rand = {5201, 5800},
					award = {},--龙纹石碎片
				},
				{			
					rand = {5801, 6400},
					award = {},--金丝碎片
				},
				{			
					rand = {6401, 7000},
					award = {},--陨铁碎片
				},
				----
				{			
					rand = {7001, 7300},
					award = {},--翅膀魂石攻
				},
				{			
					rand = {7301, 7600},
					award = {},--翅膀魂石防
				},
				{			
					rand = {7601, 7900},
					award = {},--翅膀魂石血
				},
				----
				{			
					rand = {7901, 8500},
					award = {},--翅膀魂石攻
				},
				{			
					rand = {8501, 9500},
					award = {},--翅膀魂石防
				},
				{			
					rand = {9501, 10000},
					award = {},--翅膀魂石血
				},			
			},
		},
	},
}