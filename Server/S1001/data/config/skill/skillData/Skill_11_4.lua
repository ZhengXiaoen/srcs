--雷电术4级
{

	actions=
	{
		{act=1,effect=12,},
	},
	
	desc=Lang.Skill.s11L4Desc,--技能的描述
	
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
						{type=5,mj=0,id=12,keepTime=0,delay=0,always=false},
					},
				},
			},
		},


		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
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
						{mj=0,timeParam=1,type=4,delay=0,rate=10400,value=1},
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
						{type=4,mj=0,id=13,keepTime=400,delay=100,always=true},				
					},
				},
			},
		},
		
	},

	trainConds=
	--升级条件
	{
		--{cond=1,value=17,consume=false},--表示等级需求
		--{cond=3,value=845,consume=false},--表示需要书本
	},
	
	spellConds=
	--释放条件
	{
		{cond=8,value=32,consume=true},--消耗蓝
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=300,

},

