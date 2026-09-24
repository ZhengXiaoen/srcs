--合服首届沙城战
--sex 性别(0男性，1女性), job 职业(1战士，2法师，3道士),
{
	id =1,		--第几个活动
	--活动的名字
	name = Lang.ActivityName.name00049,
	--活动的描述
	desc = Lang.ActivityName.desc00053,

	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	timeDesc = Lang.ActivityName.TtDesc00005,

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
				{type=0,id=581,count=1,bind=0,strong=0,quality=0}, 
				{type=0,id=667,count=1,bind=0,strong=0,quality=0},
				{type=0,id=1001,count=1,bind=1,strong=0,quality=0},
				{type=0,id=920,count=3,bind=1,strong=0,quality=0},
				
			},
		},

		--第二档次的奖励
		{
			value = 0,			--第一档次达到某个标准才能获得奖励
			awards =
			{
				{type=0,id=1001,count=1,bind=1,strong=0,quality=0}, 
				{type=0,id=920,count=2,bind=1,strong=0,quality=0},
				{type=0,id=1119,count=1,bind=1,strong=0,quality=0},
				{type=0,id=749,count=1,bind=1,strong=0,quality=0,job=1},
				{type=0,id=759,count=1,bind=1,strong=0,quality=0,job=2},
				{type=0,id=769,count=1,bind=1,strong=0,quality=0,job=3},
				
			},
		},
	},
},