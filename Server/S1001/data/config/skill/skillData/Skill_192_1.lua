--9转群麻3秒
{

	actions=
	{
		{act=1,effect=1014,},
	},
	
	desc=Lang.Skill.s172L1Desc,--技能的描述
	
	iconID=19,--图标的ID
			
	--作用范围表
	actRange=
	{
		

		
		{

			xStart=-12,--相对于中心点x左边的相对坐标
			xEnd=12,--相对于中心点x右边的相对坐标
			yStart=-12,--相对于中心点y上边的相对坐标
			yEnd=12,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

		acts=
			{
				{
					targetType=0,
					conds=
					{		
						{cond=6,value=1},
					},
					results=
					{
						{mj=0,timeParam=1,type=1,id=198, rate=0, rateType=1, delay=400},
					},

					specialEffects=
					{
						{type=4,mj=0,id=1007,keepTime=400,delay=0,always=true},					
					},
				},
			},
		},
		
		
	
	},

	trainConds=
	{

	},
	
	spellConds=
	{	
		{cond = 13,value =12,consume=false},
		--{cond=8,value=1,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=10000,

},