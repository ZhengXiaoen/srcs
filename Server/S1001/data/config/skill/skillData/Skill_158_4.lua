--施毒术
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s6L1Desc,--技能的描述
	
	iconID=6,--图标的ID
			
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
					{},
					results=
					{},
					specialEffects=
					{
						{type=4,mj=0,id=28,keepTime=400,delay=0,always=true},					
					},
				},
			},
		},
		
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
					targetType=0,
					conds=
					{
						{cond = 13,value =1},							
					},
					results=
					{
						{mj=0,timeParam=1,type=1,id=29, rate=-1000, rateType=2, delay=400},
						{mj=0,timeParam=1,type=1,id=30, rate=-1000, rateType=2, delay=400},
						{mj=0,timeParam=60,type=1,id=28, rate=-1000, rateType=2, delay=400},
					},

					specialEffects=
					{
						{type=4,mj=0,id=29,keepTime=400,delay=400,always=false},					
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
		{cond=13,value=6,consume=false},--13:和目标的距离必须小于等于一定的距离,value表示距离 (此距离使用x,或者y的相差的距离的绝对值的最大值作为距离)
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=100,

},