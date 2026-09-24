--群体雷电术1级
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s171L1Desc,--技能的描述
	
	iconID=156,--图标的ID
			
	--作用范围表
	actRange=
	{
		{	--//身上特效释放
			xStart=0,
			xEnd=0,
			yStart=0,
			yEnd=0,
			rangeType=3,
			rangeCenter=0,

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

			xStart=-12,--相对于中心点x左边的相对坐标
			xEnd=12,--相对于中心点x右边的相对坐标
			yStart=-12,--相对于中心点y上边的相对坐标
			yEnd=12,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,	


		acts=
			{
				{
					targetType=0,
					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=100, rate=10000,value=200},	

					},

					specialEffects=
					{
						{type=5,mj=0,id=10009,keepTime=0,delay=0,always=false,copyRange=1},
					},
				},
			},
		},
		
	},

	trainConds=
	{
		--{cond=1,value=45,consume=false},--表示等级

	},
	
	spellConds=
	{
		{cond=13,value=12,consume=true},
		--{cond=8,value=40,consume=true},--消耗蓝
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=400,

},