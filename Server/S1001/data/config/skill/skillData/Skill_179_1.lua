--3转BOSS
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s173L1Desc,--技能的描述
	
	iconID=16,--图标的ID
			
	--作用范围表
	actRange=
	{


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
						{type=4,mj=0,id=310,keepTime=650,delay=100,always=true},					
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
						{mj=0,timeParam=1,type=3,delay=100, rate=30000,value=0},	
						
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
		{cond=13,value=12,consume=true},--攻击距离
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=300,

},