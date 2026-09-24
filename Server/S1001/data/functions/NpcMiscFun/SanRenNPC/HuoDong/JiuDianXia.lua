--#include "data\config\guild\GuildBiaocheCfg.lua" once
local t = {}
t.main = function(sysarg)
	local echo = [[

  <(c0xFF00c0ff)领取条件:>  <(ifragments#16#18)><(c0xFFb6946c)将镖车顺利押送过来的王城行会>
              <(ifragments#16#18)><(c0xFFb6946c)抢夺皇家镖车的行会>


<(idecoLine#315)>

  <(ifragments#16#18)><(c0xFFb6946c) 拥有镖车的行会可以前往我这里领取奖励,每位成员均可获得]]..GuildBiaoCheCfg.GongXuan..[[点功勋值;>


    <#BN领取奖励/@aguildGiveAward>
]];


	return echo;
end


t.aguildGiveAward = function(sysarg)

   
  
    local sVar = System.getDyanmicVar()
    if sVar.guildChe == nil then
        Actor.sendTipmsg(sysarg,"活动已结束或暂未开启，无法领取奖励!",ttFlyTip)
        return
    end
    if sVar.guildChe.Ptr ~= nil then
         Actor.sendTipmsg(sysarg,"镖车暂未击杀或护送成功，无法领取奖励!",ttFlyTip)
        return
    end
    local nGuildId = Actor.getGuildId(sysarg)
    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    if sVar.guildChe.win == nil or nGuildId ~= sVar.guildChe.win then
        Actor.sendTipmsg(sysarg,"您不属于领取奖励的行会，领取奖励失败!",ttFlyTip)
        return
    end
    if sVar.guildChe.awardcount == nil then sVar.guildChe.awardcount = 0 end
    if sVar.guildChe.awardlist == nil then sVar.guildChe.awardlist = {} end
    local nIndex = sVar.guildChe.awardcount

    for i = 1,nIndex do
        if sVar.guildChe.awardlist[i] == nActorId then
            Actor.sendTipmsg(sysarg,"您已经领取了奖励，无法再次领取!",ttFlyTip)
            return
        end
    end
    --是否是王城
    local nMoneyCount = 0
    local nGongXun = GuildBiaoCheCfg.GongXuan
   -- if Guild.getSbkCityOwnerGuildId() == nGuildId then
        --是否是王城城主
        --if Guild.getSbkCityOwner() == nActorId then
           -- nMoneyCount = 5000
        --    nGongXun = 10000
       -- end
   -- elseif System.getGuildLeaderId(nGuildId) == nActorId then
        --是否是行会帮主、
   --       nGongXun = 10000
   -- end
    --购买王城镖车的玩家
    if sVar.guildChe.masterId == nActorId then
        nMoneyCount = GuildBiaoCheCfg.YuanBao
    end
    if nMoneyCount > 0 then
        Actor.changeMoney(sysarg,mtYuanbao,nMoneyCount,LogIds.guildyabiao,"行会镖车返还")
    end
    --给予功勋值
    local val = Actor.getUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE)
	val = val + nGongXun
	Actor.setUIntProperty(sysarg, PROP_ACTOR_HONOR_VALUE, val)
  
    --
    Actor.sendTipmsg(sysarg,string.format("<(c0xFF7CFC00)获得功勋值%d>",nGongXun),ttTipmsgWindow)
    sVar.guildChe.awardcount = sVar.guildChe.awardcount + 1
    sVar.guildChe.awardlist[sVar.guildChe.awardcount] = nActorId
    local str = "领取奖励成功!"
    if nMoneyCount > 0 then
        str = str.."获得元宝:"..nMoneyCount.." 功勋:"..nGongXun
    else
         str = str.."获得功勋"..nGongXun
        
    end
    
    Actor.sendTipmsg(sysarg,str,ttFlyTip)
end


function GetNpcJiuDianXia() return t end