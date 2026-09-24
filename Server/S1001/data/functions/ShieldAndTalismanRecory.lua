--护盾和护符自动回收
ShieldAndTalismanRecoryCfg =
{
    title = "护盾护符碎片",
    recory = 
    {
        { item_id = 531, value = 2, 	pr = 124, str = "护符碎片", staticId = 0},	--1级护符碎片   
	    { item_id = 532, value = 5, 	pr = 124, str = "护符碎片", staticId = 0},	--2级护符碎片   
	    { item_id = 533, value = 10,  	pr = 124, str = "护符碎片", staticId = 0},	--3级护符碎片   
	    { item_id = 534, value = 100,  	pr = 124, str = "护符碎片", staticId = 57},	--护符碎片包(小)
	    { item_id = 535, value = 1000, 	pr = 124, str = "护符碎片", staticId = 58},	--护符碎片包(中)
	    { item_id = 536, value = 10000, pr = 124, str = "护符碎片", staticId = 58},	--护符碎片包(大)
        { item_id = 565, value = 2,	pr = 126, str = "护盾碎片",logid=2697},	--1级护盾碎片   
	    { item_id = 566, value = 5,	pr = 126, str = "护盾碎片",logid=2697},	--2级护盾碎片   
	    { item_id = 567, value = 10,	pr = 126, str = "护盾碎片",logid=2697},	--3级护盾碎片   
	    { item_id = 568, value = 100,	pr = 126, str = "护盾碎片",logid=2697},	--护盾碎片包(小)
	    { item_id = 569, value = 1000,	pr = 126, str = "护盾碎片",logid=2697},	--护盾碎片包(中)
	    { item_id = 570, value = 10000,	pr = 126, str = "护盾碎片",logid=2697},	--护盾碎片包(大)
        { item_id = 549, value = 1,	pr = 126, str = "护盾碎片",logid=2697},	--江湖万事通
    }
}
function showShieldAndTalismanAutoRecoryTips(sysarg,nType)
    local var = Actor.getStaticVar(sysarg)
    local szEntel = "<未开启>"
    if var.autorecoyhufu ~= nil then
        szEntel = "<(c0xFF00FF00)已开启>"
    end
    local str = "  <#c0xFFFFFF00#自动回收%s/@onAutoRecoryTalisman,%s>%s "
    str = string.format(str,ShieldAndTalismanRecoryCfg.title,nType,szEntel)
    return str

end

function onAutoRecoryTalisman(sysarg,nType)
    nType = tonumber(nType)
    local var = Actor.getStaticVar(sysarg)
    if var.autorecoyhufu ~= nil then
        var.autorecoyhufu = nil
    else
        var.autorecoyhufu = 1
    end
    if nType == 1 then
        return onVipAutomaticHs(sysarg)
    end  
end
--nType 1.vip回收  2.包裹装备回收 3.装备回收npc 4.定时器自动回收
function showShieldAndTalismanRecoryTips(sysarg,nType)

    local str = ""
   
    local nCount = 0
    local cfgEx = {}
    for i = 1,#ShieldAndTalismanRecoryCfg.recory do
        local cfg = ShieldAndTalismanRecoryCfg.recory[i]
        if cfgEx[cfg.pr] == nil then
            cfgEx[cfg.pr] = 0
        end
        local nItemCount = Actor.getItemCount(sysarg,cfg.item_id)
        cfgEx[cfg.pr] = cfgEx[cfg.pr] + nItemCount * cfg.value
        nCount = nCount + nItemCount
    end
    if nCount == 0 then
        return "<#c0xFF888888#"..ShieldAndTalismanRecoryCfg.title.. "(0)/@onShieldAndTalismanRecory,0|&55BBFF&当前包裹内没有此类道具回收>"
    end
    local szTips = "点击回收可获得:#"
    local szStr = ""
    for k, v in pairs(cfgEx) do
        if k == 126 then
            szStr = "护盾碎片:"
        elseif k == 124 then
            szStr = "护符碎片:"
        end
        szStr =szStr.." "..v
        szTips = szTips..szStr.."#"
    end
 
    str  = "<<showEff"..ShieldAndTalismanRecoryCfg.title.. "("..nCount..")>/@onShieldAndTalismanRecory,1,"..nType.."|&55BBFF&"..szTips..">"
    return str


end

function onShieldAndTalismanRecory(sysarg,nTag,nType)
    
    if tonumber(nTag) == 0 then 
        Actor.sendTipmsg(sysarg,"当前包裹没有护符护盾碎片回收!",ttFlyTip)
        return 
    end
    nType = tonumber(nType)
    local str = ""
   
    local nCount = 0
    local cfgEx = {}
    for i = 1,#ShieldAndTalismanRecoryCfg.recory do
        local cfg = ShieldAndTalismanRecoryCfg.recory[i]
        if cfgEx[cfg.pr] == nil then
            cfgEx[cfg.pr] = 0
        end
        local nItemCount = Actor.getItemCount(sysarg,cfg.item_id)
        if nItemCount > 0 then
            Actor.removeItem(sysarg,cfg.item_id,nItemCount,-1, -1, -1, "回收")
        end
        cfgEx[cfg.pr] = cfgEx[cfg.pr] + nItemCount * cfg.value
        nCount = nCount + nItemCount
    end
    if nCount <= 0 then return end
    if nType == 1 then
        str = "<VIP>"
    end
    if nCount > 0 then
        str =str.."回收<%s>个<%s>获得:"
        str = string.format(str,nCount,ShieldAndTalismanRecoryCfg.title)
        for k, v in pairs(cfgEx) do
            if k == 126 then
            szStr = "护盾碎片:"
            elseif k == 124 then
            szStr = "护符碎片:"
            end
            szStr =szStr.." "..v
            str = str.." "..szStr
            local nValue = Actor.getIntProperty(sysarg,k)
            Actor.setIntProperty(sysarg,k,v + nValue)
        end
    end
    Actor.sendTipmsg(sysarg,str,ttFlyTip)
    if nType == 1 then
        return VipRecoveryInit(sysarg)
    end
end