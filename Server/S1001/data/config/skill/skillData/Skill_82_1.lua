--初级炮塔飞行攻击
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s82L1Desc,--技能的描述
	
	iconID=6,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=0,				
		rangeCenter=0,			

		acts=
			{
				{

					conds=
					{

						{cond = 5,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=0, rate=10000,value=1000},
					},

					specialEffects=
					{
						{type=3,mj=0,id=135,keepTime=500,delay=0,always=false},	
						{type=4,mj=0,id=136,keepTime=0,delay=0,always=false},	
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
		{cond=13,value=5,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=1500,

},