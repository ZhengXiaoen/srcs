--����5��
{

	actions=
	{
		{act=0,effect=1003,},
	},
	
	desc=Lang.Skill.s64L10Desc,--���ܵ�����
	
	iconID=9,--ͼ����ID
			
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
						{mj=0,timeParam=1,type=3,delay=0, rate=16000,value=6000},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=15300,value=5500},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=14800,value=5000},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=14300,value=4500},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=13800,value=4000},
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
		--{cond=1,value=50,consume=false},--��ʾ�ȼ�Ҫ60��
		{cond=21,value=300000,consume=false},
		{cond=6,value=1},
	},
	
	spellConds=
	{
		{cond=8,value=80,consume=true},--������200\
		{cond=35,value=1,consume=false},
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=12000,

},