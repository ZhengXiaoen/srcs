--#include "data\config\item\MergerServerConfig.lua" once
--#include "MergerServer\DisCountShop.lua" once
--#include "MergerServer\AllPeopleGift.lua" once
--#include "MergerServer\SuperGiftBag.lua" once
--#include "MergerServer\CombineServerKing.lua" once
--#include "MergerServer\CombineServerCumulative.lua" once
--#include "MergerServer\CombineEveryDayGift.lua" once

MiscsImplement.handleGetMergerGift = function(sysarg, msgid, packet)

	--if not packet or not MergerServerCfg then return false end
	--	
	---- 是否在合服时间内
	--local CombineDays = System.getDaysSinceCombineServer()
	--if CombineDays > 5 or CombineDays <= 0 then 	
	--	return 
	--end
	--
	--local nMergerType = DataPack.readByte(packet)   --合服活动类型
    --
	--if nMergerType == 1 then
	--	return GetCommonLoginGift(sysarg,packet)
	--elseif nMergerType == 2 then
	--	return CumulativeRecharge(sysarg,packet)
	--elseif nMergerType == 3 then
	--	return getCombineServerKingAwards(sysarg,packet)
	--elseif nMergerType == 4 then 
	--	return GetSuperGiftBag(sysarg,packet)
	--elseif nMergerType == 5 then
	--	return CombineLottery(sysarg,packet)
	--elseif nMergerType == 6 then
	--	return EnterCombineScene(sysarg,packet)
	--elseif nMergerType == 7 then
	--	return CombineFirstPay(sysarg,packet)
	--elseif nMergerType == 8 then -- 下发合服商店数据
	--	return SendCombineShopData(sysarg,packet)
	--elseif nMergerType == 9 then -- 刷新合服商店物品
	--	return RefreshCombineShopItems(sysarg,packet)
	--elseif nMergerType == 10 then -- 购买合服商店物品
	--	return BuyCombineShopItem(sysarg,packet)	
	--end

end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetMergerServerGift, MiscsImplement.handleGetMergerGift)