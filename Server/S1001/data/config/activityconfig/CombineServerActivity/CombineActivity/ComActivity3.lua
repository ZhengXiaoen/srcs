--充值大比拼
{
	id =3,		--第几个活动

	--活动的名字
	name = Lang.ActivityName.name00051,
	--活动的描述
	desc = Lang.ActivityName.desc00055,

	--时间的描述,如果是20:30-21:05这样的就不需要记录到语言包，如果是"全天"就需要记录到语言包
	timeDesc = Lang.ActivityName.TtDesc00001,

	level = 1, --活动参与的最低等级

	combinserverday = {1,5},		--合服第几天开启和结束

	--奖励
	allAwards=
	{	
		--第一档次的奖励   充值第一名 
		{
			value = 100000,			--第一档次达到某个标准才能获得奖励
			awards =
			{
				{type=0,id=574,count=1,bind=0,strong=0,quality=0,sex=0}, 
				{type=0,id=575,count=1,bind=0,strong=0,quality=0,sex=1},
			},
		},
		

		--第二档次的奖励  充值第二名
		{
			value = 100000,			--第一档次达到某个标准才能获得奖励
			awards =
			{
				{type=0,id=579,count=1,bind=0,strong=0,quality=0},
			},
		},
		
		--第三档次的奖励  充值第三名
		{
			value = 100000,			--第一档次达到某个标准才能获得奖励
			awards =
			{
				{type=0,id=580,count=1,bind=0,strong=0,quality=0},
			},
		},
		
		--第四档次的奖励  充值达到3000元宝 
		{
			value = 3000,			--第一档次达到某个标准才能获得奖励
			awards =
			{
        
				{type=0,id=549,count=1,bind=1,strong=0,quality=0,job=1},
				{type=0,id=550,count=1,bind=1,strong=0,quality=0,job=2},
				{type=0,id=551,count=1,bind=1,strong=0,quality=0,job=3},
				{type=0,id=1121,count=1,bind=1,strong=0,quality=0},
				{type=0,id=920,count=1,bind=1,strong=0,quality=0},
			},
		},
		--第四档次的奖励  充值达到10000元宝 
		{
			value = 10000,			--第一档次达到某个标准才能获得奖励
			awards =
			{
        

				{type=0,id=1172,count=20,bind=1,strong=0,quality=0},
				{type=0,id=283,count=5,bind=1,strong=0,quality=0},
				{type=0,id=1037,count=1,bind=1,strong=0,quality=0},
			},
		},
		--第四档次的奖励  充值达到50000元宝 
		{
			value = 50000,			--第一档次达到某个标准才能获得奖励
			awards =
			{
        

				{type=0,id=1172,count=100,bind=1,strong=0,quality=0},
				{type=0,id=283,count=25,bind=1,strong=0,quality=0},
				{type=0,id=1037,count=5,bind=1,strong=0,quality=0},
			},
		},
	},
	
},