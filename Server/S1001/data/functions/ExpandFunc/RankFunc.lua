
--清除离线玩家数据
function ClearOfflineActorsData()
	System.clearOfflineActorsData()
end

--更新擂台数据
function UpdateChallengeDate()
	System.updateChallengeDate()
end

--更新本服雕像
--function UpdateVocNpcStatue(type)
--	System.updateVocNpcStatue(type)
--end

--function SaveCsRank()
--	System.saveCsRank()
--end

--function LoadCsRank()
--	System.loadCsRank()
--end

function CR(sysarg,rankName)
	if not rankName then return end
	local ranking = Ranking.getRanking(rankName)
	if ranking then
		Ranking.clearRanking(ranking)
		Actor.sendTipmsg(sysarg, "clear ranking success!", ttFlyTip)
	end
end