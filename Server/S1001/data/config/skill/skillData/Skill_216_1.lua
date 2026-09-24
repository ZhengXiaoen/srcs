--7תBOSS60�����ͷų��ض�
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s180L1Desc,--���ܵ�����
	
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
			rangeCenter=0,

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
						{type=2,mj=0,id=50,keepTime=600,delay=0,always=false},
					},
				},
			},
		},
		
		
		
		
		{

			xStart=-25,--���������ĵ�x���ߵ���������
			xEnd=25,--���������ĵ�x�ұߵ���������
			yStart=-25,--���������ĵ�y�ϱߵ���������
			yEnd=25,--���������ĵ�y�±ߵ���������
			rangeType=3,				
			rangeCenter=1,	


		acts=
			{
				{
					targetType=0,
					conds=
					{

						{cond = 6,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=100, rate=10000,value=200},	

					},

					specialEffects=
					{
						{type=5,mj=0,id=47,keepTime=600,delay=0,always=false,copyRange=0},
					},
				},
			},
		},
		
	},

	trainConds=
	{
		--{cond=1,value=45,consume=false},--��ʾ�ȼ�

	},
	
	spellConds=
	{
		{cond=13,value=25,consume=true},
		--{cond=8,value=40,consume=true},--������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=500,

},