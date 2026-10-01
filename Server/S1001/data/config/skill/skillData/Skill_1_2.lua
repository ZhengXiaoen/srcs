--战神剑法 基础剑术
{
	actions = {},
	desc = Lang.Skill.s1L2Desc,--技能的描述
	iconID = 1,--图标的ID
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
							{cond = 3,value = true},
						},
						results=
						{
							{mj=0,timeParam=1,type=7,delay=0,id= 29,value= 15,vt=0},--type=7=修改属性，id=属性类型，value=数值
							{mj=0,timeParam=1,type=7,delay=0,id= 23,value= 100,vt=0},
							{mj=0,timeParam=1,type=7,delay=0,id= 5,value= 1000,vt=0},
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
		--{cond=1,value=75,consume=false},--表示等级要1级
		{cond=21,value=10,consume=false},--表示需要熟练度
		{cond=6,value=1},
	},
	spellConds=
	{
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,
},