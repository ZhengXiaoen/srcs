--˲Ϣ�ƶ�3��
{

	actions=
	{

	},
	
	desc=Lang.Skill.s10L3Desc,--���ܵ�����
	
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
		{cond=1,value=40,consume=false},--��ʾ�ȼ�Ҫ40��
		{cond=21,value=10,consume=false},--��ʾ��Ҫ������
	},
	
	spellConds=
	{
		{cond=8,value=43,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=10000,

},