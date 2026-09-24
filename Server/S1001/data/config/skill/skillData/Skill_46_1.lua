--火龙:全屏爆破

{

	actions=
	{
		{act=1,effect=53,},
	},
	
	desc=Lang.Skill.s46L1Desc,--技能的描述
	
	iconID=1,--图标的ID
			
	--作用范围表
	actRange=
	{

		{ 
			xStart=-12,--相对于中心点x左边的相对坐标
			xEnd=12,--相对于中心点x右边的相对坐标
			yStart=-12,--相对于中心点y上边的相对坐标
			yEnd=12,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					--targetType=0,
					conds=
					{

					   {cond = 13,value =1},		
					
					},
					results=
					{
						{mj=0,timeParam=1,type=3,rate=10000,delay=100},
					},

					specialEffects=
					{  
 						--{type=1,mj=0,id=9,keepTime=10000,delay=300,always=false},	
					    --{type=4,mj=0,id=228,keepTime=400,delay=400,always=false},		
					},
				},
			},
		},
			
		
		{ 
			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-4,--相对于中心点y上边的相对坐标
			yEnd=-4,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=7547,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		   
			 
			
		{ 
			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-2,--相对于中心点y上边的相对坐标
			yEnd=2,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},				
					},
				},
			},
		},
		    

		    
		{ 
			xStart=-2,--相对于中心点x左边的相对坐标
			xEnd=-2,--相对于中心点x右边的相对坐标
			yStart=-2,--相对于中心点y上边的相对坐标
			yEnd=-2,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},				
					},
				},
			},
		},
		  	 
			 
			
		{ 
			xStart=2,--相对于中心点x左边的相对坐标
			xEnd=2,--相对于中心点x右边的相对坐标
			yStart=-2,--相对于中心点y上边的相对坐标
			yEnd=-2,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},				
					},
				},
			},
		},
		  	

			
		{ 
			xStart=-2,--相对于中心点x左边的相对坐标
			xEnd=-2,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
       { 
			xStart=2,--相对于中心点x左边的相对坐标
			xEnd=2,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},			
					},
				},
			},
		},		
	
	 { 
			xStart=-2,--相对于中心点x左边的相对坐标
			xEnd=-2,--相对于中心点x右边的相对坐标
			yStart=2,--相对于中心点y上边的相对坐标
			yEnd=2,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},				
					},
				},
			},
		},		
	
	 { 
			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=2,--相对于中心点y上边的相对坐标
			yEnd=2,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},				
					},
				},
			},
		},		
	
	 { 
			xStart=2,--相对于中心点x左边的相对坐标
			xEnd=2,--相对于中心点x右边的相对坐标
			yStart=2,--相对于中心点y上边的相对坐标
			yEnd=2,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},				
					},
				},
			},
		},		
	
	 { 
			xStart=-4,--相对于中心点x左边的相对坐标
			xEnd=-4,--相对于中心点x右边的相对坐标
			yStart=-2,--相对于中心点y上边的相对坐标
			yEnd=-2,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},				
					},
				},
			},
		},		
	
	 { 
			xStart=4,--相对于中心点x左边的相对坐标
			xEnd=4,--相对于中心点x右边的相对坐标
			yStart=-2,--相对于中心点y上边的相对坐标
			yEnd=-2,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},				
					},
				},
			},
		},		
	
	 { 
			xStart=4,--相对于中心点x左边的相对坐标
			xEnd=4,--相对于中心点x右边的相对坐标
			yStart=1,--相对于中心点y上边的相对坐标
			yEnd=1,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},				
					},
				},
			},
		},		
	
	 { 
			xStart=-4,--相对于中心点x左边的相对坐标
			xEnd=-4,--相对于中心点x右边的相对坐标
			yStart=1,--相对于中心点y上边的相对坐标
			yEnd=1,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},				
					},
				},
			},
		},		
	
	{ 
			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=4,--相对于中心点y上边的相对坐标
			yEnd=4,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},				
					},
				},
			},
		},
		
		{ 
			xStart=-3,--相对于中心点x左边的相对坐标
			xEnd=-3,--相对于中心点x右边的相对坐标
			yStart=-4,--相对于中心点y上边的相对坐标
			yEnd=-4,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=3,--相对于中心点x左边的相对坐标
			xEnd=3,--相对于中心点x右边的相对坐标
			yStart=-4,--相对于中心点y上边的相对坐标
			yEnd=-4,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{ 	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=-4,--相对于中心点y上边的相对坐标
			yEnd=-4,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=-3,--相对于中心点x左边的相对坐标
			xEnd=-3,--相对于中心点x右边的相对坐标
			yStart=4,--相对于中心点y上边的相对坐标
			yEnd=4,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=3,--相对于中心点x左边的相对坐标
			xEnd=3,--相对于中心点x右边的相对坐标
			yStart=4,--相对于中心点y上边的相对坐标
			yEnd=4,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=-6,--相对于中心点x左边的相对坐标
			xEnd=-6,--相对于中心点x右边的相对坐标
			yStart=-3,--相对于中心点y上边的相对坐标
			yEnd=-3,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=6,--相对于中心点x左边的相对坐标
			xEnd=6,--相对于中心点x右边的相对坐标
			yStart=-3,--相对于中心点y上边的相对坐标
			yEnd=-3,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=6,--相对于中心点x左边的相对坐标
			xEnd=6,--相对于中心点x右边的相对坐标
			yStart=3,--相对于中心点y上边的相对坐标
			yEnd=3,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=-2,--相对于中心点x左边的相对坐标
			xEnd=-2,--相对于中心点x右边的相对坐标
			yStart=-6,--相对于中心点y上边的相对坐标
			yEnd=-6,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=2,--相对于中心点x左边的相对坐标
			xEnd=2,--相对于中心点x右边的相对坐标
			yStart=-6,--相对于中心点y上边的相对坐标
			yEnd=-6,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=-2,--相对于中心点x左边的相对坐标
			xEnd=-2,--相对于中心点x右边的相对坐标
			yStart=6,--相对于中心点y上边的相对坐标
			yEnd=6,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=2,--相对于中心点x左边的相对坐标
			xEnd=2,--相对于中心点x右边的相对坐标
			yStart=6,--相对于中心点y上边的相对坐标
			yEnd=6,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=-6,--相对于中心点x左边的相对坐标
			xEnd=-6,--相对于中心点x右边的相对坐标
			yStart=-6,--相对于中心点y上边的相对坐标
			yEnd=-6,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=-6,--相对于中心点x左边的相对坐标
			xEnd=-6,--相对于中心点x右边的相对坐标
			yStart=6,--相对于中心点y上边的相对坐标
			yEnd=6,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=6,--相对于中心点x左边的相对坐标
			xEnd=6,--相对于中心点x右边的相对坐标
			yStart=-6,--相对于中心点y上边的相对坐标
			yEnd=-6,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

					   {cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
					    {type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		{ 
			xStart=6,--相对于中心点x左边的相对坐标
			xEnd=6,--相对于中心点x右边的相对坐标
			yStart=6,--相对于中心点y上边的相对坐标
			yEnd=6,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					targetType=1,
					conds=
					{

						{cond = 13,value =1},	
					
					},
					results=
					{
						--{mj=0,timeParam=1,type=3,rate=0,value=6007,interval=0,delay=1000},
				    },

					specialEffects=
					{  	
						{type=4,mj=0,id=310,keepTime=700,delay=50,always=true},		
					},
				},
			},
		},
		
		
		{
			xStart=0,--相对于中心点x左边的相对坐标
			xEnd=0,--相对于中心点x右边的相对坐标
			yStart=0,--相对于中心点y上边的相对坐标
			yEnd=0,--相对于中心点y下边的相对坐标
			rangeType=3,				
			rangeCenter=1,			

			acts=
			{
				{
					--targetType=0,
					conds=
					{
						{cond = 13,value =1},
					},
					results=
					{
						--{mj=0,timeParam=1,type=1,buffType=23,rate=0,value=5,interval=60,delay=500,vt=0,effectType=6,effectId =0},
						--{mj=0,timeParam=1,type=1,buffType=27,rate=0,value=5,interval=60,delay=500,vt=0,effectType=6,effectId =0},
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
		--{cond=1,value=38,consume=false},--表示等级要1级
		--{cond=42,value=720,consume=false},--表示修炼时间
		--{cond=3,value=707,consume=true},--表示书本
	},
	
	spellConds=
	{
		{cond=13,value=12,consume=true},--和目标的距离必须小于等于一定的距离,value表示距离 （此距离使用x,或者y的相差的距离的绝对值的最大值作为距离）
	},
	--吟唱时间,单位是毫秒
	singTime=0,	
	cooldownTime=200,

} ,