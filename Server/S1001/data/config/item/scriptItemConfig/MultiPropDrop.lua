-- 春节活动
-- 活动类型

MultiPropDropItemConfig = 
{
	-- 领取喜庆爆竹
	--[FestiveFirecrackers] = 
	{
		item_id = 1552, -- 喜庆爆竹id
		attribute = { type = 0, id = 1552, count = 1, strong = 0, quality = 0, bind = 1 },
		itemCount = 1, 
		needDelete = true,
		needYuanBao = 0,			--使用需要身上的最低元宝数
		MinLevel = 50, -- 50级以后才能领取
		Circle = 0, -- 转数
		--needMinBagGrid = 1, -- 领取一个爆竹需要多少格子
		-- 活动时间
		ActivityTime = {startTime = {year=2013, month=1, day=28, hour=0,min=0,sec=0} -- 开始时间
				,endTime = {year=2013, month=2, day=28, hour=23,min=59,sec=59}}, -- 结束时间
				
		-- 使用items时间
		UseTime = {startTime = {year=2013, month=1, day=28, hour=0,min=0,sec=0} -- 开始时间
				,endTime = {year=2013, month=2, day=28, hour=23,min=59,sec=59}}, -- 结束时间
		-- 选项
		items =
		{
			-- 免费领取
			{
				needMinBagGrid = 1, -- 需要多少个格子
				needYuanBao = 0,	--使用需要扣取元宝数
				dropName = "data/config/item/scriptItemConfig/ProabilityDrops/probDrops318.lua",
			},
			-- 18元宝领取
			{
				needMinBagGrid =2 ,
				needYuanBao = 18,			
				dropName = "data/config/item/scriptItemConfig/ProabilityDrops/probDrops319.lua",
			},
			-- 88元宝领取
			{
				needMinBagGrid =4 ,
				needYuanBao = 88,			
				dropName = "data/config/item/scriptItemConfig/ProabilityDrops/probDrops320.lua",
			},
			-- 188元宝领取
			{
				needMinBagGrid =4 ,
				needYuanBao = 188,			
				dropName = "data/config/item/scriptItemConfig/ProabilityDrops/probDrops321.lua",
			},
		}
	},
	-- 领取财神礼包
	--[SpringFestivalGift] =
	{
		item_id = 1554,
		attribute = { type = 0, id = 1554, count = 1, strong = 0, quality = 0, bind = 1 },
		itemCount = 1,
		needDelete = true,
		MinLevel = 40, -- 50级以后才能领取
		Circle = 0, -- 转数
		--needMinBagGrid = 1, -- 领取一个爆竹需要多少格子
		-- 活动时间
		ActivityTime = {startTime = {year=2013, month=1, day=28, hour=0,min=0,sec=0} -- 开始时间
				,endTime = {year=2013, month=2, day=8, hour=23,min=59,sec=59}}, -- 结束时间
				
		-- 使用items时间
		UseTime = {}, -- 结束时间
		-- 选项
		items =
		{
			-- 免费领取
			{
				needMinBagGrid = 4, -- 需要多少个格子
				needYuanBao = 0,	--使用需要扣取元宝数
				dropName = "data/config/item/scriptItemConfig/ProabilityDrops/probDrops322.lua",
			},
			-- 88元宝领取
			{
				needMinBagGrid =4 ,
				needYuanBao = 88,			
				dropName = "data/config/item/scriptItemConfig/ProabilityDrops/probDrops323.lua",
			},
			-- 388元宝领取
			{
				needMinBagGrid =4 ,
				needYuanBao = 388,			
				dropName = "data/config/item/scriptItemConfig/ProabilityDrops/probDrops324.lua",
			},
			-- 888元宝领取
			{
				needMinBagGrid =5 ,
				needYuanBao = 888,			
				dropName = "data/config/item/scriptItemConfig/ProabilityDrops/probDrops325.lua",
			},
		}
	},	
}

-- 领取开门利是
	MoneyPacketConfig =
	{
		item_id = 1553,
		attribute = { type = 0, id = 1553, count = 1, strong = 0, quality = 0, bind = 1 },
		itemCount = 1,
		needDelete = true,
		MinLevel = 40, -- 50级以后才能领取
		Circle = 0, -- 转数
		--needMinBagGrid = 1, -- 领取一个爆竹需要多少格子
		-- 活动时间
		ActivityTime = {startTime = {year=2013, month=2, day=17, hour=0,min=0,sec=0} -- 开始时间
				,endTime = {year=2013, month=2, day=19, hour=23,min=59,sec=59}}, -- 结束时间
				
		-- 使用items时间
		UseTime = {startTime = {year=2013, month=1, day=30, hour=0,min=0,sec=0} -- 开始时间
				,endTime = {year=3013, month=2, day=28, hour=23,min=59,sec=59}}, -- 结束时间
		-- 选项
		items = nil; -- 这个是没有选项面板的
	}
	--]]
	-- 驱年兽
NianConfig = { 
		item_id = 1555,  -- 年兽角Id
		-- itemCount = 1,
		needDelete = true,
		MinLevel = 1, -- 50级以后才能领取
		--needMinBagGrid = 1, -- 领取一个爆竹需要多少格子
		BigFestiveFirecrackers = {item_id = 1557,Price = 3,skillId = 157; skillLevel = 2}; -- 购买大爆竹需要多少元宝 
		SmallFestiveFirecrackers = {item_id = 1558,Price = 10000,skillId = 157; skillLevel = 3}; -- 购买小爆竹需要多少金币 
		SupremeJinlongId = 1388; -- 至尊金龙Id
		-- 活动时间
		ActivityTime = {startTime = {year=2013, month=1, day=28, hour=0,min=0,sec=0} -- 开始时间
				,endTime = {year=2013, month=2, day=28, hour=23,min=59,sec=59}}, -- 结束时间
				
		-- 使用items时间
		UseTime = {startTime = {year=2013, month=1, day=28, hour=0,min=0,sec=0} -- 开始时间
				,endTime = {year=2013, month=2, day=28, hour=23,min=59,sec=59}}, -- 结束时间
		-- 选项
		items = 

		{	-- 年兽角数量    元宝数量       兑换到的物品id
			{NianCount = 8,YuanBao = 1, Coin = 0, awards = {
					-- 第一条奖励
					{ type = 0, id = 545, count = 1, strong = 0, quality = 0, bind = 1 },
					-- 第二条奖励
					-- 在这里添加
				}
			},
			{NianCount = 16,YuanBao = 0, Coin = 0, awards = {
					{ type = 0, id = 276, count = 1, strong = 0, quality = 0, bind = 1 },
				}
			},
			{NianCount = 888,YuanBao = 0, Coin = 0, awards = {
					{ type = 0, id = 1388, count = 1, strong = 0, quality = 0, bind = 1 },
				}
			},
			{NianCount = 88,YuanBao = 888, Coin = 0, awards = {
					{ type = 0, id = 1388, count = 1, strong = 0, quality = 0, bind = 1 },
				}
			},
		},
	nSceenId = 8,			--刷怪的场景id
	--刷怪
	monsters =
	{
		--每波怪物
		{
			--不同等级的配置
			{nMonsterID = 689, posX1 = 178, posX2 = 178,  posY = 199, nCount = 1, nLiveTime = 3600,},	--BOSS

			{nMonsterID = 690, posX1 = 166, posX2 = 194,  posY = 191, nCount = 7, nLiveTime = 3600,},	--小怪
			{nMonsterID = 691, posX1 = 166, posX2 = 194,  posY = 191, nCount = 2, nLiveTime = 3600,},	--小怪
			{nMonsterID = 690, posX1 = 166, posX2 = 194,  posY = 194, nCount = 7, nLiveTime = 3600,},	--小怪
			{nMonsterID = 691, posX1 = 182, posX2 = 183,  posY = 198, nCount = 2, nLiveTime = 3600,},	--小怪
			{nMonsterID = 690, posX1 = 166, posX2 = 194,  posY = 197, nCount = 7, nLiveTime = 3600,},	--小怪
			{nMonsterID = 691, posX1 = 186, posX2 = 188,  posY = 206, nCount = 2, nLiveTime = 3600,},	--小怪
			{nMonsterID = 690, posX1 = 168, posX2 = 194,  posY = 201, nCount = 8, nLiveTime = 3600,},	--小怪
			{nMonsterID = 690, posX1 = 166, posX2 = 194,  posY = 205, nCount = 8, nLiveTime = 3600,},	--小怪
			{nMonsterID = 690, posX1 = 166, posX2 = 194,  posY = 209, nCount = 8, nLiveTime = 3600,},	--小怪
			{nMonsterID = 690, posX1 = 166, posX2 = 194,  posY = 215, nCount = 9, nLiveTime = 3600,},	--小怪


		},
		-- 其他在后面添加
	},
	}
	--]]