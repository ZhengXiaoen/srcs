--牛魔法王:激光电影
{

	actions=						--技能的二个动作的播放顺序
	{
		{act=1,effect=45,},			--act效果排列，effect释放者身上的特效ID
	},
	
	desc=Lang.Skill.s37L2Desc,		--技能的描述
	
	iconID=13,						--图标的ID
			
	actRange=						--作用范围表
	{
				
		{	
		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=4,				
		rangeCenter=1,			
		acts=
			{
				{
				   targetType=1,
					conds=
					{
					--	{cond = 3,value =1},
					},
				   results=
					{

					},
				   specialEffects=
					{
					--{type=1,mj=0,id=16,keepTime=500,delay=0,always=true},	
					},
				},
			},
		},
		
		{

		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-4,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
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
						{mj=0,timeParam=1,type=4,delay=100, rate=10000,value=158,interval=158},
					},

					specialEffects=
					{
					--{type=1,mj=0,id=6,keepTime=1000,delay=200,always=true},				
					},
				},
			},
		},
		
	},

	trainConds=						--技能升级条件
	{

	},
	
	spellConds=						--技能释放条件
	{
		{cond=13,value=2,consume=false},--13:和目标的距离必须小于等于一定的距离,value表示距离 (此距离使用x,或者y的相差的距离的绝对值的最大值作为距离)
	},
	--吟唱时间,单位是毫秒
	singTime=0,						--吟唱时间,单位是毫秒
	cooldownTime=2000,					--冷却时间,单位是毫秒

},