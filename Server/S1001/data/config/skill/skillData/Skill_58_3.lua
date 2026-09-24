--群体火符3级
{

	actions=
	{
		{act=1,effect=28,},
	},
	
	desc=Lang.Skill.s58L3Desc,--技能的描述
	
	iconID=30,--图标的ID
			
	--作用范围表
	actRange=
	{
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
						{cond=13,value=1},
					},
					results=
					{
						--{mj=0,timeParam=1,type=4,delay=100, rate=8500,value=50},
						{mj=0,timeParam=1,type=4,delay=500, rate=1000,value=500,interval=0},
					},

					specialEffects=
					{
						--{type=4,mj=0,id=23,keepTime=400,delay=100,always=true},	
						{type=4,mj=0,id=29,keepTime=400,delay=400,always=false},
					},
				},
			},
		},	
	},

	trainConds=
	--升级条件
	{
		{cond=1,value=30,consume=false},--表示等级
		--{cond=21,value=2000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	--释放条件
	{
		{cond=8,value=500,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=1000,

},