--自动创建怪物表	
--注意：组只能向后添加，就算以后没用到的组都要保留不能删除，防止index错乱
CreateMonster =
{
	--[[
	[1] =
	{		--每一项代表一次刷怪
		{nSceneID = 0, nMonsterID = 233, posX1 = 101, posX2 = 103, posY = 26, nCount = 1, nLiveTime = 100, path = {100,26, 94,29, 90,31} },	--如果存在path项则为寻经怪
		{nSceneID = 0, nMonsterID = 233, posX1 = 105, posX2 = 109, posY = 26, nCount = 2, nLiveTime = 100,},
	},
	
	[2] =
	{	--随机刷怪配法 每次刷怪都随机一组进行刷怪(随机不能保证没错都不一样)
		{
			{nSceneID = 50, nMonsterID = 233, posX1 = 31, posX2 = 31, posY = 26, nCount = 10, nLiveTime = 1800,},
		},
		{
			{nSceneID = 50, nMonsterID = 233, posX1 = 23, posX2 = 23, posY = 40, nCount = 10, nLiveTime = 1800,},
		},
		{
			{nSceneID = 50, nMonsterID = 233, posX1 = 87, posX2 = 87, posY = 40, nCount = 10, nLiveTime = 1800,},
		},
	},
	--]]

	[1] =
	{	--非随机刷怪配法
		{nSceneID = 50, nMonsterID = 444, posX1 = 23, posX2 = 35, posY = 26, nCount = 20, nLiveTime = 1800,},	--肠粉
		{nSceneID = 50, nMonsterID = 444, posX1 = 13, posX2 = 24, posY = 40, nCount = 20, nLiveTime = 1800,},
		{nSceneID = 50, nMonsterID = 444, posX1 = 82, posX2 = 90, posY = 40, nCount = 20, nLiveTime = 1800,},
		{nSceneID = 50, nMonsterID = 444, posX1 = 135, posX2 = 147, posY = 21, nCount = 20, nLiveTime = 1800,},
		{nSceneID = 50, nMonsterID = 444, posX1 = 130, posX2 = 144, posY = 40, nCount = 20, nLiveTime = 1800,},
	},
	[2] =
	{
		--非随机刷怪配法
		{nSceneID = 183, nMonsterID = 269, posX1 = 29, posX2 = 30, posY = 18, nCount = 1, nLiveTime = 1800 },
	},
	

}




