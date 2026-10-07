-- 此配置也会在 AdvanceMonsterEquipCfg 的临时 LocalDT 中加载，必须重新加载到当前 LocalDT。
--#include "data\config\monster\BossEquipmentPreviewCfg.lua"
--#include "data\config\monster\WildBossDropPreviewCfg.lua" once

LocalDT.BuildWildBossDropPreview = function(sysarg, args, monId)
	local cfg
	if monId then
		cfg = LocalDT.WildBossDropPreview.monsters[tonumber(monId)]
	else
		cfg = LocalDT.WildBossDropPreview.maps[tonumber(args[1]) .. ":" .. tonumber(args[2])]
	end
	if not cfg then return "" end
	local sex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)
	local text = ""
	for _, id in ipairs(cfg.equipment[sex == 1 and 2 or 1]) do
		text = text .. string.format("<(iitem#%s#1)> ", id)
	end
	text = text .. "\\        "
	for _, id in ipairs(cfg.special) do
		text = text .. string.format("<(iitem#%s#1)> ", id)
	end
	return text
end
