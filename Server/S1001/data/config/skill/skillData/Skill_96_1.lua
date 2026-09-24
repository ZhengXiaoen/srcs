--朱雀堂堂主-灵魂火符
{

	actions=
	{
		{act=1,effect=30,},
	},
	
	desc=Lang.Skill.s96L1Desc,--技能的描述
	
	iconID=20,--图标的ID
			
	--作用范围表
	actRange=
	{
		{
			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=3,--3:范围(群体)
			rangeCenter=1,--1:线性旋转(单体)

			acts=
			{
				{
					conds=
					{
					
					},
					results=
					{
					
					},
					specialEffects=
					{
					
					},
				},
			},
		},

		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=0,--0:无范围，仅针对目标的单体技能(单体)
			rangeCenter=2,--2:线性范围(群体)

			acts=
			{
				{
					--targetType=1,
					conds=
					{
						{cond = 13,value =1},
						{cond = 22,value =56},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=200, rate=10500,value=100},
						{mj=0,timeParam=30,type=20,delay=0,vt=1, id=20,value=1},
					},
					specialEffects=
					{
						{type=3,mj=0,id=31,keepTime=100,delay=10,always=false},
						{type=4,mj=0,id=32,keepTime=450,delay=150,always=false, checkDistance = 2},--
						--type:特效的类型,无效果=0,挥洒=1,投掷=2,飞行=3,爆炸=4（目标身上的特效）,脚下持续=5,持续=6
					},
				},
			},
		},


		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-13,--相对于中心点y上边的相对坐标
			yEnd=-13,--相对于中心点y下边的相对坐标
			rangeType=4,--4:以中心点与鼠标的位置的连线作为旋转轴旋转，比线性旋转更精确，用于法师的火球术			
			rangeCenter=1,--1:线性旋转(单体)	

			acts=
			{
				{
					targetType=1,--没有目标筛选也可以施放，如果有always 特效，这里要配置1，比如冰咆哮，不管鼠标的位置是否有目标，均要释放一团火
					conds=
					{
						{cond = 22,value =103},
					},
					results=
					{

					},

					specialEffects=
					{		
						{type=1,mj=0,id=31,keepTime=450,delay=10,always=false, checkDistance = 1},			
					},
				},
			},
		},
		
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=3,--3:范围(群体)			
			rangeCenter=1,--1:线性旋转(单体)	

			acts=
			{
				{
					targetType=0,
					conds=
					{
						{cond = 3,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=21,delay=0, id=103,vt=1},
					},

					specialEffects=
					{
								
					},
				},
			},
		},
		
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=3,--3:范围(群体)			
			rangeCenter=1,--1:线性旋转(单体)	

			acts=
			{
				{
					targetType=0,
					conds=
					{
						{cond = 3,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=21,delay=0,id=103,vt=1},
					},

					specialEffects=
					{
						{type=5,mj=0,id=100,keepTime=400,delay=30,always=false, checkDistance = 1},	
					},
				},
			},
		},

	},

	trainConds=
	{
	
	},

	spellConds=					--技能释放条件
	{
		{cond=13,value=10,consume=false},
	},
	singTime=0,					--吟唱时间,单位是毫秒
	cooldownTime=500,				--冷却时间,单位是毫秒

},