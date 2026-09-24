
--转生锻造 
--[[
装备类型：
	itWeapon = 1,				//武器
	itDress = 2,				//衣服
	itHelmet = 3,				//头盔
	itNecklace = 4,				//项链
	itDecoration =5,            //勋章
	itBracelet  = 6,			//手镯
	itRing = 7,					//戒指
	itGirdle = 8,				//腰带
	itShoes = 9,				//鞋子
	itEquipDiamond=10,          //宝石
	itMeterial =11,             //材料
	itFashionDress=12,          //时装
	itSwing=13,					//翅膀
--]]

--转生装备锻造
CircleForge = 
{
	baseEquip =
	{
		minlevel = 60,				--装备转生最低级数
		rates = {1,2, 3, 4, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41,43,45,47,49,51,53,55,57,59,61,63,65,67 },	--对应每转的消耗数量倍数 {1转, 2转....} 消耗=rate*base 可以为浮点 得到的值舍弃小数
		base = 
		{
			{
				eqtype = {5,10,11,},	--装备类型(物品类型)
				consumes = 	--消耗要求物品
				{
					{type = 0, id = 511, count = 3,}, 
					{type = 5, id = 0, count = 200000},
				},
			},
			{
				eqtype = {3,4, 6, 7, 8, 9,},	--装备类型(物品类型)
				consumes = 	--消耗要求物品
				{
					{type = 0, id = 511, count = 3,}, 
					{type = 5, id = 0, count = 100000},
				},
			},	
			{
				eqtype = {1,},	--武器(物品类型)
				consumes = 	--消耗要求物品
				{
					{type = 0, id = 511, count = 7,}, 
					{type = 5, id = 0, count = 300000},
				},
			},
			{
				eqtype = {2,},	--衣服(物品类型)
				consumes = 	--消耗要求物品
				{
					{type = 0, id = 511, count = 5,}, 
					{type = 5, id = 0, count =  200000},
				},
			},
		
		},
	},
	
	--战神装消耗
	zhanShenEquip =
	{	
	},
}