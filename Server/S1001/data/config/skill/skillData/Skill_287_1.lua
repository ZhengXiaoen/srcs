--��������3������
{

	actions=
	{
		{act=0,effect=1000,},
	},
	
	desc=Lang.Skill.s63L1Desc,--���ܵ�����
	
	iconID=8,--ͼ����ID
			
	--���÷�Χ��
	actRange=
	{
		{

			xStart=0,--���������ĵ�x���ߵ���������
			xEnd=0,--���������ĵ�x�ұߵ���������
			yStart=-1,--���������ĵ�y�ϱߵ���������
			yEnd=-1,--���������ĵ�y�±ߵ���������
			rangeType=2,				
			rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=0, rate=50000,value=0},
					},

					specialEffects=
					{
					},
				},
			},
		},
		
		{

			xStart=0,--���������ĵ�x���ߵ���������
			xEnd=0,--���������ĵ�x�ұߵ���������
			yStart=-2,--���������ĵ�y�ϱߵ���������
			yEnd=-2,--���������ĵ�y�±ߵ���������
			rangeType=2,				
			rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{					
						{type=34,value=1},					
						{mj=0,timeParam=1,type=3,delay=300, rate=50000,value=0},
					},

					specialEffects=
					{
					},
				},
			},
		},

		{

			xStart=0,--���������ĵ�x���ߵ���������
			xEnd=0,--���������ĵ�x�ұߵ���������
			yStart=-3,--���������ĵ�y�ϱߵ���������
			yEnd=-3,--���������ĵ�y�±ߵ���������
			rangeType=2,				
			rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=50000,value=0},
					},

					specialEffects=
					{
					},
				},
			},
		},

		{

			xStart=0,--���������ĵ�x���ߵ���������
			xEnd=0,--���������ĵ�x�ұߵ���������
			yStart=-4,--���������ĵ�y�ϱߵ���������
			yEnd=-4,--���������ĵ�y�±ߵ���������
			rangeType=2,				
			rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=50000,value=0},
					},

					specialEffects=
					{
					},
				},
			},
		},

		{

			xStart=0,--���������ĵ�x���ߵ���������
			xEnd=0,--���������ĵ�x�ұߵ���������
			yStart=-5,--���������ĵ�y�ϱߵ���������
			yEnd=-5,--���������ĵ�y�±ߵ���������
			rangeType=2,				
			rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=50000,value=0},
					},

					specialEffects=
					{
					},
				},
			},
		},
		{	--//������Ч�ͷ�
				xStart=-3,
				xEnd=3,
				yStart=-3,
				yEnd=3,
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
								{type=6,mj=0,id=1001,keepTime=5000,delay=0,always=false},
							},
						},	
					},
		},

	},


	trainConds=
	{
		--{cond=1,value=50,consume=false},--��ʾ�ȼ�Ҫ60��
		--{cond=21,value=1000,consume=false},--��ʾ��Ҫ������
	},
	
	spellConds=
	{
		{cond=13,value=3,consume=true},
		--{cond=35,value=1,consume=false},
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=1000,

},