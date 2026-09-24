--追魂统领盾
{

	actions=
	{
		{act=1,effect=0,},
		--{act=2,effect=19,},
	},
	
	desc=Lang.Skill.s120L1Desc,--技能的描述
	
	iconID=15,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=0,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 3,value =1},
						--{cond = 17,value =54,param=112},			
					},
					results=
					{
						{timeParam=1,type=1,delay=300,id=71,rate=0,intervalRate=1000,maxDur=300,intervalAddType=1,},
					},

					specialEffects=
					{
						{type=4,mj=0,id=142,keepTime=1000,delay=8000,always=false},
					},
				},
			},
		},
		
	},

	trainConds=
	{
		--{cond=1,value=45,consume=false},--表示等级要1级
		--{cond=21,value=3000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		--{cond=8,value=150,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=15000,

},