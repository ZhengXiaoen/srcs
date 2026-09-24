--天下第一初始化
--lua script
--#include "data\config\godWealth\WealthEventConfig.lua" once

--在跨服记录是否第一次进入擂台
function GodWealthRankInit()
	local RankNameList = Ranking.getRanking(WealthEventConfig.wealthRankName)		--通过排行名称获取排行对象
	if RankNameList == nil then															--没有排行对象则创建并加载数据
		RankNameList = Ranking.add(WealthEventConfig.wealthRankName,1000,0)		--创建排行榜
		if RankNameList ~= nil then
			local isLoad = Ranking.load(RankNameList,WealthEventConfig.wealthRankFile)
			
			if isLoad == false then
				for i=1, 9 do
					Ranking.addColumn(RankNameList,"value")		--添加一个标题列  
				end
			end
		end
	end
end

function GodWealthRankFina()
	local RankNameList = Ranking.getRanking(WealthEventConfig.wealthRankName)		--通过排行名称获取排行对象
	if RankNameList then															--没有排行对象则创建并加载数据
		Ranking.save(RankNameList,WealthEventConfig.wealthRankFile)
	end
end

table.insert(InitFnTable,GodWealthRankInit)
table.insert(FinaFnTable,GodWealthRankFina)
