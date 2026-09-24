--王城管家
--#include "data\config\guide\GuildBossCfgEx.lua" once
--#include "data\functions\guildOperate\GuildOnTimeFuc.lua" once
NpcDialog[230] = {}


NpcDialog[230].main = function(sysarg)
	local echo = [[
HI.
	]];

    echo = echo.."<领取城主绑定元宝/@CGiveDayMoney> <发送红包/@CSendGuildRedPack> <进入BOSS地图/@CEnterBoosMap>"
	return echo;
end


--王城城主领取每日绑定元宝
NpcDialog[230].CGiveDayMoney = function(sysarg)
    local sbkID = Guild.getSbkCityOwner()

    local nActorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    
    if nActorID ~= sbkID then
        Actor.sendTipmsg(sysarg,"您不是王城城主，无法操作！",ttFlyTip)
        return NpcDialog[230].main(sysarg)
    end
    local h,m,s = System.getTime()
    if h < 21 then
        Actor.sendTipmsg(sysarg,"领取绑元时间未到,请21点-24点之前领取！",ttFlyTip)
        return NpcDialog[230].main(sysarg)
    end
    local sysVar = System.getStaticVar()
    if sysVar.KingGiveMoney ~= nil then
        Actor.sendTipmsg(sysarg,"您已经领取过了，请勿重复领取！",ttFlyTip)
        return NpcDialog[230].main(sysarg)
    end
    sysVar.KingGiveMoney = 1
    local giveMoney = 20000
    Actor.changeMoney(sysarg,mtBindYuanbao,giveMoney,LogIds.kingbindmoney,"城主领取绑元")

    Actor.sendTipmsg(sysarg,"领取"..giveMoney.."绑定元宝成功！",ttFlyTip)
    return NpcDialog[230].main(sysarg)
end

--王城城主发送红包
NpcDialog[230].CSendGuildRedPack = function(sysarg)
    local sbkID = Guild.getSbkCityOwner()
    local nActorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)

    if nActorID ~= sbkID then
        Actor.sendTipmsg(sysarg,"您不是王城城主，无法操作！",ttFlyTip)
        return NpcDialog[230].main(sysarg)
    end
    local nGuildID = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
    local nGuildCount = Guild.getGuildOnlineMemberNum(nGuildID)-1 --排除自己 -1
   
    if nGuildCount  <= 0 then
         Actor.sendTipmsg(sysarg,"人数不够！",ttFlyTip)
         return
    end
    local netPack = DataPack.allocPacket(sysarg,139,206)
    DataPack.writeByte(netPack,nGuildCount)
    DataPack.flush(netPack)
    --local nMoneyType = 2 --类型 绑定元宝
    --local nCount = 10   --数量
    --发送行会红包，直接入玩家包裹，以玩家邮件通知
    --参数 sysarg 发送的实体
    --参数 nMoneyType 金币类型
    --参数 nCount  单个玩家的数量
    --该函数会自行扣除发的金币/元宝数量
    --Guild.SendRedPack(sysarg,nMoneyType,nCount)
end

--进入BOSS地图
NpcDialog[230].CEnterBoosMap = function(sysarg)
    local sbkID = Guild.getSbkCityOwner()

    local nActorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)

--    if nActorID ~= sbkID then
--        Actor.sendTipmsg(sysarg,"您不是王城城主，无法操作！",ttFlyTip)
--        return NpcDialog[230].main(sysarg)
--    end
    local sysVar = System.getStaticVar()
    if sysVar.KingBossMap ~= nil then
        Actor.sendTipmsg(sysarg,"今日已开过此活动，无法继续开启！",ttFlyTip)
        return 
    end
    --判断今天是否攻城
    if CheckSbkGuildWarTime() then
        local h,m,s = System.getTime()
        if h < 21 then
            Actor.sendTipmsg(sysarg,"攻城当天21:00后才可进入",ttFlyTip)
            return 
        end
    end
    local nGuildID = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
    local nType = 2
    if Actor.getMoneyCount(sysarg,2) < GuildBossCfgEx.NeedMoney then
        if Actor.getMoneyCount(sysarg,3) < GuildBossCfgEx.NeedMoney then
            Actor.sendTipmsg(sysarg,"绑定元宝或元宝不足"..GuildBossCfgEx.NeedMoney.."!",ttFlyTip)
            return
        else 
            nType =3
        end
    end
     Actor.changeMoney(sysarg,nType,GuildBossCfgEx.NeedMoney,LogIds.kingenterbossmap,"kingenterbossmap")
     --清空该地图BOSS
     local hScene = Fuben.getSceneHandleById(GuildBossCfgEx.MapID, 0)
     for i = 1,table.getn(GuildBossCfgEx.List) do
        Fuben.clearMonster(hScene,GuildBossCfgEx.List[i].BossID)
     end
    --随机地图 创建boss
    local nRate = System.getRandomNumber(10000) + 1
    for i = 1,table.getn(GuildBossCfgEx.List) do
        if nRate <= GuildBossCfgEx.List[i].Rate then
            Fuben.createMonsters(hScene,GuildBossCfgEx.List[i].BossID , GuildBossCfgEx.X,GuildBossCfgEx.X, GuildBossCfgEx.Y, 1,0)
            break
        end
    end
    --把王城城主传入到该地图
    Actor.enterScene(sysarg,GuildBossCfgEx.MapID,-1,-1)
    --通知其他玩家进入该地图
    local playerList = Guild.getOnlineActorList(nGuildID)
    for k, playPtr in ipairs(playerList or {}) do
        if Actor.getIntProperty(playPtr,PROP_ENTITY_ID) ~= nActorID then
            Actor.messageBox(playPtr,0,0,"是否加入行会BOSS活动","我去NMLGB/OnEnterGuildBoss","我不去/Cancel", nil, nil, 0) 
        end  
	end		
    --记录今日行会boss
   
    sysVar.KingBossMap = 1
end

function OnEnterGuildBoss(sysarg)
    Actor.enterScene(sysarg,GuildBossCfgEx.MapID,-1,-1)
    
end

