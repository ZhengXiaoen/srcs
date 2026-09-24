

WCConfig =
{
	limitLevel = 30,	--限制等级
	noticePoint = 100,	--公告每次分数限制
	
	--捐献配置
	donates = 
	{
		{
			consume = {type=6, id=0, count=10000},	--消耗
			value = 1,		--贡献度
		},
		{
			consume = {type=6, id=0, count=100000},	--消耗
			value = 10,		--贡献度
		},
		{
			consume = {type=6, id=0, count=1000000},	--消耗
			value = 100,		--贡献度
		},
		{
			consume = {type=15, id=0, count=1},	--消耗
			value = 3,		--贡献度
		},
		{
			consume = {type=15, id=0, count=10},	--消耗
			value = 30,		--贡献度
		},
		{
			consume = {type=15, id=0, count=100},	--消耗
			value = 300,		--贡献度
		},
	},
	
	--节日宠物配置(可配置多个时间段)
	festivalPet =	
	{
		
		{	
			time = {2012, 12, 21, 0, 0, 0,  2013, 1, 5, 0, 0, 0},	--时间范围
			value = 200,	--世界贡献度限制
			pet = {id = 660, level = 0, aiId = 158, liveTime = 100000000},		--宠物怪物ID liveTime不要配置为0请相信我
		},
		
		
		
	}
}