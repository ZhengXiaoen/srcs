--治愈术1级
{

	actions=
	{
		{act=1,effect=28,},
	},
	
	desc=Lang.Skill.s95L1Desc,--技能的描述
	
	iconID=19,--图标的ID
			
	--作用范围表
	actRange=
	{
		
		{

			xStart=-1,--相对于中心点x左边的相对坐标
			xEnd=1,--相对于中心点x右边的相对坐标
			yStart=-1,--相对于中心点y上边的相对坐标
			yEnd=1,--相对于中心点y下边的相对坐标
			rangeType=0,--0:无范围，仅针对目标的单体技能(单体)
			rangeCenter=2,--2:施法点(鼠标落点)

			acts=
			{
				{

					conds=
					{

						{cond = 13,value =0},
					--	{cond = 17,value =1,param=113},										
					},
					results=
					{
						{mj=0,timeParam=100,type=20,delay=0,vt=1, id=17,value=1},--增加技能标记							
						{mj=0,timeParam=10,type=1,delay=0, id=16,rate=500,rateType=2,},
					},

					specialEffects=
					{
						{type=4,mj=0,id=29,keepTime=1000,delay=500,always=false},	
					},
				},
			},
		},
		
		{	
			xStart=-1,--相对于中心点x左边的相对坐标
			xEnd=1,--相对于中心点x右边的相对坐标
			yStart=-1,--相对于中心点y上边的相对坐标
			yEnd=1,--相对于中心点y下边的相对坐标
			rangeType=0,--0:无范围，仅针对目标的单体技能(单体)
			rangeCenter=2,--1:施法者自己	
			
			acts=
			{
				{

					conds=
					{
						{cond = 22,value =17}, --没有命中目标的时候，才需要播放特效
						{cond = 3,value =1},						
					},
					results=
					{
						{mj=0,timeParam=10,type=1,delay=0, id=16,rate=500,rateType=2,},
					},
					specialEffects=
					{
						{type=4,mj=0,id=29,keepTime=1000,delay=500,always=false},	
					},
				},
			},
		},
		
		{	
			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=0,--0:无范围，仅针对目标的单体技能(单体)
			rangeCenter=1,--1:施法者自己
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
						{mj=0,timeParam=1,type=21,delay=0, id=16,vt=1}, --删除自己的技能标记

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

	},
	
	spellConds=
	{
		--{cond=8,value=75,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=800,

},