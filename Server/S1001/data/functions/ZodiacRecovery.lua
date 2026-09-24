--生肖碎片回收
--#include "data\config\NewZodiac.lua" once
function ZodiacRecoveryInit(sysarg)
    local str = "\\         <(c0xFF00c0ff)点击查看回收生肖道具,可获得对应生肖经验值>\\<(idecoLine#350)>\\\\"
    for i =1,#NewZodiacCfg.Recovery do
        str  = str.."                       <(c0xFFeabc78)回收><"..NewZodiacCfg.Recovery[i].name.."/@ZodiacRecovery,"..i..">\\\\"
    end
    return str
end

function ZodiacRecovery(sysarg,nIndex)
    nIndex = tonumber(nIndex)


    local str = "\\         <(c0xFF00c0ff)点击回收,可回收包裹内所有对应道具>\\<(idecoLine#350)>\\\\"
    local cfg = NewZodiacCfg.Recovery[nIndex].recovery
    
    for i =1,#cfg do
        local nCount = Actor.getItemCount(sysarg,cfg[i].itemid)
        local szInfo = "无可回收道具"
        local szFunc = "#c0xFF888888#回收("..nCount..")"
      
        if nCount  > 0 then
            szFunc = "回收("..nCount..")"
            szInfo ="回收可获得生肖经验"..nCount * cfg[i].exp
        end
       str = str.."  <(c0xFFeabc78)回收>"..Item.getItemLinkMsg(cfg[i].itemid).."<(c0xFFeabc78)获得"..NewZodiacCfg.Recovery[nIndex].name.."经验> <(c0xFF00FF00)+> <(c0xFF00FF00)"..cfg[i].exp..">  <"..szFunc.."/@ZodiacRecoveryEx,"..cfg[i].itemid..","..cfg[i].exp..","..i..","..nIndex.."|"..szInfo.."> \\"
    end
    str = str.."\\         <一键回收全部/@SpeedZodiacRecoveryEx,"..nIndex..">             <返回上一层/@ZodiacRecoveryInit>"
    return str

end

--function ZodiacRecovery(sysarg,nIndex)
--    nIndex = tonumber(nIndex)


--    local str = "\\         <(c0xFF00c0ff)点击回收,可回收包裹内所有对应道具>\\<(idecoLine#350)>\\\\"
--    local cfg = NewZodiacCfg.Recovery[nIndex].recovery
--    for i =1,#cfg do
--       str = str.."         <(c0xFFeabc78)回收>"..Item.getItemLinkMsg(cfg[i].itemid).."<(c0xFFeabc78)获得"..NewZodiacCfg.Recovery[nIndex].name.."经验> <(c0xFF00FF00)+> <(c0xFF00FF00)"..cfg[i].exp..">   <回收/@ZodiacRecoveryEx,"..cfg[i].itemid..","..cfg[i].exp..","..nIndex.."> \\\\"

--    end
--    str = str.."\\                      <返回上一层/@ZodiacRecoveryInit>"
--    return str

--end

function ZodiacRecoveryEx(sysarg,nItemId,nExp,nIndex,i)
    nItemId = tonumber(nItemId)
    nExp = tonumber(nExp)
    nIndex = tonumber(nIndex)
    i = tonumber(i)
    
    -- 避免玩家刷
    if NewZodiacCfg.Recovery[i] == nil then return end
    
    local cfg = NewZodiacCfg.Recovery[i].recovery    
    
    nItemId = cfg[nIndex].itemid
    nExp = cfg[nIndex].exp
    --------
    
    local nCount = Actor.getItemCount(sysarg,nItemId)
    if nCount <= 0 then
        Actor.sendTipmsg(sysarg,"无可回收道具!",ttFlyTip)
        return
    end
    Actor.removeItem(sysarg,nItemId,nCount, -1, -1, -1,"碎片回收",LogIds.zodiacRecovery)
    local nAllExp = nExp * nCount
    InitNewZodiacInfo(sysarg)
    local svar = Actor.getStaticVar(sysarg)
    if svar.newzodiac[nIndex] == nil or svar.newzodiac[nIndex].level == nil then 
            svar.newzodiac[nIndex] = {} 
            svar.newzodiac[nIndex].level = -1
            svar.newzodiac[nIndex].exp = 0
    end
    local svar = Actor.getStaticVar(sysarg)
    svar.newzodiac[nIndex].exp = svar.newzodiac[nIndex].exp + nAllExp
    Actor.sendTipmsg(sysarg,"回收成功,获得经验"..nAllExp.."!",ttFlyTip)

    SendNewZodiacInfo(sysarg,nil)
    return ZodiacRecovery(sysarg,i)
end

function SpeedZodiacRecoveryEx(sysarg,j)
    j = tonumber(j)
    local cfg = NewZodiacCfg.Recovery[j].recovery
    local awardlist={}
   
    for i =1,#cfg do
         local award ={}
        
         award.count = Actor.getItemCount(sysarg,cfg[i].itemid)
         if award.count > 0 then
            Actor.removeItem(sysarg,cfg[i].itemid,award.count, -1, -1, -1,"碎片回收",LogIds.zodiacRecovery)
            award.exp = cfg[i].exp * award.count
            award.index = cfg[i].index
            table.insert(awardlist,award)
         end
    end
 
    local nAllExp = 0
    InitNewZodiacInfo(sysarg)
    local svar = Actor.getStaticVar(sysarg)
    for i = 1,#awardlist do
        local nIndex = awardlist[i].index
        if svar.newzodiac[nIndex] == nil or svar.newzodiac[nIndex].level == nil then 
            svar.newzodiac[nIndex] = {} 
            svar.newzodiac[nIndex].level = -1
            svar.newzodiac[nIndex].exp = 0
        end
        local svar = Actor.getStaticVar(sysarg)
        svar.newzodiac[nIndex].exp = svar.newzodiac[nIndex].exp + awardlist[i].exp
        nAllExp = nAllExp + awardlist[i].exp
    end
    
    Actor.sendTipmsg(sysarg,"回收成功,获得经验"..nAllExp.."!",ttFlyTip)
    SendNewZodiacInfo(sysarg,nil)
    return ZodiacRecovery(sysarg,j)
end
