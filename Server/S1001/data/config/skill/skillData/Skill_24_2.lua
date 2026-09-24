--������2��
{

	actions=
	{
		{act=1,effect=38,},
	},
	
	desc=Lang.Skill.s24L2Desc,--���ܵ�����
	
	iconID=24,--ͼ����ID
			
	--���÷�Χ��
	actRange=
	{
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
					targetType=1,
					conds=
					{

						
					},
					results=
					{
					},

					specialEffects=
					{
					--{type=3,mj=0,id=67,keepTime=60,delay=200,always=false},	
					{type=4,mj=0,id=39,keepTime=380,delay=450,always=false},						
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
		rangeCenter=2,			

		acts=
			{
				{

					conds=
					{
						{cond = 13,value =0},
						-- {cond = 17,value =23,param=116},		
						-- {cond = 17,value =27,param=116},									
					},
					results=
					{
						{mj=0,timeParam=4,type=1,delay=500, rate=800, rateType=5, id=24,},
						{mj=0,timeParam=4,type=1,delay=500, rate=800, rateType=6, id=25,},						
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
		--{cond=1,value=50,consume=false},--��ʾ�ȼ�Ҫ1��
		{cond=21,value=1500,consume=false},--��ʾ��Ҫ������
		{cond=6,value=3},
	},
	
	spellConds=
	{
		{cond=8,value=61,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=3000,

},