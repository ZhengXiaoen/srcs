--�һ𽣷�4��
{

	actions=
	{
		{act=0,effect=1002,},
	},
	
	desc=Lang.Skill.s6L10Desc,--���ܵ�����
	
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
						{mj=0,timeParam=1,type=3,delay=300, rate=16500,value=10000},
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

		xStart=-3,--���������ĵ�x���ߵ���������
		xEnd=-3,--���������ĵ�x�ұߵ���������
		yStart=-3,--���������ĵ�y�ϱߵ���������
		yEnd=-3,--���������ĵ�y�±ߵ���������
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
						{mj=0,timeParam=1,type=3,delay=300, rate=16500,value=10000},
					},

					specialEffects=
					{
					},
				},
			},
		},
		
		
		{

		xStart=3,--���������ĵ�x���ߵ���������
		xEnd=3,--���������ĵ�x�ұߵ���������
		yStart=-3,--���������ĵ�y�ϱߵ���������
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
						{mj=0,timeParam=1,type=3,delay=300, rate=16500,value=10000},
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
		--{cond=6,value=1,consume=false},--սʿְҵ
		{cond=21,value=200000,consume=false},
		{cond=6,value=1},
	},
	
	spellConds=
	{
		{cond=8,value=12,consume=true},--������350
		{cond=13,value=3,consume=false},--13:��Ŀ���ľ�������С�ڵ���һ���ľ���,value��ʾ���� ���˾���ʹ��x,����y�������ľ����ľ���ֵ������ֵ��Ϊ���룩
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=15000,

},