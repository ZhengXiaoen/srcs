-- 庆典活动配置--寻宝

treasure_hunt_cfg = 
{
	-- 中秋月饼收集活动
	moon_activity = {
		open_time = {2018,9,24, 2018,9,28}, -- 开启时间		
		moon_id = 7657, -- 月饼物品ID
		-- 兑换列表
		list = {
			{ moon_count = 10, award = { 
				{type = 0, id = 678, count = 20,bind = 1},
				{type = 0, id = 513, count = 1,bind = 1},
				{type = 0, id = 5455, count = 1,bind = 1}
				} },
			{ moon_count = 30, award = { 
				{type = 0, id = 678, count = 80,bind = 1},
				{type = 0, id = 513, count = 4,bind = 1},
				{type = 0, id = 5455, count = 4,bind = 1}
				} },
			{ moon_count = 50, award = { 
				{type = 0, id = 678, count = 160,bind = 1},
				{type = 0, id = 513, count = 8,bind = 1},
				{type = 0, id = 5455, count = 8,bind = 1}
				} },
			{ moon_count = 100, award = { 
				{type = 0, id = 678, count = 360,bind = 1},
				{type = 0, id = 513, count = 18,bind = 1},
				{type = 0, id = 5455, count = 18,bind = 1}
				} },	
		},		
	},
	
	-- 寻宝赠送豪礼
	hunt_times = {		
		{ times = 1000, award = { 
			{type = 0, id = 6657, count = 1,bind = 1},
			{type = 0, id = 6371, count = 1,bind = 1},
			{type = 0, id = 5364, count = 1,bind = 1},
			{type = 0, id = 6370, count = 1,bind = 1},
			{type = 0, id = 7780, count = 2,bind = 1} --仙钻2颗
		
		 } },
		{ times = 1500, award = { 
			{type = 0, id = 7047, count = 1,bind = 1},
			{type = 0, id = 7043, count = 1,bind = 1},
			{type = 0, id = 5364, count = 2,bind = 1},
			{type = 0, id = 6370, count = 2,bind = 1},
			{type = 0, id = 7781, count = 1,bind = 1} --仙钻5颗
			
		 } },
		{ times = 2500, award = { 
			{type = 0, id = 7051, count = 1,bind = 1},
			{type = 0, id = 6659, count = 1,bind = 1},
			{type = 0, id = 5364, count = 3,bind = 1},
			{type = 0, id = 6370, count = 3,bind = 1},
			{type = 0, id = 7781, count = 2,bind = 1} --仙钻5颗
		} },
		{ times = 4000, award = { 
			{type = 0, id = 7039, count = 1,bind = 1},
			{type = 0, id = 6887, count = 1,bind = 1},
			{type = 0, id = 5365, count = 1,bind = 1},
			{type = 0, id = 6370, count = 4,bind = 1},
			{type = 0, id = 7781, count = 3,bind = 1} --仙钻5颗
		} },
		{ times = 5000, award = { 
			{type = 0, id = 7039, count = 2,bind = 1},
			{type = 0, id = 7650, count = 1,bind = 1},
			{type = 0, id = 5365, count = 2,bind = 1},
			{type = 0, id = 6370, count = 5,bind = 1},
			{type = 0, id = 7781, count = 4,bind = 1} --仙钻5颗 
		} },	
	},
	
	-- 珍宝阁
	shop = { -- price 为珍宝积分
		{itemId=7620,count=1,bind=1,price=888},
		{itemId=5647,count=1,bind=1,price=888},
		{itemId=530,count=1,bind=1,price=888},
		{itemId=7651,count=1,bind=1,price=3888},
		{itemId=7650,count=1,bind=1,price=3888},
		{itemId=7039,count=1,bind=1,price=8888},

	},
}