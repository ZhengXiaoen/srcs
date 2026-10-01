--地狱雷光2级
{

	actions=
	{
		{act=2,effect=0,},
	},
	
	desc=Lang.Skill.s14L3Desc,--技能的描述
	
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
					conds={},
					results={},
					specialEffects=
					{
						{type=4,mj=0,id=1004,keepTime=400,delay=400,always=true},					
					},
				},
			},
		},
		
		
		{

			xStart=-3,--相对于中心点x左边的相对坐标
			xEnd=3,--相对于中心点x右边的相对坐标
			yStart=-3,--相对于中心点y上边的相对坐标
			yEnd=3,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{

					conds=
					{
						{cond=13,value=1},
						{cond=5,value=1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=400,rate=10200,value=500,interval=90},
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
		--{cond=1,value=80,consume=false},--表示等级
		{cond=21,value=10,consume=false},--表示需要熟练度
		{cond=6,value=2},

	},
	
	spellConds=
	{
		{cond=8,value=100,consume=true},--消耗蓝
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=800,

},