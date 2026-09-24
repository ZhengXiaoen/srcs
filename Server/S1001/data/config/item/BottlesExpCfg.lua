--经验瓶配置
BottlesExpConfig = 
{
	MaxUse = 1,
	consume = 
	{
		{
			{type = 5, id = 0, count = 5000000,needLevel = 60},--消耗500万绑金
			{type = 7, id = 0, count = 4000,needLevel = 60},--消耗4000绑定元宝
			{type = 15, id = 0, count = 2500,needLevel = 70},--消耗2500元宝
			{type = 15, id = 0, count = 3300,needLevel = 80},--消耗3300元宝
			{type = 15, id = 0, count = 4100,needLevel = 90},--消耗4100元宝
		},
		{
			{type = 15, id = 0, count = 100,needLevel = 60},
			{type = 15, id = 0, count = 190,needLevel = 60},
			{type = 15, id = 0, count = 280,needLevel = 70},
			{type = 15, id = 0, count = 370,needLevel = 80},
			{type = 15, id = 0, count = 460,needLevel = 90},
		},
	},
	MaxValue = 100000000,  --最大值配置GlobalConfig文件里，字段名 nMaxBottlesExp    因为要读到C++里面，
	level  = 60,		 --等级值配置GlobalConfig文件里，字段名 nOpenBottlesLevel因为要读到C++里面，这里配置的是给前端做显示

	--经验瓶地图
	BottlesExpMap = 
	{
		{
			sceneId = 90,--会员挂机1
			scenePosX = 64,
			scenePosY = 64,
			vip = 0,
			level = 60,
			consume = {type = 5, id = 0,count = 500000},--消耗50万绑金，价值3块钱
			bottlesExp = 35000,--每5秒获得的经验
			text = "预计4小时收集满经验瓶",
		},
		{
			sceneId = 103,
			scenePosX = 64,
			scenePosY = 64,			
			vip = 0,
			level = 60,
			consume = {type = 7, id = 0,count = 600},--消耗600绑定元宝，价值3块钱
			bottlesExp = 47000,
			text = "预计3小时收集满经验瓶",
		},
		{
			sceneId = 104,
			scenePosX = 64,
			scenePosY = 64,			
			vip = 0,
			level = 60,
			consume = {type = 15, id = 0,count = 400},--消耗400元宝，价值4块钱
			bottlesExp = 70000,
			text = "预计2小时收集满经验瓶",
		},
		{
			sceneId = 105,
			scenePosX = 64,
			scenePosY = 64,			
			vip = 0,
			level = 60,
			consume = {type = 15, id = 0,count = 500},--消耗500元宝，价值5块钱
			bottlesExp = 140000,
			text = "预计1小时收集满经验瓶",
		},				
	},
}