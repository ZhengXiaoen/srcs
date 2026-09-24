--lua script
--活动 排行榜名单初始化

--#include "RankPointer.lua" once

--#include "data\functions\Activity\Common\Rank.lua" once --活动通用 排行榜


function MsRanking_Init(npcobj)
	local v = MsRankPt;
	Rank.Init(v.RankName, v.RankFile, v.RankColumn, v.ClinetShowCount, v.ClientShow);
	v = MsFinalAwardRankPt;
	Rank.Init(v.RankName, v.RankFile, v.RankColumn, v.ClinetShowCount, v.ClientShow);
end

function MsRanking_Fina(npcobj)
	--Ranking.removeRanking(MsRankPt.RankName)
	local v = MsRankPt;
	Rank.Fina(v.RankName, v.RankFile);
	v = MsFinalAwardRankPt;
	Rank.Fina(v.RankName, v.RankFile);
end
--[[
table.insert(InitFnTable,MsRanking_Init)
table.insert(FinaFnTable,MsRanking_Fina)
--]]