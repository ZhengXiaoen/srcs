--彻地钉
{

	actions=
	{
		{act=1,effect=173,},
	},
	
	desc=Lang.Skill.s56L1Desc,--技能的描述
	
	iconID=29,--图标的ID
			
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
						{type=4,mj=0,id=176,keepTime=4800,delay=1000,always=true},					
					},
				},
			},
		},
		
		
		{

			xStart=-4,--相对于中心点x左边的相对坐标
			xEnd=4,--相对于中心点x右边的相对坐标
			yStart=-4,--相对于中心点y上边的相对坐标
			yEnd=4,--相对于中心点y下边的相对坐标
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
						{mj=0,timeParam=1,type=3,delay=400,rate=5000},
						--{mj=0,timeParam=1,type=18,delay=3,rate=2000},
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
		{cond=1,value=30,consume=false},--表示等级
	},
	
	spellConds=
	{
		{cond=8,value=100,consume=true},--消耗蓝
	},
	--吟唱时间,单位是毫秒
	singTime=100,	
	cooldownTime=1000,

},