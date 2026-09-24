--王城城主：烈火剑法
{

	actions=
	{
		{act=0,effect=1002,},
	},
	
	desc=Lang.Skill.s86L1Desc,--技能的描述
	
	iconID=6,--图标的ID
			
	--作用范围表
	actRange=
	{
		------------------------------------------------------------------------
		--//前方目标烈火正常伤害
		------------------------------------------------------------------------
		{
		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=0,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},--13:可攻击,value=1
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=300, rate=13000,value=10},--3:物理伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
					},

					specialEffects=
					{
					},
				},
			},
		},
		------------------------------------------------------------------------
		--//周围1格伤害
		{
		xStart=-1,--相对于中心点x左边的相对坐标
		xEnd=-1,--相对于中心点x右边的相对坐标
		yStart=-1,--相对于中心点y上边的相对坐标
		yEnd=-1,--相对于中心点y下边的相对坐标
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},--13:可攻击,value=1
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=300, rate=7000,value=0},--3:物理伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
					},

					specialEffects=
					{
					},
				},
			},
		},
		
		
		{

		xStart=1,--相对于中心点x左边的相对坐标
		xEnd=1,--相对于中心点x右边的相对坐标
		yStart=-1,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},--13:可攻击,value=1
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=300, rate=7000,value=0},--3:物理伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
					},

					specialEffects=
					{
					},
				},
			},
		},
		------------------------------------------------------------------------


	},

	trainConds=
	{

	},
	
	spellConds=
	{
		--{cond=8,value=50,consume=true},--消耗蓝150\
		{cond=13,value=1,consume=false},--13:和目标的距离必须小于等于一定的距离,value表示距离 （此距离使用x,或者y的相差的距离的绝对值的最大值作为距离）
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=10000,

},