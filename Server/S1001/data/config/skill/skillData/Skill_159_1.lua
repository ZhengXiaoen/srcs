--王城副城主:开天
{

	actions=
	{
		{act=0,effect=1001,},
	},
	
	desc=Lang.Skill.s107L1Desc,--技能的描述
	
	iconID=8,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-1,--相对于中心点y上边的相对坐标
			yEnd=-1,--相对于中心点y下边的相对坐标
			rangeType=2,				
			rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=0, rate=10000,value=0},
					},

					specialEffects=
					{
					},
				},
			},
		},
		
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-2,--相对于中心点y上边的相对坐标
			yEnd=-2,--相对于中心点y下边的相对坐标
			rangeType=2,				
			rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{					
						{type=34,value=1},					
						{mj=0,timeParam=1,type=3,delay=300, rate=10500,value=0},
					},

					specialEffects=
					{
					},
				},
			},
		},

		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-3,--相对于中心点y上边的相对坐标
			yEnd=-3,--相对于中心点y下边的相对坐标
			rangeType=2,				
			rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=8000,value=0},
					},

					specialEffects=
					{
					},
				},
			},
		},

		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-4,--相对于中心点y上边的相对坐标
			yEnd=-4,--相对于中心点y下边的相对坐标
			rangeType=2,				
			rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=8000,value=0},
					},

					specialEffects=
					{
					},
				},
			},
		},

		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-5,--相对于中心点y上边的相对坐标
			yEnd=-5,--相对于中心点y下边的相对坐标
			rangeType=2,				
			rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=8000,value=0},
					},

					specialEffects=
					{
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
		--{cond=8,value=80,consume=true},--消耗蓝200\
		{cond=35,value=1,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=12000,

},