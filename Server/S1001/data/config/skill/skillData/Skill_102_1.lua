--青龙堂堂主-爆裂火焰
{

	actions=
	{
		{act=1,effect=22,},
	},
	
	desc=Lang.Skill.s102L1Desc,--技能的描述
	
	iconID=11,--图标的ID
			
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
					targetType=1,
					conds=
					{
						{cond = 13,value =1},	
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=100, rate=10000,value=20},
					},

					specialEffects=
					{
						{type=4,mj=0,id=23,keepTime=400,delay=300,always=true},					
					},
				},
			},
		},		
	},

	trainConds=
	{
		--{cond=1,value=22,consume=false},--表示等级要1级
		--{cond=3,value=434,consume=true},--表示书本
	},
	
	spellConds=
	{
		{cond=8,value=1,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=1000,

},