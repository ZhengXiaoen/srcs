JingjiLiBaoAward = 
{
	-- 1. 神器+神甲竞技 ------------------------------------------	
	{
		openTime = {8, 13}, -- 开服时间（第几天 到 第几天）
		list = {
			{
			    name = "神器神甲共10级",
				quota=200,
				conditions = {type = 1, params = {10}}, -- 神器级别
				award = 
				{
					{type = 0,id = 4613,count = 1,bind = 1},--7转符文袋*1
				},
			},
			{
			    name = "神器神甲共12级",
				quota=100,
				conditions = {type = 1, params = {12}}, -- 神器级别
				award = 
				{
					{type = 0,id = 4613,count = 2,bind = 1},--7转符文袋*2
				},
			},
			{
			    name = "神器神甲共15级",
				quota=50,
				conditions = {type = 1, params = {15}}, -- 神器级别
				award = 
				{
					{type = 0,id = 4614,count = 3,bind = 1},--9转符文袋*3

				},
			},
			{
			    name = "神器神甲共18级",
				quota=30,
				conditions = {type = 1, params = {18}}, -- 神器级别
				award = 
				{
					{type = 0,id = 4615,count = 3,bind = 1},--11转符文袋*3

				},
			},
			{
			    name = "神器神甲共20级",
				quota=8,
				conditions = {type = 1, params = {20}}, -- 神器级别
				award = 
				{
					{type = 0,id = 88,count = 1,bind = 0,sex = 0,job = 1},--7转衣服 
					{type = 0,id = 89,count = 1,bind = 0,sex = 1,job = 1},--7转衣服 

					{type = 0,id = 97,count = 1,bind = 0,sex = 0,job = 2},--7转衣服 
					{type = 0,id = 98,count = 1,bind = 0,sex = 1,job = 2},--7转衣服 

					{type = 0,id = 106,count = 1,bind = 0,sex = 0,job = 3},--7转衣服 
					{type = 0,id = 107,count = 1,bind = 0,sex = 1,job = 3},--7转衣服 

				},
			},
		},	
	},
	
	--因为修改了规则，神甲和神器合在一起（第2个是没有用的，但是不能删除）	，不然第3个会读错位的
	-- 2. 神甲竞技 ------------------------------------------
	{
		openTime = {8, 13}, -- 开服时间（第几天 到 第几天）
		list = {
			{
			    name = "神甲10级",
				quota=300,
				conditions = {type = 2, params = {10}}, -- 神甲级别
				award = 
				{
					{type = 0,id = 4613,count = 1,bind = 1},--7转符文袋*1
				},
			},
			{
			    name = "神甲12级",
				quota=150,
				conditions = {type = 2, params = {12}}, -- 神甲级别
				award = 
				{
					{type = 0,id = 4613,count = 2,bind = 1},--7转符文袋*2
				},
			},
			{
			    name = "神甲14级",
				quota=100,
				conditions = {type = 2, params = {14}}, -- 神甲级别
				award = 
				{
					{type = 0,id = 4614,count = 1,bind = 1},--9转符文袋*2

				},
			},
			{
			    name = "神甲16级",
				quota=50,
				conditions = {type = 2, params = {16}}, -- 神甲级别
				award = 
				{
					{type = 0,id = 4614,count = 1,bind = 1},--9转符文袋*2

				},
			},
			{
			    name = "神甲18级",
				quota=8,
				conditions = {type = 2, params = {18}}, -- 神甲级别
				award = 
				{
					{type = 0,id = 4615,count = 1,bind = 1},--11转符文袋*1

				},
			},
		},	
	},
	
	-- 3. 宝石竞技 ------------------------------------------	
	{
		openTime = {8, 13}, -- 开服时间（第几天 到 第几天）
		list = {
			{
			    name = "全身镶嵌120级",
				quota=200,
				conditions = {type = 3, params = {120}}, -- 全身镶嵌120级
				award = 
				{
					{type = 0,id = 5367,count = 1,bind = 1},--比奇战将装备箱
				},
			},
			{
			    name = "全身镶嵌160级",
				quota=100,
				conditions = {type = 3, params = {160}}, -- 全身镶嵌160级
				award = 
				{
					{type = 0,id = 5368,count = 1,bind = 1},--毒蛇战将装备箱
				},
			},
			{
			    name = "全身镶嵌200级",
				quota=50,
				conditions = {type = 3, params = {200}}, -- 全身镶嵌200级
				award = 
				{
					{type = 0,id = 5369,count = 1,bind = 1 },--沃玛战将装备箱

				},
			},
			{
			    name = "全身镶嵌240级",
				quota=30,
				conditions = {type = 3, params = {240}}, -- 全身镶嵌240级
				award = 
				{
					{type = 0,id = 5370,count = 2,bind = 1},--祖玛战将装备箱

				},
			},
			{
			    name = "全身镶嵌280级",
				quota=8,
				conditions = {type = 3, params = {280}}, -- 全身镶嵌280级
				award = 
				{
					{type = 0,id = 88,count = 1,bind = 0,sex = 0,job = 1},--7转衣服 
					{type = 0,id = 89,count = 1,bind = 0,sex = 1,job = 1},--7转衣服 

					{type = 0,id = 97,count = 1,bind = 0,sex = 0,job = 2},--7转衣服 
					{type = 0,id = 98,count = 1,bind = 0,sex = 1,job = 2},--7转衣服 

					{type = 0,id = 106,count = 1,bind = 0,sex = 0,job = 3},--7转衣服 
					{type = 0,id = 107,count = 1,bind = 0,sex = 1,job = 3},--7转衣服 

				},
			},
		},	
	},
}