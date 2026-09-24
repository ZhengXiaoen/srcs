
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s9L1Desc,--技能的描述
	
	iconID=11,--图标的ID
			
	--作用范围表
	actRange=
	{

		{	--//身上特效释放
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
						{cond=3,value=1},
					},
					results=
					{

					},
					specialEffects=
					{
						--{type=6,mj=0,id=73,keepTime=0,delay=0,always=false},
					},
				},	
			},
		},


		{

			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=0,				
			rangeCenter=0,			

			acts=
				{
					{

					conds=
					{
						{cond=13,value=1},
                        --{cond = 57,value = 5,},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=100,rate=8000,value=500},
						{mj=0,timeParam=1,type=3,delay=1200,rate=8000,value=500},
						{mj=0,timeParam=1,type=3,delay=1400,rate=8000,value=500},
						{mj=0,timeParam=1,type=3,delay=1600,rate=8000,value=500},
						{mj=0,timeParam=1,type=3,delay=1800,rate=8000,value=500},
						{mj=0,timeParam=1,type=3,delay=2000,rate=8000,value=500},
						{mj=0,timeParam=1,type=3,delay=2200,rate=8000,value=500},
						{mj=0,timeParam=1,type=3,delay=2400,rate=8000,value=500},
						{mj=0,timeParam=1,type=3,delay=2600,rate=8000,value=500},
						{mj=0,timeParam=1,type=3,delay=2800,rate=8000,value=500},
						{mj=0,timeParam=1,type=3,delay=3000,rate=8000,value=500},


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
				yStart=0,--相对于中心点y上边的相对坐标
				yEnd=0,--相对于中心点y下边的相对坐标
				rangeType=3,				
				rangeCenter=0,			

				acts=
				{
					{
					targetType=1,
					conds=
					{
							{cond=13,value=1},
					},
					results=
					{
					},

					specialEffects=
					{
						{type=6,mj=0,id=25,keepTime=600,delay=100,always=true},
						{type=6,mj=0,id=25,keepTime=600,delay=1200,always=true},
						{type=6,mj=0,id=25,keepTime=600,delay=1400,always=true},
						{type=6,mj=0,id=25,keepTime=600,delay=1600,always=true},
						{type=6,mj=0,id=25,keepTime=600,delay=1800,always=true},
						{type=6,mj=0,id=25,keepTime=600,delay=2000,always=true},
						{type=6,mj=0,id=25,keepTime=600,delay=2200,always=true},
						{type=6,mj=0,id=25,keepTime=600,delay=2400,always=true},
						{type=6,mj=0,id=25,keepTime=600,delay=2600,always=true},
						{type=6,mj=0,id=25,keepTime=600,delay=3000,always=true},					
					},
				},
			},
		},
		
	},

	trainConds=
	--升级条件
	{

	},
	
	spellConds=
	--释放条件
	{

       {cond=13,value=12,consume=true},--攻击距离
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=100,

},