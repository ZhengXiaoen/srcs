--#include "data\config\GodEquip\GodEquipConfig.lua" once
--#include "data\functions\Systems\ActivitySystem\WorldBoss.lua" once
--#include "data\functions\MonsterDropNotice.lua"  once
--神装升级
MiscsImplement.HandleGodEquipUp =  function( sysarg, msgid, packet )
    local nItemGuid = DataPack.readInt64(packet)
    local nLocation = DataPack.readByte(packet)
  
    local pEquipPtr = Item.getEquipPtrByGuid(sysarg,nItemGuid)
    if pEquipPtr == nil then 
        Actor.sendTipmsg(sysarg, "升级失败,未找到神装!", ttFlyTip)
        return
    end
    local nPos =Item.getItemProperty(sysarg,pEquipPtr,Item.ipItemType) + nLocation
    local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
    local config = GodEquipConfig.UpLev[nJob]
    if config == nil then
        Actor.sendTipmsg(sysarg, "升级失败,未找到神装信息!", ttFlyTip)
        return
    end
    local nItemId = Item.getItemProperty(sysarg,pEquipPtr,Item.ipItemID)
    local cfg = nil
    for i =1,table.getn(config) do
        if config[i].srcId == nItemId then
            cfg = config[i]
            break
        end
    end
    if cfg == nil then
        Actor.sendTipmsg(sysarg, "升级失败,未找到神装配置表!", ttFlyTip)
        return 
    end
    if cfg.destId == 0 then
         Actor.sendTipmsg(sysarg, "升级失败,神装已满级,无法继续升级!", ttFlyTip)
        return 
    end
    if Actor.getItemCount(sysarg,GodEquipConfig.ShengHunId) < cfg.decValue then
        Actor.sendTipmsg(sysarg, "神装合成失败,圣魂数量不足!!", ttFlyTip)
        return
    end
    if Item.getBagEmptyGridCount(sysarg) == 0 then
        Actor.sendTipmsg(sysarg, "包裹空间不足,请清理1格!!", ttFlyTip)
        return
    end
    if Actor.removeItem(sysarg,GodEquipConfig.ShengHunId,cfg.decValue) == 0 then
        Actor.sendTipmsg(sysarg, "神装合成失败,圣魂数量不足!!", ttFlyTip)
         return
    end
    --删除该装备
    if Item.removeEquip(sysarg,pEquipPtr,"神装升级",LogIds.godequipup) == 0  then
        Actor.sendTipmsg(sysarg, "神装合成失败,err code  111!!", ttFlyTip)
         return
    end
    local pItem = Item.createItem(cfg.destId)
    if pItem == nil then 
         Actor.sendTipmsg(sysarg, "神装合成失败,err code  222!!", ttFlyTip)
         return
    end
    Item.addItem(sysarg,pItem,"神装合成",LogIds.godequichange)
    Item.equipItem(sysarg,pItem,0,nLocation)
    local pack= DataPack.allocPacket(sysarg,139,198)
    DataPack.flush(pack)
    Actor.sendTipmsg(sysarg, "神装合成成功!!", ttFlyTip)
    local nTipType = ttChatWindow
    if System.getDaysSinceOpenServer() <= 7 then
        nTipType = nTipType + ttScreenCenter
    end
    local str = string.format("恭喜<(n%s)>成功升级获得%s <我也要升级神装/@@showWin,185>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg.destId))
    System.broadcastTipmsg(str,nTipType)


end


--神装兑换
MiscsImplement.GodEquipChange =  function( sysarg, msgid, packet )


    local bType = DataPack.readByte(packet)
    local nLocation = DataPack.readByte(packet)
    local nPos =bType + nLocation
    
--    --武器
--    if bType == 14 then
--         Actor.sendTipmsg(sysarg, "此神器只可首充赠送获得<神装★屠龙霸刀Lv1>", ttFlyTip)
--        return
--    end
--    --衣服
--    if bType == 12 then
--        Actor.sendTipmsg(sysarg, "此神甲只可七日奖励第二天赠送获得<神装★屠龙甲Lv1>", ttFlyTip)
--        return
--    end
--    local pEquipPtr = Item.getEquipByPos(sysarg,nPos)
--    if pEquipPtr ~= nil then
--        Actor.sendTipmsg(sysarg, "神装兑换失败,身上已有该装备!!", ttFlyTip)
--        return
--    end
    local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
    local nSex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
    local config = GodEquipConfig.ExChange[nJob]
    if config == nil then
        Actor.sendTipmsg(sysarg, "神装兑换失败!!", ttFlyTip)
        return
    end
   
    local cfg = nil
    for i = 1,table.getn(config) do
        if config[i].type == bType and (config[i].sex == nil or  config[i].sex == nSex) then
            cfg = config[i]
            break

        end
    end
    if cfg == nil then
        
         Actor.sendTipmsg(sysarg, "神装兑换失败,无效的神装类型!!", ttFlyTip)
         return
    end
    if Item.getBagEmptyGridCount(sysarg) == 0 then
        Actor.sendTipmsg(sysarg, "包裹空间不足,请清理1格!!", ttFlyTip)
        return
    end
     if Actor.getItemCount(sysarg,GodEquipConfig.ShengHunId) < cfg.decValue then
        Actor.sendTipmsg(sysarg, "神装兑换失败,圣魂数量不足!!", ttFlyTip)
        return
    end
    if Actor.removeItem(sysarg,GodEquipConfig.ShengHunId,cfg.decValue) == 0 then
        Actor.sendTipmsg(sysarg, "神装兑换失败,圣魂数量不足!!", ttFlyTip)
        return
    end
    
    local pItem = Item.createItem(cfg.destId)
    if pItem == nil then 
         Actor.sendTipmsg(sysarg, "神装兑换失败,err code  222!!", ttFlyTip)
         return
    end
    Item.addItem(sysarg,pItem,"神装兑换",LogIds.godequichange)
    Item.equipItem(sysarg,pItem,0,nLocation)
    local pack= DataPack.allocPacket(sysarg,139,199)
    DataPack.flush(pack)
    Actor.sendTipmsg(sysarg, "神装兑换成功!!", ttFlyTip)
	System.broadcastTipmsg(string.format("<(n%s)>玩家在<散人神装/@@showWin,185>获得了%s",Actor.getName(sysarg),Item.getItemLinkMsg(cfg.destId)),ttChatWindow)
end
MiscsImplement.WorldBossBuff =  function( sysarg, msgid, packet )
    local bType = DataPack.readByte(packet)
    if Actor.getSceneId(sysarg) ~= 119 then
        System.trace("WorldBossBuff bug"..Actor.getName(sysarg))
        return
    end
        WorldBoss_AddBuff(sysarg,bType)
end

MiscsImplement.GetBossKillInfo =  function( sysarg, msgid, packet )
        local nPage = DataPack.readByte(packet)
      
        GetMonsterDropNotice(sysarg,nPage)
end
--神装分解
MiscsImplement.GodEquipResolve =  function( sysarg, msgid, packet )
    local nCount = DataPack.readByte(packet)
    local arr_guid = {}
    local pWeaponPtr = Item.getEquipByPos(sysarg,15)
    local pDressPtr = Item.getEquipByPos(sysarg,13)
 
    for i = 1,nCount do
        local nGuid = DataPack.readInt64(packet)
        local pItemPtr =Item.getBagItemPtrByGuid(sysarg,nGuid)
        if pItemPtr == nil then
            Actor.sendTipmsg(sysarg, "神装分解失败,无效的GUID!!", ttFlyTip)  
            return
        end
--        local nItemType = Item.getItemProperty(sysarg,pItemPtr,Item.ipItemType)

--        if nItemType == 12 and pDressPtr == nil then

--            Actor.sendTipmsg(sysarg, "身上没有佩戴<神甲>: 身上未佩戴<神甲>类神装,无法分解此类神装!!", ttFlyTip)  
--            return
--        end

--        if nItemType == 14 and pWeaponPtr == nil then

--            Actor.sendTipmsg(sysarg, "身上没有佩戴<神器>: 身上未佩戴<神器>类神装,无法分解此类神装!!", ttFlyTip)  
--            return
--        end
        table.insert(arr_guid,nGuid)
    end
    local nValue = 0
    for i = 1,nCount do
        local pItem = Item.getBagItemPtrByGuid(sysarg,arr_guid[i])
        local nItemId = Item.getItemProperty(sysarg,pItem,Item.ipItemID)
        local nItemType = Item.getItemProperty(sysarg,pItem,Item.ipItemType)
        if nItemType == 12 then nItemType = 13 end --神甲
        if nItemType == 14 then nItemType = 15 end --神器
--        local pEquipPtr = Item.getEquipByPos(sysarg,nItemType)
--        if pEquipPtr == nil then
--            Actor.sendTipmsg(sysarg, "角色身上未佩戴<此类神装>,不可进行分解同类型神装!!", ttFlyTip)  
--            return
--        end
--        --右神镯
--        if nItemType == 42 then
--            pEquipPtr = Item.getEquipByPos(sysarg,43)
--            if pEquipPtr == nil then
--                Actor.sendTipmsg(sysarg, "角色身上未佩戴<此类神装>,不可进行分解同类型神装!!", ttFlyTip)  
--                return
--            end
--        end
--        --右神戒
--        if nItemType == 44 then
--            pEquipPtr = Item.getEquipByPos(sysarg,45)
--            if pEquipPtr == nil then
--                Actor.sendTipmsg(sysarg, "角色身上未佩戴<此类神装>,不可进行分解同类型神装!!", ttFlyTip)  
--                return
--            end
--        end
        Item.getEquipByPos(sysarg,nItemType)
        --local nJob = Item.getItemProperty(sysarg,pEquipPtr,Item.ipItemNeedVocation)
        
        local cfg =nil
        local bFind = false
        for k =1,table.getn(GodEquipConfig.UpLev) do
            for j =1,table.getn(GodEquipConfig.UpLev[k]) do
                if GodEquipConfig.UpLev[k][j].srcId == nItemId then
                    cfg = GodEquipConfig.UpLev[k][j]
                    
                    nValue = nValue + cfg.addValue
                    bFind = true
                    break
                end
            end
            if bFind == true then break end
        end
        if cfg == nil then
            Actor.sendTipmsg(sysarg, "神装分解失败,无效的职业!!", ttFlyTip)  
            return
        end
       
        Actor.removeItemByPtr(sysarg,pItem,1,true,"神装分解",LogIds.godequipresolve)
    end
    Actor.addItem(sysarg,GodEquipConfig.ShengHunId,0,0,nValue,0,0,"神装分解",LogIds.godequipresolve)
    local pack= DataPack.allocPacket(sysarg,139,200)
    DataPack.flush(pack)
    Actor.sendTipmsg(sysarg, "神装分解成功分解神装获得<"..nValue..">散人圣魂!!", ttFlyTip)
end
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGodEquipUp, MiscsImplement.HandleGodEquipUp)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGodEquipChange,MiscsImplement.GodEquipChange)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGodEquipResolve,MiscsImplement.GodEquipResolve)

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cWorldBossBuff,MiscsImplement.WorldBossBuff)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetBoosKillInfo,MiscsImplement.GetBossKillInfo)

