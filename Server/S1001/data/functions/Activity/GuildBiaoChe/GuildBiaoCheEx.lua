--#include "data\config\guild\GuildBiaocheCfg.lua" once
--行会镖车活动结束
function GuildCheRunTime()
	
	if System.isCrossServer() ==true then
		return 
	end
	
    local sVar = System.getDyanmicVar()
    if System.getSbkGuildId() == 0 then
        System.deleteTimer("GuildCheRunTime")
         System.deleteTimer("GuildCheDelayTime")
        return
    end
    if sVar.guildChe == nil or sVar.guildChe.Ptr == nil then
        System.deleteTimer("GuildCheRunTime")
         System.deleteTimer("GuildCheDelayTime")
        return
    end
    local pMonsterPtr =Actor.getEntity(sVar.guildChe.Ptr)
    if pMonsterPtr == nil then
         System.deleteTimer("GuildCheDelayTime")
        System.deleteTimer("GuildCheRunTime")
        return
    end

    local x = Actor.getIntProperty(pMonsterPtr,PROP_ENTITY_POSX)
    local y = Actor.getIntProperty(pMonsterPtr,PROP_ENTITY_POSY)
    local nSceneId = Actor.getSceneId(pMonsterPtr)
  
    if x == 90 and y == 44 and nSceneId == 10 then --镖车已经到达目的地
        Fuben.clearMonster(sVar.guildChe.Ptr) --销毁行会镖车
        sVar.guildChe.Ptr = nil
        sVar.guildChe.win = System.getSbkGuildId()
        System.deleteTimer("GuildCheRunTime")
        local str = "霸气冲天！由王城行会护送的皇家镖车无人敢挡,顺利交付给九殿下,获得"..GuildBiaoCheCfg.GongXuan.."点功勋,成员均获得"..GuildBiaoCheCfg.GongXuan.."功勋值.押镖奖励在九殿下处点击领取. <(x热血王城:90:44:传)>"
        System.broadcastTipmsg(str,ttChatWindow)
        sVar.guildbiaochegive = 1
       
   
        System.sendCommonLog(GameLog.cGuildBiaoChe,sVar.guildChe.masterId,"",0,0,0,"押镖成功");
         System.deleteTimer("GuildCheDelayTime")
    end
end

function EndGuildBiaoChe(diePtr)
  
    local sVar = System.getDyanmicVar()
    if sVar.guildChe == nil or sVar.guildChe.Ptr == nil then
        return 
    end
    --行会镖车没死，元宝爆炸
    
    local pMonsterPtr =Actor.getEntity(sVar.guildChe.Ptr)

    if diePtr  ~= nil then
        pMonsterPtr = diePtr
    end
    if pMonsterPtr ~= nil then
        local nCount = GuildBiaoCheCfg.YuanBao / 100
        for i = 1,nCount do
            Item.createDropMoneyItem(pMonsterPtr,mtYuanbao,100,LogIds.guildchedrop,"行会镖车爆炸",nil)
        end
        if diePtr == nil then
            Fuben.clearMonster(sVar.guildChe.Ptr) --销毁行会镖车
        end
        
        local x = Actor.getIntProperty(pMonsterPtr,PROP_ENTITY_POSX)
        local y = Actor.getIntProperty(pMonsterPtr,PROP_ENTITY_POSY)
        local nSceneId = Actor.getSceneId(pMonsterPtr)
        local szSceneName =Fuben.getSceneNameById(nSceneId)
        local szGuildName = Guild.getGuildName(System.getSbkGuildId())
        local str  ="%s行会押送的皇家镖车押送失败, 皇家镖车消失并且在%s(%d,%d)处掉落了"..GuildBiaoCheCfg.YuanBao.."元宝."
        System.broadcastTipmsg(string.format(str,szGuildName,szSceneName,x,y),ttChatWindow)
        System.sendCommonLog(GameLog.cGuildBiaoChe,sVar.guildChe.masterId,"",0,0,0,"失败,元宝爆炸");
    end
    sVar.guildbiaochegive = 1
    sVar.guildChe = nil --没有胜利的行会
end