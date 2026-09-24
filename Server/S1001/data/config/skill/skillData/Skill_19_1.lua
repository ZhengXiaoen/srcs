--施毒术1级
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s19L1Desc,--技能的描述
	
	iconID=21,--图标的ID
			
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
					{},
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
					targetType=1,
					conds=
					{
					},
					results=
					{
					},

					specialEffects=
					{
						{type=4,mj=0,id=29,keepTime=400,delay=400,always=true},					
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
						{cond = 13,value =1},							
					},
					results=
					{
						{mj=0,timeParam=1,type=1,id=29, rate=-500, rateType=10, delay=0},	
						{mj=0,timeParam=1,type=1,id=30, rate=-500, rateType=11, delay=0},
						{mj=0,timeParam=180,type=1,id=28, rate=-200, rateType=2, delay=0,value=-200,maxAttack =1},	--maxDamage=1000,  ,value=200
			
					},

					specialEffects=
					{
					},
				},
			},
		},
		
		
	
	},

	trainConds=
	{
		{cond=1,value=1,consume=false},--表示等级
		{cond=6,value=3},
		--{cond=21,value=2000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		{cond=8,value=6,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=800,

},