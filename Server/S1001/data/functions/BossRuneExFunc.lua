--boss符文扩展
--@author 后天

--#include "data\config\BossRuneExConfig.lua" once
--#include "data\config\BossRune\BossRuneCfg.lua" once
--初始化boss符文盘扩展信息
function initBossRuneExInfo(sysarg)
    local var = Actor.getStaticVar(sysarg)
    if var.runeexdata == nil then
        var.runeexdata = {}
        for i = 1,BossRuneExConfig.PanelCount do
            var.runeexdata[i]={}
            for j = 1,BossRuneExConfig.SlotCount do
                var.runeexdata[i][j] = 0
            end
        end
    end
end

--初始化碎片信息
--暂定十种碎片
function initBossRuneDebrisInit(sysarg)
--    local var = Actor.getStaticVar(sysarg)
--    if var.debrisdata == nil then
--        var.debrisdata= {}
--        for i =1,BossRuneExConfig.DebrisCount do
--            var.debrisdata[i] = 0
--        end
--    end

end

--发送符文盘扩展信息
function sendBossRuneDebrisExData(sysarg)
    initBossRuneExInfo(sysarg)
    initBossRuneDebrisInit(sysarg)
    local var = Actor.getStaticVar(sysarg)
    local pack = DataPack.allocPacket(sysarg,151,74)
    DataPack.writeByte(pack,BossRuneExConfig.PanelCount)
    DataPack.writeByte(pack,BossRuneExConfig.SlotCount)
    DataPack.writeInt(pack,var.RuneCount)
    for i=1,BossRuneExConfig.PanelCount do
        for j =1,BossRuneExConfig.SlotCount do
            DataPack.writeByte(pack,var.runeexdata[i][j])
        end
    end

    DataPack.flush(pack)

end

--符文槽升级

function bossRuneSlotUpLevel(sysarg,packet)
    local panelIndex = DataPack.readByte(packet) --符文盘索引
    local slotIndex = DataPack.readByte(packet) --符文槽索引

    if panelIndex > BossRuneExConfig.PanelCount or panelIndex <= 0 then return end
    if slotIndex > BossRuneExConfig.SlotCount or slotIndex <= 0 then return end
    initBossRuneExInfo(sysarg)
    local var = Actor.getStaticVar(sysarg)
   
    if var.runeexdata[panelIndex][slotIndex] >= #BossRuneExConfig.List[panelIndex][slotIndex] then 
        Actor.sendTipmsg(sysarg,"已满级,无法继续升级!",ttFlyTip)
        return
    end
    local cfg = BossRuneExConfig.List[panelIndex][slotIndex][var.runeexdata[panelIndex][slotIndex] + 1]
   
    if not checkBossRuneConsumeAndDec(sysarg,cfg.consume) then
        Actor.sendTipmsg(sysarg,"材料不足,无法升级!",ttFlyTip)
        return
    end
    var.runeexdata[panelIndex][slotIndex] = var.runeexdata[panelIndex][slotIndex] + 1

    sendBossRuneDebrisExData(sysarg)
    local str = ""
    if var.runeexdata[panelIndex][slotIndex] == 1 then
        str = "激活成功"
    elseif cfg.breach ~= nil and cfg.breach == true then
        str ="突破成功"
    else
        str = "升级成功"
    end
    Actor.sendTipmsg(sysarg,str,ttFlyTip)
    Actor.collectOperate(sysarg,0)
end

--检查消耗并且扣除-
function checkBossRuneConsumeAndDec(sysarg,consume)
    local var = Actor.getStaticVar(sysarg)
    local ret = false
    if consume.type == 0 then --道具
        if Actor.getItemCount(sysarg,consume.value) >= consume.count then
            Actor.removeItem(sysarg,consume.value,consume.count,-1,-1,-1,"boss符文消耗",LogIds.BossRuneConsume)
            ret = true
        end
        
    elseif consume.type == 1 then
        if var.RuneCount >= consume.value then
            var.RuneCount = var.RuneCount - consume.value
            ret = true
        end
--    elseif consume.type >= 2 and consume.type <= 6 then
--        if var.debrisdata[consume.type - 1] >= consume.value then
--            var.debrisdata[consume.type - 1] = var.debrisdata[consume.type - 1] - consume.value
--            ret = true
--        end
    end
    if ret == true then
        local szName = Actor.getName(sysarg)
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        System.sendCommonLog(LogIds.BossRuneSlotConsume,nActorId,szName,consume.type,consume.value,0,"消耗碎片")
    end
    
 
   return ret
end

--boss符文盘扩展属性
function bossRuneResetPropertys(sysarg,calc)
    initBossRuneExInfo(sysarg)
    local var = Actor.getStaticVar(sysarg)
    for i = 1,BossRuneExConfig.PanelCount do
        for j = 1,BossRuneExConfig.SlotCount do
            if var.runeexdata[i][j] > 0 then
                local level = var.runeexdata[i][j]
                
                if level <= #BossRuneExConfig.List[i][j] then
                    LuaHelp.calcActorAttrs(sysarg, calc, BossRuneExConfig.List[i][j][level].attr)
                end
            end
        end
    end

end

--boss符文盘升级 --返回1 为升级成功 0为升级失败  nExp 为增加的经验
function HandleBossRunePanelUpLevel(sysarg,nIndex,nType,nCurExp)
 
    nIndex =tonumber(nIndex) + 1
    nCurExp = tonumber(nCurExp)
    nType = tonumber(nType)
    initBossRuneDebrisInit(sysarg)
    local var = Actor.getStaticVar(sysarg)
    local cfg = BossRuneCfg.attr[nIndex].uplevexp
    --根据经验取当前等级
    local nLevel = 0
    local nExp = 0
    local nNeedExp = 0
    for i =1,#cfg do
        nExp = nExp + cfg[i].value
        if nCurExp < nExp then 
            nLevel = i
            nNeedExp = nExp - nCurExp
            cfg = cfg[i]
            break 
        end
    end
    --取符文槽的等级
    initBossRuneExInfo(sysarg)
    local nMinSoltLevel = 100
    for j = 1,BossRuneExConfig.SlotCount do
        if  var.runeexdata[nIndex][j]  < nMinSoltLevel then
            nMinSoltLevel = var.runeexdata[nIndex][j]
        end
    end
    --升级符文盘的符文槽等级需求
    local needCfg = 
    {
        {0,10},
        {5, 20},
        {10, 30},
        {15, 40},
        {20, 50},
        {25, 60},
        {30, 70},
    }
    local nMaxLevel = 0
    for i = 1,#needCfg do
        if nLevel < needCfg[i][2] then
            if nMinSoltLevel < needCfg[i][1] then
                Actor.sendTipmsg(sysarg,"升级失败,请先将符文每个槽位升至"..needCfg[i][1].."级",ttFlyTip)
                return
            end
            break
        end
    end
    
    local consume = {type = 1,value =1,count=0,param=0,}
    consume.type = cfg.type
    consume.value = cfg.Itemid
    consume.count = cfg.count

    if nType == 0 then
        consume.param = 1
        if cfg.type == 1 then
            consume.value = 1
        end
        
    else
    
        consume.param = nNeedExp
        if cfg.type == 0 then
           
            consume.count =  nNeedExp * consume.count
        else
             consume.value = nNeedExp
        end
    end
    -- print("type:"..consume.type.."value:"..consume.value.."count:"..consume.count)
    if not checkBossRuneConsumeAndDec(sysarg,consume) then
        Actor.sendTipmsg(sysarg,"材料不足,无法升级",ttFlyTip)
        return 0,0
    end
    sendBossRuneDebrisExData(sysarg)
    Actor.collectOperate(0)
    
    return 1,consume.param
end

--符文兑换
function bossRuneExchangeEx(sysarg,packet)
    local nCount = DataPack.readByte(packet)
    for i =1,nCount do
        local seriec =DataPack.readInt64(packet)
        local pItemPtr =Item.getBagItemPtrByGuid(sysarg,seriec)

        if pItemPtr ~= nil then
           
            local nItemId = Item.getItemProperty(sysarg,pItemPtr,Item.ipItemID, 0)
            local cfg = nil
            for j = 1,#BossRuneExConfig.exChange do
                for k = 1,#BossRuneExConfig.exChange[j].itemid do
                     if BossRuneExConfig.exChange[j].itemid[k] == nItemId then
                        cfg = BossRuneExConfig.exChange[j]
                        break
                    end
                end
                if cfg ~= nil then break end
            end
            if cfg ~= nil then
                local nCount =  Item.getItemProperty(sysarg,pItemPtr,Item.ipItemCount, 0)
               
                local djcount = 200
                nCount = nCount *  cfg.award.count
                local nLoopCount = math.floor(nCount / djcount)
                if nLoopCount <= 0 then nLoopCount = 1 end
                if nCount > djcount then nCount = djcount end
                if Item.getBagEmptyGridCount(sysarg) < nLoopCount then 
                    Actor.sendTipmsg(sysarg,"包裹已满，请清理再兑换")
                    return
                end
               
                Item.removeItem(sysarg,pItemPtr,Item.getItemProperty(sysarg,pItemPtr,Item.ipItemCount, 0),"符文兑换",LogIds.BossRuneExchange)
                for k =1,nLoopCount do
                    
                    Actor.addItem(sysarg,cfg.award.id,0,0,nCount,0,0,"符文兑换",LogIds.BossRuneExchange)
                end  
         
                
            end

        end

    end
    Actor.sendTipmsg(sysarg,"兑换成功!",ttFlyTip)

end