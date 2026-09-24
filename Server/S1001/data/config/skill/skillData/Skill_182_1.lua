
{

	actions=
	{
		{act=2,effect=0,},
	},
	
	desc=Lang.Skill.s14L1Desc,--技能的描述
	
	iconID=14,--图标的ID
			
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
						{type=5,mj=0,id=1000,keepTime=1000,delay=0,always=false},
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
			rangeCenter=1,			
			acts=
			{
				{
					targetType=1,
					conds={},
					results={},
					specialEffects=
					{
						{type=6,mj=0,id=45,keepTime=3200,delay=1100,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=1300,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=1600,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=1900,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=2200,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=2500,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=2800,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=3100,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=3400,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=3700,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=4000,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=4300,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=4600,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=4900,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=5200,always=true},
						{type=6,mj=0,id=45,keepTime=3200,delay=5500,always=true},					
					},
				},
			},
		},
		
		
		{

			xStart=-6,--相对于中心点x左边的相对坐标
			xEnd=6,--相对于中心点x右边的相对坐标
			yStart=-6,--相对于中心点y上边的相对坐标
			yEnd=6,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{

					conds=
					{
						{cond=13,value=1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=1100,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=1300,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=1600,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=1900,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=2200,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=2500,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=2800,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=3100,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=3400,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=3700,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=4000,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=4300,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=4600,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=4900,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=5200,rate=8000,value=0},
						{mj=0,timeParam=1,type=3,delay=5500,rate=8000,value=0},
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
		{cond=13,value=6,consume=true},
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=100,

},