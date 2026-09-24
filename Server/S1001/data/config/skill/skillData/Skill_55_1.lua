--麻醉术
{

	actions=
	{
		{act=1,effect=220,},
	},
	
	desc=Lang.Skill.s55L1Desc,--技能的描述
	
	iconID=70,--图标的ID
			
	--作用范围表
	actRange=
	{
		{

			xStart=-2,--相对于中心点x左边的相对坐标
			xEnd=2,--相对于中心点x右边的相对坐标
			yStart=-2,--相对于中心点y上边的相对坐标
			yEnd=2,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{
						{cond = 13,value=1},--可攻击,value=1
						{cond = 5,value =1},--5: 目标为怪物,value=1
						{cond = 15,value=-1},--15:反向等级差小于等于，就是目标的等级减自己的等级小于等于这个数值
						{cond = 57,value =1},--57：目标的实体类型 =value, 0玩家 1怪物 4宝宝  14英雄
					},
					results=
					{
						{mj=0,timeParam=1,type=32,id=92,ignoreTargetDis=1,rate=1000, rateType=1, delay=400},
						--{mj=0,timeParam=1,type=4,ignoreTargetDis=1,delay=1000, rate=10000,value=1000,interval=0},
						--{mj=0,timeParam=2,type=1,id=92, rate=-1000, rateType=2, delay=400},
					},

					specialEffects=
					{	
						--{type=4,mj=0,id=53,keepTime=400,delay=200,always=false},
						{type=5,mj=0,id=220,keepTime=1000,delay=1000,always=true},
					},
				},
			},
		},	
	},

	trainConds=
	--升级条件
	{
		{cond=1,value=65,consume=false},--表示等级
		--{cond=21,value=6000,consume=false},--表示需要熟练度
	},
	
	spellConds=
	--释放条件
	{
		{cond=13,value=300,consume=false},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=60000,

},

