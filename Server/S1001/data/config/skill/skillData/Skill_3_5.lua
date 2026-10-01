--��ɱ����4��
{

	actions=
	{
		{act=0,effect=3,},
	},
	
	desc=Lang.Skill.s3L5Desc,--���ܵ�����
	
	iconID=3,--ͼ����ID
			
	--���÷�Χ��
	actRange=
	{
		{

		xStart=0,--���������ĵ�x���ߵ���������
		xEnd=0,--���������ĵ�x�ұߵ���������
		yStart=-1,--���������ĵ�y�ϱߵ���������
		yEnd=-1,--���������ĵ�y�±ߵ���������
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 13,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=3,delay=0, rate=10400,value=1000},
					},

					specialEffects=
					{

					},
				},
			},
		},
		
		{

		xStart=0,--���������ĵ�x���ߵ���������
		xEnd=0,--���������ĵ�x�ұߵ���������
		yStart=-2,--���������ĵ�y�ϱߵ���������
		yEnd=-2,--���������ĵ�y�±ߵ���������
		rangeType=2,				
		rangeCenter=1,			

		acts=
			{
				{

					conds=
					{

						{cond = 13,value =1},
					},
					results=
					{					
						{type=34,value=1},					
						{mj=0,timeParam=1,type=3,delay=300, rate=10400,value=1000},
					},

					specialEffects=
					{

					},
				},
			},
		},
                {
		    xStart=0,--���������ĵ�x���ߵ���������
		    xEnd=0,--���������ĵ�x�ұߵ���������
		    yStart=-3,--���������ĵ�y�ϱߵ���������
		    yEnd=-3,--���������ĵ�y�±ߵ���������
		    rangeType=2,				
		    rangeCenter=1,			
		    acts=
			    {
				    {
					    conds=
					    {
						    {cond = 13,value =1},
					    },
					    results=
					    {					
						    {type=34,value=1},					
						    {mj=0,timeParam=1,type=3,delay=300, rate=10400,value=1000},
					    },
					    specialEffects=
					    {
					    },
				    },
			    },
		},
        {
		    xStart=0,--���������ĵ�x���ߵ���������
		    xEnd=0,--���������ĵ�x�ұߵ���������
		    yStart=-4,--���������ĵ�y�ϱߵ���������
		    yEnd=-4,--���������ĵ�y�±ߵ���������
		    rangeType=2,				
		    rangeCenter=1,			
		    acts=
			    {
				    {
					    conds=
					    {
						    {cond = 13,value =1},
					    },
					    results=
					    {					
						    {type=34,value=1},					
						    {mj=0,timeParam=1,type=3,delay=300, rate=10400,value=1000},
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
		--{cond=6,value=1,consume=false},--սʿְҵ
		{cond=21,value=10,consume=false},
		{cond=6,value=1},
	},
	
	spellConds=
	{
	{cond=13,value=4,consume=false},--13:��Ŀ���ľ�������С�ڵ���һ���ľ���,value��ʾ���� ���˾���ʹ��x,����y�������ľ����ľ���ֵ������ֵ��Ϊ���룩
	{cond=35,value=1,consume=false},--35:��Ŀ����Ҫ��8����ֱ����(�пͻ��˴����������������＼�ܴ�ɱ�Լ�)
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=580,

},