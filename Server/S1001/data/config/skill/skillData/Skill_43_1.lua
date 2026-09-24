--极冰龙圣群雷
{

	actions=
	{
		{act=1,effect=9,},
	},
	
	desc=Lang.Skill.s43L3Desc,--技能的描述
	
	iconID=9,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=-10,--相对于中心点x左边的相对坐标
			xEnd=10,--相对于中心点x右边的相对坐标
			yStart=-10,--相对于中心点y上边的相对坐标
			yEnd=10,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{
						{cond=13,value=1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=500, rate=5000,value=2000,interval=0},
					},

					specialEffects=
					{			
						{type=4,mj=0,id=49,keepTime=400,delay=400,always=false},
					},
				},
			},
		},	
	},

	trainConds=
	--升级条件
	{
		--{cond=1,value=35,consume=false},--表示等级
		--{cond=21,value=6000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	--释放条件
	{
		{cond=13,value=10,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=8000,

},

