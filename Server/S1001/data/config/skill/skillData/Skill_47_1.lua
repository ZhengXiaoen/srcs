--牛魔法师:半月
{

	actions=
	{
		{act=0,effect=48,},
	},
	
	desc=Lang.Skill.s47L1Desc,--技能的描述
	
	iconID=4,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

		xStart=-1,--相对于中心点x左边的相对坐标
		xEnd=1,--相对于中心点x右边的相对坐标
		yStart=-1,--相对于中心点y上边的相对坐标
		yEnd=1,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 1,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=300, rate=8500,value=0},
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
		--{cond=1,value=50,consume=false},--表示等级要50级
		--{cond=21,value=6000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		{cond=8,value=2,consume=true},--消耗蓝35
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},