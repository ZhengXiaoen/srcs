--Ұ����ײ2��
{

	actions=
	{
		--{act=1,effect=10007},
	},
	
	desc=Lang.Skill.s5L2Desc,--���ܵ�����
	
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
						--{type=1,mj=0,id=10007,keepTime=400,delay=0,always=false},
					},
				},
			},
		},
		--前方的目标推走
		{
		xStart=0,
		xEnd=0,
		yStart=-5,
		yEnd=-1,
		
		rangeType=2,
		rangeCenter=1,
		acts=
			{
				{
					
					conds=
					{
						{cond=15,value=-1}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
						{cond=64,value=1,}, --与目标距离为1格
						
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=1000,value=0},
						{mj=0,timeParam=200,type=38,ignoreTargetDis=1,delay=0,id=5,value=1,interval=70},
						--{mj=0,timeParam=1,type=32,id=102,ignoreTargetDis=1,rate=10000, rateType=0, delay=400},
					},
					specialEffects=
					{	
					},
				},
				
				
				{
					
					conds=
					{
						{cond=15,value=-1}, 
						--{cond=22,value=5},  --�Լ����ϲ����ڼ��ܱ���
						--{cond=20,value=5}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
                        {cond=64,value=2,}, --与目标距离为2格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=1000,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=200,type=38,ignoreTargetDis=1,delay=0,id=5,value=1,interval=70},
						--{mj=0,timeParam=1,type=32,id=102,ignoreTargetDis=1,rate=10000, rateType=0, delay=400},
					},
					specialEffects=
					{	
					},
				},
				
				{
					conds=
					{
						{cond=15,value=-1}, 
						--{cond=22,value=5},  
						--{cond=20,value=5}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
                        {cond=64,value=3,}, --与目标距离为2格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=1000,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, 
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,delay=0,id=0,value=1,interval=70},
						--{mj=0,timeParam=1,type=32,id=202,ignoreTargetDis=1,rate=10000, rateType=0, delay=300},
					},
					specialEffects=
					{	
					},
				},
				{
					conds=
					{
						{cond=15,value=-1}, 
						--{cond=22,value=5},  
						--{cond=20,value=5}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
                        {cond=64,value=4,}, --与目标距离为4格
					},

					results=
					
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=1000,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, 
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,delay=0,id=0,value=1,interval=70},
						--{mj=0,timeParam=1,type=32,id=202,ignoreTargetDis=1,rate=10000, rateType=0, delay=300},
					},
					specialEffects=
					{	
					},
				},
                {
					conds=
					{
						{cond=15,value=-1}, 
						--{cond=22,value=5},  
						--{cond=20,value=5}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
                        {cond=64,value=5,}, --与目标距离为5格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=1000,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, 
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,delay=0,id=0,value=1,interval=70},
						{mj=0,timeParam=1,type=32,id=202,ignoreTargetDis=1,rate=10000, rateType=0, delay=300},
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
				
				{
					conds=
					{
						{cond=22,value=5},  --�Լ����ϲ����ڼ��ܱ���
						{cond=3,value=1}, 
					},

					results=
					{
                        
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=1,id=0,type=37,delay=0, value=1,interval=70,vt=1,rate=30}, --�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
						
					},
					
					specialEffects=
					{	
					},
				},
				{
					conds=
					{
						{cond=22,value=5},  --�Լ����ϲ����ڼ��ܱ���
						{cond=3,value=1}, 
					},

					results=
					{
                       -- {mj=0,timeParam=1,type=32,id=196,ignoreTargetDis=1,rate=0, rateType=0, delay=500}, --���Ӽ���buff
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --��Ҫɾ�����ܱ���
						{mj=0,timeParam=1,id=0,type=37,delay=0, value=1,interval=70,vt=1,rate=30}, --�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���
						
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
		--{cond=1,value=42,consume=false},--��ʾ�ȼ�Ҫ1��
		{cond=21,value=1500,consume=false},--��ʾ��Ҫ������
		{cond=6,value=1},
	},
	
	spellConds=
	{
		{cond=8,value=10,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=10000,

},