--双重炮塔:召唤四重
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s50L8Desc,--技能的描述
	
	iconID=6,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=-0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{
						{cond = 3,value =1},--3:目标为自己,value=1
						{cond = 12,value =1},--12:死亡,value=1						
				
					},
					results=
					{
						{mj=0,timeParam=1,type=24,buffType=1,value=256,id=5},--技能说话
						{mj=0,timeParam=1,type=17,id=336,delay=0, interval=0,value=1,buffType=1,rate=0},
						--17:创建实体，包括怪物和路灯 id=1,interval=1000,value=1 id表示怪物的id,interval表示存活时间，单位是秒，如果是0表示一直存在,value=1表示数量,
							--buffType表示实体类型，buffType=1是怪物，12是采集怪,10表示路灯  timeRate,effectId 如果配置了表示在场景的指定点(x,y)刷怪，否则就是技能点
							--rate=0,表示是按固定点,rate >0表示是在中心点周围边长=2*rate的正方形区域内随机刷怪
					
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
		{cond=13,value=5,consume=false},--13:和目标的距离必须小于等于一定的距离,value表示距离 (此距离使用x,或者y的相差的距离的绝对值的最大值作为距离)
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=100,

},