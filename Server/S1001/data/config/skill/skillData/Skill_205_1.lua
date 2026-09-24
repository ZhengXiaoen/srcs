--ħ����1��
{

	actions=
	{
		{act=1,effect=19,},
		--{act=2,effect=19,},
	},
	
	desc=Lang.Skill.s15L1Desc,--���ܵ�����
	
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
						{cond = 63,value =54,param=112},						
					},
					results=
					{
						{timeParam=1,type=1,delay=300,id=13,rate=500,intervalRate=1000,maxDur=300,intervalAddType=1,},
					},

					specialEffects=
					{
						{type=4,mj=0,id=20,keepTime=20000,delay=0,always=false},
					},
				},
			},
		},
		
	},

	trainConds=
	{
		{cond=1,value=1,consume=false},--��ʾ�ȼ�Ҫ1��
	},
	
	spellConds=
	{
		--{cond=8,value=45,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=1600,

},