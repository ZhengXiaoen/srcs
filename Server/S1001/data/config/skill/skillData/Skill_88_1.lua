--抗拒火环1级
{

	actions={
			{act=1,effect=10,},
		},
	desc=Lang.Skill.s88L1Desc,
	iconID=10,

	actRange=
	{
		{	--//身上特效释放,ID=8
			xStart=0,
			xEnd=0,
			yStart=0,
			yEnd=0,
			rangeType=3,
			rangeCenter=1,

			acts=
			{
				{
				conds=
					{
						{cond=3,value=1},--3:目标为自己,value=1
					},
				results=
					{
					
					},
				specialEffects=
					{
						{type=5,mj=0,id=11,keepTime=0,delay=0,always=false},
						--type:特效的类型,无效果=0,挥洒=1,投掷=2,飞行=3,爆炸=4(目标身上的特效),脚下持续=5,持续=6
					},
				},
			},
		},



		{
			xStart=-1,
			xEnd=1,
			yStart=-1,
			yEnd=1,
			rangeType=3,
			rangeCenter=1,
			
			acts=
			{
			
				{
				conds=
					{
						{cond=15,value=-1},--15:反向等级差小于等于，就是目标的等级减自己的等级小于等于这个数值
						{cond=13,value=1},--13:可攻击,value=1
						{cond=3,value=0},--3:目标为自己,value=1
					},
				results=
					{
						{mj=0,timeParam=1,type=4,delay=300,rate=1200,value=0},--4:法术伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=88,value=1,interval=300},--38:往后退若干格,value表示退的格子数,  interval表示移动一格的速度(单位ms)
					},
				specialEffects=
					{

					},
				},
						
			{
				conds=
					{
						{cond=15,value=-1},--15:反向等级差小于等于，就是目标的等级减自己的等级小于等于这个数值
						{cond=13,value=1},--13:可攻击,value=1
						{cond=3,value=0},--3:目标为自己,value=1
						{cond=22,value=8},-- 22:本次攻击暴击的几率和伤害的提高 rate=暴击的比率提高，万分之1(1000表示10%),value=打出暴击的基础上的伤害加成,暴击是150%，如果不加成就是0
					},
				results=
					{
						{mj=0,timeParam=1,type=4,delay=300,rate=1200,value=0},--4:法术伤害,rate表示技能的伤害系数，也是万分之1的配置,value表示技能的附加伤害下限，interval表示技能附加伤害的上限，如果不配置或者0就取下限
						{mj=0,timeParam=1,type=21,delay=0,value=88},--21:删除技能标记 value为技能标记的id,vt=1表示删除施法者的技能标记，vt=0或者不配置表示删除目标技能标记
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,id=8,value=1,interval=300},--38:往后退若干格,value表示退的格子数,  interval表示移动一格的速度(单位ms)
					},
				specialEffects=
					{

					},
				},
			},
		},
	},
        --升级条件
	trainConds=
		{
			--{cond=1,value=1,consume=false},--升级等级3级
		},
	--释放条件
	spellConds=
		{
			--{cond=8,value=18,consume=true},--消耗蓝50
		},

	singTime=0,	
	cooldownTime=8000,

},