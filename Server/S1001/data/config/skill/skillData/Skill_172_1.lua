--4转BOSS近战群攻
{

	actions=
	{
		--{act=0,effect=134,},
	},
	
	desc=Lang.Skill.s4L1Desc,--技能的描述
	
	iconID=4,--图标的ID
			
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

					conds=
					{
						{cond = 3,value =1},
						
					},
					results=
					{

					},

					specialEffects=
					{
						{type=4,mj=0,id=134,keepTime=600,delay=0,always=false},
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

						{cond = 1,value =1},--1:目标为敌人,value=1表示敌人
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=300, rate=10000,value=0},--3:物理伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
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
			yStart=5,--相对于中心点y上边的相对坐标
			yEnd=5,--相对于中心点y下边的相对坐标
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 1,value =1},--1:目标为敌人,value=1表示敌人
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=300, rate=10000,value=0},--3:物理伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
					},

					specialEffects=
					{
					},
				},
			},
		},
		
		{

			xStart=-5,--相对于中心点x左边的相对坐标
			xEnd=5,--相对于中心点x右边的相对坐标
			yStart=-5,--相对于中心点y上边的相对坐标
			yEnd=5,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 1,value =1},--1:目标为敌人,value=1表示敌人
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=300, rate=10000,value=0},--3:物理伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
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
		{cond=13,value=5,consume=true},--攻击距离

	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=300,

},