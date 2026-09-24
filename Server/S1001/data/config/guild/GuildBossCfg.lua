--lua script
--行会BOSS配置

--#include "..\..\language\LangCode.txt"

GuildBossCfg =
{
	fubenId = 26, -- 行会副本ID
	fubenSceneId = 90, -- 行会副本场景ID
	bossX = 49,	-- BOSS 位置
	bossY = 46,
	enterX = -1, -- 玩家进入位置
	enterY = -1,
	ExpItemId = 861, -- 饲料(加经验)
	ExpItemAddExp = 5, -- 每饲养一次加经验数

	Levels = {
		-- 1 级(免费给)
		{
			bossId = 632, -- BOSS ID
			maxExp = 1000, -- 最大经验
			callTimes = 100, -- 召唤几次可升级
			needGuildCoin = 1000, -- 每次召唤需要消耗行会资金
		},
		-- 2 级
		{
			bossId = 633, -- BOSS ID
			maxExp = 2000, -- 最大经验
			callTimes = 200, -- 召唤几次可升级
			needGuildCoin = 1000, -- 每次召唤需要消耗行会资金
		},
		-- 3 级
		{
			bossId = 634, -- BOSS ID
			maxExp = 3000, -- 最大经验
			callTimes = 300, -- 召唤几次可升级
			needGuildCoin = 1000, -- 每次召唤需要消耗行会资金
		},
		-- 4 级
		{
			bossId = 635, -- BOSS ID
			maxExp = 4000, -- 最大经验
			callTimes = 400, -- 召唤几次可升级
			needGuildCoin = 1000, -- 每次召唤需要消耗行会资金
		},
		-- 5 级
		{
			bossId = 636, -- BOSS ID
			maxExp = 5000, -- 最大经验
			callTimes = 500, -- 召唤几次可升级
			needGuildCoin = 1000, -- 每次召唤需要消耗行会资金
		},
		-- 6 级
		{
			bossId = 637, -- BOSS ID
			maxExp = 6000, -- 最大经验
			callTimes = 600, -- 召唤几次可升级
			needGuildCoin = 1000, -- 每次召唤需要消耗行会资金
		},
	},

}
