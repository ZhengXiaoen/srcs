--抢红包活动-

--#include "data\config\RedPacketCfg.lua" once
--#include "data\functions\Activity\SpringFestivalActivity.lua" once
--#include "data\config\activity\SpringFestivalCfg.lua" once
g_RedPacketLogList = {} --日志
--初始化抢红包信息
function InitRedPacket(isCombineServer)
    if isCombineServer == nil then isCombineServer = false end
    local sys = System.getStaticVar()
    
    if sys.redpack == nil then
        sys.redpack = {}
        sys.redpack.count = RedPacketCfg.InitYuanBao
        sys.redpack.isfirstaward = 0
    end
    --合服后清空
    if  isCombineServer == true then
        sys.redpack.count = 0
        sys.redpack.isfirstaward = 1
    end
     local pRank = Ranking.getRanking(RedPacketCfg.RankName)
    if pRank ~= nil then
            Ranking.clearRanking(pRank)
    end 
     pRank =  Ranking.add(RedPacketCfg.RankName,100)
     Ranking.addColumn(pRank, "name")
     

     
end

--加入抢红包日志
--count 红包数量
function AddRedPacketLog(sysarg,count)
    local sys = System.getStaticVar()
    local nCurrentTime= System.getCurrMiniTime()
    local szName = Actor.getName(sysarg)
    
    local cfg= {}
    cfg.time = nCurrentTime
    cfg.name = szName
    cfg.count = count
    table.insert(g_RedPacketLogList,1,cfg)
    if #g_RedPacketLogList > RedPacketCfg.LogMaxCont then
        table.remove(g_RedPacketLogList,RedPacketCfg.LogMaxCont)
    end
    cfg = g_RedPacketLogList[1]
 
end

--发送抢红包日志
function SendRedPacketLog(sysarg)
    local pack = DataPack.allocPacket(sysarg,151,61)
    DataPack.writeByte(pack,#g_RedPacketLogList)
    --for i =1,#g_RedPacketLogList do
    for i,cfg in ipairs(g_RedPacketLogList) do
        DataPack.writeUInt(pack,cfg.time)
        DataPack.writeString(pack,cfg.name)
        DataPack.writeWord(pack,cfg.count)
    end
    DataPack.flush(pack)
end
--红包系统跨天更新
function RedPacketCross()
   
    g_RedPacketLogList = {}
    local sys = System.getStaticVar()
    local pRank = Ranking.getRanking(RedPacketCfg.RankName)
    if pRank ~= nil then
        for i = 1,#RedPacketCfg.Title do
             pRankItem = Ranking.getItemFromIndex(pRank,i - 1)
             if pRankItem ~= nil then
                local nActorId = Ranking.getId(pRankItem)
                local pActor = System.getEntityPtrByActorID(nActorId)
                if pActor ~= nil then
                    Actor.setTopTitle(pActor,RedPacketCfg.Title[i],false)
                end
             end
        end
        Ranking.clearRanking(pRank)
    end

    --春节活动，注入资金
    if is_spring_festival_time() and SpringFestivalCfg.shousui.isOpen ~= false then
        InitRedPacket()
        local sys = System.getStaticVar()
        sys.redpack.count = sys.redpack.count + SpringFestivalCfg.shousui.money
    end
    
end

--红包玩家跨天更新
function RedPacketCrossPlayer(sysarg)
    local var = Actor.getStaticVar(sysarg)
    var.redpacket = nil
end
--初始化角色红包信息
function InitPlayerRedPacket(sysarg)
    local var = Actor.getStaticVar(sysarg)
    if var.redpacket == nil then
        var.redpacket ={}
        var.redpacket.sendcount = 0--已发红包数量
        var.redpacket.count = RedPacketCfg.RobCount or 0 --剩余抢红包次数
        
        var.redpacket.time = 0 --冷却时间
    end
    if var.redpacket.time == nil then var.redpacket.time = 0 end
end
--发送红包信息
function SendRedPacketInfo(sysarg)
    local pack = DataPack.allocPacket(sysarg,151,60)
    InitPlayerRedPacket(sysarg)
    local var = Actor.getStaticVar(sysarg)
    local sys = System.getStaticVar()
    if sys.redpack == nil then return end
    DataPack.writeUInt(pack,sys.redpack.count)
    DataPack.writeUInt(pack,var.redpacket.sendcount) --已发红包数量
    DataPack.writeByte(pack,var.redpacket.count) --剩余抢红包数量
    local nTime = var.redpacket.time - System.getCurrMiniTime()
    --print("SendRedPacketInfo:"..nTime)
    if nTime< 0 then nTime = 0 end
    DataPack.writeInt(pack,nTime) --剩余冷却时间，秒数
    --排行榜信息
    local pRank = Ranking.getRanking(RedPacketCfg.RankName)
    if pRank ~= nil then
        local nRankItemCount = Ranking.getRankItemCount(pRank)
        if nRankItemCount > RedPacketCfg.MaxRankList then
            nRankItemCount = RedPacketCfg.MaxRankList
        end
        

        local ranklist = GetRedPacketRank()
       
      
       
--        local function compf(a,b)
--            return a.rank > b.rank
--        end
--        table.sort(ranklist,compf)
     
        nRankItemCount =#ranklist
       nRankItemCount = #RedPacketCfg.Title
        DataPack.writeByte(pack,nRankItemCount)
        for i = 1, nRankItemCount do
            local ret = nil
            for j =1,#ranklist do
              
                if ranklist[j].rank == i then
                  
                    ret = ranklist[j]
                    break

                end

            end
             if ret ~= nil then
                DataPack.writeString(pack,ret.name)
                DataPack.writeUInt(pack,ret.point)
            else
                
                DataPack.writeString(pack,"")
                DataPack.writeUInt(pack,0)
            end
--            local ret = ranklist[i]
----            pRankItem = Ranking.getItemFromIndex(pRank,i - 1)
----            if pRankItem ~= nil then 
--            if ret ~= nil then
--                DataPack.writeString(pack,ret.name)
--                DataPack.writeUInt(pack,ret.point)
--            else

--                DataPack.writeString(pack,"")
--                DataPack.writeUInt(pack,0)
--            end
        end
    else
        DataPack.writeByte(pack,0)
    end

    DataPack.flush(pack)
end


--登录后获得称号
function HandPlayerLoginRedPacket(sysarg)

    --给予称号
    local pRank = Ranking.getRanking(RedPacketCfg.RankName)
    if pRank ~= nil then
        --当天维护掉线的情况- 特殊处理
        InitPlayerRedPacket(sysarg)
        local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        local var = Actor.getStaticVar(sysarg)
        if var.redpacket.sendcount ~= nil and var.redpacket.sendcount > 0 then
            local pRankItem = Ranking.getItemPtrFromId(nActorId)
            if pRankItem == nil then
                pRankItem = Ranking.addItem(pRank,nActorId,var.redpacket.sendcount) 
                Ranking.setSub(pRankItem,0,Actor.getName(sysarg))
            end

        end

        local nActorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
        local ranklist = GetRedPacketRank()
        for i = 1,#RedPacketCfg.Title do

            local ret = ranklist[i]
            if ret ~= nil and ret.rank > 0 and ret.id == nActorid then
                Actor.setTopTitle(sysarg,RedPacketCfg.Title[ret.rank],true)
            end
        end
--         for i = 1,#RedPacketCfg.Title do
--             pRankItem = Ranking.getItemFromIndex(pRank,i - 1)
--             if pRankItem ~= nil then
--                local nPoint = Ranking.getPoint(pRankItem)
--                if nPoint >= RedPacketCfg.upRankNeedMoney[i] then
--                    nActorId = Ranking.getId(pRankItem)
--                    if nActorId == Actor.getIntProperty(sysarg,PROP_ENTITY_ID) then
--                        Actor.setTopTitle(sysarg,RedPacketCfg.Title[i],true)
--                        break
--                    end
--                end

--             end
--        end
    end


end
--玩家发红包
function HandSendRedPacket(sysarg,count)
   count = tonumber(count)
   if Actor.getMoneyCount(sysarg,mtYuanbao) < count then
      Actor.sendTipmsg(sysarg,"元宝不足,无法发送!",ttFlyTip)
      return
   end
   InitPlayerRedPacket(sysarg)
   local sys = System.getStaticVar()
   Actor.changeMoney(sysarg,mtYuanbao,-count,LogIds.sendredpacket,"发红包")
   local var = Actor.getStaticVar(sysarg)
   var.redpacket.sendcount = var.redpacket.sendcount + count
  
  
   sys.redpack.count = sys.redpack.count + count
   Actor.sendTipmsg(sysarg,"成功捐献"..count.."元宝!",ttFlyTip)
  
   --更新排行榜
   local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
   local pRank = Ranking.getRanking(RedPacketCfg.RankName)
   local pRankItem = Ranking.getItemPtrFromId(pRank,nActorId)
   local nOldPos = -1
   if pRankItem ~= nil then
      nOldPos = Ranking.getItemIndexFromId(pRank,nActorId)
      Ranking.updateItem(pRank,nActorId, count)
     
   else
      pRankItem = Ranking.addItem(pRank,nActorId,count) 
      Ranking.setSub(pRankItem,0,Actor.getName(sysarg))
   end
   local nPos = Ranking.getItemIndexFromId(pRank,nActorId)
   local arrTitle = {"济世菩萨","乐善好义","轻财好施"}
  --and nPos ~= nOldPos
   if nPos < #RedPacketCfg.Title  then
        if count >= 1000 then
            local szBroadcast="<(n%s)>乐善好施投元宝到奖金池中，大家快来抢红包啦！排行榜前三位将有独特称号！<前往查看/@@showWin,240>"
            System.broadcastTipmsg(string.format(szBroadcast,Actor.getName(sysarg)),ttChatWindow)

        end


        Actor.sendTipmsg(string.format("进入排行榜第%d名，获得称号%s",nPos+1,arrTitle[nPos + 1]),ttFlyTip)

        pRankItem = Ranking.getItemFromIndex(pRank,3)
        if pRankItem ~= nil then
            local nActorId = Ranking.getId(pRankItem)
            local pActor = System.getEntityPtrByActorID(nActorId)
            if pActor ~= nil then
                Actor.sendTipmsg("你已被挤下抢红包排行榜！",ttFlyTip)
            end
        end
     --把之前有玩家的称号撤销
     for i = 1,#RedPacketCfg.Title + 1 do
        pRankItem = Ranking.getItemFromIndex(pRank,i - 1)
        if pRankItem ~= nil then
            local nActorId = Ranking.getId(pRankItem)
            local pActor = System.getEntityPtrByActorID(nActorId)
            
            if pActor ~= nil then
                for j =1,#RedPacketCfg.Title do

                    Actor.setTopTitle(pActor,RedPacketCfg.Title[j],false)
                end
                
            end
        end
     end
     
     --给予称号
--     for i = 1,#RedPacketCfg.Title do
--         pRankItem = Ranking.getItemFromIndex(pRank,i - 1)
--         if pRankItem ~= nil then
--            local nPoint = Ranking.getPoint(pRankItem)
--            if nPoint >= RedPacketCfg.upRankNeedMoney[i] then
--                local nActorId = Ranking.getId(pRankItem)
--                local pActor = System.getEntityPtrByActorID(nActorId)
--                if pActor ~= nil then
--                    Actor.setTopTitle(pActor,RedPacketCfg.Title[i],true)
--                end

--            end

--         end
--     end
        local ranklist = GetRedPacketRank()
        
        for i = 1,#RedPacketCfg.Title do
            local ret = ranklist[i]
           
            if ret ~= nil and ret.rank > 0 then
                local pActor = System.getEntityPtrByActorID(ret.id)
                if pActor ~= nil then
                 Actor.setTopTitle(pActor,RedPacketCfg.Title[ret.rank],true)
                end
                
            end
        end
        
      
   end
   --广播所有玩家元宝资金池被改变
    local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
    HandleBroadcastMoneyChange()

   SendRedPacketInfo(sysarg)
end

--获取排名位置的排行榜信息
function GetRedPacketRank(nIndex,havet)

   nIndex = tonumber(nIndex)
   local pRank = Ranking.getRanking(RedPacketCfg.RankName)
   
   local retlist = {}
    local nStartIndex = 0


   local pRankItem = Ranking.getItemFromIndex(pRank,0)
   
  
   if pRankItem ~= nil then
        local nPoint = Ranking.getPoint(pRankItem)
        for i = 1,#RedPacketCfg.upRankNeedMoney do

            if nPoint >= RedPacketCfg.upRankNeedMoney[i] then
                local ret = {rank=0,id=0,name="",point=0}
                ret.id = Ranking.getId(pRankItem)
                ret.name = Ranking.getSub(pRankItem,0)
                ret.point = Ranking.getPoint(pRankItem)
                ret.rank = i
                table.insert(retlist,ret)
                nStartIndex = i
                
                break
            end
        end
   end

   --取第二名
    pRankItem = Ranking.getItemFromIndex(pRank,1)
    if pRankItem ~= nil then
        local nPoint = Ranking.getPoint(pRankItem)
        for i = 2,#RedPacketCfg.upRankNeedMoney do
            if nPoint >= RedPacketCfg.upRankNeedMoney[i] then
                local ret = {rank=0,id=0,name="",point=0}
                ret.id = Ranking.getId(pRankItem)
                ret.name = Ranking.getSub(pRankItem,0)
                ret.point = Ranking.getPoint(pRankItem)
                
                
                if nStartIndex == i then
                    nStartIndex = nStartIndex + 1
                else
                    nStartIndex = i
                end
                
                
                ret.rank = nStartIndex
                if nStartIndex <= 3 then
                    table.insert(retlist,ret)
                end
                 
                break
            end
        end
   end
   --取第三名
     pRankItem = Ranking.getItemFromIndex(pRank,2)
    if pRankItem ~= nil then
        local nPoint = Ranking.getPoint(pRankItem)
        for i = 3,#RedPacketCfg.upRankNeedMoney do
            if nPoint >= RedPacketCfg.upRankNeedMoney[i] then
                local ret = {rank=0,id=0,name="",point=0}
                ret.id = Ranking.getId(pRankItem)
                ret.name = Ranking.getSub(pRankItem,0)
                ret.point = Ranking.getPoint(pRankItem)
               
               
                if nStartIndex == i then
                    nStartIndex = nStartIndex + 1
                 else
                    nStartIndex = i
                end
                 nStartIndex = i
                ret.rank = nStartIndex
                
                if nStartIndex <= 3 then
                    table.insert(retlist,ret)
                end
                 
                break
            end
        end
   end
   return retlist
--    for i = 1,#RedPacketCfg.Title do
--       local pRankItem = Ranking.getItemFromIndex(pRank,i - 1)
--        local bBreak = false
--        if pRankItem ~= nil then
--            local nPoint = Ranking.getPoint(pRankItem)
--            for k = 1,#RedPacketCfg.upRankNeedMoney do

--                 if nPoint >= RedPacketCfg.upRankNeedMoney[k] then
--                    ret.rank = k
--                    print("have"..#havet.."point:"..nPoint.."name:"..Ranking.getSub(pRankItem,0).."rank:"..ret.rank)
--                    for j = #havet,1,-1 do

--                        if havet[j] == nIndex then
--                            ret.rank = j + 1

--                            break
--                        end
--                    end
--                    table.insert(havet,ret.rank)    
--                    ret.id = Ranking.getId(pRankItem)
--                    ret.name = Ranking.getSub(pRankItem,0)
--                    ret.point = Ranking.getPoint(pRankItem)
--                    bBreak = true
--                    break

--                end

--         end
--         if bBreak then break end   
--        end

--    end
     
  --  return ret
end
--广播元宝池资金被改变
function HandleBroadcastMoneyChange()
    local sys = System.getStaticVar()
    local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	for i, player in ipairs(playerList) do
		local pack = DataPack.allocPacket(player,151,65)
        DataPack.writeUInt(pack,sys.redpack.count)
        DataPack.flush(pack)
	end
end
--玩家抢红包
function HandRobRedPaclet(sysarg)
    InitPlayerRedPacket(sysarg)
     --是否是vip
     if Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE) < RedPacketCfg.NeedVipLevel then
         Actor.sendTipmsg(sysarg,"vip等级不足"..RedPacketCfg.NeedVipLevel.."级,无法抢红包！",ttFlyTip)
        return
     end
    local var = Actor.getStaticVar(sysarg)
    
    if var.redpacket.count <= 0 then
        Actor.sendTipmsg(sysarg,"红包次数已经抢完，请明日再来！",ttFlyTip)
        return
    end
  
    --是否是在冷却时间
   
    if var.redpacket.time  > 0 and System.getCurrMiniTime() <  var.redpacket.time then
        Actor.sendTipmsg(sysarg,"正在冷却时间，请稍后！",ttFlyTip)
        return

    end
    local sys = System.getStaticVar()
    if sys.redpack.count <= 0 then
        Actor.sendTipmsg(sysarg,"元宝池为0，无法抢红包！",ttFlyTip)
        return
    end
   
    
   
    local nGiveYuanBao = 0
    if sys.redpack.count >= RedPacketCfg.First.YuanBao then
        if System.getRandomNumber(10000) + 1 <=  RedPacketCfg.First.Rate then
            nGiveYuanBao = RedPacketCfg.First.YuanBao
            System.SendPlatformMsg(string.format("恭喜<(n%s)>抢到【%d元宝】！",Actor.getName(sysarg),nGiveYuanBao), ttMousePosTip)
        end
    end
    if nGiveYuanBao == 0 then
        local nMinYuanBao = tonumber(RedPacketCfg.MinYuanBao) or 1
        local nMaxYuanBao = tonumber(RedPacketCfg.MaxYuanBao) or nMinYuanBao
        if nMinYuanBao < 1 then nMinYuanBao = 1 end
        if nMaxYuanBao < nMinYuanBao then nMaxYuanBao = nMinYuanBao end
        if nGiveYuanBao > sys.redpack.count then nGiveYuanBao = sys.redpack.count end

        if sys.redpack.count < nMinYuanBao then
            nGiveYuanBao = sys.redpack.count
        else
            local nRangeMax = nMaxYuanBao
            if nRangeMax > sys.redpack.count then nRangeMax = sys.redpack.count end
            nGiveYuanBao = nMinYuanBao + System.getRandomNumber(nRangeMax - nMinYuanBao + 1)
        end
    end
    
    var.redpacket.count = var.redpacket.count - 1
    
   var.redpacket.time = 0
    if var.redpacket.count > 0 then
        local nSec = tonumber(RedPacketCfg.CoolDown) or 0
        --print("秒数:"..nSec)
        var.redpacket.time = System.getCurrMiniTime() + nSec
    end
    
    sys.redpack.count = sys.redpack.count - nGiveYuanBao
    Actor.changeMoney(sysarg,mtYuanbao,nGiveYuanBao,LogIds.robredpacket,"抢红包")

    --加入日志
    AddRedPacketLog(sysarg,nGiveYuanBao)

    Actor.sendTipmsg(sysarg,"恭喜抢到"..nGiveYuanBao.."元宝!",ttFlyTip)
    System.broadcastTipmsg(string.format("恭喜<(n%s)>抢到【%d元宝】<我也要去抢红包/@@showWin,240>!",Actor.getName(sysarg),nGiveYuanBao),ttChatWindow)
    SendRedPacketLog(sysarg)
    SendRedPacketInfo(sysarg)

    --广播元宝池资金被改变
    HandleBroadcastMoneyChange()
end