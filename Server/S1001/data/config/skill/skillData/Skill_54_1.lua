--至尊青龙，召唤加血怪物
{

	actions=
	{
		{act=0,effect=0,},
	},
	
	desc=Lang.Skill.s54L1Desc,--技能的描述
	
	iconID=6,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,--3:范围(群体)
		rangeCenter=1,--1:施法者自己

		acts=
			{
				{

					conds=
					{
						{cond = 3,value =1},--3:目标为自己,value=1
					},
					results=
					{
						{mj=0,timeParam=1,type=24,buffType=1,value=2,id=1},--技能说话
						--24:说话，buffType=1,id=2 id为MonserSay.txt里配置的话的id,
						--buffType表示广播的类型1:附近  2:场景 3:副本  4:世界 5:同阵营广播 value:公告类型 2:屏幕中央  128:聊天栏里(默认)  256:人物飘出
					},

					specialEffects=
					{
	
					},
				},
			},
		},
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,--3:范围(群体)
		rangeCenter=1,--1:施法者自己

		acts=
			{
				{

					conds=
					{
						{cond = 3,value =1},--3:目标为自己,value=1
					},
					results=
					{

						{mj=0,timeParam=1,type=17,id=339,delay=0, interval=10,value=1,buffType=1,timeRate=163,effectId=109},
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
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,--3:范围(群体)
		rangeCenter=1,--1:施法者自己

		acts=
			{
				{

					conds=
					{
						{cond = 3,value =1},--3:目标为自己,value=1
					},
					results=
					{
						{mj=0,timeParam=1,type=17,id=339,delay=0, interval=10,value=1,buffType=1,timeRate=151,effectId=119},
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
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,--3:范围(群体)
		rangeCenter=1,--1:施法者自己

		acts=
			{
				{

					conds=
					{
						{cond = 3,value =1},--3:目标为自己,value=1
					},
					results=
					{
						{mj=0,timeParam=1,type=17,id=339,delay=0, interval=10,value=1,buffType=1,timeRate=163,effectId=131},
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
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,--3:范围(群体)
		rangeCenter=1,--1:施法者自己

		acts=
			{
				{

					conds=
					{
						{cond = 3,value =1},--3:目标为自己,value=1
					},
					results=
					{
						{mj=0,timeParam=1,type=17,id=339,delay=0, interval=10,value=1,buffType=1,timeRate=173,effectId=119},
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
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,--3:范围(群体)
		rangeCenter=1,--1:施法者自己

		acts=
			{
				{

					conds=
					{
						{cond = 3,value =1},--3:目标为自己,value=1
					},
					results=
					{
						--{mj=0,timeParam=1,type=24,buffType=1,id=44},--技能说话
						{mj=0,timeParam=1,type=17,id=339,delay=0, interval=10,value=1,buffType=1,timeRate=151,effectId=131},
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
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,--3:范围(群体)
		rangeCenter=1,--1:施法者自己

		acts=
			{
				{

					conds=
					{
						{cond = 3,value =1},--3:目标为自己,value=1
					},
					results=
					{
						{mj=0,timeParam=1,type=17,id=339,delay=0, interval=10,value=1,buffType=1,timeRate=173,effectId=131},
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
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,--3:范围(群体)
		rangeCenter=1,--1:施法者自己

		acts=
			{
				{

					conds=
					{
						{cond = 3,value =1},--3:目标为自己,value=1
					},
					results=
					{
						{mj=0,timeParam=1,type=17,id=339,delay=0, interval=10,value=1,buffType=1,timeRate=173,effectId=109},
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
		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,--3:范围(群体)
		rangeCenter=1,--1:施法者自己

		acts=
			{
				{

					conds=
					{
						{cond = 3,value =1},--3:目标为自己,value=1
					},
					results=
					{
						{mj=0,timeParam=1,type=17,id=339,delay=0, interval=10,value=1,buffType=1,timeRate=151,effectId=109},
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
		{

			xStart=-50,--相对于中心点x左边的相对坐标
			xEnd=50,--相对于中心点x右边的相对坐标
			yStart=-50,--相对于中心点y上边的相对坐标
			yEnd=50,--相对于中心点y下边的相对坐标
		rangeType=3,--3:范围(群体)
		rangeCenter=1,--1:施法者自己

		acts=
			{
				{

					conds=
					{
						{cond = 30,value = 339},--30:目标是怪物，并且value =怪物id
					},
					results=
					{
						{mj=0,timeParam=60,type=1,delay=0, buffType=62,id=16,interval=1,value=51,level=1},
						--1:添加增益buff，
							--timeParam:表示作用的时长,或者作用的次数
							--buffType效果id,比如加血,这个在另外一张表里配置
							--id:技能的ID，或者技能的组
							--value表示附加的数值,也就是玩家的自身攻击(治疗)上附加加的数值，如果和玩家的攻击不关联的话就直接rate填0 buff.value
							--level:使用技能的等级(用于特殊技能)如果变身BUFF132需要传入技能等级用于计算属性
							--elay:效果延续多长时间出现	,单位是毫秒
							--interval是buff的的间隔,单位秒,施法间隔 =interval + intervalRate/10000 * (玩家某属性)
							--vt=1表示value是浮点数(万分之1),0表示是整数
							--effectType=0,   --特效的类型
							--effectId =0, --附加的特效的ID,用于魔法盾这样的效果，在buff干掉了以后，特效也要去掉
					},

					specialEffects=
					{
						{type=3,mj=0,id=6,keepTime=500,delay=0,always=false},
						--type:特效的类型,无效果=0,挥洒=1,投掷=2,飞行=3,爆炸=4(目标身上的特效),脚下持续=5,持续=6
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
		{cond=13,value=18,consume=false},--13:和目标的距离必须小于等于一定的距离,value表示距离 (此距离使用x,或者y的相差的距离的绝对值的最大值作为距离)
		--{cond=12,value=94,consume=false},--12:不存在buff,value为buff的type
		{cond=18,value=90,consume=false},--18:自身的血的比例必须<=一定的比率,value为比例，百分之1，如果是小于等于20%，value=20
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=20000,

},