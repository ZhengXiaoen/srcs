--暗之领域教主喷火
{

	actions=
	{
		{act=0,effect=38,},
	},
	
	desc=Lang.Skill.s135L1Desc,		--技能的描述
	
	iconID=7,--图标的ID
			
	actRange=						--作用范围表
	{
		{

			xStart=0,				--相对于中心点x左边的相对坐标
			xEnd=0,					--相对于中心点x右边的相对坐标
			yStart=0,				--相对于中心点y上边的相对坐标
			yEnd=0,					--相对于中心点y下边的相对坐标
		rangeType=0,				--范围的类型  0:无范围 仅针对目标的单体 1:线性旋转(单体)2:线性范围(群体)3:范围(群体)4: 以中心点与鼠标的位置的连线作为旋转轴旋转，比线性旋转更精确，用于法师的火球术		
		rangeCenter=1,				--范围中心类型  0:目标1:施法者自己2:施法点（鼠标落点）		

		acts=						--这个是在一定条件下产生的结果
			{
				{
					conds=			--目标筛选条件表
					{

						--{cond = 13,value =1},
					},
					results=		--针对目标的实际作用,
					{
						--{mj=0,timeParam=1,type=33,delay=800, rate=8000,value=25,interval=50},
						{mj=0,timeParam=1,type=4,delay=800,rate=10000,value=100,interval=50},
									--mj如果大于256,那么表示的是负数生效,比如65534(65535-1) 表示有秘籍1就不生效,否则就生效
									--timeParam:表示作用的时长,或者作用的次数
									--type表示作用类型，查看说明
									--delay表示这个结果将延迟多长时间出现,单位为毫秒
									--rate相对于玩家自身攻击值(或者治疗属性)的一个比率(正数对应治疗,负数对应攻击),使用整数配置,填写的是10000分之几,比如4000表示40%,如果没有填0
									--value表示附加的数值,也就是玩家的自身攻击(治疗)上附加加的数值,如果和玩家的攻击不关联的话就直接rate填0 buff.value			

					},

					specialEffects=	--实施者的实际作用,
					{
						--{type=3,mj=0,id=28,keepTime=60,delay=300,always=false},		
						{type=0,mj=0,id=39,keepTime=100,delay=800,always=false},	
						{type=0,mj=0,id=38,keepTime=100,delay=800,always=false},	
									--type：特效的类型,无效果=0,挥洒=1,投掷=2,飞行=3,爆炸=4（目标身上的特效）,脚下持续=5,持续=6
									--mj：如果大于256,那么表示的是负数生效,比如65534(65535-1) 表示有秘籍1就不生效,否则就生效
									--id:特效的ID
									--keepTime:持续时间,单位是毫秒,如果是飞行特效,表示每飞行一格的时间
									--delay:效果延续多长时间出现	,单位是毫秒
									--always:是否总是打出特效,如果为false只在命中的时候打出特效,如果是always=true,targetType一定要设置为1
									--sceneEffect:默认false,为true表示添加的特效为场景静态效果
					},
				},
			},
		},
		
			
		
	},

	trainConds=					--技能升级条件
	{
	
	},
	
	spellConds=					--技能释放条件
	{
		--{cond=13,value=7,consume=false},
	},
	singTime=0,					--吟唱时间,单位是毫秒
	cooldownTime=0,				--冷却时间,单位是毫秒

},