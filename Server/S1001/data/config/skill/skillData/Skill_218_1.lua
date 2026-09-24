--Ⱥ��ʩ����4��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s67L5Desc,--���ܵ�����
	
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

			xStart=-25,--���������ĵ�x���ߵ���������
			xEnd=25,--���������ĵ�x�ұߵ���������
			yStart=-25,--���������ĵ�y�ϱߵ���������
			yEnd=25,--���������ĵ�y�±ߵ���������
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
						{mj=0,timeParam=1,type=1,id=194, rate=-2000, rateType=10, delay=400},
						{mj=0,timeParam=1,type=1,id=195, rate=-2000, rateType=11, delay=400},
						{mj=0,timeParam=90,type=1,id=193, rate=-1000, rateType=2, delay=400,maxDamage=1000,},
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
		{cond=1,value=90,consume=false},--��ʾ�ȼ�
		--{cond=21,value=3000,consume=false},--��ʾ��Ҫ������
	},
	
	spellConds=
	{
		{cond=8,value=1000,consume=true},--������10
		{cond=13,value=25,consume=true},--攻击距离
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},