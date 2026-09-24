
-- 练功房配置
practice_room_cfg = {
	need_level = 65, -- 开放等级
		
	-- 等级配置
	level_list = {
		-- 普通练功房
		{
			exp = 100000, -- 产出经验
			max_practice_time = 6 * 3600, -- 每天最多可以挂多久(秒)
		},
		-- 中级练功房
		{
			exp = 200000, -- 产出经验			
			max_practice_time = 8 * 3600, -- 每天最多可以挂多久(秒)
			consume = {{type = 15,count = 10000},}, -- 升级消耗
		},
		-- 高级练功房
		{
			exp = 400000, -- 产出经验		
			max_practice_time = 12 * 3600, -- 每天最多可以挂多久(秒)	
			consume = {{type = 15,count = 20000},}, -- 升级消耗
		},
	},	
	
	-- 聚宝盆的配置(就这一点配置，就不另写一个文件了吧，就放这里)
	goldbowl_cfg = {
		bindYb = 200, -- 领取的绑元
	}
	
}
