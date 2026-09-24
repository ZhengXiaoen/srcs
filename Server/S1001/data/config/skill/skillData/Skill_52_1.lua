--至尊青龙-单体攻击
{

	actions=
	{
		{act=1,effect=214,},
	},
	
	desc=Lang.Skill.s52L1Desc,--技能的描述
	
	iconID=9,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=-1,--相对于中心点x左边的相对坐标
			xEnd=1,--相对于中心点x右边的相对坐标
			yStart=-1,--相对于中心点y上边的相对坐标
			yEnd=1,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=0,			

		acts=
			{
				{

					conds=
					{
						{cond=13,value=1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,ignoreTargetDis=1,delay=300, rate=10000,value=1000,interval=0},
						{mj=0,timeParam=1,type=4,ignoreTargetDis=1,delay=300, rate=10000,value=1000,interval=0},
					--mj：如果大于256，那么表示的是负数生效,比如65534(65535-1) 表示有秘籍1就不生效，否则就生效；
					--如果为0表示不管什么是否有秘籍都生效；
                       		        --小于256 表示 否正数生效，例如1表示有秘籍1才生效，否则不生效
					--timeParam:表示作用的时长,或者作用的次数
					--delay:表示这个结果将延迟多长时间出现,单位为毫秒
					--ignoreTargetDis:1表示忽视和目标的距离，全部100%命中，用于野蛮冲撞这样的技能，默认不配置
					},

					specialEffects=
					{			
						{type=4,mj=0,id=51,keepTime=400,delay=400,always=false},
					--specialEffects表示技能产生的特效,比如火团，陷阱等
					--type：特效的类型,无效果=0,挥洒=1,投掷=2,飞行=3,爆炸=4（目标身上的特效）,脚下持续=5,持续=6
					--mj：如果大于256，那么表示的是负数生效,比如65534(65535-1) 表示有秘籍1就不生效，否则就生效；
					--如果为0表示不管什么是否有秘籍都生效；
                       		        --小于256 表示 否正数生效，例如1表示有秘籍1才生效，否则不生效
					--keepTime:持续时间,单位是毫秒,如果是飞行特效，表示每飞行一格的时间
					--delay:效果延续多长时间出现	,单位是毫秒
					--always:是否总是打出特效,如果为false只在命中的时候打出特效，如果是always=true，targetType一定要设置为1
					--sceneEffect:默认false,为true表示添加的特效为场景静态效果
					},
				},
			},
		},	
	},

	trainConds=
	--升级条件
	{
		--{cond=1,value=35,consume=false},--表示等级
		--{cond=21,value=6000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	--释放条件
	{
		{cond=13,value=10,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=2000,

},

