--地狱魔兽
{

	actions=
	{
		--{act=1,effect=5,},
	},
	
	desc=Lang.Skill.s41L1Desc,--技能的描述
	
	iconID=7,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=-0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=0,			

		acts=
			{
				{
				    targetType=1,--没有目标筛选也可以施放，如果有always 
					conds=
					{

					},
					results=
					{
					
					},

					specialEffects=
					{
						{type=4,mj=0,id=47,keepTime=300,delay=1000,always=true},										
					},
				},
			},
		},		
		
		
		{

			xStart=-1,--相对于中心点x左边的相对坐标
			xEnd=1,--相对于中心点x右边的相对坐标
			yStart=-1,--相对于中心点y上边的相对坐标
			yEnd=1,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=0,			

		acts=
			{
				{
					conds=
					{
						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=100, rate=10000,value=1},					
						{mj=0,timeParam=1,type=47,delay=100, rate=-800,id=1},
						--{mj=0,timeParam=1,type=29,delay=1000,value=2},
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
		{cond=13,value=7,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=3000,

},