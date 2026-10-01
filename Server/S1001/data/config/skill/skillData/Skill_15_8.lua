--ħ����4��
{

	actions=
	{
		{act=1,effect=19,},
		--{act=2,effect=19,},
	},
	
	desc=Lang.Skill.s15L8Desc,--���ܵ�����
	
	iconID=15,--ͼ����ID
			
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

					conds=
					{

						{cond = 3,value =1},
						{cond = 17,value =54,param=112},			
					},
					results=
					{
						{timeParam=1,type=1,delay=300,id=290,rate=0,intervalRate=1000,maxDur=300,intervalAddType=1,},
					},

					specialEffects=
					{
						{type=4,mj=0,id=20,keepTime=80000,delay=0,always=false},
					},
				},
			},
		},
		
	},

	trainConds=
	{
		--{cond=1,value=55,consume=false},--��ʾ�ȼ�Ҫ1��
		{cond=21,value=10,consume=false},
		{cond=6,value=2},
	},
	
	spellConds=
	{
		{cond=8,value=250,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=1600,

},