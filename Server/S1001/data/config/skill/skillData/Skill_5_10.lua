--Ұ����ײ4��
{

	actions=
	{
		---{act=1,effect=5},
	},
	
	desc=Lang.Skill.s5L10Desc,--���ܵ�����
	
	iconID=5,--ͼ����ID
			
	--���÷�Χ��
	actRange=
	{
		{

		xStart=-0,--���������ĵ�x���ߵ���������
		xEnd=0,--���������ĵ�x�ұߵ���������
		yStart=-0,--���������ĵ�y�ϱߵ���������
		yEnd=0,--���������ĵ�y�±ߵ���������
		rangeType=3,				
		rangeCenter=1,			

		acts=
			{
				{
					targetType=1,--û��Ŀ��ɸѡҲ����ʩ�ţ�������always 
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
		--ǰ����Ŀ������
		{
		xStart=0,
		xEnd=0,
		yStart=-2,
		yEnd=-1,
		rangeType=2,
		rangeCenter=1,

		acts=
			{
				{
					--Ŀ���ĵȼ����Լ��ͣ����ƿ�һ��
					conds=
					{
						{cond=15,value=-1}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
						
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=8000,value=0},
						{mj=0,timeParam=200,type=38,ignoreTargetDis=1,delay=0,id=5,value=1,interval=150},
					},
					specialEffects=
					{	
					},
				},
				
				--�ӳ�
				{
					--Ŀ���ĵȼ����Լ��ͣ����ƿ�һ��
					conds=
					{
						{cond=15,value=-1},
						{cond=3,value=0}, 
						{cond=13,value=1}, 
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=8000,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=200,type=38,ignoreTargetDis=1,delay=0,id=5,value=1,interval=150},
					},
					specialEffects=
					{	
					},
				},
				--�ӳ�
				{
					--Ŀ���ĵȼ����Լ��ͣ����ƿ�һ��
					conds=
					{
						{cond=15,value=-1}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=8000,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,delay=0,id=0,value=1,interval=150},
					},
					specialEffects=
					{	
					},
				},
				--�ӳ�
				{
					--Ŀ���ĵȼ����Լ��ͣ����ƿ�һ��
					conds=
					{
						{cond=15,value=-1}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=8000,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,delay=0,id=0,value=1,interval=150},
					},
					specialEffects=
					{	
					},
				},
				--�ӳ�
				{
					--Ŀ���ĵȼ����Լ��ͣ����ƿ�һ��
					conds=
					{
						{cond=15,value=-1}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=8000,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,delay=0,id=0,value=1,interval=150},
					},
					specialEffects=
					{	
					},
				},
			},
		},
		
		{
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
						
						{mj=0,timeParam=200,id=5,type=37,delay=0, value=1,interval=10,vt=0,rate=30,buffType=1,buffType=1}, --�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���,id=5,ʱ����timeParam 200ms
					
					},
					
					specialEffects=
					{	
					},
				},
					--�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
				{
					conds=
					{
						{cond=22,value=5},  --�Լ����ϲ����ڼ��ܱ���
						{cond=3,value=1}, 
						
					},

					results=
					{
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=1,id=5,type=37,delay=0, value=1,interval=10,vt=1,rate=30}, --�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
						
					},
					
					specialEffects=
					{	
					},
				},
					--�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
				{
					conds=
					{
						{cond=22,value=5},  --�Լ����ϲ����ڼ��ܱ���
						{cond=3,value=1}, 
					},

					results=
					{
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=1,id=0,type=37,delay=0, value=1,interval=10,vt=0,rate=30}, --�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
						
					},
					
					specialEffects=
					{	
					},
				},
					--�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
				{
					conds=
					{
						{cond=22,value=5},  --�Լ����ϲ����ڼ��ܱ���
						{cond=3,value=1}, 
					},

					results=
					{
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=1,id=0,type=37,delay=0, value=1,interval=10,vt=1,rate=30}, --�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
						
					},
					
					specialEffects=
					{	
					},
				},
					--�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
				{
					conds=
					{
						{cond=22,value=5},  --�Լ����ϲ����ڼ��ܱ���
						{cond=3,value=1}, 
					},

					results=
					{
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=1,id=0,type=37,delay=0, value=1,interval=10,vt=0,rate=30}, --�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
						
					},
					
					specialEffects=
					{	
					},
				},
					--�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
				{
					conds=
					{
						{cond=22,value=5},  --�Լ����ϲ����ڼ��ܱ���
						{cond=3,value=1}, 
					},

					results=
					{
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=1,id=0,type=37,delay=0, value=1,interval=10,vt=0,rate=30}, --�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
						
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
		--{cond=1,value=35,consume=false},--��ʾ�ȼ�����
		{cond=21,value=200000,consume=false},
		{cond=6,value=1},
	},
	
	spellConds=
	{
		{cond=8,value=45,consume=true},--������
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=10000,

},