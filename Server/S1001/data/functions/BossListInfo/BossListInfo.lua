--#include "data\functions\BossListInfo\BossListInfoEx.lua" once



MiscsImplement.HandleBossListInfo =  function( sysarg, msgid, packet )
    local type = DataPack.readByte(packet)
        
    if type == 0 then
        HandleGetLeftBoosListInfo(sysarg)
    elseif type == 1 then
        HandleGetRightBoosListInfo(sysarg,DataPack.readString(packet))
    elseif type == 2 then
        HandleGetBoosListInfoCallBack(sysarg,packet)

    end
end

MiscsImplement.HandleOpenGuildRedPack = function(sysarg,msgid,packet)
    local nMoneyType = DataPack.readByte(packet)
    local nMoneyCount = DataPack.readInt(packet)
    local nGuildID = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
    local nGuildCount = Guild.getGuildOnlineMemberNum(nGuildID)-1
    nMoneyCount = nGuildCount * nMoneyCount
    if nGuildCount <= 0 then return end
    if nMoneyType ~= mtYuanbao then 
        System.trace("HandleOpenGuildRedPack actorid:%d",Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
        return 
    end
    if nMoneyType < 0 or nMoneyType > 3 then return end 
    if Actor.getMoneyCount(sysarg,nMoneyType) < nMoneyCount then
        local szTips = "绑定元宝"
        if nMoneyType == 1 then
            szTips = "金币"
        end
        Actor.sendTipmsg(sysarg, szTips.."不足,无法发送红包!",ttFlyTip);
        return
    end
    Guild.SendRedPack(sysarg,nMoneyType,nMoneyCount)
    Actor.sendTipmsg(sysarg, "发送红包成功!",ttFlyTip);

end
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cBossListInfo, MiscsImplement.HandleBossListInfo)
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cOpenGuildRedPack,MiscsImplement.HandleOpenGuildRedPack)