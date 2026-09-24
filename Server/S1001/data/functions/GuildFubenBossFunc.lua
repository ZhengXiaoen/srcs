--行会boss实现
--#include "data\config\guild\GuildFubenBossCfg.lua" once

--行会boss启动
function GuildFubenBossStart()
    local sys = System.getStaticVar()
    sys.guildboss = {}
    sys.guildbosscount = 0
end

--行会boss结束
function GuildFubenBossEnd()
    
    local sys = System.getStaticVar()
    if sys.guildboss == nil then 
        sys.guildboss = {} 
        sys.guildbosscount = 0
    end
    local list = GuildFubenBossCfg.list
    for i = 1,sys.guildbosscount do
        if sys.guildboss[i] ~= nil then
            local boss = sys.guildboss[i]
            for i = 1,#list do
                if boss.info[i] ~= nil then
                    local pFuben = Fuben.getFubenByHandle(boss.info[i].fbhandle)
                    if pFuben ~= nil then
--                       local playerList = LuaHelp.getFbActorList(pFuben)
--                       	if playerList ~= nil then
--				            for j = 1, #playerList do
--					            local player = playerList[j]
--					            if player then	
--                                    Actor.returnCity(player)
--                                end
--                            end
--                        end
                        Fuben.closeFuben(boss.info[i].fbhandle)
                        boss.info[i].fbhandle = 0
                    end
                end
            end
      
             
        end
        
    end
end

function MiscExGuildFubenBoss(sysarg,msgid,packet)
    local nType = DataPack.readByte(packet)
    if nType == 1 then --获取行会boss状态
        GuildFubenBossGetListState(sysarg)
    elseif nType ==2 then --挑战副本
        GuildFubenBossEnter(sysarg,msgid,packet)
    elseif nType == 3 then --领取副本奖励
        GuildFubenBossGiveAward(sysarg,msgid,packet)
    end
end
--获取调整行会副本BOSS列表状态
function GuildFubenBossGetListState(sysarg)
    local sys = System.getStaticVar()
    if sys.guildboss == nil then 
        sys.guildboss = {} 
        sys.guildbosscount = 0
    end
    local nGuildId =  Actor.getGuildId(sysarg)
    if nGuildId <= 0 then
        Actor.sendTipmsg(sysarg,"未加入任何行会!",ttFlyTip)
        return
    end


    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    local list = GuildFubenBossCfg.list
    local pack = DataPack.allocPacket(sysarg,151,79)
    DataPack.writeByte(pack,#list)
  
    local boss = nil  
    for i = 1,sys.guildbosscount do
        if sys.guildboss[i] ~= nil and sys.guildboss[i].guildid == nGuildId then
            boss = sys.guildboss[i]
            break
        end
    end
    if boss == nil then
        sys.guildbosscount = sys.guildbosscount + 1
        sys.guildboss[sys.guildbosscount] = {}
        boss = sys.guildboss[sys.guildbosscount]
        boss.guildid = nGuildId
        boss.info = {}
        for i =1,#list do
            boss.info[i] = {}
            boss.info[i].state = 0 --0.可挑战 1.已击杀
            boss.info[i].awardcount = 0
            boss.info[i].award = {}
            boss.info[i].fbhandle = 0

        end
    end
   
    for i = 1,#list do
        if boss.info[i] == nil then
            boss.info[i] = {}
            boss.info[i].state = 0 --0.可挑战 1.已击杀
            boss.info[i].awardcount = 0
            boss.info[i].award = {}
            boss.info[i].fbhandle = 0
        end
        local nState = boss.info[i].state
        if nState == 1  then
           
            for j = 1,boss.info[i].awardcount do
                if boss.info[i].award[j] == nActorId then
                    nState = 2
                    break
                end
            end
            
        end
        DataPack.writeByte(pack,nState) --状态
    end
    DataPack.flush(pack)

  

end
--挑战行会副本boss
function GuildFubenBossEnter(sysarg,msgid,packet)
    local nHour,nMin,nSec = System.getTime()
    if nHour >= 23 and nMin >= 30 then
        Actor.sendTipmsg(sysarg,"非活动时间,无法进入!",ttFlyTip)
        return
    end
   
    local sys = System.getStaticVar()
    if sys.guildboss == nil then 
        sys.guildboss = {} 
        sys.guildbosscount = 0
    end
    local nIndex = DataPack.readByte(packet)
   --nIndex = msgid;
    local nGuildId = Actor.getGuildId(sysarg)
   
    if nGuildId <= 0 then return end
    local list = GuildFubenBossCfg.list
    if nIndex <= 0 or nIndex > #list then
        return
    end
    
    ---押镖状态下不允许进入
    if Actor.getIsDartFlag(sysarg) ~= 0 then
        Actor.sendTipmsg(sysarg,"押镖状态下不允许进入",ttFlyTip)
        return
    end
        local arrScene = {110,119,111,112,113,114,115,116,117,118,120,121,109,234,575,216,218,80}
    local nSceneId = Actor.getSceneId(sysarg)
    for i =1,#arrScene do
        if nSceneId == arrScene[i] then
            Actor.sendTipmsg(sysarg,"活动中不允许进入!",ttFlyTip)
            return
        end
    end
    local var = Actor.getStaticVar(sysarg)
    if var.guildbosskill ~= nil then
    Actor.sendTipmsg(sysarg,"新换行会需次日凌晨才可进入!",ttFlyTip)
        return
    end
    local boss = nil

    for i = 1,sys.guildbosscount do
        if sys.guildboss[i] ~= nil and sys.guildboss[i].guildid == nGuildId then
            boss = sys.guildboss[i]
            break
        end
    end
 
    if boss == nil then
        sys.guildbosscount = sys.guildbosscount + 1
        sys.guildboss[sys.guildbosscount] = {}
        boss = sys.guildboss[sys.guildbosscount]
        boss.guildid = nGuildId
        boss.info = {}
        for i =1,#list do
            boss.info[i] = {}
            boss.info[i].state = 0 --0.可挑战 1.已击杀
            boss.info[i].awardcount = 0
            boss.info[i].award = {}
            boss.info[i].fbhandle = 0
        end
    end


    if boss.info[nIndex].state ~= 0 then
        Actor.sendTipmsg(sysarg,"boss已被击杀",ttFlyTip)
        return
    end
    local pFuben = nil
   
    if boss.info[nIndex].fbhandle > 0 then
        pFuben = Fuben.getFubenByHandle(boss.info[nIndex].fbhandle)
        if pFuben == nil then boss.info[nIndex].fbhandle = 0 end
    end
    local fubenHandle = 0
    if pFuben == nil then
        fubenHandle = Fuben.createFuBen(list[nIndex].ref.fubenid)
        pFuben =  Fuben.getFubenByHandle(fubenHandle)
        boss.info[nIndex].fbhandle = fubenHandle
    else
        fubenHandle = Fuben.getFubenHandle(pFuben)
    end
    local nCirle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
    if nCirle < GuildFubenBossCfg.cirle  then
         Actor.sendTipmsg(sysarg,"转生等级不足,无法进入!",ttFlyTip)
        return
    end
    local nGuildLevel = Guild.getGuildLevel(nGuildId)
    if nGuildLevel < list[nIndex].guildlevel  then
        Actor.sendTipmsg(sysarg,"行会等级不足,无法进入!",ttFlyTip)
        return
    end
    --boss设置为满血
    local hScene = Fuben.getSceneHandleById(-1,boss.info[nIndex].fbhandle)
    local pMonster = Fuben.getMonsterPtrById(hScene,list[nIndex].ref.bossid)
    if pMonster ~= nil then
        local maxhp = Actor.getIntProperty(pMonster,PROP_CREATURE_MAXHP)
        Actor.changeHp(pMonster,maxhp)
        System.trace(list[nIndex].ref.bossid.."hpmax!!!!!")
    else
       
        local pMonster = Fuben.createMonster(hScene,list[nIndex].ref.bossid,list[nIndex].ref.x,list[nIndex].ref.y,0)
        if pMonster == nil then
             Actor.sendTipmsg(sysarg,"未知错误,无法进入!",ttFlyTip)
             System.trace("创建boss失败,bossid:"..list[nIndex].ref.bossid.."行会名称:"..Actor.getGuildName(sysarg))
            return
        end
    end
           -- 如果有队伍- 就离开队伍
   if Actor.isInTeam(sysarg) then
        Actor.exitTeam(sysarg)
   end
   
  local monsterName = System.getMonsterNameById(list[nIndex].ref.bossid)
   
   
   local sname = Fuben.getFubenName(fubenHandle)
    Actor.enterFuBen(sysarg,fubenHandle,-1,-1,-1)

    local str = string.format("%s进入"..sname.."，准备挑战"..monsterName.."！<我也要去挑战！/@@showWin,7,7>",Actor.getName(sysarg))
    Guild.broadcastTipmsg(nGuildId,str,ttChatWindow)
    --System.broadcastTipmsg(str,ttChatWindow)

end


--领取行会副本boss奖励
function GuildFubenBossGiveAward(sysarg,msgid,packet)
    local sys = System.getStaticVar()
    if sys.guildboss == nil then 
        sys.guildboss = {} 
        sys.guildbosscount = 0
    end
    local boss = nil
    local nGuildId = Actor.getGuildId(sysarg)
    for i = 1,sys.guildbosscount do
        if sys.guildboss[i] ~= nil and sys.guildboss[i].guildid == nGuildId then
            boss = sys.guildboss[i]
            break
        end
    end
    if boss == nil then
        Actor.sendTipmsg(sysarg,"没有可领取的奖励!",ttFlyTip)
        return
    end
    local nIndex = DataPack.readByte(packet)
   -- nIndex =msgid;
    local list = GuildFubenBossCfg.list
    if nIndex <= 0 or nIndex > #list then
        return
    end
    if boss.state == 0 then
         Actor.sendTipmsg(sysarg,"boss未击杀,无法领取奖励!",ttFlyTip)
         return
    end
 
    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    if boss.info[nIndex].award == nil then return end
    --是否已经领取了
    for i = 1, boss.info[nIndex].awardcount do
        if boss.info[nIndex].award[i] == nActorId then
            Actor.sendTipmsg(sysarg,"已经领取过奖励了!",ttFlyTip)
            return
        end
    end
     
    local nSore = Actor.getGuildGx(sysarg)--根据贡献度获取奖励
    local nCirle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
   
    if nSore <= list[nIndex].award.contri or  nCirle < list[nIndex].award.level then
        Actor.sendTipmsg(sysarg,"条件不足,无法领取",ttFlyTip)
        return
    end
    
    if Awards.CheckBagGridCount(sysarg,list[nIndex].award.award) then
		Awards.Give(sysarg,list[nIndex].award.award,LogIds.GuildFubenBoss,"行会boss"..nIndex)
    else   
        Actor.sendTipmsg(sysarg,"包裹格子不足，无法领取,请先清理包裹!",ttFlyTip)
        return
	end
    Actor.changeGuildGx(sysarg,-list[nIndex].award.contri)

    boss.info[nIndex].awardcount = boss.info[nIndex].awardcount + 1
    boss.info[nIndex].award[boss.info[nIndex].awardcount] =  nActorId

    GuildFubenBossGetListState(sysarg)
end

--行会boss副本被击杀
function HandleGuildFubenBossKill(sysarg,monid,fubenId,monster)
   

    local nGuildId = Actor.getGuildId(sysarg)
    local monsterType = System.getMonsterTypeById(monid)
    if monsterType == 4 and fubenId > 0  then
        local cfg = nil
       
        for i =1,#GuildFubenBossCfg.list do
          
            if GuildFubenBossCfg.list[i].ref.fubenid ==  fubenId then
                cfg = GuildFubenBossCfg.list[i]
                if nGuildId <= 0 then Actor.killActor(sysarg) end
                break
            end    
        end
       
        if cfg ~= nil then
            local sys = System.getStaticVar()
            if sys.guildboss == nil then 
                sys.guildboss = {} 
                sys.guildbosscount = 0
            end
            local boss = nil
            for i = 1,sys.guildbosscount do
                if sys.guildboss[i].guildid == nGuildId then
                    boss = sys.guildboss[i]
                    break
                end
            end
          
            if boss~= nil then
              
                for i=1,#GuildFubenBossCfg.list do
                    local nMonsterId = GuildFubenBossCfg.list[i].ref.bossid
                    if nMonsterId == monid then
                        if boss.info == nil then boss.info = {} end
                        if boss.info[i] == nil then
                            boss.info[i] = {}
                            boss.info[i].state = 0 --0.可挑战 1.已击杀
                            boss.info[i].awardcount = 0
                            boss.info[i].award = {}
                            boss.info[i].fbhandle = 0
                        end
                        local fbPtr = Actor.getFubenHandle(sysarg)
                       
                        if boss.info[i].state == 1 then
                            local pFuben = Actor.getFubenPrt(sysarg)
                            if pFuben ~= nil then
                                local playerList = LuaHelp.getFbActorList(pFuben)
                       	        if playerList ~= nil then
				                    for j = 1, #playerList do
					                    local player = playerList[j]
					                    if player then	
                                            Actor.exitFuben(player)
                                        end
                                    end
                                end

                            end
                            return
                        end
                        boss.info[i].state = 1 --设置为击杀标识
                        --发送广播monster
                        local str = string.format("%s已被消灭，行会成员都可领取奖励！<我也要去挑战！/@@showWin,7,7>！",Actor.getName(monster))
                        --System.broadcastTipmsg(str,ttChatWindow)
						Guild.broadcastTipmsg(nGuildId,str,ttChatWindow)
                       
                        Fuben.setFubenProgress(fbPtr,FB_FS_GETAWARD)
                        break
                    end

                end

            end
        end

    end

end