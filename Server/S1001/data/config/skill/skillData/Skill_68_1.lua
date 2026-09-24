--�򽣹���1��սʿ����

{

	actions=
	{
		{act=1,effect=51,},
	},
	
	desc=Lang.Skill.s68L1Desc,--���ܵ�����
	
	iconID=68,--ͼ����ID
			
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
			acts={{conds={{cond=3,value=1},},results={},specialEffects={{type=5,mj=0,id=50,keepTime=0,delay=0,always=false},},},},
		},
		
		
		{ 
			xStart=-10,--���������ĵ�x���ߵ���������
			xEnd=10,--���������ĵ�x�ұߵ���������
			yStart=-10,--���������ĵ�y�ϱߵ���������
			yEnd=10,--���������ĵ�y�±ߵ���������
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					--targetType=0,
					conds=
					{

					   {cond = 13,value =1},
					
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=300, rate=12000,value=1},
				    },

					specialEffects=
					{  

					},
				},
			},
		},
		
		
		{
			xStart=-10,--���������ĵ�x���ߵ���������
			xEnd=10,--���������ĵ�x�ұߵ���������
			yStart=-10,--���������ĵ�y�ϱߵ���������
			yEnd=10,--���������ĵ�y�±ߵ���������
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{
						{cond = 13,value =1},
					},
					results=
					{
					
					},

					specialEffects=
					{
						{type=4,mj=0,id=51,keepTime=2000,delay=300,always=false},

					},
				},
			},
	     },
   },	
		
	trainConds=
	{
		--{cond=1,value=80,consume=false},--��ʾ�ȼ�Ҫ1��
		--{cond=21,value=2000,consume=false},--��ʾ��Ҫ������
	},
	
	spellConds=
	{
		--{cond=8,value=300,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=120000,

} ,