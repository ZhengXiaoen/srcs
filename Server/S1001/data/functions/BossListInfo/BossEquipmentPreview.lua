--#include "data\config\monster\BossEquipmentPreviewCfg.lua"

LocalDT.AppendBossEquipmentPreview = function(text, monId)
	for _, id in ipairs(LocalDT.BossEquipmentPreview[monId] or {}) do
		local icon = string.format("<(iitem#%s#1)>", id)
		if not string.find(text, icon, 1, true) then text = text .. icon .. " " end
	end
	return text
end
