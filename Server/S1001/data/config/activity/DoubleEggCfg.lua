DoubleEggCfg = 
{
	--活动时间（开始-结束(包括结束当天)）
	time = {2015,12,25, 2016,1,3},
	
	-- 每日充值礼包
	PayGift = 
	{
		needMoney = 10000,  --需要充值元宝
		award = 
		{
			-- {type = 0, id = 652, count = 1, bind = 1},--疯狂苹果 X 1
			-- {type = 0, id = 700, count = 1, bind = 1},--20万灵力丹*1
			-- {type = 0, id = 696, count = 2, bind = 1},--翅膀魂石宝箱*2
			-- {type = 0, id = 846, count = 1, bind = 1},--4倍经验卷1小时*1
			-- {type = 0, id = 509, count = 3, bind = 1},--金条(大) X 3
		}
	},
	
	-- 登陆活动
	Login = {	
		needLevel = 75, -- 需求等级
			
		-- 奖励
		award = { 
			-- 	{type = 0, id = 513, count = 1, bind = 1},--经验丹大*1
		    --       {type = 0, id = 506, count = 1, bind = 1}, --2倍经验卷8小时*1
			--   {type = 0, id = 541, count = 4, bind = 1}, --精羽毛*4
			--   {type = 0, id = 507, count = 2, bind = 1}, --金条小*2
			--   {type = 0, id = 536, count = 4, bind = 1}, --符魄盒大*4
			 
			  }, 
	},
	
	-- 寻宝
	Dmkj = {
		needTimes = { 100, 200, 500 }, -- 次数
		
		items = {
			-- { {type = 0, id = 893, count = 1, bind = 1},}, -- 100 次
			-- { {type = 0, id = 894, count = 1, bind = 1},}, -- 200 次
			-- { {type = 0, id = 895, count = 1, bind = 1},}, -- 500 次
		},
	},
	
	-- 超值礼包
	SuperBag = {
		{
			money = 1888,--价值60元
			items = 
			{
				-- {type = 0, id = 520, count = 1, bind = 1},--1000绑定元宝   ---5元		
				-- {type = 0, id = 542, count = 1, bind = 1},--转生修为丹小   ---10元	
				-- {type = 0, id = 562, count = 1, bind = 1},--高级圣魂丹     ---20元
				-- {type = 0, id = 700, count = 1, bind = 1},--20万灵力丹     ---18元
				-- {type = 0, id = 458, count = 1, bind = 1},--狂暴通行证     ---8元
			},
		},
		{
			money = 3888,--价值120元
			items = 
			{
				-- {type = 0, id = 520, count = 2, bind = 1},--1000绑定元宝   ---10元		
				-- {type = 0, id = 543, count = 1, bind = 1},--转生修为丹中   ---20元	
				-- {type = 0, id = 562, count = 2, bind = 1},--高级圣魂丹     ---40元
				-- {type = 0, id = 701, count = 1, bind = 1},--50万灵力丹     ---40元
				-- {type = 0, id = 458, count = 2, bind = 1},--狂暴通行证     ---16元
			},
		},
		{
			money = 8888,--价值250元
			items = 
			{
				-- {type = 0, id = 520, count = 4, bind = 1},--1000绑定元宝   ---20元		
				-- {type = 0, id = 544, count = 1, bind = 1},--转生修为丹高   ---60元	
				-- {type = 0, id = 563, count = 1, bind = 1},--超级圣魂丹     ---100元
				-- {type = 0, id = 702, count = 1, bind = 1},--100万灵力丹     ---80元
				-- {type = 0, id = 458, count = 4, bind = 1},--狂暴通行证     ---32元	 
			},
		},	
	},
	
	-- 圣诞树许愿活动
	Shop = {
		wish = { {5,9}, {20,7}, {100,5} }, -- 每次许愿 {消耗元宝,折扣}
		
		-- 不能超过255个物品, rnd 概率为万分比
		items = {
			-- {type = 0, id = 562, count = 1, bind = 1, price = 2000, rnd = {9000,9000,9000}},--高级圣魂丹
			-- {type = 0, id = 563, count = 1, bind = 1, price = 10000, rnd = {9000,9000,9000}},--超级圣魂丹
			-- {type = 0, id = 542, count = 1, bind = 1, price = 1000, rnd = {9000,9000,9000}},--转生修为丹小
			-- {type = 0, id = 543, count = 1, bind = 1, price = 2000, rnd = {9000,9000,9000}},--转生修为丹中
			-- {type = 0, id = 544, count = 1, bind = 1, price = 6000, rnd = {9000,9000,9000}},--转生修为丹高
			-- {type = 0, id = 520, count = 10, bind = 1, price = 5000, rnd = {9000,9000,9000}},--1000绑定元宝
			-- {type = 0, id = 458, count = 5, bind = 1, price = 4000, rnd = {9000,9000,9000}},--狂暴通行证
			-- {type = 0, id = 451, count = 1, bind = 1, price = 2000, rnd = {9000,9000,9000}},--佣兵经验卷
			-- {type = 0, id = 677, count = 5, bind = 1, price = 3000, rnd = {9000,9000,9000}},--超级金币箱
			-- {type = 0, id = 530, count = 5, bind = 1, price = 5000, rnd = {9000,9000,9000}},--盾灵卷轴
			-- {type = 0, id = 540, count = 6, bind = 1, price = 3000, rnd = {9000,9000,9000}},--历练卷轴
			-- {type = 0, id = 679, count = 20, bind = 1, price = 2400, rnd = {9000,9000,9000}},--屠魔令
			-- {type = 0, id = 702, count = 1, bind = 1, price = 9000, rnd = {9000,9000,9000}},--100万灵力丹
			-- {type = 0, id = 701, count = 1, bind = 1, price = 4500, rnd = {9000,9000,9000}},--50万灵力丹
			-- {type = 0, id = 700, count = 1, bind = 1, price = 1800, rnd = {9000,9000,9000}},--20万灵力丹
			-- {type = 0, id = 687, count = 5, bind = 1, price = 3000, rnd = {9000,9000,9000}},--翅膀魂石(攻)
			-- {type = 0, id = 688, count = 5, bind = 1, price = 3000, rnd = {9000,9000,9000}},--翅膀魂石(防)
			-- {type = 0, id = 689, count = 5, bind = 1, price = 3000, rnd = {9000,9000,9000}},--翅膀魂石(血)
			-- {type = 0, id = 817, count = 1, bind = 1, price = 2000, rnd = {9000,9000,9000}},--灵珠碎片(中)
			-- {type = 0, id = 836, count = 1, bind = 1, price = 20000, rnd = {9000,9000,9000}},--灵珠碎片(大)
			-- {type = 0, id = 538, count = 1, bind = 1, price = 5000, rnd = {9000,9000,9000}},--宝石碎片(中)
			-- {type = 0, id = 528, count = 1, bind = 1, price = 5000, rnd = {9000,9000,9000}},--特戒结晶(中)
			-- {type = 0, id = 812, count = 1, bind = 1, price = 2000, rnd = {9000,9000,9000}},--6倍押镖令
			-- {type = 0, id = 652, count = 3, bind = 1, price = 3000, rnd = {9000,9000,9000}},--疯狂苹果
			
		},
	},
	
	-- 疯狂苹果
	AppleBuff = {
		{ type=6, value=0.05 },--HP倍数
		{ type=23, value=500 },--最大物防
		{ type=27, value=500 },--最大魔防
		{ type=11, value=500 },--最大物攻
		{ type=15, value=500 },--最大魔攻
		{ type=19, value=500 },--最大道攻
	
	},
}