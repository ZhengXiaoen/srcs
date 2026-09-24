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


function handExChangeThor(sysarg)
	--print("1111111")
   
   return handExChangeThorPage(sysarg,1)
end


function handExChangeThorPage(sysarg,nPage)
   
    nPage = tonumber(nPage)
    
    if nPage < 1 or nPage > #ThorExchangeCfg then return end
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
    
    str = str.."<(idecoLine#350)>\\ <(c0xFF00c0ff)雷神装备、仙力>\\     <(c0xFFffff00)1.将在探索宝藏和个人竞技中产出>"
    return str


end

function handExChangeThorItem(sysarg,nPage,nIndex)
    
    nPage = tonumber(nPage)
    nIndex = tonumber(nIndex)
	print("nPage="..nPage)
    print("nIndex="..nIndex)
	
    if nPage < 1 or nPage > #ThorExchangeCfg then return end
    local cfg = ThorExchangeCfg[nPage].exchange
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
   Actor.removeItem(sysarg,cfg.itemid,cfg.count,-1,-1,-1,"雷神装备兑换",LogIds.Thorequipexchange)

   Actor.addItem(sysarg,cfg.exchangeid,0,0,cfg.exchangecount,cfg.exchangebind,0,"雷神装备兑换",LogIds.Thorequipexchange)
   Actor.sendTipmsg(sysarg,"兑换成功",ttFlyTip)
   return handExChangeThorPage(sysarg,nPage)
end