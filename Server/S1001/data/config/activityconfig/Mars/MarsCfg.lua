--[[File:MarsCfg.lua]]

MarsCfg = {
	FubenCD = 2 * 3600, -- 副本的时间，单位秒
	GameGird = {
		-- 10元宝       灵符数量          
		{yb = 10,   nCount = 1},       
		{yb = 100,  nCount = 10},       
		{yb = 500,  nCount = 50},       
		{yb = 1000, nCount = 100},
	},
	-- 进入装备战神闯关
	EquipMars = {
		--EnterEquipMarsTimes = 3, -- 每日可进入副本次数
		--MinLevel = 40, -- 等级
		--Circle = 0, -- 转数
		FubenId = 54, -- 副本id
	},
	-- 进入经验战神闯关
	ExpMars = {
		FubenId = 53, -- 副本id
		-- 进入需要消耗
		EnterConsume = {			
			{type = 1, count = {2,20}, 	tips = Lang.Activity.lfg0018, lackTips = Lang.Activity.lfg0021}; 	-- 2战神令或20元宝
			{type = 2, count = {60}, 	tips = Lang.Activity.lfg0019, lackTips = Lang.Activity.lfg0022};		-- 60绑定元宝
			{type = 3, count = {10000}, tips = Lang.Activity.lfg0020, lackTips = Lang.Activity.lfg0023};	-- 10000荣誉
		};
	},
}