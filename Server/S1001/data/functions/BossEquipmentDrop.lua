--#include "data\config\monster\BossEquipmentDropCfg.lua" once

LocalDT.CreateBossEquipmentDrop = function(monster, killer, id, bind)
	local item = Item.createItem(id, 1, 0, 0, bind)
	if item == nil then
		System.trace("BossEquipmentDrop createItem failed: " .. id)
		return
	end
	if not Item.createDropItem(monster, item, LogIds.BossEquipmentDrop, "BossEquipmentDrop", nil) then
		Item.releaseItemPtr(item)
		System.trace("BossEquipmentDrop createDropItem failed: " .. id)
		return
	end
	local cfg = LocalDT.BossEquipmentDrop.broadcast[id]
	if cfg == nil or killer == nil then return end
	local notice = cfg.dropBroadcast == -1 or (cfg.dropBroadcast > 0 and System.getDaysSinceOpenServer() <= cfg.dropBroadcast)
	if not notice and not cfg.broadcast then return end
	local sceneName, x, y = Actor.getSceneName(monster)
	local itemName = Item.getItemLinkMsg(id, item)
	if notice then
		local msg = string.format("<(n%s)>在<(c0xFF00FF00)%s>击杀<(c0xFFFF0000)%s>掉落[%s]", Actor.getName(killer), sceneName, Actor.getName(monster), itemName)
		System.broadcastTipmsg(msg, ttChatWindow)
		if OnMonsterDropNotice then OnMonsterDropNotice(killer, monster, item, sceneName) end
	end
	if cfg.broadcast then
		local msg = string.format(Lang.ScriptTips.zf560, Actor.getName(monster), sceneName, itemName, x, y)
		System.broadcastTipmsg(msg, ttScreenCenter + ttChatWindow)
	end
end

LocalDT.RollBossEquipment = function(monster, killer, weights, rate, field)
	if System.getRandomNumber(10000) >= rate then return end
	local draw = System.getRandomNumber(1000000000) / 1000000000
	local selected = weights[#weights]
	for _, cfg in ipairs(weights) do
		draw = draw - cfg.weight
		if draw < 0 then selected = cfg; break end
	end
	local items = selected[field]
	LocalDT.CreateBossEquipmentDrop(monster, killer, items[System.getRandomNumber(#items) + 1], selected.bind)
end

LocalDT.DropBossEquipment = function(monster, killer, monId)
	local rules = LocalDT.BossEquipmentDrop
	if monster == nil or rules == nil then return end
	local entry = rules.monsters[monId]
	if entry == nil then return end
	local cfg = rules.profiles[entry.profile]
	-- 抽中旧武器衣服时终止该组，保留普通装备原概率。
	for _, group in ipairs(cfg.mixed) do
		for attempt = 1, #group do
			local row = group[System.getRandomNumber(#group) + 1]
			if row.propability > 0 and (row.propability == 1 or System.getRandomNumber(row.propability) == 0) then
				if not row.omit then LocalDT.CreateBossEquipmentDrop(monster, killer, row.id, row.bind) end
				break
			end
		end
	end
	if killer == nil then return end
	local player = killer
	if Actor.getEntityType(killer) ~= 0 then player = Actor.getMonsterOwner(killer) or killer end
	local job = Actor.getIntProperty(player, PROP_ACTOR_VOCATION)
	local weights = cfg.weights[job] or cfg.weights[1]
	LocalDT.RollBossEquipment(monster, player, weights, 300, "weapons")
	LocalDT.RollBossEquipment(monster, player, weights, 500, "clothes")
end
