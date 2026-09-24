--赤月恶魔群天火
{

	actions=
	{
		{act=1,effect=24,},
	},
	
	desc=Lang.Skill.s36L2Desc,--技能的描述
	
	iconID=11,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

		xStart=-1,--相对于中心点x左边的相对坐标
		xEnd=1,--相对于中心点x右边的相对坐标
		yStart=-1,--相对于中心点y上边的相对坐标
		yEnd=1,--相对于中心点y下边的相对坐标
		rangeType=0,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{
						{cond=13,value=1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=500, rate=15000,value=2000,interval=0},
					},

					specialEffects=
					{			
						{type=4,mj=0,id=25,keepTime=400,delay=400,always=false},
					},
				},
			},
		},	
	},

	trainConds=
	--升级条件
	{

	},
	
	spellConds=
	--释放条件
	{
		{cond=18,value=30,consume=false},--18:自身的血的比例必须<=一定的比率,value为比例，百分之1，如果是小于等于20%，value=20
		{cond=13,value=10,consume=false},--13:和目标的距离必须小于等于一定的距离,value表示距离 (此距离使用x,或者y的相差的距离的绝对值的最大值作为距离)
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=3000,

},

