--BOSS推开
{

	actions={
			{act=1,effect=10,},
		},
	desc=Lang.Skill.s8L1Desc,
	iconID=10,

	actRange=
	{
		{	--//身上特效释放,ID=8
			xStart=0,
			xEnd=0,
			yStart=0,
			yEnd=0,
			rangeType=3,
			rangeCenter=1,

			acts=
			{
				{
				conds=
					{
						{cond=3,value=1},
					},
				results=
					{
					
					},
				specialEffects=
					{
						{type=5,mj=0,id=11,keepTime=0,delay=0,always=false},
					},
				},
			},
		},



		{
			xStart=-5,
			xEnd=5,
			yStart=-5,
			yEnd=5,
			rangeType=3,
			rangeCenter=1,
			
			acts=
			{
			
				{
				    conds=
					    {
						    --{cond=15,value=-1},
						    {cond=13,value=1},
						    {cond=3,value=0},
					    },
				    results=
					    {
						    {mj=0,timeParam=1,type=4,delay=300,rate=1200,value=0},
						    {mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=400},
					    },
				    specialEffects=
					    {

					    },
				},

			    {
				    conds=
					    {
						    --{cond=15,value=-1},
						    {cond=13,value=1},
						    {cond=3,value=0},
						    {cond=22,value=8},
					    },
				    results=
					    {
						    {mj=0,timeParam=1,type=4,delay=300,rate=1200,value=0},
						    {mj=0,timeParam=1,type=21,delay=0,value=8},
						    {mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=400},
					    },
				    specialEffects=
					    {

					    },
				},
			    {
				    conds=
					    {
						    --{cond=15,value=-1},
						    {cond=13,value=1},
						    {cond=3,value=0},
						    {cond=22,value=8},
					    },
				    results=
					    {
						    {mj=0,timeParam=1,type=4,delay=300,rate=1200,value=0},
						    {mj=0,timeParam=1,type=21,delay=0,value=8},
						    {mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=400},
					    },
				    specialEffects=
					    {

					    },
				},

			},

		},
	},
        --升级条件
	trainConds=
		{
			--{cond=1,value=1,consume=false},--升级等级3级
		},
	--释放条件
	spellConds=
		{
        {cond=13,value=18,consume=true},
			--{cond=8,value=2,consume=true},--消耗蓝18
		},

	singTime=0,	
	cooldownTime=8000,

},