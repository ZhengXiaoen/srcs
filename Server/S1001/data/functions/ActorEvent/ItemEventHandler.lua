--[[File:ItemEventHandler.lua]]
local GlobalItemFn = {}

	


--#include "./NormalItem\ReduceKillValueItem.lua" once  --降低红名值
--#include "./NormalItem\RollItem.lua" once     --爆率物品
--#include "./NormalItem\ProabilityItem.lua" once     --爆率物品
--#include "./NormalItem\MultiPropDrop.lua" once     -- 新春活动
--#include "./NormalItem\EnlargeBagItem.lua" once     --扩展背包的物品
--#include "./NormalItem\UseItemCreateMonster.lua" once     --创建怪物

--#include "./NormalItem\UseExpBox.lua" once     --使用经验宝盒

	--#include "./NormalItem\VIPChargeItem.lua" once  --VIP道具物品
--#include "./NormalItem\LuckyRollAward.lua" once  --转轮 抽奖
--#include "./NormalItem\EnlargeStallGrid.lua" once  --增加摆摊格子
--#include "./NormalItem\CQUseItemFunc.lua" once          --传奇使用物品实现函数
--#include "./NormalItem\UseSkillBook.lua" once          --使用技能书学习技能
--#include "./NormalItem\UseExpJade.lua" once		--使用经验玉
--#include "./NormalItem\UseAlarmItem.lua" once		--使用报警器
--#include "./NormalItem\UseNewbieBook.lua" once
--#include "data\functions\guildOperate\UseGuildCityBack.lua" once		--使用行会回城卷
--#include "./NormalItem\ItemAcceptQuest.lua" once
--#include "./NormalItem\AddBuffEffectItem.lua" once --添加buff和特效的道具,比如烟花
--#include "data\functions\Activity\GrowRose\UseSeedItem.lua" once --玫瑰种植
--#include "data\functions\Systems\MarrySystem\UseFlowersItem.lua" once
--#include "data\functions\ActorEvent\NormalItem\UseVoucher.lua" once
--#include "./NormalItem\PetItem.lua" once --宠物相关
--#include "./NormalItem\UseEquipChange.lua" once	--使用装备装换道具

	--#include "UseBroadcast.lua" once --使用祝福符随机发送祝福语
	--#include "AddExpBufferItem.lua" once --经验丹

	--#include "data\functions\Tasks\FestivalTasks\PrayTree\UseBlessItem.lua" once --祝福卡

	--#include "AddXiuWeiBufferItem.lua" once --修为丹
	--#include "AddWineBufferItem.lua" once --擂台篝火酒
	
	--#include "UseNomalBox.lua" once --随机礼盒奖励物品
	--#include "UseMiZongDongReward.lua" once --迷踪洞奖励物品
	--#include "UseHuaShanLunJianReward.lua" once --华山论剑奖励物品
	--#include "./NormalItem\AddQuestItems.lua" once	--添加任务
	--#include "./NormalItem\ChuanSongItem.lua" once         --传送
	--#include "./NormalItem\SulfurItems.lua" once
	--#include "./NormalItem\ResurrectionItem.lua" once
	--#include "./NormalItem\PresentBagItem.lua" once
	--#include "./NormalItem\AddPhysicalItem.lua" once
	--#include "./NormalItem\FubenChallengeBookItem.lua" once
	--#include "./NormalItem\UseTaskThingInThePlace.lua" once
	--#include "./NormalItem\DeputyLearnItem.lua" once
	--#include "./NormalItem\RapidEffectItem.lua" once

	--#include "./NormalItem\AddBufferItem.lua" once
	--#include "./NormalItem\DelBufferItem.lua" once


	--#include "./NormalItem\CompositeKeyItems.lua" once

	--#include "./NormalItem\PowderPacketItems.lua" once

	--#include "./NormalItem\taskItemInclude.lua" once

	--#include "./NormalItem\XiuweiBox.lua" once     --使用修为宝盒


 	--#include "./NormalItem\GemSpriteStrenItem.lua" once -- 宝物灵力道具物品

 	--#include "./NormalItem\GemFuncItem.lua" once --宝物物品道具
 	--#include "./NormalItem\GemExpFunItem.lua" once --宝物经验物品道具
 	--#include "./NormalItem\GemUpLevelFunItem.lua" once --宝物升级物品道具

	

	--#include "./NormalItem\CallFlagMsger.lua" once

--#include "data\functions\Qfunctions.lua" once



EventCallDispatcher.handlerUseFunctionItems = function (sysarg, arg)
	if not arg then
		return false
	end 

	--物品ID和物品的指针
	local itemidx = arg[1]  --物品的ID
	local itemPtr = arg[2] --物品的指针
	local delType = arg[3]	--物品删除类型  如果为0则在脚本删除物品 1则扣除耐久(次数)
	local param = arg[4]
	local itemUserNum = arg[5]  --物品使用的数量
	local actorName = arg[6]
	if Item.getItemProperty(sysarg,itemPtr,Item.ipItemCount) <= 0 then
        System.trace("handlerUseFunctionItems error! actorid"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
        return false
    end
	local fnt = GlobalItemFn[itemidx]
	if fnt then
		if fnt.func( sysarg, itemidx, itemPtr, fnt.params, delType, itemUserNum,actorName,param) then
			return true
		else
			--print("item["..itemidx.."] call function return false.")
			return false
		end
	else
		print("item["..itemidx.."] no function.")
	end
	return false
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUseItem, EventCallDispatcher.handlerUseFunctionItems)