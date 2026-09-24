--群体施毒术4级
{

	actions=
	{
		{act=1,effect=33,},
	},
	
	desc=Lang.Skill.s26L4Desc,--技能的描述
	
	iconID=26,--图标的ID
			
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
					conds=
					{
					},
					results=
					{
					},
					specialEffects=
					{
						{type=4,mj=0,id=34,keepTime=400,delay=0,always=true},					
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
						{mj=0,timeParam=1,type=1,id=159, rate=-500, rateType=2, delay=0},
						{mj=0,timeParam=1,type=1,id=160, rate=-500, rateType=2, delay=0},
						{mj=0,timeParam=90,type=1,id=158, rate=-500, rateType=2, delay=0},
					},

					specialEffects=
					{
						{type=4,mj=0,id=34,keepTime=400,delay=400,always=false},					
					},
				},
			},
		},
		
		
	
	},

	trainConds=
	{
		--{cond=1,value=72,consume=false},--表示等级需求
		--{cond=3,value=881,consume=false},--表示需要书本
	},
	
	spellConds=
	{
		{cond=8,value=128,consume=true},--消耗蓝
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},