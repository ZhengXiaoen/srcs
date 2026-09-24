--寒冰剑法 (编号:3  刺杀剑法)
{

	actions=
	{
		{act=0,effect=3,},
	},
	desc=Lang.Skill.s282Desc,--技能的描述
	iconID=3,--图标的ID
			
	--作用范围表
	actRange=
	{
			--[[范围筛选,假设相对中心点的位置偏移
				yStart
				|
			xStart<-中心点->xEnd
				|
				yEnd
			--]]
		{
		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-1,--相对于中心点y上边的相对坐标
		yEnd=-1,--相对于中心点y下边的相对坐标
		rangeType=0,				
		rangeCenter=0,			
		acts=
			{
				{
					--targetType=1,
					conds=
					{
						{cond = 6,value =1}, --对人物造成伤害
						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=0, rate=15000,value=0},
					},
					specialEffects=
					{
						{type=4,mj=0,id=313,keepTime=960,delay=100,always=false},				
					},
				},
			},
		},

		{
		xStart=0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-1,--相对于中心点y上边的相对坐标
		yEnd=-1,--相对于中心点y下边的相对坐标
		rangeType=0,				
		rangeCenter=0,			
		acts=
			{
				{
					-- targetType=1,
					conds=
					{
						{cond = 5,value =1}, --对怪物造成伤害
						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=0, rate=30000,value=0},
					},
					specialEffects=
					{
						{type=4,mj=0,id=313,keepTime=960,delay=100,always=false},				
					},
				},
			},
		},
		
        

	},

	trainConds=
	{
			--{cond=1,value=80,consume=false},--表示等级要3级
			{cond=6,value=1},
	},
	spellConds=
	{
		{cond=13,value=3,consume=false},--13:和目标的距离必须小于等于一定的距离,value表示距离 （此距离使用x,或者y的相差的距离的绝对值的最大值作为距离）
		{cond=35,value=1,consume=false},--35:和目标需要在8方向直线上(有客户端处理。用于特殊人物技能刺杀剑术)
		{cond=39,value=1},--转数
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=120000,
},