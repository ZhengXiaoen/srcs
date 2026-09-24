--火凤火墙
{

	actions=
	{
		{act=1,effect=15,},
	},
	
	desc=Lang.Skill.s40L1Desc,--技能的描述
	
	iconID=7,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

		xStart=-3,--相对于中心点x左边的相对坐标
		xEnd=3,--相对于中心点x右边的相对坐标
		yStart=-3,--相对于中心点y上边的相对坐标
		yEnd=3,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=0,			

		acts=
			{
				{
				    --targetType=1,--没有目标筛选也可以施放，如果有always 
					conds=
					{
						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=0,type=4,interval=1,delay=100,rate=8000,value=1},
					},

					specialEffects=
					{
						{type=4,mj=0,id=16,keepTime=400,delay=0,always=true},
					},
				},
			},
		},
		
		
		{

		xStart=-3,--相对于中心点x左边的相对坐标
		xEnd=3,--相对于中心点x右边的相对坐标
		yStart=-3,--相对于中心点y上边的相对坐标
		yEnd=3,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=0,			

		acts=
			{
				{
				   -- targetType=1,--没有目标筛选也可以施放，如果有always 
					conds=
					{
						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=0,type=4,interval=1,delay=0, rate=10000,value=1},
					},

					specialEffects=
					{
						--{type=4,mj=0,id=44,keepTime=400,delay=0,always=true},							
					},
				},
			},
		},
		
		{

		xStart=-3,--相对于中心点x左边的相对坐标
		xEnd=3,--相对于中心点x右边的相对坐标
		yStart=-3,--相对于中心点y上边的相对坐标
		yEnd=3,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=0,			
		 
		acts=
			{
				{
					targetType=1,
					conds=
					{
						--{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=10000,interval=10000,type=35,delay=0, rate=8000,value=100,id=1},
					    --35:召唤火墙， 
						--id:火墙的特效的ID
						--火墙的存活时间=timeParam/10000 * 魔法攻击 +interval 
						--timeParam :火墙存活的时间，单位毫秒 的相对魔法攻击的百分比，使用整数配置，填写的是10000分之几，比如4000表示40%，如果没有填0
						--interval:火墙存活时间的固定时间(单位毫秒)
						--火墙的攻击输出 =  rate/10000 * 魔法攻击  +  value
						--rate:火墙的攻击输出，相对魔法攻击的百分比，使用整数配置，填写的是10000分之几，比如4000表示40%，如果没有填0
						--value:火墙的伤害固定输出
			
					},

					specialEffects=
					{
						--{type=4,mj=0,id=44,keepTime=400,delay=0,always=false},							
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
	{cond=13,value=8,consume=false},--13:和目标的距离必须小于等于一定的距离,value表示距离 (此距离使用x,或者y的相差的距离的绝对值的最大值作为距离)
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=2000,

},