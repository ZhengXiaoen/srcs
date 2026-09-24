--万年树精:群体龙卷风
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s35L4Desc,--技能的描述
	
	iconID=11,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=-10,--相对于中心点x左边的相对坐标
			xEnd=10,--相对于中心点x右边的相对坐标
			yStart=-10,--相对于中心点y上边的相对坐标
			yEnd=10,--相对于中心点y下边的相对坐标
		rangeType=4,				
		rangeCenter=0,			

		acts=
			{
				{

					conds=
					{
						{cond=13,value=1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=500, rate=10000,value=20,interval=0},
					},

					specialEffects=
					{			
						{type=3,mj=0,id=49,keepTime=400,delay=400,always=false},
					},
				},
			},
		},	
	},

	trainConds=
	--升级条件
	{
		--{cond=1,value=35,consume=false},--表示等级
		--{cond=21,value=6000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	--释放条件
	{
		{cond=13,value=8,consume=false},--13:和目标的距离必须小于等于一定的距离,value表示距离 (此距离使用x,或者y的相差的距离的绝对值的最大值作为距离)
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=3000,

},