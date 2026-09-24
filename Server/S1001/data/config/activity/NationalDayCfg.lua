--国庆活动
NationalDayCfg =
{
	isOpen = true, -- 活动是否开启
	
	--活动时间（开始-结束）
	time = {2017,9,20, 2017,9,26},
	
	--几级以上玩家才可领取每日登陆奖励
	loginAwardNeedLevel = 70,
	
	--每日登陆奖励
	loginAwardList = {
		--第一天
		{
			-- {type = 0,id = 518, count = 1, bind = 1},--100绑定元宝
			-- {type = 0,id = 457, count = 1, bind = 1},--雷泽神殿卷
			-- {type = 0,id = 509, count = 1, bind = 1},--金条（大）
			-- {type = 0,id = 513, count = 1, bind = 1},--经验丹（大）
			-- {type = 0,id = 505, count = 1, bind = 1},--2倍经验卷5小时
		},
		--第二天
		{			
			-- {type = 0,id = 518, count = 1, bind = 1},--100绑定元宝
			-- {type = 0,id = 457, count = 1, bind = 1},--雷泽神殿卷
			-- {type = 0,id = 509, count = 1, bind = 1},--金条（大）
			-- {type = 0,id = 513, count = 1, bind = 1},--经验丹（大）
			-- {type = 0,id = 505, count = 1, bind = 1},--2倍经验卷5小时
		},
		--第三天
		{			
			-- {type = 0,id = 518, count = 1, bind = 1},--100绑定元宝
			-- {type = 0,id = 457, count = 1, bind = 1},--雷泽神殿卷
			-- {type = 0,id = 509, count = 1, bind = 1},--金条（大）
			-- {type = 0,id = 513, count = 1, bind = 1},--经验丹（大）
			-- {type = 0,id = 505, count = 1, bind = 1},--2倍经验卷5小时
		},
		--第四天
		{			
			-- {type = 0,id = 518, count = 1, bind = 1},--100绑定元宝
			-- {type = 0,id = 457, count = 1, bind = 1},--雷泽神殿卷
			-- {type = 0,id = 509, count = 1, bind = 1},--金条（大）
			-- {type = 0,id = 513, count = 1, bind = 1},--经验丹（大）
			-- {type = 0,id = 505, count = 1, bind = 1},--2倍经验卷5小时
		},
		--第五天
		{			
			-- {type = 0,id = 518, count = 1, bind = 1},--100绑定元宝
			-- {type = 0,id = 457, count = 1, bind = 1},--雷泽神殿卷
			-- {type = 0,id = 509, count = 1, bind = 1},--金条（大）
			-- {type = 0,id = 513, count = 1, bind = 1},--经验丹（大）
			-- {type = 0,id = 505, count = 1, bind = 1},--2倍经验卷5小时
		},
		--第六天
		{			
			-- {type = 0,id = 518, count = 1, bind = 1},--100绑定元宝
			-- {type = 0,id = 457, count = 1, bind = 1},--雷泽神殿卷
			-- {type = 0,id = 509, count = 1, bind = 1},--金条（大）
			-- {type = 0,id = 513, count = 1, bind = 1},--经验丹（大）
			-- {type = 0,id = 505, count = 1, bind = 1},--2倍经验卷5小时
		},
		--第七天
		{			
			-- {type = 0,id = 518, count = 1, bind = 1},--100绑定元宝
			-- {type = 0,id = 457, count = 1, bind = 1},--雷泽神殿卷
			-- {type = 0,id = 509, count = 1, bind = 1},--金条（大）
			-- {type = 0,id = 513, count = 1, bind = 1},--经验丹（大）
			-- {type = 0,id = 505, count = 1, bind = 1},--2倍经验卷5小时
		},
	},
	
	-- 挖中字帖的概率范围(万分之几)
	dmkjCharItemRand = 400,---每25次必定获得字帖，50元
	--当挖中字帖时，挖中哪个字帖的概率范围(万分之几)
	dmkjCharItems = {
		{			
			rand = {0, 4000}, -- 概率范围(万分之几)
			itemId = 772, -- 国
		},
		{			
			rand = {4001, 8000}, -- 概率范围(万分之几)
			itemId = 773, -- 庆
		},
		{			
			rand = {8001, 8800}, -- 概率范围(万分之几)
			itemId = 774, -- 全
		},
		{			
			rand = {8801, 9600}, -- 概率范围(万分之几)
			itemId = 775, -- 民
		},
		{			
			rand = {9601, 9900}, -- 概率范围(万分之几)
			itemId = 776, -- 狂
		},
		{			
			rand = {9901, 10000}, -- 概率范围(万分之几)
			itemId = 777, -- 欢
		},
	},
	
	--收集字帖
	charItems = {
		{
			--收集的字帖
			items = {772,773}, -- 国、庆
			--得到的奖励
			award = { }, -- 10元
		},
		{
			--收集的字帖
			items = {772,773,774,775}, -- 国、庆、全、民
			--得到的奖励
			award = {  }, -- 100元
		},
		{
			--收集的字帖
			items = {772,773,774,775,776,777}, -- 国、庆、全、民、狂、欢
			--得到的奖励
			award = {  }, -- 500元
		},
	},
	
	--活跃度等级
	livenessLevels = {
		--1级
		{
			liveness = 50,
			award = {  }---精羽毛*10---5元
		},
		--2级
		{
			liveness = 100,
			award = {  }--符魄盒*10---10元
		},
		--3级
		{
			liveness = 200,
			award = {  }---盾灵卷轴*2--20元
		},
		--4级
		{
			liveness = 300,
			award = {  }----灵珠碎片(小)*15
		},
		--5级
		{
			liveness = 400,
			award = {  }--宝石碎片(小)*20
		},			
	},
	
	--活跃度任务
	livenessTask = {
		--降妖除魔
		{ 
			limitTimes = 20,----总30点
			score = 2,
			tips = "每次完成[降妖除魔]任务都可获得<2点>活跃奖励!",
			target = "f卧龙城:194:179:卧龙先生", 
		},
		--采集珍珠
		{ 
			limitTimes = 8, ---总15点
			score = 3,
			tips = "每次完成[采集珍珠]任务都可获得<3点>活跃奖励!",
			target = "f卧龙城:143:180:采珠农女",
		},
		--护送皇杠
		{ 
			limitTimes = 8,----总25点
			score = 5,
			tips = "每次完成[护送皇杠]任务都可获得<5点>活跃奖励!", 
			target = "f卧龙城:148:175:户部侍郎",
		},
		--屠魔圣殿
		{ 
			limitTimes = 3, ----总30点
			score = 10,
			tips = "每次完成[屠魔塔防]任务都可获得<10点>活跃奖励!",
			target = "f卧龙城:146:184:屠魔将军",
		},
		--激情PK
		{ 
			limitTimes = 20, ---总共100点
			level = 75,
			score = 5,
			tips = "每消灭1个[75级]以上的敌人可获得<5点>活跃奖励!",
			target = "", 
		},
		--行会捐献
		{
			limitTimes = 100, ---总共200点
			score = 2,
			tips = "每次为行会捐献绑金都可获得<2点>活跃奖励!",
			target = "@@showWin,7",
		},
	},
}
