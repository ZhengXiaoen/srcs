--#include "data/config/platforms/SouGouConfigs.lua" once





function MiscExSetPlatformId(sysarg, msgid, packet,isCrossDay)
    local dVar = Actor.getDyanmicVar(sysarg)
    if dVar.platformid  ~= nil then return end 
    local nId = 0
    --if packet ~= nil then
       --nId = DataPack.readByte(packet)
    --end
   
    nId = System.getSpid()
   local cfg = nil
    if nId == 0 or dVar.platformid ~= nil then return end 
    for i = 1,table.getn(PlatformCfg) do
        if nId == PlatformCfg[i].id then
            dVar.platformid = i
            cfg = PlatformCfg[i]
            break
        end
    end
    
    if dVar.platformid == nil then dVar.platformid = 1 end --取第一个索引id
    if cfg == nil then return end
    --累计登录
    local var = Actor.getStaticVar(sysarg)
    if var.platformaward == nil then var.platformaward = {} end

    if var.platformaward[2] == nil then
        var.platformaward[2]  = {}
        var.platformaward[2].loginday = 0
        var.platformaward[2].loginmonth = 0
        var.platformaward[2].day = 0
        var.platformaward[2].award = {}
    end 
    
  
    local year,month,day = System.getDate(0,0,0)
    if var.platformaward[2].loginday ~= day or var.platformaward[2].loginmonth ~= month then 
        var.platformaward[2].loginday = day
        var.platformaward[2].loginmonth = month
        var.platformaward[2].day  = var.platformaward[2].day  + 1
    end
   

    --下发奖励状态
    SendPlatformAwardState(sysarg)
     --搜狗平台id
    --if System.getSpid() == PlatformCfg[1].id then
--    if cfg.name == "搜狗" then
--        local var = Actor.getStaticVar(sysarg)
--        if var.sougoutitle == nil then
--            var.sougoutitle = System.getCurrMiniTime()
--        end
--        --小于七天
--        if System.getCurrMiniTime() - var.sougoutitle < 604800 then
--             Actor.setTopTitle(sysarg,PlatformCfg[1].titleid,true)
--        end
--    end
end

--function testGiveAward(sysarg,type,index)
--    local dVar = Actor.getDyanmicVar(sysarg)
--    dVar.platformid = 1
--    dVar.mainvip = 10
--    local debug = {}
--    debug.type = tonumber(type)
--    debug.index = tonumber(index)
--    MiscExGivePlatformAward(sysarg,nil,nil,debug)

--end
function MiscExGivePlatformAward(sysarg, msgid, packet)
 local nActivityType = 0
    if packet ~= nil then
         nActivityType =   DataPack.readByte(packet) --活动类型
    end
   -- System.trace("呵呵:"..nActivityType)
    local dVar = Actor.getDyanmicVar(sysarg)
    if dVar.platformid == nil then return end 

    local cfg = PlatformCfg[dVar.platformid].Activity
    if nActivityType <= 0 and nActivityType > table.getn(cfg) then
        return
    end

--    if debug ~= nil then
--        nActivityType = debug.type
--    end

    --大厅新手礼包
    local var = Actor.getStaticVar(sysarg)
    if nActivityType == 1 then
        cfg = PlatformCfg[dVar.platformid].Activity[1]
        if var.platformaward[nActivityType] ~= nil then
            Actor.sendTipmsg(sysarg,"请勿重复领取",ttFlyTip)
            return
        end
        local hasBagGrid, count  = Awards.CheckBagGridCount(sysarg, cfg.Awards)
        if hasBagGrid == false then
              Actor.sendTipmsg(sysarg,"包裹空间不足!",ttFlyTip)
            return 
        end

        var.platformaward[nActivityType] = 1
        
        Awards.Give(sysarg, cfg.Awards[1],LogIds.sougouaward, "新手礼包")
         Actor.sendTipmsg(sysarg,"领取奖励成功!",ttFlyTip)
        SendPlatformAwardState(sysarg)
        return
    end
    --累积登录礼包 
    if nActivityType == 2 then
        cfg = PlatformCfg[dVar.platformid].Activity[2]
        --改为一个配置
        local awardIndex = 1
        --51的- 根据贵宾等级领取
       
        if cfg.LimitLevel ~= nil and dVar.mainvip ~= nil and System.getSpid() == 3 then
            for i=1,#cfg.LimitLevel do
                if dVar.mainvip >= cfg.LimitLevel[i][1] and dVar.mainvip <= cfg.LimitLevel[i][#cfg.LimitLevel[i]] then
                    awardIndex = i
                    
                    break
                end
            end
        end
--        if packet ~= nil then
--            awardIndex = DataPack.readByte(packet)

--        end
        if awardIndex <= 0 or  awardIndex > table.getn(cfg.Awards) then return end 
        if var.platformaward[2].award[awardIndex] ~= nil then
            Actor.sendTipmsg(sysarg,"请勿重复领取",ttFlyTip)
            return
        end

        --天数是否达标
--        if  awardIndex < var.platformaward[2].day then
--            return
--        end

        if not Awards.CheckBagGridCount(sysarg, cfg.Awards[awardIndex]) then 
             Actor.sendTipmsg(sysarg,"包裹空间不足!",ttFlyTip)
            return 
        end

        var.platformaward[2].award[awardIndex] = 1
        Awards.Give(sysarg, cfg.Awards[awardIndex],LogIds.sougouaward, "累积登录礼包")
        Actor.sendTipmsg(sysarg,"领取奖励成功!",ttFlyTip)
        SendPlatformAwardState(sysarg)
        return
    end
    --等级礼包 
    if nActivityType == 3 then
        local awardIndex= 0
        if packet ~= nil then
            awardIndex = DataPack.readByte(packet)

        end
--        if debug ~= nil then 
--            awardIndex = debug.index
--        end
         cfg = PlatformCfg[dVar.platformid].Activity[3]
         if awardIndex == 0 or awardIndex > table.getn(cfg.NeedLevel) then
            return
         end
         local nLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL) 
         local nCirc = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
         local nNeedLevel = cfg.NeedLevel[awardIndex]  % 1000
         local nNeedCirc = math.floor(cfg.NeedLevel[awardIndex] / 1000)
        
         if nNeedCirc < nCirc and nLevel < nNeedLevel then
             Actor.sendTipmsg(sysarg,"等级不足,无法领取!",ttFlyTip)
             return
         end  
          if not Awards.CheckBagGridCount(sysarg, cfg.Awards[awardIndex]) then 
             Actor.sendTipmsg(sysarg,"包裹空间不足!",ttFlyTip)
            return 
        end
        if var.platformaward[3].award[awardIndex] == 1 then
              Actor.sendTipmsg(sysarg,"请勿重复领取",ttFlyTip)
            return
        end
        var.platformaward[3].award[awardIndex] = 1
        Awards.Give(sysarg, cfg.Awards[awardIndex],LogIds.sougouaward, "等级礼包")
        Actor.sendTipmsg(sysarg,"领取奖励成功!",ttFlyTip)
        SendPlatformAwardState(sysarg)
         return
    end
    --搜狗皮肤奖励
    if nActivityType == 4 then
        if System.getSpid() == 3 then
            --51 会员称号
            if dVar.mainvip ~= nil  then
                local nIndex =  DataPack.readByte(packet)
--                if debug ~= nil then 
--                    nIndex = debug.index
--                end
                local cfg =  PlatformCfg[dVar.platformid].Activity[4]
                if nIndex > #cfg.NeedLevel or nIndex==0 then 
                    Actor.sendTipmsg(sysarg,"无效的索引!",ttFlyTip)
                    return
                end
                --是否拥有该称号
                local svar = Actor.getStaticVar(sysarg)
                if svar._headtitlecount == nil then svar._headtitlecount = 1 end
                if svar._headtitle == nil then svar._headtitle = {} end
                local headtitle = cfg.Awards[nIndex][1].id
               
               
                for i=1,svar._headtitlecount do
                    if svar._headtitle[i] == headtitle then
                         Actor.sendTipmsg(sysarg,"已拥有该称号,无法领取!",ttFlyTip)
                        return
                    end
                end
                --判断等级是否足够
                if dVar.mainvip < cfg.NeedLevel[nIndex] then
                      Actor.sendTipmsg(sysarg,"等级不足"..cfg.NeedLevel[nIndex]..",无法领取!",ttFlyTip)
                      return
                end
                svar._headtitlecount = svar._headtitlecount + 1
                svar._headtitle[svar._headtitlecount] = headtitle
                Actor.setTopTitle(sysarg, headtitle, true)
                
            end


        else
            if var.platformaward[4] == nil then var.platformaward[4]  = 0 end
            if var.platformaward[4] == 1 then
                 Actor.sendTipmsg(sysarg,"请勿重复领取",ttFlyTip)
                return
            end

            if not Awards.CheckBagGridCount(sysarg, cfg[4].Awards) then 
                 Actor.sendTipmsg(sysarg,"包裹空间不足!",ttFlyTip)
                return 
            end
            var.platformaward[4] = 1


    

            Awards.Give(sysarg, cfg[4].Awards[1],LogIds.sougouaward, "皮肤礼包")
            Actor.sendTipmsg(sysarg,"领取奖励成功!",ttFlyTip)
            
        end
        SendPlatformAwardState(sysarg)
        return
    end

    --超级会员礼包
    --[[if nActivityType == 5 then
         if var.platformaward[5] == nil then var.platformaward[5]  = 0 end
         if var.platformaward[5] == 1 then
            Actor.sendTipmsg(sysarg,"请勿重复领取",ttFlyTip)
            return
        end
        --是否达到了充值元宝数量
        local nYuanBao  =Actor.getIntProperty(sysarg,PROP_ACTOR_DRAW_YB_COUNT)
        if nYuanBao < cfg[5].NeedYuanBao then
             Actor.sendTipmsg(sysarg,"充值元宝数量不足,无法领取!",ttFlyTip)
            return
        end
         if not Awards.CheckBagGridCount(sysarg, cfg[5].Awards) then 
             Actor.sendTipmsg(sysarg,"包裹空间不足!",ttFlyTip)
            return 
        end
        var.platformaward[5] = 1
        Awards.Give(sysarg, cfg[5].Awards,11111, "超级会员礼包")
        Actor.sendTipmsg(sysarg,"领取奖励成功!",ttFlyTip)
        SendPlatformAwardState(sysarg)
    end]]--
end


function SendPlatformAwardState(sysarg)
 
    local dVar = Actor.getDyanmicVar(sysarg)
    if dVar.platformid  == nil then return end 
    local var = Actor.getStaticVar(sysarg)
    --初始化等级礼包
    
    if var.platformaward[3] == nil then
        var.platformaward[3] = {}
        var.platformaward[3].award = {}
        for i = 1,table.getn(PlatformCfg[dVar.platformid].Activity[3].NeedLevel) do
            var.platformaward[3].award[i] = 0
        end

    end
 
    local cfg = PlatformCfg[dVar.platformid].Activity
    local pack = DataPack.allocPacket(sysarg,151,32)
    --大厅新手礼包
    local nTag = 0
    if var.platformaward[1] ~= nil and var.platformaward[1] ==  1 then
        nTag = 1 
    end
    DataPack.writeByte(pack,nTag)
   
    --累积登录七天
    local award = cfg[2].Awards
    DataPack.writeByte(pack,var.platformaward[2].day)
    DataPack.writeByte(pack,table.getn(award))
  
    for i = 1,table.getn(award) do
        nTag = 1
        if var.platformaward[2].award[i] == nil then
            nTag = 0
        end
        --print("标记:"..nTag)
        DataPack.writeByte(pack,nTag)
    end
    --大厅等级礼包 
    award = PlatformCfg[dVar.platformid].Activity[3].Awards
    DataPack.writeByte(pack,table.getn(award))
    for i = 1,table.getn(award) do
        nTag = 1
        if var.platformaward[3].award[i] == nil or var.platformaward[3].award[i] == 0 then 
            nTag = 0
        end
        DataPack.writeByte(pack,nTag)
    end
   
    --皮肤奖励
    if System.getSpid() == 3 then --51平台为称号
        
        DataPack.writeByte(pack,#cfg[4].Awards)
        for i =1,#cfg[4].Awards do
            if Actor.hasTopTitle(sysarg,cfg[4].Awards[i][1].id) == true then
                DataPack.writeByte(pack,1)
                
            else
                DataPack.writeByte(pack,0)
            end
        end
        --工资
        DataPack.writeByte(pack,3)
        local var = Actor.getStaticVar(sysarg)
        if var.mainprogress == nil then var.mainprogress = {} end
        for i =1,3 do
              if var.mainprogress[i] == nil then var.mainprogress[i] = 0 end
              DataPack.writeByte(pack,var.mainprogress[i])
        end
    else --其他平台为皮肤
        
         DataPack.writeByte(pack,1)
        nTag = 1
        if var.platformaward[4] == nil then nTag = 0 end
        DataPack.writeByte(pack,nTag)

         --工资进度
        DataPack.writeByte(pack,0)
    end


  
    --nTag = 1
    --超级会员
    --if var.platformaward[5] == nil then nTag = 0 end
    --DataPack.writeByte(pack,nTag)
    DataPack.flush(pack)
end
function MiscExGetPlatformAwardState(sysarg, msgid, packet)
    SendPlatformAwardState(sysarg)
    if System.getSpid() == 3 then
         local dVar = Actor.getDyanmicVar(sysarg)
         dVar.mainvip = DataPack.readByte(packet) --51vip会员等级
         dVar.mainprograss = DataPack.readByte(packet) --工资进度
    end
end


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cSetPlatformId, MiscExSetPlatformId)--设置平台id



MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGivePlatformAward, MiscExGivePlatformAward)--领取平台奖励

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGetPlatformAwardState, MiscExGetPlatformAwardState) --获取平台奖励状态