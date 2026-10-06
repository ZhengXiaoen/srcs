
WorldBossAwardCfg = 
{
    --第一名
    {
        --道具id 数量 是否绑定
         {item_id = 561,count=1,bind=1,},
         {item_id = 507,count=7,bind=1,},
         {item_id = 85,count=7,bind=1,},

    },
    --2到5名
    {
        --道具id 数量 是否绑定
        {item_id = 560,count=1,bind=1,},
        {item_id = 507,count=5,bind=1,},
        {item_id = 85,count=5,bind=1,},
    },
    --6至20名
    {
        --道具id 数量 是否绑定
        {item_id = 507,count=2,bind=1,},
        {item_id = 85,count=2,bind=1,},
    },
}
function StartActivity_WorldBoss(sysarg, startTime)
	if System.isCrossServer() ==true then
		return 
	end
    print("世界Boss活动开启")
    local sVar = System.getStaticVar()
    sVar.worldbossing = true 
    System.getDyanmicVar().WorldBossStartTime = startTime or System.getCurrMiniTime()
    local hScene = Fuben.getSceneHandleById(119, 0)
    Fuben.clearMonster(hScene,666)
	local pMonster = Fuben.createMonster(hScene, 666, 45, 54, 0)
end

function WorldBoss_AddBuff(sysarg,bType)
local cfgBuff =
         {
           {type=0,value=100000,money=50,buff={163,164,165},},
           {type=0,value=500000,money=100,buff={166,167,168},},
           {type=0,value=1000000,money=200,buff={169,170,171},},
         }
     local var = Actor.getDyanmicVar(sysarg)
     if var.worldbossbuff == nil then var.worldbossbuff = 0 end
     if var.worldbossbuff + 1 > table.getn(cfgBuff) then
        Actor.sendTipmsg(sysarg,"已经到最高等级,无法继续提升!",ttFlyTip)
        return
     end
     
     local nCuridx = var.worldbossbuff + 1
 
     local cfg = cfgBuff[nCuridx]
     if bType == 0 then
         if Actor.getMoneyCount(sysarg,cfg.type) < cfg.value then
            Actor.sendTipmsg(sysarg,"金币不足"..cfg.value.."无法提升!",ttFlyTip)
            return
        end
         Actor.changeMoney(sysarg,cfg.type,-cfg.value,LogIds.worldbossbuff,"世界BOSSBUFF")
    else 
        if Actor.getMoneyCount(sysarg,mtYuanbao) < cfg.money then
            Actor.sendTipmsg(sysarg,"元宝不足"..cfg.money.."无法提升!",ttFlyTip)
            return
        end
         Actor.changeMoney(sysarg,mtYuanbao,-cfg.money,LogIds.worldbossbuff,"世界BOSSBUFF")
     end
    
    

     --把之前的buff删掉
     if nCuridx > 1 then
        local delcfg = cfgBuff[nCuridx -1]
        for i =1,table.getn(delcfg.buff) do
            Actor.delBuffById(sysarg,delcfg.buff[i])
        end
     end
     --增加新的buff
     for i = 1,table.getn(cfg.buff) do
        Actor.addBuffById(sysarg,cfg.buff[i])
     end
     
     Actor.sendTipmsg(sysarg,"提升成功,当前攻击等级："..nCuridx,ttFlyTip)
     local netPack = DataPack.allocPacket(sysarg, 139, 202)
     DataPack.writeByte(netPack,nCuridx)
	 DataPack.flush(netPack)
     var.worldbossbuff = nCuridx
end
--退出世界BOSS活动
function exit_WorldBoss(sysarg)
     local sVar = System.getStaticVar()
     
local cfgBuff =
         {
           {type=0,value=100000,buff={163,164,165},},
           {type=0,value=500000,buff={166,167,168},},
           {type=0,value=1000000,buff={169,170,171},},
         }
    if sysarg ==nil then return end
    if Actor.getSceneId(sysarg) ~= 119 then
        return
    end
	Actor.returnCity(sysarg)	
    sendExitActivity(sysarg, 21)	
    --删除buff
    local var = Actor.getDyanmicVar(sysarg)
    if var.worldbossbuff ~= nil then
        local cfg = cfgBuff[var.worldbossbuff]
        if cfg ~= nil then
            for i = 1,table.getn(cfg.buff) do
                Actor.delBuffById(sysarg,cfg.buff[i])
                
            end
        end

    end
    var.worldbossbuff = nil
    
    if sVar.worldbossing == nil then 
        Actor.sendTipmsg(sysarg,"活动时间结束,已将您移出活动场景",ttDialog)
    end
    
   -- print("活动时间结束")
end
function EndActivity_WorldBoss()
	if System.isCrossServer() ==true then
		return 
	end
    print("世界Boss活动关闭")
    local hScene = Fuben.getSceneHandleById(119, 0)
    
    local pMonsterPtr = Fuben.getMonsterPtrById(hScene,666)
    if pMonsterPtr ~= nil then
        System.broadcastTipmsg("遗憾,我大陆勇士竟然无人可击杀这只强悍的世界BOSS,可悲!",ttScreenCenter + ttChatWindow);
    else
        local pRank = Ranking.getRanking("monster_rank_666.txt")
        if pRank ~= nil then
            for i =1,20 do
                local pRankItem = Ranking.getItemFromIndex(pRank,i-1)
                if pRankItem == nil then break end
                local cfg = nil
                if i == 1 then
                    cfg = WorldBossAwardCfg[1]
                    --广播
                    local szName = Ranking.getSub(pRankItem,0)
                    local str = string.format("祝贺<(n%s)>玩家在对抗世界BOSS中伤害荣登第一,这份荣耀和实力受万人仰慕.",szName)
                    System.broadcastTipmsg(str,ttChatWindow)

                elseif i >=2 and i <= 5 then
                    cfg = WorldBossAwardCfg[2]
                else
                    cfg = WorldBossAwardCfg[3]
                end
                local nActorId = Ranking.getId(pRankItem)
                local sAward = ""
                for j = 1,table.getn(cfg) do
                     sAward = sAward..cfg[j].item_id..","..cfg[j].count..","..cfg[j].bind 
                     if table.getn(cfg) > 1 and j < table.getn(cfg) then
                        sAward = sAward.."/"
                     end
                end
               System.AddMail(nActorId,6,0,"世界boss","世界boss奖励",0,0,sAward)

            end
            Ranking.clearRanking(pRank)

        end
    end
     local sVar = System.getStaticVar()
    sVar.worldbossing = nil 
    System.getDyanmicVar().WorldBossStartTime = nil
     Fuben.clearMonster(hScene,666)
    local playerList = LuaHelp.getSceneActorListById(119)
	if playerList ~= nil then
		for i = 1, #playerList do
			local player = playerList[i]
			if player ~= nil then
				exit_WorldBoss(player)
			end
		end
	end	
 
end