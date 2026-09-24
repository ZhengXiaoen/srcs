--万年树精:龙卷风
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s38L1Desc,--技能的描述
	
	iconID=11,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

		xStart=-8,--相对于中心点x左边的相对坐标
		xEnd=8,--相对于中心点x右边的相对坐标
		yStart=-8,--相对于中心点y上边的相对坐标
		yEnd=8,--相对于中心点y下边的相对坐标
		rangeType=3,				
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
						{mj=0,timeParam=1,type=4,delay=500, rate=10000,value=100,interval=0},
					},

					specialEffects=
					{			
						{type=5,mj=0,id=49,keepTime=1000,delay=500,always=false},
						--type:特效的类型,无效果=0,挥洒=1,投掷=2,飞行=3,爆炸=4(目标身上的特效),脚下持续=5,持续=6
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
		{cond=13,value=10,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},

