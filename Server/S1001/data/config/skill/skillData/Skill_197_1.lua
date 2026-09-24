{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s9L1Desc,--技能的描述
	
	iconID=11,--图标的ID
			
	--作用范围表
	actRange=
	{

		{	--//身上特效释放
			xStart=0,
			xEnd=0,
			yStart=0,
			yEnd=0,
			rangeType=3,
			rangeCenter=1,

			acts=
				{
					{
					conds=
					{
						{cond=3,value=1},
					},
					results=
					{

					},
					specialEffects=
					{
						{type=5,mj=0,id=0,keepTime=0,delay=0,always=false},
					},
				},	
			},
		},


		{

			xStart=2,--相对于中心点x左边的相对坐标
			xEnd=2,--相对于中心点x右边的相对坐标
			yStart=-2,--相对于中心点y上边的相对坐标
			yEnd=2,--相对于中心点y下边的相对坐标
			rangeType=0,				
			rangeCenter=2,			

			acts=
				{
					{

					conds=
					{
						{cond=13,value=1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=100,rate=3500,value=500},
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
				rangeType=3,				
				rangeCenter=2,			

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
						{type=6,mj=0,id=10010,keepTime=600,delay=300,always=true},		
			
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
		{cond=13,value=15,consume=true},--攻击距离
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=100,

},