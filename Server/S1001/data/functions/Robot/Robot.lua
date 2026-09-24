--#include "data\config\Robot\RobotEquipConfig.lua" once


MiscsImplement.HandleLookRobtEquip =  function( sysarg, msgid, packet )
    local nSex = DataPack.readByte(packet)
    local nJob = DataPack.readByte(packet)
    local nLv = DataPack.readByte(packet)
    local nVipLevel = DataPack.readByte(packet)
     
    --print("性别:"..nSex.."职业:"..nJob)
    local cfg = RobotEquipConfig[nSex][nJob]
    if cfg == nil then return end
    local nIndex = 0
    for i = 1,table.getn(cfg) do
        if cfg[i].lv >= nLv then 
            nIndex = i 
            break
        end
    end
    if nIndex == 0 then 
        Actor.sendTipmsg(sysarg,"无法查看该玩家装备", ttFlyTip);
        return
    end
    local equip = cfg[nIndex].equip
    if nVipLevel == 0 then equip = equip.nromal
    else equip = equip.vip end
    local pack= DataPack.allocPacket(sysarg,139,197)
    DataPack.writeByte(pack,table.getn(equip))
    for i =1,table.getn(equip) do
        DataPack.writeWord(pack,equip[i])
    end
    DataPack.flush(pack)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cLookRobotEquip, MiscsImplement.HandleLookRobtEquip)