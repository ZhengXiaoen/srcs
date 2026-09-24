--开服活动充值活动

local sRankName = "pay_rank"
local sRankFile = "data/runtime/rank/pay_rank.txt"

local award =
{
    {item_id =391 ,count = 2,bind=1,}, --第一名
    {item_id =391 ,count = 1,bind=1,}, --2
    {item_id =378 ,count = 1,bind=1,}, --3
    {item_id =377 ,count = 2,bind=1,}, --4
    {item_id =377 ,count = 2,bind=1,}, --5
    {item_id =376 ,count = 5,bind=1,}, --6
    {item_id =376 ,count = 5,bind=1,}, --7
    {item_id =376 ,count = 5,bind=1,}, --8
    {item_id =376 ,count = 5,bind=1,}, --9
    {item_id =376 ,count = 5,bind=1,}, --10
}
--服务器初始化
function Pay_Rank_StartServer()
    --if System.getDaysSinceOpenServer() <= 3  then
       Pay_Rank_CreateRank()
   -- end
end

function Pay_Rank_CreateRank()
    local pRank = Ranking.add(sRankName,10,0,0)
    Ranking.addColumn(pRank,"id")
    Ranking.addColumn(pRank,"name")
    
    Ranking.load(pRank,sRankFile)
    
    Ranking.addRef(prank)
end
--服务器退出
function Pay_Rank_StopServer()
    --开服活动- 充值排行榜
    local pRank = Ranking.getRanking(sRankName)
    if pRank ~= nil then
        Ranking.save(pRank,sRankFile)
    end
end
--更新充值排行榜
function Pay_Rank_UpdateItem(actorId,sActorName,nYuanBao)
   
    local sVar = System.getStaticVar()
    if sVar.pay_ranking ~= nil then
        local pRank = Ranking.getRanking(sRankName)
        if pRank ~= nil then
            local pRankItem = Ranking.getItemPtrFromId(pRank,actorId)
            if pRankItem == nil then
                pRankItem = Ranking.addItem(pRank,actorId,nYuanBao)
                Ranking.setSub(pRankItem,0,tostring(actorId))
                Ranking.setSub(pRankItem,1,sActorName)
                
            else
                Ranking.updateItem(pRank,actorId,nYuanBao)
            end
        else
            print("获取充值排行榜失败~Pay_Rank_UpdateItem")
        end
    end
end

--活动开始
function Pay_Rank_Activity_Start(nIndex)
    local sVar = System.getStaticVar()
    sVar.pay_ranking = System.getCurrMiniTime()
    sVar.pay_rank_index= tonumber(nIndex) --第几轮
    sVar.pay_rank_minitime= System.getCurrMiniTime()
    --创建排行榜--Pay_Rank_CreateRank()
    
    local str = "开服活动充值排行第"..sVar.pay_rank_index.."轮开启!"
    System.broadcastTipmsg(str,ttScreenCenter+ttChatWindow)
end
--活动结束
function Pay_Rank_Activity_Stop()
   
     local sVar = System.getStaticVar()
     if sVar.pay_ranking == nil then return end
     sVar.pay_ranking = nil
     if sVar.pay_rank_index ~= nil then
        local str = "开服活动充值排行第"..sVar.pay_rank_index.."轮结束!"
        System.broadcastTipmsg(str,ttScreenCenter+ttChatWindow)
     end
     sVar.pay_rank_index = 0
     --清算
     local pRank = Ranking.getRanking(sRankName)
     if pRank ~= nil then
        for i=1,table.getn(award) do
            local pRankItem =  Ranking.getItemFromIndex(pRank,i-1)
            if pRankItem ~= nil then
                local actorId = tonumber(Ranking.getSub(pRankItem,0))
                local szName= Ranking.getSub(pRankItem,1)
                local  awardIdAndCount = 0
                
                awardIdAndCount=System.setInt2Byte(awardIdAndCount,true,award[i].count)
				awardIdAndCount=System.setInt2Byte(awardIdAndCount,false,award[i].item_id)
                local str = "开服活动,充值排行第"..i.."名奖励,只要按一键提取就可以领取奖品."
				System.AddMail(actorId,6,0,"开服活动充值排行奖励",str,awardIdAndCount,0)
            end
        end
        --删除排行榜
        Ranking.clearRanking(pRank)
       
     end
end

--查询排行榜
function Pay_Rank_Query(sysarg)
    local time = 60 * 60 * 8
    local sVar = System.getStaticVar()
    if sVar.pay_rank_minitime ~= nil then
        time = time - (System.getCurrMiniTime() - sVar.pay_rank_minitime)
    else
        time = 0 --未开启
    end
   
    local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
    local netPack = DataPack.allocPacket(sysarg, 139, 182)
    local nYuanBao = 0
    local nRank = 0
    local pRank = Ranking.getRanking(sRankName)
    local pRankItem = nil
    if pRank ~= nil then
        for i = 1,10 do
            pRankItem =  Ranking.getItemFromIndex(pRank,i-1)
          
            if pRankItem ~= nil then
                if actorID == tonumber(Ranking.getSub(pRankItem,0)) then
                    nRank = i
                    nYuanBao = Ranking.getPoint(pRankItem)
                    break
                end
            end
           
        end
    end
    
    DataPack.writeByte(netPack,nRank)
    DataPack.writeInt(netPack,nYuanBao)
    DataPack.writeInt(netPack,time)
    if pRank ~= nil then
        DataPack.writeByte(netPack,3)
         for i = 1,3 do
            pRankItem = Ranking.getItemFromIndex(pRank,i-1)
            local szName = ""
            if pRankItem ~= nil then
                szName = Ranking.getSub(pRankItem,1)
            end
            DataPack.writeString(netPack,szName)
         end
    else
        DataPack.writeByte(netPack,0)
    end
    DataPack.flush(netPack)

end