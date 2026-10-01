--�����׹�4��
{

	actions=
	{
		{act=2,effect=0,},
	},
	
	desc=Lang.Skill.s14L6Desc,--���ܵ�����
	
	iconID=14,--ͼ����ID
			
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
					conds={},
					results={},
					specialEffects=
					{
						{type=4,mj=0,id=1004,keepTime=400,delay=400,always=true},					
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
			rangeCenter=1,			

			acts=
			{
				{

					conds=
					{
						{cond=13,value=1},
						{cond=5,value=1},
					},
					results=
					{
						{mj=0,timeParam=1,type=4,delay=0,rate=10600,value=1500,interval=90},
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
		--{cond=1,value=35,consume=false},--��ʾ�ȼ�����
		{cond=21,value=10,consume=false},
		{cond=6,value=2},

	},
	
	spellConds=
	{
		{cond=8,value=43,consume=true},--������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},