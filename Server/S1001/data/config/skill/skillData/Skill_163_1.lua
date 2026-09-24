--魔法盾1级
{

	actions=
	{
		{act=1,effect=19,},

	},
	
	desc=Lang.Skill.s92L1Desc,--技能的描述
	
	iconID=15,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{

					conds=
					{
						{cond = 3,value =1},
						{cond = 63,value =54,param=112},						
					},
					results=
					{
						{timeParam=1,type=1,delay=300,id=13,rate=500,intervalRate=1000,maxDur=300,intervalAddType=1,},
					},

					specialEffects=
					{
						{type=4,mj=0,id=20,keepTime=20000,delay=0,always=false},
					},
				},
			},
		},
		
	},

	trainConds=
	{
		--{cond=1,value=40,consume=false},--表示等级要1级
	},
	
	spellConds=
	{
		--{cond=8,value=450,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=50,

},