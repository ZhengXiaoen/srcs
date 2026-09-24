--地狱雷光1级
{

	actions=
	{
		{act=2,effect=17,},
	},
	
	desc=Lang.Skill.s91L1Desc,--技能的描述
	
	iconID=14,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			
			acts=
			{
				{
					targetType=1,
					conds={},
					results={},
					specialEffects=
					{
						{type=4,mj=0,id=18,keepTime=400,delay=400,always=true},					
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
			rangeCenter=1,			

			acts=
			{
				{

					conds=
					{
						{cond=13,value=1},
						{cond=5,value=1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=400,rate=5000,value=0,interval=60},
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
		--{cond=8,value=236,consume=true},--消耗蓝
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=300,

},