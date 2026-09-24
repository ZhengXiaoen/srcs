--开天斩3级
{

	actions=
	{
		{act=0,effect=1001,},
	},
	
	desc=Lang.Skill.s63L3Desc,--技能的描述
	
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

						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=0, rate=13000,value=0},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=12000,value=0},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=11000,value=0},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=10000,value=0},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=9000,value=0},
					},

					specialEffects=
					{
					},
				},
			},
		},

		{	--//身上特效释放
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
								{type=5,mj=0,id=1000,keepTime=0,delay=0,always=false},
							},
						},	
					},
		},
	},

	trainConds=
	{
		--{cond=1,value=70,consume=false},--表示等级要70级
		{cond=21,value=4500,consume=false},--表示需要熟练度
		{cond=6,value=1},
	},
	
	spellConds=
	{
		{cond=8,value=300,consume=true},--消耗蓝400\
		{cond=35,value=1,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=12000,

},