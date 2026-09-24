--玄晶教主群体迟钝蛛丝
{

	actions=
	{
		{act=1,effect=216,},
	},
	
	desc=Lang.Skill.s128L1Desc,--技能的描述
	
	iconID=19,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=-10,--相对于中心点x左边的相对坐标
			xEnd=10,--相对于中心点x右边的相对坐标
			yStart=-10,--相对于中心点y上边的相对坐标
			yEnd=10,--相对于中心点y下边的相对坐标
		rangeType=0,				
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
						--{mj=0,timeParam=1,type=4,delay=500, rate=10000,value=2000,interval=0},
						--{mj=0,timeParam=30,type=1,id=62, rate=-1000, rateType=2, delay=400},
						--{mj=0,timeParam=2,type=1,id=63, rate=-1000, rateType=2, delay=400},
						{mj=0,timeParam=2,type=1,id=67, rate=-1000, rateType=2, delay=400},
					},

					specialEffects=
					{
						--{type=7,value=100000,mj=0,id=27,keepTime=3000,delay=1000,always=false},	
						{type=4,mj=0,id=216,keepTime=4900,delay=400,always=false},
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
	cooldownTime=3000,

},

