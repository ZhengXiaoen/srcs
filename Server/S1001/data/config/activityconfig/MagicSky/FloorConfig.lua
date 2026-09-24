--楼层传送概率相关的定义
--各个楼层对应一组配置 目前最大只支持20层 需要增加层数需程序支持修改rank配置
--各楼层除了 sid与range 必须配置 与楼层1必须配置conds 外 其他楼层如不需其功能可以适当删除

GiveFlootExp = {
	Mins = 600,  --10分钟给一次经验
	TabIdx = 2,		--任务库索引
	ExpRates = {100,150,200,250,300,350,400,450,500,550,600,700},	--每层得到总经验比率
	VipRate = 0,
}

-- 轮盘的配置
RouletteCfg = {
	OutterRing ={1,2,3,4,5,6}; -- 外层数字，降1或2层
	InnerRing ={5,6,7,8,9,10,11,12}; -- 内圈的层列表
	RunCon = {id = 100, count = 1}; -- 转动的物品消耗，
}
--MSBoss
MSBoss = {
	-- boss1  活动开始多少秒后开始刷
	{createTime = 30,
		Layers = {4,5,6,7,8,9,10,11,12}; -- 随机选一个层
		WorldTips = Lang.Activity.a00056f5;
		Boss = {
			{nMonsterID = 888, pposX1 = 37, posX2 = 55,  posY1 = 49, posY2 = 31, nCount = 1, nLiveTime = 0, weight = 3}, -- weight 为概率权重，值越大随机抽到的几率就越大, weight = 0,不可能事件
			-- ......
		}
	},
	-- boss2
	{createTime = 60,
		Layers = {4,5,6,7,8,9,10,11,12}; -- 随机选一个场景id
		WorldTips = Lang.Activity.a00056f6;
		Boss = {
			{nMonsterID = 888, pposX1 = 37, posX2 = 55,  posY1 = 49, posY2 = 31, nCount = 1, nLiveTime = 0, weight = 3}, -- weight 为概率权重，值越大随机抽到的几率就越大, weight = 0,不可能事件
			-- ......
		}
	},
}

FloorConfig = 
{	
	--层数1 
	[1] = 	--[层数ID] = {}
	{
		sid = 40,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
		retScene = {sid = 8, range = {148,179,3,4}},	--sid层场景ID  range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h} 
		actTime = 7200, --活动总时间（秒）
		--传送所需条件 如 MustCount配置(2)，Condition配置 ({PROP_CREATURE_LEVEL, 60},{PROP_ACTOR_BATTLE_POWER, 10000}) ，
		--则表示会检测玩家等级与战力是否同是满足，不满足显示CannotTips提示，如配置MustCount配置(1)，则检测等级 或 战力是否满足
		conds =	--用于进入活动场景判断条件 仅需1层配置 其他层不用配置
		{
			MustCount = 1,						--需要最少的条件数
			CannotTips = Lang.Activity.a00055,	--没有达到条件提示
			Condition = 						--条件表
			{
				{PROP_CREATURE_LEVEL, 50},			--属性ID，条件值
			},
		},	
		upConsumes = {{type = 15, id = 0, count = 10},},		--爬上一层消耗
		upConsumes1 = {{type = 6, id = 0, count = 90},},		--爬上一层消耗 金币
		-- 消耗道具爬上一层
		UpgradeByItem = {
			-- 星宫卡
			{id = 1, count = 10},
			-- 其他，一行一条记录
			-- ......
		};
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		
		trans = 
		{
			{fid = 1, rate = {1,50}},
			{fid = 2, rate = {51,100}},	--要传送的层配置 {fid:层数id,rate:概率命中范围{1,100}则取[1, 100] 总范围(1-100)}	
		},
	},
	
	--层数2
	[2] = 	--[层数ID] = {}
	{
		sid = 41,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
		upConsumes = {{type = 15, id = 0, count = 20},},		--爬上一层消耗
		upConsumes1 = {{type = 6, id = 0, count = 90},},		--爬上一层消耗 金币
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		trans = 
		{
			{fid = 2, rate = {1,67}},
			{fid = 3, rate = {68,100}},	--要传送的层配置 {fid:层数id,rate:概率命中范围{1,100}则取[1, 100] 总范围(1-100)}
		},
	},
	
	--层数3
	[3] = 	--[层数ID] = {}
	{
		sid = 42,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
		upConsumes = {{type = 15, id = 0, count = 30},},		--爬上一层消耗
		upConsumes1 = {{type = 6, id = 0, count = 90},},		--爬上一层消耗 金币
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		trans = 
		{
			{fid = 3, rate = {1,75}},
			{fid = 4, rate = {76,100}},	--要传送的层配置 {fid:层数id,rate:概率命中范围{1,100}则取[1, 100] 总范围(1-100)}
		},
		floorAward =	--层奖励 如果配置floorAward = {}则不会显示领取菜单
		{
			{type = 20, id = 2, count = 600},
		},
		rankAward =		--排行榜奖励 配置floorAward = {} 或去掉则不会奖励
		{
			{
				rankInterval = {1,1},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 1000},
					--{type = 0, id = 1, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
			{
				rankInterval = {2,2},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 800},
					--{type = 0, id = 2, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
			{
				rankInterval = {3,3},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 500},
					--{type = 0, id = 3, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
		},
	},
	
	--层数4
	[4] = 	--[层数ID] = {}
	{
		sid = 43,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
		upConsumes = {{type = 15, id = 0, count = 40},},		--爬上一层消耗
		upConsumes1 = {{type = 6, id = 0, count = 90},},		--爬上一层消耗 金币
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		trans = 
		{
			{fid = 4, rate = {1,83}},
			{fid = 5, rate = {84,100}},	--要传送的层配置 {fid:层数id,rate:概率命中范围{1,100}则取[1, 100] 总范围(1-100)}
		},
	},
	
	--层数5
	[5] = 	--[层数ID] = {}
	{
		sid = 44,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
		upConsumes = {{type = 15, id = 0, count = 50},},		--爬上一层消耗
		upConsumes1 = {{type = 6, id = 0, count = 90},},		--爬上一层消耗 金币
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		trans = 
		{
			{fid = 5, rate = {1,87}},	
			{fid = 6, rate = {88,100}},	
		},
	},
	
	--层数6
	[6] = 	--[层数ID] = {}
	{
		sid = 45,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
		upConsumes = {{type = 15, id = 0, count = 60},},		--爬上一层消耗
		upConsumes1 = {{type = 6, id = 0, count = 90},},		--爬上一层消耗 金币
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		trans = 
		{
			--{fid = 5, rate = {1,5}},	--要传送的层配置 {fid:层数id,rate:概率命中范围{1,100}则取[1, 100] 总范围(1-100)}
			{fid = 6, rate = {1,90}},	
			{fid = 7, rate = {91,100}},	
		},
		floorAward =	--层奖励 如果配置floorAward = {}则不会显示领取菜单
		{
			{type = 20, id = 2, count = 900},
		},
		rankAward =		--排行榜奖励 配置floorAward = {} 或去掉则不会奖励
		{
			{
				rankInterval = {1,1},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 1500},
					--{type = 0, id = 1, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
			{
				rankInterval = {2,2},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 1150},
					--{type = 0, id = 2, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
			{
				rankInterval = {3,3},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 650},
					--{type = 0, id = 3, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
		},

	},
	
	--层数7
	[7] = 	--[层数ID] = {}
	{
		sid = 46,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
		upConsumes = {{type = 15, id = 0, count = 70},},		--爬上一层消耗
		upConsumes1 = {{type = 6, id = 0, count = 90},},		--爬上一层消耗 金币
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		trans = 
		{
			--{fid = 6, rate = {1,5}},	--要传送的层配置 {fid:层数id,rate:概率命中范围{1,100}则取[1, 100] 总范围(1-100)}
			{fid = 7, rate = {1,92}},	
			{fid = 8, rate = {93,100}},	
		},
	},
	
	--层数8
	[8] = 	--[层数ID] = {}
	{
		sid = 47,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
		upConsumes = {{type = 15, id = 0, count = 80},},		--爬上一层消耗
		upConsumes1 = {{type = 6, id = 0, count = 90},},		--爬上一层消耗 金币
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		trans = 
		{
			--{fid = 7, rate = {1,5}},	--要传送的层配置 {fid:层数id,rate:概率命中范围{1,100}则取[1, 100] 总范围(1-100)}
			{fid = 8, rate = {1,93}},	
			{fid = 9, rate = {94,100}},	
		},
	},
	
	--层数9
	[9] = 	--[层数ID] = {}
	{
		sid = 48,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
		upConsumes = {{type = 15, id = 0, count = 90},},		--爬上一层消耗 元宝
		upConsumes1 = {{type = 6, id = 0, count = 90},},		--爬上一层消耗 金币
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		trans = 
		{
			--{fid = 8, rate = {1,5}},	--要传送的层配置 {fid:层数id,rate:概率命中范围{1,100}则取[1, 100] 总范围(1-100)}
			{fid = 9, rate = {1,94}},	
			{fid = 10, rate = {95,100}},	
		},
		floorAward =	--层奖励 如果配置floorAward = {}则不会显示领取菜单
		{
			{type = 20, id = 2, count = 1200},
		},
		rankAward =		--排行榜奖励 配置floorAward = {} 或去掉则不会奖励
		{
			{
				rankInterval = {1,1},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 2000},
					--{type = 0, id = 1, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
			{
				rankInterval = {2,2},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 1550},
					--{type = 0, id = 2, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
			{
				rankInterval = {3,3},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 800},
					--{type = 0, id = 3, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
		},

	},
	
	--层数10
	[10] = 	--[层数ID] = {}
	{
		sid = 49,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
		upConsumes = {{type = 15, id = 0, count =100},},		--爬上一层消耗
		upConsumes1 = {{type = 6, id = 0, count = 90},},		--爬上一层消耗 金币
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		trans = 
		{
			--{fid = 9, rate = {1,5}},	--要传送的层配置 {fid:层数id,rate:概率命中范围{1,100}则取[1, 100] 总范围(1-100)}
			{fid = 10, rate = {1,94}},	
			{fid = 11, rate = {95,100}},		
		},
	},
	
	--层数11
	[11] = 	--[层数ID] = {}
	{
		sid = 50,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
		upConsumes = {{type = 15, id = 0, count = 110},},		--爬上一层消耗
		upConsumes1 = {{type = 6, id = 0, count = 90},},		--爬上一层消耗 金币
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		trans = 
		{
			--{fid = 10, rate = {1,5}},	--要传送的层配置 {fid:层数id,rate:概率命中范围{1,100}则取[1, 100] 总范围(1-100)}
			{fid = 11, rate = {1,95}},
			{fid = 12, rate = {96,100}},	
		},
	},
	
	--层数12 
	[12] = 	--[层数ID] = {}
	{
		sid = 51,        	--层数1 当前层场景ID 
		range = {53,54,7,7},	--range:传送随机点{中间坐标x,中间坐标y,宽半径w,高半径h}
--[[
		randConsumes = {{type = 6, id = 0, count = 10000 },},	--percent = 0.5, rate = {1, 50},随机爬消耗 percent:随机爬返还% count*percent, rate:几率命中范围总范围(1-100)
		trans = 
		{
			{fid = 11, rate = {1,3}},	--要传送的层配置 {fid:层数id,rate:概率命中范围{1,100}则取[1, 100] 总范围(1-100)}
			{fid = 10, rate = {4,6}},	
			{fid = 9,  rate = {7,10}},
			{fid = 12, rate = {11,100}},	
		},
]]
		oneCard = 		--星座卡兑换
		{
			consumes = 	--兑换消耗
			{
				{type = 0, id = 503, count = 1},
				{type = 0, id = 504, count = 1},
				{type = 0, id = 505, count = 1},
				{type = 0, id = 506, count = 1},
				{type = 0, id = 507, count = 1},
				{type = 0, id = 508, count = 1},
				{type = 0, id = 509, count = 1},
				{type = 0, id = 510, count = 1},
				{type = 0, id = 511, count = 1},
				{type = 0, id = 512, count = 1},
				{type = 0, id = 513, count = 1},
				{type = 0, id = 514, count = 1},

			},
			awards =	--兑换产出
			{
				{type = 20, id = 2, count = 500},
			},
		},
		allCard = 		--星宫卡兑换
		{
			consumes = 	--兑换消耗
			{
				{type = 0, id = 503, count = 1},
				{type = 0, id = 504, count = 1},
				{type = 0, id = 505, count = 1},
				{type = 0, id = 506, count = 1},
				{type = 0, id = 507, count = 1},
				{type = 0, id = 508, count = 1},
				{type = 0, id = 509, count = 1},
				{type = 0, id = 510, count = 1},
				{type = 0, id = 511, count = 1},
				{type = 0, id = 512, count = 1},
				{type = 0, id = 513, count = 1},
				{type = 0, id = 514, count = 1},
				
			},
			awards =	--兑换产出
			{
				{type = 20, id = 2, count = 3000},
			},
		},
		
		floorAward =	--层奖励 如果配置floorAward = {}则不会显示领取菜单
		{
			{type = 20, id = 2, count = 1500},
		},
		rankAward =		--排行榜奖励 配置floorAward = {} 或去掉则不会奖励
		{
			{
				rankInterval = {1,1},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 3000},
					--{type = 0, id = 1, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
			{
				rankInterval = {2,2},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 2000},
					--{type = 0, id = 2, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
			{
				rankInterval = {3,3},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 1000},
					--{type = 0, id = 3, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
		};
		FinalAward =		--最终排行榜奖励 配置 FinalAward = {} 或去掉则不会奖励
		{
			{
				rankInterval = {1,1},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 3000},
					--{type = 0, id = 1, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
			{
				rankInterval = {2,2},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 2000},
					--{type = 0, id = 2, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
			{
				rankInterval = {3,9999999},		--排名区间
				--奖励
				awards=
				{
					{type = 20, id = 2, count = 1000},
					--{type = 0, id = 3, count = 1, quality = 0, strong = 0, bind = 1},		--积分第一名领取的奖励物品
				},
			},
		}
	},
	
 
}