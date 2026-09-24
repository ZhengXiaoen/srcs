--˲Ϣ�ƶ�1��
{

	actions=
	{

	},
	
	desc=Lang.Skill.s10L1Desc,--���ܵ�����
	
	iconID=12,--ͼ���ID
			
	--���÷�Χ��
	actRange=
	{
	
	{

		xStart=0,--��������ĵ�x��ߵ��������
		xEnd=0,--��������ĵ�x�ұߵ��������
		yStart=-0,--��������ĵ�y�ϱߵ��������
		yEnd=0,--��������ĵ�y�±ߵ��������
		rangeType=3,				
		rangeCenter=1,			

		acts=
			{
				{
					targetType=1,
					conds=
					{

					},
					results=
					{

					},

					specialEffects=
					{
						{type=4,mj=0,id=14,keepTime=500,delay=100,always=true},
					},
				},
			},
		},
	
		{

		xStart=0,--��������ĵ�x��ߵ��������
		xEnd=0,--��������ĵ�x�ұߵ��������
		yStart=-0,--��������ĵ�y�ϱߵ��������
		yEnd=0,--��������ĵ�y�±ߵ��������
		rangeType=3,				
		rangeCenter=2,			

		acts=
			{
				{
					targetType=1,
					conds=
					{
						
					},
					results=
					{
						{mj=0,delay=100,timeParam=1,type=39,value=14,aiId=1,id=0},
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
		{cond=1,value=5,consume=false},--��ʾ�ȼ�Ҫ20��

	},
	
	spellConds=
	{
		{cond=8,value=5,consume=true},--������500
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=10000,

},