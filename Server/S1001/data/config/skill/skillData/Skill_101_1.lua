--王城副城主-刺杀剑术
{

	actions=
	{
		{act=1,effect=3,},
	},
	
	desc=Lang.Skill.s101L1Desc,--技能的描述
	
	iconID=3,--图标的ID
			
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


	},

	trainConds=
	{
		--{cond=1,value=20,consume=false},--表示等级要20级

	},
	
	spellConds=
	{
		--{cond=13,value=2,consume=false},
		--{cond=35,value=1,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=480,

},