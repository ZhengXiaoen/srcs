--为自己加血，若有中毒状态则少补些
{

	actions=
	{
		--{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s51L1Desc,--技能的描述
	
	iconID=6,--图标的ID
			
	--作用范围表
	actRange=
	{
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
						{cond = 63,value=1,param=-1},
						{cond = 30,value =338},
						--63:自己不存在buff:自己身上是否不存在这个buff,value=buff类型,param=buff的组(buffid,如果匹配所有填-1)}
						--30:目标是怪物，并且value =怪物id
					},
					results=
					{
						{mj=0,timeParam=1,type=24,buffType=2,value=2,id=2},--技能说话
						{mj=0,timeParam=1,type=13,delay=0, rate=0,value=1000000},
						{mj=0,timeParam=1000,type=20,delay=0,vt=1,id=12,value=1},
						--timeParam:表示作用的时长,或者作用的次数
						--delay:表示这个结果将延迟多长时间出现,单位为毫秒
						--13:治疗, rate=1667,value=20,rate表示与自己治疗属性的比例，单位为万分之1，这里1667表示16.67%,value表示附加治疗数值
						--20:添加技能标记 id=1,value=1，技能的标记如果不填就是0,timeParam表示技能作用的时间,单位ms,vt=1表示给施法者添加技能标记，vt=0或者不配置表示给目标添加技能标记
					},

					specialEffects=
					{

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
						{cond = 62,value=1,param=-1},
						{cond = 30,value =338},
						--30:目标是怪物，并且value =怪物id
						--62:自己存在buff:自己身上是否有这个buff,value=buff类型,param=buff的组(buffid,如果匹配所有填-1
					},
					results=
					{
						{mj=0,timeParam=1,type=24,buffType=2,value=2,id=3},--技能说话
						{mj=0,timeParam=1,type=3,delay=0, rate=0,value=200000},--对自身照成伤害
						{mj=0,timeParam=1000,type=20,delay=0,vt=1,id=12,value=1},
						--3:物理伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
						--20:添加技能标记 id=1,value=1，技能的标记如果不填就是0,timeParam表示技能作用的时间,单位ms,vt=1表示给施法者添加技能标记，vt=0或者不配置表示给目标添加技能标记
					},

					specialEffects=
					{

					},
				},
			},
		},
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
						{cond = 63,value=1,param=-1},
						{cond = 3,value =1},
						{cond = 21,value =12},
						{cond = 48,value = 339},
						--3:目标为自己,value=1
						--21:自己存在技能标识，整数
						--48:施法者本身是怪物，并且id=value
						--63:自己不存在buff:自己身上是否不存在这个buff,value=buff类型,param=buff的组(buffid,如果匹配所有填-1)}
					},
					results=
					{
						{mj=0,timeParam=1,type=24,buffType=2,value=2,id=2},--技能说话
						--24:说话，buffType=1,id=2 id为MonserSay.txt里配置的话的id,
						--buffType表示广播的类型  1:附近  2:场景 3:副本  4:世界 5:同阵营广播 value:公告类型 2:屏幕中央  128:聊天栏里(默认)  256:人物飘出
					},

					specialEffects=
					{

					},
				},
			},
		},
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
						{cond = 62,value=1,param=-1},
						{cond = 3,value =1},
						{cond = 21,value =12},
						{cond = 48,value = 339},
						--3:目标为自己,value=1
						--21:自己存在技能标识，整数
						--48:施法者本身是怪物，并且id=value
						--62:自己存在buff:自己身上是否有这个buff,value=buff类型,param=buff的组(buffid,如果匹配所有填-1
					},
					results=
					{
						{mj=0,timeParam=1,type=24,buffType=2,value=2,id=3},--技能说话
						--24:说话，buffType=1,id=2 id为MonserSay.txt里配置的话的id,
						--buffType表示广播的类型  1:附近  2:场景 3:副本  4:世界 5:同阵营广播 value:公告类型 2:屏幕中央  128:聊天栏里(默认)  256:人物飘出
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
		rangeType=3,				
		rangeCenter=1,			

		acts=
			{
				{
					conds=
					{
						{cond = 3,value =1},
						{cond = 21,value =12},
						--3:目标为自己,value=1
						--21:自己存在技能标识，整数
					},
					results=
					{
						{mj=0,timeParam=1,type=61,value=1},
						{mj=0,timeParam=1,type=3,delay=300, rate=10000,value=10000},
						--3:物理伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
						--61:忽略每次最大伤害限制
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

		{cond=18,value=80,consume=false},--18:自身的血的比例必须<=一定的比率,value为比例，百分之1，如果是小于等于20%，value=20
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=20000,

},