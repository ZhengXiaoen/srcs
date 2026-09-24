--ʩ����4��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s19L6Desc,--���ܵ�����
	
	iconID=21,--ͼ����ID
			
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
						{type=4,mj=0,id=28,keepTime=400,delay=0,always=true},					
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
					targetType=0,
					conds=
					{
						{cond = 13,value =1},							
					},
					results=
					{
						{mj=0,timeParam=180,type=1,id=303, rate=-200, rateType=2, delay=0,value=-2500,maxAttack =1},--,maxDamage=1000,
						{mj=0,timeParam=1,type=1,id=304, rate=-2600, rateType=10, delay=0},
						{mj=0,timeParam=1,type=1,id=305, rate=-2600, rateType=11, delay=0},
					},

					specialEffects=
					{
						{type=4,mj=0,id=29,keepTime=400,delay=400,always=false},					
					},
				},
			},
		},
		
		
	
	},


	trainConds=
	{
		--{cond=1,value=40,consume=false},--��ʾ�ȼ�
		{cond=21,value=30000,consume=false},
		{cond=6,value=3},
	},
	
	spellConds=
	{
		{cond=8,value=22,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},