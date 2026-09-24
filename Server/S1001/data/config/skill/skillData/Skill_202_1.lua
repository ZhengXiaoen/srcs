--逐日1级
{

	actions=
	{
		{act=0,effect=1003,},
	},
	
	desc=Lang.Skill.s64L1Desc,--技能的描述
	
	iconID=9,--图标的ID
			
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

						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=0, rate=8000,value=0},
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

						{cond = 13,value =1},
					},
					results=
					{					
						{type=34,value=1},					
						{mj=0,timeParam=1,type=3,delay=300, rate=7000,value=0},
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

						{cond = 13,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=6000,value=0},
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

						{cond = 13,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=5000,value=0},
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

						{cond = 13,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=4000,value=0},
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
		{cond=1,value=50,consume=false},--表示等级要60级
		--{cond=21,value=1000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
	--	{cond=8,value=80,consume=true},--消耗蓝200\
		{cond=35,value=1,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=12000,

},