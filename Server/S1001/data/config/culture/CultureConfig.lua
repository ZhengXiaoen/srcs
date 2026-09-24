--世界文明度的配置

WordCultureConfig = 
{
	addCultureByDay = 1,		--每开一天服，文明度增加T
	addCultureByFullLevel = 5,	--满级一个，增加文明度L
	
	nKillMonsterRate = 2,		--怒气调整系数
	fAddAngerByMonsterType = 0.5,	--根据怪物类型不同递增的系数
	nMinLevel = 43,			--杀怪获得怒气值的最低等级
	minStartLevel = 50,		--50级开始计算世界文明
	--等级修正
    killMonsterRate = 
	{
		{
			levleDis = 3,	--等级差小于等于3时
			nRate = 1.0,	--等级修正
		},

		{
			levleDis = 9,	
			nRate = 0.5,	
		},

		{
			levleDis = 100,	
			nRate = 0,	
		},
	},

	CultureCfg = 
	{
		{
			minLevel = 1,
			maxLevel = 5,
			buffId = 48,
			expRate = 10,
		},
		{
			minLevel = 6,
			maxLevel = 10,
			buffId = 49,
			expRate = 50,
		},
		{
			minLevel = 11,
			maxLevel = 15,
			buffId = 50,
			expRate = 200,
		},
		{
			minLevel = 16,
			maxLevel = 20,
			buffId = 51,
			expRate = 250,
		},
		{
			minLevel = 21,
			maxLevel = 25,
			buffId = 52,
			expRate = 300,
		},
		{
			minLevel = 26,
			maxLevel = 30,
			buffId = 53,
			expRate = 350,
		},
		{
			minLevel = 31,
			maxLevel = 35,
			buffId = 54,
			expRate = 400,
		},
		{
			minLevel = 36,
			maxLevel = 40,
			buffId = 55,
			expRate = 450,
		},
		{
			minLevel = 41,
			maxLevel = 45,
			buffId = 56,
			expRate = 500,
		},
		{
			minLevel = 46,
			maxLevel = 50,
			buffId = 57,
			expRate = 550,
		},
		{
			minLevel = 51,
			maxLevel = 55,
			buffId = 58,
			expRate = 600,
		},
		{
			minLevel = 56,
			maxLevel = 60,
			buffId = 59,
			expRate = 650,
		},
		{
			minLevel = 61,
			maxLevel = 65,
			buffId = 60,
			expRate = 700,
		},
		{
			minLevel = 66,
			maxLevel = 70,
			buffId = 61,
			expRate = 750,
		}
	},

	--经验加成的转生修正
	CultureModulus = 
	{
		{
			differNum = 0,		--转生次数差
			cModulus = 0,		--转生修正系数  0%
		},

		{
			differNum = 1,		--转生次数差
			cModulus = 25,		--转生修正系数  0%
		},
		
		{
			differNum = 2,		--转生次数差
			cModulus = 50,		--转生修正系数  0%
		},

		{
			differNum = 3,		--转生次数差
			cModulus = 75,		--转生修正系数  0%
		},
	},

	--[[
		mtMainLine=1,				//主线经验百分比数值A
		mtDaily =2,				//日常经验百分比数值
		mtRepairEquip=3,			//装备普通维修消耗
		mtRepairSpecial=4,			//装备特殊维修消耗
		mtSellProps=5,				//ＮＰＣ出售道具
		mtAddDuty = 6,				//屠龙城城主税收上限

		--对应一下type
	]]
	--文明度的等级区间

CultureTimesInterval = {
{
	-- = 文明度级别1,
	CultureNum = 0,
	cultureLevel = 1,
	CultureTimes = 1,
	AddCultureRate = { 
		{ type = 1, nRate = 0, },
		{ type = 2, nRate = 0, },
		{ type = 3, nRate = 0, },
		{ type = 4, nRate = 0, },
		{ type = 5, nRate = 0, },
		{ type = 6, nRate = 0, }, 
	},
},
{
	-- = 文明度级别2,
	CultureNum = 10,
	cultureLevel = 2,
	CultureTimes = 1,
	AddCultureRate = { 
		{ type = 1, nRate = 0, },
		{ type = 2, nRate = 0, },
		{ type = 3, nRate = 0, },
		{ type = 4, nRate = 0, },
		{ type = 5, nRate = 0, },
		{ type = 6, nRate = 0, }, 
	},
},
{
	-- = 文明度级别3,
	CultureNum = 20,
	cultureLevel = 3,
	CultureTimes = 2,
	AddCultureRate = { 
		{ type = 1, nRate = 20, },
		{ type = 2, nRate = 0, },
		{ type = 3, nRate = 0, },
		{ type = 4, nRate = 0, },
		{ type = 5, nRate = 0, },
		{ type = 6, nRate = 100, }, 
	},
},
{
	-- = 文明度级别4,
	CultureNum = 35,
	cultureLevel = 4,
	CultureTimes = 2,
	AddCultureRate = { 
		{ type = 1, nRate = 40, },
		{ type = 2, nRate = 0, },
		{ type = 3, nRate = 5, },
		{ type = 4, nRate = 2, },
		{ type = 5, nRate = 0, },
		{ type = 6, nRate = 200, }, 
	},
},
{
	-- = 文明度级别5,
	CultureNum = 55,
	cultureLevel = 5,
	CultureTimes = 3,
	AddCultureRate = { 
		{ type = 1, nRate = 60, },
		{ type = 2, nRate = 5, },
		{ type = 3, nRate = 10, },
		{ type = 4, nRate = 4, },
		{ type = 5, nRate = 5, },
		{ type = 6, nRate = 300, }, 
	},
},
{
	-- = 文明度级别6,
	CultureNum = 80,
	cultureLevel = 6,
	CultureTimes = 4,
	AddCultureRate = { 
		{ type = 1, nRate = 80, },
		{ type = 2, nRate = 5, },
		{ type = 3, nRate = 15, },
		{ type = 4, nRate = 6, },
		{ type = 5, nRate = 5, },
		{ type = 6, nRate = 400, }, 
	},
},
{
	-- = 文明度级别7,
	CultureNum = 110,
	cultureLevel = 7,
	CultureTimes = 5,
	AddCultureRate = { 
		{ type = 1, nRate = 100, },
		{ type = 2, nRate = 10, },
		{ type = 3, nRate = 20, },
		{ type = 4, nRate = 8, },
		{ type = 5, nRate = 10, },
		{ type = 6, nRate = 500, }, 
	},
},
{
	-- = 文明度级别8,
	CultureNum = 145,
	cultureLevel = 8,
	CultureTimes = 6,
	AddCultureRate = { 
		{ type = 1, nRate = 120, },
		{ type = 2, nRate = 10, },
		{ type = 3, nRate = 25, },
		{ type = 4, nRate = 10, },
		{ type = 5, nRate = 10, },
		{ type = 6, nRate = 600, }, 
	},
},
{
	-- = 文明度级别9,
	CultureNum = 185,
	cultureLevel = 9,
	CultureTimes = 7,
	AddCultureRate = { 
		{ type = 1, nRate = 140, },
		{ type = 2, nRate = 15, },
		{ type = 3, nRate = 30, },
		{ type = 4, nRate = 12, },
		{ type = 5, nRate = 15, },
		{ type = 6, nRate = 700, }, 
	},
},
{
	-- = 文明度级别10,
	CultureNum = 230,
	cultureLevel = 10,
	CultureTimes = 8,
	AddCultureRate = { 
		{ type = 1, nRate = 160, },
		{ type = 2, nRate = 15, },
		{ type = 3, nRate = 35, },
		{ type = 4, nRate = 14, },
		{ type = 5, nRate = 15, },
		{ type = 6, nRate = 800, }, 
	},
},
{
	-- = 文明度级别11,
	CultureNum = 280,
	cultureLevel = 11,
	CultureTimes = 9,
	AddCultureRate = { 
		{ type = 1, nRate = 180, },
		{ type = 2, nRate = 20, },
		{ type = 3, nRate = 40, },
		{ type = 4, nRate = 16, },
		{ type = 5, nRate = 20, },
		{ type = 6, nRate = 900, }, 
	},
},
{
	-- = 文明度级别12,
	CultureNum = 335,
	cultureLevel = 12,
	CultureTimes = 10,
	AddCultureRate = { 
		{ type = 1, nRate = 200, },
		{ type = 2, nRate = 20, },
		{ type = 3, nRate = 45, },
		{ type = 4, nRate = 18, },
		{ type = 5, nRate = 20, },
		{ type = 6, nRate = 1000, }, 
	},
},
{
	-- = 文明度级别13,
	CultureNum = 395,
	cultureLevel = 13,
	CultureTimes = 11,
	AddCultureRate = { 
		{ type = 1, nRate = 220, },
		{ type = 2, nRate = 25, },
		{ type = 3, nRate = 50, },
		{ type = 4, nRate = 20, },
		{ type = 5, nRate = 25, },
		{ type = 6, nRate = 1100, }, 
	},
},
{
	-- = 文明度级别14,
	CultureNum = 460,
	cultureLevel = 14,
	CultureTimes = 12,
	AddCultureRate = { 
		{ type = 1, nRate = 240, },
		{ type = 2, nRate = 25, },
		{ type = 3, nRate = 55, },
		{ type = 4, nRate = 22, },
		{ type = 5, nRate = 25, },
		{ type = 6, nRate = 1200, }, 
	},
},
{
	-- = 文明度级别15,
	CultureNum = 530,
	cultureLevel = 15,
	CultureTimes = 13,
	AddCultureRate = { 
		{ type = 1, nRate = 260, },
		{ type = 2, nRate = 30, },
		{ type = 3, nRate = 60, },
		{ type = 4, nRate = 24, },
		{ type = 5, nRate = 30, },
		{ type = 6, nRate = 1300, }, 
	},
},
{
	-- = 文明度级别16,
	CultureNum = 605,
	cultureLevel = 16,
	CultureTimes = 14,
	AddCultureRate = { 
		{ type = 1, nRate = 280, },
		{ type = 2, nRate = 30, },
		{ type = 3, nRate = 65, },
		{ type = 4, nRate = 26, },
		{ type = 5, nRate = 30, },
		{ type = 6, nRate = 1400, }, 
	},
},
{
	-- = 文明度级别17,
	CultureNum = 685,
	cultureLevel = 17,
	CultureTimes = 15,
	AddCultureRate = { 
		{ type = 1, nRate = 300, },
		{ type = 2, nRate = 35, },
		{ type = 3, nRate = 70, },
		{ type = 4, nRate = 28, },
		{ type = 5, nRate = 35, },
		{ type = 6, nRate = 1500, }, 
	},
},
{
	-- = 文明度级别18,
	CultureNum = 770,
	cultureLevel = 18,
	CultureTimes = 16,
	AddCultureRate = { 
		{ type = 1, nRate = 320, },
		{ type = 2, nRate = 35, },
		{ type = 3, nRate = 75, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 35, },
		{ type = 6, nRate = 1600, }, 
	},
},
{
	-- = 文明度级别19,
	CultureNum = 860,
	cultureLevel = 19,
	CultureTimes = 17,
	AddCultureRate = { 
		{ type = 1, nRate = 340, },
		{ type = 2, nRate = 40, },
		{ type = 3, nRate = 80, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 40, },
		{ type = 6, nRate = 1700, }, 
	},
},
{
	-- = 文明度级别20,
	CultureNum = 955,
	cultureLevel = 20,
	CultureTimes = 18,
	AddCultureRate = { 
		{ type = 1, nRate = 360, },
		{ type = 2, nRate = 40, },
		{ type = 3, nRate = 85, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 40, },
		{ type = 6, nRate = 1800, }, 
	},
},
{
	-- = 文明度级别21,
	CultureNum = 1055,
	cultureLevel = 21,
	CultureTimes = 19,
	AddCultureRate = { 
		{ type = 1, nRate = 380, },
		{ type = 2, nRate = 45, },
		{ type = 3, nRate = 90, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 45, },
		{ type = 6, nRate = 1900, }, 
	},
},
{
	-- = 文明度级别22,
	CultureNum = 1160,
	cultureLevel = 22,
	CultureTimes = 20,
	AddCultureRate = { 
		{ type = 1, nRate = 400, },
		{ type = 2, nRate = 45, },
		{ type = 3, nRate = 95, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 45, },
		{ type = 6, nRate = 2000, }, 
	},
},
{
	-- = 文明度级别23,
	CultureNum = 1270,
	cultureLevel = 23,
	CultureTimes = 20,
	AddCultureRate = { 
		{ type = 1, nRate = 420, },
		{ type = 2, nRate = 50, },
		{ type = 3, nRate = 100, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 50, },
		{ type = 6, nRate = 2100, }, 
	},
},
{
	-- = 文明度级别24,
	CultureNum = 1385,
	cultureLevel = 24,
	CultureTimes = 20,
	AddCultureRate = { 
		{ type = 1, nRate = 440, },
		{ type = 2, nRate = 50, },
		{ type = 3, nRate = 100, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 50, },
		{ type = 6, nRate = 2200, }, 
	},
},
{
	-- = 文明度级别25,
	CultureNum = 1505,
	cultureLevel = 25,
	CultureTimes = 20,
	AddCultureRate = { 
		{ type = 1, nRate = 460, },
		{ type = 2, nRate = 50, },
		{ type = 3, nRate = 100, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 50, },
		{ type = 6, nRate = 2300, }, 
	},
},
{
	-- = 文明度级别26,
	CultureNum = 1630,
	cultureLevel = 26,
	CultureTimes = 20,
	AddCultureRate = { 
		{ type = 1, nRate = 480, },
		{ type = 2, nRate = 50, },
		{ type = 3, nRate = 100, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 50, },
		{ type = 6, nRate = 2400, }, 
	},
},
{
	-- = 文明度级别27,
	CultureNum = 1760,
	cultureLevel = 27,
	CultureTimes = 20,
	AddCultureRate = { 
		{ type = 1, nRate = 500, },
		{ type = 2, nRate = 50, },
		{ type = 3, nRate = 100, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 50, },
		{ type = 6, nRate = 2500, }, 
	},
},
{
	-- = 文明度级别28,
	CultureNum = 1895,
	cultureLevel = 28,
	CultureTimes = 20,
	AddCultureRate = { 
		{ type = 1, nRate = 500, },
		{ type = 2, nRate = 50, },
		{ type = 3, nRate = 100, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 50, },
		{ type = 6, nRate = 2500, }, 
	},
},
{
	-- = 文明度级别29,
	CultureNum = 2035,
	cultureLevel = 29,
	CultureTimes = 20,
	AddCultureRate = { 
		{ type = 1, nRate = 500, },
		{ type = 2, nRate = 50, },
		{ type = 3, nRate = 100, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 50, },
		{ type = 6, nRate = 2500, }, 
	},
},
{
	-- = 文明度级别30,
	CultureNum = 99999,
	cultureLevel = 30,
	CultureTimes = 20,
	AddCultureRate = { 
		{ type = 1, nRate = 500, },
		{ type = 2, nRate = 50, },
		{ type = 3, nRate = 100, },
		{ type = 4, nRate = 30, },
		{ type = 5, nRate = 50, },
		{ type = 6, nRate = 2500, }, 
	},
},
	},
}

