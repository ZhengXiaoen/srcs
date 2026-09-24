--#include "data\config\ImmortalSystemConfig.lua" once


--初始化仙装个人变量信息
function InitImmortalInfo(sysarg)
    local var = Actor.getStaticVar(sysarg)
   
    if var.quenchinfo == nil then
        var.quenchinfo = {}
        for i=1,#ImmortalSystemConfig.Strong.BaseAttr do
            var.quenchinfo[i] = 0
        end
    
    end 
    return var
end


--获取仙装总等级
function GetAllImmortalLevel(sysarg)
    local var = InitImmortalInfo(sysarg)
    local nAllLevel = 0
    for i=1,#ImmortalSystemConfig.Strong.BaseAttr do
        nAllLevel = nAllLevel + var.quenchinfo[i]
    end
    return nAllLevel
end


--计算仙装属性
function ResetImmortalSystemPropertys(sysarg,calc)
    local var = InitImmortalInfo(sysarg)
    local nAllLevel = 0
    for i=1,#ImmortalSystemConfig.Strong.BaseAttr do
       
        if var.quenchinfo[i] > 0 then

            local cfg = ImmortalSystemConfig.Strong.BaseAttr[i]
            local bHave = true

            if cfg.pos > itMaxEquipPos then
                if Actor.getIntProperty(sysarg,cfg.pos) <= 0 then bHave = false end
            else
                if Item.getEquipByPos(sysarg,cfg.pos) == nil then bHave = false end   
            end
            nAllLevel = nAllLevel + var.quenchinfo[i]
           
            if bHave == true then
               local attr = cfg.Attr[var.quenchinfo[i]]
               if attr ~= nil then
               		LuaHelp.calcActorAttrs(sysarg, calc, attr)
               end
            end
        end
        
    end
    --套装属性
    if nAllLevel > 0 then
        local nLowLevel = 0
        
        if nAllLevel >= ImmortalSystemConfig.Strong.SuitAttr[#ImmortalSystemConfig.Strong.SuitAttr].level then
            nLowLevel = #ImmortalSystemConfig.Strong.SuitAttr
        else
            for i = 1,#ImmortalSystemConfig.Strong.SuitAttr do
                if nAllLevel < ImmortalSystemConfig.Strong.SuitAttr[i].level then
                    nLowLevel = i - 1
                    break
                end

                if nAllLevel == ImmortalSystemConfig.Strong.SuitAttr[i].level then
                     nLowLevel = i 
                     break;
                end
            end
        end
        
        if nLowLevel > 0 then
           
            LuaHelp.calcActorAttrs(sysarg, calc, ImmortalSystemConfig.Strong.SuitAttr[nLowLevel].attr)
            
        end

    end

end


--获取仙装系统信息
function GetImmortalSystemInfo(sysarg)
    local var = InitImmortalInfo(sysarg)
    local pack = DataPack.allocPacket(sysarg,151,100)
    DataPack.writeByte(pack,0)
    DataPack.writeByte(pack,#ImmortalSystemConfig.Strong.BaseAttr)
   

    for i = 1,#ImmortalSystemConfig.Strong.BaseAttr do
            DataPack.writeByte(pack,var.quenchinfo[i])   
    end
    DataPack.flush(pack)
    
end

--升级宝石镶嵌系统信息
function UpLevImmortalSystemInfo(sysarg,nIndex)

    nIndex = tonumber(nIndex)
   
    if nIndex <= 0 or  nIndex > #ImmortalSystemConfig.Strong.BaseAttr then
        Actor.sendTipmsg(sysarg,"非法索引 位置索引:"..nIndex,ttFlyTip) 
        return
    end
    
 
    local var = InitImmortalInfo(sysarg)
    local nLevel = var.quenchinfo[nIndex]
   
    if nLevel   >= #ImmortalSystemConfig.Strong.Consume then
        Actor.sendTipmsg(sysarg,"已达到最高等级,无法继续升级!",ttFlyTip) 
        return
    end
    local consumes = ImmortalSystemConfig.Strong.Consume[nLevel + 1]
 
    
    if  Consumes.CheckAndRemove(sysarg, consumes, LogIds.xianzhuangshengji, "仙装升级".."nIndex :"..nIndex.."l"..nLevel) ~= true then
        Actor.sendTipmsg(sysarg,"材料不足,无法继续升级!",ttFlyTip) 
		return 
    end

    var.quenchinfo[nIndex] = nLevel + 1


    if var.quenchinfo[nIndex] % 3 == 0 then
        local szTips= string.format("<(n%s)>成功将【仙装】升至%d级!<我也要去/@@showWin,263>",Actor.getName(sysarg),var.quenchinfo[nIndex] )
        System.broadcastTipmsg(szTips, ttScreenCenter+ttChatWindow)
    end
    GetImmortalSystemInfo(sysarg)
    Actor.sendTipmsg(sysarg,"升级成功!",ttFlyTip) 
    Actor.collectOperate(sysarg,0)

    local pack = DataPack.allocPacket(sysarg,151,100)
    DataPack.writeByte(pack,1)
    DataPack.flush(pack)
end