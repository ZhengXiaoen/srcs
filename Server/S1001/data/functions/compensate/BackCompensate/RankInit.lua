--lua script
--活动 排行榜名单初始化

--#include "RankPointer.lua" once

--#include "data\functions\Activity\Common\Rank.lua" once --活动通用 排行榜


function MsRanking_Init(npcobj)
	local RankPt = BackCompensateRankPt
	if not RankPt then return end
	Rank.Init(RankPt.RankName, RankPt.RankFile, RankPt.RankColumn, RankPt.ClinetShowCount, RankPt.ClientShow)
end

function MsRanking_Fina(npcobj)
	--Ranking.removeRanking(RankPt.RankName)
	local RankPt = BackCompensateRankPt
	if not RankPt then return end
	Rank.Fina(RankPt.RankName, RankPt.RankFile)
end

table.insert(InitFnTable,MsRanking_Init)
table.insert(FinaFnTable,MsRanking_Fina)