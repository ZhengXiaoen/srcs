--#include "data\config\ImmortalSystemConfig.lua" once




--仙装合成
function ImmortalEquipMakeInit(sysarg)
    local str = ""
	str= str.."\\  <(c0xFFffff00)仙装装备介绍：>\\               <(c0xFFb6946c)1.通天塔掉落与仙宫转盘产出.>\\               <(c0xFFb6946c)2.可合成高级仙装装备.>\\<(idecoLine#350)>           "
    local cfg = ImmortalSystemConfig.ExChange
	
	for i = 1,#cfg do
       str =str .."\\                      <"..cfg[i].name.."/@ImmortalEquipMakeMkaeList,"..i..">\\"
    end
    return str
end

function ImmortalEquipMakeMkaeList(sysarg,index)
    index = tonumber(index)
    local cfg = ImmortalSystemConfig.ExChange
    if index <= 0 or index > #cfg then return end
    
    local str = "\\ <(c0xFFb6946c)2个相同的仙装装备可合成1个高级仙装装备：>\\<(idecoLine#350)> \\"
    
     cfg = cfg[index]
    
    for i = 1,#cfg.list do
        --print(cfg.list[i].itemid)
        local szNeedMoney  = string.sub(tostring(cfg.list[i].needmoney),1,2)
        local s = string.format("   %s <(c0xFFb6946c)*> <(c0xFF00ff00)%d> <(c0xFFb6946c)+> <(c0xFF00ff00)%sw绑金/金币>  <(c0xFFb6946c)=> %s   <合成/@ImmortalEquipMakeMkae,%d,%d>\\",Item.getItemLinkMsg(cfg.list[i].itemid),cfg.list[i].count,szNeedMoney,Item.getItemLinkMsg(cfg.list[i].destid),index,i)
        --print(s)
        str= str..s
        
        

    end
        str = str .."\\\\			<返回主页/@ImmortalEquipMakeInit> "
    return str
end

function ImmortalEquipMakeMkae(sysarg,index,i)
    index = tonumber(index)
    i = tonumber(i)

    local cfg = ImmortalSystemConfig.ExChange[index]
    if cfg == nil then return end
    cfg = cfg.list[i]
    if Actor.getItemCount(sysarg,cfg.itemid) < cfg.count then
        Actor.sendTipmsg(sysarg,"材料不足,无法合成!",ttFlyTip)
        return
    end

    if not Actor.checkConsume(sysarg,5,0,cfg.needmoney) then
        Actor.sendTipmsg(sysarg,"绑定金币不足"..cfg.needmoney..",无法合成!",ttFlyTip)
        return
    end
    if not Actor.removeConsume(sysarg,5,0,cfg.needmoney,0,0,0,0,LogIds.xianzhuanghecheng,"仙装合成") then
        Actor.sendTipmsg(sysarg,"绑定金币不足"..cfg.needmoney..",无法合成!",ttFlyTip)
        return
    end
    if Actor.removeItem(sysarg,cfg.itemid,cfg.count,-1,-1,-1,"仙装合成",LogIds.xianzhuanghecheng)~=cfg.count then
		return 
	end
    Actor.addItem(sysarg,cfg.destid,0,0,1,cfg.bind,0,"仙装合成",LogIds.xianzhuanghecheng)
    Actor.sendTipmsg(sysarg,"合成成功!",ttFlyTip)
	 
	System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家合成%s,战力暴涨！<我也要合成/@@showWin,200>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg.destid)),   ttChatWindow)
end



