--怒攻剑术
{

	actions=
	{
		{act=0,effect=2,},
	},
	
	desc=Lang.Skill.s83L1Desc,--技能的描述
	
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

						{cond = 3,value =true},--3:目标为自己,value=1
					},
					results=
					{

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
		--{cond=1,value=30,consume=false},--表示等级要30级
	
	},
	
	spellConds=
	{
		{cond=15,value=1,consume=false},--15:需要目标，并且要面向目标,value=1
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=100,

},