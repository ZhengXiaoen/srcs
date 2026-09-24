--�һ𽣷�1��
{

	actions=
	{
		{act=0,effect=1002,},
	},
	
	desc=Lang.Skill.s6L1Desc,--���ܵ�����
	
	iconID=6,--ͼ����ID
			
	--���÷�Χ��
	actRange=
	{
		------------------------------------------------------------------------
		--//ǰ��Ŀ���һ������˺�
		------------------------------------------------------------------------
		{
		xStart=0,--���������ĵ�x���ߵ���������
		xEnd=0,--���������ĵ�x�ұߵ���������
		yStart=-0,--���������ĵ�y�ϱߵ���������
		yEnd=0,--���������ĵ�y�±ߵ���������
		rangeType=0,				
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
						{mj=0,timeParam=1,type=3,delay=300, rate=12000,value=10},
					},

					specialEffects=
					{
					},
				},
			},
		},
		------------------------------------------------------------------------
		--//��Χ1���˺�
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
		------------------------------------------------------------------------


	},

	trainConds=
	{
		{cond=1,value=1,consume=false},--��ʾ�ȼ�Ҫ40��
		--{cond=21,value=1000,consume=false},--��ʾ��Ҫ������
	},
	
	spellConds=
	{
		--{cond=8,value=5,consume=true},--������5\
		{cond=13,value=1,consume=false},--13:��Ŀ���ľ�������С�ڵ���һ���ľ���,value��ʾ���� ���˾���ʹ��x,����y�������ľ����ľ���ֵ������ֵ��Ϊ���룩
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=15000,

},