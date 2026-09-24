
-- 果园配置
garden_cfg = {
	need_level = 65, -- 开放等级
	-- 土地配置
	grid_list = {
		-- 1 到 6 块土地免费
		-- {需要VIP等级, 花费的元宝}
		{1, 1000}, -- 7
		{1, 1000},-- 8
		{1, 2000},-- 9
		{2, 2000},-- 10
		{2, 3000},-- 11
		{2, 5000},-- 12
		{4, 5000},-- 13
		{4, 5000},-- 14
		{4, 5000},-- 15
		{6, 5000},-- 16
		{6, 5000},-- 17
		{7, 5000},-- 18
	},
		
	grid_levels = {
		-- 1 级
		{
			money = 2000, -- 升级土地花费的元宝
			speed = 10, -- 成熟时间加快百分比(10%)
		},
		
		-- 2 级
		{
			money = 5000,
			speed = 20,
		},
		
		-- 3 级
		{
			money = 10000,
			speed = 50,
		},
	},
	
	seeds_cfg = {
		
		---------经验种子	
		{
			seed_id = 113, -- 普通经验种子
			award = { {type = 2, id = 0, count = 5000000, bind = 1}, }, -- 果实(500w经验)
			time = 7200, -- 成熟时间(秒)
			resourceId = 1, --资源索引
		},
		{
			seed_id = 114, -- 中级经验种子
			award = { {type = 2, id = 0, count = 15000000, bind = 1}, }, -- 1500万经验
			time = 21600, -- 成熟时间(秒)
			resourceId = 2, --资源索引
		},
		{
			seed_id = 115, -- 高级经验种子
			award = { {type = 2, id = 0, count = 30000000, bind = 1}, }, -- 3000万经验
			time = 43200, -- 成熟时间(秒)
			resourceId = 3, --资源索引
		},
		----------绑金种子
		{
			seed_id = 116, -- 普通绑金种子
			award = { {type = 5, id = 0, count = 100000, bind = 1}, }, -- 10万绑金
			time = 7200, -- 成熟时间(秒)
			resourceId = 4, --资源索引
		},
		{
			seed_id = 117, -- 中级绑金种子
			award = { {type = 5, id = 0, count = 300000, bind = 1}, }, -- 30万绑金
			time = 21600, -- 成熟时间(秒)
			resourceId = 5, --资源索引
		},
		{
			seed_id = 118, -- 高级绑金种子
			award = { {type = 5, id = 0, count = 600000, bind = 1}, }, -- 60万绑金
			time = 43200, -- 成熟时间(秒)
			resourceId = 6, --资源索引
		},
		-----------帮贡种子
		{
			seed_id = 119, -- 普通帮贡种子
			award = { {type = 0, id = 683, count = 1, bind = 1}, }, -- 1阶帮贡令
			time = 7200, -- 成熟时间(秒)
			resourceId = 7, --资源索引
		},
		{
			seed_id = 120, -- 中级帮贡种子
			award = { {type = 0, id = 684, count = 1, bind = 1}, }, -- 2阶帮贡令
			time = 18000, -- 成熟时间(秒)
			resourceId = 8, --资源索引
		},
		{
			seed_id = 121, -- 高级帮贡种子
			award = { {type = 0, id = 685, count = 1, bind = 1}, }, -- 3阶帮贡令
			time = 36000, -- 成熟时间(秒)
			resourceId = 9, --资源索引
		},
		---------优质经验种子
		{
			seed_id = 122, -- 优质经验种子
			award = { {type = 2, id = 0, count = 12000000, bind = 1}, }, -- 1200万经验
			time = 7200, -- 成熟时间(秒)
			resourceId = 10, --资源索引
		},
		---------极品经验种子
		{
			seed_id = 123, -- 极品经验种子
			award = { {type = 2, id = 0, count = 36000000, bind = 1}, }, -- 3600万经验
			time = 21600, -- 成熟时间(秒)
			resourceId = 11, --资源索引
		},
		---------超级经验种子
		{
			seed_id = 124, -- 极品经验种子
			award = { {type = 2, id = 0, count = 72000000, bind = 1}, }, -- 7200万经验
			time = 43200, -- 成熟时间(秒)
			resourceId = 12, --资源索引
		},
		---------神装碎片种子
		{
			seed_id = 125, -- 神装石碎片种子
			award = { {type = 0, id = 716, count = 5, bind = 1}, }, -- 神装石碎片
			time = 43200, -- 成熟时间(秒)
			resourceId = 13, --资源索引
		},
		---------火龙石碎片种子
		{
			seed_id = 126, -- 火龙石碎片种子
			award = { {type = 0, id = 718, count = 5, bind = 1}, }, -- 龙纹石碎片
			time = 43200, -- 成熟时间(秒)
			resourceId = 14, --资源索引
		},
		---------高级羽毛种子
		{
			seed_id = 186, -- 高级羽毛种子
			award = { {type = 0, id = 541, count = 120, bind = 1}, }, -- 精羽毛
			time = 43200, -- 成熟时间(秒)
			resourceId = 15, --资源索引
		},
		---------高级圣魂种子
		{
			seed_id = 187, -- 高级圣魂种子
			award = { {type = 0, id = 562, count = 2, bind = 1}, }, -- 高级圣魂丹
			time = 43200, -- 成熟时间(秒)
			resourceId = 16, --资源索引
		},
		---------高级灵珠种子
		{
			seed_id = 188, -- 高级灵珠种子
			award = { {type = 0, id = 816, count = 25, bind = 1}, }, -- 灵珠碎片
			time = 43200, -- 成熟时间(秒)
			resourceId = 17, --资源索引
		},
		---------高级宝石种子
		{
			seed_id = 189, -- 高级宝石种子
			award = { {type = 0, id = 537, count = 20, bind = 1}, }, -- 宝石碎片
			time = 43200, -- 成熟时间(秒)
			resourceId = 18, --资源索引
		},
	},
	
	-- 化肥物品列表
	fertilizer_list = {
		{
			item_id = 128, -- 物品ID
			speed = 50, -- 缩短当种植的时间（百分比）
		},
	},
}
