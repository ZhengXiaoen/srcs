--����5��
{

	actions=
	{
		{act=0,effect=1003,},
	},
	
	desc=Lang.Skill.s64L5Desc,--���ܵ�����
	
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
						{mj=0,timeParam=1,type=3,delay=0, rate=15000,value=0},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=14000,value=0},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=13000,value=0},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=12000,value=0},
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
						{mj=0,timeParam=1,type=3,delay=300, rate=11000,value=0},
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
		{cond=1,value=50,consume=false},--��ʾ�ȼ�Ҫ60��
		{cond=6,value=1},
		--{cond=21,value=1000,consume=false},--��ʾ��Ҫ������
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