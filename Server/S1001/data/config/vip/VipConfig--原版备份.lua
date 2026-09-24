
--VIP配置
--needYuanBao = 1000,  --VIP1
--needYuanBao = 6000,  --VIP2
--needYuanBao = 20000,  --VIP3
--needYuanBao = 50000,  --VIP4
--needYuanBao = 100000,  --VIP5
--needYuanBao = 200000,  --VIP6
--needYuanBao = 500000,  --VIP7
--needYuanBao = 1000000,  --VIP8
--needYuanBao = 2000000,  --VIP9
--needYuanBao = 5000000,  --VIP10
--needYuanBao = 10000000,  --VIP11
--needYuanBao = 20000000,  --VIP12

--#include "..\..\language\LangCode.txt"
--显示的特权列表
VipConfig = {    
	VipGrade =     
	{
		--所有等级格式一致,当前等级没有直接空表即可
		{
			
			vip = 1,	
			DepotPage = 2,			--VIP可开放的仓库页数
			needYuanBao = 1000, 		--VIP1
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}
			skillLevelUp = 3,				
			reward = 
			{
				{type=0,id=534,count=3,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(100颗)
				{type=0,id=568,count=3,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(100颗)
				{type=0,id=316,count=1,strong=0,quality=0,bind=1,sex=-1}, --内功经验卷(小)
				{type=0,id=560,count=1,strong=0,quality=0,bind=1,sex=-1}, --天山雪莲(60w)
				{type=0,id=848,count=1,strong=0,quality=0,bind=1,sex=-1}, --三倍经验(2小时)

			},
			freeRelive = 2,
			attrcalc = 																--属性
			{
				 {type = 12,value = 0.01},
				 {type = 16,value = 0.01},
				 {type = 20,value = 0.01},

				-- {type = 9,value = 24},
				-- {type = 11,value = 120},
				-- {type = 13,value = 24},
				-- {type = 15,value = 120},
				-- {type = 17,value = 24},
				-- {type = 19,value = 120},
			}
		},
		{

			vip = 2,
			DepotPage = 2,			--VIP可开放的仓库页数
			needYuanBao = 6000, 		--VIP2
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}			
			skillLevelUp = 3,
			reward = 
			{
				{type=0,id=534,count=15,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(100颗)
				{type=0,id=568,count=15,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(100颗)
				{type=0,id=492,count=1,strong=0,quality=0,bind=1,sex=-1}, --行会号角
				{type=0,id=507,count=3,strong=0,quality=0,bind=1,sex=-1}, --金条(绑金)
				{type=0,id=551,count=3,strong=0,quality=0,bind=1,sex=-1}, --战将灵力丹(小)


			},		
			freeRelive = 3,
			attrcalc = 
			{
				 {type = 12,value = 0.02},
				 {type = 16,value = 0.02},
				 {type = 20,value = 0.02},
				-- {type = 9,value = 36},
				-- {type = 11,value = 180},
				-- {type = 13,value = 36},
				-- {type = 15,value = 180},
				-- {type = 17,value = 36},
				-- {type = 19,value = 180},
			}
		},
		{
			vip = 3,	
			DepotPage = 3,			--VIP可开放的仓库页数
			needYuanBao = 20000,  		--VIP3	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}			
			skillLevelUp = 3,
			reward = 
			{
				{type=0,id=534,count=42,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(100颗)
				{type=0,id=568,count=42,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(100颗)
				{type=0,id=316,count=14,strong=0,quality=0,bind=1,sex=-1}, --内功经验卷(小)
				{type=0,id=507,count=7,strong=0,quality=0,bind=1,sex=-1}, --金条(绑金)
				{type=0,id=551,count=7,strong=0,quality=0,bind=1,sex=-1}, --战将灵力丹(小)


			},	
			freeRelive = 4,
			attrcalc = 
			{
				 {type = 12,value = 0.03},
				 {type = 16,value = 0.03},
				 {type = 20,value = 0.03},
				-- {type = 9,value = 53},
				-- {type = 11,value = 266},
				-- {type = 13,value = 53},
				-- {type = 15,value = 266},
				-- {type = 17,value = 53},
				-- {type = 19,value = 266},
			}
		},
		{
			vip = 4,	
			DepotPage = 3,			--VIP可开放的仓库页数
			needYuanBao = 50000,  		--VIP4	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}	
			skillLevelUp = 3,
			reward = 
			{							
				{type=0,id=534,count=90,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(100颗)
				{type=0,id=568,count=90,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(100颗)
				{type=0,id=316,count=30,strong=0,quality=0,bind=1,sex=-1}, --内功经验卷(小)
				{type=0,id=507,count=15,strong=0,quality=0,bind=1,sex=-1}, --金条(绑金)
				{type=0,id=551,count=15,strong=0,quality=0,bind=1,sex=-1}, --战将灵力丹(小)
			},
			freeRelive = 5,
			attrcalc = 
			{
				 {type = 12,value = 0.04},
				 {type = 16,value = 0.04},
				 {type = 20,value = 0.04},
				-- {type = 9,value = 78},
				-- {type = 11,value = 388},
				-- {type = 13,value = 78},
				-- {type = 15,value = 388},
				-- {type = 17,value = 78},
				-- {type = 19,value = 388},
			}
		},
		{
			vip = 5,		
			DepotPage = 4,			--VIP可开放的仓库页数
			needYuanBao = 100000,  		--VIP5	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}			
			skillLevelUp = 3,
			reward = 
			{
				{type=0,id=535,count=30,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(1000颗)
				{type=0,id=569,count=30,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(1000颗)
				{type=0,id=316,count=50,strong=0,quality=0,bind=1,sex=-1}, --内功经验卷(小)
				{type=0,id=507,count=25,strong=0,quality=0,bind=1,sex=-1}, --金条(绑金)
				{type=0,id=551,count=25,strong=0,quality=0,bind=1,sex=-1}, --战将灵力丹(小)
			},
			freeRelive = 6,
			attrcalc = 
			{
				 {type = 12,value = 0.05},
				 {type = 16,value = 0.05},
				 {type = 20,value = 0.05},
				-- {type = 9,value = 112},
				-- {type = 11,value = 559},
				-- {type = 13,value = 112},
				-- {type = 15,value = 559},
				-- {type = 17,value = 112},
				-- {type = 19,value = 559},
			}
		},
		{
			vip = 6,		
			DepotPage = 4,			--VIP可开放的仓库页数
			needYuanBao = 200000, 		--VIP6	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}	
			skillLevelUp = 3,
			reward = 
			{
				{type=0,id=535,count=30,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(1000颗)
				{type=0,id=569,count=30,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(1000颗)
				{type=0,id=316,count=100,strong=0,quality=0,bind=1,sex=-1}, --内功经验卷(小)
				{type=0,id=507,count=50,strong=0,quality=0,bind=1,sex=-1}, --金条(绑金)
				{type=0,id=551,count=50,strong=0,quality=0,bind=1,sex=-1}, --战将灵力丹(小)
			},
			freeRelive = 7,
			attrcalc = 
			{
				 {type = 12,value = 0.06},
				 {type = 16,value = 0.06},
				 {type = 20,value = 0.06},
				-- {type = 9,value = 159},
				-- {type = 11,value = 794},
				-- {type = 13,value = 159},
				-- {type = 15,value = 794},
				-- {type = 17,value = 159},
				-- {type = 19,value = 794},
			}
		},
		{
			vip = 7,		
			DepotPage = 5,			--VIP可开放的仓库页数
			needYuanBao = 500000,  		--VIP7	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}				
			skillLevelUp = 3,
			reward = 
			{
				{type=0,id=535,count=30,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(1000颗)
				{type=0,id=569,count=30,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(1000颗)
				{type=0,id=317,count=5,strong=0,quality=0,bind=1,sex=-1}, --内功经验卷(大)
				{type=0,id=509,count=50,strong=0,quality=0,bind=1,sex=-1}, --金条(绑金)
				{type=0,id=552,count=15,strong=0,quality=0,bind=1,sex=-1}, --战将灵力丹(中)
			},
			freeRelive = 8,
			attrcalc = 
			{
				 {type = 12,value = 0.07},
				 {type = 16,value = 0.07},
				 {type = 20,value = 0.07},
				-- {type = 9,value = 222},
				-- {type = 11,value = 1112},
				-- {type = 13,value = 222},
				-- {type = 15,value = 1112},
				-- {type = 17,value = 222},
				-- {type = 19,value = 1112},
			}
		},
		{
			vip = 8,		
			DepotPage = 5,			--VIP可开放的仓库页数
			needYuanBao = 1000000,		--VIP8	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}	
			skillLevelUp = 3,
			reward = 
			{
				{type=0,id=535,count=60,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(1000颗)
				{type=0,id=569,count=60,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(1000颗)
				{type=0,id=317,count=5,strong=0,quality=0,bind=1,sex=-1}, --内功经验卷(大)
				{type=0,id=509,count=50,strong=0,quality=0,bind=1,sex=-1}, --大金砖(绑金)
				{type=0,id=552,count=25,strong=0,quality=0,bind=1,sex=-1}, --战将灵力丹(中)
			},
			freeRelive = 9,
			attrcalc = 
			{
				 {type = 12,value = 0.08},
				 {type = 16,value = 0.08},
				 {type = 20,value = 0.08},
				-- {type = 9,value = 307},
				-- {type = 11,value = 1535},
				-- {type = 13,value = 307},
				-- {type = 15,value = 1535},
				-- {type = 17,value = 307},
				-- {type = 19,value = 1535},
			}
		},
		{
			vip = 9,	
			DepotPage = 6,			--VIP可开放的仓库页数
			needYuanBao = 2000000,		--VIP9	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}				
			skillLevelUp = 3,
			reward = 
			{
				{type=0,id=536,count=60,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(10000颗)
				{type=0,id=570,count=60,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(10000颗)
				{type=0,id=317,count=10,strong=0,quality=0,bind=1,sex=-1}, --内功经验卷(大)
				{type=0,id=509,count=100,strong=0,quality=0,bind=1,sex=-1}, --大金砖(绑金)
				{type=0,id=552,count=50,strong=0,quality=0,bind=1,sex=-1}, --战将灵力丹(中)
			},
			freeRelive = 10,
			attrcalc = 
			{
				 {type = 12,value = 0.09},
				 {type = 16,value = 0.09},
				 {type = 20,value = 0.09},
				-- {type = 9,value = 418},
				-- {type = 11,value = 2088},
				-- {type = 13,value = 418},
				-- {type = 15,value = 2088},
				-- {type = 17,value = 418},
				-- {type = 19,value = 2088},
			}
		},
		{
			vip = 10,	
			DepotPage = 7,			--VIP可开放的仓库页数
			needYuanBao = 5000000,		--VIP10
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}				
			skillLevelUp = 3,
			reward = 
			{
				{type=0,id=536,count=60,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(10000颗)
				{type=0,id=570,count=60,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(10000颗)
				{type=0,id=317,count=30,strong=0,quality=0,bind=1,sex=-1}, --内功经验卷(大)
				{type=0,id=509,count=300,strong=0,quality=0,bind=1,sex=-1}, --大金砖(绑金)
				{type=0,id=553,count=15,strong=0,quality=0,bind=1,sex=-1}, --战将灵力丹(大)
			},
			freeRelive = 11,
			attrcalc = 
			{
				 {type = 12,value = 0.10},
				 {type = 16,value = 0.10},
				 {type = 20,value = 0.10},
				-- {type = 9,value = 560},
				-- {type = 11,value = 2798},
				-- {type = 13,value = 560},
				-- {type = 15,value = 2798},
				-- {type = 17,value = 560},
				-- {type = 19,value = 2798},
			}

		},
		{
			vip = 11,	
			DepotPage = 8,			--VIP可开放的仓库页数
			needYuanBao = 10000000,		--VIP10
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}				
			skillLevelUp = 3,
			reward = 
			{
				{type=0,id=536,count=60,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(10000颗)
				{type=0,id=570,count=60,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(10000颗)
				{type=0,id=317,count=50,strong=0,quality=0,bind=1,sex=-1}, --内功经验卷(大)
				{type=0,id=509,count=500,strong=0,quality=0,bind=1,sex=-1}, --大金砖(绑金)
				{type=0,id=553,count=25,strong=0,quality=0,bind=1,sex=-1}, --战将灵力丹(大)
			},
			freeRelive = 12,
			attrcalc = 
			{
				 {type = 12,value = 0.11},
				 {type = 16,value = 0.11},
				 {type = 20,value = 0.11},
				-- {type = 9,value = 739},
				-- {type = 11,value = 3693},
				-- {type = 13,value = 739},
				-- {type = 15,value = 3693},
				-- {type = 17,value = 739},
				-- {type = 19,value = 3693},
			}

		},
		{
			vip = 12,	
			DepotPage = 9,			--VIP可开放的仓库页数
			needYuanBao = 20000000,		--VIP10
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}				
			skillLevelUp = 3,
			reward = 
			{
				{type=0,id=536,count=100,strong=0,quality=0,bind=1,sex=-1}, --护符碎片(10000颗)
				{type=0,id=570,count=100,strong=0,quality=0,bind=1,sex=-1}, --护盾碎片(10000颗)
				{type=0,id=317,count=100,strong=0,quality=0,bind=1,sex=-1}, --内功经验卷(大)
				{type=0,id=509,count=1000,strong=0,quality=0,bind=1,sex=-1}, --大金砖(绑金)
				{type=0,id=553,count=50,strong=0,quality=0,bind=1,sex=-1}, --战将灵力丹(大)
			},
			freeRelive = 12,
			attrcalc = 
			{
				 {type = 12,value = 0.12},
				 {type = 16,value = 0.12},
				 {type = 20,value = 0.12},
				-- {type = 9,value = 960},
				-- {type = 11,value = 4801},
				-- {type = 13,value = 960},
				-- {type = 15,value = 4801},
				-- {type = 17,value = 960},
				-- {type = 19,value = 4801},
			}

		},
	},
}
