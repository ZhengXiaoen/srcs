
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s283Desc,--技能的描述
	
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
						{type=5,mj=0,id=53,keepTime=600,delay=0,always=false},				
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
			rangeCenter=0,			

			acts=
				{
					{

					conds=
					{
						{cond=6,value=1},
						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=0,rate=15000},
					},

					specialEffects=
					{	
						{type=4,mj=0,id=313,keepTime=960,delay=100,always=false},			
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
			rangeCenter=0,			

			acts=
				{
					{

					conds=
					{
						{cond=5,value=1},
						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=0,rate=30000},
					},

					specialEffects=
					{
						{type=4,mj=0,id=313,keepTime=960,delay=100,always=false},				
					},
				},
			},
		},
		
		
		
	},

	trainConds=
	--升级条件
	{
		--{cond=1,value=80,consume=false},--表示等级要10级
		{cond=6,value=2},
		
	},
	
	spellConds=
	--释放条件
	{
		{cond=39,value=1},--转数
		{cond=13,value=12,consume=false}
		--{cond=9,value=1},--有目标
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=120000,

},