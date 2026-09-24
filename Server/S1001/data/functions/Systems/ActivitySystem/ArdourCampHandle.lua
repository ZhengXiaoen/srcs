--激情大本营
--#include "data\config\ArdourCamp\ArdourCampCfg.lua" once

-- 屏蔽激情大本营
--[[
--开始激情大本营
function StartArdourCamp()
    -- 2017.6.23 屏蔽资金池
--    local sVar = System.getStaticVar()
--    if sVar.ArdourCampPoint == nil or sVar.ArdourCampPoint < ArdourCampCfg.ardourcamppoint  then
--         return
--    end
	if System.isCrossServer() ==true then
		return 
	end
	
    
    local sysVar = System.getDyanmicVar()
    sysVar.ardourcamping = 1
     --创建排行榜
    local pRank = Ranking.getRanking(ArdourCampCfg.rankname)
    if pRank ~= nil then
        Ranking.clearRanking(pRank)
    else
        pRank = Ranking.add(ArdourCampCfg.rankname,1000)
        Ranking.addColumn(pRank,"actorname")
    end
    --创建行会排行榜
    pRank = Ranking.getRanking(ArdourCampCfg.guildrankname)
    if pRank ~= nil then
        Ranking.clearRanking(pRank)
    else
        pRank = Ranking.add(ArdourCampCfg.guildrankname,1000)
        Ranking.addColumn(pRank,"guildname");
    end
   
    --System.broadcastTipmsg(noticeStr,ttScreenCenter + ttChatWindow)
    --清除在线玩家的第一次进入标记
    local playerList = LuaHelp.getAllActorList()
    for k, plyPtr in ipairs(playerList or {}) do
        local var = Actor.getStaticVar(plyPtr)
        var.ardourlevel = nil
        var.ardourenter = 0
        Actor.setIntProperty(plyPtr,PROP_ACTOR_ARDOUR_ATTACK_RATE,0)
    end
    local str =  "激情大本营活动已开启，看来今晚又会有一次恶战 <我也要参加/@@showWin,7>"
    System.broadcastTipmsg(str,ttChatWindow)
end

--激情大本营预告
function ArdourCampBeforeStart()

	if System.isCrossServer() ==true then
		return 
	end
	
    -- 2017.6.23 屏蔽资金池
--    local sVar = System.getStaticVar()
--    if sVar.ArdourCampPoint == nil or sVar.ArdourCampPoint < ArdourCampCfg.ardourcamppoint  then
--         return
--    end
--    local str = "本服行会资金奖池已到达开启激情大本营活动的要求，活动将在5分钟后开启 ";
--    System.broadcastTipmsg(str,ttChatWindow)

    local str = "激情大本营活动将在5分钟后开启 ";
    System.broadcastTipmsg(str,ttChatWindow)
end
--结束激情大本营
function EndArdourCamp()

	if System.isCrossServer() ==true then
		return 
	end
	
    local sVar = System.getStaticVar()
    if sVar.ArdourCampPoint == nil then sVar.ArdourCampPoint = 0 end
--    if sVar.ArdourCampPoint == nil or sVar.ArdourCampPoint < ArdourCampCfg.ardourcamppoint  then
--         return
--    end
    
    local sysVar = System.getDyanmicVar()
    sysVar.ardourcamping = nil
    print("激情大本营活动结束")
    --把所有角色传出去
    --发送行会奖励
    local pRank = Ranking.getRanking(ArdourCampCfg.guildrankname)
    if pRank ~= nil then
        local pRankItem = Ranking.getItemFromIndex(pRank,0)
       
        if pRankItem ~= nil then
             print("获胜行会:"..Ranking.getSub(pRankItem,0))
           local nRankGuildId = Ranking.getId(pRankItem)
           local pGuild = Guild.getGuild(nRankGuildId)
           if pGuild ~= nil then
                local nAllNum = sVar.ArdourCampPoint + ArdourCampCfg.guildmoney
                Guild.changeGuildCoin(nRankGuildId,nAllNum)
                local nMasterId = Guild.getGuildLeaderId(nRankGuildId)
                --邮件通知会长
                local str = "尊敬的玩家您好，贵会在本次激情大本营荣获第一名，本服行会资金奖池%d点，还可额外获得%d点行会资金，共%d点，奖励已发放，请前往行会面板查收！"
                System.AddMail(nMasterId,0,0,"激情大本营奖励",string.format(str,sVar.ArdourCampPoint ,ArdourCampCfg.guildmoney,nAllNum))
                str = "%s行会  在 激情大本营 中荣获第一名，获得行会资金%d点"
                System.broadcastTipmsg(string.format(str,Guild.getGuildName(nRankGuildId),nAllNum),ttChatWindow)
           end
        end
    end
    sVar.ArdourCampPoint = 0 --资金清零

    local playerList = LuaHelp.getSceneActorListById(ArdourCampCfg.mapid)
	if playerList ~= nil then
		for i = 1, #playerList do
			local player = playerList[i]
			if player ~= nil then
                Actor.enterScene(player,ArdourCampCfg.returncity.mapid,ArdourCampCfg.returncity.x,ArdourCampCfg.returncity.y) 
                Actor.addTimer(player,40,1500) 
                --Actor.npcTalkByNameEx(player,"激情大本营","main")
				--Actor.returnCity(player)	
			end
		end
	end	
end

--]]