

--每分钟检测抽奖活动
--加经验分别检测, 十秒和三十秒

Activities = 
{
	--活动场景, 场景ID + 区域索引,注意这个索引是从0开始的
	ActivitieArea =
	{
		{SceneID = 2, AreaIndex = 2},		--卧龙城的安全区
		{SceneID = 5, AreaIndex = 1},		--土城的安全区
	},

	--活动抽奖配置,抽奖内容
	ActivitiesLuckDraw =
	{
		--一等奖
		--00:00 抽取1位玩家，每位奖励10000元宝和“幸运星”称号
		{
			actorcount = 1,
			item = { {type = 15, id = 0, quality = 0, strong = 0, bindflag = 1, value = 2000}, 
					},
		},
		
		--二等奖
		--20:00 抽取20位玩家，每位奖励500万绑金
		{
			actorcount = 5, 
			item = { 
				 {type = 5, id = 0, quality = 0, strong = 0, bindflag = 1, value = 10000000},
			         {type = 7, id = 0, quality = 0, strong = 0, bindflag = 1, value = 1000},
				 },		},
		
		--三等奖
		--22:00 抽取 10位玩家，每位奖励5000绑定元宝
		{
			level = 3,
			actorcount = 10, 
			item = { 
				 {type = 5, id = 0, quality = 0, strong = 0, bindflag = 1, value = 6000000},
			         {type = 7, id = 0, quality = 0, strong = 0, bindflag = 1, value = 600},
				 },		},	
		
		--四等奖
		--20:00 抽取20位玩家，每位奖励500万绑金
		{
			actorcount = 20, 
			item = { 
				 {type = 5, id = 0, quality = 0, strong = 0, bindflag = 1, value = 3000000},
			         {type = 7, id = 0, quality = 0, strong = 0, bindflag = 1, value = 300},
				 },		},		
		
		--五等奖
		--18:00 抽取30名玩家，每位奖励100万绑金
		{
			actorcount = 30, 
			item = { 
				 {type = 5, id = 0, quality = 0, strong = 0, bindflag = 1, value = 1000000},
			         {type = 7, id = 0, quality = 0, strong = 0, bindflag = 1, value = 100},
				 },
		

		},		
	},
}