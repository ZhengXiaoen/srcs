--战神剑法 基础剑术
{
	actions = {},
	desc = Lang.Skill.s1L1Desc,--技能的描述
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
							{mj=0,timeParam=1,type=7,delay=0,id= 29,value= 10,vt=0},--type=7=修改属性，id=属性类型，value=数值
							{mj=0,timeParam=1,type=7,delay=0,id= 23,value= 50,vt=0},
							{mj=0,timeParam=1,type=7,delay=0,id= 5,value= 500,vt=0},
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
		{cond=1,value=1,consume=false},--表示等级要1级
		{cond=6,value=1},
	},
	spellConds=
	{
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,
},