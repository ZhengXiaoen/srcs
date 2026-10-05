-- 坐骑、足迹、三国时装共用神盾式点击合成，材料按背包总数量扣除。
--#include "data\config\ActorEvent\HeChengCfg.lua" once

LocalDT.AppearanceMakeGroups = {
    {name="坐骑合成", label="坐骑", source="探索宝藏", recipeGroup=9,
        starts={6888,6892,6896,6900,6941,7630}},
    {name="足迹合成", label="足迹", source="探索宝藏", recipeGroup=10,
        starts={6967,6971,6975,6979,7786,7790,7794,7798}},
    {name="时装合成", label="时装", source="探索宝藏、四帝宫",
        starts={6715,6719,6723,6727,7703}},
}

LocalDT.AppearanceMakeRecipes = function(group)
    local cfg = LocalDT.AppearanceMakeGroups[group]
    if not cfg then return end
    local recipes = {}
    if cfg.recipeGroup then
        for _, list in ipairs(HeChengCfg[cfg.recipeGroup]) do
            for _, recipe in ipairs(list) do
                recipes[#recipes+1] = {itemid=recipe.id1, destid=recipe.id3}
            end
        end
    else
        for _, first in ipairs(cfg.starts) do
            for itemid=first,first+2 do
                recipes[#recipes+1] = {itemid=itemid, destid=itemid+1}
            end
        end
    end
    return recipes
end

function AppearanceMakeInit(sysarg)
    local str = "\\ <(c0xFFb6946c)3个相同道具可合成1个高一级道具，点击合成即可。>\\<(idecoLine#350)>\\"
    for group, cfg in ipairs(LocalDT.AppearanceMakeGroups) do
        str = str .. "\\                      <" .. cfg.name .. "/@AppearanceMakeCategory," .. group .. ">\\"
    end
    return str
end

function RideAppearanceMakeInit(sysarg)
    return AppearanceMakeCategory(sysarg,1)
end

function FashionAppearanceMakeInit(sysarg)
    return AppearanceMakeCategory(sysarg,3)
end

function FootAppearanceMakeInit(sysarg)
    return AppearanceMakeCategory(sysarg,2)
end

function AppearanceMakeCategory(sysarg,group,page)
    group = tonumber(group)
    local cfg = LocalDT.AppearanceMakeGroups[group]
    if not cfg then return end
    page = page == nil and 1 or tonumber(page)
    if not page or page%1 ~= 0 or page < 1 or page > math.ceil(#cfg.starts/4) then return end
    local str = "\\  <(c0xFFffff00)" .. cfg.label .. "介绍：>"
        .. "\\               <(c0xFFb6946c)1." .. cfg.source .. "获得.>"
        .. "\\               <(c0xFFb6946c)2.支持背包中的堆叠道具.>"
        .. "\\               <(c0xFFb6946c)3.三个相同道具合成高一级.>\\<(idecoLine#350)>           "
    for series=1,#cfg.starts do
        str = str .. "\\                      <" .. Item.getItemName(cfg.starts[series])
            .. "合成/@AppearanceMakeList," .. group .. "," .. series .. ">"
    end
    return str
end

function AppearanceMakeList(sysarg,group,series)
    group = tonumber(group)
    local cfg = LocalDT.AppearanceMakeGroups[group]
    if not cfg then return end
    if series == nil then return AppearanceMakeCategory(sysarg,group) end
    series = tonumber(series)
    if not series or series%1 ~= 0 or series < 1 or series > #cfg.starts then return end
    local recipes = LocalDT.AppearanceMakeRecipes(group)
    local str = "\\ <(c0xFFb6946c)3个相同的" .. cfg.label .. "可合成1个高级" .. cfg.label .. "：>\\<(idecoLine#350)> \\"
    for index=(series-1)*3+1,series*3 do
        local recipe = recipes[index]
        str = str .. string.format("   %s <(c0xFFb6946c)*> <(c0xFF00ff00)3> <(c0xFFb6946c)= >%s   <合成/@AppearanceMake,%d,%d>\\",
            Item.getItemLinkMsg(recipe.itemid), Item.getItemLinkMsg(recipe.destid),group,index)
    end
    return str .. "\\\\\t\t\t<返回主页/@AppearanceMakeCategory," .. group .. "> "
end

function AppearanceMake(sysarg,group,index)
    group = tonumber(group)
    index = tonumber(index)
    local recipes = LocalDT.AppearanceMakeRecipes(group)
    local recipe = recipes and recipes[index]
    if not recipe then return end
    local bound = Actor.getItemCount(sysarg,recipe.itemid,-1,-1,1)
    local unbound = Actor.getItemCount(sysarg,recipe.itemid,-1,-1,0)
    if bound + unbound < 3 then
        Actor.sendTipmsg(sysarg,"材料不足，需要3个相同道具！",ttFlyTip)
        return
    end
    -- 优先扣绑定材料；有绑定材料参与时成品绑定，避免洗掉绑定。
    bound = math.min(bound,3)
    unbound = 3-bound
    local bind = bound > 0 and 1 or 0
    if Awards.CheckBagGridCount(sysarg,{{type=0,id=recipe.destid,count=1,bind=bind}}) ~= true then return end
    local removedBound = 0
    local removedUnbound = 0
    if bound > 0 then
        removedBound = Actor.removeItem(sysarg,recipe.itemid,bound,-1,-1,1,"外观合成",LogIds.exHeChengZhuangBei)
    end
    if removedBound == bound and unbound > 0 then
        removedUnbound = Actor.removeItem(sysarg,recipe.itemid,unbound,-1,-1,0,"外观合成",LogIds.exHeChengZhuangBei)
    end
    if removedBound == bound and removedUnbound == unbound then
        if Actor.addItem(sysarg,recipe.destid,0,0,1,bind,0,"外观合成",LogIds.exHeChengZhuangBei) == 1 then
            Actor.sendTipmsg(sysarg,"合成成功！获得"..Item.getItemName(recipe.destid),ttFlyTip)
            return AppearanceMakeList(sysarg,group,math.ceil(index/3))
        end
    end
    -- 扣除或发放失败时返还已经扣除的材料，不继续发放成品。
    if removedBound > 0 then
        Actor.addItem(sysarg,recipe.itemid,0,0,removedBound,1,0,"外观合成返还",LogIds.exHeChengZhuangBei)
    end
    if removedUnbound > 0 then
        Actor.addItem(sysarg,recipe.itemid,0,0,removedUnbound,0,0,"外观合成返还",LogIds.exHeChengZhuangBei)
    end
    Actor.sendTipmsg(sysarg,"合成失败，已返还扣除的材料。",ttFlyTip)
end
