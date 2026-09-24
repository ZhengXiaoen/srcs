--#include "data\config\item\RandomBoxCfg.lua" once


function InitRandomBoxItem(sysarg,index)
    if index < 0 or index > table.getn(RandomBoxCfg) then return end
    local dVar = Actor.getDyanmicVar(sysarg)
    dVar.randombox = {}
    dVar.randombox.index = index
    dVar.randombox.givecount = 0
  
    local cfg = RandomBoxCfg[index]
    --参数: string 宝箱名称 byte 总领取次数 结构体{int 需要的元宝[0代表免费领取]}  byte 宝箱数量 结构体{ ushort 道具id byte 数量 byte 是否绑定 [第一个成员为免费领取]}
    local pack = DataPack.allocPacket(sysarg,139,250)
    DataPack.writeString(pack,cfg.name)
    local number = table.getn(cfg.number)
    DataPack.writeByte(pack,number)
    for i = 1,number do
         DataPack.writeInt(pack,cfg.number[i].needYuanBao)
    end

    local nAllCount = table.getn(cfg.randomItem)
    
    if table.getn(cfg.number[1].award) > 0 then
        nAllCount = nAllCount + 1
    end
     DataPack.writeByte(pack,nAllCount)
    

     --免费的第一个
     if table.getn(cfg.number[1].award) > 0 then
     
         DataPack.writeWord(pack,cfg.number[1].award[1].id)
         DataPack.writeByte(pack,cfg.number[1].award[1].count)
         DataPack.writeByte(pack,cfg.number[1].award[1].bind)
     end
    
  
     for i =1,table.getn(cfg.randomItem) do
        DataPack.writeWord(pack,cfg.randomItem[i].itemid)
        DataPack.writeByte(pack,cfg.randomItem[i].count)
        DataPack.writeByte(pack,cfg.randomItem[i].bind)
     end
     DataPack.flush(pack)
     
end


--摇取
function SnakeRandomBoxItem(sysarg)
    local dVar = Actor.getDyanmicVar(sysarg)
    if  dVar.randombox == nil then return end 
    if dVar.randombox.index == nil then return end 
    local cfg = RandomBoxCfg[dVar.randombox.index]
    if dVar.randombox.givecount >= table.getn(cfg.number) then
        Actor.sendTipmsg(sysarg,"领取次数已满！",ttFlyTip)
        return
    end
   
    local nNeedMoney = cfg.number[dVar.randombox.givecount + 1].needYuanBao
    if nNeedMoney > 0 then
       if Actor.getMoneyCount(sysarg,mtYuanbao) < nNeedMoney then
            Actor.sendTipmsg(sysarg,"元宝不足"..nNeedMoney.."无法抽取!",ttFlyTip)
            return
       end
    end
    --第一次领取不需要摇奖
    if dVar.randombox.givecount == 0 then
        return
    end
    local nRand = System.getRandomNumber(10000) + 1
    
    local nAllRand = 1
    for i =1,table.getn(cfg.randomItem) do
        
        if nAllRand >= nRand then
            dVar.randombox.itemindex = i-1
            break
        end
        nAllRand = nAllRand + cfg.randomItem[i].rate
    end
    if dVar.randombox.itemindex == nil or dVar.randombox.itemindex == 0  then
        dVar.randombox.itemindex = table.getn(cfg.randomItem)
    end
    local pack = DataPack.allocPacket(sysarg,139,251)
    DataPack.writeByte(pack,dVar.randombox.itemindex )
    DataPack.flush(pack)

    Actor.changeMoney(sysarg,mtYuanbao,-nNeedMoney,LogIds.snakerandombox,cfg.name)
end

--领取奖励
function GiveRandomBoxItem(sysarg)
    local dVar = Actor.getDyanmicVar(sysarg)
    if  dVar.randombox == nil then return end 
    if dVar.randombox.index == nil  then return end 
    local cfg = RandomBoxCfg[dVar.randombox.index]
    if dVar.randombox.givecount >= table.getn(cfg.number) then
        Actor.sendTipmsg(sysarg,"领取次数已满！",ttFlyTip)
        return
    end
    if dVar.randombox.itemindex == nil and dVar.randombox.givecount > 0 then 
        Actor.sendTipmsg(sysarg,"已领过了,无法重复领取!",ttFlyTip)
        return 
    end
    if #cfg.number[dVar.randombox.givecount + 1].award > 0 then
         if not Awards.CheckBagGridCount(sysarg,cfg.number[dVar.randombox.givecount + 1].award) then
            Actor.sendTipmsg(sysarg,"包裹空间不足，请清理!",ttFlyTip)
		    return	
	    end
    
        Awards.Give(sysarg,cfg.number[dVar.randombox.givecount + 1].award,LogIds.snakerandombox,"领取随机宝箱")
       
    end

    local itemCfg = nil
    if dVar.randombox.itemindex ~= nil then
       itemCfg= cfg.randomItem[dVar.randombox.itemindex]
    end
    if itemCfg ~= nil then
        if Item.getBagEmptyGridCount(sysarg) > 0 then
            Actor.addItem(sysarg,itemCfg.itemid,0,0,itemCfg.count,itemCfg.bind,0,"随机宝箱",GameLog.snakerandombox)
            sItemName = Item.getItemName(itemCfg.itemid)
            Actor.sendTipmsg(sysarg, "领取"..sItemName.."*"..itemCfg.count.."!", ttFlyTip)
        else
        --发到邮箱     
            local str =itemCfg.itemid..","..itemCfg.count..","..itemCfg.bind
            System.AddMail(actorID,6,0,cfg.name.."抽取",cfg.name.."*"..itemCfg.count.."抽取奖励",0,0,str)
            Actor.sendTipmsg(sysarg, "【"..sItemName.."*"..itemCfg.count.."】已发送到邮件中,请注意查收", ttFlyTip)
	    end
    end
    
    --广播
    if itemCfg ~= nil and cfg.broadcastCount ~= nil and itemCfg.count>= cfg.broadcastCount then
            local str = "<(n%s)>玩家打开了%s, 大手一挥竟然抽到了%s*%d,可喜可贺！"
            str = string.format(str,Actor.getName(sysarg),Item.getItemLinkMsg(cfg.itemId),Item.getItemLinkMsg(itemCfg.itemid),itemCfg.count)
            System.broadcastTipmsg(str,ttChatWindow)
    end
    dVar.randombox.givecount = dVar.randombox.givecount + 1
    dVar.randombox.itemindex = nil
    local pack = DataPack.allocPacket(sysarg,139,252)
    DataPack.writeByte(pack,dVar.randombox.givecount )
    DataPack.flush(pack)
end