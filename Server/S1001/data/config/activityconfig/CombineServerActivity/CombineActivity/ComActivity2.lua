--合服守沙三天奖励
{
	id =2,		--第几个活动

	--活动的名字
	name = Lang.ActivityName.name00050,
	--活动的描述
	desc = Lang.ActivityName.desc00054,

	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	timeDesc = Lang.ActivityName.TtDesc00006,

	level = 1, --活动参与的最低等级

	combinserverday = {2},		--合服第几天开启和结束

	--奖励
	allAwards=
	{	
		--第一档次的奖励
		{
			value = 0,			--第一档次达到某个标准才能获得奖励
			awards =
			{
				{type=0,id=573,count=1,bind=0,strong=0,quality=0}, 
				{type=0,id=960,count=1,bind=0,strong=0,quality=0},
				{type=0,id=920,count=3,bind=1,strong=0,quality=0},
				{type=0,id=736,count=1,bind=1,strong=0,quality=0},
			},
		},

		--第二档次的奖励
		{
			value = 0,			--第一档次达到某个标准才能获得奖励
			awards =
			{
				{type=0,id=736,count=1,bind=1,strong=0,quality=0}, 
				{type=0,id=920,count=3,bind=1,strong=0,quality=0},
				{type=0,id=283,count=15,bind=1,strong=0,quality=0},
				{type=0,id=749,count=1,bind=1,strong=0,quality=0,job=1},
				{type=0,id=759,count=1,bind=1,strong=0,quality=0,job=2},
				{type=0,id=769,count=1,bind=1,strong=0,quality=0,job=3},
			},
		},
	},
	
},