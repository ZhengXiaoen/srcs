--#include "data\config\WarriorEquipMakeCfg.lua" once
function WarriorEquipMakeInit(sysarg)
    local str = ""
	str= str.."\\  <(c0xFFffff00)远古残片来源：>\\               <(c0xFFb6946c)1.远古战场高级BOSS掉落.>\\               <(c0xFFb6946c)2.商城-积分商城购买所得.> \\  <(c0xFFffff00)远古残片用途：>\\               <(c0xFFb6946c)1.可用于激活对应的远古战装.>\\               <(c0xFFb6946c)2.可合成高阶的远古残片.>\\\\<(idecoLine#350)>           "
    for i = 1,#WarriorEquipMakeCfg do
       str =str .."\\                      <"..WarriorEquipMakeCfg[i].name.."/@WarriorEquipMakeMkaeList,"..i..">\\"
    end
    return str .."\\\\                      <一键合成/@WarriorEquipMakeAll>"
end


function WarriorEquipMakeMkaeList(sysarg,index)
    index = tonumber(index)
    if not index or index%1 ~= 0 or index <= 0 or index > #WarriorEquipMakeCfg then return end
    
    local str = "\\ <(c0xFFb6946c)3个相同的远古残片可合成1个高1阶的远古残片：>\\<(idecoLine#350)> \\"
    
    local cfg = WarriorEquipMakeCfg[index]
    
    for i = 1,#cfg.list do
        local s = string.format("   %s <(c0xFFb6946c)*> <(c0xFF00ff00)%d> <(c0xFFb6946c)=> %s   <合成/@WarriorEquipMakeMkae,%d,%d>\\",Item.getItemLinkMsg(cfg.list[i].itemid),cfg.list[i].count,Item.getItemLinkMsg(cfg.list[i].destid),index,i)
        str= str..s
        
        

    end
        str = str .."\\\\			<返回主页/@WarriorEquipMakeInit>        <一键合成/@WarriorEquipMakeAll,"..index.."> "
    return str
end

function WarriorEquipMakeMkae(sysarg,index,i)
    index = tonumber(index)
    i = tonumber(i)
    local cfg = WarriorEquipMakeCfg[index]
    if cfg == nil then return end
    cfg = cfg.list[i]
    if Actor.getItemCount(sysarg,cfg.itemid) < cfg.count then
        Actor.sendTipmsg(sysarg,"材料不足,无法合成!",ttFlyTip)
        return
    end
    Actor.removeItem(sysarg,cfg.itemid,cfg.count,-1,-1,-1,"战装合成",LogIds.warrionequipmake)
    Actor.addItem(sysarg,cfg.destid,0,0,1,1,0,"战装合成",LogIds.warrionequipmake)
     Actor.sendTipmsg(sysarg,"合成成功!",ttFlyTip)
end

function WarriorEquipMakeAll(sysarg,index)
    local recipes,selected = LocalDT.GetMakeRecipes(WarriorEquipMakeCfg,index,1)
    if not recipes then return end
    LocalDT.MakeRecipesAll(sysarg,recipes,LogIds.warrionequipmake,"战装合成")
    if selected then return WarriorEquipMakeMkaeList(sysarg,selected) end
    return WarriorEquipMakeInit(sysarg)
end
