--玄武堂堂主-召唤小怪
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s99L2Desc,--技能的描述
	
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
						{cond = 3,value =1},
						
				
					},
					results=
					{
						{mj=0,timeParam=1,type=17,id=253,delay=0, interval=0,value=1,buffType=1,rate=0},
						--24:说话，buffType=1,id=2 id为MonserSay.txt里配置的话的id,
							--buffType表示广播的类型  1:附近  2:场景 3:副本  4:世界 5:同阵营广播 value:公告类型 2:屏幕中央  128:聊天栏里(默认)  256:人物飘出
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
		
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=1000000,

},