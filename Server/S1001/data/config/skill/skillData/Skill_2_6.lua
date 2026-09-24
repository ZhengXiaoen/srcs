--ŭ������4��
{

	actions=
	{
		{act=0,effect=1,},
	},
	
	desc=Lang.Skill.s2L6Desc,--���ܵ�����
	
	iconID=2,--ͼ����ID
			
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
							{mj=0,timeParam=1,type=7,delay=0,id=81,value=2600,vt=0},
							{mj=0,timeParam=1,type=7,delay=0,id=82,value=3500,vt=0},
						
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
		--{cond=1,value=40,consume=false},--��ʾ�ȼ�Ҫ40��
		{cond=21,value=30000,consume=false},--表示需要熟练度
		{cond=6,value=1},
	
	},
	
	spellConds=
	{
		{cond=15,value=1,consume=false},
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=0,

},