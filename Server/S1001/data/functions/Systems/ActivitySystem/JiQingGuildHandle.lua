--激活行会活动
--#include "data\config\guild\JiQingGuildCfg.lua" once

function StartJiQingGuildSignUp()
    local sysVar = System.getDyanmicVar()
    sysVar.jiqingguildsignup = 1
    System.broadcastTipmsg("激情行会活动现在已经开始接受报名！",ttScreenCenter + ttChatWindow)
        --报名列表清空
    JiQingGuildCfg.SignUp = {}
    --创建排行榜
    local pRank = Ranking.getRanking(JiQingGuildCfg.RankName)
    if pRank ~= nil then
        Ranking.clearRanking(pRank)
    else
        pRank = Ranking.add(JiQingGuildCfg.RankName,1000)
        Ranking.addColumn(pRank,"guildname")
        Ranking.addRef(pRank)
    end

end

function EndJiQingGuildSignUp()
    local sysVar = System.getDyanmicVar()
    sysVar.jiqingguildsignup = nil
    System.broadcastTipmsg("激情行会活动结束报名！",ttScreenCenter + ttChatWindow)
    --报名列表清空
    JiQingGuildCfg.SignUp = {}
end

--激情行会开始
function StartJiQingGuild()
     local sysVar = System.getDyanmicVar()
     sysVar.jiqingguild = System.getCurrMiniTime()
end

--激情行会结束
function EndJiQingGuild()
    local sysVar = System.getDyanmicVar()
    sysVar.jiqingguild = nil
    local playerList = LuaHelp.getSceneActorListById(JiQingGuildCfg.MapID)		--获取某场景玩家对象列表
	if playerList ~= nil then
		for j = 1, #playerList do
			local player = playerList[j]
			if player then
				exitJiQingGuild(player)
			end
		end
	end
end

function exitJiQingGuild(sysarg)
	Actor.enterScene(sysarg,JiQingGuildCfg.ExitScene.mapid,JiQingGuildCfg.ExitScene.x,JiQingGuildCfg.ExitScene.y)
	sendExitActivity(sysarg, 23)
end


function exitJiQingDaBenYing(sysarg)
    Actor.returnCity(sysarg)
    sendExitActivity(sysarg, 10000)
end