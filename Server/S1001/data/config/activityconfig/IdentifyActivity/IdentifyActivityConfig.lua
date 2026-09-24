--怪物攻城及鉴定宗师

IdentifyActivityConfig = 
{
	nSceenId = 8,			--刷怪的场景id

	perTime = 1 * 60,		--1分钟刷一次
	TotalTimes = 59,		--总共刷新的次数

	--刷怪
	monsters =
	{
		--每波怪物
		{
			--不同等级的配置
			{nMonsterID = 195, posX1 = 180, posX2 = 200,  posY = 231, nCount = 1, nLiveTime = 120,},	--BOSS

			{nMonsterID = 196, posX1 = 175, posX2 = 208,  posY = 226, nCount = 5, nLiveTime = 120,},	--小怪
			{nMonsterID = 196, posX1 = 175, posX2 = 208,  posY = 228, nCount = 5, nLiveTime = 120,},
			{nMonsterID = 196, posX1 = 175, posX2 = 208,  posY = 230, nCount = 5, nLiveTime = 120,},
			{nMonsterID = 196, posX1 = 175, posX2 = 208,  posY = 232, nCount = 5, nLiveTime = 120,},
			{nMonsterID = 196, posX1 = 175, posX2 = 208,  posY = 234, nCount = 5, nLiveTime = 120,},
			{nMonsterID = 196, posX1 = 175, posX2 = 208,  posY = 236, nCount = 5, nLiveTime = 120,},

		},
	},
}
