--3תBOSS
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s173L1Desc,--���ܵ�����
	
	iconID=16,--ͼ����ID
			
	--���÷�Χ��
	actRange=
	{


		{

			xStart=0,--���������ĵ�x���ߵ���������
			xEnd=0,--���������ĵ�x�ұߵ���������
			yStart=0,--���������ĵ�y�ϱߵ���������
			yEnd=0,--���������ĵ�y�±ߵ���������
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
					},

					specialEffects=
					{
						{type=4,mj=0,id=51,keepTime=700,delay=100,always=true},					
					},
				},
			},
		},
		
		
		{

			xStart=-3,--���������ĵ�x���ߵ���������
			xEnd=3,--���������ĵ�x�ұߵ���������
			yStart=-3,--���������ĵ�y�ϱߵ���������
			yEnd=3,--���������ĵ�y�±ߵ���������
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
						{mj=0,timeParam=1,type=3,delay=100, rate=10000,value=0},	
						
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


	},
	
	spellConds=
	{
		{cond=13,value=12,consume=true},--��������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=300,

},