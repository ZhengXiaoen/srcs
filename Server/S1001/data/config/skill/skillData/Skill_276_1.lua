--灭天炎
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s66L1Desc,--技能的描述
	
	iconID=18,--图标的ID
			
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
						{type=5,mj=0,id=26,keepTime=0,delay=0,always=false},
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
						{type=4,mj=0,id=27,keepTime=500,delay=100,always=true},				
					},
				},
			},
		},
		
		
		{

			xStart=-2,--相对于中心点x左边的相对坐标
			xEnd=2,--相对于中心点x右边的相对坐标
			yStart=-2,--相对于中心点y上边的相对坐标
			yEnd=2,--相对于中心点y下边的相对坐标
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
						{mj=0,timeParam=1,type=4,delay=200, rate=18000,value=0},	
					},

					specialEffects=
					{
				       -- {type=5,mj=0,id=27,keepTime=0,delay=100,always=false},
					},
				},
			},
		},
		
	},

	trainConds=
	{
		-- {cond=1,value=80,consume=false},--表示等级
		-- {cond=6,value=2},
	},
	
	spellConds=
	{
		-- {cond=8,value=500,consume=true},--消耗蓝
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=10000,

},