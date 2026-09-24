--#include "data\config\BlueVipConfig.lua" once

function BlueVipPlayerCross(sysarg)
    local var = InitBlueVipPlayerInfo(sysarg)
    var.bluevip.everyday = {}  --每日礼包清空
    var.bluevip.login = 0
    var.bluevip.awarylogin = var.bluevip.awarylogin + 1
    if var.bluevip.awarylogin > #BlueVipConfig.AlwayLogin then
        var.bluevip.awarylogin = 1 
    end
    var.bluevip.awaryloginex  = 0

end

function InitBlueVipPlayerInfo(sysarg)
    local var = Actor.getStaticVar(sysarg)
    if var.bluevip == nil then
        var.bluevip = {}
        var.bluevip.newgift = 0
        var.bluevip.everyday = {}
        for i = 1,#BlueVipConfig.EveryDayGift do
           var.bluevip.everyday[i] = 0
        end
        var.bluevip.level ={}
        for i = 1,#BlueVipConfig.LevelGift do
            var.bluevip.level[i] = 0
        end
        var.bluevip.login = 0 --每日登录奖励

        var.bluevip.awarylogin = 0 --持续登录天数
        var.bluevip.awaryloginex = 0 --持续登录奖励
    end
    return var
end
 --领取奖励
function BlueVipPlayerGive(sysarg,packet)
    local nType = DataPack.readByte(packet)
    local var = InitBlueVipPlayerInfo(sysarg)
    local dVar = Actor.getDyanmicVar(sysarg)
    if dVar.bluevip == nil then 
        Actor.sendTipmsg(sysarg,"您不是蓝钻，无法领取。",ttFlyTip)
        return

     end
    
    if nType == 1 then --新手礼包
       local bCant = false
        if dVar.bluevip.level > 0 or dVar.bluevip.year > 0 or dVar.bluevip.luxury > 0 or dVar.bluevip.super > 0 then
            bCant = true
        end
        if bCant == false then
            Actor.sendTipmsg(sysarg,"不是蓝钻用户,无法领取!",ttFlyTip)
            return
        end
        if var.bluevip.newgift == 1 then  
             Actor.sendTipmsg(sysarg,"已经领取过了，无法再次领取",ttFlyTip)
            return
        end

        if Awards.CheckBagGridCount(sysarg,BlueVipConfig.NewGift) then
			Awards.Give(sysarg,BlueVipConfig.NewGift,LogIds.bluevip,"新手礼包")
            var.bluevip.newgift = 1
            Actor.sendTipmsg(sysarg,"领取成功",ttFlyTip)
        else
            Actor.sendTipmsg(sysarg,"包裹空间不够,请清理包裹!",ttFlyTip)
            return
		end
    elseif nType == 2 then --每日礼包
        local nIndex = DataPack.readByte(packet)
       
        if nIndex > #BlueVipConfig.EveryDayGift and nIndex <= 0 then return end
        
        local cfg = BlueVipConfig.EveryDayGift[nIndex]

        if var.bluevip.everyday[nIndex] == 1 then 
            Actor.sendTipmsg(sysarg,"已经领取过了，无法再次领取",ttFlyTip)
            return
        end
        if cfg.vipType == 2 then
            if dVar.bluevip.year <= 0 then
                Actor.sendTipmsg(sysarg,"您不是年费蓝钻,无法领取!",ttFlyTip)
                return
            end
        elseif cfg.vipType == 1 then
             if dVar.bluevip.luxury <= 0 then
                Actor.sendTipmsg(sysarg,"您不是豪华蓝钻,无法领取!",ttFlyTip)
                return
            end
        elseif cfg.vipType == 0 then

            if dVar.bluevip.level <= 0 then
                 Actor.sendTipmsg(sysarg,"您不是蓝钻,无法领取!",ttFlyTip)
                return
            end
        end  
        local award = nil
        if nIndex == 1 then
            award = cfg.award[dVar.bluevip.level]
        else
            award = cfg.award[1]
        end
        if Awards.CheckBagGridCount(sysarg,award) then
			Awards.Give(sysarg,award,LogIds.bluevip,"每日礼包"..nIndex)
            var.bluevip.everyday[nIndex] = 1
            Actor.sendTipmsg(sysarg,"领取成功",ttFlyTip)
        else
            Actor.sendTipmsg(sysarg,"包裹空间不够,请清理包裹!",ttFlyTip)
            return
        end
    
   elseif nType == 3 then --等级礼包
        local bCant = false
        if dVar.bluevip.level > 0 or dVar.bluevip.year > 0 or dVar.bluevip.luxury > 0 or dVar.bluevip.super > 0 then
            bCant = true
        end
        if bCant == false then
            Actor.sendTipmsg(sysarg,"不是蓝钻用户,无法领取!",ttFlyTip)
            return
        end
     
        local nIndex = DataPack.readByte(packet)
        if nIndex <= 0 and nIndex > #BlueVipConfig.LevelGift then return end
        if var.bluevip.level[nIndex] == 1 then
            Actor.sendTipmsg(sysarg,"已经领取过了，无法再次领取",ttFlyTip)
            return
        end
       
        local cfg = BlueVipConfig.LevelGift[nIndex]
        local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
        local nCirle =Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
        local nValue = nCirle * 1000 + nLevel
        if nValue < cfg.level then
             Actor.sendTipmsg(sysarg,"等级不足无法领取!",ttFlyTip)
            return
        end
       if Awards.CheckBagGridCount(sysarg,cfg.award) then
			Awards.Give(sysarg,cfg.award,LogIds.bluevip,"等级礼包"..nIndex)
            var.bluevip.level[nIndex] = 1
            Actor.sendTipmsg(sysarg,"领取成功",ttFlyTip)
        else
            Actor.sendTipmsg(sysarg,"包裹空间不够,请清理包裹!",ttFlyTip)
            return
        end
    elseif nType == 4 then --每日登录奖励
        if var.bluevip.login == 1 then
            Actor.sendTipmsg(sysarg,"已经领取过了，无法再次领取",ttFlyTip)
            return
        end
        --local cfg = BlueVipConfig.EveryDayLogin
        if Awards.CheckBagGridCount(sysarg,BlueVipConfig.EveryDayLogin) then
			Awards.Give(sysarg,BlueVipConfig.EveryDayLogin,LogIds.bluevip,"每日登录")
 
            Actor.sendTipmsg(sysarg,"领取成功",ttFlyTip)
        else
            Actor.sendTipmsg(sysarg,"包裹空间不够,请清理包裹!",ttFlyTip)
            return
        end
        var.bluevip.login = 1
    elseif nType == 5 then --持续登录奖励
       
        if var.bluevip.awaryloginex == 1 then
             Actor.sendTipmsg(sysarg,"已经领取过了，无法再次领取",ttFlyTip)
            return
        end
        local award = BlueVipConfig.AlwayLogin[var.bluevip.awarylogin]
        if Awards.CheckBagGridCount(sysarg,award) then
			Awards.Give(sysarg,award,LogIds.bluevip,"持续登录")
            
            Actor.sendTipmsg(sysarg,"领取成功",ttFlyTip)
        else
            Actor.sendTipmsg(sysarg,"包裹空间不够,请清理包裹!",ttFlyTip)
            return
        end     
        var.bluevip.awaryloginex = 1 
    end

    BlueVipPlayerGetInfo(sysarg)
end
function BlueVipPlayerGetInfo(sysarg)
    local var = InitBlueVipPlayerInfo(sysarg)
    local pack = DataPack.allocPacket(sysarg,151,80)
    DataPack.writeByte(pack,var.bluevip.newgift) --新手礼包领取标识
    DataPack.writeByte(pack,#BlueVipConfig.EveryDayGift) --每日礼包
    for i = 1,#BlueVipConfig.EveryDayGift do
           DataPack.writeByte(pack,var.bluevip.everyday[i])
    end
    DataPack.writeByte(pack,#BlueVipConfig.LevelGift) --等级礼包
    for i = 1,#BlueVipConfig.LevelGift do
            DataPack.writeByte(pack,var.bluevip.level[i])
    end
    DataPack.writeByte(pack,var.bluevip.login) --每日登录奖励
    DataPack.writeByte(pack,var.bluevip.awarylogin) --持续登录天数
    DataPack.writeByte(pack,var.bluevip.awaryloginex) --持续登录奖励是否已领取

    DataPack.flush(pack)
    
end
function BlueVipNetProcess(sysarg, sysid, packet)
    local nType = DataPack.readByte(packet)
   -- print("BlueVipNetProcess"..nType)
    if nType == 0 then --设置蓝钻信息
        local dVar = Actor.getDyanmicVar(sysarg)
        dVar.bluevip = {}
        dVar.bluevip.level = DataPack.readByte(packet)
        dVar.bluevip.year = DataPack.readByte(packet)
        dVar.bluevip.luxury = DataPack.readByte(packet)
        dVar.bluevip.super = DataPack.readByte(packet)
        --System.trace("level:"..dVar.bluevip.level.."年费:"..dVar.bluevip.year.."豪华:"..dVar.bluevip.luxury )
        local nValue = 0
        nValue = System.setIntByte(nValue,0,dVar.bluevip.level)
        nValue = System.setIntByte(nValue,1,dVar.bluevip.year)
        nValue = System.setIntByte(nValue,2,dVar.bluevip.luxury)
        nValue = System.setIntByte(nValue,3,dVar.bluevip.super)
       -- Actor.setIntProperty(sysarg,PROP_TELNEL_VIPLEVEL,nValue )
        Actor.setBlueVipInfo(sysarg,nValue)
    elseif nType == 1 then --获取蓝钻信息
      
        BlueVipPlayerGetInfo(sysarg)
    elseif nType == 2 then --领取蓝钻奖励
        BlueVipPlayerGive(sysarg,packet)

    end


end