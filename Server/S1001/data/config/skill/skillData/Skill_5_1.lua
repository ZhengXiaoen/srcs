--野蛮冲撞1级
{
	actions=
	{	
		--{act=1,effect=10007},
	},
	
	desc=Lang.Skill.s5L1Desc,
	iconID=5,

	actRange=
	{
		{

		xStart=-0,--相对于中心点x左边的相对坐标
		xEnd=0,--相对于中心点x右边的相对坐标
		yStart=-0,--相对于中心点y上边的相对坐标
		yEnd=0,--相对于中心点y下边的相对坐标
		rangeType=3,				
		rangeCenter=1,			

		acts=
			{
				{
					targetType=1,--没有目标筛选也可以施放，如果有always 
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
			yStart=-4,
			yEnd=-1,
			
			rangeType=2,
			rangeCenter=1,
			acts=
			{
				{
					conds=
					{
						{cond=15,value=-1},	--检测别人等级是否比自己低
						{cond=3,value=0},	--目标为自己
						{cond=13,value=1},	--对象为可攻击的
                        {cond=64,value=1,}, --与目标距离为1格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=500,value=0},
						{mj=0,timeParam=200,type=38,ignoreTargetDis=1,delay=0,id=5,value=1,interval=70},
						--{mj=0,timeParam=1,type=32,id=92,ignoreTargetDis=1,rate=10000, rateType=0, delay=400},
					},
					specialEffects={},
				},
				
				--延迟
				{
					conds=
					{
						{cond=15,value=-1},	--检测别人等级是否比自己低
						{cond=3,value=0},	--目标为自己
						{cond=13,value=1},	--对象为可攻击的
                        {cond=64,value=2,}, --与目标距离为2格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=500,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --先要删除技能标记
						{mj=0,timeParam=200,type=38,ignoreTargetDis=1,delay=0,id=5,value=1,interval=70},
						--{mj=0,timeParam=1,type=32,id=202,ignoreTargetDis=1,rate=10000, rateType=0, delay=300},
                        
                       
					},
					specialEffects=
					{	
					},
				},

                --延迟
				{
					conds=
					{
						{cond=15,value=-1},	--检测别人等级是否比自己低
						{cond=3,value=0},	--目标为自己
						{cond=13,value=1},	--对象为可攻击的
                        {cond=64,value=3,}, --与目标距离为3格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=500,value=0},
						{mj=0,timeParam=1,type=3,delay=0,rate=500,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --先要删除技能标记
						{mj=0,timeParam=200,type=38,ignoreTargetDis=1,delay=0,id=5,value=1,interval=70},
						--{mj=0,timeParam=1,type=32,id=202,ignoreTargetDis=1,rate=10000, rateType=0, delay=300},
                        
                       
					},
					specialEffects=
					{	
					},
				},

                --延迟
				{
					conds=
					{
						{cond=15,value=-1},	--检测别人等级是否比自己低
						{cond=3,value=0},	--目标为自己
						{cond=13,value=1},	--对象为可攻击的
                        {cond=64,value=4,}, --与目标距离为4格
					},

					results=
					{
						{mj=0,timeParam=1,type=3,delay=0,rate=500,value=0},
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --先要删除技能标记
						{mj=0,timeParam=200,type=38,ignoreTargetDis=1,delay=0,id=5,value=1,interval=70},
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
						
						{mj=0,timeParam=200,id=5,type=37,delay=0, value=1,interval=10,vt=0,rate=30,buffType=1}, --自己往前走一步,失败了给自己加一个技能标记,id=5,时间是timeParam 200ms
					},
					
					specialEffects=
					{	
					},
				},
				
				{
					conds=
					{
						{cond=22,value=5},  --自己身上不存在技能标记
						{cond=3,value=1}, 
					},

					results=
					{
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --先要删除技能标记
						{mj=0,timeParam=1,id=5,type=37,delay=0, value=1,interval=10,vt=1,rate=30}, --自己往前走一步,失败了给自己加一个技能标记
						
					},
					
					specialEffects=
					{	
					},
				},
				
				{
					conds=
					{
						{cond=22,value=5},  --自己身上不存在技能标记
						{cond=3,value=1}, 
					},

					results=
					{
                        
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --先要删除技能标记
						{mj=0,timeParam=1,id=0,type=37,delay=0, value=1,interval=10,vt=0,rate=30}, --自己往前走一步,失败了给自己加一个技能标记
						
					},
					
					specialEffects=
					{	
					},
				},
				{
					conds=
					{
						{cond=22,value=5},  --自己身上不存在技能标记
						{cond=3,value=1}, 
					},

					results=
					{
                       -- {mj=0,timeParam=1,type=32,id=196,ignoreTargetDis=1,rate=0, rateType=0, delay=500}, --添加加速buff
                
						{mj=0,timeParam=200,type=21,delay=0, value=5}, --先要删除技能标记
						{mj=0,timeParam=1,id=0,type=37,delay=0, value=1,interval=10,vt=0,rate=30}, --自己往前走一步,失败了给自己加一个技能标记
						
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
		{cond=1,value=35,consume=false},--等级要求
		{cond=6,value=1},
	},
	
	spellConds=
	{
		{cond=8,value=5,consume=true},--消耗蓝10
	},
	--吟唱时间,单位是毫秒
	singTime=0,
	
	--冷却时间,单位是毫秒
	cooldownTime=10000,
},