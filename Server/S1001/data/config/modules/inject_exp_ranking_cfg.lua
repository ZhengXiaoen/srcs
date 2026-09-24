-- 天神之力(改为了捐献金币)排行榜配置
inject_exp_ranking_cfg = {
	need_level = 80, -- 需求等级
	min_coin = 100, -- 每次注入的最少金币或绑金
	coin_1yb = 2000, -- 1元宝等于1万金币

	-- 前端显示
	attr_add_list = {
		-- 第 1 名
		{
			{type=12,value=0.2,}, -- 战士
			{type=16,value=0.2,}, -- 法师
			{type=20,value=0.2,}, -- 道士
		},
		-- 第 2 名
		{
			{type=12,value=0.15,}, -- 战士
			{type=16,value=0.15,}, -- 法师
			{type=20,value=0.15,}, -- 道士
		},
		-- 第 3 名
		{
			{type=12,value=0.10,}, -- 战士
			{type=16,value=0.10,}, -- 法师
			{type=20,value=0.10,}, -- 道士
		},
		-- 第 4 到 10 名
		{
			{type=12,value=0.05,}, -- 战士
			{type=16,value=0.05,}, -- 法师
			{type=20,value=0.05,}, -- 道士
		},
	},
}