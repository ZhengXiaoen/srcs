--合体术2级
{

	actions=
	{
		{act=1,effect=30,},
	},
	
	desc=Lang.Skill.s18L2Desc,--技能的描述
	
	iconID=18,--图标的ID
			
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

						{cond = 3,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=1,delay=0,id=78,level=2},
						
						{mj=0,timeParam=1,type=65,delay=0,id=532},
						{mj=0,timeParam=1,type=65,delay=0,id=533},
						{mj=0,timeParam=1,type=65,delay=0,id=534},
						{mj=0,timeParam=1,type=65,delay=0,id=535},
						{mj=0,timeParam=1,type=65,delay=0,id=641},
						{mj=0,timeParam=1,type=65,delay=0,id=642},
						{mj=0,timeParam=1,type=65,delay=0,id=643},
						{mj=0,timeParam=1,type=65,delay=0,id=644},
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
		{cond=1,value=53,consume=false},--表示等级要1级
		{cond=21,value=500,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		{cond=42,value=1,consume=false},--表示宠物数量大于等于1
		{cond=8,value=467,consume=true},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=300000,

},