--疾光电影2级
{

	actions=
	{
		{act=1,effect=16,},
	},
	
	desc=Lang.Skill.s13L2Desc,--技能的描述
	
	iconID=13,--图标的ID
			
	--作用范围表
	actRange=
	{
				
		{	
		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=4,				
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
						--{type=4,mj=0,id=16,keepTime=500,delay=0,always=false},	
					},
				},
			},
		},
		
		{

		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-8,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
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
			     	{mj=0,timeParam=1,type=4,delay=100, rate=11000,value=385,interval=385},
					},

					specialEffects=
					{
					--{type=1,mj=0,id=6,keepTime=1000,delay=200,always=true},				
					},
				},
			},
		},
		
	},

	trainConds=
	{
		{cond=1,value=31,consume=false},--表示等级要1级
		{cond=21,value=1000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		{cond=8,value=19,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},