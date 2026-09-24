--lua script

--装备升级配置

Any_Stuff = 0
Any_Protect = 1
AuthType_Wash = 2
Any_Silver = 3

-- type 定义在 ActorEventDef.h 中的 tagAwardType

RandomBase = 10000

--装备升级条件
EquipUpgradeConf = {
	minItLv = 0,
	failDownLv = 3,
	notGradeTypes = {
		--[BaseTypes.itemTypes.itRing] = 1,
		--[BaseTypes.itemTypes.itDecoration] = 1,
		[BaseTypes.itemTypes.itSwing] = 1,
	},
	--材料id 基础
	qualityItem = {type = 0, id = 572, count = 2, yb = 10, usetype = AuthType_Wash},
	qualityRate = {0,1,2,3,4,5},	--倍数
}

EquipStrongCond = {
	minItLv = 0,
	MinStrongSharp = 15,				--10星时才有锋利值
	MaxSharp =	{40,70,150,200,250},			--最大锋利值
	RandSharp = {1,3},			--失败时这个区域内随即锋利值
	UpToBuildAttr = 8,			--达到这个等级时才生产极品

}

EquipAuthCond = {
	minItLv = 0,
}

--装备强化配置
--yb不填或为0表示不能用元宝代替，有值表示单个物品的价格代替
EquipStrongConfig = {
	notice = 7,	--强化到多少级后全服提示
	{		-- +1
		failDownIdx = {0,0},	--最小值，最大值
		strong = { --{type = 5, count = 10, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 20000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 0, logs = {19, Lang.LogTips.l00070}},},
		rate = 10000,
	},
	
	{		-- +2
		failDownIdx = {1,1},	--最小值，最大值
		strong = { --{type = 15, count = 20, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 40000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 251, logs = {19, Lang.LogTips.l00070}},},
		rate = 9000,
	},
	{		-- +3
		failDownIdx = {1,1},	--最小值，最大值
		strong = { --{type = 15, count = 30, logs = {19, Lang.LogTips.l00070}},
								{type = 5, count = 80000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 662, logs = {19, Lang.LogTips.l00070}},},
		rate = 8000,
	},	
	{		-- +4
		failDownIdx = {2,2},	--最小值，最大值
		strong = { --{type = 15, count = 40, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 140000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 1272, logs = {19, Lang.LogTips.l00070}},},
		rate = 6500,
	},
	{		-- +5
		failDownIdx = {2,3},	--最小值，最大值
		strong = { --{type = 15, count = 50, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 220000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 2120, logs = {19, Lang.LogTips.l00070}},},
		rate = 5000,
	},
	
	{		-- +6
		failDownIdx = {2,4},	--最小值，最大值
		strong = { --{type = 15, count = 60, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 320000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 3232, logs = {19, Lang.LogTips.l00070}},},
		rate = 4000,
	},
	{		-- +7
		failDownIdx = {3,5},	--最小值，最大值
		strong = { --{type = 15, count = 70, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 440000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 4463, logs = {19, Lang.LogTips.l00070}},},
		rate = 3000,
	},	
	{		-- +8
		failDownIdx = {4,6},	--最小值，最大值
		strong = { --{type = 15, count = 80, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 580000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 5906, logs = {19, Lang.LogTips.l00070}},},
		rate = 2000,
	},
	{		-- +9
		failDownIdx = {5,7},	--最小值，最大值
		strong = { --{type = 15, count = 90, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 740000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 7525, logs = {19, Lang.LogTips.l00070}},},
		rate = 1500,
	},
	
	{		-- +10
		failDownIdx = {6,8},	--最小值，最大值
		strong = { --{type = 15, count = 100, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 920000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 9265, logs = {19, Lang.LogTips.l00070}},},
		rate = 1000,
	},
	
	{		-- +11
		failDownIdx = {10,10},	--最小值，最大值
		strong = { --{type = 15, count = 110, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 1120000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 10926, logs = {19, Lang.LogTips.l00070}},},
		rate = 200,
	},
	
	{		-- +12
		failDownIdx = {11,11},	--最小值，最大值
		strong = { --{type = 15, count = 120, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 1340000, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 12686, logs = {19, Lang.LogTips.l00070}},},
		rate = 100,
	},
	
	{		-- +13
		failDownIdx = {12,12},	--最小值，最大值
		strong = { --{type = 15, count = 130, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 133, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 100, logs = {19, Lang.LogTips.l00070}},},
		rate = 1,
	},
	
	{		-- +14
		failDownIdx = {13,13},	--最小值，最大值
		strong = { --{type = 15, count = 140, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 144, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 14, logs = {19, Lang.LogTips.l00070}},},
		rate = 1,
	},
	
	{		-- +15
		failDownIdx = {14,14},	--最小值，最大值
		strong = { --{type = 15, count = 150, logs = {19, Lang.LogTips.l00070}}, 
								{type = 5, count = 155, logs = {134, Lang.LogTips.l00103}} },
		protect = {{type = 15, count = 15, logs = {19, Lang.LogTips.l00070}},},
		rate = 1,
	},
}

--[[
	Item.itWeapon = 1,				//武器
	Item.itDress = 2,				//衣服
	Item.itHelmet = 3,				//头盔
	Item.itNecklace = 4,				//项链
	Item.itDecoration =5,            		//勋章
	Item.itBracelet  = 6,			//手镯
	Item.itRing = 7,				//戒指
	Item.itGirdle = 8,				//腰带
	Item.itShoes = 9,				//鞋子
	Item.itEquipDiamond=10,          		//宝石(可装备的宝石)
	Item.itMeterial =11,             		//材料
	Item.itFashionDress=12,          		//时装
	Item.itSwing=13,				//翅膀
]]

DecorationUpgrade = 
{

  --烈火2升级装备三合一 
	{
		level = 0,		--  20升级到40装备 
		strongLv = 0,	--要求强化等级
		sourceEquips = {7,	8,	9,	10,	11,	12,	13,	14,	15,	16,	17,	18,	19,	20,	21,	22,	23,	24,	25,	26,	27,	28,	29,	30,	31,	32,	33,	34,	35,	36,	37,	38,	39,	40,	41,	42,	43,	44,	45,	46,	47,	48,	49,	50,	51,	52,	53,	54,	55,	56,	57,	58,	59,	60,	61,	62,	63,	64,	65,	66,
},
		targetEquips = {37,	38,	39,	40,	41,	42,	43,	44,	45,	46,	47,	48,	49,	50,	51,	52,	53,	54,	55,	56,	57,	58,	59,	60,	61,	62,	63,	64,	65,	66,	67,	68,	69,	70,	71,	72,	73,	74,	75,	76,	77,	78,	79,	80,	81,	82,	83,	84,	85,	86,	87,	88,	89,	90,	91,	92,	93,	94,	95,	96,
},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = -1, count = 2, yb = 0},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量

					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
	
	{
		level = 0,		-- 勋章升级等级限制，四合一
		strongLv = 0,	--要求强化等级
		sourceEquips = {692,693,694,695,696,697,698,699,700,},   
		targetEquips = {693,694,695,696,697,698,699,700,701,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = -1, count = 3, yb = 0},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	{
		level = 0,		-- 特殊戒指升级配置，三合一
		strongLv = 0,	--要求强化等级
		sourceEquips = {549,982,1092,1093,1094,550,983,1096,1097,1098,551,984,1100,1101,1102,1069,1495,1496,1497,1498,880,1530,1531,1532,1533,1095,1099,1103,},   
		targetEquips = {982,1092,1093,1094,1095,983,1096,1097,1098,1099,984,1100,1101,1102,1103,1495,1496,1497,1498,1499,1530,1531,1532,1533,1534,1582,1583,1584,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = -1, count = 2, yb = 0},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,100,100,100,100,100},
	},

		{
		level = 0,		--幻武升级配置，三合一
		strongLv = 0,	--要求强化等级
		sourceEquips = {1626,	1636,	1646,	1656,	1666,	1676,	1793,	1803,	1813,	1823,	1833,	1843,1627,	1637,	1647,	1657,	1667,	1677,	1794,	1804,	1814,	1824,	1834,	1844,


},   
		targetEquips = {1627,	1637,	1647,	1657,	1667,	1677,	1794,	1804,	1814,	1824,	1834,	1844,1628,	1638,	1648,	1658,	1668,	1678,	1795,	1805,	1815,	1825,	1835,	1845,


},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = -1, count = 2, yb = 0},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,100,100,100,100,100},
	},
	
	{
		level = 0,		--幻武升级配置，二合一
		strongLv = 0,	--要求强化等级
		sourceEquips = {
1628,	1638,	1648,	1658,	1668,	1678,	1795,	1805,	1815,	1825,	1835,	1845,
1629,	1639,	1649,	1659,	1669,	1679,	1796,	1806,	1816,	1826,	1836,	1846,
1630,	1640,	1650,	1660,	1670,	1680,	1797,	1807,	1817,	1827,	1837,	1847,
1631,	1641,	1651,	1661,	1671,	1681,	1798,	1808,	1818,	1828,	1838,	1848,
1632,	1642,	1652,	1662,	1672,	1682,	1799,	1809,	1819,	1829,	1839,	1849,
1633,	1643,	1653,	1663,	1673,	1683,	1800,	1810,	1820,	1830,	1840,	1850,
1634,	1644,	1654,	1664,	1674,	1684,	1801,	1811,	1821,	1831,	1841,	1851,



},   
		targetEquips = {
1629,	1639,	1649,	1659,	1669,	1679,	1796,	1806,	1816,	1826,	1836,	1846,
1630,	1640,	1650,	1660,	1670,	1680,	1797,	1807,	1817,	1827,	1837,	1847,
1631,	1641,	1651,	1661,	1671,	1681,	1798,	1808,	1818,	1828,	1838,	1848,
1632,	1642,	1652,	1662,	1672,	1682,	1799,	1809,	1819,	1829,	1839,	1849,
1633,	1643,	1653,	1663,	1673,	1683,	1800,	1810,	1820,	1830,	1840,	1850,
1634,	1644,	1654,	1664,	1674,	1684,	1801,	1811,	1821,	1831,	1841,	1851,
1635,	1645,	1655,	1665,	1675,	1685,	1802,	1812,	1822,	1832,	1842,	1852,


},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = -1, count = 1, yb = 0},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,100,100,100,100,100},
	},
	
--祝福秘珠升级配置
	
	{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {1019,},   
		targetEquips = {1084,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 280, count = 10, yb =18},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
	{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {1084,},   
		targetEquips = {1085,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 280, count = 20, yb =18},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
	{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {1085,},   
		targetEquips = {1086,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 281, count = 20, yb =54},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
	
	{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {1086,},   
		targetEquips = {1087,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 282, count = 25, yb =162},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
--幸运骰子升级配置	
		{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {644,},   
		targetEquips = {1088,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 280, count = 40, yb =18},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
			{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {1088,},   
		targetEquips = {1089,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 281, count = 40, yb =54},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
			{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {1089,},   
		targetEquips = {1090,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 282, count = 40, yb =162},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
			{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {1090,},   
		targetEquips = {1091,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 282, count = 60, yb =162},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	


--职业材料升级配置	
		{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {453,454,455,456,457,458},   
		targetEquips = {1126,1130,1134,1138,1142,1146,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 280, count = 20, yb =18},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
			{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {1126,1130,1134,1138,1142,1146,},   
		targetEquips = {1127,1131,1135,1139,1143,1147,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 281, count = 20, yb =54},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
			{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {1127,1131,1135,1139,1143,1147,},   
		targetEquips = {1128,1132,1136,1140,1144,1148,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 282, count = 20, yb =162},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
			{
		level = 0,		-- 材料升级配置
		strongLv = 0,	--要求强化等级
		sourceEquips = {1128,1132,1136,1140,1144,1148,},   
		targetEquips = {1129,1133,1137,1141,1145,1149,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 282, count = 30, yb =162},      --id为-1表示id是由sourceEquips中id决定的。
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id分配材料数量
		
					},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},


--时装升级


--1~2级时装
{
		level = 20,		-- 物品20级升级
		strongLv = 0,	--要求强化等级
		sourceEquips = {685,686,687,688,689,690,691,1445,1455,},
		targetEquips = {1227,1236,1245,1254,1263,1272,1281,1446,1456,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 280, count = 35, yb = 18},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 10000},
		},
		class = {--按部位id分配材料数量
		
		},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},

	
	
--2~3级时装
{
		level = 20,		-- 物品20级升级
		strongLv = 0,	--要求强化等级
		sourceEquips = {1227,1236,1245,1254,1263,1272,1281,888,889,890,891,1446,1456,},
		targetEquips = {1228,1237,1246,1255,1264,1273,1282,1291,1300,1309,1318,1447,1457,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 281, count = 20, yb = 54},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 10000},
		},
		class = {--按部位id分配材料数量
		
		},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},

	
	
	
--3~4级时装
{
		level = 20,		-- 物品20级升级
		strongLv = 0,	--要求强化等级
		sourceEquips = {1228,1237,1246,1255,1264,1273,1282,1291,1300,1309,1318,1447,1457,},
		targetEquips = {1229,1238,1247,1256,1265,1274,1283,1292,1301,1310,1319,1448,1458,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 281, count = 40, yb = 54},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 10000},
		},
		class = {--按部位id分配材料数量
		
		},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},

--4~5级时装
{
		level = 20,		-- 物品20级升级
		strongLv = 0,	--要求强化等级
		sourceEquips = {1229,1238,1247,1256,1265,1274,1283,1292,1301,1310,1319,1448,1458,},
		targetEquips = {1230,1239,1248,1257,1266,1275,1284,1293,1302,1311,1320,1449,1459,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 281, count = 60, yb = 54},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 10000},
		},
		class = {--按部位id分配材料数量
		
		},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},

--5~6级时装
	{
		level = 20,		-- 物品20级升级
		strongLv = 0,	--要求强化等级
		sourceEquips = {1230,1239,1248,1257,1266,1275,1284,1293,1302,1311,1320,270,271,1449,1459,},
		targetEquips = {1231,1240,1249,1258,1267,1276,1285,1294,1303,1312,1321,1348,1357,1450,1460,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 282, count = 50, yb = 162},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 10000},
		},
		class = {--按部位id分配材料数量
		
		},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},

--6~7级时装
{
		level = 20,		-- 物品20级升级
		strongLv = 0,	--要求强化等级
		sourceEquips = {1231,1240,1249,1258,1267,1276,1285,1294,1303,1312,1321,892,893,1348,1357,1450,1460,1596,1597,1598,1599,},
		targetEquips = {1232,1241,1250,1259,1268,1277,1286,1295,1304,1313,1322,1331,1340,1349,1358,1451,1461,1688,1692,1696,1700,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 282, count = 60, yb = 162},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 10000},
		},
		class = {--按部位id分配材料数量
		
		},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
--7~8级时装
{
		level = 20,		-- 物品20级升级
		strongLv = 0,	--要求强化等级
		sourceEquips = {1232,1241,1250,1259,1268,1277,1286,1295,1304,1313,1322,1331,1340,1349,1358,1451,1461,1688,1692,1696,1700,},
		targetEquips = {1233,1242,1251,1260,1269,1278,1287,1296,1305,1314,1323,1332,1341,1350,1359,1452,1462,1689,1693,1697,1701,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 282, count = 80, yb = 162},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 10000},
		},
		class = {--按部位id分配材料数量
		
		},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},

--8~9级时装
{
		level = 20,		-- 物品20级升级
		strongLv = 0,	--要求强化等级
		sourceEquips = {1233,1242,1251,1260,1269,1278,1287,1296,1305,1314,1323,1332,1341,1350,1359,1452,1462,1689,1693,1697,1701,},
		targetEquips = {1234,1243,1252,1261,1270,1279,1288,1297,1306,1315,1324,1333,1342,1351,1360,1453,1463,1690,1694,1698,1702,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 283, count = 80, yb = 0},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 10000},
		},
		class = {--按部位id分配材料数量
		
		},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},

--9~10级时装
	{
		level = 20,		-- 物品20级升级
		strongLv = 0,	--要求强化等级
		sourceEquips = {1234,1243,1252,1261,1270,1279,1288,1297,1306,1315,1324,1333,1342,1351,1360,1453,1463,1690,1694,1698,1702,},
		targetEquips = {1235,1244,1253,1262,1271,1280,1289,1298,1307,1316,1325,1334,1343,1352,1361,1454,1464,1691,1695,1699,1703,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 1402, count = 60, yb = 0},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 10000},
		},
		class = {--按部位id分配材料数量
		
		},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},

--战神套升级
	{
		level = 0,		-- 物品20级升级
		strongLv = 0,	--要求强化等级
		sourceEquips = {573,	574,	575,	576,	577,	578,	579,	580,	581,	667,	960,1125,1593,1594,},
		targetEquips = {1390,	1391,	1392,	1393,	1394,	1395,	1396,	1397,	1398,	1399,	1400,1401,1704,1705,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 1402, count = 60, yb = 0},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 50000},
		},
		class = {--按部位id分配材料数量
			[Item.itWeapon] = 100,--武器
			[Item.itDress] = 55,--衣服
			[Item.itHelmet] = 45,--头盔
			[Item.itNecklace] = 25,--项链
			[Item.itBracelet] = 15,--手镯
			[Item.itGirdle] = 15,--腰带
			[Item.itShoes] = 15,--鞋子
			[Item.itEquipDiamond] = 25,--宝石
			[Item.itRing] = 15,    --戒指
			[Item.itDecoration] = 20,    --勋章			
		},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},

	
}

EquipUpgradeConfig = {



--套装升级

	{
		level = 40,		-- 物品40级升级
		strongLv = 0,	--要求强化等级
		sourceEquips = {67,	68,	69,	70,	71,	72,	73,	74,	75,	76,	77,	78,	79,	80,	81,	82,	83,	84,	85,	86,	87,	88,	89,	90,	91,	92,	93,	94,	95,	96,
},
		targetEquips = {97,	98,	99,	100,	101,	102,	103,	104,	105,	106,	107,	108,	109,	110,	111,	112,	113,	114,	115,	116,	117,	118,	119,	120,	121,	122,	123,	124,	125,	126,
},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 280, count = 10, yb = 18},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 10000},
		},
		class = {--按部位id分配材料数量
			[Item.itWeapon] = 100,--武器
			[Item.itDress] = 40,--衣服
			[Item.itHelmet] = 20,--头盔
			[Item.itNecklace] = 30,--项链
			[Item.itBracelet] = 10,--手镯
			[Item.itGirdle] = 20,--腰带
			[Item.itShoes] = 20,--鞋子
			[Item.itEquipDiamond] = 30,--宝石
			[Item.itRing] = 15,    --戒指
		
		},
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
	{
		level = 45,		-- 45级升级
		strongLv = 4,	--要求强化等级
		sourceEquips = {97,	98,	99,	100,	101,	102,	103,	104,	105,	106,	107,	108,	109,	110,	111,	112,	113,	114,	115,	116,	117,	118,	119,	120,	121,	122,	123,	124,	125,	126,
},
		targetEquips = {127,	128,	129,	130,	131,	132,	133,	134,	135,	136,	137,	138,	139,	140,	141,	142,	143,	144,	145,	146,	147,	148,	149,	150,	151,	152,	153,	154,	155,	156,
},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 280, count = 40, yb = 54},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 20000},
		},
		class = {--按部位id分配材料数量
			[Item.itWeapon] = 100,--武器
			[Item.itDress] = 40,--衣服
			[Item.itHelmet] = 20,--头盔
			[Item.itNecklace] = 30,--项链
			[Item.itBracelet] = 10,--手镯
			[Item.itGirdle] = 20,--腰带
			[Item.itShoes] = 20,--鞋子
			[Item.itEquipDiamond] = 30,--宝石
			[Item.itRing] = 15,    --戒指
		
		},  
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
		{
		level = 50,		-- 50级升级
		strongLv = 5,	--要求强化等级
		sourceEquips = {127,	128,	129,	130,	131,	132,	133,	134,	135,	136,	137,	138,	139,	140,	141,	142,	143,	144,	145,	146,	147,	148,	149,	150,	151,	152,	153,	154,	155,	156,
},
		targetEquips = {157,	158,	159,	160,	161,	162,	163,	164,	165,	166,	167,	168,	169,	170,	171,	172,	173,	174,	175,	176,	177,	178,	179,	180,	181,	182,	183,	184,	185,	186,
},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 280, count = 35, yb = 162},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 30000},
		},
		class = {--按部位id分配材料数量
			[Item.itWeapon] = 100,--武器
			[Item.itDress] = 40,--衣服
			[Item.itHelmet] = 20,--头盔
			[Item.itNecklace] = 30,--项链
			[Item.itBracelet] = 10,--手镯
			[Item.itGirdle] = 20,--腰带
			[Item.itShoes] = 20,--鞋子
			[Item.itEquipDiamond] = 30,--宝石
			[Item.itRing] = 15,    --戒指
		
		}, 
		--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	{
		level = 55,		-- 55级升级
		strongLv = 6,	--要求强化等级
		sourceEquips = {157,	158,	159,	160,	161,	162,	163,	164,	165,	166,	167,	168,	169,	170,	171,	172,	173,	174,	175,	176,	177,	178,	179,	180,	181,	182,	183,	184,	185,	186,
},
		targetEquips = {187,	188,	189,	190,	191,	192,	193,	194,	195,	196,	197,	198,	199,	200,	201,	202,	203,	204,	205,	206,	207,	208,	209,	210,	211,	212,	213,	214,	215,	216,
},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 281, count = 70, yb = 0},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 40000},
		},
		class = {--按部位id分配材料数量
			[Item.itWeapon] = 100,--武器
			[Item.itDress] = 40,--衣服
			[Item.itHelmet] = 20,--头盔
			[Item.itNecklace] = 30,--项链
			[Item.itBracelet] = 10,--手镯
			[Item.itGirdle] = 20,--腰带
			[Item.itShoes] = 20,--鞋子
			[Item.itEquipDiamond] = 30,--宝石
			[Item.itRing] = 15,    --戒指
		
		},   
				--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	
	{
		level = 60,		-- 60级升级
		strongLv = 8,	--要求强化等级
		sourceEquips = {187,	188,	189,	190,	191,	192,	193,	194,	195,	196,	197,	198,	199,	200,	201,	202,	203,	204,	205,	206,	207,	208,	209,	210,	211,	212,	213,	214,	215,	216,
},
		targetEquips = {217,	218,	219,	220,	221,	222,	223,	224,	225,	226,	227,	228,	229,	230,	231,	232,	233,	234,	235,	236,	237,	238,	239,	240,	241,	242,	243,	244,	245,	246,
},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 281, count = 80, yb = 0},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 50000},
		},
		class = {--按部位id分配材料数量
			[Item.itWeapon] = 100,--武器
			[Item.itDress] = 40,--衣服
			[Item.itHelmet] = 20,--头盔
			[Item.itNecklace] = 30,--项链
			[Item.itBracelet] = 10,--手镯
			[Item.itGirdle] = 20,--腰带
			[Item.itShoes] = 20,--鞋子
			[Item.itEquipDiamond] = 30,--宝石
			[Item.itRing] = 15,    --戒指
		
		},   
				--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
		{
		level = 65,		-- 60级升级
		strongLv = 8,	--要求强化等级
		sourceEquips = {217,	218,	219,	220,	221,	222,	223,	224,	225,	226,	227,	228,	229,	230,	231,	232,	233,	234,	235,	236,	237,	238,	239,	240,	241,	242,	243,	244,	245,	246,
},
		targetEquips = {247,	248,	249,	250,	251,	252,	253,	254,	255,	256,	257,	291,	292,	293,	294,	295,	296,	297,	298,	299,	300,	1194,	1195,	1196,	1197,	1198,	1199,	1200,	1201,	1202,
},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 281, count = 100, yb = 0},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 50000},
		},
		class = {--按部位id分配材料数量
			[Item.itWeapon] = 100,--武器
			[Item.itDress] = 40,--衣服
			[Item.itHelmet] = 20,--头盔
			[Item.itNecklace] = 30,--项链
			[Item.itBracelet] = 10,--手镯
			[Item.itGirdle] = 20,--腰带
			[Item.itShoes] = 20,--鞋子
			[Item.itEquipDiamond] = 30,--宝石
			[Item.itRing] = 15,    --戒指

		},
				--白装，绿装，蓝装，紫装，橙装，红装
		quality = {100,200,400,800,1600,3200},
	},
	


}



--鉴定:type = 0 物品  6 银两
EquipAuthenticateConfig = {
	consume = {
		{type = 0, usetype =AuthType_Wash, id = 278, count = 1, yb = 18},
		{type = 0, usetype =Any_Protect,  id = 279, count = 1, yb = 18},
		{type = 6, usetype =Any_Silver, id = 0, count = 1000},
	},
	auth = {
		{		--第一个
			{type = 0, usetype =Any_Stuff, id = 277, count = 1, yb = 3},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		{		--第二个
			{type = 0, usetype =Any_Stuff, id = 277, count = 2, yb = 3},
			{type = 6, usetype =Any_Silver, count = 1000},
		},
		{		--第三个
			{type = 0, usetype =Any_Stuff, id = 277, count = 3, yb = 3},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
	},
}

--转生装备升级配置
CircleEquipUpgradeConfig = {
	
	--55-60
	{
		sourceEquips = {193,	194,	195,	196,	197,	198,	199,	200,	201,	204,	205,	206,	207,	208,	209,	210,	211,	212,	215,	216,	217,	218,	219,	220,	221,	222,	223,202,213,224,},
		targetEquips = {226,	227,	228,	229,	230,	231,	232,	233,	234,	237,	238,	239,	240,	241,	242,	243,	244,	245,	248,	249,	250,	251,	252,	253,	254,	255,	256,235,246,257,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 283, count = 1, yb = 0},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id 对应材料成功率  /100
			[Item.itWeapon] =100  ,--武器
			[Item.itDress] = 181,--衣服
			[Item.itHelmet] = 222,--头盔
			[Item.itNecklace] = 400,--项链
			[Item.itBracelet] = 666,--手镯
			[Item.itGirdle] = 666,--腰带
			[Item.itShoes] = 666,--鞋子
			[Item.itEquipDiamond] = 400,--宝石
			[Item.itRing] = 666,    --戒指
		},
		baseRate = 250,		--基本成功率
		circleMax = {20000,40000,80000,160000,320000},		--转数修正/10000
		blessingMax = {450,800,1500,2500,3500},		--最大祝福值=(1/部位修正)
		blessingconst = 0,  --成功率的祝福值修正常数/10000
		failBlessingAddRate = {2000,3000,2500,1500,1000},
	},

	--60-65	
	{
		sourceEquips = {226,	227,	228,	229,	230,	231,	232,	233,	234,	235,	237,	238,	239,	240,	241,	242,	243,	244,	245,	246,	248,	249,	250,	251,	252,	253,	254,	255,	256,	257,},
		targetEquips = {1194,	1195,	1196,	1197,	1198,	1199,	1200,	1201,	1202,	1203,	1205,	1206,	1207,	1208,	1209,	1210,	1211,	1212,	1213,	1214,	1216,	1217,	1218,	1219,	1220,	1221,	1222,	1223,	1224,	1225,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 1402, count = 1, yb = 0},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id 对应材料成功率  /100
			[Item.itWeapon] =100  ,--武器
			[Item.itDress] = 181,--衣服
			[Item.itHelmet] = 222,--头盔
			[Item.itNecklace] = 400,--项链
			[Item.itBracelet] = 666,--手镯
			[Item.itGirdle] = 666,--腰带
			[Item.itShoes] = 666,--鞋子
			[Item.itEquipDiamond] = 400,--宝石
			[Item.itRing] = 666,    --戒指
		},
		baseRate = 250,		--基本成功率
		circleMax = {20000,40000,80000,160000,320000},		--转数修正/10000
		blessingMax = {450,800,1500,2500,3500},		--最大祝福值=(1/部位修正)
		blessingconst = 0,  --成功率的祝福值修正常数/10000
		failBlessingAddRate = {2000,3000,2500,1500,1000},
	},
	
--战神套	
	
	{
		sourceEquips = {573,	574,	575,	576,	577,	578,	579,	580,	581,	667,	960,1125,1593,1594,},
		targetEquips = {1390,	1391,	1392,	1393,	1394,	1395,	1396,	1397,	1398,	1399,	1400,1401,1704,1705,},
		stuff = {
			{type = 0, usetype =Any_Stuff,  id = 1402, count = 1, yb = 0},
			--{type = 0, usetype =Any_Protect, id = 284, count = 1, yb = 88},
			{type = 6, usetype =Any_Silver, id = 0, count = 1000},
		},
		class = {--按部位id 对应材料成功率  /100
			[Item.itWeapon] =100  ,--武器
			[Item.itDress] = 181,--衣服
			[Item.itHelmet] = 222,--头盔
			[Item.itNecklace] = 400,--项链
			[Item.itBracelet] = 666,--手镯
			[Item.itGirdle] = 666,--腰带
			[Item.itShoes] = 666,--鞋子
			[Item.itEquipDiamond] = 400,--宝石
			[Item.itRing] = 666,    --戒指
		},
		baseRate = 167,		--基本成功率
		circleMax = {20000,40000,80000,160000,320000},		--转数修正/10000
		blessingMax = {450,800,1500,2500,3500},		--最大祝福值=(1/部位修正)
		blessingconst = 0,  --成功率的祝福值修正常数/10000
		failBlessingAddRate = {2000,3000,2500,1500,1000},
	},
}

--装备重置强化属性配置
EquipResetStrongConfig = {
	addBindCoins = {
				{ min_count = 4000, max_count = 8000 }, --1
				{ min_count = 12000, max_count = 24000 },--2
				{ min_count = 28000, max_count = 56000 },--3
				{ min_count = 56000, max_count = 112000 },--4
				{ min_count = 100000, max_count = 200000 },--5
				{ min_count = 164000, max_count = 328000 },--6
				{ min_count = 252000, max_count = 504000 },--7
				{ min_count = 368000, max_count = 736000 },--8
				{ min_count = 516000, max_count = 1032000 },--9
				{ min_count = 700000, max_count = 1400000 },--10
				{ min_count = 924000, max_count = 1848000 },--11
				{ min_count = 1200000, max_count = 2400000 },--12
			}

}

--购买强化次数
EquipBuyStrongCountConfig = {
	levelLimit = 0,
	consume = {
				{type = 15,	count = 0		,logs = {963,Lang.LogTips.l00181}}, --次数从0到1的消耗
				{type = 15,	count = 1500	,logs = {963,Lang.LogTips.l00181}},
				{type = 15,	count = 1500	,logs = {963,Lang.LogTips.l00181}},
				{type = 15,	count = 1500	,logs = {963,Lang.LogTips.l00181}},
				{type = 15,	count = 1500	,logs = {963,Lang.LogTips.l00181}},
				{type = 15,	count = 1500	,logs = {963,Lang.LogTips.l00181}},
				{type = 15, count = 1500	,logs = {963,Lang.LogTips.l00181}},
				{type = 15, count = 1500	,logs = {963,Lang.LogTips.l00181}},
				{type = 15, count = 1500	,logs = {963,Lang.LogTips.l00181}},
				{type = 15, count = 1500	,logs = {963,Lang.LogTips.l00181}},
				{type = 15, count = 1500		,logs = {963,Lang.LogTips.l00181}},
				{type = 15, count = 1500		,logs = {963,Lang.LogTips.l00181}},
			},

}


--鉴定消耗（霸者之刃）
EquipNewAuthenticateConfig = 
{
	--每一阶锁定属性消耗的元宝
	lockConsume = 
	{
		{type = 15,id = 0,	count = 100	,logs = {125,Lang.LogTips.l00213}},
		{type = 15,id = 0,	count = 200	,logs = {125,Lang.LogTips.l00213}},
		{type = 15,id = 0,	count = 300	,logs = {125,Lang.LogTips.l00213}},
		{type = 15,id = 0,	count = 400	,logs = {125,Lang.LogTips.l00213}},
		{type = 15,id = 0,	count = 500	,logs = {125,Lang.LogTips.l00213}},
		{type = 15,id = 0,	count = 600	,logs = {125,Lang.LogTips.l00213}},
		{type = 15,id = 0,	count = 700	,logs = {125,Lang.LogTips.l00213}},
		{type = 15,id = 0,	count = 800	,logs = {125,Lang.LogTips.l00213}},
		{type = 15,id = 0,	count = 900	,logs = {125,Lang.LogTips.l00213}},
		{type = 15,id = 0,	count = 1000	,logs = {125,Lang.LogTips.l00213}},
		{type = 15,id = 0,	count = 1100	,logs = {125,Lang.LogTips.l00213}},
		{type = 15,id = 0,	count = 1200	,logs = {125,Lang.LogTips.l00213}},
	},
	--{type = 0, id = 100,count = 1	,logs = {{31,Lang.LogTips.l00214}}},
	rate = {500,300,200,100,80,60,50,30,20,10,5,1},  --每一阶的概率
	
	lockMax = 1, --最多上锁多少个属性
	
	maxAttr = 5, --鉴定的属性总数量
	
	--鉴定消耗
	consume = 
	{
		{type = 5,id = 0,	count = 1000,	logs = {125,Lang.LogTips.l00213}},
		{type = 0,id = 100,count = 3,		logs = {{31,Lang.LogTips.l00213}}},
	}
}