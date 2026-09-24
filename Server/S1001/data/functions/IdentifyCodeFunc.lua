IdentifyCodeConfig = 
{
    Enable = false,        -- 是否启用验证码系统
    BossCount = 50,         --第一次击杀了多少BOSS弹出验证码
    BossLevel = 80,     --boss等级达到多少才记录
    BossTwoCount = 12,   --除去第一次后击杀多少BOSS弹验证码
    Time = 1000 * 60 * 3,   --踢下去的时间 /毫秒
    Count = 3,  --超出验证码答案错误数量 踢下去
    ChangeCodeTime  = 1000 * 60 * 1,    --更换验证码的时间
    award = 
   {
                { type = 0, id = 0, count = 100000, bind = 0,str="绑定金币" },
				{ type = 126, id = 0, count = 2000, bind = 0 ,str="护盾碎片"},
                { type = 124, id = 0, count = 2000, bind = 0,str="护符碎片", },
				{ type = 125, id = 0, count = 100, bind = 0,str="宝石结晶", },
                { type = 127, id = 0, count = 100, bind = 0,str="圣珠结晶", },
   },


}

local function IsIdentifyCodeEnabled()
    return IdentifyCodeConfig.Enable == true
end

--设置验证码奖励
function sa(sysarg,name,hudun,hufu,baoshi,shengzhu)
    local pActor = Actor.getActorByName(name)
    hudun= tonumber(hudun)
    hufu = tonumber(hufu)
    baoshi = tonumber(baoshi)
    shengzhu = tonumber(shengzhu)
    if pActor ~= nil then   
        local name ={126,124,125,127}
        local value= {hudun,hufu,baoshi,shengzhu}

        for i = 1,#name do
            local nValue = Actor.getIntProperty(pActor,name[i])
            nValue = nValue + value[i]
            Actor.setIntProperty(pActor,name[i],nValue)
        end
        Actor.sendTipmsg(sysarg,"成功!",ttFlyTip)
        return
    end
    Actor.sendTipmsg(sysarg,"未找到该用户!",ttFlyTip)
end
function IdentifyCodePlayerLogin(sysarg)
    if IsIdentifyCodeEnabled() == false then
        removeIdentifyCodeState(sysarg)
        return
    end
    local var = Actor.getStaticVar(sysarg)
    if var.identifystate ~= nil then
        addIdentifyCodeState(sysarg)
    end
    
end

function IdentifyCodePlayerLogout(sysarg)
  
end
function removeIdentifyCodeState(sysarg)
    local var = Actor.getStaticVar(sysarg)
    if var == nil then return end
    var.killbosscount = nil
    var.identifystate = nil 
    var.identifyindex=  nil
    Actor.deleteTimer(sysarg,57)
   

    
    local pack = DataPack.allocPacket(sysarg,151,86)
    DataPack.flush(pack)
    local nActorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)

    local dvar = Actor.getDyanmicVar(sysarg)
    dvar.code= nil
     dvar.strcode = nil
 
end

function createIdentifyCode(sysarg)

    if IsIdentifyCodeEnabled() == false then
        removeIdentifyCodeState(sysarg)
        return false
    end


    local bRet = true
    local dVar = Actor.getDyanmicVar(sysarg)
        --通知客户端弹出验证码
    local pack = DataPack.allocPacket(sysarg,151,85)
    local strcode = DataPack.writeCaptcha(pack)
    if strcode ~= nil then
        dVar.strcode = string.lower(strcode)
    else
        DataPack.writeInt(pack,0)
        bRet = false
    end
   
    DataPack.flush(pack)
    return bRet
end
function addIdentifyCodeState(sysarg)
    if IsIdentifyCodeEnabled() == false then
        removeIdentifyCodeState(sysarg)
        return
    end
    local var = Actor.getStaticVar(sysarg)
    
    --加入禁止移动状态 与晕眩状态
    if createIdentifyCode(sysarg) == true then
        --加入定时器
        local nTime = IdentifyCodeConfig.Time;
        Actor.deleteTimer(sysarg,57)
        Actor.addTimer(sysarg,57,nTime)   
        var.identifystate = 1
    end

end


--当日不弹框
function removeIdentifyCodeDay(arg)
  
    local pActor =Actor.getActorByName(arg[1])
    if pActor == nil then return false end
   
    local var = Actor.getStaticVar(pActor)
    if var.days == nil then var.days = {} end
    var.days.code = 999
    return true
end
--验证码
function addKillBossCount(sysarg,monsterPtr,nCount)
    if IsIdentifyCodeEnabled() == false then
        removeIdentifyCodeState(sysarg)
        return
    end
    if nCount == nil then nCount = 1 end
    nCount = tonumber(nCount)

    --boss召唤卷轴召唤出来的boss 不弹验证码
    if Actor.getIntProperty(monsterPtr,PROP_ENTITY_ICON) == 11111 then
        return
    end
    local monLevel = Actor.getIntProperty(monsterPtr,PROP_CREATURE_LEVEL)
  
    if monLevel < IdentifyCodeConfig.BossLevel then
        return
    end
    local var = Actor.getStaticVar(sysarg)
    if var.killbosscount == nil then var.killbosscount = 0 end
    var.killbosscount = var.killbosscount + nCount 
    if var.days.killbosscount == nil then var.days.killbosscount = 0 end
    var.days.killbosscount = var.days.killbosscount + nCount
    local MAXBOSSCOUNT = IdentifyCodeConfig.BossCount
    if var.days.code ==1 then
        MAXBOSSCOUNT = IdentifyCodeConfig.BossTwoCount
    end
    if var.days.code == 999 then 
        var.killbosscount = nil
        return 
    end
    if Actor.existTimer(sysarg,57) then return end --不允许重置验证码定时器
    if var.killbosscount >= MAXBOSSCOUNT  then
        System.sendCommonLog(LogIds.killbosscount,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),var.days.killbosscount,0,0,"当前数量:"..var.killbosscount)
        
        addIdentifyCodeState(sysarg)
        if var.days == nil then var.days = {} end
        if MAXBOSSCOUNT == IdentifyCodeConfig.BossCount then
            var.days.code = 1
        end
        
    end
 
end


function IdentifyCodeCheck(sysarg, msgid, packet)
    if IsIdentifyCodeEnabled() == false then
        removeIdentifyCodeState(sysarg)
        return
    end
    local var = Actor.getStaticVar(sysarg)
    if var.identifystate == nil then
        IdentifyCodeTimerFunc(sysarg)
        return
    end
    local dVar = Actor.getDyanmicVar(sysarg)
    local nType = DataPack.readByte(packet)
    if nType == 1 then
        if dVar.identitime == nil then dVar.identitime =System.getCurrMiniTime() end
        if System.getCurrMiniTime() >= dVar.identitime then
            createIdentifyCode(sysarg)
            dVar.identitime = System.getCurrMiniTime() + 3
        else
            Actor.sendTipmsg(sysarg,"正在冷却中,请稍候再试!",ttFlyTip)
        end
        
        return
    end
    
    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    if dVar.strcode == nil then removeIdentifyCodeState(sysarg) return end

    szValue = DataPack.readString(packet)
    szValue = string.lower(szValue)
    if dVar.strcode == szValue then
        removeIdentifyCodeState(sysarg)
        --给予奖励
        local nIndex = System.getRandomNumber(#IdentifyCodeConfig.award) + 1
        local cfg = IdentifyCodeConfig.award[nIndex]
        local str = string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", cfg.str, cfg.count)
        if cfg.type == 0 then
            Actor.changeMoney(sysarg,mtBindCoin,cfg.count,LogIds.identifycode,"验证码"..nIndex)
        else
            local nValue = Actor.getIntProperty(sysarg,cfg.type)
            local newValue = cfg.count + nValue
            Actor.setIntProperty(sysarg,cfg.type,newValue)
            System.sendCommonLog(LogIds.identifycode,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),nValue,newValue,cfg.type,"")
        end
        Actor.sendTipmsg(sysarg,str,1)
        return
    else
        if var.identifyindex == nil then var.identifyindex = 0 end
        var.identifyindex = var.identifyindex + 1
        if var.identifyindex >= IdentifyCodeConfig.Count then
            var.identifyindex = nil
            IdentifyCodeTimerFunc(sysarg)
            return
        end
        Actor.sendTipmsg(sysarg,"验证码错误!",ttFlyTip)
    end
end
function IdentifyCodeTimerFunc(sysarg)
    if IsIdentifyCodeEnabled() == false then
        removeIdentifyCodeState(sysarg)
        return
    end
   
  
    Actor.killActor(sysarg)  
end