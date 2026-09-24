--圣诞来袭的活动
----#include "data\functions\new_activity\festival\activity_jingji.lua" once

--获取各个竞技的信息
function MiscHandleGetNewRankInfo(sysarg,msgid,types,packet)
	
	-- 因为有var.JingJi_Data[msgid]，所以这里再检查一下
	if msgid < 6 or msgid > 10 then return end
	
    local var = Actor.getStaticVar(sysarg)
    if var.JingJi_Data[msgid] == nil then
        var.JingJi_Data[msgid] =  {}
    end
   local cfg = nil
   if msgid == 6 or msgid == 7 or msgid == 8 or msgid == 9 then
        if GetJingjiActivityType() ~= 2 then
            Actor.sendTipmsg(sysarg,"不在活动内!",ttFlyTip) 
            return
        end
        if var.JingJi_Data[msgid].count == nil then 
            var.JingJi_Data[msgid].count = 0
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
    end
    --获取信息
    if types == 1 then
        
        local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sJingJI_Acts)
        DataPack.writeByte(netPack,msgid)
        DataPack.writeByte(netPack,1)
        
        if msgid == 10 then --绝版武器出售
            if var.JingJi_Data[msgid].isGive == nil then
                var.JingJi_Data[msgid].isGive = {}
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
                if var.JingJi_Data[msgid].isGive[i] == nil then 
                    var.JingJi_Data[msgid].isGive[i] = 0
                end
                 DataPack.writeByte(netPack,var.JingJi_Data[msgid].isGive[i])
            end
            cfg = nil
        end

        if cfg ~= nil then
             if var.JingJi_Data[msgid].isGive == nil then
                 var.JingJi_Data[msgid].isGive = {}
                for i =1,#cfg do
                    var.JingJi_Data[msgid].isGive[i] = 0
                end
             end
             DataPack.writeInt(netPack,var.JingJi_Data[msgid].count)
            
             DataPack.writeByte(netPack,#cfg)
             for i =1,#cfg do
                if var.JingJi_Data[msgid].isGive[i] == nil then var.JingJi_Data[msgid].isGive[i] = 0 end
                DataPack.writeByte(netPack,var.JingJi_Data[msgid].isGive[i])
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
              if var.JingJi_Data[msgid].isGive[nIndex] == 1 then
                    Actor.sendTipmsg(sysarg,"无法再次领取!",ttFlyTip) 
                    return
              end
              if var.JingJi_Data[msgid].count < cfg[nIndex].count then
                    Actor.sendTipmsg(sysarg,"数量不足,无法领取!",ttFlyTip) 
                    return
              end
              if Awards.CheckBagGridCount(sysarg,cfg[nIndex].award) then
					Awards.Give(sysarg,cfg[nIndex].award,LogIds.JingJiActivity,"竞技"..msgid)
				else
                    	Actor.sendTipmsg(sysarg,"包裹空间不足,无法领取!",ttFlyTip) 
                        return
				end
                var.JingJi_Data[msgid].isGive[nIndex] = 1

                Actor.sendTipmsg(sysarg,"领取成功!",ttFlyTip) 
                local szStr = string.format("<(n%s)>玩家领取了竞技大赛材料返利奖励，超级丰厚 <我也要领取/@@showWin,264,4>",Actor.getName(sysarg) )
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
                if var.JingJi_Data[msgid].isGive == nil then 
                    var.JingJi_Data[msgid].isGive = {}
                end
                if var.JingJi_Data[msgid].isGive[nIndex] == 1 then
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
               var.JingJi_Data[msgid].isGive[nIndex] = 1
               MiscHandleGetNewRankInfo(sysarg,msgid,1)
               Actor.sendTipmsg(sysarg,"购买成功!",ttFlyTip) 
               
               local szStr = string.format("<(n%s)>玩家财大气粗购买%s，超级丰厚 <我也要购买/@@showWin,264,5>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg.award[1].id) )
               System.broadcastTipmsg(szStr,ttChatWindow)
            end
        end
        
    end
    
end


function HandleAddNewRankCount(sysarg,types,count)
  
     if GetJingjiActivityType() ~= 2 then
        return
     end
     ClearJingJi_Data(sysarg)
    count = tonumber(count)
    types = tonumber(types)
    if types < 6 or types > 9 then return end
    local var = Actor.getStaticVar(sysarg)
    if var.JingJi_Data[types] == nil then
        var.JingJi_Data[types] =  {}

    end
    if var.JingJi_Data[types].count == nil then 
        var.JingJi_Data[types].count = 0
    end
    var.JingJi_Data[types].count = var.JingJi_Data[types].count + count
   -- print("types:"..types.."count:"..var.JingJi_Data[types].count)
    MiscHandleGetNewRankInfo(sysarg,types,1)
end