--��ǽ2��
{

	actions=
	{
		{act=1,effect=0,},
		--{act=2,effect=15,},
	},
	desc=Lang.Skill.s12L2Desc,
	iconID=13,
			

	actRange=
	{
		-------------------------------------------------------------------
		{
			xStart=-1,
			xEnd=-1,
			yStart=0,
			yEnd=0,
			rangeType=3,
			rangeCenter=2,			

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
						{mj=0,timeParam=0,interval=15000,type=35,delay=0,rate=5500,value=20,id=1,fireLiveTime=45},
					},

					specialEffects=
					{
						{type=4,mj=0,id=16,keepTime=1200,delay=200,always=false},
					},

				},
			},
		},
		-------------------------------------------------------------------
		{

			xStart=1,
			xEnd=1,
			yStart=0,
			yEnd=0,
			rangeType=3,
			rangeCenter=2,			

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
						{mj=0,timeParam=0,interval=15000,type=35,delay=0,rate=5500,value=20,id=1,fireLiveTime=45},
					},

					specialEffects=
					{
			
					},

				},
			},
		},
		-------------------------------------------------------------------
		{
			xStart=0,
			xEnd=0,
			yStart=-1,
			yEnd=1,
			rangeType=3,
			rangeCenter=2,			

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
						{mj=0,timeParam=0,interval=15000,type=35,delay=0,rate=5500,value=20,id=1,fireLiveTime=45},
					},

					specialEffects=
					{
		
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
		--{cond=1,value=40,consume=false},--��ʾ�ȼ�
		{cond=21,value=10,consume=false},--��ʾ��Ҫ������
		{cond=6,value=2},
	},
	
	spellConds=
	{
		{cond=8,value=25,consume=true},--������
	},

	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},