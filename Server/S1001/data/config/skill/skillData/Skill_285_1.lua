--ħ�������˺�3������
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s171L1Desc,--���ܵ�����
	
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
						{type=5,mj=0,id=1013,keepTime=800,delay=0,always=false},
					},
				},
			},
		},
		
		
		
		
		{

			xStart=0,--���������ĵ�x���ߵ���������
			xEnd=0,--���������ĵ�x�ұߵ���������
			yStart=0,--���������ĵ�y�ϱߵ���������
			yEnd=0,--���������ĵ�y�±ߵ���������
			rangeType=0,				
			rangeCenter=0,	


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
						{mj=0,timeParam=1,type=4,delay=100, rate=100000,value=200},	

					},

					specialEffects=
					{
						{type=5,mj=0,id=126,keepTime=700,delay=3000,always=false}, --,copyRange=1  ������Ŀ��������Ч
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
		{cond=13,value=5,consume=true},
		--{cond=8,value=40,consume=true},--������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=400,

},