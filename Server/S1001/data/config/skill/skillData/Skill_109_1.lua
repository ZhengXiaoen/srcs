--白虎堂堂主：流星火雨
{

	actions=
	{
		{act=1,effect=26,},
	},
	
	desc=Lang.Skill.s109L1Desc,--技能的描述
	
	iconID=18,--图标的ID
			
	--作用范围表
	actRange=
	{
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
						{type=5,mj=0,id=26,keepTime=0,delay=0,always=false},
					},
	                     },
	           },
	},

		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=2,			

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
						{type=4,mj=0,id=27,keepTime=400,delay=100,always=true},					
					},
				},
			},
		},
		
		
		{

			xStart=-3,--相对于中心点x左边的相对坐标
			xEnd=3,--相对于中心点x右边的相对坐标
			yStart=-3,--相对于中心点y上边的相对坐标
			yEnd=3,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=2,			

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
						{mj=0,timeParam=1,type=4,delay=100, rate=8500,value=200},	
						
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
		--{cond=1,value=60,consume=false},--表示等级

	},
	
	spellConds=
	{
		{cond=8,value=459,consume=true},--消耗蓝
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=3000,

},