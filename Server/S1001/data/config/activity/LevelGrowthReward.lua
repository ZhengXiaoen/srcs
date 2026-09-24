--等级成长礼包配置
--type等于0时,Require代表人物等级  等于1时：Require代表人物转生等级

LevelGrowthReward = 
{

	--20级礼包奖励 神将
	{
		type = 0,
		id = 1,
		MaxActorNum = -1,	--领取礼包最大人数	
		Require = 20,			--所需等级
		
		--礼包物品的ID
		reward = {			
					{type = 0, id = 16, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--52级战士手镯
					{type = 0, id = 17, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--52级法师手镯
					{type = 0, id = 18, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--52级道士手镯
					{type = 0, id = 19, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--100绑定元宝
					{type = 0, id = 20, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--金条(小)
					{type = 0, id = 21, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(小)
					{type = 5, id = 0, count = 50000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
					{type = 0, id = 4735, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--金币箱子(小)


				}, 
		
		name = "20级礼包",
		desc = "20级对应职业装备",
		openWindId = 118,
		openWinIdParam =0,
		guide = {
			{
				desc = "打开升级面板",
				dir = 0,
				uiHelpId = 213,
				offsetX = 75, --偏移横坐标
				offsetY = -20, --偏移纵坐标				
			},
			{
				desc = "点击升级",
				dir = 0,
				uiHelpId = 214,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击关闭",
				dir = 0,
				uiHelpId = 211,
				offsetX = 0, --偏移横坐标
				offsetY = -20, --偏移纵坐标
			},
		},				  
	},

	--30级礼包奖励 护符
	{
		type = 0,
		id = 2,	
		MaxActorNum = -1,	--领取礼包最大人数	
		Require = 32,
		--礼包物品的ID
		reward = {			
					{type = 0, id = 25, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--63级战士戒指
					{type = 0, id = 26, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--63级法师戒指
					{type = 0, id = 27, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--63级道士戒指
					{type = 0, id = 28, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--100绑定元宝
					{type = 0, id = 29, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--金条(小)
					{type = 0, id = 30, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(小)
					{type = 46, id = 0, count = 10000, quality = 0, strong = 0, bind = 1,job = 0},--护符
					{type = 0, id = 617, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--特戒(小)

				}, 
		name = "32级礼包",
		desc = "32级对应职业装备",
		openWindId = 129,
		openWinIdParam =0,
		guide = {
			{
				desc = "点击升级",
				dir = 0,
				uiHelpId = 215,
				offsetX = 72, --偏移横坐标
				offsetY = -18, --偏移纵坐标
			},
			{
				desc = "点击关闭",
				dir = 2,
				uiHelpId = 183,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
		},	
	},
		
	--40级礼包奖励 翅膀
	{
		type = 0,
		id = 3,	
		--MaxActorNum = -1,
		MaxActorNum = -1,	--领取礼包最大人数	
		Require = 42,
		--礼包物品的ID
		reward = {			
					{type = 0, id = 34, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--70级战士头盔
					{type = 0, id = 35, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--70级法师头盔
					{type = 0, id = 36, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--70级道士头盔
					{type = 0, id = 37, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--100绑定元宝
					{type = 0, id = 38, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--金条(中)
					{type = 0, id = 39, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(小)
					{type = 0, id = 605, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--羽毛(小)
					--{type = 0, id = 464, count = 5, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(小)

				}, 
		name = "42级礼包",
		desc = "42级对应职业装备",
		openWindId = 0,
		openWinIdParam =0,
		guide = {
			-- {
			-- 	desc = "打开升级面板",
			-- 	dir = 0,
			-- 	uiHelpId = 216,
			-- 	offsetX = 75, --偏移横坐标
			-- 	offsetY = -20, --偏移纵坐标				
			-- },
			-- {
			-- 	desc = "点击升级",
			-- 	dir = 0,
			-- 	uiHelpId = 217,
			-- 	offsetX = 0, --偏移横坐标
			-- 	offsetY = -5, --偏移纵坐标
			-- },
			-- {
			-- 	desc = "点击关闭",
			-- 	dir = 2,
			-- 	uiHelpId = 173,
			-- 	offsetX = 0, --偏移横坐标
			-- 	offsetY = -5, --偏移纵坐标
			-- },
		},	
	},

	--57级礼包奖励  锻造
	{
		type = 0,
		id = 4,	
		--MaxActorNum = -1,
		MaxActorNum = -1,	--领取礼包最大人数	
		Require = 53,
		--礼包物品的ID
		reward = {			
					{type = 0, id = 43, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--73级战士项链
					{type = 0, id = 44, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--73级法师项链
					{type = 0, id = 45, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--73级道士项链
					{type = 0, id = 46, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--500绑定元宝
					{type = 0, id = 47, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--金条(中)
					{type = 0, id = 48, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(中)
					{type = 0, id = 459, count = 30, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(中)

				}, 
		name = "53级礼包",
		desc = "53级对应职业首饰一件",
		openWindId = 5,
		openWinIdParam =0,
		guide = {
			-- {
			-- 	desc = "打开升级面板",
			-- 	dir = 0,
			-- 	uiHelpId = 218,
			-- 	offsetX = 7, --偏移横坐标
			-- 	offsetY = -20, --偏移纵坐标				
			-- },
			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击关闭",
				dir = 2,
				uiHelpId = 219,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
		},	
	},

	{
		type = 0,
		id = 5,	
		--MaxActorNum = -1,
		MaxActorNum = -1,	--领取礼包最大人数	
		Require = 64,
		--礼包物品的ID
		reward = {			
					{type = 0, id = 52, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--73级战士项链
					{type = 0, id = 53, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--73级法师项链
					{type = 0, id = 54, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--73级道士项链
					{type = 0, id = 55, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--500绑定元宝
					{type = 0, id = 56, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--金条(中)
					{type = 0, id = 57, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(中)
					--{type = 0, id = 459, count = 5, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(中)

				}, 
		name = "64级礼包",
		desc = "64级对应职业首饰一件",
		-- openWindId = 5,
		-- openWinIdParam =0,
		-- guide = {
		-- 	{
		-- 		desc = "打开升级面板",
		-- 		dir = 0,
		-- 		uiHelpId = 218,
		-- 		offsetX = 7, --偏移横坐标
		-- 		offsetY = -20, --偏移纵坐标				
		-- 	},
		-- 	{
		-- 		desc = "点击升级",
		-- 		dir = 2,
		-- 		uiHelpId = 218,
		-- 		offsetX = 0, --偏移横坐标
		-- 		offsetY = -5, --偏移纵坐标
		-- 	},
		-- 	{
		-- 		desc = "点击关闭",
		-- 		dir = 2,
		-- 		uiHelpId = 219,
		-- 		offsetX = 0, --偏移横坐标
		-- 		offsetY = -5, --偏移纵坐标
		-- 	},
		-- },	
	},

	--强化引导 2个槽位 2级
	{
		type = -1,
		--礼包物品的ID
		openWindId = 5,
		openWinIdParam =0,
		guide = {
			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
				{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击关闭",
				dir = 2,
				uiHelpId = 219,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
		},	
	},
	--3个槽位3级
	{
		type = -1,
		id = 0,	
		--MaxActorNum = -1,
		MaxActorNum = 0,	--领取礼包最大人数	
		Require = 0,
		--礼包物品的ID
		openWindId = 5,
		openWinIdParam =0,
		guide = {

			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击升级",
				dir = 2,
				uiHelpId = 218,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "点击关闭",
				dir = 2,
				uiHelpId = 219,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},

		},	
	},
	--购买血药引导
	{
		type = -1,
		--礼包物品的ID
		openWindId = 3,
		openWinIdParam =0,
		guide = {
			-- {
			-- 	desc = "打开随身商店",
			-- 	dir = 0,
			-- 	uiHelpId = 223,
			-- 	offsetX = 7, --偏移横坐标
			-- 	offsetY = -20, --偏移纵坐标				
			-- },
			{
				desc = "购买药水",
				dir = 2,
				uiHelpId = 224,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
			{
				desc = "关闭背包",
				dir = 2,
				uiHelpId = 225,
				offsetX = 0, --偏移横坐标
				offsetY = -5, --偏移纵坐标
			},
		},	
	},
	
	--模拟点击VIP回收按钮
	{
		type = -1,
		openWindId = 3,
		openWinIdParam =0,
		guide = {
			{
				desc = "VIP回收",
				dir = 2,
				uiHelpId = 227,
				offsetX = 110, --偏移横坐标
				offsetY = 15, --偏移纵坐标
			},
		},	
	},

	--60级礼包奖励
	-- {
	-- 	type = 0,
	-- 	id = 5,	
	-- 	--MaxActorNum = -1,
	-- 	MaxActorNum = -1,	--领取礼包最大人数	
	-- 	Require = 60,
	-- 	--礼包物品的ID
	-- 	reward = {			
	-- 				{type = 0, id = 34, count = 1, quality = 0, strong = 0, bind = 1,job = 1},--73级战士项链
	-- 				{type = 0, id = 35, count = 1, quality = 0, strong = 0, bind = 1,job = 2},--73级法师项链
	-- 				{type = 0, id = 36, count = 1, quality = 0, strong = 0, bind = 1,job = 3},--73级道士项链
	-- 				{type = 0, id = 37, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--500绑定元宝
	-- 				{type = 0, id = 38, count = 3, quality = 0, strong = 0, bind = 1,job = 0},--金条(中)
	-- 				{type = 0, id = 39, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(中)
	-- 				{type = 45, id = 0, count = 1000, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(中)

	-- 			}, 
	-- 	name = "60级礼包",
	-- 	desc = "60级对应职业首饰一件",
	-- },
	-- --1转礼包
	-- {
	-- 	type = 1,
	-- 	id = 5,
	-- 	--MaxActorNum = -1,
	-- 	MaxActorNum = 100,	--领取礼包最大人数	
	-- 	Require = 1,
	-- 	--礼包物品的ID
	-- 	reward = {			
	-- 				{type = 0, id = 297, count = 1, quality = 0, strong = 0, bind = 1,job = 1},--78级战士靴子
	-- 				{type = 0, id = 303, count = 1, quality = 0, strong = 0, bind = 1,job = 2},--78级法师靴子
	-- 				{type = 0, id = 309, count = 1, quality = 0, strong = 0, bind = 1,job = 3},--78级道士靴子
	-- 				{type = 0, id = 520, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--1000绑定元宝
	-- 				{type = 0, id = 509, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--金条(大)
	-- 				{type = 0, id = 513, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(大)

	-- 			}, 
	-- 	name = "1转礼包",
	-- 	desc = "75级对应职业首饰一件",
	-- },
	-- --3转礼包
	-- {
	-- 	type = 1,
	-- 	id = 6,
	-- 	--MaxActorNum = -1,
	-- 	MaxActorNum = 30,	--领取礼包最大人数	
	-- 	Require = 3,
	-- 	--礼包物品的ID
	-- 	reward = {			
	-- 				{type = 0, id = 314, count = 1, quality = 0, strong = 0, bind = 1,job = 1},--2转战士腰带
	-- 				{type = 0, id = 320, count = 1, quality = 0, strong = 0, bind = 1,job = 2},--2转法师腰带
	-- 				{type = 0, id = 326, count = 1, quality = 0, strong = 0, bind = 1,job = 3},--2转道士腰带
	-- 				{type = 0, id = 520, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--1000绑定元宝
	-- 				{type = 0, id = 677, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--超级金币箱
	-- 				{type = 0, id = 513, count = 4, quality = 0, strong = 0, bind = 1,job = 0},--经验丹(大)

	-- 			}, 
	-- 	name = "3转礼包",
	-- 	desc = "2转对应职业首饰一件",
	-- },
	-- --5转礼包
	-- {
	-- 	type = 1,
	-- 	id = 7,
	-- 	--MaxActorNum = -1,
	-- 	MaxActorNum = 10,	--领取礼包最大人数	
	-- 	Require = 5,
	-- 	--礼包物品的ID
	-- 	reward = {			
	-- 				{type = 0, id = 82, count = 1, quality = 0, strong = 0, bind = 1,job = 1,sex = 0},--3转男战衣服
	-- 				{type = 0, id = 83, count = 1, quality = 0, strong = 0, bind = 1,job = 1,sex = 1},--3转女战衣服
	-- 				{type = 0, id = 84, count = 1, quality = 0, strong = 0, bind = 1,job = 2,sex = 0},--3转男法衣服
	-- 				{type = 0, id = 85, count = 1, quality = 0, strong = 0, bind = 1,job = 2,sex = 1},--3转女法衣服
	-- 				{type = 0, id = 86, count = 1, quality = 0, strong = 0, bind = 1,job = 3,sex = 0},--3转男道衣服
	-- 				{type = 0, id = 87, count = 1, quality = 0, strong = 0, bind = 1,job = 3,sex = 1},--3转女道衣服
	-- 				{type = 0, id = 520, count = 3, quality = 0, strong = 0, bind = 1,job = 0},--1000绑定元宝
	-- 				{type = 0, id = 677, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--超级金币箱
	-- 				{type = 0, id = 676, count = 1, quality = 0, strong = 0, bind = 1,job = 0},--超级经验丹

	-- 			}, 
	-- 	name = "5转礼包",
	-- 	desc = "3转对应职业衣服一件",
	-- },
	-- --7转礼包
	-- {
	-- 	type = 1,
	-- 	id = 8,
	-- 	--MaxActorNum = -1,
	-- 	MaxActorNum = 3,	--领取礼包最大人数	
	-- 	Require = 7,
	-- 	--礼包物品的ID
	-- 	reward = {			
	-- 				{type = 0, id = 26, count = 1, quality = 0, strong = 0, bind = 1,job = 1},--5转战士武器
	-- 				{type = 0, id = 27, count = 1, quality = 0, strong = 0, bind = 1,job = 2},--5转法师武器
	-- 				{type = 0, id = 28, count = 1, quality = 0, strong = 0, bind = 1,job = 3},--5转道士武器
	-- 				{type = 0, id = 520, count = 4, quality = 0, strong = 0, bind = 1,job = 0},--1000绑定元宝
	-- 				{type = 0, id = 677, count = 3, quality = 0, strong = 0, bind = 1,job = 0},--超级金币箱
	-- 				{type = 0, id = 676, count = 2, quality = 0, strong = 0, bind = 1,job = 0},--超级经验丹

	-- 			}, 
	-- 	name = "7转礼包",
	-- 	desc = "5转对应职业武器一把",
	-- }
}