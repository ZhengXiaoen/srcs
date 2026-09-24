--火墙1级
{

	actions=
	{
		{act=1,effect=15,},
	},
	desc=Lang.Skill.s90L1Desc,
	iconID=13,
			

	actRange=
	{
		-------------------------------------------------------------------
		{
			xStart=-1,
			xEnd=-1,
			yStart=0,
			yEnd=0,
			rangeType=3,
			rangeCenter=2,			

			acts=
			{
				{
					targetType=1,

					conds=
					{
						{cond=6,value=1},
					},

					results=
					{
						{mj=0,timeParam=0,interval=8000,type=35,delay=0,rate=100,value=10,id=1},
					},

					specialEffects=
					{
						{type=4,mj=0,id=16,keepTime=1000,delay=200,always=false},
					},

				},
			},
		},
		-------------------------------------------------------------------
		{

			xStart=1,
			xEnd=1,
			yStart=0,
			yEnd=0,
			rangeType=3,
			rangeCenter=2,			

			acts=
			{
				{
					targetType=1,
					
					conds=
					{
						{cond=6,value=1},
					},

					results=
					{
						{mj=0,timeParam=0,interval=8000,type=35,delay=0,rate=100,value=10,id=1},
					},

					specialEffects=
					{
						{type=4,mj=0,id=16,keepTime=1000,delay=200,always=false},
			
					},

				},
			},
		},
		-------------------------------------------------------------------
		{
			xStart=0,
			xEnd=0,
			yStart=-1,
			yEnd=1,
			rangeType=3,
			rangeCenter=2,			

			acts=
			{
				{
					targetType=1,

					conds=
					{
						{cond=6,value=1},
					},

					results=
					{
						{mj=0,timeParam=0,interval=8000,type=35,delay=0,rate=100,value=10,id=1},
					},

					specialEffects=
					{
						{type=4,mj=0,id=16,keepTime=1000,delay=200,always=false},
		
					},
				},
			},
		},
		-------------------------------------------------------------------
	},

	trainConds=
	{
		--{cond=1,value=30,consume=false},--表示等级
	},
	
	spellConds=
	{
			{cond = 13,value =50,consume=false},
		--{cond=8,value=107,consume=true},--消耗蓝
	},

	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=200,

},