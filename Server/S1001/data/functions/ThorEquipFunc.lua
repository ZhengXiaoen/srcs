--雷神装备函数实现
 ThorExchangeCfg= 
    {
        {
            name =  "装备兑换仙力",
            exchange= 
            {
                --itemid=兑换前的装备 count=兑换前的装备数量 exchangeid=兑换后的道具 exchangecount=兑换后的道具数量 exchangebind=兑换后的道具是否绑定
{itemid=7078,count=1,exchangeid=7151,exchangecount=160,exchangebind=1,}, --武器
{itemid=7079,count=1,exchangeid=7151,exchangecount=120,exchangebind=1,}, --衣服
{itemid=7080,count=1,exchangeid=7151,exchangecount=80,exchangebind=1,}, --头盔
{itemid=7081,count=1,exchangeid=7151,exchangecount=80,exchangebind=1,}, --项链
{itemid=7082,count=1,exchangeid=7151,exchangecount=80,exchangebind=1,}, --戒指
{itemid=7083,count=1,exchangeid=7151,exchangecount=80,exchangebind=1,}, --手镯
{itemid=7084,count=1,exchangeid=7151,exchangecount=80,exchangebind=1,}, --腰带
{itemid=7085,count=1,exchangeid=7151,exchangecount=80,exchangebind=1,}, --靴子


               -- {itemid=(a1),count=(a2),exchangeid=(a3),exchangecount=(a4),exchangebind=(a5),}, --(a6)
            }
        },
    };


-- 两种装备共用批量兑换；单次物品数量不超过服务器的 16 位接口范围。
LocalDT.EquipExchangeBagFits = function(sysarg,cfg,times,available)
    local fits,need = Awards.CheckBagGridCount(sysarg,{{type=0,id=cfg.exchangeid,
        count=times*cfg.exchangecount,bind=cfg.exchangebind}},true)
    -- 全部扣完该材料至少释放一格，满背包时也允许利用这格兑换。
    return fits == true or (times*cfg.count == available and need <= Item.getBagEmptyGridCount(sysarg)+1)
end

LocalDT.EquipExchangeBatch = function(sysarg,cfg,logId,logStr,requested)
    local available = Actor.getItemCount(sysarg,cfg.itemid)
    local times = math.min(math.floor(available/cfg.count),requested or math.huge,
        math.floor(65535/cfg.count),math.floor(65535/cfg.exchangecount))
    if times < 1 then return 0,false end
    if not LocalDT.EquipExchangeBagFits(sysarg,cfg,times,available) then
        local low,high = 0,times-1
        while low < high do
            local middle = math.floor((low+high+1)/2)
            if LocalDT.EquipExchangeBagFits(sysarg,cfg,middle,available) then
                low = middle
            else
                high = middle-1
            end
        end
        times = low
        if times < 1 then
            Actor.sendTipmsg(sysarg,"包裹空间不足!",ttFlyTip)
            return 0,false
        end
    end
    local bound = Actor.getItemCount(sysarg,cfg.itemid,-1,-1,1)
    local removed = Actor.removeItem(sysarg,cfg.itemid,times*cfg.count,-1,-1,-1,logStr,logId)
    local given = 0
    if removed == times*cfg.count then
        given = Actor.addItem(sysarg,cfg.exchangeid,0,0,times*cfg.exchangecount,cfg.exchangebind,0,logStr,logId)
        if given == times*cfg.exchangecount then return times,true end
    end
    -- 发放失败时撤回已发部分，再按材料原绑定状态返还，避免重复奖励。
    if given > 0 and Actor.removeItem(sysarg,cfg.exchangeid,given,-1,-1,cfg.exchangebind,logStr.."撤回",logId) ~= given then
        Actor.sendTipmsg(sysarg,"兑换失败，奖励撤回异常，请联系管理员。",ttFlyTip)
        return 0,false
    end
    local returned = 0
    if removed > 0 then
        local removedBound = math.min(removed,math.max(0,bound-Actor.getItemCount(sysarg,cfg.itemid,-1,-1,1)))
        if removedBound > 0 then
            returned = returned+Actor.addItem(sysarg,cfg.itemid,0,0,removedBound,1,0,logStr.."返还",logId)
        end
        if removed > removedBound then
            returned = returned+Actor.addItem(sysarg,cfg.itemid,0,0,removed-removedBound,0,0,logStr.."返还",logId)
        end
    end
    if returned == removed then
        Actor.sendTipmsg(sysarg,"兑换失败，已返还扣除的材料。",ttFlyTip)
    else
        Actor.sendTipmsg(sysarg,"兑换失败，材料返还异常，请联系管理员。",ttFlyTip)
    end
    return 0,false
end

LocalDT.EquipExchangeAll = function(sysarg,recipes,logId,logStr)
    local total,rewards = 0,0
    local stopped = false
    for _,cfg in ipairs(recipes) do
        while Actor.getItemCount(sysarg,cfg.itemid) >= cfg.count do
            local times,success = LocalDT.EquipExchangeBatch(sysarg,cfg,logId,logStr)
            if not success then
                stopped = true
                break
            end
            total = total+times*cfg.count
            rewards = rewards+times*cfg.exchangecount
        end
        if stopped then break end
    end
    if total > 0 then
        Actor.sendTipmsg(sysarg,string.format("一键兑换成功，共兑换%d件，获得%s×%d！",
            total,Item.getItemLinkMsg(recipes[1].exchangeid),rewards),ttFlyTip)
    elseif not stopped then
        Actor.sendTipmsg(sysarg,"没有可兑换的装备!",ttFlyTip)
    end
end

function handExChangeThor(sysarg)
	--print("1111111")
   
   return handExChangeThorPage(sysarg,1)
end


function handExChangeThorPage(sysarg,nPage)
   
    nPage = tonumber(nPage)
    
    if not nPage or nPage%1 ~= 0 or nPage < 1 or nPage > #ThorExchangeCfg then return end
    local str = "\\         <(c0xFF00c0ff)雷神装备用于激活/突破部位,仙力用于升级部位等级>\\<(idecoLine#350)>\\\\\\        "
    
    local cfg = ThorExchangeCfg[nPage].exchange
    for i=1,#cfg do
        str = str..string.format("%s<(c0xFFb6946c)*%d → >%s<(c0xFFb6946c)*%d>",Item.getItemLinkMsg(cfg[i].itemid),cfg[i].count,Item.getItemLinkMsg(cfg[i].exchangeid),cfg[i].exchangecount)
        local nCount = math.floor(Actor.getItemCount(sysarg,cfg[i].itemid) / cfg[i].count)
      
        if nCount > 0   then
            str = str..string.format("    <#c0xFF15EA40#兑换(%d)/@handExChangeThorItem,%d,%d>",nCount ,nPage,i)
        else
            str = str.."    <(c0xFF888888)兑换(0)>"
        end
        str = str .."\\        "
    end
--    if nPage == 1 then
--        --str =str.."\\\\                    <#c0xFF15EA40#宝钻兑换雷神装备/@handExChangeThorPage,2>".."\\"
--    else
--        str =str.."\\\\                    <#c0xFF15EA40#雷神装备兑换宝钻/@handExChangeThorPage,1>".."\\"
--    end
    
    str = str.."              <#c0xFF15EA40#一键兑换/@handExChangeThorAll,1>\\        "
    str = str.."<(idecoLine#350)>\\ <(c0xFF00c0ff)雷神装备、仙力>\\     <(c0xFFffff00)1.将在探索宝藏和个人竞技中产出>"
    return str


end

function handExChangeThorItem(sysarg,nPage,nIndex)
    
    nPage = tonumber(nPage)
    nIndex = tonumber(nIndex)
    if not nPage or nPage%1 ~= 0 or nPage < 1 or nPage > #ThorExchangeCfg then return end
    local cfg = ThorExchangeCfg[nPage].exchange
    if not nIndex or nIndex%1 ~= 0 or nIndex < 1 or nIndex > #cfg then
        return
    end
   
    cfg = cfg[nIndex]
  
    if Actor.getItemCount(sysarg,cfg.itemid) < cfg.count then
        
        return
    end
   local times,success = LocalDT.EquipExchangeBatch(sysarg,cfg,LogIds.Thorequipexchange,"雷神装备兑换",1)
   if not success then return handExChangeThorPage(sysarg,nPage) end
   Actor.sendTipmsg(sysarg,"兑换成功",ttFlyTip)
   return handExChangeThorPage(sysarg,nPage)
end

function handExChangeThorAll(sysarg,nPage)
    if tonumber(nPage) ~= 1 then return end
    LocalDT.EquipExchangeAll(sysarg,ThorExchangeCfg[1].exchange,LogIds.Thorequipexchange,"雷神装备兑换")
    return handExChangeThorPage(sysarg,1)
end
