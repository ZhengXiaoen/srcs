--5תBOSS��20���ʳ��ֵ���2���˺�
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s9L1Desc,--���ܵ�����
	
	iconID=11,--ͼ����ID
			
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
						{type=4,mj=0,id=30,keepTime=600,delay=0,always=false},
					},
				},	
			},
		},


		{

			xStart=-8,--���������ĵ�x���ߵ���������
			xEnd=8,--���������ĵ�x�ұߵ���������
			yStart=-8,--���������ĵ�y�ϱߵ���������
			yEnd=8,--���������ĵ�y�±ߵ���������
			rangeType=3,				
			rangeCenter=1,			

			acts=
				{
					{

					conds=
					{
						{cond=6,value=1},
                       				
					},
					results=
					{
	
						{mj=0,timeParam=1,type=3,delay=3000,rate=10000,value=0},
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
				yStart=0,--���������ĵ�y�ϱߵ���������
				yEnd=0,--���������ĵ�y�±ߵ���������
				rangeType=3,				
				rangeCenter=1,			

				acts=
				{
					{
					targetType=1,
					conds=
					{
						{cond=6,value=1},
					},
					results=
					{
					},

					specialEffects=
					{	
						{type=4,mj=0,id=32,keepTime=0,delay=3000,always=true},				
					},
				},
			},
		},
		
	},

	trainConds=
	--��������
	{

	},
	
	spellConds=
	--�ͷ�����
	{

       	{cond=13,value=8,consume=true},--��������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=500,

},