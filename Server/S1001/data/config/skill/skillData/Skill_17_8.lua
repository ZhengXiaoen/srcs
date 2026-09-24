--������3��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s17L8Desc,--���ܵ�����
	
	iconID=19,--ͼ����ID
			
	--���÷�Χ��
	actRange=
	{
	
		
		{

			xStart=-1,--���������ĵ�x���ߵ���������
			xEnd=1,--���������ĵ�x�ұߵ���������
			yStart=-1,--���������ĵ�y�ϱߵ���������
			yEnd=1,--���������ĵ�y�±ߵ���������
			rangeType=3,				
			rangeCenter=2,		

			acts=
			{
				{

					conds=
					{

						{cond = 13,value =0},
					--	{cond = 17,value =1,param=113},										
					},
					results=
					{
						{mj=0,timeParam=100,type=20,delay=0,vt=1, id=297,value=1},--���Ӽ��ܱ���							
						{mj=0,timeParam=10,type=1,delay=0, id=297,rate=500,rateType=2,},
					},

					specialEffects=
					{
						{type=4,mj=0,id=1012,keepTime=500,delay=500,always=false},	
					},
				},
			},
		},
		
		{	
			xStart=-1,--���������ĵ�x���ߵ���������
			xEnd=1,--���������ĵ�x�ұߵ���������
			yStart=-1,--���������ĵ�y�ϱߵ���������
			yEnd=1,--���������ĵ�y�±ߵ���������
			rangeType=3,				
			rangeCenter=1,	
			
			acts=
			{
				{

					conds=
					{
						{cond = 22,value =17}, --û������Ŀ����ʱ�򣬲���Ҫ������Ч
						{cond = 3,value =1},						
					},
					results=
					{
						{mj=0,timeParam=10,type=1,delay=0, id=297,rate=500,rateType=2,},
					},
					specialEffects=
					{
						{type=4,mj=0,id=1012,keepTime=500,delay=500,always=false},	
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
			rangeCenter=1,
			
			acts=
			{
				{
					targetType=0	,
					conds=
					{
						{cond = 3,value =1}, --ʩ�����Լ�ɾ�����ܱ���
					},
					results=
					{
						{mj=0,timeParam=1,type=21,delay=0, id=297,vt=1}, --ɾ���Լ��ļ��ܱ���

					},
					specialEffects=
					{
					
					},
				},
			},
		},
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
						{type=5,mj=0,id=1011,keepTime=0,delay=0,always=false},
					},
	                     },
	           },
		},
	},

	trainConds=
	{
		--{cond=1,value=25,consume=false},--��ʾ�ȼ�Ҫ1��
		{cond=21,value=120000,consume=false},--��ʾ��Ҫ������
		{cond=6,value=3},
	},
	
	spellConds=
	{
		{cond=8,value=24,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},