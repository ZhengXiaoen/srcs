--Ⱥ��ʩ����4��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s67L10Desc,--���ܵ�����
	
	iconID=26,--ͼ����ID
			
	--���÷�Χ��
	actRange=
	{
		
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
					{},
					results=
					{},
					specialEffects=
					{
						{type=4,mj=0,id=1007,keepTime=400,delay=0,always=true},					
					},
				},
			},
		},
		
		{

			xStart=-5,--���������ĵ�x���ߵ���������
			xEnd=5,--���������ĵ�x�ұߵ���������
			yStart=-5,--���������ĵ�y�ϱߵ���������
			yEnd=5,--���������ĵ�y�±ߵ���������
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
						{mj=0,timeParam=90,type=1,id=342, rate=-100, rateType=2, delay=400,value=-3500,maxAttack =1},
						{mj=0,timeParam=1,type=1,id=343, rate=-3000, rateType=10, delay=400},
						{mj=0,timeParam=1,type=1,id=344, rate=-3000, rateType=11, delay=400},
					},

					specialEffects=
					{
						{type=4,mj=0,id=1008,keepTime=400,delay=400,always=false},					
					},
				},
			},
		},
		
		
	
	},

	trainConds=
	{
		--{cond=1,value=90,consume=false},--��ʾ�ȼ�
		{cond=21,value=10,consume=false},
		{cond=6,value=3},
	},
	
	spellConds=
	{
		{cond=8,value=1000,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},