--喷泉
{

	actions=
	{
		{act=0,effect=0,},
	},
	
	desc=Lang.Skill.s7L1Desc,--技能的描述
	
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
			rangeCenter=1,			

		acts=
			{
				{
					targetType=1,--没有目标筛选也可以施放，如果有always 
					conds=
					{

					},
					results=
					{
						{mj=0,timeParam=0,type=41,delay=0,id=592,value=1000}
					},

					specialEffects=
					{
						{type=6,mj=0,id=158,keepTime=4000,delay=0,always=false},	
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
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},