--泽被苍生1级
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s290L5Desc,
	
	iconID=8,
			
	
	actRange=
	{
        --先给自己加个buff
		{

			xStart=0,
			xEnd=0,
			yStart=0,
			yEnd=0,
			rangeType=0,				
			rangeCenter=1,			
		    acts=
			{
                --
				{
					conds=
					{

						
					},
					results=
					{
						{mj=0,type=70,delay=0,id=458,vt=1,}, --vt 1为给自身加 0为给目标加
					},

					specialEffects=
					{
					},
				},
			},
		},
		
        --周围不可被攻击的友军
		{
			xStart=-3,
			xEnd=3,
			yStart=-3,
			yEnd=3,
			rangeType=3,				
			rangeCenter=1,			
		    acts=
			{
				{
					conds=
					{
                        {cond = 13,value =0}, --不可被攻击
					},
					results=
					{
						{mj=0,type=70,delay=0,id=459,vt=0,}, --vt 1为给自身加 0为给目标加
					},

					specialEffects=
					{
					},
				},
			},
		},

		--附近3格造成100%伤害
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
						{mj=0,timeParam=1,type=4,delay=100, rate=7000,value=0},	
						
					},
					specialEffects=
					{
					},
				},
			},
		},

        --//特效
        {	
			xStart=0,
			xEnd=0,
			yStart=0,
			yEnd=0,
			rangeType=3,
			rangeCenter=1,

			acts=
				{
					{
                        targetType=1,
					    conds=
					    {
						
					    },
					    results=
					    {

					    },
					    specialEffects=
					    {
						    {type=4,mj=0,id=146,keepTime=400,delay=0,always=true},	
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
		--{cond=13,value=3,consume=true},

	},

	singTime=0,	
	cooldownTime=120000,

},