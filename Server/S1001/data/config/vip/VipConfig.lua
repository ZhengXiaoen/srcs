
--VIP配置
--needYuanBao = 1000,  --VIP1
--needYuanBao = 6000,  --VIP2
--needYuanBao = 16000,  --VIP3
--needYuanBao = 36000,  --VIP4
--needYuanBao = 86000,  --VIP5
--needYuanBao = 186000,  --VIP6
--needYuanBao = 386000,  --VIP7
--needYuanBao = 886000,  --VIP8
--needYuanBao = 1686000,  --VIP9
--needYuanBao = 3186000,  --VIP10
--needYuanBao = 6186000,  --VIP11
--needYuanBao = 11186000,  --VIP12

--#include "..\..\language\LangCode.txt"
--显示的特权列表
--VIP奖励配置, VIP配置, VIP奖励,
VipConfig = {    
	VipGrade =     
	{
		--所有等级格式一致,当前等级没有直接空表即可
		{
			
			vip = 1,	
			DepotPage = 2,			--VIP可开放的仓库页数
			needYuanBao = 0, 		--VIP1
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}
			skillLevelUp = 3,				
			reward = 
			{
{type=0,id=536,count=10,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=10,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=1,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=509,count=10,strong=0,quality=0,bind=1,sex=-1},--大金砖(绑金)
{type=0,id=561,count=20,strong=0,quality=0,bind=1,sex=-1},--天山雪莲(120w)
{type=0,id=6271,count=10,strong=0,quality=0,bind=1,sex=-1},--五彩石



			},
			freeRelive = 2,
			attrcalc = 																--属性
			{
				--  {type = 12,value = 0.01},
				--  {type = 16,value = 0.01},
				--  {type = 20,value = 0.01},

				{type = 9,value = 158,job = 1},
				{type = 11,value = 158,job = 1},
				{type = 13,value = 158,job = 2},
				{type = 15,value = 158,job = 2},
				{type = 17,value = 158,job = 3},
				{type = 19,value = 158,job = 3},
			}
		},
		{

			vip = 2,
			DepotPage = 2,			--VIP可开放的仓库页数
			needYuanBao = 0, 		--VIP2
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}			
			skillLevelUp = 3,
			reward = 
			{
{type=0,id=536,count=20,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=20,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=2,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=509,count=20,strong=0,quality=0,bind=1,sex=-1},--大金砖(绑金)
{type=0,id=678,count=100,strong=0,quality=0,bind=1,sex=-1},--副本传送卷
{type=0,id=6271,count=20,strong=0,quality=0,bind=1,sex=-1},--五彩石



			},		
			freeRelive = 3,
			attrcalc = 
			{
				--  {type = 12,value = 0.02},
				--  {type = 16,value = 0.02},
				--  {type = 20,value = 0.02},
				{type = 9,value = 358,job = 1},
				{type = 11,value = 358,job = 1},
				{type = 13,value = 358,job = 2},
				{type = 15,value = 358,job = 2},
				{type = 17,value = 358,job = 3},
				{type = 19,value = 358,job = 3},
			}
		},
		{
			vip = 3,	
			DepotPage = 3,			--VIP可开放的仓库页数
			needYuanBao = 0,  		--VIP3	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}			
			skillLevelUp = 3,
			reward = 
			{
{type=0,id=536,count=30,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=30,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=3,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=509,count=30,strong=0,quality=0,bind=1,sex=-1},--大金砖(绑金)
{type=0,id=5475,count=100,strong=0,quality=0,bind=1,sex=-1},--玛雅神殿证明
{type=0,id=6271,count=30,strong=0,quality=0,bind=1,sex=-1},--五彩石



			},	
			freeRelive = 4,
			attrcalc = 
			{
				--  {type = 12,value = 0.03},
				--  {type = 16,value = 0.03},
				--  {type = 20,value = 0.03},
				{type = 9,value = 658,job = 1},
				{type = 11,value = 658,job = 1},
				{type = 13,value = 658,job = 2},
				{type = 15,value = 658,job = 2},
				{type = 17,value = 658,job = 3},
				{type = 19,value = 658,job = 3},
			}
		},
		{
			vip = 4,	
			DepotPage = 3,			--VIP可开放的仓库页数
			needYuanBao = 0,  		--VIP4	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}	
			skillLevelUp = 3,
			reward = 
			{	
{type=0,id=536,count=40,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=40,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=4,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=509,count=40,strong=0,quality=0,bind=1,sex=-1},--大金砖(绑金)
{type=0,id=548,count=100,strong=0,quality=0,bind=1,sex=-1},--转生地宫证明
{type=0,id=6271,count=40,strong=0,quality=0,bind=1,sex=-1},--五彩石
			},
			freeRelive = 5,
			attrcalc = 
			{
				--  {type = 12,value = 0.04},
				--  {type = 16,value = 0.04},
				--  {type = 20,value = 0.04},
				{type = 9,value = 1058,job = 1},
				{type = 11,value = 1058,job = 1},
				{type = 13,value = 1058,job = 2},
				{type = 15,value = 1058,job = 2},
				{type = 17,value = 1058,job = 3},
				{type = 19,value = 1058,job = 3},
			}
		},
		{
			vip = 5,		
			DepotPage = 4,			--VIP可开放的仓库页数
			needYuanBao = 0,  		--VIP5	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}			
			skillLevelUp = 3,
			reward = 
			{
{type=0,id=536,count=50,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=50,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=5,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=509,count=50,strong=0,quality=0,bind=1,sex=-1},--大金砖(绑金)
{type=0,id=459,count=2000,strong=0,quality=0,bind=1,sex=-1},--星纹强化石
{type=0,id=6271,count=50,strong=0,quality=0,bind=1,sex=-1},--五彩石

			},
			freeRelive = 6,
			attrcalc = 
			{
				--  {type = 12,value = 0.05},
				--  {type = 16,value = 0.05},
				--  {type = 20,value = 0.05},
				{type = 9,value = 1558,job = 1},
				{type = 11,value = 1558,job = 1},
				{type = 13,value = 1558,job = 2},
				{type = 15,value = 1558,job = 2},
				{type = 17,value = 1558,job = 3},
				{type = 19,value = 1558,job = 3},
			}
		},
		{
			vip = 6,		
			DepotPage = 4,			--VIP可开放的仓库页数
			needYuanBao = 10000, 		--VIP6	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}	
			skillLevelUp = 3,
			reward = 
			{
{type=0,id=4646,count=1,strong=0,quality=0,bind=1,sex=0,job=1},--5转战士衣服男
{type=0,id=4647,count=1,strong=0,quality=0,bind=1,sex=1,job=1},--5转战士衣服女
{type=0,id=4655,count=1,strong=0,quality=0,bind=1,sex=0,job=2},--5转法师衣服男
{type=0,id=4656,count=1,strong=0,quality=0,bind=1,sex=1,job=2},--5转法师衣服女
{type=0,id=4664,count=1,strong=0,quality=0,bind=1,sex=0,job=3},--5转道士衣服男
{type=0,id=4665,count=1,strong=0,quality=0,bind=1,sex=1,job=3},--5转道士衣服女
{type=0,id=536,count=100,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=100,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=50,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=6658,count=20,strong=0,quality=0,bind=1,sex=-1},--灵器礼盒
{type=0,id=6271,count=200,strong=0,quality=0,bind=1,sex=-1},--五彩石

			},
			freeRelive = 7,
			attrcalc = 
			{
				--  {type = 12,value = 0.06},
				--  {type = 16,value = 0.06},
				--  {type = 20,value = 0.06},
				{type = 9,value = 2188,job = 1},
				{type = 11,value = 2188,job = 1},
				{type = 13,value = 2188,job = 2},
				{type = 15,value = 2188,job = 2},
				{type = 17,value = 2188,job = 3},
				{type = 19,value = 2188,job = 3},
			}
		},
		{
			vip = 7,		
			DepotPage = 5,			--VIP可开放的仓库页数
			needYuanBao = 100000,  		--VIP7	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}				
			skillLevelUp = 3,
			reward = 
			{
{type=0,id=4645,count=1,strong=0,quality=0,bind=1,sex=-1,job=1},--5转战士武器男
{type=0,id=4654,count=1,strong=0,quality=0,bind=1,sex=-1,job=2},--5转法师武器男
{type=0,id=4663,count=1,strong=0,quality=0,bind=1,sex=-1,job=3},--5转道士武器男
{type=0,id=536,count=200,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=200,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=100,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=6658,count=30,strong=0,quality=0,bind=1,sex=-1},--灵器礼盒
{type=0,id=6271,count=300,strong=0,quality=0,bind=1,sex=-1},--五彩石


			},
			freeRelive = 8,
			attrcalc = 
			{
				--  {type = 12,value = 0.07},
				--  {type = 16,value = 0.07},
				--  {type = 20,value = 0.07},
				{type = 9,value = 2888,job = 1},
				{type = 11,value = 2888,job = 1},
				{type = 13,value = 2888,job = 2},
				{type = 15,value = 2888,job = 2},
				{type = 17,value = 2888,job = 3},
				{type = 19,value = 2888,job = 3},
			}
		},
		{
			vip = 8,		
			DepotPage = 5,			--VIP可开放的仓库页数
			needYuanBao = 500000,		--VIP8	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}	
			skillLevelUp = 3,
			reward = 
			{
{type=0,id=536,count=300,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=300,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=150,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=509,count=300,strong=0,quality=0,bind=1,sex=-1},--大金砖(绑金)
{type=0,id=6658,count=40,strong=0,quality=0,bind=1,sex=-1},--灵器礼盒
{type=0,id=6271,count=500,strong=0,quality=0,bind=1,sex=-1},--五彩石



			},
			freeRelive = 9,
			attrcalc = 
			{
				--  {type = 12,value = 0.08},
				--  {type = 16,value = 0.08},
				--  {type = 20,value = 0.08},
				{type = 9,value = 3688,job = 1},
				{type = 11,value = 3688,job = 1},
				{type = 13,value = 3688,job = 2},
				{type = 15,value = 3688,job = 2},
				{type = 17,value = 3688,job = 3},
				{type = 19,value = 3688,job = 3},
			}
		},
		{
			vip = 9,	
			DepotPage = 6,			--VIP可开放的仓库页数
			needYuanBao = 1000000,		--VIP9	
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}				
			skillLevelUp = 3,
			reward = 
			{
{type=0,id=536,count=400,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=400,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=200,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=5365,count=50,strong=0,quality=0,bind=1,sex=-1},--三阶宝石袋
{type=0,id=509,count=400,strong=0,quality=0,bind=1,sex=-1},--大金砖(绑金)
{type=0,id=6658,count=50,strong=0,quality=0,bind=1,sex=-1},--灵器礼盒
{type=0,id=6271,count=700,strong=0,quality=0,bind=1,sex=-1},--五彩石

			},
			freeRelive = 10,
			attrcalc = 
			{
				--  {type = 12,value = 0.09},
				--  {type = 16,value = 0.09},
				--  {type = 20,value = 0.09},
				{type = 9,value = 4600,job = 1},
				{type = 11,value = 4600,job = 1},
				{type = 13,value = 4600,job = 2},
				{type = 15,value = 4600,job = 2},
				{type = 17,value = 4600,job = 3},
				{type = 19,value = 4600,job = 3},
			}
		},
		{
			vip = 10,	
			DepotPage = 7,			--VIP可开放的仓库页数
			needYuanBao = 2000000,		--VIP10
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}				
			skillLevelUp = 3,
			reward = 
			{
{type=0,id=536,count=500,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=500,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=300,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=5384,count=50,strong=0,quality=0,bind=1,sex=-1},--四阶宝石袋
{type=0,id=509,count=500,strong=0,quality=0,bind=1,sex=-1},--大金砖(绑金)
{type=0,id=6658,count=60,strong=0,quality=0,bind=1,sex=-1},--灵器礼盒
{type=0,id=6271,count=1000,strong=0,quality=0,bind=1,sex=-1},--五彩石

			},
			freeRelive = 11,
			attrcalc = 
			{
				--  {type = 12,value = 0.10},
				--  {type = 16,value = 0.10},
				--  {type = 20,value = 0.10},
				{type = 9,value = 5800,job = 1},
				{type = 11,value = 5800,job = 1},
				{type = 13,value = 5800,job = 2},
				{type = 15,value = 5800,job = 2},
				{type = 17,value = 5800,job = 3},
				{type = 19,value = 5800,job = 3},
			}

		},
		{
			vip = 11,	
			DepotPage = 8,			--VIP可开放的仓库页数
			needYuanBao = 5000000,		--VIP10
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}				
			skillLevelUp = 3,
			reward = 
			{
{type=0,id=536,count=600,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=600,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=600,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=6936,count=1,strong=0,quality=0,bind=1,sex=-1},--至尊屠龙首饰盒
{type=0,id=509,count=600,strong=0,quality=0,bind=1,sex=-1},--大金砖(绑金)
{type=0,id=6658,count=100,strong=0,quality=0,bind=1,sex=-1},--灵器礼盒
{type=0,id=6271,count=1500,strong=0,quality=0,bind=1,sex=-1},--五彩石

			},
			freeRelive = 12,
			attrcalc = 
			{
				--  {type = 12,value = 0.11},
				--  {type = 16,value = 0.11},
				--  {type = 20,value = 0.11},
				{type = 9,value = 7188,job = 1},
				{type = 11,value = 7188,job = 1},
				{type = 13,value = 7188,job = 2},
				{type = 15,value = 7188,job = 2},
				{type = 17,value = 7188,job = 3},
				{type = 19,value = 7188,job = 3},
			}

		},
		{
			vip = 12,	
			DepotPage = 9,			--VIP可开放的仓库页数
			needYuanBao = 10000000,		--VIP10
			shengJingScene = {},		--{圣境ID,x,y}
			hookScene = {77},		--{挂机场景ID,x,y}
			boxScene = {182,188},		--{打宝场景ID,x,y}				
			skillLevelUp = 3,
			reward = 
			{
{type=0,id=536,count=1000,strong=0,quality=0,bind=1,sex=-1},--护符碎片(10000颗)
{type=0,id=570,count=1000,strong=0,quality=0,bind=1,sex=-1},--护盾碎片(10000颗)
{type=0,id=553,count=1000,strong=0,quality=0,bind=1,sex=-1},--战将灵力丹(大)
{type=0,id=6362,count=1,strong=0,quality=0,bind=1,sex=-1},--至尊屠龙刀
{type=0,id=509,count=1000,strong=0,quality=0,bind=1,sex=-1},--大金砖(绑金)
{type=0,id=6658,count=150,strong=0,quality=0,bind=1,sex=-1},--灵器礼盒
{type=0,id=6271,count=2000,strong=0,quality=0,bind=1,sex=-1},--五彩石

			},
			freeRelive = 12,
			attrcalc = 
			{
				--  {type = 12,value = 0.12},
				--  {type = 16,value = 0.12},
				--  {type = 20,value = 0.12},
				{type = 9,value = 8888,job = 1},
				{type = 11,value = 8888,job = 1},
				{type = 13,value = 8888,job = 2},
				{type = 15,value = 8888,job = 2},
				{type = 17,value = 8888,job = 3},
				{type = 19,value = 8888,job = 3},
			}

		},
	},
}
