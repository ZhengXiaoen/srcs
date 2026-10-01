--�����䵶4��
{

	actions=
	{
		{act=0,effect=4,},
	},
	
	desc=Lang.Skill.s4L10Desc,--���ܵ�����
	
	iconID=4,--ͼ����ID
			
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

						{cond = 1,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=300, rate=10000,value=0},
					},

					specialEffects=
					{

					},
				},
			},
		},
		
		{

		xStart=-1,--���������ĵ�x���ߵ���������
		xEnd=-1,--���������ĵ�x�ұߵ���������
		yStart=-1,--���������ĵ�y�ϱߵ���������
		yEnd=-1,--���������ĵ�y�±ߵ���������
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 1,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=300, rate=10500,value=2500},
					},

					specialEffects=
					{

					},
				},
			},
		},
		
		
		{

		xStart=1,--���������ĵ�x���ߵ���������
		xEnd=1,--���������ĵ�x�ұߵ���������
		yStart=-1,--���������ĵ�y�ϱߵ���������
		yEnd=0,--���������ĵ�y�±ߵ���������
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 1,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=300, rate=10500,value=2500},
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
		--{cond=1,value=50,consume=false},--��ʾ�ȼ�Ҫ50��
		{cond=21,value=10,consume=false},--��ʾ��Ҫ������
		{cond=6,value=1},
	},
	
	spellConds=
	{
		{cond=8,value=3,consume=true},--������35
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=580,

},