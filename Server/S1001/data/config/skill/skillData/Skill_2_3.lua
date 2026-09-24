--怒攻剑法 (编号:2  攻杀秘术)
{

	actions=
	{
		{act=0,effect=1,},
	},
	desc=Lang.Skill.s2L3Desc,--技能的描述
	iconID=2,--图标的ID
	--作用范围表
	actRange=
	{
		{
		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=0,				
		rangeCenter=0,			
		acts=
				{
					{

						conds=
						{
							{cond = 3,value =true},
						},
						results=
						{
							{mj=0,timeParam=1,type=7,delay=0,id=81,value=2000,vt=0},
							{mj=0,timeParam=1,type=7,delay=0,id=82,value=2000,vt=0},
							--{mj=0,timeParam=1,type=7,delay=0,id=83,value=2000,vt=0},
							--{mj=0,timeParam=1,type=7,delay=0,id=84,value=0.03,vt=0},
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
		--{cond=1,value=80,consume=false},--表示等级要2级
		{cond=21,value=4500,consume=false},--表示需要熟练度
		{cond=6,value=1},
	},
	
	spellConds=
	{
		{cond=15,value=1,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},