--至尊青龙-群体攻击
{

	actions=
	{
		{act=1,effect=12,},
	},
	
	desc=Lang.Skill.s52L2Desc,--技能的描述
	
	iconID=9,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=-13,--相对于中心点x左边的相对坐标
			xEnd=13,--相对于中心点x右边的相对坐标
			yStart=-13,--相对于中心点y上边的相对坐标
			yEnd=13,--相对于中心点y下边的相对坐标
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
						{mj=0,timeParam=1,type=4,delay=500, rate=5000,value=2000,interval=0},
						--4:法术伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
					},

					specialEffects=
					{			
						{type=4,mj=0,id=13,keepTime=400,delay=400,always=false},
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
		{cond=13,value=5,consume=false},
		{cond=12,value=94,consume=false},
		{cond=18,value=80,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=1000,

},

