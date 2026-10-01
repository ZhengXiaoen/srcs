--群体灵魂火符2级
{

	actions=
	{
		{act=1,effect=171,},
	},
	
	desc=Lang.Skill.s69L2Desc,--技能的描述
	
	iconID=27,--图标的ID
			
	--作用范围表
	actRange=
	{
		
		{

			xStart=-1,--相对于中心点x左边的相对坐标
			xEnd=1,--相对于中心点x右边的相对坐标
			yStart=-1,--相对于中心点y上边的相对坐标
			yEnd=1,--相对于中心点y下边的相对坐标
		rangeType=2,				
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
						{mj=0,timeParam=1,type=33,delay=1000, rate=8500,value=300},
					},

					specialEffects=
					{			
						{type=4,mj=0,id=210,keepTime=600,delay=400,always=false},
					},
				},
			},
		},
-----------------------------------

	},

	trainConds=
	{
		{cond=1,value=65,consume=false},--表示等级要1级
		{cond=21,value=10,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		{cond=8,value=60,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},