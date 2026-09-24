--红蟹:自爆
{

	actions=
	{
		{act=1,effect=17,},
	},
	
	desc=Lang.Skill.s49L1Desc,--技能的描述
	
	iconID=14,--图标的ID
			
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

						
					},
					results=
					{
					},

					specialEffects=
					{
						{type=5,mj=0,id=98,keepTime=420,delay=500,always=true},					
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
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 13,value =1},
						{cond = 50,value =138},
					},
					results=
					{
						{mj=0,timeParam=1,type=47,delay=0,id=1,rate=-2000},							
						--{mj=0,timeParam=1,type=3,delay=200,rate=0,value=1500,interval=1500},
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
		--{cond=1,value=30,consume=false},--表示等级要1级
		--{cond=3,value=437,consume=true,exceptVip=true },--表示书本
	},
	
	spellConds=
	{
		{cond=13,value=1,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=3000,

},