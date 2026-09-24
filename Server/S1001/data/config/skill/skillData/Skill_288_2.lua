--十步一杀1级
{

	actions=
	{
		{act=0,effect=144,},
	},
	
	desc=Lang.Skill.s288L2Desc,
	
	iconID=171,
			
	
	actRange=
	{

        --瞬移过去
		{

			xStart=0,
			xEnd=0,
			yStart=0,
			yEnd=0,
			rangeType=0,				
			rangeCenter=0,			
		    acts=
			{
				{
					conds=
					{
                        {cond = 13,value =1},
						{cond = 6,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=66,delay=100, rate=3000,value=1000}, --value 为麻痹时间
                        {mj=0,timeParam=1,type=3,delay=100, rate=5000,value=0},--对单体目标造成200%伤害 -- 下面有100%伤害，加起来就是300%伤害
					},

					specialEffects=
					{
						--{type=1,mj=0,id=144,keepTime=5000,delay=0,always=false},
					},
				},
			},
		},
		--附近三格造成100%伤害
        {

			xStart=-3,
			xEnd=3,
			yStart=-3,
			yEnd=3,
			rangeType=3,				
			rangeCenter=0,			

		    acts=
			{
				{
					targetType=0,
					conds=
					{
						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=100, rate=5000,value=200},	
						
					},
					specialEffects=
					{
						--{type=5,mj=0,id=1000,keepTime=600,delay=0,always=false},
					},
				},
			},
		},
		
		

	},


	trainConds=
	{
		
	},
	
	spellConds=
	{
				{cond = 19, value = 4},
		{cond=13,value=6,consume=true},
		{cond = 44, value = 1},

	},

	singTime=0,	
	cooldownTime=156000,

},