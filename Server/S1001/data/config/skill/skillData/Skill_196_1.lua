--11תBOSS��ǽ
{

	actions=
	{
		{act=1,effect=0,},
		--{act=2,effect=15,},
	},
	desc=Lang.Skill.s12L1Desc,
	iconID=13,
			

	actRange=
	{
		-------------------------------------------------------------------
		{
			xStart=-3,
			xEnd=3,
			yStart=-3,
			yEnd=3,
			rangeType=3,
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,

					conds=
					{
						{cond=1,value=1},
					},

					results=
					{
						{mj=0,timeParam=0,interval=8000,type=35,delay=0,rate=2000,value=10,id=1,fireLiveTime=20},
					},

					specialEffects=
					{
						{type=4,mj=0,id=16,keepTime=1000,delay=200,always=false},
					},

				},
			},
		},
		-------------------------------------------------------------------
		{

			xStart=-3,
			xEnd=3,
			yStart=-3,
			yEnd=3,
			rangeType=3,
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					
					conds=
					{
						{cond=1,value=1},
					},

					results=
					{
						{mj=0,timeParam=0,interval=8000,type=35,delay=0,rate=2000,value=10,id=1,fireLiveTime=20},
					},

					specialEffects=
					{
						{type=4,mj=0,id=16,keepTime=1000,delay=200,always=false},
			
					},

				},
			},
		},
		-------------------------------------------------------------------
		{
			xStart=-3,
			xEnd=3,
			yStart=-3,
			yEnd=3,
			rangeType=3,
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,

					conds=
					{
						{cond=1,value=1},
					},

					results=
					{
						{mj=0,timeParam=0,interval=8000,type=35,delay=0,rate=2000,value=10,id=1,fireLiveTime=20},
					},

					specialEffects=
					{
						{type=4,mj=0,id=16,keepTime=1000,delay=200,always=false},
		
					},
				},
			},
		},
		-------------------------------------------------------------------
		{	--//������Ч�ͷ�
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
						{type=5,mj=0,id=15,keepTime=0,delay=0,always=false},
					},
				},	
			},
		},
	},

	trainConds=
	{
		--{cond=1,value=30,consume=false},--��ʾ�ȼ�
	},
	
	spellConds=
	{
		{cond=13,value=5,consume=true},--����
	},

	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=2000,

},