--合成配置
EquipSynthesisConfig=
{
--------------------------------------------
--装备合成
--------------------------------------------
	{
--------------------------------------------
		{ 
			name="桃园装备",
			type=1,
			synthesis=
			{
--------------------------------------------
				{--写1个表部分职业 , 分职业的话写3个职业
--------------------------------------------
{award = {type=0, id=22, count=1,bind=0}, notice = false, openday = 0, rate = 5000, consume = { {type = 0, id = 13, count = 2}, {type = 5, id = 0, count = 10}, }, }, --征服者之刃
{award = {type=0, id=23, count=1,bind=0}, notice = false, openday = 0, rate = 5000, consume = { {type = 0, id = 14, count = 2}, {type = 5, id = 0, count = 10}, }, }, --征服者战甲(男)
{award = {type=0, id=24, count=1,bind=0}, notice = false, openday = 0, rate = 5000, consume = { {type = 0, id = 15, count = 2}, {type = 5, id = 0, count = 10}, }, }, --征服者战甲(女)
{award = {type=0, id=31, count=1,bind=0}, notice = false, openday = 0, rate = 10000, consume = { {type = 0, id = 22, count = 2}, {type = 5, id = 0, count = 10}, }, }, --日月无极
{award = {type=0, id=32, count=1,bind=0}, notice = false, openday = 0, rate = 10000, consume = { {type = 0, id = 23, count = 2}, {type = 5, id = 0, count = 10}, }, }, --日月战甲(男)
{award = {type=0, id=33, count=1,bind=0}, notice = false, openday = 0, rate = 10000, consume = { {type = 0, id = 24, count = 2}, {type = 5, id = 0, count = 10}, }, }, --日月战甲(女)
{award = {type=0, id=40, count=1,bind=0}, notice = false, openday = 0, rate = 10000, consume = { {type = 0, id = 31, count = 2}, {type = 5, id = 0, count = 10}, }, }, --天下第一神兵
{award = {type=0, id=41, count=1,bind=0}, notice = false, openday = 0, rate = 10000, consume = { {type = 0, id = 32, count = 2}, {type = 5, id = 0, count = 10}, }, }, --天下第一神甲(男)
{award = {type=0, id=42, count=1,bind=0}, notice = false, openday = 0, rate = 10000, consume = { {type = 0, id = 33, count = 2}, {type = 5, id = 0, count = 10}, }, }, --天下第一神甲(女)
{award = {type=0, id=49, count=1,bind=0}, notice = false, openday = 0, rate = 10000, consume = { {type = 0, id = 40, count = 2}, {type = 5, id = 0, count = 10}, }, }, --圣皇血剑
{award = {type=0, id=50, count=1,bind=0}, notice = false, openday = 0, rate = 10000, consume = { {type = 0, id = 41, count = 2}, {type = 5, id = 0, count = 10}, }, }, --圣皇血甲(男)
{award = {type=0, id=51, count=1,bind=0}, notice = false, openday = 0, rate = 10000, consume = { {type = 0, id = 42, count = 2}, {type = 5, id = 0, count = 10}, }, }, --圣皇血甲(女)
--------------------------------------------
				},
--------------------------------------------
			},
		},
--------------------------------------------
	},
--------------------------------------------
--材料合成
--------------------------------------------
	{
		{
			name = "强化材料",
			type = 1,
			synthesis =
			{
				{
------------------------------------黑铁矿石(星星提升材料)
				{
					--award=合成奖励;bind:0=不绑定.1=绑定

					award = {type=0, id=460, count=1,bind=1},-- 生铁矿石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
						-- id = 物品ID
						-- count = 数量
						{type = 0, id = 459, count = 3},--黑铁矿石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},
------------------------------------生铁矿石(月亮提升材料)
				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=461, count=1,bind=1},-- 玄铁矿石
					notice = false, -- 是否公告
					openday = 3,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 460, count = 3},--生铁矿石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},
------------------------------------玄铁矿石(太阳提升材料)
				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=462, count=1,bind=1},-- 陨铁矿石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 461, count = 3},--玄铁矿石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},
			},
------------------------------------
			},
		},
------------------------------------
		{
			name = "羽毛材料",
			type = 2,
			synthesis =
			{
				{
------------------------------------
				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=465, count=1,bind=1},-- 2级羽毛
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 464, count = 3},--1级羽毛
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=466, count=1,bind=1},-- 3级羽毛
					notice = false, -- 是否公告
					openday = 3,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 465, count = 3},--2级羽毛
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=467, count=1,bind=1},-- 4级羽毛
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 466, count = 3},--3级羽毛
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},
			},
------------------------------------
			},
		},
------------------------------------
		{
			name = "攻击宝石",
			type = 3,
			synthesis =
			{
----------------------------------
			{--战士
------------------------------------
				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1380, count=1,bind=1},--2级物攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1379, count = 3},--1级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1381, count=1,bind=1},--3级物攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1380, count = 3},--2级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1382, count=1,bind=1},--4级物攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1381, count = 3},--3级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1383, count=1,bind=1},--5级物攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1382, count = 3},--4级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1384, count=1,bind=1},--6级物攻宝石
					notice = false, -- 是否公告
					openday = 3,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1383, count = 3},--5级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1385, count=1,bind=1},--7级物攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1384, count = 3},--6级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1386, count=1,bind=1},--8级物攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1385, count = 3},--7级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1387, count=1,bind=1},--9级物攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1386, count = 3},--8级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1388, count=1,bind=1},--10级物攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1387, count = 3},--9级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1389, count=1,bind=1},--11级物攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1388, count = 3},--10级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1390, count=1,bind=1},--12级物攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1389, count = 3},--11级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1391, count=1,bind=1},--13级物攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1390, count = 3},--12级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1392, count=1,bind=1},--14级物攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1391, count = 3},--13级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1393, count=1,bind=1},--15级物攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1392, count = 3},--14级物攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},
------------------------------------
			},
------------------------------------
			{--法师
-----------------------------------
				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1395, count=1,bind=1},--2级法攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1394, count = 3},--1级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1396, count=1,bind=1},--3级法攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1395, count = 3},--2级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1397, count=1,bind=1},--4级法攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1396, count = 3},--3级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1398, count=1,bind=1},--5级法攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1397, count = 3},--4级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1399, count=1,bind=1},--6级法攻宝石
					notice = false, -- 是否公告
					openday = 3,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1398, count = 3},--5级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1400, count=1,bind=1},--7级法攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1399, count = 3},--6级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1401, count=1,bind=1},--8级法攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1400, count = 3},--7级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1402, count=1,bind=1},--9级法攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1401, count = 3},--8级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1403, count=1,bind=1},--10级法攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1402, count = 3},--9级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1404, count=1,bind=1},--11级法攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1403, count = 3},--10级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1405, count=1,bind=1},--12级法攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1404, count = 3},--11级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1406, count=1,bind=1},--13级法攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1405, count = 3},--12级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1407, count=1,bind=1},--14级法攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1406, count = 3},--13级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1408, count=1,bind=1},--15级法攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1407, count = 3},--14级法攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},
-----------------------------------
			},
-----------------------------------
			{--道士
-----------------------------------
				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1410, count=1,bind=1},--2级道攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1409, count = 3},--1级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1411, count=1,bind=1},--3级道攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1410, count = 3},--2级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1412, count=1,bind=1},--4级道攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1411, count = 3},--3级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1413, count=1,bind=1},--5级道攻宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1412, count = 3},--4级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1414, count=1,bind=1},--6级道攻宝石
					notice = false, -- 是否公告
					openday = 3,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1413, count = 3},--5级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1415, count=1,bind=1},--7级道攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1414, count = 3},--6级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1416, count=1,bind=1},--8级道攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1415, count = 3},--7级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1417, count=1,bind=1},--9级道攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1416, count = 3},--8级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1418, count=1,bind=1},--10级道攻宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1417, count = 3},--9级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1419, count=1,bind=1},--11级道攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1418, count = 3},--10级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1420, count=1,bind=1},--12级道攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1419, count = 3},--11级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1421, count=1,bind=1},--13级道攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1420, count = 3},--12级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1422, count=1,bind=1},--14级道攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1421, count = 3},--13级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1423, count=1,bind=1},--15级道攻宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1422, count = 3},--14级道攻宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},
			},
-----------------------------------
			},
		},
		{
			name = "物防宝石",
			type = 4,
			synthesis =
			{
				{
-----------------------------------
				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1425, count=1,bind=1},--2级物防宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1424, count = 3},--1级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1426, count=1,bind=1},--3级物防宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1425, count = 3},--2级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1427, count=1,bind=1},--4级物防宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1426, count = 3},--3级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1428, count=1,bind=1},--5级物防宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1427, count = 3},--4级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1429, count=1,bind=1},--6级物防宝石
					notice = false, -- 是否公告
					openday = 3,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1428, count = 3},--5级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1430, count=1,bind=1},--7级物防宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1429, count = 3},--6级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1431, count=1,bind=1},--8级物防宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1430, count = 3},--7级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1432, count=1,bind=1},--9级物防宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1431, count = 3},--8级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1433, count=1,bind=1},--10级物防宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1432, count = 3},--9级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1434, count=1,bind=1},--11级物防宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1433, count = 3},--10级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1435, count=1,bind=1},--12级物防宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1434, count = 3},--11级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1436, count=1,bind=1},--13级物防宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1435, count = 3},--12级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1437, count=1,bind=1},--14级物防宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1436, count = 3},--13级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1438, count=1,bind=1},--15级物防宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1437, count = 3},--14级物防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},
			},
-----------------------------------
			},
		},
-----------------------------------
		{
			name = "魔防宝石",
			type = 5,
			synthesis =
			{
				{
-----------------------------------
				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1440, count=1,bind=1},--2级魔防宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1439, count = 3},--1级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1441, count=1,bind=1},--3级魔防宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1440, count = 3},--2级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1442, count=1,bind=1},--4级魔防宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1441, count = 3},--3级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1443, count=1,bind=1},--5级魔防宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1442, count = 3},--4级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1444, count=1,bind=1},--6级魔防宝石
					notice = false, -- 是否公告
					openday = 3,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1443, count = 3},--5级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1445, count=1,bind=1},--7级魔防宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1444, count = 3},--6级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1446, count=1,bind=1},--8级魔防宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1445, count = 3},--7级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1447, count=1,bind=1},--9级魔防宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1446, count = 3},--8级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1448, count=1,bind=1},--10级魔防宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1447, count = 3},--9级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1449, count=1,bind=1},--11级魔防宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1448, count = 3},--10级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1450, count=1,bind=1},--12级魔防宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1449, count = 3},--11级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1451, count=1,bind=1},--13级魔防宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1450, count = 3},--12级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1452, count=1,bind=1},--14级魔防宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1451, count = 3},--13级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1453, count=1,bind=1},--15级魔防宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1452, count = 3},--14级魔防宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},
			},
-----------------------------------
			},
		},
-----------------------------------
		{
			name = "生命宝石",
			type = 6,
			synthesis =
			{
				{
-----------------------------------
				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1455, count=1,bind=1},--2级生命宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1454, count = 3},--1级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1456, count=1,bind=1},--3级生命宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1455, count = 3},--2级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1457, count=1,bind=1},--4级生命宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1456, count = 3},--3级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1458, count=1,bind=1},--5级生命宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1457, count = 3},--4级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1459, count=1,bind=1},--6级生命宝石
					notice = false, -- 是否公告
					openday = 3,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1458, count = 3},--5级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1460, count=1,bind=1},--7级生命宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1459, count = 3},--6级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1461, count=1,bind=1},--8级生命宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1460, count = 3},--7级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1462, count=1,bind=1},--9级生命宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1461, count = 3},--8级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1463, count=1,bind=1},--10级生命宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1462, count = 3},--9级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1464, count=1,bind=1},--11级生命宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1463, count = 3},--10级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1465, count=1,bind=1},--12级生命宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1464, count = 3},--11级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1466, count=1,bind=1},--13级生命宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1465, count = 3},--12级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1467, count=1,bind=1},--14级生命宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1466, count = 3},--13级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1468, count=1,bind=1},--15级生命宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1467, count = 3},--14级生命宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},
			},
-----------------------------------
			},
		},
-----------------------------------
		{
			name = "暴击宝石",
			type = 7,
			synthesis =
			{
				{
-----------------------------------
				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1470, count=1,bind=1},--2级暴击宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1469, count = 3},--1级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1471, count=1,bind=1},--3级暴击宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1470, count = 3},--2级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1472, count=1,bind=1},--4级暴击宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1471, count = 3},--3级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1473, count=1,bind=1},--5级暴击宝石
					notice = false, -- 是否公告
					openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1472, count = 3},--4级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1474, count=1,bind=1},--6级暴击宝石
					notice = false, -- 是否公告
					openday = 3,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1473, count = 3},--5级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1475, count=1,bind=1},--7级暴击宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1474, count = 3},--6级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1476, count=1,bind=1},--8级暴击宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1475, count = 3},--7级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1477, count=1,bind=1},--9级暴击宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1476, count = 3},--8级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1478, count=1,bind=1},--10级暴击宝石
					notice = false, -- 是否公告
					openday = 5,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1477, count = 3},--9级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1479, count=1,bind=1},--11级暴击宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1478, count = 3},--10级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1481, count=1,bind=1},--12级暴击宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1480, count = 3},--11级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1482, count=1,bind=1},--13级暴击宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1481, count = 3},--12级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1482, count=1,bind=1},--14级暴击宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1481, count = 3},--13级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},

				{
					--award=合成奖励;bind:0=不绑定.1=绑定
					award = {type=0, id=1483, count=1,bind=1},--15级暴击宝石
					notice = false, -- 是否公告
					openday = 7,	-- 0表示一直显示,其他数值为新区第几天显示
					rate = 10000,	-- 合成几率,万分比
					consume =
					{
						{type = 0, id = 1482, count = 3},--14级暴击宝石
						{type = 5, id = 0, count = 10000},--合成绑金消耗
					},
				},
--------------------------------------------
				},
--------------------------------------------
			},
		},
--------------------------------------------
	},
--------------------------------------------
--神装合成
--------------------------------------------
	{
--------------------------------------------
		{ 
			name="1转神装",
			type=3,
			synthesis=
			{
-----------------------------------
				{--战士
-----------------------------------
					{--武器
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1484, count=1,bind=0},--神·玄武极天神斩
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 23, count = 3},--玄武极天神斩
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1511, count=1,bind=0},--神·玄武极天战甲(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 82, count = 3},--玄武极天战甲(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1512, count=1,bind=0},--神·玄武极天战甲(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 83, count = 3},--玄武极天战甲(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1565, count=1,bind=0},--神·玄武极天战盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 328, count = 3},--玄武极天战盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1566, count=1,bind=0},--神·玄武极天战链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 329, count = 3},--玄武极天战链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1567, count=1,bind=0},--神·玄武极天战镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 330, count = 3},--玄武极天战镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1568, count=1,bind=0},--神·玄武极天战戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 331, count = 3},--玄武极天战戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1569, count=1,bind=0},--神·玄武极天战带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 332, count = 3},--玄武极天战带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1570, count=1,bind=0},--神·玄武极天战靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 333, count = 3},--玄武极天战靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},

-----------------------------------
				},
-----------------------------------
				{--法师
-----------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1485, count=1,bind=0},--神·玄武极天魔杖
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 24, count = 3},--玄武极天魔杖
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1513, count=1,bind=0},--神·玄武极天魔袍(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 84, count = 3},--玄武极天魔袍(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1514, count=1,bind=0},--神·玄武极天魔袍(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 85, count = 3},--玄武极天魔袍(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1571, count=1,bind=0},--神·玄武极天魔盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 334, count = 3},--玄武极天魔盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1572, count=1,bind=0},--神·玄武极天魔链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 335, count = 3},--玄武极天魔链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1573, count=1,bind=0},--神·玄武极天魔镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 336, count = 3},--玄武极天魔镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1574, count=1,bind=0},--神·玄武极天魔戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 337, count = 3},--玄武极天魔戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1575, count=1,bind=0},--神·玄武极天魔带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 338, count = 3},--玄武极天魔带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1576, count=1,bind=0},--神·玄武极天魔靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 339, count = 3},--玄武极天魔靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
-----------------------------------
				},					
-----------------------------------
				{--道士
------------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1486, count=1,bind=0},--神·玄武极天道剑
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 25, count = 3},--玄武极天道剑
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1515, count=1,bind=0},--神·玄武极天道衣(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 86, count = 3},--玄武极天道衣(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1516, count=1,bind=0},--神·玄武极天道衣(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 87, count = 3},--玄武极天道衣(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1577, count=1,bind=0},--神·玄武极天道盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 340, count = 3},--玄武极天道盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1578, count=1,bind=0},--神·玄武极天道链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 341, count = 3},--玄武极天道链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1579, count=1,bind=0},--神·玄武极天道镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 342, count = 3},--玄武极天道镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1580, count=1,bind=0},--神·玄武极天道戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 343, count = 3},--玄武极天道戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1581, count=1,bind=0},--神·玄武极天道带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 344, count = 3},--玄武极天道带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1582, count=1,bind=0},--神·玄武极天道靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 345, count = 3},--玄武极天道靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
--------------------------------------------
				},
--------------------------------------------
			},
		},
--------------------------------------------
                { 
			name="3转神装",
			type=3,
			synthesis=
			{
-----------------------------------
				{--战士
-----------------------------------
					{--武器
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1487, count=1,bind=0},--神·真武凌天神斩
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 26, count = 3},--真武凌天神斩
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1517, count=1,bind=0},--神·真武凌天战甲(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 88, count = 3},--真武凌天神斩
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1518, count=1,bind=0},--神·真武凌天战甲(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 89, count = 3},--真武凌天战甲(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1583, count=1,bind=0},--神·真武凌天战盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 346, count = 3},--真武凌天战盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1584, count=1,bind=0},--神·真武凌天战链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 347, count = 3},--真武凌天战链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1585, count=1,bind=0},--神·真武凌天战镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 348, count = 3},--真武凌天战镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1586, count=1,bind=0},--神·真武凌天战戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 349, count = 3},--真武凌天战戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1587, count=1,bind=0},--神·真武凌天战带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 350, count = 3},--真武凌天战带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1588, count=1,bind=0},--神·真武凌天战靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 351, count = 3},--真武凌天战靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},

-----------------------------------
				},
-----------------------------------
				{--法师
-----------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1488, count=1,bind=0},--神·真武凌天魔杖
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 27, count = 3},--真武凌天魔杖
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1519, count=1,bind=0},--神·真武凌天魔袍(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 90, count = 3},--真武凌天魔袍(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1520, count=1,bind=0},--神·真武凌天魔袍(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 91, count = 3},--真武凌天魔袍(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1589, count=1,bind=0},--神·真武凌天魔盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 352, count = 3},--真武凌天魔盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1590, count=1,bind=0},--神·真武凌天魔链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 353, count = 3},--真武凌天魔链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1591, count=1,bind=0},--神·真武凌天魔镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 354, count = 3},--真武凌天魔镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1592, count=1,bind=0},--神·真武凌天魔戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 355, count = 3},--真武凌天魔戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1593, count=1,bind=0},--神·真武凌天魔带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 356, count = 3},--真武凌天魔带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1594, count=1,bind=0},--神·真武凌天魔靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 357, count = 3},--真武凌天魔靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
-----------------------------------
				},					
-----------------------------------
				{--道士
------------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1489, count=1,bind=0},--神·真武凌天道扇
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 28, count = 3},--真武凌天道扇
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1521, count=1,bind=0},--神·真武凌天道衣(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 92, count = 3},--真武凌天道衣(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1522, count=1,bind=0},--神·真武凌天道衣(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 93, count = 3},--真武凌天道衣(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1595, count=1,bind=0},--神·真武凌天道盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 358, count = 3},--真武凌天道盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1596, count=1,bind=0},--神·真武凌天道链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 359, count = 3},--真武凌天道链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1597, count=1,bind=0},--神·真武凌天道镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 360, count = 3},--真武凌天道镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1598, count=1,bind=0},--神·真武凌天道戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 361, count = 3},--真武凌天道戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1599, count=1,bind=0},--神·真武凌天道带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 362, count = 3},--真武凌天道带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1600, count=1,bind=0},--神·真武凌天道靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 363, count = 3},--真武凌天道靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
--------------------------------------------
				},
--------------------------------------------
			},
		},
--------------------------------------------
                { 
			name="5转神装",
			type=3,
			synthesis=
			{
-----------------------------------
				{--战士
-----------------------------------
					{--武器
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1490, count=1,bind=0},--神·圣武皓天神斩
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 29, count = 3},--圣武皓天神斩
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1523, count=1,bind=0},--神·圣武皓天战甲(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 94, count = 3},--圣武皓天战甲(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1524, count=1,bind=0},--神·圣武皓天战甲(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 95, count = 3},--圣武皓天战甲(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1601, count=1,bind=0},--神·圣武皓天战盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 364, count = 3},--圣武皓天战盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1602, count=1,bind=0},--神·圣武皓天战链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 365, count = 3},--圣武皓天战链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1603, count=1,bind=0},--神·圣武皓天战镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 366, count = 3},--圣武皓天战镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1604, count=1,bind=0},--神·圣武皓天战戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 367, count = 3},--圣武皓天战戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1605, count=1,bind=0},--神·圣武皓天战带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 368, count = 3},--圣武皓天战带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1606, count=1,bind=0},--神·圣武皓天战靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 369, count = 3},--圣武皓天战靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},

-----------------------------------
				},
-----------------------------------
				{--法师
-----------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1491, count=1,bind=0},--神·圣武皓天魔杖
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 30, count = 3},--圣武皓天魔杖
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1525, count=1,bind=0},--神·圣武皓天魔袍(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 96, count = 3},--圣武皓天魔袍(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1526, count=1,bind=0},--神·圣武皓天魔袍(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 97, count = 3},--圣武皓天魔袍(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1607, count=1,bind=0},--神·圣武皓天魔盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 370, count = 3},--圣武皓天魔盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1608, count=1,bind=0},--神·圣武皓天魔链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 371, count = 3},--圣武皓天魔链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1609, count=1,bind=0},--神·圣武皓天魔镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 372, count = 3},--圣武皓天魔镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1610, count=1,bind=0},--神·圣武皓天魔戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 373, count = 3},--圣武皓天魔戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1611, count=1,bind=0},--神·圣武皓天魔带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 374, count = 3},--圣武皓天魔带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1612, count=1,bind=0},--神·圣武皓天魔靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 375, count = 3},--圣武皓天魔靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
-----------------------------------
				},					
-----------------------------------
				{--道士
------------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1492, count=1,bind=0},--神·圣武皓天道剑
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 31, count = 3},--圣武皓天道剑
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1527, count=1,bind=0},--神·圣武皓天道衣(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 98, count = 3},--圣武皓天道衣(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1528, count=1,bind=0},--神·圣武皓天道衣(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 99, count = 3},--圣武皓天道衣(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1613, count=1,bind=0},--神·圣武皓天道盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 376, count = 3},--圣武皓天道盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1614, count=1,bind=0},--神·圣武皓天道链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 377, count = 3},--圣武皓天道链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1615, count=1,bind=0},--神·圣武皓天道镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 378, count = 3},--圣武皓天道镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1616, count=1,bind=0},--神·圣武皓天道戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 379, count = 3},--圣武皓天道戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1617, count=1,bind=0},--神·圣武皓天道带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 380, count = 3},--圣武皓天道带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1618, count=1,bind=0},--神·圣武皓天道靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 381, count = 3},--圣武皓天道靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
--------------------------------------------
				},
--------------------------------------------
			},
		},
--------------------------------------------
                { 
			name="7转神装",
			type=3,
			synthesis=
			{
-----------------------------------
				{--战士
-----------------------------------
					{--武器
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1493, count=1,bind=0},--神·威武驰天神斩
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 32, count = 3},--威武驰天神斩
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1529, count=1,bind=0},--神·威武驰天战甲(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 100, count = 3},--威武驰天战甲(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1530, count=1,bind=0},--神·威武驰天战甲(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 101, count = 3},--威武驰天战甲(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1619, count=1,bind=0},--神·威武驰天战盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 382, count = 3},--威武驰天战盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1620, count=1,bind=0},--神·威武驰天战链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 383, count = 3},--威武驰天战链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1621, count=1,bind=0},--神·威武驰天战镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 384, count = 3},--威武驰天战镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1622, count=1,bind=0},--神·威武驰天战戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 385, count = 3},--威武驰天战戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1623, count=1,bind=0},--神·威武驰天战带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 386, count = 3},--威武驰天战带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1624, count=1,bind=0},--神·威武驰天战靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 387, count = 3},--威武驰天战靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},

-----------------------------------
				},
-----------------------------------
				{--法师
-----------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1494, count=1,bind=0},--神·威武驰天魔杖
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 33, count = 3},--威武驰天魔杖
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1531, count=1,bind=0},--神·威武驰天魔袍(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 102, count = 3},--威武驰天魔袍(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1532, count=1,bind=0},--神·威武驰天魔袍(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 103, count = 3},--威武驰天魔袍(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1625, count=1,bind=0},--神·威武驰天魔盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 388, count = 3},--威武驰天魔盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1626, count=1,bind=0},--神·威武驰天魔链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 389, count = 3},--威武驰天魔链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1627, count=1,bind=0},--神·威武驰天魔镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 390, count = 3},--威武驰天魔镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1628, count=1,bind=0},--神·威武驰天魔戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 391, count = 3},--威武驰天魔戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1629, count=1,bind=0},--神·威武驰天魔带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 392, count = 3},--威武驰天魔带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1630, count=1,bind=0},--神·威武驰天魔靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 393, count = 3},--威武驰天魔靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
-----------------------------------
				},					
-----------------------------------
				{--道士
------------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1495, count=1,bind=0},--神·威武驰天道扇
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 34, count = 3},--威武驰天道扇
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1533, count=1,bind=0},--神·威武驰天道衣(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 104, count = 3},--威武驰天道衣(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1534, count=1,bind=0},--神·威武驰天道衣(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 105, count = 3},--威武驰天道衣(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1631, count=1,bind=0},--神·威武驰天道盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 394, count = 3},--威武驰天道盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1632, count=1,bind=0},--神·威武驰天道链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 395, count = 3},--威武驰天道链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1633, count=1,bind=0},--神·威武驰天道镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 396, count = 3},--威武驰天道镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1634, count=1,bind=0},--神·威武驰天道戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 397, count = 3},--威武驰天道戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1635, count=1,bind=0},--神·威武驰天道带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 398, count = 3},--威武驰天道带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1636, count=1,bind=0},--神·威武驰天道靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 399, count = 3},--威武驰天道靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
--------------------------------------------
				},
--------------------------------------------
			},
		},
--------------------------------------------
               { 
			name="9转神装",
			type=3,
			synthesis=
			{
-----------------------------------
				{--战士
-----------------------------------
					{--武器
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1496, count=1,bind=0},--神·洪武行天神斩
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 35, count = 3},--洪武行天神斩
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1535, count=1,bind=0},--神·洪武行天战甲(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 106, count = 3},--洪武行天战甲(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1536, count=1,bind=0},--神·洪武行天战甲(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 107, count = 3},--洪武行天战甲(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1637, count=1,bind=0},--神·洪武行天战盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 400, count = 3},--洪武行天战盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1638, count=1,bind=0},--神·洪武行天战链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 401, count = 3},--洪武行天战链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1639, count=1,bind=0},--神·洪武行天战镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 402, count = 3},--洪武行天战镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1640, count=1,bind=0},--神·洪武行天战戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 403, count = 3},--洪武行天战戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1641, count=1,bind=0},--神·洪武行天战带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 404, count = 3},--洪武行天战带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1642, count=1,bind=0},--神·洪武行天战靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 405, count = 3},--洪武行天战靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},

-----------------------------------
				},
-----------------------------------
				{--法师
-----------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1497, count=1,bind=0},--神·洪武行天魔杖
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 36, count = 3},--洪武行天魔杖
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1537, count=1,bind=0},--神·洪武行天魔袍(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 108, count = 3},--洪武行天魔袍(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1538, count=1,bind=0},--神·洪武行天魔袍(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 109, count = 3},--洪武行天魔袍(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1643, count=1,bind=0},--神·洪武行天魔盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 406, count = 3},--洪武行天魔盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1644, count=1,bind=0},--神·洪武行天魔链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 407, count = 3},--洪武行天魔链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1645, count=1,bind=0},--神·洪武行天魔镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 408, count = 3},--洪武行天魔镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1646, count=1,bind=0},--神·洪武行天魔戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 409, count = 3},--洪武行天魔戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1647, count=1,bind=0},--神·洪武行天魔带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 410, count = 3},--洪武行天魔带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1648, count=1,bind=0},--神·洪武行天魔靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 411, count = 3},--洪武行天魔靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
-----------------------------------
				},					
-----------------------------------
				{--道士
------------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1498, count=1,bind=0},--神·洪武行天道剑
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 37, count = 3},--洪武行天道剑
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{--衣服(男)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1539, count=1,bind=0},--神·洪武行天道衣(男)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 110, count = 3},--洪武行天道衣(男)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--衣服(女)
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1540, count=1,bind=0},--神·洪武行天道衣(女)
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 111, count = 3},--洪武行天道衣(女)
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--头盔
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1649, count=1,bind=0},--神·洪武行天道盔
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 412, count = 3},--洪武行天道盔
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--项链
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1650, count=1,bind=0},--神·洪武行天道链
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 413, count = 3},--洪武行天道链
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--手镯
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1651, count=1,bind=0},--神·洪武行天道镯
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 414, count = 3},--洪武行天道镯
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--戒指
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1652, count=1,bind=0},--神·洪武行天道戒
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 415, count = 3},--洪武行天道戒
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--腰带
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1653, count=1,bind=0},--神·洪武行天道带
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 416, count = 3},--洪武行天道带
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					
					{--鞋子
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1654, count=1,bind=0},--神·洪武行天道靴
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 417, count = 3},--洪武行天道靴
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
----------------------------------------------
--				},
----------------------------------------------
--			},
--		},
----------------------------------------------
--                { 
--			name="11转神装",
--			type=3,
--			synthesis=
--			{
-------------------------------------
--				{--战士
-------------------------------------
--					{--武器
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1499, count=1,bind=0},--神·狂武霸天神斩
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 115, count = 3},--狂武霸天神斩
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1541, count=1,bind=0},--神·狂武霸天战甲(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 421, count = 3},--狂武霸天战甲(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1542, count=1,bind=0},--神·狂武霸天战甲(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 422, count = 3},--狂武霸天战甲(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1655, count=1,bind=0},--神·狂武霸天战盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id =577, count = 3},--狂武霸天战盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1656, count=1,bind=0},--神·狂武霸天战链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 578, count = 3},--狂武霸天战链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1657, count=1,bind=0},--神·狂武霸天战镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 579, count = 3},--狂武霸天战镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1658, count=1,bind=0},--神·狂武霸天战戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 580, count = 3},--狂武霸天战戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1659, count=1,bind=0},--神·狂武霸天战带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id =581, count = 3},--狂武霸天战带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1660, count=1,bind=0},--神·狂武霸天战靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 582, count = 3},--狂武霸天战靴
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--
-------------------------------------
--				},
-------------------------------------
--				{--法师
-------------------------------------
--					{
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1500, count=1,bind=0},--神·狂武霸天魔杖
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 116, count = 3},--狂武霸天魔杖
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1543, count=1,bind=0},--神·狂武霸天魔袍(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 423, count = 3},--狂武霸天魔袍(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1544, count=1,bind=0},--神·狂武霸天魔袍(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id =424, count = 3},--狂武霸天魔袍(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1661, count=1,bind=0},--神·狂武霸天魔盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 583, count = 3},--狂武霸天魔盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1662, count=1,bind=0},--神·狂武霸天魔链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 584, count = 3},--狂武霸天魔链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1663, count=1,bind=0},--神·狂武霸天魔镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 585, count = 3},--狂武霸天魔镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1664, count=1,bind=0},--神·狂武霸天魔戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 586, count = 3},--狂武霸天魔戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1665, count=1,bind=0},--神·狂武霸天魔带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 587, count = 3},--狂武霸天魔带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1666, count=1,bind=0},--神·狂武霸天魔靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 588, count = 3},--狂武霸天魔靴
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
-------------------------------------
--				},					
-------------------------------------
--				{--道士
--------------------------------------
--					{
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1501, count=1,bind=0},--神·狂武霸天道扇
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 117, count = 3},--狂武霸天道扇
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1545, count=1,bind=0},--神·狂武霸天道衣(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 425, count = 3},--狂武霸天道衣(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1546, count=1,bind=0},--神·狂武霸天道衣(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 426, count = 3},--狂武霸天道衣(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1667, count=1,bind=0},--神·狂武霸天道盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 589, count = 3},--狂武霸天道盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1668, count=1,bind=0},--神·狂武霸天道链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 590, count = 3},--狂武霸天道链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1669, count=1,bind=0},--神·狂武霸天道镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 591, count = 3},--狂武霸天道镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1670, count=1,bind=0},--神·狂武霸天道戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 592, count = 3},--狂武霸天道戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1671, count=1,bind=0},--神·狂武霸天道带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 593, count = 3},--狂武霸天道带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1672, count=1,bind=0},--神·狂武霸天道靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 594, count = 3},--狂武霸天道靴
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
----------------------------------------------
--				},
----------------------------------------------
--			},
--		},
----------------------------------------------
--                { 
--			name="13转神装",
--			type=3,
--			synthesis=
--			{
-------------------------------------
--				{--战士
-------------------------------------
--					{--武器
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1502, count=1,bind=0},--神·龙武亢天神斩
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 118, count = 3},--龙武亢天神斩
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1547, count=1,bind=0},--神·龙武亢天战甲(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 427, count = 3},--龙武亢天战甲(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1548, count=1,bind=0},--神·龙武亢天战甲(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 428, count = 3},--龙武亢天战甲(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1673, count=1,bind=0},--神·龙武亢天战盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 595, count = 3},--龙武亢天战盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1674, count=1,bind=0},--神·龙武亢天战链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 596, count = 3},--龙武亢天战链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1675, count=1,bind=0},--神·龙武亢天战镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 597, count = 3},--龙武亢天战镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1676, count=1,bind=0},--神·龙武亢天战戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 598, count = 3},--龙武亢天战戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1677, count=1,bind=0},--神·龙武亢天战带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 499, count = 3},--龙武亢天战带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1678, count=1,bind=0},--神·龙武亢天战靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 600, count = 3},--龙武亢天战靴
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--
-------------------------------------
--				},
-------------------------------------
--				{--法师
-------------------------------------
--					{
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1503, count=1,bind=0},--神·龙武亢天魔杖
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 119, count = 3},--龙武亢天魔杖
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1549, count=1,bind=0},--神·龙武亢天魔袍(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 429, count = 3},--龙武亢天魔袍(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1550, count=1,bind=0},--神·龙武亢天魔袍(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 430, count = 3},--龙武亢天魔袍(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1679, count=1,bind=0},--神·龙武亢天魔盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 601, count = 3},--龙武亢天魔盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1680, count=1,bind=0},--神·龙武亢天魔链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 602, count = 3},--龙武亢天魔链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1681, count=1,bind=0},--神·龙武亢天魔镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 603, count = 3},--龙武亢天魔镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1682, count=1,bind=0},--神·龙武亢天魔戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 604, count = 3},--龙武亢天魔戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1683, count=1,bind=0},--神·龙武亢天魔带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 605, count = 3},--龙武亢天魔带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1684, count=1,bind=0},--神·龙武亢天魔靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 606, count = 3},--龙武亢天魔靴
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
-------------------------------------
--				},					
-------------------------------------
--				{--道士
--------------------------------------
--					{
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1504, count=1,bind=0},--神·龙武亢天道剑
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 120, count = 3},--龙武亢天道剑
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1551, count=1,bind=0},--神·龙武亢天道衣(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 431, count = 3},--龙武亢天道衣(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1552, count=1,bind=0},--神·龙武亢天道衣(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 432, count = 3},--龙武亢天道衣(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1685, count=1,bind=0},--神·龙武亢天道盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 607, count = 3},--龙武亢天道盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1686, count=1,bind=0},--神·龙武亢天道链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 608, count = 3},--龙武亢天道链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1687, count=1,bind=0},--神·龙武亢天道镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 609, count = 3},--龙武亢天道镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1688, count=1,bind=0},--神·龙武亢天道戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 610, count = 3},--龙武亢天道戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1689, count=1,bind=0},--神·龙武亢天道带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 611, count = 3},--龙武亢天道带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1690, count=1,bind=0},--神·龙武亢天道靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 612, count = 3},--龙武亢天道靴
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
----------------------------------------------
--				},
----------------------------------------------
--			},
--		},
----------------------------------------------
--                { 
--			name="14转神装",
--			type=3,
--			synthesis=
--			{
-------------------------------------
--				{--战士
-------------------------------------
--					{--武器
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1505, count=1,bind=0},--神·神武傲天神斩
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 121, count = 3},--神武傲天神斩
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1553, count=1,bind=0},--神·神武傲天战甲(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 433, count = 3},--神武傲天战甲(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1554, count=1,bind=0},--神·神武傲天战甲(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 434, count = 3},--神武傲天战甲(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1691, count=1,bind=0},--神·神武傲天战盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 613, count = 3},--神武傲天战盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1692, count=1,bind=0},--神·神武傲天战链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 614, count = 3},--神武傲天战链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1693, count=1,bind=0},--神·神武傲天战镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 615, count = 3},--神武傲天战镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1694, count=1,bind=0},--神·神武傲天战戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 616, count = 3},--神武傲天战戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1695, count=1,bind=0},--神·神武傲天战带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 617, count = 3},--神武傲天战带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1696, count=1,bind=0},--神·神武傲天战靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 618, count = 3},--神武傲天战靴
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--
-------------------------------------
--				},
-------------------------------------
--				{--法师
-------------------------------------
--					{
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1506, count=1,bind=0},--神·神武傲天魔杖
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 122, count = 3},--神武傲天魔杖
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1555, count=1,bind=0},--神·神武傲天魔袍(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 435, count = 3},--神武傲天魔袍(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1556, count=1,bind=0},--神·神武傲天魔袍(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 436, count = 3},--神武傲天魔袍(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1697, count=1,bind=0},--神·神武傲天魔盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 619, count = 3},--神武傲天魔盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1698, count=1,bind=0},--神·神武傲天魔链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 620, count = 3},--神武傲天魔链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1699, count=1,bind=0},--神·神武傲天魔镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 621, count = 3},--神武傲天魔镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1700, count=1,bind=0},--神·神武傲天魔戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 622, count = 3},--神武傲天魔戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1701, count=1,bind=0},--神·神武傲天魔带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 623, count = 3},--神武傲天魔带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1702, count=1,bind=0},--神·神武傲天魔靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 624, count = 3},--神武傲天魔靴
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
-------------------------------------
--				},					
-------------------------------------
--				{--道士
--------------------------------------
--					{
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1507, count=1,bind=0},--神·神武傲天道扇
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 123, count = 3},--神武傲天道扇
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1557, count=1,bind=0},--神·神武傲天道衣(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 437, count = 3},--神武傲天道衣(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1558, count=1,bind=0},--神·神武傲天道衣(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 438, count = 3},--威武驰天道衣(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1703, count=1,bind=0},--神·神武傲天道盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 625, count = 3},--神武傲天道盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1704, count=1,bind=0},--神·神武傲天道链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 626, count = 3},--神武傲天道链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1705, count=1,bind=0},--神·神武傲天道镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 627, count = 3},--神武傲天道镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1706, count=1,bind=0},--神·神武傲天道戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 628, count = 3},--神武傲天道戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1707, count=1,bind=0},--神·神武傲天道带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 629, count = 3},--神武傲天道带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1708, count=1,bind=0},--神·神武傲天道靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 630, count = 3},--神武傲天道靴
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
----------------------------------------------
--				},
----------------------------------------------
--			},
--		},
----------------------------------------------
--                 { 
--			name="15转神装",
--			type=3,
--			synthesis=
--			{
-------------------------------------
--				{--战士
-------------------------------------
--					{--武器
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1508, count=1,bind=0},--神·尊武皇天神斩
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 124, count = 3},--尊武皇天神斩
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1559, count=1,bind=0},--神·尊武皇天战甲(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 439, count = 3},--尊武皇天战甲(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1560, count=1,bind=0},--神·尊武皇天战甲(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 440, count = 3},--尊武皇天战甲(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1709, count=1,bind=0},--神·尊武皇天战盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 631, count = 3},--尊武皇天战盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1710, count=1,bind=0},--神·尊武皇天战链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 632, count = 3},--尊武皇天战链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1711, count=1,bind=0},--神·尊武皇天战镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 633, count = 3},--尊武皇天战镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1712, count=1,bind=0},--神·尊武皇天战戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 634, count = 3},--尊武皇天战戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1713, count=1,bind=0},--神·尊武皇天战带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 635, count = 3},--尊武皇天战带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1714, count=1,bind=0},--神·尊武皇天战靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 636, count = 3},--尊武皇天战
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--
-------------------------------------
--				},
-------------------------------------
--				{--法师
-------------------------------------
--					{
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1509, count=1,bind=0},--神·尊武皇天魔杖
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 125, count = 3},--尊武皇天魔杖
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1561, count=1,bind=0},--神·尊武皇天魔袍(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 441, count = 3},--尊武皇天魔袍(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1562, count=1,bind=0},--神·尊武皇天魔袍(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 442, count = 3},--尊武皇天魔袍(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1715, count=1,bind=0},--神·尊武皇天魔盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 637, count = 3},--尊武皇天魔盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1716, count=1,bind=0},--神·尊武皇天魔链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 638, count = 3},--尊武皇天魔链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1717, count=1,bind=0},--神·尊武皇天魔镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 639, count = 3},--神武傲天魔镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1718, count=1,bind=0},--神·尊武皇天魔戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 640, count = 3},--尊武皇天魔戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1719, count=1,bind=0},--神·尊武皇天魔带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 641, count = 3},--尊武皇天魔带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1720, count=1,bind=0},--神·尊武皇天魔靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 642, count = 3},--尊武皇天魔靴
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
-------------------------------------
--				},					
-------------------------------------
--				{--道士
--------------------------------------
--					{
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1510, count=1,bind=0},--神·尊武皇天道剑
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 126, count = 3},--尊武皇天道剑
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					{--衣服(男)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1563, count=1,bind=0},--神·尊武皇天道衣(男)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 443, count = 3},--尊武皇天道衣(男)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--衣服(女)
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1564, count=1,bind=0},--神·尊武皇天道衣(女)
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 444, count = 3},--尊武皇天道衣(女)
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--头盔
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1721, count=1,bind=0},--神·尊武皇天道盔
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 643, count = 3},--尊武皇天道盔
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--项链
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1722, count=1,bind=0},--神·尊武皇天道链
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 644, count = 3},--尊武皇天道链
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--手镯
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1723, count=1,bind=0},--神·尊武皇天道镯
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 645, count = 3},--尊武皇天道镯
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--戒指
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1724, count=1,bind=0},--神·尊武皇天道戒
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 646, count = 3},--尊武皇天道戒
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--腰带
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1725, count=1,bind=0},--神·尊武皇天道带
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 647, count = 3},--尊武皇天道带
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--					
--					{--鞋子
--						--award=合成奖励;bind:0=不绑定.1=绑定
--						award = {type=0, id=1726, count=1,bind=0},--神·尊武皇天道靴
--						notice = false, -- 是否公告
--						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
--						rate = 10000,	-- 合成几率,万分比
--						consume =
--						{
--							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
--							-- id = 物品ID
--							-- count = 数量
--							{type = 0, id = 648, count = 3},--尊武皇天道靴
--							{type = 5, id = 0, count = 100000},--合成绑金消耗
--						},
--					},
--------------------------------------------
				},
--------------------------------------------
			},
		},
--------------------------------------------
	},
--------------------------------------------
--战将装备
--------------------------------------------
	{
--------------------------------------------
		{ 
			name="战将灵镜",
			type=4,
			synthesis=
			{
-----------------------------------
				{--战士
-----------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1728, count=1,bind=1},--灵镜·2
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1727, count = 3},--灵镜·1
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1729, count=1,bind=1},--灵镜·3
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1728, count = 3},--灵镜·2
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1730, count=1,bind=1},--灵镜·4
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1729, count = 3},--灵镜·3
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1731, count=1,bind=1},--灵镜·5
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1730, count = 3},--灵镜·4
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1732, count=1,bind=1},--灵镜·6
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1731, count = 3},--灵镜·5
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},					
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1733, count=1,bind=1},--灵镜·7
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1732, count = 3},--灵镜·6
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},	
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1734, count=1,bind=1},--灵镜·8
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1733, count = 3},--灵镜·7
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},	
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1735, count=1,bind=1},--灵镜·9
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1734, count = 3},--灵镜·8
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},	
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1736, count=1,bind=1},--灵镜·10
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1735, count = 3},--灵镜·9
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},	
				},

-----------------------------------
			},
		},
-----------------------------------
		{ 
			name="战将铃铛",
			type=4,
			synthesis=
			{
-----------------------------------
				{--战士
-----------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1738, count=1,bind=1},--铃铛·2
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1737, count = 3},--铃铛·1
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1739, count=1,bind=1},--铃铛·3
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1738, count = 3},--铃铛·2
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1740, count=1,bind=1},--铃铛·4
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1739, count = 3},--铃铛·3
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1741, count=1,bind=1},--铃铛·5
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1740, count = 3},--铃铛·4
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1742, count=1,bind=1},--铃铛·6
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1741, count = 3},--铃铛·5
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1743, count=1,bind=1},--铃铛·7
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1742, count = 3},--铃铛·6
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1744, count=1,bind=1},--铃铛·8
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1743, count = 3},--铃铛·7
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1744, count=1,bind=1},--铃铛·9
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1743, count = 3},--铃铛·8
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1745, count=1,bind=1},--铃铛·10
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1744, count = 3},--铃铛·9
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
			},
-----------------------------------
			},
		},
-----------------------------------
		{ 
			name="战将圣笛",
			type=4,
			synthesis=
			{
-----------------------------------
				{--战士
-----------------------------------
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1748, count=1,bind=1},--圣笛·2
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1747, count = 3},--圣笛·1
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1749, count=1,bind=1},--圣笛·3
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1748, count = 3},--圣笛·2
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1750, count=1,bind=1},--圣笛·4
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1749, count = 3},--圣笛·3
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1751, count=1,bind=1},--圣笛·5
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1750, count = 3},--圣笛·4
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1752, count=1,bind=1},--圣笛·6
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1751, count = 3},--圣笛·5
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1753, count=1,bind=1},--圣笛·7
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1752, count = 3},--圣笛·6
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1754, count=1,bind=1},--圣笛·8
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1753, count = 3},--圣笛·7
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1755, count=1,bind=1},--圣笛·9
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1754, count = 3},--圣笛·8
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
					{
						--award=合成奖励;bind:0=不绑定.1=绑定
						award = {type=0, id=1756, count=1,bind=1},--圣笛·10
						notice = false, -- 是否公告
						openday = 0,	-- 0表示一直显示,其他数值为新区第几天显示
						rate = 10000,	-- 合成几率,万分比
						consume =
						{
							-- type = 5绑金, 0物品, 6金币, 7绑元, 15元宝, 36能量, 37魔晶
							-- id = 物品ID
							-- count = 数量
							{type = 0, id = 1755, count = 3},--圣笛·9
							{type = 5, id = 0, count = 100000},--合成绑金消耗
						},
					},
			},
-----------------------------------
			},
		},
-----------------------------------
   },
-----------------------------------
}