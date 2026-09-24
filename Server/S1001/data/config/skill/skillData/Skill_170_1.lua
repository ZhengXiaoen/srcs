--ǿ���ٻ���1��
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s170L1Desc,--���ܵ�����
	
	iconID=23,--ͼ����ID
			
	--���÷�Χ��
	actRange=
	{
		{--//������Ч�ͷ�
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
						{type=4,mj=0,id=37,keepTime=0,delay=0,always=false},
					},
				},
			},
		},
	},

	trainConds=
	{
		{cond=1,value=10,consume=false},--��ʾ�ȼ�Ҫ1��
		{cond=6,value=3},
	},
	
	spellConds=
	{
		--{cond=10,value=2,consume=false},--��ʾ��Ҫ������Ŀ����2��
		{cond=8,value=1000,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=10000,

},