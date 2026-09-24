--lua script
--活动 排行榜名单初始化

--#include "RankPointer.lua" once

--#include "data\functions\Activity\Common\Rank.lua" once --活动通用 排行榜


function HRRanking_Init(npcobj)
	local config = HorseRaceRankPt
	Rank.Init(config.RankName, config.RankFile, config.RankColumn, config.ClinetShowCount, config.ClientShow)
end

function HRRanking_Fina(npcobj)
	local config = HorseRaceRankPt
	--Ranking.removeRanking(config.RankName)
	Rank.Fina(config.RankName, config.RankFile)
end

table.insert(InitFnTable,HRRanking_Init)
table.insert(FinaFnTable,HRRanking_Fina)