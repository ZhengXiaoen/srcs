--lua script
 
--#include "..\EquipEnhance\EnhanceFunctioins.lua" once --装备操作通用
 
--#include "..\EquipEnhance\CQEquipEnhance.lua" once 	--装备升级 强化 鉴定 清洗	重置
--#include "..\EquipEnhance\WingComposite.lua" once 	--翅膀合成
--#include "..\EquipEnhance\EquipBreak.lua" once 		--装备分解
--#include "..\EquipEnhance\ItemComposite.lua" once 	--装备分解
--#include "..\EquipEnhance\DiamondComposite.lua" once 	--宝石合成
--#include "..\EquipEnhance\MoveInitAttr.lua" once		--极品属性
--#include "..\EquipEnhance\DiamondChg.lua" once 		--宝石转换
--#include "..\EquipEnhance\WeaponExtendChg.lua" once 	--幻武转移
--#include "..\EquipEnhance\MagicItemComposite.lua" once 	--法宝合成
--#include "..\EquipEnhance\MagicItemChg.lua" once 		--法宝幻化
--#include "data\functions\EquipEnhance\EquipAttrMove.lua" once 		--转移装备属性
--#include "data\functions\EquipEnhance\CircleForge.lua" once 	--转生装备锻造
--#include "data\functions\EquipEnhance\EquipAuthenticate.lua" once 	--转生装备鉴定（新）
--#include "data\functions\EquipEnhance\EquipBloodRefining.lua" once	--装备血炼
--#include "data\functions\EquipEnhance\BloodDecom.lua" once 			--血炼分解
--#include "data\functions\EquipEnhance\NecklaceLuck.lua" once 			--装备幸运
--#include "data\functions\EquipEnhance\NecklaceLuckTrans.lua" once 	--装备幸运转移
--#include "data\functions\EquipEnhance\EquipSuperAttr.lua" once 	--装备幸运转移
--#include "data\functions\EquipEnhance\GodEquip.lua" once 	--神装
--#include "data\functions\EquipEnhance\LightEquip.lua" once 	--圣装
--#include "data\functions\EquipEnhance\Ornament.lua" once 	--饰品锤炼


--操作处理函数表
EnhanceTable = {
	EquipUpGrade,		--1 装备升级
	EquipStrong,		--2 装备强化
	NewEquipAuthenticate,	--3 装备鉴定
	EquipWashAuth,		--4 鉴定清洗
	OnWingComposite,	--5 翅膀合成
	OnCircleForge,		--6 转生装备锻造
	OnEquipBreak,		--7 装备分解
	OnItemComposite,	--8 道具合成
	OnDiamondComposite,	--9 宝石合成
	OnDiamondChg,		--10 宝石转换
	OnMoveInitAttr,		--11 极品属性转移
	OnClearInitAttr,	--12 清洗极品属性
	OnWeaponExtendChg,	--13 武器扩展 幻武转移
	OnMagicItemComposite,	--14 法宝合成
	OnMagicItemChg,			--15 法宝幻化
	CircleEquipUpgrade,	--16,转生后装备升级
	EquipResetStrong, --17,重置装备强化属性
	MoveEquipAttr, --18,转移装备属性
	EquipBuyStrongCount, --19,购买强化次数
	EquipBloodRefining,		--20 装备血炼
	EquipBloodDecom,		--21 血炼分解
	EquipNecklaceLuck,     --22项链幸运
	EquipNecklaceLuckTrans,  --23幸运转移
	EquipForgingSuperAttr,	--24极品属性
	GodEquip,				--25神装系统
	ResolvingGodEquip,		--26神装拆解
	LightEquip,				--27
	ResolvingLightEquip,	--28
	OrnamentUpgrade,		--29饰品锤炼
}

--获取消耗函数表
ConsumTable = {
	EquipGradeConsume,			--1 装备升级
	EquipStrongConsume,			--2 装备强化
	NewEquipAuthenticateConsume,	--3 装备鉴定
	nil,						--4 鉴定清洗
	GetWingCompositeConsumes,	--5 翅膀合成
	GetCircleForgeConsumes,		--6 转生装备锻造
	GetEquipBreakConsumes,		--7 装备分解
	GetItemCompositeConsumes,	--8 道具合成
	GetDiamondCompositeConsumes,--9 宝石合成
	GetConsumptionDiamondChg,	--10 宝石转换
	OnMoveInitAttrConsume,		--11 极品属性转移
	nil,						--12 清洗极品属性
	GetWeaponExtendChgConsumes,	--13 武器扩展 幻武转移
	GetMagicItemCompositeConsumes,	--14 法宝合成
	GetMagicItemChgConsumes,		--15 法宝幻化
	CircleEquipUpgradeConsumes,	--16,转生后装备升级
	EquipResetStrongConsume, --17,重置装备强化属性
	MoveEquipAttrConsume, --18,转移装备属性
	EquipBuyStrongCountConsume, --19,购买强化次数
	EquipBloodRefinConsume,		--20 装备血炼
	EquipDecomCfgConsume,		--21,血炼分解
	EquipLuckCfgConsume,      --22项链幸运
	EquipLuckTransConsume,    --23幸运转移
	EquipForgingSuperAttrConsume, --24锻造极品属性
	GodEquipConsume,			--25神装合成
	ResolvingGodEquipConsume,	--26神装拆解
	LightEquipConsume,			--27圣装合成
	ResolvingLightEquipConsume,  --28圣装拆解
}

AssistItemTable = {
	--{func = getPrayerSticksOdds}, --1 获取强化幸运符的提升比例
}

--玩家开始处理装备,  args = {物品指针数量,[指针1],[指针2],..物品处理类型,[参数1]，[参数2],...}
EventCallDispatcher.handlerEquipEnhance = function ( sysarg, args )
	if not args then
		return false
	end
	
	local ptrCount = args[1]
	local enhanceType = args[ptrCount + 2]
	if Actor.isDealing(sysarg) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.mt00073, ttFlyTip)
		return
	end
	
	--print("ptrCount "..ptrCount, "EnhanceTable["..enhanceType.."]");
	if EnhanceTable[enhanceType] then
		if Actor.hasState(sysarg, esStateStall) then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.stall001, ttScreenCenter)
			return
		end
		local result = EnhanceTable[enhanceType]( sysarg, args )
		if result then
			Actor.triggerQuestEvent(sysarg, 37, enhanceType, 1)
		end
		return result
	end
end


--获取装备处理的消耗, args = {物品指针数量,[指针1],[指针2],..物品处理类型,[参数1]，[参数2],...}
EventCallDispatcher.handlerGetEnhanceConsumption = function ( sysarg, args )
	if( args == nil ) then
		return false
	end

	local ptrCount = args[1]
	local enhanceConsumType = args[ptrCount + 2]

	if ConsumTable[enhanceConsumType] then
		ConsumTable[enhanceConsumType]( sysarg, args )
	end
end


--获取物品处理的配置[获取的ID]
EventCallDispatcher.handlerGetAssistItemConfig = function ( sysarg, args )
	if( args == nil ) then
		return false
	end
	local assistType = args[1]
	AssistItemTable[assistType].func( sysarg, args )
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeItemProcess, EventCallDispatcher.handlerEquipEnhance)    
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGetItemProcessConsume, EventCallDispatcher.handlerGetEnhanceConsumption)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGetItemProcessConfig, EventCallDispatcher.handlerGetAssistItemConfig)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGetCanUpGrdConfig, EventCallDispatcher.handlerGetUpgradeConfig)