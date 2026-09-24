--[[
ExpPigConfig = {
	nSceneId = 5,
	nInterval = 18000,
	nId = 238,
	nPos = {
		{178,198},
		{202,198},
		{180,218},
		{200,218},
		{180,178},
		{200,178},
	},
}
--]]

--富贵兽
FuGuiShouConfig = {
	nSceneId = 3,
	nInterval = 1200,
	nId = 334,
	nPos = {{173,129},{188,117}},
}

--富贵兽副本
FuGuiShouFubenCfg = 
{
	fubenId = 107,
	-- 开区几天后才开启
	openDay = 1,
	-- 进入副本的等级
	needLevel = 74,
	-- 每天最大进入次数
	maxEnterTimes = 1,	
	-- 富贵兽ID
	monsterId = 334,
	-- 富贵兽位置
	monsterPos = {45, 40},
	-- 富贵兽存活的时间（秒）
	monsterLiveTime = 1200,
	-- 双倍经验消耗
	doubleConsume = {type = 15, id = 0, count = 888},
	buffId = 104,
	buffType = 64, -- 与buffId的配置一致
	buffGroup = 126, -- 与buffId的配置一致
}