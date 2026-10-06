--lua script
local LocalDT = LocalDT or {}

--这个文件是所有的怪物相关的脚本逻辑的总函数
--包括怪物的死亡，怪物的刷新处理的一些逻辑的入口在这里

--#include "LogIds.lua" once     --脚本日志ID定义
--#include "ActorTimerIds.lua" once     --玩家定时器ID定义
--#include "StaticData.lua" once     --静态数据
--#include "data\envir\FuBenTongGuan.lua" once		--副本通关条件的定义，这里包含是为了注册副本中出现的怪物的死亡事件
	--#include "data\envir\FubenBossSelect.lua" once		--爬塔副本怪

--#include "MonEvent\MDCDispatcherImplement.lua" once
--#include "MonEvent\MonsterMobDispatchImpl.lua" once 

--#include "data\functions\BaseDef\LuaEventId.lua" once
--#include "data\functions\LuaEventDispatcher.lua" once

--#include "data\functions\BackStageCmd.lua" once		--后台命令

--#include "MonEvent\FBMonsters\FBMonstersInclude.lua" once
--#include "MonEvent\AtvMonsters\AtvMonstersInclude.lua" once
--#include "MonEvent\QuestMonsters\QuestMonsterFunc.lua" once
--#include "data\config\quest\QuestMonster.lua" once
	----#include "data\functions\FuBenNpcFunc\jizhanshaolin" once
	----#include "data\functions\FuBenNpcFunc\padaTimeConfig" once
--#include "data\functions\player.lua" once -- 角色处理
--#include "data\config\monster\ZhuanShengAccessoryDropCfg.lua" once

LocalDT.DropZhuanShengAccessoryItem = function(monster, items, rate, mincount, maxcount)
	if not rate or System.getRandomNumber(100) >= rate then return end
	local itemId = items[math.random(1, #items)]
	local count = math.random(mincount, maxcount)
	local item = Item.createItem(itemId, count, 0, 0, 1)
	if item then
		Item.createDropItem(monster, item, LogIds.ZhuanShengAccessoryDrop, "ZhuanShengAccessory", nil)
	end
end

LocalDT.DropZhuanShengAccessory = function(monster, monId)
	local cfg = ZhuanShengAccessoryDropCfg.tiers[Actor.getSceneId(monster)]
	if not cfg or (monId ~= cfg.monsters[1] and monId ~= cfg.monsters[2] and monId ~= cfg.monsters[3]) then return end
	LocalDT.DropZhuanShengAccessoryItem(monster, ZhuanShengAccessoryDropCfg.items, cfg.rate, cfg.mincount, cfg.maxcount)
	LocalDT.DropZhuanShengAccessoryItem(monster, ZhuanShengAccessoryDropCfg.finishedItems, cfg.finishedRate, 1, 1)
end

function CheckAndSetIsDropItemWhenMonsterKilled(monster, killer, monId)
	local isDropOneTimes = OneTimesDropMonsters[monId]
	if isDropOneTimes == nil then return true end
	
	--该怪只在第一次击杀时掉落
	--if killer == nil then return true end
	--不是玩家
	if Actor.getEntityType(killer) ~= 0 then return true end
	
	local svar = Actor.getStaticVar(killer);
	if svar.DropOneTimes == nil then
		svar.DropOneTimes = {}
		svar.DropOneTimes[monId] = true
		return true
	elseif svar.DropOneTimes[monId] == nil then
		svar.DropOneTimes[monId] = true
		return true	
	end
	
	return false
end

--#include "data\config\monster\BossMaterialDropCfg.lua" once

LocalDT.BroadcastBossMaterial = function(monster, killer, itemId, count)
	local cfg = LocalDT.BossMaterialBroadcast[itemId]
	if cfg == nil then return end
	local dropNotice = cfg.dropBroadcast == -1 or (cfg.dropBroadcast > 0 and System.getDaysSinceOpenServer() <= cfg.dropBroadcast)
	if not dropNotice and not cfg.broadcast then return end
	local sceneName, x, y = Actor.getSceneName(monster)
	local itemName = Item.getItemLinkMsg(itemId) .. " x" .. count
	if dropNotice then
		local msg = string.format("<(n%s)>在<(c0xFF00FF00)%s>击杀<(c0xFFFF0000)%s>掉落[%s]", Actor.getName(killer), sceneName, Actor.getName(monster), itemName)
		System.broadcastTipmsg(msg, ttChatWindow)
	end
	if cfg.broadcast then
		local msg = string.format(Lang.ScriptTips.zf560, Actor.getName(monster), sceneName, itemName, x, y)
		System.broadcastTipmsg(msg, ttScreenCenter + ttChatWindow)
	end
end

-- 使用与真荒古灵力丹相同的 createItem + createDropItem 接口，按数量创建一组材料。
LocalDT.DropBossMaterials = function(monster, killer, monId)
	local dropIds = LocalDT.BossMaterialDropMonsters[monId]
	if monster == nil or killer == nil or dropIds == nil then return end
	local totals = {}
	local order = {}
	for _, dropId in ipairs(dropIds) do
		for _, cfg in ipairs(LocalDT.BossMaterialDrops[dropId]) do
			-- propability 表示几分之一：1 为必掉，0 为禁用，各条记录独立判定。
			if cfg.propability > 0 and (cfg.propability == 1 or System.getRandomNumber(cfg.propability) == 0) then
				-- 引擎优先使用正数 count；仅 count <= 0 时使用 mincount/maxcount。
				local count = cfg.count
				if count <= 0 and cfg.mincount ~= nil and cfg.maxcount ~= nil and cfg.mincount >= 0 and cfg.maxcount > 0 and cfg.maxcount >= cfg.mincount then
					count = cfg.mincount + System.getRandomNumber(cfg.maxcount - cfg.mincount + 1)
				end
				if count > 0 then
					local key = cfg.id .. ":" .. cfg.bind
					if totals[key] == nil then
						totals[key] = {id=cfg.id, bind=cfg.bind, count=0}
						table.insert(order, key)
					end
					totals[key].count = totals[key].count + count
				end
			end
		end
	end
	for _, key in ipairs(order) do
		local cfg = totals[key]
		local maxStack = LocalDT.BossMaterialMaxStack[cfg.id]
		while cfg.count > 0 do
			local count = math.min(cfg.count, maxStack)
			local item = Item.createItem(cfg.id, count, 0, 0, cfg.bind)
			if item ~= nil then
				if not Item.createDropItem(monster, item, LogIds.BossMaterialDrop, "BossMaterialDrop", nil) then
					Item.releaseItemPtr(item)
					System.trace("BossMaterialDrop createDropItem failed: " .. monId .. ":" .. cfg.id)
				else
					LocalDT.BroadcastBossMaterial(monster, killer, cfg.id, count)
				end
			else
				System.trace("BossMaterialDrop createItem failed: " .. monId .. ":" .. cfg.id)
			end
			cfg.count = cfg.count - count
		end
	end
end

--当一个怪物被杀死的时候回调
function HandlerMonsterByKilled(monster, killer, monId, fubenId, sceneId, fuBenPtr)
	if killer ~= nil then LocalDT.DropZhuanShengAccessory(monster, monId) end
	-- 真荒古之地专属掉落，宠物或战将击杀也会触发
	if killer ~= nil and monId == 635 and Actor.getSceneId(monster) == 286 then
		Item.createDropItem(monster, Item.createItem(552, math.random(3, 5), 0, 0, 0), LogIds.HuangGuBossDrop, "HuangGuBoss", nil)
		if System.getRandomNumber(100) < 30 then
			Item.createDropItem(monster, Item.createItem(553, math.random(1, 2), 0, 0, 0), LogIds.HuangGuBossDrop, "HuangGuBoss", nil)
		end
	end
  -- 处理怪物被杀
	OnMonsterByKilled(monster, killer, monId, fubenId, sceneId, fuBenPtr)

	-- 副本通关判断
	MonDieDispatcher.CommonDieFunc(monster, killer, monId)
	
	-- 返回值： 杀死该怪物后是否要掉落物品(true:掉落；false:不掉)
	local isDropItem = CheckAndSetIsDropItemWhenMonsterKilled(monster, killer, monId)
	if isDropItem then
		LocalDT.DropBossMaterials(monster, killer, monId)
	end
	return isDropItem
end

function HandlerMonsterByTeamMenber(killer,monId)
	OnMonsterByTeammeta(killer,monId)
end

--当一个怪物被杀死的时候（bDeathTriggerScript配置为true时才会回调）
function OnMonsterKilled(monster, killer, monId)
  MonDieDispatcher.dispatch(monster, killer, monId)  
end


--当一个怪物刷新出来的时候调用(StdMonster.txt 该怪物需要配置属性bMobTriggerScript)
function OnMonsterMob(monsterPtr, monsterId, scenePtr, sceneId, x, y)
   OnRefreshMonsterEvent(monsterPtr, monsterId, scenePtr, sceneId, x, y)
end

-- 当 refreshXX.lua脚本的刷怪配置项中的 entityid == 0 时不刷怪, 只是用于通知下脚本, 比如要广播一下第几波怪正在到来等, curCount 从 1 开始
function OnRefreshMonsterProgress(scenePtr, sceneId, fubenPtr, fubenId, curCount, progress, mapx, mapy, range)
   OnRefreshMonsterProgressEvent(scenePtr, sceneId, fubenPtr, fubenId, curCount, progress, mapx, mapy, range)
end

--屏蔽，因为要判断杀死所以怪的情况，所以中HandlerMonsterByKilled()中已经调用了
--[[
--注册那些以杀怪为目的的副本里的出现的怪物,并执行通用的怪物死亡接口
for k,v in pairs(TongGuanCondition) do
	if v ~= nil then
		for j = 1, #v do
			if v[j].type == 1 then
				MonDieDispatcher.register(v[j].monsterid,MonDieDispatcher.CommonDieFunc)
			end
		end
	end
end
--]]


for k,v in pairs(MonsterForQuest) do
	if v ~= nil then
		for j = 1, #v do
			MonDieDispatcher.register(k,MonDieDispatcher.QuestDieFunc)
		end
	end
end

for monsId, questList in pairs(ShareHitMonsterForQuest) do
	for idx, questId in ipairs(questList) do
		MonDieDispatcher.register( monsId,MonDieDispatcher.ShareHitQuestDieFunc)
	end
end

--[[
for k,v in pairs(padaguankaRate) do
  if v ~= nil then
    for j = 1, #v do
      MonDieDispatcher.register(k,jizhanshaolin.MonsterDie)
    end
  end  
end
]]

function OnMonsterByKilledAddUpExp(sysarg, addUpExp)	
	local fubenid = Actor.getFubenId(sysarg)
	
	if fubenid == fuben_emoling_cfg.fubenid then
		emoling_OnMonsterByKilledAddUpExp(sysarg, fubenid, addUpExp)
	end
end
