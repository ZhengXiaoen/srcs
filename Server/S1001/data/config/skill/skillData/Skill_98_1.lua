--朱雀堂堂主-幽灵盾
{

	actions=
	{
		{act=1,effect=38,},
	},
	
	desc=Lang.Skill.s98L1Desc,--技能的描述
	
	iconID=24,--图标的ID
			
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
						{type=4,mj=0,id=39,keepTime=380,delay=450,always=false},					
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
						{cond = 13,value = 0 },
						{cond = 17,value = 23, param=116},--17:不存在buff:目标身上是否不存在这个buff,value=buff类型,param=buff的组(buffid,如果匹配所有填-1)}
						{cond = 17,value = 27, param=116},--17:不存在buff:目标身上是否不存在这个buff,value=buff类型,param=buff的组(buffid,如果匹配所有填-1)}
					},
					results=
					{
						{mj=0,timeParam=2,type=1,delay=500, rate=500, rateType=2, id=22,},
						{mj=0,timeParam=2,type=1,delay=500, rate=500, rateType=2, id=23,},	
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

	},
	
	spellConds=
	{
		--{cond=8,value=397,consume=true},--消耗蓝10
	},
	singTime=0,	
	cooldownTime=8000,

},