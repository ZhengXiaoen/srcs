--//宝藏仓库 回收装备按钮触发脚本 zer 2017/1/6
--#include "data\config\item\TreasureRecycledItem.lua" once
function TreasureRecoveryInit(sysarg)
    local e = "<title/宝藏仓库回收>\\  <(c0xFFeabc78)您可以通过这里来操作您宝藏仓库内的装备回收.>\\\\";
    local d = TreasureRecycledItem;
    local w = {
        "&55BBFF&点击回收可获得:#",
        "#&FF7755&%s&55BBFF& 经验",
        "#&FF7755&%s&55BBFF& 绑定金币",
        "#&FF7755&%s&55BBFF& 金币",
        "#&FF7755&%s&55BBFF& 护符碎片",
    };
    local ItemCount_bag = {}; --装备在包裹里的数量
    local ItemStr = {}; --按钮上提示文字
    local rStr = {};
    local formatStrs = {};
    local addExp = {}; --显示总经验
    local addBindgold = {}; --显示总绑金
    local addGold = {}; --显示总金币
    local addHufu = {}; --显示总护符碎片
    --取出总的数量和回收资源
    for i = 1, #d do
        local list = d[i].list;
        if not ItemCount_bag[i] then ItemCount_bag[i] = 0; end
        if not addExp[i] then addExp[i] = 0; end
        if not addBindgold[i] then addBindgold[i] = 0; end
        if not addGold[i] then addGold[i] = 0; end
        if not addHufu[i] then addHufu[i] = 0; end
        
        for k = 1, #list do
            local n = GetStoreCountForItemId(sysarg, list[k].itemid);
            ItemCount_bag[i] = ItemCount_bag[i] + n;
            addExp[i] = addExp[i] + n * list[k].exp;
            addBindgold[i] = addBindgold[i] + n * list[k].bindgold;
            addGold[i] = addGold[i] + n * list[k].gold;
            addHufu[i] = addHufu[i] + n * list[k].hufu;
        end
    end
    --做显示总的
     for i = 1, #d do
        local xStr = "";
        if ItemCount_bag[i] == 0 then
            rStr[i] = "#c0xFF888888#" .. d[i].title;
            xStr = "&55BBFF&当前宝藏仓库内没有此类道具回收";
            formatStrs[i] = "  <%s(%s)/@onTreasure_HuiShou,%s|%s>";
            if i % 2 == 0 then
                 formatStrs[i] =  formatStrs[i] .."\\\\"
            else
                formatStrs[i] = formatStrs[i] .."     "
            end
            ItemStr[i] = xStr;
        else
            rStr[i] = d[i].title;
            xStr = xStr .. w[1];
            if addExp[i] > 0 then
                xStr = xStr .. string.format(w[2], addExp[i]);
            end
            if addBindgold[i] > 0 then
                xStr = xStr .. string.format(w[3], addBindgold[i]);
            end
            if addGold[i] > 0 then
                xStr = xStr .. string.format(w[4], addGold[i]);
            end
            if addHufu[i] > 0 then
                xStr = xStr .. string.format(w[5], addHufu[i]);
            end
            formatStrs[i] = "  <<showEff%s(%s)>/@onTreasure_HuiShou,%s|%s>";
            if i % 2 == 0 then
                 formatStrs[i] =  formatStrs[i] .."\\\\"
            else
                formatStrs[i] = formatStrs[i] .."     "
            end
            ItemStr[i] = xStr;
        end
    end
  
    for i = 1, #d do 
        
        local str = string.format(formatStrs[i], rStr[i], ItemCount_bag[i], i, ItemStr[i]);
        e = e .. str
       
        --print(str)
    end
    --print(e)
    return e;
end



function onTreasure_HuiShou(sysarg, i)
    if not i then return; end
    i = tonumber(i);
    local d = TreasureRecycledItem;
    local ItemCount_bag = {}; --装备在包裹里的数量
    local addExp = {}; --显示总经验
    local addBindgold = {}; --显示总绑金
    local addGold = {}; --显示总金币
    local addHufu = {}; --显示总护符碎片
    --取出总的数量和回收资源
    local list = d[i].list;
    if not ItemCount_bag[i] then ItemCount_bag[i] = 0; end
    if not addExp[i] then addExp[i] = 0; end
    if not addBindgold[i] then addBindgold[i] = 0; end
    if not addGold[i] then addGold[i] = 0; end
    if not addHufu[i] then addHufu[i] = 0; end
    for k = 1, #list do
        local n = GetStoreCountForItemId(sysarg, list[k].itemid);
        DelStoreItemForIdAll(sysarg, list[k].itemid);
        ItemCount_bag[i] = ItemCount_bag[i] + n;
        addExp[i] = addExp[i] + n * list[k].exp;
        addBindgold[i] = addBindgold[i] + n * list[k].bindgold;
        addGold[i] = addGold[i] + n * list[k].gold;
        addHufu[i] = addHufu[i] + n * list[k].hufu;
    end
    --做显示总的
    local w = {
        "<宝藏仓库>回收<%s>件<%s装备>获得:",
        "<%s>经验",
        "<%s>绑定金币",
        "<%s>金币",
        "<%s>护符碎片",
    };
    local xStr = "";
    if ItemCount_bag[i] == 0 then
        xStr = string.format("当前宝藏仓库内没有[<%s>]类物品可回收", d[i].title);
    else
        xStr = xStr .. string.format(w[1], ItemCount_bag[i], d[i].title);
        if addExp[i] > 0 then
            xStr = xStr .. string.format(w[2], addExp[i]);
        end
        if addBindgold[i] > 0 then
            xStr = xStr .. string.format(w[3], addBindgold[i]);
        end
        if addGold[i] > 0 then
            xStr = xStr .. string.format(w[4], addGold[i]);
        end
        if addHufu[i] > 0 then
            xStr = xStr .. string.format(w[5], addHufu[i]);
        end
    end
    Dmkj.sendStoreItems(sysarg);
    if ItemCount_bag[i] > 0 then
        Actor.changeMoney(sysarg, 0, addBindgold[i], 105, "宝藏仓库回收收购物品");
        Actor.changeMoney(sysarg, 1, addGold[i], 105, "宝藏仓库回收收购物品");
        Actor.addExp(sysarg, addExp[i], "宝藏仓库回收给经验");
        
        if addHufu[i] > 0 then
            local jadeNum = Actor.getUIntProperty(sysarg, 124)
            jadeNum = jadeNum + addHufu[i];
            Actor.setUIntProperty(sysarg, 124, jadeNum);
            Actor.sendTipmsg(sysarg, string.format("<获得> <(c0xFFFF7755)%s护符碎片>", addHufu[i]), 1);
        end
        Actor.sendTipmsg(sysarg, xStr, 256);
        OnFinish_Liveness(sysarg, 19);
        Actor.playEnergyEffect(sysarg, 1, 0)
        local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sHuiShouZhuangbei)--申请一个数据包
        if netPack then
            DataPack.flush(netPack)
        end
    else
        Actor.sendTipmsg(sysarg, xStr, 256);
    end
    return TreasureRecoveryInit(sysarg);
end

function GetStoreCountForItemId(sysarg, id)--按物品ID获取宝藏仓库内指定道具数量
    local n = 0;
    local itemCount = Dmkj.getStoreCount(sysarg);
    for i = 1, itemCount do
        local itemPtr = Dmkj.getStoreItem(sysarg, i - 1);
        local itemId = Item.getItemId(itemPtr);
        if itemId == id then
            n = n + 1;
        end
    end
    return n;
end
function DelStoreItemForIdAll(sysarg, id)--按物品ID删除宝藏仓库内指定道具
    local itemCount = Dmkj.getStoreCount(sysarg);
    for i = itemCount, 0, -1 do
        local itemPtr = Dmkj.getStoreItem(sysarg, i);
        local itemId = Item.getItemId(itemPtr);
        if itemId == id then
            Dmkj.deleteStoreItem(sysarg, itemPtr, GameLog.cDmkRecycleItem);
        end
    end
end
