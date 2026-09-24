--������1��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s22L1Desc,--���ܵ�����
	
	iconID=22,--ͼ���ID
			
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
						{type=5,mj=0,id=36,keepTime=0,delay=0,always=false},
					},
				},
			},
		},
		{

		xStart=0,--��������ĵ�x��ߵ��������
		xEnd=0,--��������ĵ�x�ұߵ��������
		yStart=-0,--��������ĵ�y�ϱߵ��������
		yEnd=0,--��������ĵ�y�±ߵ��������
		rangeType=3,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 3,value =1}, --���Լ���һ��buff
						{cond = 17,value =63,param=115}, 
					},
					results=
					{
						--{mj=0,timeParam=1,type=1,buffType=63, id=39,delay=0,interval=20,intervalRate=2500,intervalAddType=2},
						{mj=0,timeParam=1,type=1,buffType=63, id=19,delay=0,interval=10},
					},

					specialEffects=
					{
						--{type=3,mj=0,id=36,keepTime=10000,delay=500,always=false},				
					},
				},
			},
		},
		
	},

	trainConds=
	{
		{cond=1,value=30,consume=false},--��ʾ�ȼ�Ҫ1��
		--{cond=3,value=445,consume=true},--��ʾ�鱾
		{cond=6,value=3},
	},
	
	spellConds=
	{
		{cond=8,value=7,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},