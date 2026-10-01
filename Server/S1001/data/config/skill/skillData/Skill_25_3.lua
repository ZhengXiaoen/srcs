--神圣战甲术3级
{

	actions=
	{
		{act=1,effect=1009,},
	},
	
	desc=Lang.Skill.s25L3Desc,--技能的描述
	
	iconID=25,--图标的ID
			
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
					{type=4,mj=0,id=76,keepTime=400,delay=450,always=false},					
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

					conds=
					{

						{cond = 13,value =0},
						{cond = 17,value =23,param=33},						
					},
					results=
					{
						{mj=0,timeParam=1,type=1,delay=500,  buffType=23,id=33,rate=20000,rateType=3,value=24,interval=60,intervalRate=10000,intervalAddType=2,vt=0},
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
		{cond=1,value=29,consume=false},--表示等级要1级
		{cond=21,value=10,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		{cond=8,value=13,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},