-- 旧开服充值榜已下架；保留调用接口，充值榜统一放到周年庆典。
function Pay_Rank_StartServer()
    local svar = System.getStaticVar()
    svar.pay_ranking = nil
    svar.pay_rank_index = nil
    svar.pay_rank_minitime = nil
end
function Pay_Rank_CreateRank() end
function Pay_Rank_StopServer() end
function Pay_Rank_UpdateItem(actorId, sActorName, nYuanBao) end
function Pay_Rank_Activity_Start(nIndex) end
function Pay_Rank_Activity_Stop() end
function Pay_Rank_Query(sysarg) end
