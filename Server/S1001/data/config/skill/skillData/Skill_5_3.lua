--野蛮冲撞3级
{

	actions=
	{
		--{act=1,effect=10007},
	},
	
	desc=Lang.Skill.s5L3Desc,
	
	iconID=5,
			
	actRange=
	{
		{

		xStart=-0,
		xEnd=0,
		yStart=-0,
		yEnd=0,
		rangeType=3,				
		rangeCenter=1,			

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
						--{type=1,mj=0,id=10007,keepTime=400,delay=0,always=false},
					},
				},
			},
		},
		
		{
		xStart=0,
		xEnd=0,
		yStart=-6,
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
						{mj=0,timeParam=1,type=3,delay=0,rate=1500,value=0},
						{mj=0,timeParam=200,type=38,ignoreTargetDis=1,delay=0,id=5,value=1,interval=70},
						--{mj=0,timeParam=1,type=32,id=103,ignoreTargetDis=1,rate=10000, rateType=0, delay=400},
					},
					specialEffects=
					{	
					},
				},
				
				
				{
					
					conds=
					{
						{cond=15,value=-1}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
                        {cond=64,value=2,}, --与目标距离为2格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=1500,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, 
						{mj=0,timeParam=200,type=38,ignoreTargetDis=1,delay=0,id=5,value=1,interval=70},
						--{mj=0,timeParam=1,type=32,id=103,ignoreTargetDis=1,rate=10000, rateType=0, delay=400},
					},
					specialEffects=
					{	
					},
				},
				{
					conds=
					{
						{cond=15,value=-1}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
                        {cond=64,value=3,}, --与目标距离为3格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=1500,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, 
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,delay=0,id=0,value=1,interval=70},
						--{mj=0,timeParam=1,type=32,id=103,ignoreTargetDis=1,rate=10000, rateType=0, delay=400},
					},
					specialEffects=
					{	
					},
				},
				
				{
					conds=
					{
						{cond=15,value=-1}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
                        {cond=64,value=4,}, --与目标距离为4格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=1500,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, 
						{mj=0,timeParam=1,type=38,ignoreTargetDis=1,delay=0,id=0,value=1,interval=70},
						--{mj=0,timeParam=1,type=32,id=103,ignoreTargetDis=1,rate=10000, rateType=0, delay=400},
					},
					specialEffects=
					{	
					},
				},
				
				{
					conds=
					{
						{cond=15,value=-1}, 
						{cond=3,value=0}, 
						{cond=13,value=1}, 
                        {cond=64,value=5,}, --与目标距离为5格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=1500,value=0},
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
						{cond=3,value=0}, 
						{cond=13,value=1}, 
                        {cond=64,value=6,}, --与目标距离为6格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=1500,value=0},
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
					{type=1,mj=0,id=118,keepTime=150,delay=0,always=false},					
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
						{mj=0,timeParam=1,id=0,type=37,delay=0, value=1,interval=10,vt=1,rate=30}, --�Լ���ǰ��һ��,ʧ���˸��Լ���һ�����ܱ���

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
                        --{mj=0,timeParam=1,type=32,id=196,ignoreTargetDis=1,rate=0, rateType=0, delay=500}, --���Ӽ���buff
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
		--{cond=1,value=52,consume=false},--��ʾ�ȼ�Ҫ1��
		{cond=21,value=10,consume=false},--��ʾ��Ҫ������
		{cond=6,value=1},
		--{cond=3,value=1414,consume=true},--��ʾ��Ҫ�鱾
	},
	
	spellConds=
	{
		{cond=8,value=25,consume=true},--������10
	},
	--����ʱ��,��λ�Ǻ���
	singTime=0,	
	cooldownTime=10000,

},