--Ⱥ��ʩ����4��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s67L4Desc,--���ܵ�����
	
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

			xStart=-4,--���������ĵ�x���ߵ���������
			xEnd=4,--���������ĵ�x�ұߵ���������
			yStart=-4,--���������ĵ�y�ϱߵ���������
			yEnd=4,--���������ĵ�y�±ߵ���������
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
						{mj=0,timeParam=1,type=1,id=191, rate=-1700, rateType=10, delay=400},
						{mj=0,timeParam=1,type=1,id=192, rate=-1700, rateType=11, delay=400},
						{mj=0,timeParam=90,type=1,id=190, rate=-100, rateType=2, delay=400,value=-800,maxAttack =1},
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
		{cond=1,value=80,consume=false},--��ʾ�ȼ�
		{cond=6,value=3},
		--{cond=21,value=3000,consume=false},--��ʾ��Ҫ������
	},
	
	spellConds=
	{
		{cond=8,value=1000,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},