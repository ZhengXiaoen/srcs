--宝石配置
DiamondConfig =
{
	--宝石槽开启条件
	openHoleConds =
	{
		{circle = 0, level = 40,},
		{circle = 0, level = 40,},
		{circle = 0, level = 40,},
		{circle = 0, level = 40,},
		{circle = 0, level = 40,},
	},
	
	--宝石属性衍生
	deriveConfig =
	{
        
		{
			level = 2,			--宝石等级
			count = 12,			--宝石数量
			appear = 0,			--光效ID
			prop=				--衍生属性
			{
				{type=11,value=5},
				{type=15,value=5},
				{type=19,value=5},		
				{type=6,value=0.005},	
				{type=8,value=0.005},					
			}
		},
		{
			level = 3,			--宝石等级
			count = 12,			--宝石数量
			appear = 0,			--光效ID
			prop=				--衍生属性
			{
				{type=11,value=10},
				{type=15,value=10},
				{type=19,value=10},			
				{type=6,value=0.01},	
				{type=8,value=0.01},					
			}
		},
		{
			level = 4,			--宝石等级
			count = 12,			--宝石数量
			appear = 0,			--光效ID
			prop=				--衍生属性
			{
				{type=11,value=15},
				{type=15,value=15},
				{type=19,value=15},						
				{type=6,value=0.015},	
				{type=8,value=0.015},					
			}
		},
		
		{
			level = 5,			--宝石等级
			count = 12,			--宝石数量
			appear = 1,			--光效ID
			prop=				--衍生属性
			{
				{type=11,value=20},
				{type=15,value=20},
				{type=19,value=20},						
				{type=6,value=0.02},	
				{type=8,value=0.02},					
			}
		},
		
		{
			level = 6,			--宝石等级
			count = 12,			--宝石数量
			appear = 2,			--光效ID
			prop=				--衍生属性
			{
				{type=11,value=35},
				{type=15,value=35},
				{type=19,value=35},						
				{type=6,value=0.035},	
				{type=8,value=0.035},					
			}
		},
		
		{
			level = 7,			--宝石等级
			count = 12,			--宝石数量
			appear = 3,			--光效ID
			prop=				--衍生属性
			{
				{type=11,value=45},
				{type=15,value=45},
				{type=19,value=45},					
				{type=6,value=0.045},	
				{type=8,value=0.045},					
			}
		},
		
		
		{
			level = 8,			--宝石等级
			count = 12,			--宝石数量
			appear = 4,			--光效ID
			prop=				--衍生属性
			{
				{type=11,value=60},
				{type=15,value=60},
				{type=19,value=60},					
				{type=6,value=0.06},	
				{type=8,value=0.06},					
			}
		},
		{
			level = 9,			--宝石等级
			count = 12,			--宝石数量
			appear = 5,			--光效ID
			prop=				--衍生属性
			{
				{type=11,value=120},
				{type=15,value=120},
				{type=19,value=120},					
				{type=6,value=0.08},	
				{type=8,value=0.08},					
			}
		},
		{
			level = 10,			--宝石等级
			count = 12,			--宝石数量
			appear = 6,			--光效ID
			prop=				--衍生属性
			{
				{type=11,value=200},
				{type=15,value=200},
				{type=19,value=200},					
				{type=6,value=0.1},	
				{type=8,value=0.1},					
			}
		},
		
		
		
		
		
	},
	
	--升级宝石消耗
	upgradeConsumes =
	{
		{	--1-2消耗
			{type = 15, id = 0, count = 6},
		},
		{	--2-3消耗
			{type = 15, id = 0, count = 18	},
		},
		{	--3-4消耗
			{type = 15, id = 0, count = 54},
		},
		{	--4-5消耗
			{type = 15, id = 0, count = 162},
		},
		{	--5-6消耗
			{type = 15, id = 0, count = 486},
		},
		{	--6-7消耗
			{type = 15, id = 0, count = 1458},
		},
		{	--7-8消耗
			{type = 15, id = 0, count = 4374},
		},
		{	--8-9消耗
			{type = 15, id = 0, count = 13122},
		},
		{	--9-10消耗
			{type = 15, id = 0, count = 39366},
		},
	}

}