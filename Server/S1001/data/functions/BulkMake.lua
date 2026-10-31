-- 合成页共用批量处理，沿用各自配方与绑定规则。
LocalDT.MakeRecipeBatch = function(sysarg,recipe,logId,logStr,requested,preserveBind)
    local cfg = {itemid=recipe.itemid,count=recipe.count or 3,exchangeid=recipe.destid,
        exchangecount=1,exchangebind=recipe.bind or 0,action="合成"}
    if preserveBind then
        local bound = Actor.getItemCount(sysarg,cfg.itemid,-1,-1,1)
        if bound >= cfg.count then
            cfg.inputbind = 1
            cfg.exchangebind = 1
        elseif bound > 0 then
            cfg.boundfirst = true
            cfg.exchangebind = 1
            requested = 1
        else
            cfg.inputbind = 0
            cfg.exchangebind = 0
        end
    end
    return LocalDT.EquipExchangeBatch(sysarg,cfg,logId,logStr,requested)
end

LocalDT.MakeRecipesAll = function(sysarg,recipes,logId,logStr,preserveBind,maker)
    local total = 0
    local stopped = false
    for _,recipe in ipairs(recipes) do
        while Actor.getItemCount(sysarg,recipe.itemid) >= (recipe.count or 3) do
            local times,success
            if maker then
                times,success = maker(sysarg,recipe)
            else
                times,success = LocalDT.MakeRecipeBatch(sysarg,recipe,logId,logStr,nil,preserveBind)
            end
            if not success then
                stopped = true
                break
            end
            total = total+times
        end
        if stopped then break end
    end
    if total > 0 then
        Actor.sendTipmsg(sysarg,string.format("一键合成成功，共合成%d件！",total),ttFlyTip)
    elseif not stopped then
        Actor.sendTipmsg(sysarg,"材料不足,无法合成!",ttFlyTip)
    end
    return total
end

LocalDT.ImmortalMakeOne = function(sysarg,recipe)
    if not Actor.checkConsume(sysarg,5,0,recipe.needmoney) then
        Actor.sendTipmsg(sysarg,"绑定金币/金币不足，无法继续合成！",ttFlyTip)
        return 0,false
    end
    local boundBefore = Actor.getMoneyCount(sysarg,mtBindCoin)
    local coinBefore = Actor.getMoneyCount(sysarg,mtCoin)
    local paid = Actor.removeConsume(sysarg,5,0,recipe.needmoney,0,0,0,0,LogIds.xianzhuanghecheng,"仙装合成")
    local times,success = 0,false
    if paid == true or paid == recipe.needmoney then
        times,success = LocalDT.MakeRecipeBatch(sysarg,recipe,LogIds.xianzhuanghecheng,"仙装合成",1)
        if success then return times,true end
    else
        Actor.sendTipmsg(sysarg,"金币扣除失败，无法继续合成！",ttFlyTip)
    end
    -- 扣料、发放或金币扣除失败时，分别返还实际扣除的绑金及金币。
    local refunded = true
    local delta = boundBefore-Actor.getMoneyCount(sysarg,mtBindCoin)
    if delta > 0 then
        refunded = Actor.changeMoney(sysarg,mtBindCoin,delta,LogIds.xianzhuanghecheng,"仙装合成返还") ~= false
    end
    delta = coinBefore-Actor.getMoneyCount(sysarg,mtCoin)
    if delta > 0 then
        refunded = Actor.changeMoney(sysarg,mtCoin,delta,LogIds.xianzhuanghecheng,"仙装合成返还") ~= false and refunded
    end
    if not refunded then
        Actor.sendTipmsg(sysarg,"金币返还异常，请联系管理员。",ttFlyTip)
    end
    return 0,false
end
