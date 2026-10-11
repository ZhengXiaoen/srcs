--圣诞来袭的活动
----#include "data\functions\new_activity\festival\activity_jingji.lua" once

--获取各个竞技的信息
function MiscHandleGetNewRankInfo(sysarg,msgid,types,packet)
	
	-- 因为有data[msgid]，所以这里再检查一下
	if msgid < 6 or msgid > 10 then return end
	
    if msgid ~= 10 and not LocalDT.IsAnniversaryActivityOpen() then return end
    if msgid == 10 then ClearJingJi_Data(sysarg) else LocalDT.ClearAnniversaryMergedData(sysarg) end
    local var = Actor.getStaticVar(sysarg)
    local data = msgid == 10 and var.JingJi_Data or var.OneYearAct_Data.material
    if data[msgid] == nil then
        data[msgid] =  {}
    end
   local cfg = nil
   if msgid == 6 or msgid == 7 or msgid == 8 or msgid == 9 then
        if not LocalDT.IsAnniversaryActivityOpen() then
            Actor.sendTipmsg(sysarg,"不在活动内!",ttFlyTip) 
            return
        end
        if data[msgid].count == nil then
            data[msgid].count = 0
        end
        
        if msgid == 6 then --宝石竞技
              cfg = activity_jingji.GemRank
        elseif msgid == 7 then --圣珠竞技
            cfg = activity_jingji.PeartRank
        elseif msgid == 8 then --坐骑丹竞技
            cfg = activity_jingji.MountRank
        elseif msgid == 9 then --特戒竞技
            cfg = activity_jingji.RingRank
        end
        if data[msgid].isGive == nil then data[msgid].isGive = {} end
    end
    --获取信息
    if types == 1 then
        
        local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sJingJI_Acts)
        DataPack.writeByte(netPack,msgid)
        DataPack.writeByte(netPack,1)
        
        if msgid == 10 then --绝版武器出售
            if data[msgid].isGive == nil then
                data[msgid].isGive = {}
            end
            local activityType = GetJingjiActivityType()
             cfg = nil
            if  activityType == 2 then --竞技
                cfg = activity_jingji.SpecialWeapon[1]
            
            elseif activityType == 1 then --圣诞
                 cfg = activity_jingji.SpecialWeapon[2]
        	else
        		cfg = activity_jingji.SpecialWeapon[1]
            end
            DataPack.writeByte(netPack,#cfg )
            for i =1,#cfg do
                if data[msgid].isGive[i] == nil then
                    data[msgid].isGive[i] = 0
                end
                 DataPack.writeByte(netPack,data[msgid].isGive[i])
            end
            cfg = nil
        end

        if cfg ~= nil then
             if data[msgid].isGive == nil then
                 data[msgid].isGive = {}
                for i =1,#cfg do
                    data[msgid].isGive[i] = 0
                end
             end
             DataPack.writeInt(netPack,data[msgid].count)
            
             DataPack.writeByte(netPack,#cfg)
             for i =1,#cfg do
                if data[msgid].isGive[i] == nil then data[msgid].isGive[i] = 0 end
                DataPack.writeByte(netPack,data[msgid].isGive[i])
             end 
        end
        DataPack.flush(netPack)
    elseif types == 2 then
        local nIndex = DataPack.readByte(packet)
        if cfg ~= nil then
              if nIndex <= 0 or nIndex > #cfg then
                Actor.sendTipmsg(sysarg,"非法索引,领取失败!",ttFlyTip) 
                return
              end
              if data[msgid].isGive[nIndex] == 1 then
                    Actor.sendTipmsg(sysarg,"无法再次领取!",ttFlyTip) 
                    return
              end
              if data[msgid].count < cfg[nIndex].count then
                    Actor.sendTipmsg(sysarg,"数量不足,无法领取!",ttFlyTip) 
                    return
              end
              if Awards.CheckBagGridCount(sysarg,cfg[nIndex].award) then
					if Awards.Give(sysarg,cfg[nIndex].award,LogIds.JingJiActivity,"竞技"..msgid) == false then return end
				else
                    	Actor.sendTipmsg(sysarg,"包裹空间不足,无法领取!",ttFlyTip) 
                        return
				end
                data[msgid].isGive[nIndex] = 1

                Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip) 
                local szStr = string.format("<(n%s)>玩家领取了周年庆典材料返利奖励，超级丰厚 <我也要领取/@@showWin,254,12>",Actor.getName(sysarg) )
                System.broadcastTipmsg(szStr,ttChatWindow)
                MiscHandleGetNewRankInfo(sysarg,msgid,1)
                return
        elseif msgid == 10 then --绝版武器
        	local activityType = GetJingjiActivityType()
            if  activityType == 2 then --竞技
                cfg = activity_jingji.SpecialWeapon[1]
            
            elseif activityType == 1 then --圣诞
                 cfg = activity_jingji.SpecialWeapon[2]
        	else
        		return
            end
            cfg = cfg[nIndex]
            if cfg ~= nil then
                if data[msgid].isGive == nil then
                    data[msgid].isGive = {}
                end
                if data[msgid].isGive[nIndex] == 1 then
                    Actor.sendTipmsg(sysarg,"已购买过,无法再次购买!",ttFlyTip) 
                    return
                end

               if Consumes.Check(sysarg, cfg.consume) ~= true then 
                    Actor.sendTipmsg(sysarg,"元宝不足,无法购买!",ttFlyTip) 
                    return  
               end
               if not  Awards.CheckBagGridCount(sysarg,cfg.award) then
                    Actor.sendTipmsg(sysarg,"包裹空间不足,无法无法购买!",ttFlyTip) 
                    return
               end
               Consumes.Remove(sysarg, cfg.consume, LogIds.JingJiActivity, "竞技"..msgid)   
               Awards.Give(sysarg,cfg.award,LogIds.JingJiActivity,"竞技"..msgid) 
               data[msgid].isGive[nIndex] = 1
               MiscHandleGetNewRankInfo(sysarg,msgid,1)
               Actor.sendTipmsg(sysarg,"购买成功!",ttFlyTip) 
               
               local szStr = string.format("<(n%s)>玩家财大气粗购买%s，超级丰厚 <我也要购买/@@showWin,264,5>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg.award[1].id) )
               System.broadcastTipmsg(szStr,ttChatWindow)
            end
        end
        
    end
    
end


function HandleAddNewRankCount(sysarg,types,count)
  
     if not LocalDT.IsAnniversaryActivityOpen() then
        return
     end
     LocalDT.ClearAnniversaryMergedData(sysarg)
    count = tonumber(count)
    types = tonumber(types)
    if types == nil or types < 6 or types > 9 or count == nil or count <= 0 then return end
    local var = Actor.getStaticVar(sysarg)
    if var.OneYearAct_Data.material[types] == nil then
        var.OneYearAct_Data.material[types] =  {}

    end
    if var.OneYearAct_Data.material[types].count == nil then
        var.OneYearAct_Data.material[types].count = 0
    end
    var.OneYearAct_Data.material[types].count = var.OneYearAct_Data.material[types].count + count
   -- print("types:"..types.."count:"..var.OneYearAct_Data.material[types].count)
    MiscHandleGetNewRankInfo(sysarg,types,1)
end
