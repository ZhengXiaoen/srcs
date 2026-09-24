--Ⱥ��ʩ����1��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s67L3Desc,--���ܵ�����
	
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
						{mj=0,timeParam=1,type=1,id=100, rate=-1500, rateType=10, delay=400},
						{mj=0,timeParam=1,type=1,id=101, rate=-1500, rateType=11, delay=400},
						{mj=0,timeParam=90,type=1,id=99, rate=-100, rateType=2, delay=400,value=-600,maxAttack =1},
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
		{cond=1,value=75,consume=false},--��ʾ�ȼ�
		{cond=6,value=3},
		--{cond=21,value=6000,consume=false},--��ʾ��Ҫ������
	},
	
	spellConds=
	{
		{cond=8,value=90,consume=true},--������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},