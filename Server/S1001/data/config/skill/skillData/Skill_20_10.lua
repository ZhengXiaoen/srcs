--��������4��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s20L10Desc,--���ܵ�����
	
	iconID=20,--ͼ����ID
			
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
						{type=5,mj=0,id=30,keepTime=0,delay=0,always=false},
					},
				},
			},
		},
		{
			xStart=0,--���������ĵ�x���ߵ���������
			xEnd=0,--���������ĵ�x�ұߵ���������
			yStart=0,--���������ĵ�y�ϱߵ���������
			yEnd=0,--���������ĵ�y�±ߵ���������
			rangeType=3,--3:��Χ(Ⱥ��)
			rangeCenter=1,--1:������ת(����)

			acts=
			{
				{
					conds=
					{
					
					},
					results=
					{
					
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
			yStart=0,--���������ĵ�y�ϱߵ���������
			yEnd=0,--���������ĵ�y�±ߵ���������
			rangeType=0,--0:�޷�Χ��������Ŀ���ĵ��弼��(����)
			rangeCenter=2,--2:���Է�Χ(Ⱥ��)

			acts=
			{
				{
					--targetType=1,
					conds=
					{
						{cond = 1,value =1},
						{cond = 22,value =56},
					},
					results=
					{
						{mj=0,timeParam=1,type=33,delay=200, rate=11500,value=3500},
						{mj=0,timeParam=30,type=20,delay=0,vt=1, id=20,value=1},
					},
					specialEffects=
					{
						{type=3,mj=0,id=31,keepTime=50,delay=10,always=false},
						--{type=4,mj=0,id=32,keepTime=450,delay=200,always=false, checkDistance = 1},--
                        --{type=4,mj=0,id=32,keepTime=450,delay=200,always=false},
						--type:��Ч������,��Ч��=0,����=1,Ͷ��=2,����=3,��ը=4��Ŀ�����ϵ���Ч��,���³���=5,����=6
					},
				},
			},
		},


--		{

--			xStart=0,--���������ĵ�x���ߵ���������
--			xEnd=0,--���������ĵ�x�ұߵ���������
--			yStart=-13,--���������ĵ�y�ϱߵ���������
--			yEnd=-13,--���������ĵ�y�±ߵ���������
--			rangeType=4,--4:�����ĵ���������λ�õ�������Ϊ��ת����ת����������ת����ȷ�����ڷ�ʦ�Ļ�����			
--			rangeCenter=1,--1:������ת(����)	

--			acts=
--			{
--				{
--					targetType=1,--û��Ŀ��ɸѡҲ����ʩ�ţ�������always ��Ч������Ҫ����1������������������������λ���Ƿ���Ŀ�꣬��Ҫ�ͷ�һ�Ż�
--					conds=
--					{
--						{cond = 22,value =20},
--					},
--					results=
--					{

--					},

--					specialEffects=
--					{		
--						{type=1,mj=0,id=31,keepTime=450,delay=10,always=false, checkDistance = 1},			
--					},
--				},
--			},
--		},
		
		{

			xStart=0,--���������ĵ�x���ߵ���������
			xEnd=0,--���������ĵ�x�ұߵ���������
			yStart=0,--���������ĵ�y�ϱߵ���������
			yEnd=0,--���������ĵ�y�±ߵ���������
			rangeType=3,--3:��Χ(Ⱥ��)			
			rangeCenter=1,--1:������ת(����)	

			acts=
			{
				{
					targetType=0,
					conds=
					{
						{cond = 3,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=21,delay=0, id=20,vt=1},
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
			yStart=0,--���������ĵ�y�ϱߵ���������
			yEnd=0,--���������ĵ�y�±ߵ���������
			rangeType=3,--3:��Χ(Ⱥ��)			
			rangeCenter=1,--1:������ת(����)	

			acts=
			{
				{
					targetType=0,
					conds=
					{
						{cond = 3,value =1},
					},
					results=
					{
						{mj=0,timeParam=1,type=21,delay=0,id=20,vt=1},
					},

					specialEffects=
					{
						{type=5,mj=0,id=100,keepTime=400,delay=30,always=false, checkDistance = 1},	
					},
				},
			},
		},

	},

	trainConds=
	{
		{cond=21,value=200000,consume=false},
		{cond=6,value=3},
	},
	
	spellConds=
	{
		{cond=8,value=50,consume=true},--������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=800,

},