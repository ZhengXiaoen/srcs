--老兵召回实现
--@author 后天

--#include "data\config\OldPlayerReturnCfg.lua" once




--开启老兵回归活动
--function t(nStartYear,nStartMonth,nStartDay,nStartHour,nStartMin,nEndYear,nEndMonth,nEndDay,nEndHour,nEndMin)
--    local sys = System.getStaticVar()
--    
--    sys.oldplayer = {}
--    sys.oldplayer.starttime = System.encodeNumTime(nStartYear,nStartMonth,nStartDay,nStartHour,nStartMin,0)
--    sys.oldplayer.endtime = System.encodeNumTime(nEndYear,nEndMonth,nEndDay,nEndHour,nEndMin,0)
--    if System.getCurrSystemTime() > sys.oldplayer.endtime then
--            EndOldPlayerReturnActive()
--            return
--    end
--    --广播
--    local players = LuaHelp.getAllActorList()
--	if players then
--		for k, v in ipairs(players) do
--			OldPlayerReturnGetInfo(v)
--            InitOldPlayerReturnInfo(v,true)
--		end
--	end
--end
function gStartFFFFFF(nYear,nMonth,nDay)
    StartOldPlayerReturnActive(nYear,nMonth,nDay)
end
function StartOldPlayerReturnActive(nYear,nMonth,nDay)
    if nYear == nil or nMonth == nil or nDay == nil then
        nYear,nMonth,nDay = System.getDate()
    end
    
    local sys = System.getStaticVar()
    
    sys.oldplayer = {}
    sys.oldplayer.starttime = System.encodeNumTime(nYear,nMonth,nDay,0,0,0)
    sys.oldplayer.endtime = sys.oldplayer.starttime + 604740
    if System.getCurrMiniTime() >= sys.oldplayer.starttime and System.getCurrMiniTime() <= sys.oldplayer.endtime then
          --广播
        local players = LuaHelp.getAllActorList()
	    if players then
		    for k, v in ipairs(players) do
			    OldPlayerReturnGetInfo(v)

                
                local var = InitOldPlayerReturnInfo(v,true)
                --var.oldplayret.login.day = 1
		    end
	    end

    end

end
--结束老兵回归活动

function EndOldPlayerReturnActive()
     local sys = System.getStaticVar()
     sys.oldplayer = nil
     LuaStaticData.GlobalOldPlayer = {}
      --广播关闭图标
    local players = LuaHelp.getAllActorList()
	if players then
		for k, v in ipairs(players) do
			OldPlayerReturnGetInfo(v)
           
            InitOldPlayerReturnInfo(v,true)
          
		end
	end
end

function setTestA(sysarg,szName)

    local pActor = Actor.getActorByName(name)
    if pActor ~= nil then
        InitOldPlayerReturnInfo(pActor,true)
        Actor.sendTipmsg(sysarg,"成功!",ttFlyTip)
        return
    end
    Actor.sendTipmsg(sysarg,"未找到该用户!",ttFlyTip)
end
--初始化老兵回归结构信息
function InitOldPlayerReturnInfo(sysarg,bInit)
    local var = Actor.getStaticVar(sysarg)
    if bInit == nil then bInit = false else bInit = true end
   
    if var.oldplayret == nil or bInit == true then
        local sys = System.getStaticVar()
        var.oldplayret = {}
        var.oldplayret.isold = 0 --是否是老兵
        local nEndTime = 0
        if sys.oldplayer ~= nil then
            nEndTime = sys.oldplayer.endtime
        end
        var.oldplayret.time = nEndTime --记录一下时间 用于多次开启活动后校验初始化玩家信息
        var.oldplayret.login = {}
        var.oldplayret.login.day = 0 --累积登录天数
        
        var.oldplayret.login.tag = {} --已经领取登录天数奖励标记
        for i = 1,#OldPlayerReturnCfg[1].Login do
            var.oldplayret.login.tag[i] = 0
        end
        var.oldplayret.fristpay = 0 --是否领取回归首充标记
        var.oldplayret.pay ={} --冲值回馈
        for i = 1,#OldPlayerReturnCfg[1].PayFeelBack do
            var.oldplayret.pay[i] = 0
        end
        var.oldplayret.salegift = {} --折扣礼包
        for i = 1,#OldPlayerReturnCfg[1].SaleGift do
            var.oldplayret.salegift[i] = 0
        end
        --召唤队友次数
        var.oldplayret.callcount = 0     
        var.oldplayret.consume = {} --消费回馈
        for i = 1,#OldPlayerReturnCfg[1].ConsumeFellBack do
            var.oldplayret.consume[i] = 0
        end
        var.oldplayret.boss = {} --专属BOSS
        for i = 1,#OldPlayerReturnCfg[1].BossInfo do
            var.oldplayret.boss[i] = 0
        end
        
    end
    return var
end
--老兵回归登录
function OldPlayerReturnLogin(sysarg)
    local sys = System.getStaticVar()
    if sys.oldplayer == nil then return end
    local var = Actor.getStaticVar(sysarg)
    --是第二次开启了活动，清除上一次的信息
    if var.oldplayret ~= nil then
        if var.oldplayret.time > sys.oldplayer.endtime then
            var.oldplayret = nil
            --InitOldPlayerReturnInfo(sysarg,true)
        end
    
    end
    --累计登录
--   local nYear,nMonth,nDay = System.getDate()
   local nLastTime =Actor.getLastLogoutTime(sysarg)
--   local nY,nM,nD,nH,nM = System.GetSystemTimeInMiniTime(nLastTime)
--   if nD ~= nDay then
--        var.oldplayret.login.day =  var.oldplayret.login.day + 1
--   end
   --是否是老兵标识
    if System.getCurrMiniTime() - nLastTime >= 604800 and Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL) >= 80 then ---七天并且等级大于1级
        var.oldplayret.isold = 1
    end
end

--老兵回归跨天
function OldPlayerReturnCrossDay(sysarg)
  
    local sys = System.getStaticVar()
    if sys.oldplayer == nil then return end
    local var = InitOldPlayerReturnInfo(sysarg)
    var.oldplayret.boss = {} --专属boss清空
    --var.oldplayret.salegift = {} --折扣礼包清空
    var.oldplayret.pay ={} --冲值回馈清空
    var.oldplayret.consume = {} --消费回馈清空
    var.oldplayret.login.tag[1] = 0 --累积登录第一天，每天登录都可以领取的
    var.oldplayret.login.day =  var.oldplayret.login.day + 1
end

--老兵回归系统跨天
function OldPlayerReturnSystemCrossDay(sysarg)
    local sys = System.getStaticVar()
    if sys.oldplayer ~= nil then
        if System.getCurrSystemTime() > sys.oldplayer.endtime then
            EndOldPlayerReturnActive()
        end
    end
    
end



--老兵回归获取标记信息
function OldPlayerReturnGetInfo(sysarg,msgid,packet)
    local var = InitOldPlayerReturnInfo(sysarg)
    local sys = System.getStaticVar()
    local pack = DataPack.allocPacket(sysarg,151,67)
    if sys.oldplayer == nil or System.getCurrMiniTime() < sys.oldplayer.starttime then 
        DataPack.writeByte(pack,0) --开启状态
        DataPack.flush(pack)
        return
  
        
    end

    
    DataPack.writeByte(pack,1)
    DataPack.writeUInt(pack,sys.oldplayer.starttime)
    DataPack.writeUInt(pack,sys.oldplayer.endtime)
    DataPack.writeByte(pack,var.oldplayret.isold) --是否是老玩家
   
    DataPack.writeByte(pack,var.oldplayret.login.day) --累计签到天数

    local nLive = 0
    if var.days.LivenessData ~= nil and var.days.LivenessData.liveness ~= nil then
        nLive = var.days.LivenessData.liveness
    end
    DataPack.writeUInt(pack,nLive) --活跃度
    DataPack.writeUInt(pack,var.dayoldplayerconsume) --消费元宝
  
    DataPack.writeUInt(pack,var.days.PeyNum) --冲值元宝
    
    --累计登录领取标记
    
    local cfg = OldPlayerReturnCfg[1].Login
    
    DataPack.writeByte(pack,#OldPlayerReturnCfg[1].Login)
    for i = 1,#OldPlayerReturnCfg[1].Login do
        DataPack.writeByte(pack,var.oldplayret.login.tag[i])
    end
    DataPack.writeByte(pack, var.oldplayret.fristpay) --是否领取回归首充标记
    --冲值回馈
    DataPack.writeByte(pack,#OldPlayerReturnCfg[1].PayFeelBack)   
    for i = 1,#OldPlayerReturnCfg[1].PayFeelBack do
        DataPack.writeByte(pack,var.oldplayret.pay[i])
    end
    --折扣礼包
    DataPack.writeByte(pack,#OldPlayerReturnCfg[1].SaleGift)  
       
    for i = 1,#OldPlayerReturnCfg[1].SaleGift do
        DataPack.writeByte(pack,var.oldplayret.salegift[i])
    end
    --召唤队友次数
    DataPack.writeByte(pack,var.oldplayret.callcount)
    --消费活动
    DataPack.writeByte(pack,#OldPlayerReturnCfg[1].ConsumeFellBack) 
    for i = 1,#OldPlayerReturnCfg[1].ConsumeFellBack do
        DataPack.writeByte(pack,var.oldplayret.consume[i]) 
    end
    --专属boss
    DataPack.writeByte(pack,#OldPlayerReturnCfg[1].BossInfo)      
    for i = 1,#OldPlayerReturnCfg[1].BossInfo do
        DataPack.writeByte(pack,var.oldplayret.boss[i])
    end
    DataPack.flush(pack)

end


function CallBackEx(sysarg,szName,nActorId,callName)
    local pActor = Actor.getActorByName(szName)
    if pActor == nil then 
        Actor.sendTipmsg(sysarg,"玩家不在线!",ttFlyTip)
        return
    end
    HandleOldPlayerReturnCallBack(pActor,callName,nActorId,0,0)
end

function GMAddOldPlayer(sysarg,sName,szCallName,nCallActorId)
    local pActor = Actor.getActorByName(sName)
    if pActor == nil then
        Actor.sendTipmsg(sysarg,sName.."玩家不在线,无法召唤队友!",ttFlyTip)
        return
    end
      --是否已经被其他人召唤过了
    if LuaStaticData.GlobalOldPlayer == nil then
        LuaStaticData.GlobalOldPlayer = {}
    end

    local var = InitOldPlayerReturnInfo(pActor)
    var.oldplayret.callcount =  var.oldplayret.callcount + 1

    local nActorId = Actor.getIntProperty(pActor,PROP_ENTITY_ID)
    if LuaStaticData.GlobalOldPlayer == nil then
        LuaStaticData.GlobalOldPlayer = {}
    end
    if LuaStaticData.GlobalOldPlayer[nActorId] == nil then 
        LuaStaticData.GlobalOldPlayer[nActorId] = {} 
        LuaStaticData.GlobalOldPlayer[nActorId].call = {}
        LuaStaticData.GlobalOldPlayer[nActorId].recall = {}
        -- {actorid=0,name="",tag=0,} --被召唤
    end

    if LuaStaticData.GlobalOldPlayer[nCallActorId] == nil then
         LuaStaticData.GlobalOldPlayer[nCallActorId] = {}
        LuaStaticData.GlobalOldPlayer[nCallActorId].call = {}
        LuaStaticData.GlobalOldPlayer[nCallActorId].recall = {}
        --{actorid=0,name="",tag=0,} --被召唤
    end
    --被召唤
    local cfg = {}
    cfg.name = Actor.getName(pActor)
    cfg.actorid = nActorId
    cfg.tag = 0 --是否已领取奖励标记
    table.insert(LuaStaticData.GlobalOldPlayer[nCallActorId].recall,cfg)
    set_static_data_dirty()--保存标记
    cfg = {}
    cfg.name = szCallName
    cfg.actorid = nCallActorId
    cfg.tag = 0 --是否已领取奖励标记
    table.insert(LuaStaticData.GlobalOldPlayer[nActorId].call,cfg)
    Actor.sendTipmsg(sysarg,"召唤成功!",ttFlyTip)

    local str ="嘿，兄弟！我们好久不见你在哪里\\\\嘿，朋友，如果真的是你，请打招呼！\\\\我是散人传说%s，快回来攻城打架啦，更有超多奖励等你来拿！\\\\大奖激活码：%d "
    str = string.format(str,Actor.getName(sysarg),nActorId)
    System.AddMail(nCallActorId,0,0,"老兵回归",str)
end
--老兵回归召唤回调 c++
function HandleOldPlayerReturnCallBack(sysarg,szName,nCallActorId,nLastTime,nLevel)
   -- print("名称"..szName.."id:"..nActorId.."时间:"..nLastTime)
    if nCallActorId == 0 then
        Actor.sendTipmsg(sysarg,"输入玩家昵称有误,玩家不存在!",ttFlyTip)
        return
    end
    if nLevel < 80 then
        Actor.sendTipmsg(sysarg,"该玩家等级不足80级，无法召回！",ttFlyTip)
        return
    end
    --判定该玩家未登录时间是否超过七天
    if System.getCurrMiniTime() - nLastTime < 604800 then
        Actor.sendTipmsg(sysarg,"该玩家不是老兵，无法召回!",ttFlyTip)

        return
    end
    --是否已经被其他人召唤过了
    if LuaStaticData.GlobalOldPlayer == nil then
        LuaStaticData.GlobalOldPlayer = {}
    end
    if LuaStaticData.GlobalOldPlayer[nCallActorId] ~= nil then
        if LuaStaticData.GlobalOldPlayer[nCallActorId].recall == nil then 
            LuaStaticData.GlobalOldPlayer[nCallActorId].recall = {}
        end
--        if LuaStaticData.GlobalOldPlayer[nCallActorId].recall.actorid ~= 0 then
--             Actor.sendTipmsg(sysarg,"该玩家已被其他人召回!",ttFlyTip)
--            return
--        end
    end
    local var = InitOldPlayerReturnInfo(sysarg)
    var.oldplayret.callcount =  var.oldplayret.callcount + 1

    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    if LuaStaticData.GlobalOldPlayer == nil then
        LuaStaticData.GlobalOldPlayer = {}
    end
    if LuaStaticData.GlobalOldPlayer[nActorId] == nil then 
        LuaStaticData.GlobalOldPlayer[nActorId] = {} 
        LuaStaticData.GlobalOldPlayer[nActorId].call = {}
        LuaStaticData.GlobalOldPlayer[nActorId].recall = {}
        -- {actorid=0,name="",tag=0,} --被召唤
    end

    if LuaStaticData.GlobalOldPlayer[nCallActorId] == nil then
         LuaStaticData.GlobalOldPlayer[nCallActorId] = {}
        LuaStaticData.GlobalOldPlayer[nCallActorId].call = {}
        LuaStaticData.GlobalOldPlayer[nCallActorId].recall = {}
        --{actorid=0,name="",tag=0,} --被召唤
    end
    --被召唤
    local cfg = {}
    cfg.name = Actor.getName(sysarg)
    cfg.actorid = nActorId
    cfg.tag = 0 --是否已领取奖励标记
    table.insert(LuaStaticData.GlobalOldPlayer[nCallActorId].recall,cfg)
--    LuaStaticData.GlobalOldPlayer[nCallActorId].recall.actorid = nActorId
--    LuaStaticData.GlobalOldPlayer[nCallActorId].recall.name = Actor.getName(sysarg)
--    LuaStaticData.GlobalOldPlayer[nCallActorId].tag = 0
    set_static_data_dirty()--保存标记
    cfg = {}
    cfg.name = szName
    cfg.actorid = nCallActorId
    cfg.tag = 0 --是否已领取奖励标记
    table.insert(LuaStaticData.GlobalOldPlayer[nActorId].call,cfg)
    local str ="嘿，兄弟！我们好久不见你在哪里\\\\嘿，朋友，如果真的是你，请打招呼！\\\\我是散人传说%s，快回来攻城打架啦，更有超多奖励等你来拿！\\\\大奖激活码：%d "
    str = string.format(str,Actor.getName(sysarg),nActorId)
    System.AddMail(nCallActorId,0,0,"老兵回归",str)
    cfg =  OldPlayerReturnCfg[2]
    if var.oldplayret.isold == 1 then
        cfg =  OldPlayerReturnCfg[1]
    end
    Actor.sendTipmsg(sysarg,"邀请成功，您还可召唤"..(cfg.CallPlayer.MaxCallCount - var.oldplayret.callcount).."个老兵！!",ttFlyTip)

    local pack = DataPack.allocPacket(sysarg,151,69)
    DataPack.writeString(pack,Actor.getName(sysarg))
    DataPack.writeUInt(pack,nActorId)
    DataPack.writeUInt(pack,System.getServerId())
    DataPack.writeString(pack,szName)
    DataPack.flush(pack)
end

--老兵回归领取奖励
function OldPlayerReturnGiveAward(sysarg,msgid,packet)
    local nIndex = DataPack.readByte(packet)
    if nIndex == 5 then--召回老兵
        nIndex =  DataPack.readByte(packet)
    end
    local sys = System.getStaticVar()
    local var = InitOldPlayerReturnInfo(sysarg)
    local cfg =  OldPlayerReturnCfg[2]
    if var.oldplayret.isold == 1 then
        cfg =  OldPlayerReturnCfg[1]
    end
    if Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL) < 80 then
        Actor.sendTipmsg(sysarg,"等级不足80级，无法领取!",ttFlyTip)
        return
    end
    if sys.oldplayer == nil then 
        Actor.sendTipmsg(sysarg,"活动已结束!",ttFlyTip)
        return
    end
    if nIndex == 1 then --回归登录
        local nTag = DataPack.readByte(packet)
        if nTag < 0 or nTag > #cfg.Login then
            Actor.sendTipmsg(sysarg,"索引错误!"..nTag,ttFlyTip)
            return
        end
        --天数是否已到
        if  var.oldplayret.login.day < cfg.Login[nTag].day then
            Actor.sendTipmsg(sysarg,"累计登录还未到"..cfg.Login[nTag].day.."天!",ttFlyTip)
            return
        end
        --是否已经领取
        if var.oldplayret.login.tag[nTag] == 1 then
             Actor.sendTipmsg(sysarg,"已经领取过了!",ttFlyTip)
            return
        end
        if not Awards.CheckBagGridCount(sysarg,cfg.Login[nTag].award) then
            Actor.sendTipmsg(sysarg,"包裹空间不足,无法领取!",ttFlyTip)
            return
        end
        
        local szLog = "普通"
        if var.oldplayret.isold == 1 then
            szLog = "老兵"
        end
        Awards.Give(sysarg,cfg.Login[nTag].award,LogIds.oldplayerreturn,szLog.."累计登录"..nTag)
        var.oldplayret.login.tag[nTag] = 1
        Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip)
    elseif nIndex == 2 then --回归首充
        if var.days ~= nil and (var.days.PeyNum or 0) > 0 then
            if var.oldplayret.fristpay == 1 then
                 Actor.sendTipmsg(sysarg,"已经领取过了,无法再次领取!",ttFlyTip)
                 return
            end
            if not Awards.CheckBagGridCount(sysarg,cfg.FirstPay.award) then
                Actor.sendTipmsg(sysarg,"包裹空间不足,无法领取!",ttFlyTip)
                return
            end
            Awards.Give(sysarg,cfg.FirstPay.award,LogIds.oldplayerreturn,"回归首充")
            
            var.oldplayret.fristpay = 1
            Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip)
            local szBroad = "<(n%s)>领取了老兵回归充值大礼包. <我也要领取/@@showWin,244,1>"
            szBroad = string.format(szBroad,Actor.getName(sysarg))
            System.broadcastTipmsg(szBroad,ttChatWindow)
        else
            Actor.sendTipmsg(sysarg,"今日还未冲值，无法领取!",ttFlyTip)
            return
        end
    elseif nIndex == 3 then --冲值回馈
        local nTag = DataPack.readByte(packet)
        if nTag < 0 or nTag > #cfg.PayFeelBack then
            Actor.sendTipmsg(sysarg,"索引错误!"..nTag,ttFlyTip)
            return
        end
        if var.days == nil or (var.days.PeyNum or 0) < cfg.PayFeelBack[nTag].money then
            Actor.sendTipmsg(sysarg,"冲值元宝不足"..cfg.PayFeelBack[nTag].money,ttFlyTip)
            return
        end
        if  var.oldplayret.pay[nTag] == 1 then
            Actor.sendTipmsg(sysarg,"已经领取过了,无法再次领取!",ttFlyTip)
            return
        end
        if not Awards.CheckBagGridCount(sysarg,cfg.PayFeelBack[nTag].award) then
            Actor.sendTipmsg(sysarg,"包裹空间不足,无法领取!",ttFlyTip)
            return
        end
        Awards.Give(sysarg,cfg.PayFeelBack[nTag].award,LogIds.oldplayerreturn,"冲值回馈"..nTag) 
        var.oldplayret.pay[nTag] = 1
        Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip)
    elseif nIndex == 4 then --折扣有礼
        local nTag = DataPack.readByte(packet)
        if nTag < 0 or nTag > #cfg.SaleGift then
            Actor.sendTipmsg(sysarg,"索引错误!"..nTag,ttFlyTip)
            return
        end
        local nCount = var.oldplayret.salegift[nTag] + 1
        if  nCount > #cfg.SaleGift[nTag]  then
            Actor.sendTipmsg(sysarg,"已经领取过了,无法再次领取!",ttFlyTip)
            return
        end
        if Actor.getMoneyCount(sysarg,mtYuanbao) < cfg.SaleGift[nTag][nCount].money then
            Actor.sendTipmsg(sysarg,"元宝不足无法购买!",ttFlyTip)
            return
        end
       
        if not Awards.CheckBagGridCount(sysarg,cfg.SaleGift[nTag][nCount].award) then
            Actor.sendTipmsg(sysarg,"包裹空间不足,无法领取!",ttFlyTip)
            return
        end
        Actor.changeMoney(sysarg,mtYuanbao,-cfg.SaleGift[nTag][nCount].money,LogIds.oldplayerreturn,"老兵回归折扣")
        Awards.Give(sysarg,cfg.SaleGift[nTag][nCount].award,LogIds.oldplayerreturn,"折扣礼包"..nTag)
      
        var.oldplayret.salegift[nTag] = nCount
        Actor.sendTipmsg(sysarg,"购买成功!",ttFlyTip)
      

        local szBroad = "<(n%s)>购买了价值%d元宝的%s折扣礼包. <我也要买/@@showWin,244,3>"
        szBroad = string.format(szBroad,Actor.getName(sysarg),cfg.SaleGift[nTag][nCount].money,Item.getItemLinkMsg(cfg.SaleGift[nTag][nCount].award[1].id))
        System.broadcastTipmsg(szBroad,ttChatWindow)
  
    elseif nIndex == 5 then --召唤战友
        
        local szName = DataPack.readString(packet)
        
        if szName == nil or string.len(szName) <= 0 or string.len(szName) >= 64 then
            return
        end
        --召唤次数是否已满
      
        if var.oldplayret.callcount >= cfg.CallPlayer.MaxCallCount then
            Actor.sendTipmsg(sysarg,"召唤次数已满!",ttFlyTip)
            return

        end
        if LuaStaticData.GlobalOldPlayer == nil then LuaStaticData.GlobalOldPlayer = {} end
        --是否是重复召唤
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        if LuaStaticData.GlobalOldPlayer[nActorId] ~= nil then
            for i = 1,#LuaStaticData.GlobalOldPlayer[nActorId].call do
                if LuaStaticData.GlobalOldPlayer[nActorId].call[i].name == szName then
                    Actor.sendTipmsg(sysarg,"不能重复召唤!",ttFlyTip)
                    return
                end
            end
        end
        if szName == Actor.getName(sysarg) then
            Actor.sendTipmsg(sysarg,"不能召唤自己!",ttFlyTip)
            return
        end
        local pActor = Actor.getActorPtrByName(szName)
        if pActor ~= nil then
            Actor.sendTipmsg(sysarg,"当前玩家不是老兵!!",ttFlyTip)
            return
        end
        Actor.callOldPlayer(sysarg,szName)
    elseif nIndex == 6 then --消费回馈
        local nTag = DataPack.readByte(packet)
        if nTag < 0 or nTag > #cfg.ConsumeFellBack then
            Actor.sendTipmsg(sysarg,"索引错误!"..nTag,ttFlyTip)
            return
        end
        if var.dayoldplayerconsume == nil or var.dayoldplayerconsume < cfg.ConsumeFellBack[nTag].money then
            Actor.sendTipmsg(sysarg,"冲值元宝不足"..cfg.ConsumeFellBack[nTag].money,ttFlyTip)
            return
        end
        if  var.oldplayret.consume[nTag] == 1 then
            Actor.sendTipmsg(sysarg,"已经领取过了,无法再次领取!",ttFlyTip)
            return
        end
        if not Awards.CheckBagGridCount(sysarg,cfg.ConsumeFellBack[nTag].award) then
            Actor.sendTipmsg(sysarg,"包裹空间不足,无法领取!",ttFlyTip)
            return
        end
        Awards.Give(sysarg,cfg.ConsumeFellBack[nTag].award,LogIds.oldplayerreturn,"消费回馈"..nTag) 
        var.oldplayret.consume[nTag] = 1
        Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip)
    elseif nIndex == 7 then --专属BOSS
        if var.oldplayret.isold == 0 then return end
        local nTag = DataPack.readByte(packet)
        
        if nTag < 0 or nTag > #cfg.BossInfo then
            Actor.sendTipmsg(sysarg,"索引错误!"..nTag,ttFlyTip)
            return
        end
      
        local nLive = 0
        if var.days.LivenessData ~= nil and var.days.LivenessData.liveness ~= nil then
            nLive = var.days.LivenessData.liveness
        end
        if  nLive < cfg.BossInfo[nTag].activevalue then
            
            Actor.sendTipmsg(sysarg,"活跃度不足"..cfg.BossInfo[nTag].activevalue,ttFlyTip)
            return
        end
     
        if  var.oldplayret.boss[nTag] == 1 then
            Actor.sendTipmsg(sysarg,"已经领取过了,无法再次领取!",ttFlyTip)
            return
        end
        if not Awards.CheckBagGridCount(sysarg,cfg.BossInfo[nTag].award) then
            Actor.sendTipmsg(sysarg,"包裹空间不足,无法领取!",ttFlyTip)
            return
        end
       
        Awards.Give(sysarg,cfg.BossInfo[nTag].award,LogIds.oldplayerreturn,"专属BOSS"..nTag) 
        var.oldplayret.boss[nTag] = 1
        Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip)
    elseif nIndex == 8 then --日常奖励
        
     
    elseif nIndex == 9 then --领取召回奖励
        cfg =  cfg.CallPlayer
        local key = tonumber(DataPack.readString(packet))
       
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        if LuaStaticData.GlobalOldPlayer == nil then 
            LuaStaticData.GlobalOldPlayer = {}
        end
        if LuaStaticData.GlobalOldPlayer[nActorId] == nil then
            Actor.sendTipmsg(sysarg,"您没有被召回，无法领取奖励!",ttFlyTip)
            return
        end
        local bFind = false
        local szCallName = ""
        if  LuaStaticData.GlobalOldPlayer[nActorId].recall ~= nil then   --.tag
            for i = 1,#LuaStaticData.GlobalOldPlayer[nActorId].recall do
                if LuaStaticData.GlobalOldPlayer[nActorId].recall[i].tag == 1 then
                    Actor.sendTipmsg(sysarg,"已经领取过了，无法领取!",ttFlyTip)
                    return
                end

            end
            for i = 1,#LuaStaticData.GlobalOldPlayer[nActorId].recall do
                if LuaStaticData.GlobalOldPlayer[nActorId].recall[i].actorid == key then
                    bFind=  true
                    szCallName = LuaStaticData.GlobalOldPlayer[nActorId].recall[i].name
                    if LuaStaticData.GlobalOldPlayer[nActorId].recall[i].tag ~= 0 then
                         Actor.sendTipmsg(sysarg,"已经领取过了，无法领取!",ttFlyTip)
                         return
                    end
                    LuaStaticData.GlobalOldPlayer[nActorId].recall[i].tag = 1
                    break
                end
            end
            
           
        end
        if bFind == false then 
            Actor.sendTipmsg(sysarg,"激活码不正确，无法领取!",ttFlyTip)
            return
        end
        --被召回者奖励
        local szAward = ""
        for i = 1,#cfg.Award[1] do
            szAward = szAward..cfg.Award[1][i].id..","..cfg.Award[1][i].count..","..cfg.Award[1][i].bind
            if i ~= #cfg.Award[1] then
                szAward = szAward.."/"
            end
        end
        local szText = string.format("您召唤的玩家%s已回归，双方可获得一份奖励，让我们兄弟齐聚，再战武林！",Actor.getName(sysarg))
        local actorid = key
        System.AddMail(actorid,6,0,"老兵回归",szText,0,0,szAward)
        

        szAward = ""
        for i = 1,#cfg.Award[2] do
            szAward = szAward..cfg.Award[2][i].id..","..cfg.Award[2][i].count..","..cfg.Award[2][i].bind
            if i ~= #cfg.Award[2] then
                szAward = szAward.."/"
            end
        end
        System.AddMail(nActorId,6,0,"老兵回归","被召回者奖励！",0,0,szAward)
        
        
        Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip)
       
         set_static_data_dirty()--保存标记
    end
    OldPlayerReturnGetInfo(sysarg)
end
