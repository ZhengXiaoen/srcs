--lua script

--#include "data\config\item\itemEnhance\CQEquipEnhance.lua" once
--#include "data\functions\Activity\OpenTenDaysActivity\ItentifyTopic.lua" once

itEquipUpgrade = 1
itEquipStrong = 2
itEquipAuthenticate = 3
itEquipClearProp = 4

itEquipMoveInitAttr = 11
itEquipClearInitAttr = 12

bawEquipStrong	= 2	--装备强化时生产极品属性
bawEquipUpgrade = 3	--装备升级时生产极品属性

--鉴定属性
AuthValTab = {
	Item.ipItemForgeProperty1Value,
	Item.ipItemForgeProperty2Value,
	Item.ipItemForgeProperty3Value,
}


--#include "data\functions\Consume.lua" once --消耗
--#include "EquipUpgrade.lua" once			--装备升级
--#include "data\functions\EquipEnhance\EquipStrong.lua" once			--装备强化
--#include "EquipAuthenticate.lua" once		--装备鉴定
--#include "data\functions\EquipEnhance\EquipResetStrong.lua" once			--装备强化属性重置
--#include "data\functions\EquipEnhance\EquipBuyStrongCount.lua" once		--购买强化次数


--下发装备操作结果
function SendEquipOptResult( sysarg, itemGuid, optType, optResult)
	local netPack = DataPack.allocPacket(sysarg, 8, 8)
	DataPack.writeInt64(netPack, itemGuid)
	DataPack.writeByte(netPack, optType)
	DataPack.writeByte(netPack, optResult)
	DataPack.flush(netPack)
end



