--Ⱥ���׵���4��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s156L10Desc,--���ܵ�����
	
	iconID=156,--ͼ����ID
			
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
						{type=5,mj=0,id=12,keepTime=0,delay=0,always=false},
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
						{type=4,mj=0,id=10009,keepTime=400,delay=100,always=true},					
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
						{mj=0,timeParam=1,type=4,delay=100, rate=12000,value=1500},	
						
					},

					specialEffects=
					{
				        {type=5,mj=0,id=10009,keepTime=0,delay=0,always=false},
					},
				},
			},
		},
		
	},

	trainConds=
	{
		--{cond=1,value=95,consume=false},--��ʾ�ȼ�
		{cond=21,value=300000,consume=false},--��ʾ��Ҫ������
		{cond=6,value=2},
	},
	
	spellConds=
	{
		{cond=8,value=3000,consume=true},--������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},