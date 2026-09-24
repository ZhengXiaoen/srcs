--#include "data\config\SkyRingCfg.lua" once

function InitSkyRingInfo(sysarg)
   local var = Actor.getStaticVar(sysarg)
   if var.skyring == nil then
      var.skyring = {}
      for i = 1,#SkyRingCfg do
          var.skyring[i] = 0
      end
   end
   return var
end


function SkyRingResetPropertys(sysarg,calc)
     local var = InitSkyRingInfo(sysarg)
     for i = 1,#SkyRingCfg do
        if  var.skyring[i] > 0 and var.skyring[i] <= #SkyRingCfg[i] then
            LuaHelp.calcActorAttrs(sysarg, calc,SkyRingCfg[i][var.skyring[i]].attr) 
        end
     end
end


function HandleSkyRingInfo(sysarg)
    local var = InitSkyRingInfo(sysarg)
    local pack= DataPack.allocPacket(sysarg,151,95)
    DataPack.writeByte(pack,#SkyRingCfg)
    for i=1,#SkyRingCfg do
        DataPack.writeInt(pack,var.skyring[i])
    end
    DataPack.flush(pack)
end
function SkyRingOpear(sysarg,pack)
    local nType = DataPack.readByte(pack)
    if nType == 1 then
        HandleSkyRingInfo(sysarg)
    elseif nType == 2 then
        local nIndex = DataPack.readByte(pack)

        local var = InitSkyRingInfo(sysarg)
        if nIndex <= 0 or nIndex > #SkyRingCfg then
            return
        end
        if var.skyring[nIndex]  >= #SkyRingCfg[nIndex] then
           Actor.sendTipmsg(sysarg,"已满级，无法再次升级!",ttFlyTip)
            return 
        end
        local cfg  = SkyRingCfg[nIndex][var.skyring[nIndex] + 1]
        local consume = {}
	    table.insert(consume,cfg.consume)
        if Consumes.CheckAndRemove(sysarg, consume, LogIds.SkyRingUp, "天戒升级") ~= true then 
             Actor.sendTipmsg(sysrg,"材料不足,无法升级!",ttFlyTip)
            return 
        end
       
        var.skyring[nIndex] = var.skyring[nIndex] + 1
        HandleSkyRingInfo(sysarg)
        Actor.collectOperate(sysarg,0)
        Actor.sendTipmsg(sysrg,"升级成功!",ttFlyTip)
    end

end