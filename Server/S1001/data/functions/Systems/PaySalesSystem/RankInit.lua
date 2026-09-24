--[[RankInit.lua]]
--活动 排行榜名单初始化

--#include "RankPointer.lua" once

--#include "data\functions\Activity\Common\Rank.lua" once --活动通用 排行榜


function SRetRanking_Init(npcobj)
	local config = SurpriseRetRankPt
	Rank.Init(config.RankName, config.RankFile, config.RankColumn, config.ClinetShowCount, config.ClientShow)
end

function SRetRanking_Fina(npcobj)
	local config = SurpriseRetRankPt
	--Ranking.removeRanking(config.RankName)
	Rank.Fina(config.RankName, config.RankFile)
end

table.insert(InitFnTable,SRetRanking_Init)
table.insert(FinaFnTable,SRetRanking_Fina)