--쫷���1��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s155L1Desc,--���ܵ�����
	
	iconID=16,--ͼ����ID
			
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
						{type=5,mj=0,id=1005,keepTime=0,delay=0,always=false},
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
					targetType=1,
					conds=
					{	
					},
					results=
					{
					},

					specialEffects=
					{
						{type=4,mj=0,id=1006,keepTime=400,delay=100,always=true},					
					},
				},
			},
		},
		
		{

			xStart=-2,--���������ĵ�x���ߵ���������
			xEnd=2,--���������ĵ�x�ұߵ���������
			yStart=-2,--���������ĵ�y�ϱߵ���������
			yEnd=2,--���������ĵ�y�±ߵ���������
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
						{mj=0,timeParam=1,type=3,delay=200, rate=11500,value=0},	
						
					},

					specialEffects=
					{
--                        {type=5,mj=0,id=1005,keepTime=0,delay=0,always=false},
--				            {type=4,mj=0,id=1006,keepTime=400,delay=100,always=true},			
					},
				},
			},
		},
		
	},

	trainConds=
	{
		-- {cond=1,value=16,consume=false},--��ʾ�ȼ�
		-- {cond=6,value=3},

	},
	
	spellConds=
	{
		-- {cond=8,value=40,consume=true},--������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},