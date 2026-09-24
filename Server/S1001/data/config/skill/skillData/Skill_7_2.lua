--雷霆一击2级
{

	actions=
	{

	},
	
	desc=Lang.Skill.s7L2Desc,--技能的描述
	
	iconID=7,--图标的ID
			
	--作用范围表
	actRange=
	{
	
	{

		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
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
						{type=4,mj=0,id=311,keepTime=500,delay=100,always=true},
					},
				},
			},
		},
	
		{

		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-0,--相对于中心点y上边的相对坐标
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
						{mj=0,delay=100,timeParam=1,type=63,value=5,aiId=1,id=0},
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
		{cond=1,value=70,consume=false},--表示等级要23级
		{cond=21,value=5000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		{cond=8,value=100,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=1000,

},