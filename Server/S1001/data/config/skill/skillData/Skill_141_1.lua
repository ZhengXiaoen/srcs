--符岩大圣火符
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s141L1Desc,--技能的描述
	
	iconID=69,--图标的ID
			
	--作用范围表
	actRange=
	{
		
		{

			xStart=-0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
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
						{mj=0,timeParam=1,type=4,ignoreTargetDis=1,delay=100, rate=10000,value=240,interval=0},
					},

					specialEffects=
					{			
						{type=4,mj=0,id=145,keepTime=1000,delay=400,always=false},
					},
				},
			},
		},
-----------------------------------		
	},

	trainConds=
	{
		--{cond=1,value=70,consume=false},--表示等级要1级
	},
	
	spellConds=
	{
		{cond=13,value=10,consume=false},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},