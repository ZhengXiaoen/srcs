--解毒秘术2级
{

	actions=
	{
		{act=1,effect=33,},
	},
	
	desc=Lang.Skill.s71L2Desc,--技能的描述
	
	iconID=71,--图标的ID
			
	--作用范围表
	actRange=
	{
	
		
		{

		xStart=-1,--相对于中心点x左边的相对坐标
		xEnd=1,--相对于中心点x右边的相对坐标
		yStart=-1,--相对于中心点y上边的相对坐标
		yEnd=1,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=2,		

		acts=
			{
				{

					conds=
					{
						{cond = 13,value =0},	
						--{cond = 3,value =0},	
						--{cond = 2,value =0},	
						
					},
					results=
					{
						{mj=0,timeParam=100,type=20,delay=0,vt=1, id=17,value=1},--增加技能标记							
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=28,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=29,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=30,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=31,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=32,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=33,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=34,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=35,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=36,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=62,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=63,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=64,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=68,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=69,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=70,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=75,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=76,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=77,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=78,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=79,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=80,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=81,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=82,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=83,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=93,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=94,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=95,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=96,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=97,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=98,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=99,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=100,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=101,},

					},

					specialEffects=
					{
						{type=4,mj=0,id=37,keepTime=500,delay=500,always=false},	
					},
				},
			},
		},
		
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

					conds=
					{
						{cond = 22,value =17}, --没有命中目标的时候，才需要播放特效
						{cond = 3,value =1},
						--{cond = 2,value =1},
					},
				   results=
					{
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=28,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=29,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=30,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=31,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=32,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=33,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=34,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=35,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=36,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=62,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=63,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=64,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=68,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=69,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=70,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=75,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=76,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=77,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=78,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=79,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=80,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=81,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=82,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=83,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=93,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=94,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=95,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=96,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=97,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=98,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=1,id=99,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=23,id=100,},
						{mj=0,timeParam=1,type=2,delay=800, buffType=27,id=101,},
					},
				   specialEffects=
					{
						{type=4,mj=0,id=37,keepTime=500,delay=500,always=false},	
					},
				},
			},
		},
		
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
				   targetType=0	,
					conds=
					{
						{cond = 3,value =1}, --施法者自己删除技能标记
					},
				   results=
					{
						{mj=0,timeParam=1,type=21,delay=0, id=17,vt=1}, --删除自己的技能标记

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
		--{cond=1,value=65,consume=false},--表示等级要1级
		{cond=21,value=10,consume=false},--表示需要熟练度
	},
	
	spellConds=
	{
		{cond=8,value=800,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=0,

},