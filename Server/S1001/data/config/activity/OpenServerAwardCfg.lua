
-- conditions 条件类型 参考 data/function/Activity/AwardConditions.lua

OpenServerAward = 
{
	-- 1. 等级竞技 ------------------------------------------	
	{
		openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
		list = {
			{
			    name = "升至3转",
				quota=1000,
				conditions = {type = 1, params = {3, 0}}, -- 角色等级
				award = 
				{
					{type = 0,id = 376,count = 5,bind = 1},--3转装备箱
				},
			},
			{
			    name = "升至5转",
				quota=500,
				conditions = {type = 1, params = {5, 0}}, -- 角色等级
				award = 
				{
					{type = 0,id = 6683,count = 1,bind = 1},--五转首饰盒
				},
			},
			{
			    name = "升至7转",
				quota=100,
				conditions = {type = 1, params = {7, 0}}, -- 角色等级
				award = 
				{
					{type = 0,id = 6685,count = 1,bind = 0 },--七转首饰盒


				},
			},
			{
			    name = "升至9转",
				quota=50,
				conditions = {type = 1, params = {9, 0}}, -- 角色等级
				award = 
				{
					{type = 0,id = 115,count = 1,bind = 0,sex = 0,job = 1},--菩提战狂甲(男)
					{type = 0,id = 116,count = 1,bind = 0,sex = 1,job = 1},--菩提战狂甲(女)
					{type = 0,id = 124,count = 1,bind = 0,sex = 0,job = 2},--菩提法痴袍(男)
					{type = 0,id = 125,count = 1,bind = 0,sex = 1,job = 2},--菩提法痴袍(女)
					{type = 0,id = 133,count = 1,bind = 0,sex = 0,job = 3},--菩提道仙衣(男)
					{type = 0,id = 134,count = 1,bind = 0,sex = 1,job = 3},--菩提道仙衣(女)
				},
			},
			{
			    name = "升至11转",
				quota=8,
				conditions = {type = 1, params = {11, 0}}, -- 角色等级
				award = 
				{
					{type = 0,id = 114,count = 1,bind = 0,job = 1},--菩提彻地斩
					{type = 0,id = 123,count = 1,bind = 0,job = 2},--菩提骷髅杖
					{type = 0,id = 132,count = 1,bind = 0,job = 3},--菩提金纹剑
				},
			},
			
		},	
	},
	
	
	-- 2. 战将阶数 ------------------------------------------	
	{
		openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
		-- 最大为 8 层
		list = {
			{
				name = "破馆珍女5级",
				quota=300,
				conditions = {type = 2, params = {7}}, -- 战将等级
				award = 
				{
					{type = 0,id = 553,count = 2,bind = 1},--战将灵力丹（大）*2
				},
			},
			{
				name = "封魔明珠5级",
				quota=150,
				conditions = {type = 2, params = {14}}, -- 战将等级
				award = 
				{
					{type = 0,id = 553,count = 5,bind = 1},--战将灵力丹（大）*1
				},
			},
			{
				name = "沙漠之花5级",
				quota=100,
				conditions = {type = 2, params = {21}}, -- 战将等级
				award = 
				{
					{type = 0,id = 553,count = 10,bind = 1},--战将灵力丹（大）*2
				},
			},
			{
				name = "天尊魔女5级",
				quota=50,
				conditions = {type = 2, params = {28}}, -- 战将等级
				award = 
				{
					{type = 0,id = 553,count = 15,bind = 1},--战将灵力丹（大）*3
				},
			},
			{
				name = "法痴灵女5级",
				quota=8,
				conditions = {type = 2, params = {35}}, -- 战将等级
				award = 
				{
					{type = 0,id = 553,count = 20,bind = 1},--战将灵力丹（大）*3
				},
			},
		},	
	},
	
	

	-- 3. 翅膀竞技 ------------------------------------------	
	{
		openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
		-- 最大为 8 层
		list = {
			{
				name = "神翼·七阶",
				quota=300,
				conditions = {type = 3, params = {7}}, -- 翅膀等级
				award = 
				{
					{type = 0,id = 465,count = 600,bind = 1},--2级羽毛
				},
			},
			{
				name = "神翼·十二阶",
				quota=150,
				conditions = {type = 3, params = {12}}, -- 翅膀等级
				award = 
				{
					{type = 0,id = 466,count = 700,bind = 1},--3级羽毛
				},
			},
			{
				name = "神翼·十四阶",
				quota=100,
				conditions = {type = 3, params = {14}}, -- 翅膀等级
				award = 
				{
					{type = 0,id = 466,count = 1500,bind = 1},--3级羽毛
				},
			},
			{
				name = "神翼·十六阶",
				quota=50,
				conditions = {type = 3, params = {16}}, -- 翅膀等级
				award = 
				{
					{type = 0,id = 466,count = 3000,bind = 1},--3级羽毛
				},
			},
			{
				name = "神翼·十八阶",
				quota=8,
				conditions = {type = 3, params = {18}}, -- 翅膀等级
				award = 
				{
					{type = 0,id = 115,count = 1,bind = 0,sex = 0,job = 1},--菩提战狂甲(男)
					{type = 0,id = 116,count = 1,bind = 0,sex = 1,job = 1},--菩提战狂甲(女)
					{type = 0,id = 124,count = 1,bind = 0,sex = 0,job = 2},--菩提法痴袍(男)
					{type = 0,id = 125,count = 1,bind = 0,sex = 1,job = 2},--菩提法痴袍(女)
					{type = 0,id = 133,count = 1,bind = 0,sex = 0,job = 3},--菩提道仙衣(男)
					{type = 0,id = 134,count = 1,bind = 0,sex = 1,job = 3},--菩提道仙衣(女)
				},
			},
		},	
	},

	
	
		-- 4. 王城争霸 ------------------------------------------	
	{
		openTime = {3, 7}, -- 开服时间（第几天 到 第几天）
		-- 最大为 8 层
		list = {
			{
				name = "王城至尊",
				quota=1,
				conditions = {type = 4, params = {0}}, -- 是霸主
				award = 
				{
					{type = 0,id = 855,count = 1,bind = 0},--元宝*10000
					{type = 0,id = 5457,count = 1,bind = 0},--元宝*5000
				},
			},
		},	
	},
	
		-- 5. 消费排行 ------------------------------------------	
	{
		openTime = {2, 3}, -- 开服时间（第几天 到 第几天）
		list = {
			{
				name = "排名1",
				quota=1,
				conditions = {type = 5, params = {1}}, -- 翅膀等级
				award = 
				{
					--{type = 0,id = 391,count = 2,bind = 1},--7转首饰箱*2
					--{type = 0,id = 527,count = 25,bind = 1},--特戒结晶1*25
					--{type = 0,id = 509,count = 1,bind = 1},--大金条
				},
			},
			{
				name = "排名2",
				quota=1,
				conditions = {type = 5, params = {2}}, -- 翅膀等级
				award = 
				{
					--{type = 0,id = 391,count = 1,bind = 1},--7转首饰箱*2
					--{type = 0,id = 527,count = 12,bind = 1},--特戒结晶1*25
					--{type = 0,id = 509,count = 2,bind = 1},--大金条
				},
			},
			{
				name = "排名3",
				quota=1,
				conditions = {type = 5, params = {3}}, -- 翅膀等级
				award = 
				{
					--{type = 0,id = 378,count = 1,bind = 1},--6转装备箱*2
					--{type = 0,id = 527,count = 5,bind = 1},--特戒结晶1*25
					--{type = 0,id = 509,count = 3,bind = 1},--大金条
				},
			},
			{
				name = "排名4-5",
				quota=2,
				conditions = {type = 5, params = {5}}, -- 翅膀等级
				award = 
				{
					--{type = 0,id = 377,count = 2,bind = 1},--5转装备箱*2
					--{type = 0,id = 527,count = 3,bind = 1},--特戒结晶1*25
					--{type = 0,id = 509,count = 4,bind = 1},--大金条
				},
			},
			{
				name = "排名6-10",
				quota=5,
				conditions = {type = 5, params = {10}}, -- 翅膀等级
				award = 
				{
					--{type = 0,id = 376,count = 3,bind = 1},--7转首饰箱*2
					--{type = 0,id = 527,count = 1,bind = 1},--特戒结晶1*25
				},
			},
		},	
	},


	
--6 .开区特惠装备 188元宝。
	{
		openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
		list = {
			{
				name = "特惠装备",
				quota=-1,
				price = 188,
				award = 
				{
					{type = 0,id = 337,count = 1,bind = 1,sex=-1},--武器
					{type = 0,id = 338,count = 1,bind = 1,sex=0},--男衣服
					{type = 0,id = 339,count = 1,bind = 1,sex=1},--女衣服
					{type = 0,id = 340,count = 1,bind = 1,sex=-1},--头盔
					{type = 0,id = 341,count = 1,bind = 1,sex=-1},--项链
					{type = 0,id = 342,count = 2,bind = 1,sex=-1},--手镯
					{type = 0,id = 343,count = 2,bind = 1,sex=-1},--戒指
					{type = 0,id = 344,count = 1,bind = 1,sex=-1},--腰带
					{type = 0,id = 345,count = 1,bind = 1,sex=-1},--靴子


				},
			},
		},	
	},
--7击杀boss
	{
		openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
		list = {
			{
				name = "全民BOSS",
				quota=-1,
				boss =
				{
					{id=166,times=30,name="僵尸皇",iconid=6,x=100,y=200,index=1,tips="听说它在幽冥矿区1层(此BOSS刷新时间为30分钟)"},--第一只怪物   
					{id=170,times=30,name="钳虫皇",iconid=10,x=220,y=200,index=2,tips="听说它在死亡棺材1层(此BOSS刷新时间为30分钟)"},--第二只怪物
					{id=174,times=30,name="异教教皇",iconid=8,x=335,y=200,index=3,tips="听说它在异教宫殿1层(此BOSS刷新时间为30分钟)"},--第三只怪物
					{id=178,times=30,name="虚空大帝",iconid=12,x=100,y=240,index=4,tips="听说它在虚空古墓1层(此BOSS刷新时间为30分钟)"},--第四只怪物
					{id=182,times=30,name="破碎教皇",iconid=14,x=220,y=240,index=5,tips="听说它在破碎寺庙1层(此BOSS刷新时间为30分钟)"},--第四只怪物
					{id=189,times=30,name="蛮荒大教皇",iconid=126,x=335,y=240,index=6,tips="听说它在蛮荒禁地1层(此BOSS刷新时间为30分钟)"},--第四只怪物

				},
				award =  --奖励
				{
					{type = 0,id = 637,count = 1,bind = 1},--奖励
				},
			},
		},
	},

	-- 8. 宝石竞技 ------------------------------------------	
	{
		openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
		-- 最大为 8 层
		list = {
			{
				name = "宝石·10阶",
				quota=300,
				conditions = {type = 4, params = {10}}, -- 宝石等级   
				award = 
				{
					{type = 0,id = 539,count = 5,bind = 1},--宝石碎片(10000)*5
				},
			},
			{
				name = "宝石·15阶",
				quota=150,
				conditions = {type = 4, params = {15}}, -- 宝石等级
				award = 
				{
					{type = 0,id = 539,count = 10,bind = 1},--宝石碎片(10000)*8
				},
			},
			{
				name = "宝石·20阶",
				quota=100,
				conditions = {type = 4, params = {20}}, -- 宝石等级
				award = 
				{
					{type = 0,id = 539,count = 20,bind = 1},--宝石碎片(10000)*15
				},
			},
			{
				name = "宝石·25阶",
				quota=50,
				conditions = {type = 4, params = {25}}, -- 宝石等级
				award = 
				{
					{type = 0,id = 539,count = 30,bind = 1},--宝石碎片(10000)*25
				},
			},
			{
				name = "宝石·30阶",
				quota=8,
				conditions = {type = 4, params = {30}}, -- 宝石等级
				award = 
				{
					{type = 0,id = 114,count = 1,bind = 0,job = 1},--菩提彻地斩
					{type = 0,id = 123,count = 1,bind = 0,job = 2},--菩提骷髅杖
					{type = 0,id = 132,count = 1,bind = 0,job = 3},--菩提金纹剑
				},
			},
		},	
	},

		-- 9. 圣珠竞技 ------------------------------------------	
	{
		openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
		-- 最大为 8 层
		list = {
			{
				name = "圣珠·10阶",
				quota=300,
				conditions = {type = 5, params = {10}}, -- 圣珠
				award = 
				{
					{type = 0,id = 574,count = 5,bind = 1},--圣珠碎片(10000)*5

				},
			},
			{
				name = "圣珠·15阶",
				quota=150,
				conditions = {type = 5, params = {15}}, -- 圣珠
				award = 
				{
					{type = 0,id = 574,count = 10,bind = 1},--圣珠碎片(10000)*8
				},
			},
			{
				name = "圣珠·20阶",
				quota=100,
				conditions = {type = 5, params = {20}}, -- 圣珠
				award = 
				{
					{type = 0,id = 574,count = 20,bind = 1},--圣珠碎片(10000)*15
				},
			},
			{
				name = "圣珠·25阶",
				quota=50,
				conditions = {type = 5, params = {25}}, -- 圣珠
				award = 
				{
					{type = 0,id = 574,count = 30,bind = 1},--圣珠碎片(10000)*25
				
				},
			},
			{
				name = "圣珠·30阶",
				quota=8,
				conditions = {type = 5, params = {30}}, -- 圣珠
				award = 
				{
					{type = 0,id = 114,count = 1,bind = 0,job = 1},--菩提彻地斩
					{type = 0,id = 123,count = 1,bind = 0,job = 2},--菩提骷髅杖
					{type = 0,id = 132,count = 1,bind = 0,job = 3},--菩提金纹剑
				},
			},
		},	
	},
	-- 10. 称号租赁 ------------------------------------------	
   {
		openTime = {1, 3}, -- 开服时间（第几天 到 第几天）
		list = {

             {
                name = "诸天灭地",
				name2 = "<font color='#e6b46d'>全职业</font><font color='#51ff22'>攻击属性</font><font color='#e6b46d'>加成500</font><BR><font color='#e6b46d'>攻击BOSS时</font><font color='#51ff22'>伤害增加</font><font color='#e6b46d'>500</font><BR><font color='#e6b46d'>对BOSS</font><font color='#51ff22'>伤害增加</font><font color='#e6b46d'>5%</font>",
				quota=-1,
				price = 2888,
				conditions = {type = 100, params = {32}}, -- 需要的称号Id
				award = 
				{
					
				},
			},
            {
                name = "死亡召唤",
				name2 = "<font color='#e6b46d'>全职业</font><font color='#51ff22'>攻击属性</font><font color='#e6b46d'>加成1000</font><BR><font color='#e6b46d'>攻击BOSS时</font><font color='#51ff22'>伤害增加</font><font color='#e6b46d'>1000</font><BR><font color='#e6b46d'>对BOSS</font><font color='#51ff22'>伤害增加</font><font color='#e6b46d'>10%</font>",
				quota=-1,
				price = 18888,
				conditions = {type = 100, params = {33}}, -- 需要的称号Id
				award = 
				{
					
				},
			},
        	{
                name = "BOSS克星",
				name2 = "<font color='#e6b46d'>全职业</font><font color='#51ff22'>攻击属性</font><font color='#e6b46d'>加成2000</font><BR><font color='#e6b46d'>攻击BOSS时</font><font color='#51ff22'>伤害增加</font><font color='#e6b46d'>1500</font><BR><font color='#e6b46d'>对BOSS</font><font color='#51ff22'>伤害增加</font><font color='#e6b46d'>15%</font>",
				quota=-1,
				price = 38888,
				conditions = {type = 100, params = {34}}, -- 需要的称号Id
				award = 
				{
					
				},
			},





		},	
	},
	
	
	
	-- 11. boss首杀 ------------------------------------------	
   {
		openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
		list = {

			{
				name = "骷髅精灵",
				bossId = {719,769,809},
				bossIconId = 63,
				bossLv = 80,
				quota=-1,
				openDay =2,
				award = 
				{
					{type = 0,id = 6690,count = 1,bind = 1},--
					{type = 0,id = 511,count = 2,bind = 1},--
				},	
			},	
			{
				name = "黄泉教主",
				bossId = {767,811,1240},
				bossIconId = 161,
				bossLv = 80,
				quota=-1,
				openDay =2,
				award = 
				{
					{type = 0,id = 6690,count = 1,bind = 1},--
					{type = 0,id = 511,count = 2,bind = 1},--
				},	
			},
			{
				name = "沃玛教主",
				bossId = {747,763,810},
				bossIconId = 33,
				bossLv = 80,
				quota=-1,
				openDay =2,
				award = 
				{
					{type = 0,id = 6690,count = 1,bind = 1},--
					{type = 0,id = 511,count = 2,bind = 1},--
				},	
			},

			{
				name = "僵尸王",
				bossId = {637},
				bossIconId = 6,
				bossLv = 80,
				openDay =2,
				quota=-1,
				award = 
				{
					{type = 0,id = 6690,count = 1,bind = 1},--
					{type = 0,id = 511,count = 2,bind = 1},--
				},	
			},
			{
				name = "血巨人",
				bossId = {1044},
				bossIconId = 29,
				bossLv = 80,
				quota=-1,
				openDay =2,
				award = 
				{
					{type = 0,id = 6690,count = 1,bind = 1},--
					{type = 0,id = 511,count = 2,bind = 1},--
				},	
			},

			{
				name = "祖玛教主",
				bossId = {715,737,765,38},
				bossIconId = 160,
				bossLv = 80,
				quota=-1,
				openDay =2,
				award = 
				{
					{type = 0,id = 6690,count = 1,bind = 1},--
					{type = 0,id = 511,count = 2,bind = 1},--
				},	
			},


			{
				name = "赤火怪",
				bossId = {957},
				bossIconId = 174,
				bossLv = 90,
				quota=-1,
				openDay =3,
				award = 
				{
					{type = 0,id = 6690,count = 1,bind = 1},--
					{type = 0,id = 511,count = 4,bind = 1},--
				},	
			},
			{
				name = "牛王",
				bossId = {1046},
				bossIconId = 162,
				bossLv = 90,
				openDay =3,
				quota=-1,
				award = 
				{
					{type = 0,id = 6690,count = 1,bind = 1},--
					{type = 0,id = 511,count = 4,bind = 1},--
				},	
			},
			{
				name = "鬼魅狐妖",
				bossId = {720},
				bossIconId = 170,
				bossLv = 90,
				openDay =3,
				quota=-1,
				award = 
				{
					{type = 0,id = 6690,count = 1,bind = 1},--
					{type = 0,id = 511,count = 4,bind = 1},--
				},	
			},
			{
				name = "牛魔王",
				bossId = {44,638,716,738},
				bossIconId = 162,
				bossLv = 90,
				openDay =3,
				quota=-1,
				award = 
				{
					{type = 0,id = 6690,count = 1,bind = 1},--
					{type = 0,id = 511,count = 4,bind = 1},--
				},	
			},
			{
				name = "蚩尤酋长",
				bossId = {958},
				bossIconId = 23,
				bossLv = 100,
				quota=-1,
				openDay =4,
				award = 
				{
					{type = 0,id = 6690,count = 2,bind = 1},--
					{type = 0,id = 511,count = 6,bind = 1},--
				},	
			},
			{
				name = "玛雅教主",
				bossId = {717,51,639,723,739},
				bossIconId = 167,
				bossLv = 100,
				quota=-1,
				openDay =4,
				award = 
				{
					{type = 0,id = 6690,count = 2,bind = 1},--
					{type = 0,id = 511,count = 6,bind = 1},--
				},	
			},
			{
				name = "地藏魔王",
				bossId = {721,727},
				bossIconId = 161,
				bossLv = 100,
				quota=-1,
				openDay =4,
				award = 
				{
					{type = 0,id = 6690,count = 2,bind = 1},--
					{type = 0,id = 511,count = 6,bind = 1},--
				},	
			},
			{
				name = "雪狼战将",
				bossId = {813},
				bossIconId = 168,
				bossLv = 110,
				quota=-1,
				openDay =5,
				award = 
				{
					{type = 0,id = 6690,count = 2,bind = 1},--
					{type = 0,id = 511,count = 8,bind = 1},--
				},	
			},
			{
				name = "蝎子王",
				bossId = {959},
				bossIconId = 88,
				bossLv = 110,
				quota=-1,
				openDay =5,
				award = 
				{
					{type = 0,id = 6690,count = 2,bind = 1},--
					{type = 0,id = 511,count = 8,bind = 1},--
				},	
			},
			{
				name = "火龙教主",
				bossId = {722,728,731},
				bossIconId = 46,
				bossLv = 110,
				quota=-1,
				openDay =5,
				award = 
				{
					{type = 0,id = 6690,count = 2,bind = 1},--
					{type = 0,id = 511,count = 8,bind = 1},--
				},	
			},

			{
				name = "蚁后",
				bossId = {819},
				bossIconId = 78,
				bossLv = 110,
				quota=-1,
				openDay =5,
				award = 
				{
					{type = 0,id = 6690,count = 2,bind = 1},--
					{type = 0,id = 511,count = 8,bind = 1},--
				},	
			},


			{
				name = "拜月教主",
				bossId = {729,732},
				bossIconId = 109,
				bossLv = 120,
				quota=-1,
				openDay =6,
				award = 
				{
					{type = 0,id = 6690,count = 3,bind = 1},--
					{type = 0,id = 511,count = 10,bind = 1},--
				},	
			},
			{
				name = "炼狱教主",
				bossId = {725,63,641,741},
				bossIconId = 39,
				bossLv = 120,
				quota=-1,
				openDay =6,
				award = 
				{
					{type = 0,id = 6690,count = 3,bind = 1},--
					{type = 0,id = 511,count = 10,bind = 1},--
				},	
			},
			{
				name = "德玛大将",
				bossId = {960},
				bossIconId = 100,
				bossLv = 120,
				quota=-1,
				openDay =6,
				award = 
				{
					{type = 0,id = 6690,count = 3,bind = 1},--
					{type = 0,id = 511,count = 10,bind = 1},--
				},	
			},

			{
				name = "王者战将",
				bossId = {821},
				bossIconId = 109,
				bossLv = 120,
				quota=-1,
				openDay =6,
				award = 
				{
					{type = 0,id = 6690,count = 3,bind = 1},--
					{type = 0,id = 511,count = 10,bind = 1},--
				},	
			},

			{
				name = "水晶骑士",
				bossId = {814},
				bossIconId = 173,
				bossLv = 120,
				quota=-1,
				openDay =6,
				award = 
				{
					{type = 0,id = 6690,count = 3,bind = 1},--
					{type = 0,id = 511,count = 10,bind = 1},--
				},	
			},


			{
				name = "神龙教主",
				bossId = {726,70,642,742},
				bossIconId = 53,
				bossLv = 130,
				quota=-1,
				openDay =7,
				award = 
				{
					{type = 0,id = 6684,count = 1,bind = 1},--
					{type = 0,id = 511,count = 12,bind = 1},--
				},	
			},

			{
				name = "玄武大帝",
				bossId = {815},
				bossIconId = 49,
				bossLv = 130,
				quota=-1,
				openDay =7,
				award = 
				{
					{type = 0,id = 6684,count = 1,bind = 1},--
					{type = 0,id = 511,count = 12,bind = 1},--
				},	
			},

			{
				name = "帝王教主",
				bossId = {730,733},
				bossIconId = 165,
				bossLv = 130,
				quota=-1,
				openDay =7,
				award = 
				{
					{type = 0,id = 6684,count = 1,bind = 1},--
					{type = 0,id = 511,count = 12,bind = 1},--
				},	
			},

			{
				name = "异域巫师",
				bossId = {1052},
				bossIconId = 169,
				bossLv = 135,
				quota=-1,
				openDay =7,
				award = 
				{
					{type = 0,id = 6685,count = 1,bind = 1},--
					{type = 0,id = 511,count = 15,bind = 1},--
				},	
			},


			{
				name = "九尾灵狐",
				bossId = {1268},
				bossIconId = 41,
				bossLv = 140,
				quota=-1,
				openDay =7,
				award = 
				{
					{type = 0,id = 6685,count = 1,bind = 1},--
					{type = 0,id = 511,count = 15,bind = 1},--
				},	
			},

			{
				name = "双头魔王",
				bossId = {816},
				bossIconId = 129,
				bossLv = 140,
				quota=-1,
				openDay =7,
				award = 
				{
					{type = 0,id = 6685,count = 1,bind = 1},--
					{type = 0,id = 511,count = 15,bind = 1},--
				},	
			},
			{
				name = "黄铜BOSS",
				bossId = {786},
				bossIconId = 174,
				bossLv = 100,
				quota=-1,
				openDay =2,
				award = 
				{
					{type = 0,id = 4610,count = 1,bind = 1},--
					{type = 0,id = 511,count = 3,bind = 1},--
				},	
			},
			{
				name = "白银BOSS",
				bossId = {787},
				bossIconId = 161,
				bossLv = 105,
				quota=-1,
				openDay =2,
				award = 
				{
					{type = 0,id = 4611,count = 1,bind = 1},--
					{type = 0,id = 511,count = 6,bind = 1},--
				},	
			},
			{
				name = "黄金BOSS",
				bossId = {788},
				bossIconId = 168,
				bossLv = 110,
				quota=-1,
				openDay =2,
				award = 
				{
					{type = 0,id = 4612,count = 1,bind = 1},--
					{type = 0,id = 511,count = 9,bind = 1},--
				},	
			},


		},	
	},
	
	
	
	-- 12. 累计连续充值------------------------------------------	
   {
		openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
		list = {
			totalDays ={2,3,5,7},
			PayRMB = 
			{
				{
					needPayYb =30000,
					award ={
						--奖励1
						{
							{type = 0,id = 542,count = 1,bind = 1},--转生修为丹（小）*1
							{type = 0,id = 539,count = 2,bind = 1},--宝石结晶（1000）*2
							{type = 0,id = 574,count = 2,bind = 1},--圣珠结晶（1000）*2
							{type = 0,id = 6691,count = 10,bind = 1},--西游时装碎片*10
							{type = 0,id = 6363,count = 1,bind = 1},--豪礼宝箱*1
							{type = 0,id = 6918,count = 1,bind = 1},--骷髅精灵幻形水晶*1
						},	
						
						--奖励2
						{
							{type = 0,id = 542,count = 1,bind = 1},--转生修为丹（小）*1
							{type = 0,id = 539,count = 3,bind = 1},--宝石结晶（1000）*2
							{type = 0,id = 574,count = 3,bind = 1},--圣珠结晶（1000）*2
							{type = 0,id = 6691,count = 10,bind = 1},--西游时装碎片*10
							{type = 0,id = 6363,count = 1,bind = 1},--豪礼宝箱*1
							{type = 0,id = 6919,count = 1,bind = 1},--黄泉教主幻形水晶*1
						},	
						
						--奖励3
						{
							{type = 0,id = 542,count = 2,bind = 1},--转生修为丹（小）*1
							{type = 0,id = 539,count = 4,bind = 1},--宝石结晶（1000）*2
							{type = 0,id = 574,count = 4,bind = 1},--圣珠结晶（1000）*2
							{type = 0,id = 6371,count = 1,bind = 1},--幻羽礼盒*1
							{type = 0,id = 6363,count = 2,bind = 1},--豪礼宝箱*2
							{type = 0,id = 6920,count = 1,bind = 1},--杜美莎幻形水晶*1
						},	
						
						--奖励4
						{
							{type = 0,id = 542,count = 3,bind = 1},--转生修为丹（小）*1
							{type = 0,id = 539,count = 5,bind = 1},--宝石结晶（1000）*2
							{type = 0,id = 574,count = 5,bind = 1},--圣珠结晶（1000）*2
							{type = 0,id = 6658,count = 1,bind = 1},--灵器礼盒*1
							{type = 0,id = 6363,count = 3,bind = 1},--豪礼宝箱*3
							{type = 0,id = 6921,count = 1,bind = 1},--帝王教主幻形水晶*1
						},	
					
					}
				},
				
				
				{
					needPayYb =100000,
					award = {
						--奖励1
						{
							{type = 0,id = 6682,count = 1,bind = 1},--4转首饰盒*1
							{type = 0,id = 5167,count = 2,bind = 1},--神魂200
							{type = 0,id = 6691,count = 10,bind = 1},--西游时装碎片*10
							{type = 0,id = 7047,count = 1,bind = 1},--坐骑礼盒*1
							{type = 0,id = 6363,count = 1,bind = 1},--豪礼宝箱*1
							{type = 0,id = 6921,count = 1,bind = 1},--帝王教主幻形水晶*1
						},	
						
						--奖励2
						{
							{type = 0,id = 6683,count = 1,bind = 1},--4转首饰盒*1
							{type = 0,id = 5167,count = 3,bind = 1},--神魂200
							{type = 0,id = 7046,count = 10,bind = 1},--三国时装碎片*10
							{type = 0,id = 6659,count = 1,bind = 1},--传世礼盒*1
							{type = 0,id = 6363,count = 2,bind = 1},--豪礼宝箱*2
							{type = 0,id = 6922,count = 1,bind = 1},--双斧虎王幻形水晶*1
						},	
						
						--奖励3
						{
							{type = 0,id = 6684,count = 1,bind = 1},--4转首饰盒*1
							{type = 0,id = 5167,count = 4,bind = 1},--神魂200
							{type = 0,id = 7046,count = 10,bind = 1},--三国时装碎片*10
							{type = 0,id = 7043,count = 1,bind = 1},--足迹礼盒*1
							{type = 0,id = 6363,count = 3,bind = 1},--豪礼宝箱*3
							{type = 0,id = 6923,count = 1,bind = 1},--天蓬元帅幻形水晶*1
						},	
						
						--奖励4
						{
							{type = 0,id = 6685,count = 1,bind = 1},--4转首饰盒*1
							{type = 0,id = 5167,count = 5,bind = 1},--神魂200
							{type = 0,id = 7046,count = 10,bind = 1},--三国时装碎片*10
							{type = 0,id = 6675,count = 1,bind = 1},--女娲宝藏*1
							{type = 0,id = 6363,count = 5,bind = 1},--豪礼宝箱*5
							{type = 0,id = 6924,count = 1,bind = 1},--齐天大圣幻形水晶*1
						},	
					
					}
				},
			},
		
		},	
	},
	
	

	-- 13 材料返利
	{
		openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
		list = {
			--位置是固定的，不能随意插入或者修改。如有修改，告诉程序
			--护符返利
			{
				--第1档
				{
					needValue = 1280000,
					giveValue = 128000,
				},
				--第2档
				{
					needValue = 3200000,
					giveValue = 328000,
				},
				
				--第3档
				{
					needValue = 5800000,
					giveValue = 588000,
				},
				--第4档
				{
					needValue = 9800000,
					giveValue = 988000,
				},
			},
			
			--护盾返利
			{
				--第1档
				{
					needValue = 1280000,
					giveValue = 128000,
				},
				--第2档
				{
					needValue = 3200000,
					giveValue = 328000,
				},
				
				--第3档
				{
					needValue = 5800000,
					giveValue = 588000,
				},
				--第4档
				{
					needValue = 9800000,
					giveValue = 988000,
				},
			},
			
			--宝石返利
			{
				--第1档
				{
					needValue = 90000,
					giveValue = 9800,
				},
				--第2档
				{
					needValue = 180000,
					giveValue = 18800,
				},
				
				--第3档
				{
					needValue = 360000,
					giveValue = 38000,
				},
				--第4档
				{
					needValue = 720000,
					giveValue = 48000,
				},
			},
			
			
			--圣珠返利
			{
				--第1档
				{
					needValue = 90000,
					giveValue = 9800,
				},
				--第2档
				{
					needValue = 180000,
					giveValue = 18800,
				},
				
				--第3档
				{
					needValue = 360000,
					giveValue = 38000,
				},
				--第4档
				{
					needValue = 720000,
					giveValue = 48000,
				},
			},
			
			--特戒返利
			{
				--第1档
				{
					needValue = 60,
					giveValue = 10,
				},
				--第2档
				{
					needValue = 150,
					giveValue = 20,
				},
				
				--第3档
				{
					needValue = 300,
					giveValue = 30,
				},
				--第4档
				{
					needValue = 550,
					giveValue = 50,
				},
			},
			
			--灵力丹返利
			{
				--第1档
				{
					needValue = 10000,
					giveValue = 1000,
				},
				--第2档
				{
					needValue = 20000,
					giveValue = 2000,
				},
				
				--第3档
				{
					needValue = 30000,
					giveValue = 3000,
				},
				--第4档
				{
					needValue = 40000,
					giveValue = 4000,
				},
			},
		},	
	},
	
	
	-- 14 珍宝商店
	{
		openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
		list = {
			--第1天
			{
				--物品1
				{
					name = "VIP2限购",
					times=2, --限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 600,
					award = 
					{
						{type = 0,id = 542,count = 1,bind = 1},--转生修为丹（小）*1
					},
				},
				
				--物品2
				{
					name = "VIP2限购",
					times=2,--限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 600,
					award = 
					{
						{type = 0,id = 527,count = 1,bind = 1},--特戒结晶（1）*1
					},
				},

				--物品3
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 300,
					award = 
					{
						{type = 0,id = 537,count = 5,bind = 1},--宝石结晶（100）*5
					},
				},

				--物品4
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 300,
					award = 
					{
						{type = 0,id = 572,count = 5,bind = 1},--圣珠结晶（100）*5
					},
				},

				--物品5
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 400000,
					award = 
					{
						{type = 0,id = 464,count = 20,bind = 1},--1级羽毛*20
					},
				},

				--物品6
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 400000,
					award = 
					{
						{type = 0,id = 459,count = 20,bind = 1},--星纹强化石*20
					},
				},
				
			},
			
			--第2天
			{
				--物品1
				{
					name = "VIP2限购",
					times=2, --限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1200,
					award = 
					{
						{type = 0,id = 542,count = 2,bind = 1},--转生修为丹（小）*2
					},
				},
				
				--物品2
				{
					name = "VIP2限购",
					times=2,--限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1200,
					award = 
					{
						{type = 0,id = 527,count = 2,bind = 1},--特戒结晶（1）*2
					},
				},

				--物品3
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 600,
					award = 
					{
						{type = 0,id = 537,count = 10,bind = 1},--宝石结晶（100）*10
					},
				},

				--物品4
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 600,
					award = 
					{
						{type = 0,id = 572,count = 10,bind = 1},--圣珠结晶（100）*10
					},
				},

				--物品5
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 800000,
					award = 
					{
						{type = 0,id = 464,count = 40,bind = 1},--1级羽毛*40
					},
				},

				--物品6
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 800000,
					award = 
					{
						{type = 0,id = 459,count = 40,bind = 1},--星纹强化石*40
					},
				},
				
			},

			--第3天
			{
				--物品1
				{
					name = "VIP2限购",
					times=2, --限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1800,
					award = 
					{
						{type = 0,id = 542,count = 3,bind = 1},--转生修为丹（小）*3
					},
				},
				
				--物品2
				{
					name = "VIP2限购",
					times=2,--限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1800,
					award = 
					{
						{type = 0,id = 527,count = 3,bind = 1},--特戒结晶（1）*3
					},
				},

				--物品3
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 900,
					award = 
					{
						{type = 0,id = 537,count = 15,bind = 1},--宝石结晶（100）*15
					},
				},

				--物品4
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 900,
					award = 
					{
						{type = 0,id = 572,count = 15,bind = 1},--圣珠结晶（100）*15
					},
				},

				--物品5
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1200000,
					award = 
					{
						{type = 0,id = 464,count = 60,bind = 1},--1级羽毛*60
					},
				},

				--物品6
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1200000,
					award = 
					{
						{type = 0,id = 459,count = 60,bind = 1},--星纹强化石*60
					},
				},
				
			},

			--第4天
			{
				--物品1
				{
					name = "VIP2限购",
					times=2, --限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 2400,
					award = 
					{
						{type = 0,id = 542,count = 4,bind = 1},--转生修为丹（小）*4
					},
				},
				
				--物品2
				{
					name = "VIP2限购",
					times=2,--限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 2400,
					award = 
					{
						{type = 0,id = 527,count = 4,bind = 1},--特戒结晶（1）*4
					},
				},

				--物品3
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1200,
					award = 
					{
						{type = 0,id = 537,count = 20,bind = 1},--宝石结晶（100）*20
					},
				},

				--物品4
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1200,
					award = 
					{
						{type = 0,id = 572,count = 20,bind = 1},--圣珠结晶（100）*20
					},
				},

				--物品5
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1600000,
					award = 
					{
						{type = 0,id = 464,count = 80,bind = 1},--1级羽毛*80
					},
				},

				--物品6
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1600000,
					award = 
					{
						{type = 0,id = 459,count = 80,bind = 1},--星纹强化石*80
					},
				},
				
			},

			--第5天
			{
				--物品1
				{
					name = "VIP2限购",
					times=2, --限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 3000,
					award = 
					{
						{type = 0,id = 542,count = 5,bind = 1},--转生修为丹（小）*5
					},
				},
				
				--物品2
				{
					name = "VIP2限购",
					times=2,--限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 3000,
					award = 
					{
						{type = 0,id = 527,count = 5,bind = 1},--特戒结晶（1）*5
					},
				},

				--物品3
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1500,
					award = 
					{
						{type = 0,id = 537,count = 25,bind = 1},--宝石结晶（100）*25
					},
				},

				--物品4
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1500,
					award = 
					{
						{type = 0,id = 572,count = 25,bind = 1},--圣珠结晶（100）*25
					},
				},

				--物品5
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 2000000,
					award = 
					{
						{type = 0,id = 464,count = 100,bind = 1},--1级羽毛*100
					},
				},

				--物品6
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 2000000,
					award = 
					{
						{type = 0,id = 459,count = 100,bind = 1},--星纹强化石*100
					},
				},
				
			},

			--第6天
			{
				--物品1
				{
					name = "VIP2限购",
					times=2, --限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 3600,
					award = 
					{
						{type = 0,id = 542,count = 6,bind = 1},--转生修为丹（小）*6
					},
				},
				
				--物品2
				{
					name = "VIP2限购",
					times=2,--限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 3600,
					award = 
					{
						{type = 0,id = 527,count = 6,bind = 1},--特戒结晶（1）*6
					},
				},

				--物品3
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1800,
					award = 
					{
						{type = 0,id = 537,count = 30,bind = 1},--宝石结晶（100）*30
					},
				},

				--物品4
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 1800,
					award = 
					{
						{type = 0,id = 572,count = 30,bind = 1},--圣珠结晶（100）*30
					},
				},

				--物品5
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 2400000,
					award = 
					{
						{type = 0,id = 464,count = 120,bind = 1},--1级羽毛*120
					},
				},

				--物品6
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 2400000,
					award = 
					{
						{type = 0,id = 459,count = 120,bind = 1},--星纹强化石*120
					},
				},
				
			},

			--第7天
			{
				--物品1
				{
					name = "VIP2限购",
					times=2, --限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 4200,
					award = 
					{
						{type = 0,id = 542,count = 7,bind = 1},--转生修为丹（小）*7
					},
				},
				
				--物品2
				{
					name = "VIP2限购",
					times=2,--限购次数
					vipLevel =2, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 4200,
					award = 
					{
						{type = 0,id = 527,count = 7,bind = 1},--特戒结晶（1）*7
					},
				},

				--物品3
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 2100,
					award = 
					{
						{type = 0,id = 537,count = 35,bind = 1},--宝石结晶（100）*35
					},
				},

				--物品4
				{
					name = "元宝限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 3, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 2100,
					award = 
					{
						{type = 0,id = 572,count = 35,bind = 1},--圣珠结晶（100）*35
					},
				},

				--物品5
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 3000000,
					award = 
					{
						{type = 0,id = 464,count = 150,bind = 1},--1级羽毛*150
					},
				},

				--物品6
				{
					name = "金币限购",
					times=3,--限购次数
					vipLevel =0, --需要的vip等级
					moneyType = 0, --看看金钱类型是多少就填多少，元宝是3
					needMoneyValue = 3000000,
					award = 
					{
						{type = 0,id = 459,count = 150,bind = 1},--星纹强化石*150
					},
				},
				
			},
			
		}
	
	
	}
	
	-- 	-- 3. 宝石 ------------------------------------------	
	-- {
	-- 	openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
	-- 	-- 最大为 8 层
	-- 	list = {
	-- 		{
	-- 			name = "宝石称号",
	-- 			conditions = {type = 5, params = {20}}, -- 需要的宝石等级
	-- 			quota = -1, -- 名额
	-- 			award = 
	-- 			{
	-- 			},
	-- 		},
	-- 	},	
	-- },
	
	-- -- 4. 灵珠 ------------------------------------------	
	-- {
	-- 	openTime = {1, 7}, -- 开服时间（第几天 到 第几天）
	-- 	-- 最大为 8 层
	-- 	list = {
	-- 		{
	-- 			name = "圣珠称号",
	-- 			conditions = {type = 6, params = {20}}, -- 需要的灵珠等级
	-- 			quota = -1, -- 名额
	-- 			award = 
	-- 			{
	-- 			},
	-- 		},
	-- 	},	
	-- },
	--
	---- 5. 强化福利 ------------------------------------------	
	--{
	--	openTime = {1, 3}, -- 开服时间（第几天 到 第几天）
	--	-- 最大为 8 层
	--	list = {
	--		{
	--			name = "强化+6达到(8件)的",
	--			conditions = {type = 7, params = {6, 8}}, -- 强化+6 8件
	--			quota = -1, -- 名额
	--			award = 
	--			{
	--				{type = 0,id = 513,count = 5,bind = 1},--经验丹大*5	                                
	--			},
	--		},
	--		{
	--			name = "强化+7达到(8件)的",
	--			conditions = {type = 7, params = {7, 8}}, -- 强化+7 8件
	--			quota = -1, -- 名额
	--			award = 
	--			{
	--				{type = 0,id = 676,count = 1,bind = 1},--超级经验丹*1
	--			},
	--		},
	--		{
	--			name = "强化+8达到(8件)的",
	--			conditions = {type = 7, params = {8, 8}}, -- 强化+8 8件
	--			quota = -1, -- 名额
	--			award = 
	--			{
	--				{type = 0,id = 676,count = 2,bind = 1},--超级经验丹*2
	--			},
	--		},
	--		{
	--			name = "强化+9达到(8件)的",
	--			conditions = {type = 7, params = {9, 8}}, -- 强化+9 8件
	--			quota = -1, -- 名额
	--			award = 
	--			{
	--				{type = 0,id = 676,count = 4,bind = 1},--超级经验丹*4
	--			},
	--		},
	--	},	
	--},

	
}