--��������4��
{

	actions=
	{

	},
	
	desc=Lang.Skill.s1L10Desc,--���ܵ�����
	
	iconID=1,--ͼ����ID
			
	--���÷�Χ��
	actRange=
	{
		{

		xStart=0,--���������ĵ�x���ߵ���������
		xEnd=0,--���������ĵ�x�ұߵ���������
		yStart=0,--���������ĵ�y�ϱߵ���������
		yEnd=0,--���������ĵ�y�±ߵ���������
		rangeType=0,				
		rangeCenter=0,			

		acts=
			{
				{

					conds=
					{

						{cond = 3,value =true},
					},
					results=
					{
						{mj=0,timeParam=1,type=7,delay=0,id=29,value=100,vt=0},
						{mj=0,timeParam=1,type=7,delay=0,id=23,value=1000,vt=0},
						{mj=0,timeParam=1,type=7,delay=0,id=5, value=10000,vt=0},
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
		--{cond=1,value=50,consume=false},--表示等级要30级
		{cond=21,value=10,consume=false},--表示需要熟练度
		{cond=6,value=1},
	},
	
	spellConds=
	{

	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=0,

},