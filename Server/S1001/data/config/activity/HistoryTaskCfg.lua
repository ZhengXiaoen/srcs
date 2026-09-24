HistoryTaskCfg = {
	-- 日常经验珠
	{
		maxCount = 30, -- 每天最多几次
		awards = { { type = 2, id = 0, count = 10000000 }, }, -- 一次奖励（这是元宝奖励，绑元的奖励是元宝奖励的一半）
		ybConsume = 100, -- 元宝追回
		bindYbConsume = 200, -- 绑定元宝追回
		tips = "可追次数:$1$<br/>经　　验:$2$",--描述
		titleImg = 197,--标题资源
		iconImg = 181,--图标资源
	},
	-- 日常跑环
	{
		maxCount = 30,
		awards = { { type = 2, id = 0, count = 3500000 }, { type = 5, id = 0, count = 100000 }, },
		ybConsume = 20,
		bindYbConsume = 40,
		tips = "可追次数:$1$<br/>经　　验:$2$<br/>绑　　金:$2$",--描述
		titleImg = 198,--标题资源
		iconImg = 184,--图标资源
	},
	-- 降妖除魔
	{
		maxCount = 15,
		awards = { { type = 2, id = 0, count = 19800000 }, { type = 45, id = 0, count = 4800 }, },
		ybConsume = 120,
		bindYbConsume = 240,
		tips = "可追次数:$1$<br/>经　　验:$2$<br/>盾　　灵:$2$",--描述
		titleImg = 200,--标题资源
		iconImg = 183,--图标资源
	},
	-- 采集珍珠
	{
		maxCount = 5,
		awards = { { type = 2, id = 0, count = 16000000 }, { type = 46, id = 0, count = 800 }, },
		ybConsume = 110,
		bindYbConsume = 220,
		tips = "可追次数:$1$<br/>经　　验:$2$<br/>符　　魄:$2$",--描述
		titleImg = 195,--标题资源
		iconImg = 186,--图标资源
	},
	-- 领取皇杠
	{
		maxCount = 5,
		awards = { { type = 2, id = 0, count = 16000000 }, { type = 56, id = 0, count = 50000 }, },
		ybConsume = 350,
		bindYbConsume = 700,
		tips = "可追次数:$1$<br/>经　　验:$2$<br/>佣兵经验:$2$",--描述
		titleImg = 196,--标题资源
		iconImg = 182,--图标资源
	},
	-- 屠魔将军
	{
		maxCount = 3,
		awards = { { type = 2, id = 0, count = 30000000 }, },
		ybConsume = 300,
		bindYbConsume = 600,
		tips = "可追次数:$1$<br/>经　　验:$2$",--描述
		titleImg = 199,--标题资源
		iconImg = 185,--图标资源
	},
}