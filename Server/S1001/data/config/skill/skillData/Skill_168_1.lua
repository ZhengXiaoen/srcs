--玄武堂堂主-施毒术
{

	actions=
	{
		{act=1,effect=33,},
	},
	
	desc=Lang.Skill.s97L1Desc,--技能的描述
	
	iconID=19,--图标的ID
			
	--作用范围表
	actRange=
	{
		
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{
					{cond = 6,value =1},
					},
					results=
					{},
					specialEffects=
					{
						{type=4,mj=0,id=28,keepTime=400,delay=0,always=true},					
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
					targetType=0,
					conds=
					{
						{cond = 6,value =1},						
					},
					results=
					{
						{mj=0,timeParam=1,type=1,id=29, rate=-1000, rateType=2, delay=400},
						{mj=0,timeParam=1,type=1,id=30, rate=-1000, rateType=2, delay=400},
						{mj=0,timeParam=60,type=1,id=28, rate=-1000, rateType=2, delay=400},
					},

					specialEffects=
					{
						{type=4,mj=0,id=29,keepTime=400,delay=400,always=false},					
					},
				},
			},
		},
		
		
	
	},

	trainConds=
	{
		{cond=1,value=5,consume=false},--表示等级
		--{cond=21,value=2000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		{cond=8,value=6,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=1500,

},