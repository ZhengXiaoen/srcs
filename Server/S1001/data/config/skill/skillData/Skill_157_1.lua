--���ض�
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s157L1Desc,--���ܵ�����
	
	iconID=157,--ͼ����ID
			
	--���÷�Χ��
	actRange=
	{
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
						{type=5,mj=0,id=50,keepTime=0,delay=0,always=false},
					},
				},
			},
		},
		
		
		{

			xStart=-2,--���������ĵ�x���ߵ���������
			xEnd=2,--���������ĵ�x�ұߵ���������
			yStart=-2,--���������ĵ�y�ϱߵ���������
			yEnd=2,--���������ĵ�y�±ߵ���������
			rangeType=3,				
			rangeCenter=2,			

		acts=
			{
				{
					targetType=0,
					conds=
					{

						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=100, rate=8000,value=0},	
						
					},

					specialEffects=
					{
						{type=5,mj=0,id=47,keepTime=0,delay=0,always=false},
					},
				},
			},
		},
		
	},

	trainConds=
	{
		{cond=1,value=16,consume=false},--��ʾ�ȼ�
		{cond=6,value=1},
		
	},
	
	spellConds=
	{
		{cond=8,value=40,consume=true},--������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=400,

},