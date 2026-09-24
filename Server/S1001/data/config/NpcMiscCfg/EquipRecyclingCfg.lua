--装备换金配置

EquipRecyclingCfg =
{
	-- 分组列表
	groupList = {
		-- 装备回收1 (新服7天)
		{
			title = "套装回收（1转至7转）",
			open_day = 7, -- 新服7天, -1 或不配则不限制
			list = {
				-- 套装 1
				{
					name = "霸主套装", -- 套装名称
					itemList = {430,{431,432},433,434,435,436,437,438}, -- 套装物品列表,数组内的数组表示只要有一个就可以了
					quota = 3, -- 名额，-1为不限
					award = {
						{type = 0, id = 7826, count = 10, bind = 1}, -- 金票
					},
					awardString = "  金票x10", -- 奖励物品
				},
				
				-- 套装 2
				{
					name = "通天套装",
					itemList = {439,{440,441},442,443,444,445,446,447},
					quota = 3,
					award = {
						{type = 0, id = 7826, count = 20, bind = 1}, -- 金票
					},
					awardString = "  金票x20",
				},	

				-- 套装 3
				{	name = "毁灭套装",
					itemList = {448,{449,450},451,452,453,454,455,456},
					quota = 3,
					award = {
						{type = 0, id = 7826, count = 30, bind = 1}, -- 金票
					},
					awardString = "  金票x30",
				},

				-- 套装 4
				{	name = "上古（战）套装",
					itemList = {4618,{4619,4620},4621,4622,4623,4624,4625,4626},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 40, bind = 1}, -- 金票
					},
					awardString = "金票x40",
				},

				-- 套装 5
				{	name = "上古（法）套装",
					itemList = {4627,{4628,4629},4630,4631,4632,4633,4634,4635},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 40, bind = 1}, -- 金票
					},
					awardString = "金票x40",
				},

				-- 套装 6
				{	name = "上古（道）套装",
					itemList = {4636,{4637,4638},4639,4640,4641,4642,4643,4644},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 40, bind = 1}, -- 金票
					},
					awardString = "金票x40",
				},

				-- 套装 7
				{	name = "起源（战）套装",
					itemList = {4645,{4646,4647},4648,4649,4650,4651,4652,4653},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 50, bind = 1}, -- 金票
					},
					awardString = "金票x50",
				},

				-- 套装 7
				{	name = "起源（法）套装",
					itemList = {4654,{4655,4656},4657,4658,4659,4660,4661,4662},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 50, bind = 1}, -- 金票
					},
					awardString = "金票x50",
				},

				-- 套装 8
				{	name = "起源（道）套装",
					itemList = {4663,{4664,4665},4666,4667,4668,4669,4670,4671},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 50, bind = 1}, -- 金票
					},
					awardString = "金票x50",
				},

				-- 套装 9
				{	name = "誓言（战）套装",
					itemList = {4672,{4673,4674},4675,4676,4677,4678,4679,4680},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 60, bind = 1}, -- 金票
					},
					awardString = "金票x60",
				},

				-- 套装 10
				{	name = "誓言（法）套装",
					itemList = {4681,{4682,4683},4684,4685,4686,4687,4688,4689},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 60, bind = 1}, -- 金票
					},
					awardString = "金票x60",
				},

				-- 套装 11
				{	name = "誓言（道）套装",
					itemList = {4690,{4691,4692},4693,4694,4695,4696,4697,4698},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 60, bind = 1}, -- 金票
					},
					awardString = "金票x60",
				},

				-- 套装 12
				{	name = "冲天（战）套装",
					itemList = {87,{88,89},90,91,92,93,94,95},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 100, bind = 1}, -- 金票
					},
					awardString = "金票x100",
				},

				-- 套装 13
				{	name = "冲天（法）套装",
					itemList = {96,{97,98},99,100,101,102,103,104},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 100, bind = 1}, -- 金票
					},
					awardString = "金票x100",
				},

				-- 套装 14
				{	name = "冲天（道）套装",
					itemList = {105,{106,107},108,109,110,111,112,113},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 100, bind = 1}, -- 金票
					},
					awardString = "金票x100",
				},				
			},
		},
		
		-- 装备回收2 (新服7天)
		{
			title = "套装回收（8转至10转）",
			open_day = 7, -- 新服7天, -1 或不配则不限制
			list = {
				-- 套装 15
				{	name = "菩提套装·战士",
					itemList = {114,{115,116},117,118,119,120,121,122},
					quota = 1,
					award = {
						{type = 0, id = 6936, count = 1, bind = 1}, -- 金票
					},
					awardString = "至尊屠龙首饰盒x1",
				},

				-- 套装 16
				{	name = "菩提套装·法师",
					itemList = {123,{124,125},126,127,128,129,130,131},
					quota = 1,
					award = {
						{type = 0, id = 6936, count = 1, bind = 1}, -- 金票
					},
					awardString = "至尊屠龙首饰盒x1",
				},

				-- 套装 17
				{	name = "菩提套装·道士",
					itemList = {132,{133,134},135,136,137,138,139,140},
					quota = 1,
					award = {
						{type = 0, id = 6936, count = 1, bind = 1}, -- 金票
					},
					awardString = "至尊屠龙首饰盒x1",
				},

				-- 套装 18
				{	name = "无尘套装",
					itemList = {{141,150,159},{142,143,151,152,160,161},{144,153,162},{145,154,163},{146,155,164},{147,156,165},{148,157,166},{149,158,167}},
					quota = 1,
					award = {
						{type = 0, id = 6945, count = 1, bind = 1, sex = 0}, -- 金票
						{type = 0, id = 6946, count = 1, bind = 1, sex = 1}, -- 金票
					},
					awardString = "至尊屠龙衣x1",
				},

				-- 套装 19
				{	name = "芙蓉套装",
					itemList = {{168,177,186},{169,170,177,178,187,188},{171,180,189},{172,181,190},{173,182,191},{174,183,192},{175,184,193},{176,184,193}},
					quota = 1,
					award = {
						{type = 0, id = 6362, count = 1, bind = 1, sex = 0}, -- 金票
					},
					awardString = "至尊屠龙刀x1",
				},
			},
		},
		
		-- 装备回收3 (新服7天)
		{
			title = "符文回收",
			open_day = 7, -- 新服7天, -1 或不配则不限制
			list = {
				-- 1转符文套装
				{	name = "1转符文套装",
					itemList = {3551,3552,3553,3554,3555,3556,3557,3558},
					quota = 3,
					award = {
						{type = 0, id = 7826, count = 10, bind = 1}, -- 金票
					},
					awardString = "金票x10",
				},

				-- 2转符文套装
				{	name = "2转符文套装",
					itemList = {3559,3560,3561,3562,3563,3564,3565,3566},
					quota = 3,
					award = {
						{type = 0, id = 7826, count = 20, bind = 1}, -- 金票
					},
					awardString = "金票x20",
				},

				-- 3转符文套装
				{	name = "3转符文套装",
					itemList = {3567,3568,3569,3570,3571,3572,3573,3574},
					quota = 3,
					award = {
						{type = 0, id = 7826, count = 30, bind = 1}, -- 金票
					},
					awardString = "金票x30",
				},

				-- 4转符文套装
				{	name = "4转符文套装",
					itemList = {3575,3576,3577,3578,3579,3580,3581,3582},
					quota = 3,
					award = {
						{type = 0, id = 7826, count = 40, bind = 1}, -- 金票
					},
					awardString = "金票x40",
				},

				-- 5转符文套装
				{	name = "5转符文套装",
					itemList = {3583,3584,3585,3586,3587,3588,3589,3590},
					quota = 3,
					award = {
						{type = 0, id = 7826, count = 50, bind = 1}, -- 金票
					},
					awardString = "金票x50",
				},

				-- 6转符文套装
				{	name = "6转符文套装",
					itemList = {3591,3592,3593,3594,3595,3596,3597,3598},

					quota = 3,
					award = {
						{type = 0, id = 7826, count = 60, bind = 1}, -- 金票
					},
					awardString = "金票x60",
				},

				-- 7转符文套装
				{	name = "7转符文套装",
					itemList = {3599,3600,3601,3602,3603,3604,3605,3606},

					quota = 3,
					award = {
						{type = 0, id = 7826, count = 100, bind = 1}, -- 金票
					},
					awardString = "金票x100",
				},

				-- 9转符文套装
				{	name = "9转符文套装",
					itemList = {3607,3608,3609,3610,3611,3612,3613,3614},

					quota = 3,
					award = {
						{type = 0, id = 7826, count = 200, bind = 1}, -- 金票
					},
					awardString = "金票x200",
				},

				-- 11转符文套装
				{	name = "11转符文套装",
					itemList = {3615,3616,3617,3618,3619,3620,3621,3622},

					quota = 3,
					award = {
						{type = 0, id = 7826, count = 300, bind = 1}, -- 金票
					},
					awardString = "金票x300",
				},
			},
		},
		
		-- 1 转装备
		{
			title = "霸主套装",
			list = {
				-- 套装 1
				{
					name = "霸主血刃", -- 套装名称
					itemList = {430}, -- 套装物品列表,数组内的数组表示只要有一个就可以了
					quota = 1, -- 名额，-1为不限
					award = {
						{type = 0, id = 7826, count = 2, bind = 1}, -- 金票
					},
					awardString = "金票x2", -- 奖励物品
				},
				
				-- 套装 2
				{
					name = "霸主血甲",
					itemList = {{431,432}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 2, bind = 1}, -- 金票
					},
					awardString = "金票x2", -- 奖励物品
				},
				
				-- 套装 3
				{
					name = "霸主血盔",
					itemList = {433},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 1, bind = 1}, -- 金票
					},
					awardString = "金票x1", -- 奖励物品
				},

				-- 套装 4
				{
					name = "霸主血链",
					itemList = {434},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 1, bind = 1}, -- 金票
					},
					awardString = "金票x1", -- 奖励物品
				},

				-- 套装 5
				{
					name = "霸主血镯",
					itemList = {435},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 1, bind = 1}, -- 金票
					},
					awardString = "金票x1", -- 奖励物品
				},

				-- 套装 6
				{
					name = "霸主血戒",
					itemList = {436},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 1, bind = 1}, -- 金票
					},
					awardString = "金票x1", -- 奖励物品
				},

				-- 套装 7
				{
					name = "霸主血带",
					itemList = {437},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 1, bind = 1}, -- 金票
					},
					awardString = "金票x1", -- 奖励物品
				},

				-- 套装 8
				{
					name = "霸主血靴",
					itemList = {438},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 1, bind = 1}, -- 金票
					},
					awardString = "金票x1", -- 奖励物品
				},
			},
		},
		
		-- 2 转装备
		{
			title = "通天套装",
			list = {
				-- 套装 1
				{
					name = "通天神剑", -- 套装名称
					itemList = {439}, -- 套装物品列表,数组内的数组表示只要有一个就可以了
					quota = 1, -- 名额，-1为不限
					award = {
						{type = 0, id = 7826, count = 3, bind = 1}, -- 金票
					},
					awardString = "金票x3", -- 奖励物品
				},
				
				-- 套装 2
				{
					name = "通天神甲",
					itemList = {{440,441}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 3, bind = 1}, -- 金票
					},
					awardString = "金票x3", -- 奖励物品
				},
				
				-- 套装 3
				{
					name = "通天神盔",
					itemList = {442},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 2, bind = 1}, -- 金票
					},
					awardString = "金票x2", -- 奖励物品
				},

				-- 套装 4
				{
					name = "通天神链",
					itemList = {443},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 2, bind = 1}, -- 金票
					},
					awardString = "金票x2", -- 奖励物品
				},

				-- 套装 5
				{
					name = "通天神镯",
					itemList = {444},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 2, bind = 1}, -- 金票
					},
					awardString = "金票x2", -- 奖励物品
				},

				-- 套装 6
				{
					name = "通天神戒",
					itemList = {445},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 2, bind = 1}, -- 金票
					},
					awardString = "金票x2", -- 奖励物品
				},

				-- 套装 7
				{
					name = "通天神带",
					itemList = {446},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 2, bind = 1}, -- 金票
					},
					awardString = "金票x2", -- 奖励物品
				},

				-- 套装 8
				{
					name = "通天神靴",
					itemList = {447},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 2, bind = 1}, -- 金票
					},
					awardString = "金票x2", -- 奖励物品
				},
			},
		},
		
		-- 3 转装备
		{
			title = "毁灭套装",
			list = {
				-- 套装 1
				{
					name = "毁灭灵斩", -- 套装名称
					itemList = {448}, -- 套装物品列表,数组内的数组表示只要有一个就可以了
					quota = 1, -- 名额，-1为不限
					award = {
						{type = 0, id = 7826, count = 4, bind = 1}, -- 金票
					},
					awardString = "金票x4", -- 奖励物品
				},
				
				-- 套装 2
				{
					name = "毁灭灵甲",
					itemList = {{449,450}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 4, bind = 1}, -- 金票
					},
					awardString = "金票x4", -- 奖励物品
				},
				
				-- 套装 3
				{
					name = "毁灭灵盔",
					itemList = {451},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 3, bind = 1}, -- 金票
					},
					awardString = "金票x3", -- 奖励物品
				},

				-- 套装 4
				{
					name = "毁灭灵链",
					itemList = {452},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 3, bind = 1}, -- 金票
					},
					awardString = "金票x3", -- 奖励物品
				},

				-- 套装 5
				{
					name = "毁灭灵镯",
					itemList = {453},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 3, bind = 1}, -- 金票
					},
					awardString = "金票x3", -- 奖励物品
				},

				-- 套装 6
				{
					name = "毁灭灵戒",
					itemList = {454},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 3, bind = 1}, -- 金票
					},
					awardString = "金票x3", -- 奖励物品
				},

				-- 套装 7
				{
					name = "毁灭灵带",
					itemList = {455},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 3, bind = 1}, -- 金票
					},
					awardString = "金票x3", -- 奖励物品
				},

				-- 套装 8
				{
					name = "毁灭灵靴",
					itemList = {456},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 3, bind = 1}, -- 金票
					},
					awardString = "金票x3", -- 奖励物品
				},
			},
		},

		-- 4 转装备
		{
			title = "上古套装",
			list = {
				-- 套装 1
				{
					name = "上古武器", -- 套装名称
					itemList = {{4618,4627,4636}}, -- 套装物品列表,数组内的数组表示只要有一个就可以了
					quota = 1, -- 名额，-1为不限
					award = {
						{type = 0, id = 7826, count = 7, bind = 1}, -- 金票
					},
					awardString = "金票x7", -- 奖励物品
				},
				
				-- 套装 2
				{
					name = "上古衣服",
					itemList = {{4619,4628,4637,4620,4629,4638}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 7, bind = 1}, -- 金票
					},
					awardString = "金票x7", -- 奖励物品
				},
				
				-- 套装 3
				{
					name = "上古头盔",
					itemList = {{4621,4630,4639}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 5, bind = 1}, -- 金票
					},
					awardString = "金票x5", -- 奖励物品
				},

				-- 套装 4
				{
					name = "上古项链",
					itemList = {{4622,4631,4640}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 5, bind = 1}, -- 金票
					},
					awardString = "金票x5", -- 奖励物品
				},

				-- 套装 5
				{
					name = "上古手镯",
					itemList = {{4623,4632,4641}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 5, bind = 1}, -- 金票
					},
					awardString = "金票x5", -- 奖励物品
				},

				-- 套装 6
				{
					name = "上古戒指",
					itemList = {{4624,4633,4642}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 5, bind = 1}, -- 金票
					},
					awardString = "金票x5", -- 奖励物品
				},

				-- 套装 7
				{
					name = "上古腰带",
					itemList = {{4625,4634,4643}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 5, bind = 1}, -- 金票
					},
					awardString = "金票x5", -- 奖励物品
				},

				-- 套装 8
				{
					name = "上古鞋子",
					itemList = {{4626,4635,4644}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 5, bind = 1}, -- 金票
					},
					awardString = "金票x5", -- 奖励物品
				},
			},
		},
		
		-- 5 转装备
		{
			title = "起源套装",
			list = {
				-- 套装 1
				{
					name = "起源武器", -- 套装名称
					itemList = {{4645,4654,4663}}, -- 套装物品列表,数组内的数组表示只要有一个就可以了
					quota = 1, -- 名额，-1为不限
					award = {
						{type = 0, id = 7826, count = 13, bind = 1}, -- 金票
					},
					awardString = "金票x13", -- 奖励物品
				},
				
				-- 套装 2
				{
					name = "起源衣服",
					itemList = {{4646,4655,4664,4647,4656,4665}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 13, bind = 1}, -- 金票
					},
					awardString = "金票x13", -- 奖励物品
				},
				
				-- 套装 3
				{
					name = "起源头盔",
					itemList = {{4648,4657,4666}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 10, bind = 1}, -- 金票
					},
					awardString = "金票x10", -- 奖励物品
				},

				-- 套装 4
				{
					name = "起源项链",
					itemList = {{4649,4658,4667}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 10, bind = 1}, -- 金票
					},
					awardString = "金票x10", -- 奖励物品
				},

				-- 套装 5
				{
					name = "起源手镯",
					itemList = {{4650,4659,4668}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 10, bind = 1}, -- 金票
					},
					awardString = "金票x10", -- 奖励物品
				},

				-- 套装 6
				{
					name = "起源戒指",
					itemList = {{4651,4660,4669}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 10, bind = 1}, -- 金票
					},
					awardString = "金票x10", -- 奖励物品
				},

				-- 套装 7
				{
					name = "起源腰带",
					itemList = {{4652,4661,4670}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 10, bind = 1}, -- 金票
					},
					awardString = "金票x10", -- 奖励物品
				},

				-- 套装 8
				{
					name = "起源鞋子",
					itemList = {{4653,4662,4671}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 10, bind = 1}, -- 金票
					},
					awardString = "金票x10", -- 奖励物品
				},
			},
		},

		-- 6 转装备
		{
			title = "誓言套装",
			list = {
				-- 套装 1
				{
					name = "誓言武器", -- 套装名称
					itemList = {{4672,4681,4690}}, -- 套装物品列表,数组内的数组表示只要有一个就可以了
					quota = 1, -- 名额，-1为不限
					award = {
						{type = 0, id = 7826, count = 18, bind = 1}, -- 金票
					},
					awardString = "金票x18", -- 奖励物品
				},
				
				-- 套装 2
				{
					name = "誓言衣服",
					itemList = {{4673,4682,4691,4674,4683,4692}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 18, bind = 1}, -- 金票
					},
					awardString = "金票x18", -- 奖励物品
				},
				
				-- 套装 3
				{
					name = "誓言头盔",
					itemList = {{4675,4684,4693}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 15, bind = 1}, -- 金票
					},
					awardString = "金票x15", -- 奖励物品
				},

				-- 套装 4
				{
					name = "誓言项链",
					itemList = {{4676,4685,4694}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 15, bind = 1}, -- 金票
					},
					awardString = "金票x15", -- 奖励物品
				},

				-- 套装 5
				{
					name = "誓言手镯",
					itemList = {{4677,4686,4695}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 15, bind = 1}, -- 金票
					},
					awardString = "金票x15", -- 奖励物品
				},

				-- 套装 6
				{
					name = "誓言戒指",
					itemList = {{4678,4687,4696}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 15, bind = 1}, -- 金票
					},
					awardString = "金票x15", -- 奖励物品
				},

				-- 套装 7
				{
					name = "誓言腰带",
					itemList = {{4679,4688,4697}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 15, bind = 1}, -- 金票
					},
					awardString = "金票x15", -- 奖励物品
				},

				-- 套装 8
				{
					name = "誓言鞋子",
					itemList = {{4680,4689,4698}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 15, bind = 1}, -- 金票
					},
					awardString = "金票x15", -- 奖励物品
				},
			},
		},

		-- 7 转装备
		{
			title = "冲天套装",
			list = {
				-- 套装 1
				{
					name = "冲天武器", -- 套装名称
					itemList = {{87,96,105}}, -- 套装物品列表,数组内的数组表示只要有一个就可以了
					quota = 1, -- 名额，-1为不限
					award = {
						{type = 0, id = 7826, count = 38, bind = 1}, -- 金票
					},
					awardString = "金票x38", -- 奖励物品
				},
				
				-- 套装 2
				{
					name = "冲天衣服",
					itemList = {{88,97,106,89,98,107}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 38, bind = 1}, -- 金票
					},
					awardString = "金票x38", -- 奖励物品
				},
				
				-- 套装 3
				{
					name = "冲天头盔",
					itemList = {{90,99,108}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 20, bind = 1}, -- 金票
					},
					awardString = "金票x20", -- 奖励物品
				},

				-- 套装 4
				{
					name = "冲天项链",
					itemList = {{91,100,109}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 20, bind = 1}, -- 金票
					},
					awardString = "金票x20", -- 奖励物品
				},

				-- 套装 5
				{
					name = "冲天手镯",
					itemList = {{92,101,110}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 20, bind = 1}, -- 金票
					},
					awardString = "金票x20", -- 奖励物品
				},

				-- 套装 6
				{
					name = "冲天戒指",
					itemList = {{93,102,111}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 20, bind = 1}, -- 金票
					},
					awardString = "金票x20", -- 奖励物品
				},

				-- 套装 7
				{
					name = "冲天腰带",
					itemList = {{94,103,112}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 20, bind = 1}, -- 金票
					},
					awardString = "金票x20", -- 奖励物品
				},

				-- 套装 8
				{
					name = "冲天鞋子",
					itemList = {{95,104,113}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 20, bind = 1}, -- 金票
					},
					awardString = "金票x20", -- 奖励物品
				},
			},
		},

		-- 9 转装备
		{
			title = "菩提套装",
			list = {
				-- 套装 1
				{
					name = "菩提武器", -- 套装名称
					itemList = {{114,123,132}}, -- 套装物品列表,数组内的数组表示只要有一个就可以了
					quota = 1, -- 名额，-1为不限
					award = {
						{type = 0, id = 7826, count = 88, bind = 1}, -- 金票
					},
					awardString = "金票x88", -- 奖励物品
				},
				
				-- 套装 2
				{
					name = "菩提衣服",
					itemList = {{115,124,133,116,125,134}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 88, bind = 1}, -- 金票
					},
					awardString = "金票x88", -- 奖励物品
				},
				
				-- 套装 3
				{
					name = "菩提头盔",
					itemList = {{117,126,135}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 50, bind = 1}, -- 金票
					},
					awardString = "金票x50", -- 奖励物品
				},

				-- 套装 4
				{
					name = "菩提项链",
					itemList = {{118,127,136}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 50, bind = 1}, -- 金票
					},
					awardString = "金票x50", -- 奖励物品
				},

				-- 套装 5
				{
					name = "菩提手镯",
					itemList = {{119,128,137}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 50, bind = 1}, -- 金票
					},
					awardString = "金票x50", -- 奖励物品
				},

				-- 套装 6
				{
					name = "菩提戒指",
					itemList = {{120,129,138}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 50, bind = 1}, -- 金票
					},
					awardString = "金票x50", -- 奖励物品
				},

				-- 套装 7
				{
					name = "菩提腰带",
					itemList = {{121,130,139}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 50, bind = 1}, -- 金票
					},
					awardString = "金票x50", -- 奖励物品
				},

				-- 套装 8
				{
					name = "菩提鞋子",
					itemList = {{122,131,140}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 50, bind = 1}, -- 金票
					},
					awardString = "金票x50", -- 奖励物品
				},
			},
		},

		-- 11 转装备
		{
			title = "无尘套装",
			list = {
				-- 套装 1
				{
					name = "无尘武器", -- 套装名称
					itemList = {{141,150,159}},
					quota = 1, -- 名额，-1为不限
					award = {
						{type = 0, id = 7826, count = 168, bind = 1}, -- 金票
					},
					awardString = "金票x168", -- 奖励物品
				},
				
				-- 套装 2
				{
					name = "无尘衣服",
					itemList = {{142,151,160,143,152,161}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 168, bind = 1}, -- 金票
					},
					awardString = "金票x168", -- 奖励物品
				},
				
				-- 套装 3
				{
					name = "无尘头盔",
					itemList = {{144,153,162}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 100, bind = 1}, -- 金票
					},
					awardString = "金票x100", -- 奖励物品
				},

				-- 套装 4
				{
					name = "无尘项链",
					itemList = {{145,154,163}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 100, bind = 1}, -- 金票
					},
					awardString = "金票x100", -- 奖励物品
				},

				-- 套装 5
				{
					name = "无尘手镯",
					itemList = {{146,155,164}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 100, bind = 1}, -- 金票
					},
					awardString = "金票x100", -- 奖励物品
				},

				-- 套装 6
				{
					name = "无尘戒指",
					itemList = {{147,156,165}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 100, bind = 1}, -- 金票
					},
					awardString = "金票x100", -- 奖励物品
				},

				-- 套装 7
				{
					name = "无尘腰带",
					itemList = {{148,157,166}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 100, bind = 1}, -- 金票
					},
					awardString = "金票x100", -- 奖励物品
				},

				-- 套装 8
				{
					name = "无尘鞋子",
					itemList = {{149,158,167}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 100, bind = 1}, -- 金票
					},
					awardString = "金票x100", -- 奖励物品
				},
			},
		},

		-- 13 转装备
		{
			title = "芙蓉套装",
			list = {
				-- 套装 1
				{
					name = "芙蓉武器", -- 套装名称
					itemList = {{168,177,186}},
					quota = 1, -- 名额，-1为不限
					award = {
						{type = 0, id = 7826, count = 388, bind = 1}, -- 金票
					},
					awardString = "金票x388", -- 奖励物品
				},
				
				-- 套装 2
				{
					name = "芙蓉衣服",
					itemList = {{169,178,187,170,179,188}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 388, bind = 1}, -- 金票
					},
					awardString = "金票x388", -- 奖励物品
				},
				
				-- 套装 3
				{
					name = "芙蓉头盔",
					itemList = {{171,180,189}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 200, bind = 1}, -- 金票
					},
					awardString = "金票x200", -- 奖励物品
				},

				-- 套装 4
				{
					name = "芙蓉项链",
					itemList = {{172,181,190}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 200, bind = 1}, -- 金票
					},
					awardString = "金票x200", -- 奖励物品
				},

				-- 套装 5
				{
					name = "芙蓉手镯",
					itemList = {{173,182,191}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 200, bind = 1}, -- 金票
					},
					awardString = "金票x200", -- 奖励物品
				},

				-- 套装 6
				{
					name = "芙蓉戒指",
					itemList = {{174,183,192}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 200, bind = 1}, -- 金票
					},
					awardString = "金票x200", -- 奖励物品
				},

				-- 套装 7
				{
					name = "芙蓉腰带",
					itemList = {{175,184,193}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 200, bind = 1}, -- 金票
					},
					awardString = "金票x200", -- 奖励物品
				},

				-- 套装 8
				{
					name = "芙蓉鞋子",
					itemList = {{176,185,194}},
					quota = 1,
					award = {
						{type = 0, id = 7826, count = 200, bind = 1}, -- 金票
					},
					awardString = "金票x200", -- 奖励物品
				},
			},
		},
	},
		
	-- 首杀 BOSS 列表 (新服7天)
	firstKillBossList = {
		-------------------------- 1-2转
		{
			{
				bossId = 715, -- BOSS ID
				bossName = "祖玛教主", -- BOSS 名称
				mailAward = "7826,1,1", -- 邮件方式奖励
				awardString = "金票x1", -- 奖励物品
			},
			{
				bossId = 956, -- BOSS ID
				bossName = "地狱死神", -- BOSS 名称
				mailAward = "7826,1,1", -- 邮件方式奖励
				awardString = "金票x1", -- 奖励物品
			},
			{
				bossId = 716,
				bossName = "牛 魔 王",
				mailAward = "7826,1,1", -- 邮件方式奖励
				awardString = "    金票x1", -- 奖励物品
			},
			{
				bossId = 957,
				bossName = "赤 火 怪",
				mailAward = "7826,1,1", -- 邮件方式奖励
				awardString = "    金票x1", -- 奖励物品
			},

			{
				bossId = 717,
				bossName = "玛雅教主",
				mailAward = "7826,1,1", -- 邮件方式奖励
				awardString = "金票x1", -- 奖励物品
			},
			{
				bossId = 958,
				bossName = "蚩尤酋长",
				mailAward = "7826,1,1", -- 邮件方式奖励
				awardString = "金票x1", -- 奖励物品
			},
			{
				bossId = 1295,
				bossName = "飞天牛魔",
				mailAward = "7826,1,1", -- 邮件方式奖励
				awardString = "金票x1", -- 奖励物品
			},			
		},
		----------------------------------------3 转
		{
			{
				bossId = 718,
				bossName = "魔龙教主",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "金票x2", -- 奖励物品
			},
			{
				bossId = 959,
				bossName = "蝎 子 王",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "    金票x2", -- 奖励物品
			},
			{
				bossId = 1298,
				bossName = "万蛇妖王",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "金票x2", -- 奖励物品
			},
			{
				bossId = 819,
				bossName = "蚁    后",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "    金票x2", -- 奖励物品
			},	
			{
				bossId = 725,
				bossName = "炼狱教主",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "金票x2", -- 奖励物品
			},
			{
				bossId = 960,
				bossName = "德玛大将",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "金票x2", -- 奖励物品
			},	
			{
				bossId = 814,
				bossName = "水晶骑士",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "金票x2", -- 奖励物品
			},	
			{
				bossId = 1299,
				bossName = "神罗金刚",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "金票x2", -- 奖励物品
			},
			{
				bossId = 726,
				bossName = "神龙教主",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "金票x2", -- 奖励物品
			},	
			{
				bossId = 961,
				bossName = "冥 兽 王",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "    金票x2", -- 奖励物品
			},
			{
				bossId = 815,
				bossName = "玄武大帝",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "金票x2", -- 奖励物品
			},
			{
				bossId = 1308,
				bossName = "火山石怪",
				mailAward = "7826,2,1", -- 邮件方式奖励
				awardString = "金票x2", -- 奖励物品
			},
		},
		---------------------------------------- 4-13转
		{	
			{
				bossId = 734,
				bossName = "九尾妖狐",
				mailAward = "7826,3,1", -- 邮件方式奖励
				awardString = "金票x3", -- 奖励物品
			},	
			{
				bossId = 962,
				bossName = "魔君统帅",
				mailAward = "7826,3,1", -- 邮件方式奖励
				awardString = "金票x3", -- 奖励物品
			},
			{
				bossId = 1311,
				bossName = "双头魔王",
				mailAward = "7826,3,1", -- 邮件方式奖励
				awardString = "金票x3", -- 奖励物品
			},
			{
				bossId = 734,
				bossName = "烈沙领主",
				mailAward = "7826,3,1", -- 邮件方式奖励
				awardString = "金票x3", -- 奖励物品
			},
			{
				bossId = 735,
				bossName = "雷炎蜘蛛",
				mailAward = "7826,4,1", -- 邮件方式奖励
				awardString = "金票x4", -- 奖励物品
			},
			{
				bossId = 1270,
				bossName = "魔炎蜘蛛",
				mailAward = "7826,4,1", -- 邮件方式奖励
				awardString = "金票x4", -- 奖励物品
			},
			{
				bossId = 817,
				bossName = "混沌至尊",
				mailAward = "7826,4,1", -- 邮件方式奖励
				awardString = "金票x4", -- 奖励物品
			},	
			{
				bossId = 736,
				bossName = "雪域魔王",
				mailAward = "7826,5,1", -- 邮件方式奖励
				awardString = "金票x5", -- 奖励物品
			},
			{
				bossId = 1271,
				bossName = "雪域魔将",
				mailAward = "7826,5,1", -- 邮件方式奖励
				awardString = "金票x5", -- 奖励物品
			},
			{
				bossId = 95,
				bossName = "冰    龙",
				mailAward = "7826,5,1", -- 邮件方式奖励
				awardString = "    金票x5", -- 奖励物品
			},
			{
				bossId = 1278,
				bossName = "地心炼狱",
				mailAward = "7826,5,1", -- 邮件方式奖励
				awardString = "金票x5", -- 奖励物品
			},
			{
				bossId = 1314,
				bossName = "万 兽 王",
				mailAward = "7826,5,1", -- 邮件方式奖励
				awardString = "    金票x5", -- 奖励物品
			},
			{
				bossId = 13466,
				bossName = "奇肱之蛇",
				mailAward = "7826,5,1", -- 邮件方式奖励
				awardString = "金票x6", -- 奖励物品
			},	
		},
	},
}