--传世装备函数实现
--#include "data\config\LegendEquipCfg.lua" once
--#include "data\functions\ThorEquipFunc.lua" once

 LegendExchangeCfg= 
    {
        {
            name =  "装备兑换宝钻",
            exchange= 
            {
                --itemid=兑换前的装备 count=兑换前的装备数量 exchangeid=兑换后的道具 exchangecount=兑换后的道具数量 exchangebind=兑换后的道具是否绑定
{itemid=6392,count=1,exchangeid=6402,exchangecount=20,exchangebind=1,}, --武器
{itemid=6393,count=1,exchangeid=6402,exchangecount=15,exchangebind=1,}, --衣服
{itemid=6396,count=1,exchangeid=6402,exchangecount=10,exchangebind=1,}, --头盔
{itemid=6397,count=1,exchangeid=6402,exchangecount=10,exchangebind=1,}, --项链
{itemid=6398,count=1,exchangeid=6402,exchangecount=10,exchangebind=1,}, --戒指
{itemid=6399,count=1,exchangeid=6402,exchangecount=10,exchangebind=1,}, --手镯
{itemid=6400,count=1,exchangeid=6402,exchangecount=10,exchangebind=1,}, --腰带
{itemid=6401,count=1,exchangeid=6402,exchangecount=10,exchangebind=1,}, --靴子


               -- {itemid=(a1),count=(a2),exchangeid=(a3),exchangecount=(a4),exchangebind=(a5),}, --(a6)
                
            }
        },

        {
            name= "宝钻兑换装备",
            exchange= 
            {
                --itemid=兑换前的装备 count=兑换前的装备数量 exchangeid=兑换后的道具 exchangecount=兑换后的道具数量 exchangebind=兑换后的道具是否绑定
              --  {itemid=(a1),count=(a2),exchangeid=(a3),exchangecount=(a4),exchangebind=(a5),},--(a6)
-- {itemid=6402,count=20,exchangeid=6392,exchangecount=1,exchangebind=1,},--武器ind=1,}, --武器
-- {itemid=6402,count=15,exchangeid=6393,exchangecount=1,exchangebind=1,},--衣服ind=1,}, --衣服
{itemid=6402,count=20,exchangeid=6396,exchangecount=1,exchangebind=1,},--头盔ind=1,}, --头盔
{itemid=6402,count=20,exchangeid=6397,exchangecount=1,exchangebind=1,},--项链ind=1,}, --项链
{itemid=6402,count=20,exchangeid=6398,exchangecount=1,exchangebind=1,},--戒指ind=1,}, --戒指
{itemid=6402,count=20,exchangeid=6399,exchangecount=1,exchangebind=1,},--手镯ind=1,}, --手镯
{itemid=6402,count=20,exchangeid=6400,exchangecount=1,exchangebind=1,},--腰带ind=1,}, --腰带
{itemid=6402,count=20,exchangeid=6401,exchangecount=1,exchangebind=1,},--靴子ind=1,}, --靴子

            }
        },
    };
function handleUpLegendEquip(sysarg,nType,nPos)
--    local nType = DataPack.readByte(pack)
--    local nPos = DataPack.readByte(pack)
    nType = tonumber(nType)
    nPos = tonumber(nPos)
    --print(nType,nPos)
    local location = 0
    local cfg = nil
    local nSex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX) + 1
    for i =1,#LegendEquipCfg do
        if LegendEquipCfg[i].type == nType then
            for j=1,#LegendEquipCfg[i].pos do
                if LegendEquipCfg[i].pos[j] == nPos then
                    cfg = LegendEquipCfg[i]
                    if j == 2 then
                        location=  1
                    end
                    break
                end
            end
            if cfg ~= nil then
                break
            end
        end
    end
    if cfg == nil then
        Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
        return
    end
    local pEquip = Item.getEquipByPos(sysarg,nPos)
    local cfgEx = nil
    local nLevel = 0
    if pEquip == nil then
        cfgEx = cfg.level[1]
        nLevel = -1
    else
        local nItemId = Item.getItemProperty(sysarg,pEquip,Item.ipItemID)
        for i =1,#cfg.level do
            if nItemId == cfg.level[i].awardItem[nSex].itemid then
                if i == #cfg.level then
                    Actor.sendTipmsg(sysarg,"装备已满级",ttFlyTip)
                    return
                end
                cfgEx = cfg.level[i + 1]
                nLevel = i + 1
                break
            end
            
        end
    end
    --判断需求是否足够
    if Item.getBagEmptyGridCount(sysarg) <= 0 then
        Actor.sendTipmsg(sysarg,"包裹空间不足,请预留一个空间!",ttFlyTip)
        return
    end
    if Actor.getItemCount(sysarg,cfgEx.needItem.itemid) < cfgEx.needItem.count then
        Actor.sendTipmsg(sysarg,"所需材料不足!",ttFlyTip)
        return
    end
    if pEquip ~= nil then
        Item.removeEquip(sysarg,pEquip,"传世装备升级",LogIds.legenduplevel)
    end
    Actor.removeItem(sysarg,cfgEx.needItem.itemid,cfgEx.needItem.count,-1, -1, -1, "传世装备升级",LogIds.legenduplevel)
    
    local pItem = Item.createItem(cfgEx.awardItem[nSex].itemid,1,0,0,cfgEx.awardItem[nSex].bind,0,0)
    local szLog = ""
    if nLevel == -1 then
    szLog = "激活传世装备"
    else
        szLog = "升级:"..nLevel
    end
    Item.addItem(sysarg,pItem,szLog,LogIds.legenduplevel,1)
    
    Item.equipItem(sysarg,pItem,0,location)
   
    Actor.sendTipmsg(sysarg,"升级成功!",ttFlyTip)

end


function handExChangeLegend(sysarg)
   
   return handExChangeLegendPage(sysarg,1)
--    local str = "           <传世装备以及宝钻的兑换>\\\\"
--    for i=1,#LegendExchangeCfg do
--        print(string.format("<%s/@handExChangeLegendPage,%d>",LegendExchangeCfg[i].name,i))
--        str = str..string.format("\\\\\\                      <%s/@handExChangeLegendPage,%d>",LegendExchangeCfg[i].name,i).."\\\\"

--    end
--    return str
end


function handExChangeLegendPage(sysarg,nPage)
   
    nPage = tonumber(nPage)
    
    if nPage < 1 or nPage > #LegendExchangeCfg then return end
    local str = "\\         <(c0xFF00c0ff)传世道具用于激活装备,宝钻用于升级装备等级>\\<(idecoLine#350)>\\\\\\        "
    
    local cfg = LegendExchangeCfg[nPage].exchange
    for i=1,#cfg do
        str = str..string.format("%s<(c0xFFb6946c)*%d → >%s<(c0xFFb6946c)*%d>",Item.getItemLinkMsg(cfg[i].itemid),cfg[i].count,Item.getItemLinkMsg(cfg[i].exchangeid),cfg[i].exchangecount)
        local nCount = math.floor(Actor.getItemCount(sysarg,cfg[i].itemid) / cfg[i].count)
      
        if nCount > 0   then
            str = str..string.format("    <#c0xFF15EA40#兑换(%d)/@handExChangeLegendItem,%d,%d>",nCount ,nPage,i)
        else
            str = str.."    <(c0xFF888888)兑换(0)>"
        end
        str = str .."\\        "
    end
    if nPage == 1 then
        --str =str.."\\\\                    <#c0xFF15EA40#宝钻兑换传世装备/@handExChangeLegendPage,2>".."\\"
    else
        str =str.."\\\\                    <#c0xFF15EA40#传世装备兑换宝钻/@handExChangeLegendPage,1>".."\\"
    end
    
    str = str.."<(idecoLine#350)>\\ <(c0xFF00c0ff)传世宝钻、传世装备>\\     <(c0xFFffff00)1.将在庆典活动探索宝藏以及高转BOSS掉落产出>"
    return str


end

function handExChangeLegendItem(sysarg,nPage,nIndex)
    
    nPage = tonumber(nPage)
    nIndex = tonumber(nIndex)
    
    if nPage < 1 or nPage > #LegendExchangeCfg then return end
    local cfg = LegendExchangeCfg[nPage].exchange
    if nIndex < 1 or nIndex > #cfg then
        return
    end
   
    cfg = cfg[nIndex]
  
    if Actor.getItemCount(sysarg,cfg.itemid) < cfg.count then
        
        return
    end
   if Item.getBagEmptyGridCount(sysarg) < 0 then
        Actor.sendTipmsg(sysarg,"包裹空间不足!",ttFlyTip)
        return
   end 
   Actor.removeItem(sysarg,cfg.itemid,cfg.count,-1,-1,-1,"传世装备兑换",LogIds.legendequipexchange)

   Actor.addItem(sysarg,cfg.exchangeid,0,0,cfg.exchangecount,cfg.exchangebind,0,"传世装备兑换",LogIds.legendequipexchange)
   Actor.sendTipmsg(sysarg,"兑换成功",ttFlyTip)
   return handExChangeLegendPage(sysarg,nPage)
end