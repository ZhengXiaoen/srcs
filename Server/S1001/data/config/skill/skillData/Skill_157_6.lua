--���ض�5��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s157L6Desc,--���ܵ�����
	
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
						{mj=0,timeParam=1,type=3,delay=100, rate=11000,value=0},	
						
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
		--{cond=1,value=95,consume=false},--��ʾ�ȼ�
		{cond=21,value=20000,consume=false},--��ʾ��Ҫ������
		{cond=6,value=1},
	},
	
	spellConds=
	{
		{cond=8,value=100,consume=true},--������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=400,

},