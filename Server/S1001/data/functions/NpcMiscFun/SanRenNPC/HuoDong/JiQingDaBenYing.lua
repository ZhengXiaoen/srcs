--#include "data\config\ArdourCamp\ArdourCampCfg.lua" once
--#include "data\functions\Systems\ActivitySystem\ArdourCampHandle.lua" once
local t = {}--
t.main = function(sysarg)
	--//主显示内容
        local sVar = System.getStaticVar()
    if sVar.ArdourCampPoint == nil then
        sVar.ArdourCampPoint = 0
    end
    local strRewardicon = string.format("<(%s)> <(%s)>","iaward#24#1","iaward#6#1")
    -- <(c0xFFb6946c)2.当天><(c0xFF00FF00)19:00前><(c0xFFb6946c),行会资金奖池><(c0xFF00FF00)达到100点><(c0xFFb6946c),><(c0xFF00FF00)19:00><(c0xFFb6946c)开启活动>
	local echo = [[

 <(c0xFF00c0ff)激情大本营简单描述:><(idecoLine#350)>
    <(c0xFFb6946c)1.向行会仓库中><(c0xFF00FF00)捐献1件装备><(c0xFFb6946c),行会资金奖池><(c0xFF00FF00)加1点><(c0xFFb6946c),每人每天最多><(c0xFF00FF00)加2点.>
    <(c0xFFb6946c)2.进入活动,无视装备,平衡属性,><(c0xFF00FF00)击杀><(c0xFFb6946c)其他行会成员,个人及行会积分><(c0xFF00FF00)加10><(c0xFFb6946c)；><(c0xFF00FF00)被击杀><(c0xFFb6946c)个人积分><(c0xFF00FF00)扣10分><(c0xFFb6946c),0分则不再扣.>
    <(c0xFFb6946c)3.每个人初始积分为><(c0xFF00FF00)50分><(c0xFFb6946c),按个人积分换算><(c0xFF00FF00)角色属性><(c0xFFb6946c),个人积分><(c0xFF00FF00)越高属性越好><(c0xFFb6946c)(复活10秒无敌,杀人不计积分)>
    <(c0xFFb6946c)4.参与活动><(c0xFF00FF00)满10分钟><(c0xFFb6946c)即可获得><(c0xFF00FF00)参与奖><(c0xFFb6946c),个人排行><(c0xFF00FF00)前五><(c0xFFb6946c)需来><(c0xFF00FF00)此处领奖><(c0xFFb6946c),行会奖励直接发放.奖励必须><(c0xFF00FF00)当天领取>
 <(c0xFF00c0ff)激情大本营参与条件:><(idecoLine#350)>
 
      <(ifragments#16#18)><(c0xFFb6946c)参与条件: ><(c0xFFeabc78)达到80级且加入任意行会>
      <(ifragments#16#18)><(c0xFFb6946c)活动时间: ><(c0xFFeabc78)19:00 - 19:20> 
      <(ifragments#16#18)><(c0xFFb6946c)当前资金池: ><(c0xFFff9000)]]..sVar.ArdourCampPoint..[[点>    <领取个人排名奖励/@civeRankAward> 


      <#BN参加活动/@JoinActivity>  


]]
	return echo;
end

--       <更改资金池为100/@changeGuildMoney>
-- <清空资金池/@clearGuildMoney>

--领取行会排名奖励
--t.cguildRankAward = function(sysarg)
--    local nGuildId = Actor.getGuildId(sysarg)
--    if nGuildId <= 0 then
--        Actor.sendTipmsg(sysarg,"您当前没有行会，无法领取奖励!",ttFlyTip) 
--        return
--    end 
--    local nRankGuildId = 0
--    local pRank = Ranking.getRanking(ArdourCampCfg.guildrankname)
--    if pRank ~= nil then
--        local pRankItem = Ranking.getItemFromIndex(0)
--        if pRankItem == nil then
--            Actor.sendTipmsg(sysarg,"当前没有行会排名,无法领取奖励!",ttFlyTip) 
--            return
--        end
--        nRankGuildId = Ranking.getId(pRankItem)
--    end
--    if nRankGuildId ~= nGuildId then
--        Actor.sendTipmsg(sysarg,"您所在的行会不是获胜行会,无法领取奖励!",ttFlyTip) 
--        return
--    end
--    if Guild.getGuildLeaderId(nGuildId) ~= Actor.getIntProperty(sysarg,PROP_ENTITY_ID)  then
--        Actor.sendTipmsg(sysarg,"您不是行会会长,无法领取奖励!",ttFlyTip) 
--        return

--    end
--    local pGuild = Guild.getGuild(nRankGuildId)
--    if pGuild == nil then
--         Actor.sendTipmsg(sysarg,"当前没有行会,无法领取奖励!",ttFlyTip) 
--         return
--    end
--    local sVar = System.getStaticVar()
--    local ArdourCampPoint = sVar.ArdourCampPoint
--    if ArdourCampPoint == nil then ArdourCampPoint = 0 end
--    ArdourCampPoint = ArdourCampPoint + ArdourCampCfg.guildmoney

--    sVar.ArdourCampPoint = 0
--end

--领取个人奖励
t.civeRankAward = function(sysarg)
    local sysVar = System.getDyanmicVar()
    if sysVar.ardourcamping ~= nil then
        Actor.sendTipmsg(sysarg,"活动结束后才可领取奖励!",ttFlyTip) 
        return t.main(sysarg)
    end
    local var = Actor.getStaticVar(sysarg)
    if var.ardourentertag == nil then
        Actor.sendTipmsg(sysarg,"在活动地图时间不足"..(ArdourCampCfg.givetime / 60).."分钟，无法领取奖励!",ttFlyTip) 
        return t.main(sysarg)
    end
    --领取标记
    if var.ardourgivetag ~= nil then
         Actor.sendTipmsg(sysarg,"您已经领取过奖励了，无法再次领取奖励!",ttFlyTip) 
        return t.main(sysarg)
    end

    var.ardourgivetag = 1
    local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    local pRank = Ranking.getRanking(ArdourCampCfg.rankname)
    if pRank ~= nil then
        local cfg = ArdourCampCfg.award.endof
       local nRank =  Ranking.getItemIndexFromId(pRank,actor_id)
      
       --前五名
       if nRank >= 0 and nRank <= 4 then
           cfg = ArdourCampCfg.award.rank[nRank + 1]
       end 
      
       for i =1,table.getn(cfg) do
       
        if cfg[i].type == 3 then
            local nPorpValue = Actor.getIntProperty(sysarg,cfg[i].ptr)
            nPorpValue = nPorpValue + cfg[i].value
            Actor.setIntProperty(sysarg,cfg[i].ptr,nPorpValue)
            Actor.sendTipmsg(sysarg,"领取奖励成功,获得"..cfg[i].name..cfg[i].value,ttFlyTip)
        end

       end

    end
    return t.main(sysarg)
end
t.clearGuildMoney =function(sysarg)
        local sSVar = System.getStaticVar()
        sSVar.ArdourCampPoint = 0 --测试
        Actor.sendTipmsg(sysarg,"更改成功!",ttFlyTip) 
end
t.changeGuildMoney = function(sysarg)
        local sSVar = System.getStaticVar()
        sSVar.ArdourCampPoint = 100 --测试
        Actor.sendTipmsg(sysarg,"更改成功!",ttFlyTip) 
end
t.JoinActivity = function(sysarg)
 
      -----以下测试用-------------------
--     local sVar = System.getDyanmicVar()
--     if sVar.ardourcamping == nil then
--        local sSVar = System.getStaticVar()
--        sSVar.ArdourCampPoint = 100 --测试
--        StartArdourCamp()
--     end
--     -----以上测试用-------------------
     local sysVar = System.getDyanmicVar()
     if sysVar.ardourcamping == nil then
        Actor.sendTipmsg(sysarg,"活动还未开启!",ttFlyTip)
        return
     end
     --有行会才可以加入
     if Actor.getGuildId(sysarg) <= 0 then
        Actor.sendTipmsg(sysarg,"请先加入一个行会!",ttFlyTip)
        return
     end

        local plv = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
    if plv < 80 then
        Actor.sendTipmsg(sysarg, "等级不足80级，无法参加", ttFlyTip)
        return;
    end
 
     if Actor.enterScene(sysarg,ArdourCampCfg.mapid,-1,-1) == false then
        Actor.sendTipmsg(sysarg,"进入活动地图失败!",ttFlyTip)
        return
     end
     Actor.addBuffById(sysarg,ArdourCampCfg.wudibuffid)
     --是否是第一次进入激情大本营，清空原先的激情等级
     local var = Actor.getStaticVar(sysarg)
--     -----以下测试用-------------------
     --var.ardourenter = nil
--     -----以上测试用-------------------

     if var.ardourenter == nil or var.ardourenter == 0 then
        var.ardourenter = 1 
        var.ardourlevel = nil
        var.ardourgivetag = nil
        var.ardourentertag = nil
        Actor.setIntProperty(sysarg,PROP_ACTOR_ARDOUR_ATTACK_RATE,0)
        
     end
     --加入到排行榜
        local pRank = Ranking.getRanking(ArdourCampCfg.rankname)
        if pRank ~= nil then
            local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
            local pRankItem = Ranking.getItemPtrFromId(pRank,actor_id)
            if pRankItem == nil then
                pRankItem = Ranking.addItem(pRank,actor_id,ArdourCampCfg.initpoint) --初始化积分
                if pRankItem ~= nil then
                    Ranking.setSub(pRankItem,0,Actor.getName(sysarg))
                end
            end 
            
        end
     --添加行会排行榜
     local nGuildId = Actor.getGuildId(sysarg)
     if nGuildId > 0 then
        local pRank = Ranking.getRanking(ArdourCampCfg.guildrankname)
        if pRank ~= nil then
            local pRankItem = Ranking.getItemPtrFromId(pRank,nGuildId)
            if pRankItem == nil then
                pRankItem = Ranking.addItem(pRank,nGuildId,0)
                Ranking.setSub(pRankItem,0,Actor.getGuildName(sysarg))
            end
        end
     end 
      --记录一下最大血量- 用于活动结束或者传送出来后恢复满血
    -- var.ardourhp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP)
     --var.ardourmp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)

     Actor.setIntProperty(sysarg,PROP_ACTOR_ARDOUR_ATTACK_RATE,ArdourCampCfg.initpoint  / ArdourCampCfg.point )
     Actor.collectOperateForNow(sysarg,0)

     local nMaxHp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP)
     Actor.setIntProperty(sysarg,PROP_CREATURE_HP,nMaxHp)
     local nMaxMp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP)
     Actor.setIntProperty(sysarg,PROP_CREATURE_MP,nMaxMp)
     --添加增加经验定时器
     Actor.addTimer(sysarg,35,1000)
     --进入时间
     var.ardourentertick = nil
     if var.ardourentertag == nil  then
        var.ardourentertick = System.getCurrMiniTime()
     end

     --发送排行榜信息
     --行会排行榜
     local pRank = Ranking.getRanking(ArdourCampCfg.guildrankname)
     local nItemCount =  Ranking.getRankItemCount(pRank)
     local netPack = DataPack.allocPacket(sysarg,139,226)
     DataPack.writeByte(netPack,nItemCount)
     for i =1,nItemCount do
        local pRankItem = Ranking.getItemFromIndex(pRank,i-1)
         local szGuildName = ""
         local nPoint = 0
        if pRankItem ~= nil then
            szGuildName = Ranking.getSub(pRankItem,0)
            nPoint = Ranking.getPoint(pRankItem)
        end
         DataPack.writeString(netPack,szGuildName)
        DataPack.writeInt(netPack,nPoint)
       
     end
     --个人排名信息
     pRank = Ranking.getRanking(ArdourCampCfg.rankname)
     nItemCount =  Ranking.getRankItemCount(pRank)
     DataPack.writeByte(netPack,nItemCount)
     for i =1,nItemCount do
        local pRankItem = Ranking.getItemFromIndex(pRank,i-1)
        local szActorName = ""
        local nPoint = 0
        if pRankItem ~= nil then
            szActorName = Ranking.getSub(pRankItem,0)
            nPoint = Ranking.getPoint(pRankItem)
        end
         DataPack.writeString(netPack,szActorName)
        DataPack.writeInt(netPack,nPoint)
       
     end
     DataPack.flush(netPack)
    
    local str = string.format("<(n%s)>玩家 参加了激情大本营活动。我也要参加 <(x威龙城:135:164:[传])>",Actor.getName(sysarg) )
     Actor.sendTipmsg(sysarg,str,ttChatWindow)
	 
	 --OnFinish_Liveness(sysarg,9)
end

function GetNpcJiQingDaBenYing() return t end