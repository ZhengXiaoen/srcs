--#include "data\config\guild\JiQingGuildCfg.lua" once
local t = {}--
t.main = function(sysarg)
	--//主显示内容
     local strRewardicon = string.format("<(%s)> ","iaward#4#1")
	local echo = [[
     <(c0xFF00c0ff)行会乐园简单描述:><(idecoLine#350)>
      <(c0xFFb6946c)1.行会首领在NPC处报名>
      <(c0xFFb6946c)2.行会在线人数需大于等于25人，才可进行报名>
      <(c0xFFb6946c)3.行会首领可在NPC处查看已确认参与的人数>
      <(c0xFFb6946c)4.角色将被传到活动地图时有10秒钟无敌时间，此时间内杀人和被杀不会增加或掉积分>
      <(c0xFFb6946c)5.击杀1人获得1行会积分，PK不红名,不增加PK值>
      <(c0xFFb6946c)6.奖励需在><当天23：59点><(c0xFFb6946c)前在NPC处进行领取>
      <(c0xFFb6946c)7.行会积分越高奖励越好,参与者都可获得对应奖励>

    <(c0xFF00c0ff)激情大本营参与条件:><(idecoLine#350)>
      <(ifragments#16#18)><(c0xFFb6946c)等级限制: ><(c0xFFeabc78)加入一个行会等级达到80以上> 
      <(ifragments#16#18)><(c0xFFb6946c)活动时间: ><(c0xFFeabc78)周日晚20:00-21:00(入口关闭时间20:11)> 
      <(ifragments#16#18)><(c0xFFb6946c)报名时间: ><(c0xFFeabc78)19:50-20:10> 
      <(ifragments#16#18)><(c0xFFb6946c)活动奖励: ><(c0xFFeabc78)第一名：3000绑定元宝>
         <(c0xFFeabc78)第二名：2000绑定元宝>     <(c0xFFeabc78)第三名：1200绑定元宝>
         <(c0xFFeabc78)参与者：1000绑定元宝><(idecoLine#350)>
        <开始报名/@StartSignUp>      <查看已报名成员/@LookSignUp>
        <参加活动/@JoinActivity>      <领取奖励/@GiveAward>



]]
	return echo;
end

--领取奖励
t.GiveAward = function(sysarg)
    local sysVar = System.getDyanmicVar()
    if sysVar.jiqingguild ~= nil then
        Actor.sendTipmsg(sysarg,"活动时间还没到，无法领取！",ttFlyTip)
        return
    end

    local nGuildID = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
    local pRank = Ranking.getRanking(JiQingGuildCfg.RankName)
    if pRank == nil then
        Actor.sendTipmsg(sysarg,"未知错误，无法领取！",ttFlyTip)
        return
    end
    local nPos = Ranking.getItemIndexFromId(pRank,nGuildID)
    if nPos == -1 then
        Actor.sendTipmsg(sysarg,"尚未参加，无法领取！",ttFlyTip)
        return
    end
     local var = Actor.getStaticVar(sysarg)
     if var.JiQingGive ~= nil then
        Actor.sendTipmsg(sysarg,"不允许重复领取奖励！",ttFlyTip)
        return
     end
    local nBindYuanBao= 1000
    if nPos == 0 then --第一名
        nBindYuanBao = 3000
    elseif nPos == 1 then --第二名
        nBindYuanBao = 2000
    elseif nPos == 2 then --第三名
        nBindYuanBao = 1200
    end

   Actor.changeMoney(sysarg,2,nBindYuanBao,LogIds.jiqingguild,"jiqingguild")
   var.JiQingGive = 1
   Actor.sendTipmsg(sysarg,"恭喜，获得"..nBindYuanBao.."绑定元宝!",ttFlyTip)
    

  

end
t.JoinActivity = function(sysarg)
     local nGuildID = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
      local nActorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
     if JiQingGuildCfg.SignUp[nGuildID] == nil then
        Actor.sendTipmsg(sysarg,"您还没有报名，无法参加活动!",ttFlyTip)
        return
     end
      if Guild.getGuildLeaderId(nGuildID) ~= nActorID then
        Actor.sendTipmsg(sysarg,"您不是行会会长，无法参加活动!",ttFlyTip)
        return
    end
     if JiQingGuildCfg.SignUp[nGuildID].signupcount < JiQingGuildCfg.LowPlayerCount then
        Actor.sendTipmsg(sysarg,"报名人数不足"..JiQingGuildCfg.LowPlayerCount..",无法参加活动！",ttFlyTip)
        return
     end
     local sysVar = System.getDyanmicVar()
     if sysVar.jiqingguild == nil then
        Actor.sendTipmsg(sysarg,"活动还未开启，请等待！",ttFlyTip)
        return
     end
	
     if JiQingGuildCfg.SignUp[nGuildID].enterActivity ~= nil then
        return
     end
     --玩家进入该场景
     for i = 1,table.getn(JiQingGuildCfg.SignUp[nGuildID].play) do
        local nActorId = JiQingGuildCfg.SignUp[nGuildID].play[i]
        local playPtr = System.getEntityPtrByActorID(nActorId)
        if playPtr ~= nil then
            Actor.addTimer(playPtr,29,JiQingGuildCfg.EnterTime*1000) --十秒后进入
            --"/richangchumo_cancelBtn"
            	Actor.messageBox(sysarg, 0, 0, "激情行会", nil, nil, nil,JiQingGuildCfg.EnterTime*1000,0,NULL,0,1)
        end
     end
     Actor.sendTipmsg(sysarg,JiQingGuildCfg.EnterTime.."秒后进入行会乐园！",ttFlyTip)

     --加入到排行榜
     local pRank = Ranking.getRanking(JiQingGuildCfg.RankName)
     if pRank ~= nil then
        local pRankItem = Ranking.getItemPtrFromId(pRank,nGuildID)
        if pRankItem == nil then
            pRankItem = Ranking.addItem(pRank,nGuildID,1)
            Ranking.setSub(pRankItem,0,Actor.getGuildName(sysarg))
        end
     end
     JiQingGuildCfg.SignUp[nGuildID].enterActivity = 1
end
t.LookSignUp = function(sysarg)
    local nGuildID = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
    if JiQingGuildCfg.SignUp[nGuildID] == nil then 
        Actor.sendTipmsg(sysarg,"您还没有报名，无法查看人数!",ttFlyTip)
        return
    end
    --print("报名人数:"..JiQingGuildCfg.SignUp[nGuildID].signupcount)
     return JiQingGuildCfg.SignUp[nGuildID].signupcount
end
--开始报名
t.StartSignUp =  function(sysarg)
    local nActorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    local nGuildID = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
    if nGuildID == 0 then 
        Actor.sendTipmsg(sysarg,"您还没有行会，无法报名!",ttFlyTip)
        return
    end
    if Guild.getGuildLeaderId(nGuildID) ~= nActorID then
        Actor.sendTipmsg(sysarg,"您不是行会会长，无法报名!",ttFlyTip)
        return
    end
    local sysVar = System.getDyanmicVar()
    if sysVar.jiqingguildsignup == nil then
        Actor.sendTipmsg(sysarg,"当前时间段无法报名!",ttFlyTip)
        return
    end
    if JiQingGuildCfg.SignUp[nGuildID] ~= nil then
        Actor.sendTipmsg(sysarg,"当前行会已经报名了，无法再次报名!",ttFlyTip)
        return
    end
    JiQingGuildCfg.SignUp[nGuildID] = {}
    JiQingGuildCfg.SignUp[nGuildID].play ={}
    JiQingGuildCfg.SignUp[nGuildID].signupcount = 1 --加上行会会长
    table.insert(JiQingGuildCfg.SignUp[nGuildID].play,nActorID) --把行会会长发到报名列表

    local playerList = Guild.getOnlineActorList(nGuildID)
    for k, playPtr in ipairs(playerList or {}) do
        if Actor.getIntProperty(playPtr,PROP_ENTITY_ID) ~= nActorID then
            Actor.messageBox(playPtr,0,0,"是否报名激情行会活动","我要报名/OnSignUpJiQingGuild","我不去,CNM。/Cancel", nil, nil, 0) 
        end  
	end		

    Actor.sendTipmsg(sysarg,"已向行会成为发送报名请求!",ttFlyTip)
end

function OnSignUpJiQingGuild(sysarg)
    local nGuildID = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
    local nActorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    if JiQingGuildCfg.SignUp[nGuildID] == nil then return end
    table.insert(JiQingGuildCfg.SignUp[nGuildID].play,nActorID)
    
    Actor.sendTipmsg(sysarg,"已报名参加激情行会活动!",ttFlyTip)
    JiQingGuildCfg.SignUp[nGuildID].signupcount = JiQingGuildCfg.SignUp[nGuildID].signupcount + 1
end
function GetNpcJiQingHangHui() return t end