--玄武堂堂主-施毒术
{

	actions=
	{
		{act=1,effect=33,},
	},
	
	desc=Lang.Skill.s106L1Desc,--技能的描述
	
	iconID=19,--图标的ID
			
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
					targetType=0,
					conds=
					{
						{cond = 13,value =1},							
					},
					results=
					{
						{mj=0,timeParam=1,type=1,id=29, rate=-300, rateType=2, delay=400},
						{mj=0,timeParam=1,type=1,id=30, rate=-300, rateType=2, delay=400},
						{mj=0,timeParam=15,type=1,id=28, rate=-300, rateType=2, delay=400},
					},

					specialEffects=
					{
						{type=4,mj=0,id=34,keepTime=400,delay=0,always=true},					
					},
				},
			},
		},
		
		
	
	},

	trainConds=
	{
		--{cond=1,value=20,consume=false},--表示等级
		--{cond=21,value=2000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		{cond=8,value=1,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=1500,

},