--刺杀剑术
{

	actions=
	{
		{act=0,effect=3,},
	},
	
	desc=Lang.Skill.s84L1Desc,--技能的描述
	
	iconID=3,--图标的ID
			
	--作用范围表
	actRange=
	{
		{
			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=0,				
			rangeCenter=1,			

			acts = {
				{

					conds=
					{

						{cond = 13,value =1},--13:可攻击,value=1
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=0, rate=10000,value=0},--3:物理伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
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
		{cond=13,value=2,consume=false},--13:和目标的距离必须小于等于一定的距离,value表示距离 （此距离使用x,或者y的相差的距离的绝对值的最大值作为距离）
		{cond=35,value=1,consume=false},--35:和目标需要在8方向直线上(有客户端处理。用于特殊人物技能刺杀迷奸)
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},