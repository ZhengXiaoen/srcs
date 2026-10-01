--召唤圣兽3级
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s21L3Desc,--技能的描述
	
	iconID=23,--图标的ID
			
	--作用范围表
	actRange=
	{
		{	--//身上特效释放
			xStart=0,
			xEnd=0,
			yStart=0,
			yEnd=0,
			rangeType=3,
			rangeCenter=1,

			acts=
				{
					{
					conds=
					{
						{cond=3,value=1},
					},
					results=
					{
					},
					specialEffects=
					{
						{type=4,mj=0,id=37,keepTime=0,delay=0,always=false},
					},
				},
			},
		},
	},

	trainConds=
	{
		{cond=1,value=1,consume=false},--表示等级要1级
		{cond=21,value=10,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		--{cond=10,value=2,consume=false},--表示需要宠物数目少于2个
		{cond=8,value=100,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=1000,

},