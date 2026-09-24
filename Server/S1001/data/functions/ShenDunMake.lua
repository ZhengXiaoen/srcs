ShenDunMakeCfg =
{
    {
        name=  "青龙神盾合成",
        list=
        {
            {itemid=7658,count=3,destid=7659,bind=0,},
            {itemid=7659,count=3,destid=7660,bind=0,},
            {itemid=7660,count=3,destid=7661,bind=0,},
            {itemid=7661,count=3,destid=7662,bind=0,},
            -- {itemid=7662,count=3,destid=7663,bind=0,},
            -- {itemid=7663,count=3,destid=7664,bind=0,},
            -- {itemid=7664,count=3,destid=7665,bind=0,},
        }
    },
    {
        name=  "白虎神盾合成",
        list=
        {
            {itemid=7666,count=3,destid=7667,bind=0,},
            {itemid=7667,count=3,destid=7668,bind=0,},
            {itemid=7668,count=3,destid=7669,bind=0,},
            {itemid=7669,count=3,destid=7670,bind=0,},
            -- {itemid=7670,count=3,destid=7671,bind=0,},
            -- {itemid=7671,count=3,destid=7672,bind=0,},
            -- {itemid=7672,count=3,destid=7673,bind=0,},
        }
    },
    {
        name=  "朱雀神盾合成",
        list=
        {
            {itemid=7674,count=3,destid=7675,bind=0,},
            {itemid=7675,count=3,destid=7676,bind=0,},
            {itemid=7676,count=3,destid=7677,bind=0,},
            {itemid=7677,count=3,destid=7678,bind=0,},
            -- {itemid=7678,count=3,destid=7679,bind=0,},
            -- {itemid=7679,count=3,destid=7680,bind=0,},
            -- {itemid=7680,count=3,destid=7681,bind=0,},
        }
    },
    {
        name=  "玄武神盾合成",
        list=
        {
            {itemid=7682,count=3,destid=7683,bind=0,},
            {itemid=7683,count=3,destid=7684,bind=0,},
            {itemid=7684,count=3,destid=7685,bind=0,},
            {itemid=7685,count=3,destid=7686,bind=0,},
            -- {itemid=7686,count=3,destid=7687,bind=0,},
            -- {itemid=7687,count=3,destid=7688,bind=0,},
            -- {itemid=7688,count=3,destid=7689,bind=0,},
        }
    },
 }  

--神盾合成
function ShenDunMakeInit(sysarg)
    local str = ""
	str= str.."\\  <(c0xFFffff00)神盾介绍：>\\               <(c0xFFb6946c)1.神盾充值大礼包活动赠送.>\\               <(c0xFFb6946c)2.庆典活动探索宝藏获得.>\\               <(c0xFFb6946c)3.可合成高级神盾.>\\<(idecoLine#350)>           "
    
	
	for i = 1,#ShenDunMakeCfg do
       str =str .."\\                      <"..ShenDunMakeCfg[i].name.."/@ShenDunMakeMkaeList,"..i..">\\"
    end
    return str
end

function ShenDunMakeMkaeList(sysarg,index)
    index = tonumber(index)
    if index <= 0 or index > #ShenDunMakeCfg then return end
    
    local str = "\\ <(c0xFFb6946c)3个相同的神盾可合成1个高级神盾：>\\<(idecoLine#350)> \\"
    
    local cfg = ShenDunMakeCfg[index]
    
    for i = 1,#cfg.list do
        --print(cfg.list[i].itemid)
        local s = string.format("   %s <(c0xFFb6946c)*> <(c0xFF00ff00)%d> <(c0xFFb6946c)=> %s   <合成/@ShenDunMakeMkae,%d,%d>\\",Item.getItemLinkMsg(cfg.list[i].itemid),cfg.list[i].count,Item.getItemLinkMsg(cfg.list[i].destid),index,i)
        --print(s)
        str= str..s
        
        

    end
        str = str .."\\\\			<返回主页/@ShenDunMakeInit> "
    return str
end

function ShenDunMakeMkae(sysarg,index,i)
    index = tonumber(index)
    i = tonumber(i)
    local cfg = ShenDunMakeCfg[index]
    if cfg == nil then return end
    cfg = cfg.list[i]
    if Actor.getItemCount(sysarg,cfg.itemid) < cfg.count then
        Actor.sendTipmsg(sysarg,"材料不足,无法合成!",ttFlyTip)
        return
    end
    if Actor.removeItem(sysarg,cfg.itemid,cfg.count,-1,-1,-1,"神盾合成",LogIds.shendunMake)~=cfg.count then
		return 
	end
    Actor.addItem(sysarg,cfg.destid,0,0,1,cfg.bind,0,"神盾合成",LogIds.shendunMake)
    Actor.sendTipmsg(sysarg,"合成成功!",ttFlyTip)
	 
	System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家合成%s,战力暴涨！<我也要合成/@@showWin,200>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg.destid)),   ttChatWindow)
end



----龙腾男女互换
--function LongTengChangeInit(sysarg)
--    local str = ""
--	str= str.."\\ <(c0xFFb6946c)消耗一定元宝可进行男女互换>"
--    
--	for i = 1,#LongTengChangeCfg do
--       str =str .."\\\\                      <"..LongTengChangeCfg[i].name.."/@LongTengChangeMkaeList,"..i..">\\"
--    end
--    return str
--end
--
--
--function LongTengChangeMkaeList(sysarg,index)
--    index = tonumber(index)
--    if index <= 0 or index > #LongTengChangeCfg then return end
--    
--    local str = "\\ <(c0xFFb6946c)消耗元宝进行男女互换哦：>\\<(idecoLine#350)> \\" 
--    
--    local cfg = LongTengChangeCfg[index]
--    
--    for i = 1,#cfg.list do
--        --print(cfg.list[i].itemid)
--        local s = string.format("   %s <(c0xFFb6946c)+> <(c0xFF00ff00)%d元宝> <(c0xFFb6946c)=> %s   <兑换/@LongTengChangeMkae,%d,%d>\\\\",Item.getItemLinkMsg(cfg.list[i].itemid),cfg.list[i].YBcount,Item.getItemLinkMsg(cfg.list[i].destid),index,i)
--        --print(s)
--        str= str..s
--        
--    end
--        str = str .."\\\\			<返回主页/@LongTengChangeInit> "
--    return str
--end
--
--function LongTengChangeMkae(sysarg,index,i)
--    index = tonumber(index)
--    i = tonumber(i)
--    local cfg = LongTengChangeCfg[index]
--    if cfg == nil then return end
--    cfg = cfg.list[i]
--    if Actor.getItemCount(sysarg,cfg.itemid) < 1 then
--        Actor.sendTipmsg(sysarg,"材料不足,无法兑换!",ttFlyTip)
--        return
--    end
--	
--	if Actor.changeMoney( sysarg, 3, -cfg.YBcount, LogIds.shendunMake, "龙腾男女互换")==false then
--		Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
--		return 
--	end
--	
--    if Actor.removeItem(sysarg,cfg.itemid,1,-1,-1,-1,"龙腾男女互换",LogIds.shendunMake)~=1 then
--		Actor.sendTipmsg(sysarg,"扣除物品失败",ttFlyTip)
--		return 
--	end
--	
--    Actor.addItem(sysarg,cfg.destid,0,0,1,cfg.bind,0,"龙腾男女互换",LogIds.shendunMake)
--    Actor.sendTipmsg(sysarg,"互换成功!",ttFlyTip)
--	 
--end
