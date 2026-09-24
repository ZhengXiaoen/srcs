--#include "data\config\lingshi\LingShiCfg.lua" once
--#include "data\config\equipSynthesis\EquipInlayCfg.lua" once
--灵石合成
MiscsImplement.HandleLingShiSync =  function( sysarg, msgid, packet )
    
    local cfg = LingShiCfg.Syn
    local addRateId = LingShiCfg.SynRate.rateitemid   --增加灵石合成几率的道具
   
    local itemPtr = nil
    local oneItemId = 0
    local guid = nil
    --五个灵石guid
    oneItemId = DataPack.readInt(packet)
    local nRateCount = DataPack.readByte(packet)
    
    
    --是否在配置表中
    local cfgEx = nil
    for i = 1,table.getn(cfg) do
        if cfg[i].itemid == oneItemId then
            cfgEx =cfg[i]
            break
        end
    end
    if cfgEx == nil then
         Actor.sendTipmsg(sysarg, "合成失败！传入道具id失败", ttFlyTip)
         return
    end
    if Actor.getItemCount(sysarg,oneItemId) < cfgEx.count then
        Actor.sendTipmsg(sysarg, "灵石数量不足,合成失败!", ttFlyTip)
        return
    end
    if Actor.getItemCount(sysarg,addRateId) < nRateCount then
        Actor.sendTipmsg(sysarg, "圣珠数量不足,合成失败!", ttFlyTip)
        return
    end
   --扣除金币
    local needMoney = cfgEx.money
    if needMoney ~= nil then
        if Actor.getMoneyCount(sysarg,mtBindCoin) >= needMoney then
            Actor.changeMoney(sysarg,mtBindCoin,-needMoney,1,"灵石合成")
        elseif Actor.getMoneyCount(sysarg,mtCoin) >= needMoney then
            Actor.changeMoney(sysarg,mtCoin,-needMoney,1,"灵石合成")
        else
            Actor.sendTipmsg(sysarg, "金币不足,无法合成", ttFlyTip)
            return   
        end
    end
    --是否有加合成几率
    local nRate = cfgEx.rate + nRateCount * LingShiCfg.SynRate.addrate
     --不管合成失败还是成功，先删除道具
    Actor.removeItem(sysarg,oneItemId,cfgEx.count,-1,-1,-1,"灵石合成",1)
   
    if nRateCount > 0 then
        Actor.removeItem(sysarg,addRateId,nRateCount,-1,-1,-1,"灵石合成",1)
    end
    
    local bRet = 1
    
    if  (System.getRandomNumber(100)) <= nRate then
         --给予奖励道具
         Actor.addItem(sysarg,cfgEx.award,0,0,1,0,0,"灵石合成",1)
            --是否公告
        if cfgEx.notice ~= nil and cfgEx.notice ~="" then
            local str = string.format(cfgEx.notice,Actor.getName(sysarg),Item.getItemLinkMsg(cfgEx.award))
            System.broadcastTipmsg(str,ttChatWindow)
        end
         Actor.sendTipmsg(sysarg, "合成成功", ttFlyTip)
    else
        bRet = 0
        Actor.sendTipmsg(sysarg, "合成失败", ttFlyTip)
    end
    local pack= DataPack.allocPacket(sysarg,139,190)
    DataPack.writeByte(pack,bRet)
    DataPack.flush(pack)
    
    

end

--装备打孔
MiscsImplement.HandleEquipPunch =  function( sysarg, msgid, packet )
    local guid = DataPack.readInt64(packet)
    local nPos = DataPack.readByte(packet)

    local itemPtr = Item.getBagItemPtrByGuid(sysarg,guid)
    if itemPtr == nil then
         Actor.sendTipmsg(sysarg, "装备打孔出错", ttFlyTip)
        return
    end
    if nPos > table.getn(LingShiCfg.Punch.punch) then
        Actor.sendTipmsg(sysarg, "打孔非法位置", ttFlyTip)
        return
    end
    --校验位置
    local bFind = false
    local pos = Item.getItemProperty(sysarg,itemPtr,Item.ipItemType)
   
    for i = 1,table.getn(LingShiCfg.Punch.pos) do
        if pos == LingShiCfg.Punch.pos[i] then
            bFind = true
            break
        end
    end
    if bFind == false then
         Actor.sendTipmsg(sysarg, "该装备不允许打孔", ttFlyTip)
        return
    end 
    --按顺序打孔
    local pos = Item.ipItemType + nPos
    if pos - 1  >= Item.ipItemHole1IsOpen then
        local nIndex = Item.ipItemHole1IsOpen 
        for i = Item.ipItemHole1IsOpen,pos- 1 do
            if Item.getItemProperty(sysarg,itemPtr,nIndex) == 0 then
                Actor.sendTipmsg(sysarg, "请按顺序打孔", ttFlyTip)
                return
            end
            nIndex = nIndex + 1
        end
    end
    --元宝是否足够
    local punch = LingShiCfg.Punch.punch
    if Actor.getMoneyCount(sysarg,mtYuanbao) < punch[nPos].yuanbao then
        Actor.sendTipmsg(sysarg, "元宝不足，无法打孔", ttFlyTip)
        return
    end
    --扣除元宝
    Actor.changeMoney(sysarg,mtYuanbao,-punch[nPos].yuanbao,1,"装备打孔")
    ----成功
    local bRet = 1
   
    if  (System.getRandomNumber(100) ) <= punch[nPos].rate then
        Item.setItemProperty(sysarg,itemPtr,pos,1)
     
        Actor.sendTipmsg(sysarg, "装备打孔成功", ttFlyTip)
    else
       bRet = 0
        Actor.sendTipmsg(sysarg, "装备打孔失败", ttFlyTip)
    end
     local pack= DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sEquipPunch)
      DataPack.writeByte(pack,bRet)
    DataPack.flush(pack)
end

--宝石镶嵌
--
MiscsImplement.HandleEquipSet =  function( sysarg, msgid, packet )
  
    local ItemPtr =  Item.getBagItemPtrByGuid(sysarg,DataPack.readInt64(packet))
    if ItemPtr == nil then
        Actor.sendTipmsg(sysarg, "镶嵌灵石出错，无法找到镶嵌的道具！", ttFlyTip)
        return
    end
   
    local nPos = DataPack.readByte(packet)
    local gemItemPtr = Item.getBagItemPtrByGuid(sysarg,DataPack.readInt64(packet))
    if gemItemPtr == nil then
        Actor.sendTipmsg(sysarg, "镶嵌灵石出错，无法找到镶嵌的宝石！", ttFlyTip)
        return
    end
   
    --判断该孔位是否开放
    local pos = Item.ipItemType + nPos
    if Item.getItemProperty(sysarg,ItemPtr,pos) == 0 then
        Actor.sendTipmsg(sysarg, "镶嵌灵石失败,请先打孔！", ttFlyTip)
        return
    end
    --判断该孔位是否已经镶嵌宝石
    pos = Item.ipItemHole5IsOpen + nPos
    if Item.getItemProperty(sysarg,ItemPtr,pos) ~= 0 then
        Actor.sendTipmsg(sysarg, "镶嵌灵石失败,请先摘除原灵石！", ttFlyTip)
        return
    end
   
    local nIndex = GetGemIndex(Item.getItemId(gemItemPtr))
    if nIndex == 0 then
        Actor.sendTipmsg(sysarg, "镶嵌灵石失败,该灵石不可镶嵌！", ttFlyTip)
        return
    end
    Item.removeItem(sysarg,gemItemPtr,1,"镶嵌灵石",1)
   -- print("灵石索引:"..nIndex.."pos:"..pos)
    --设置宝石索引
    Item.setItemProperty(sysarg,ItemPtr,pos,nIndex)
    Actor.sendTipmsg(sysarg, "镶嵌灵石成功！", ttFlyTip)

     local pack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sEquipSet)
     DataPack.writeByte(pack,1)
     DataPack.flush(pack)
     Actor.collectOperate(sysarg,0)
end

--灵石摘取
MiscsImplement.HandleEquipPick =  function( sysarg, msgid, packet )
    local ItemPtr =  Item.getBagItemPtrByGuid(sysarg,DataPack.readInt64(packet))
    if ItemPtr == nil then
        Actor.sendTipmsg(sysarg, "摘取灵石出错，无法找到镶嵌的道具！", ttFlyTip)
        return
    end
    local nPos = DataPack.readByte(packet)
     --判断该孔位是否开放
    local pos = Item.ipItemType + nPos
    if Item.getItemProperty(sysarg,ItemPtr,pos) == 0 then
        Actor.sendTipmsg(sysarg, "摘取灵石失败,请先打孔！", ttFlyTip)
        return
    end
    --判断该孔位是否已经镶嵌宝石
    pos = Item.ipItemHole5IsOpen + nPos
    if Item.getItemProperty(sysarg,ItemPtr,pos) == 0 then
        Actor.sendTipmsg(sysarg, "摘取灵石失败,请先镶嵌灵石！", ttFlyTip)
        return
    end
    local nItemId = GetGemItemIdForIndex(Item.getItemProperty(sysarg,ItemPtr,pos))
    if nItemId == 0 then
        Actor.sendTipmsg(sysarg, "摘取灵石失败,错误的灵石id！", ttFlyTip)
        return
    end
    --包裹空间是否足够
    if Item.getBagEmptyGridCount(sysarg) <= 0 then
         Actor.sendTipmsg(sysarg, "包裹空间不足，请先清理背包！", ttFlyTip)
        return
    end
    --金币或者绑金是否足够
    local needMoney = LingShiCfg.Pick.gold
   
    if Actor.getMoneyCount(sysarg,mtBindCoin) >= needMoney then
        Actor.changeMoney(sysarg,mtBindCoin,-needMoney,1,"摘取灵石")
    elseif Actor.getMoneyCount(sysarg,mtCoin) >= needMoney then
        Actor.changeMoney(sysarg,mtCoin,-needMoney,1,"摘取灵石")
    else
        Actor.sendTipmsg(sysarg, "金币不足,无法摘取", ttFlyTip)
        return   
    end
    Item.setItemProperty(sysarg,ItemPtr,pos,0)

    Actor.addItem(sysarg,nItemId,0,0,1,0,0,"摘取灵石",1)
    SendActorRet(sysarg,139,LogicCmd.miscSys.sub.sEquipPick,1)
    Actor.collectOperate(sysarg,0)
end
--根据道具id获取镶嵌道具索引
function GetGemIndex(itemid)
    for i = 1,table.getn(EquipInlayCfg) do
        if EquipInlayCfg[i] == itemid then
            return i
        end
    end
    return 0
end

--根据镶嵌索引获取道具id
function GetGemItemIdForIndex(index)
    if index > table.getn(EquipInlayCfg) then
        return
    end
    return EquipInlayCfg[index]
end

function SendActorRet(sysarg,sysId,cmdId,ret)
    local pack = DataPack.allocPacket(sysarg,sysId,cmdId)
     DataPack.writeByte(pack,ret)
     DataPack.flush(pack)

end
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cLingShiSync, MiscsImplement.HandleLingShiSync)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEquipPunch,MiscsImplement.HandleEquipPunch)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEquipSet,MiscsImplement.HandleEquipSet)

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEquipPick,MiscsImplement.HandleEquipPick)
