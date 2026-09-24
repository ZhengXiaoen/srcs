--疾走如飞4级
{

	actions=
	{

	},
	
	desc=Lang.Skill.s7L4Desc,--技能的描述
	
	iconID=7,--图标的ID
			
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

						{timeParam=1,type=1,delay=0,id=127,},
					},

					specialEffects=
					{
						{type=4,mj=0,id=7,keepTime=300,delay=0,always=false},
					},
				},
			},
		},
	},

	trainConds=
	{
		{cond=1,value=50,consume=false},--表示等级需求
		---{cond=3,value=858,consume=false},--表示需要书本
	},
	
	spellConds=
	{
		{cond=8,value=1192,consume=true},--消耗蓝
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=15000,

},