--����ն4��
{

	actions=
	{
		{act=0,effect=1001,},
	},
	
	desc=Lang.Skill.s63L5Desc,--���ܵ�����
	
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

						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,  rate=13400,value=3000},
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

						{cond = 13,value =1},
					},
					results=
					{					
						{type=34,value=1},					
						{mj=0,timeParam=1,type=3,delay=300, rate=12700,value=2700},
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

						{cond = 13,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=12200,value=2400},
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

						{cond = 13,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=11700,value=2100},
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

						{cond = 13,value =1},
					},
					results=
					{										
						{mj=0,timeParam=1,type=3,delay=300, rate=11200,value=1800},
					},

					specialEffects=
					{
					},
				},
			},
		},
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
								{type=5,mj=0,id=1000,keepTime=0,delay=0,always=false},
							},
						},	
					},
		},
	},

	trainConds=
	{
		--{cond=1,value=60,consume=false},--��ʾ�ȼ�Ҫ70��
		{cond=21,value=10000,consume=false},
		{cond=6,value=1},
	},
	
	spellConds=
	{
		{cond=8,value=160,consume=true},--������400\
		{cond=35,value=1,consume=false},
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=12000,

},