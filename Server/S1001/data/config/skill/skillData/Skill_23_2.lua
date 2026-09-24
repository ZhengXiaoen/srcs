--群体隐身术1级
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s23L1Desc,--技能的描述
	
	iconID=23,--图标的ID
			
	--作用范围表
	actRange=
	{
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
					{type=3,mj=0,id=67,keepTime=60,delay=200,always=false},	
					{type=4,mj=0,id=32,keepTime=550,delay=450,always=false},				
					},
				},
			},
		},
		
		
		{

		xStart=-1,--相对于中心点x左边的相对坐标
		xEnd=1,--相对于中心点x右边的相对坐标
		yStart=-1,--相对于中心点y上边的相对坐标
		yEnd=1,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=2,			

		acts=
			{
				{

					conds=
					{

						{cond = 13,value =0}, 
						{cond = 17,value =63,param=115}, 
					},
					results=
					{
						{mj=0,timeParam=1,type=1,buffType=63, id=61,delay=0,interval=25,intervalRate=2500,intervalAddType=2},
					},

					specialEffects=
					{
						--{type=3,mj=0,id=22,keepTime=10000,delay=500,always=false},				
					},
				},
			},
		},
		

	},

	trainConds=
	{
		{cond=1,value=25,consume=false},--表示等级要1级
		{cond=21,value=500,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		{cond=8,value=10,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},