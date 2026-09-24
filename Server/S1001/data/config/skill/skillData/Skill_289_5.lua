--天雷乱舞一级
{

	actions=
	{
		{act=1,effect=0,},
	},
	
	desc=Lang.Skill.s289L5Desc,
	
	iconID=289,
			
	
	actRange=
	{
		
        --生成障碍物
		{

			xStart=0,
			xEnd=0,
			yStart=0,
			yEnd=0,
			rangeType=0,				
			rangeCenter=0,			
		    acts=
			{
				{
					conds=
					{
                        
						{cond = 13,value =1},
					},
					results=
					{
                        --id 为特效id 放到客户端otherentity 文件夹 value 为方向，默认为8方向 interval为持续时间 /秒
						{id=0,mj=0,timeParam=1,type=67,delay=0,value=8,interval=5},
                        {mj=0,timeParam=1,type=68,delay=0,value=24,id=1}, --添加技能困住状态

                        {mj=0,timeParam=1,type=68,delay=5000,value=24,id=0}, --五秒后删除困住状态

                        {mj=0,timeParam=1,type=69,delay=0,id=1}, --添加天雷状态- 用于角色移动/被冲撞后 天雷状态会消失
                        {mj=0,timeParam=1,type=69,delay=6000,id=0}, --删除天雷状态- 
					},

					specialEffects=
					{
                      

                         	
					},
				},
			},
		},
       --障碍物特效
		{

			xStart=0,
			xEnd=0,
			yStart=0,
			yEnd=0,
			rangeType=0,				
			rangeCenter=0,			
		    acts=
			{   
                
				{
                    targetType = 1,
					conds=
					{
                        
						
					},
					results=
					{
                       
					},

					specialEffects=
					{
                      
                       {type=5,mj=0,id=145,keepTime=5500,delay=0,always=true},
                         	
					},
				},
			},
		},

		{

			xStart=-3,
			xEnd=3,
			yStart=-3,
			yEnd=3,
			rangeType=3,				
			rangeCenter=2,			

			acts=
			{
				{
					targetType=1,
					conds=
					{	
						{cond=43,value=1}, --是否是天雷状态
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
		

		--范围天雷
        {

			xStart=-3,
			xEnd=3,
			yStart=-3,
			yEnd=3,
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
                        --fireLiveTime 代表需要天雷状态才触发
						    {mj=0,timeParam=1,type=4,delay=1000, rate=1400,value=0,fireLiveTime =1},	
						    {mj=0,timeParam=1,type=4,delay=2000, rate=1400,value=0,fireLiveTime =1},
                            {mj=0,timeParam=1,type=4,delay=3000, rate=1400,value=0,fireLiveTime =1},
                            {mj=0,timeParam=1,type=4,delay=4000, rate=1400,value=0,fireLiveTime =1},
                            {mj=0,timeParam=1,type=4,delay=5000, rate=1400,value=0,fireLiveTime =1},
					    },

					    specialEffects=
					    {						
							{type=5,mj=0,id=10009,keepTime=1000,delay=1000,always=false},
							{type=5,mj=0,id=10009,keepTime=1000,delay=2000,always=false},
							{type=5,mj=0,id=10009,keepTime=1000,delay=3000,always=false},
							{type=5,mj=0,id=10009,keepTime=1000,delay=4000,always=false},
							{type=5,mj=0,id=10009,keepTime=1000,delay=5000,always=false},
					    },
				    },
			    },
		    },	
	},


	trainConds=
	{
		
	},
	
	spellConds=
	{
		--{cond=13,value=3,consume=true},

	},

	singTime=0,	
	cooldownTime=120000,

},