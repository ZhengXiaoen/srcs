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

--当一个怪物被杀死的时候回调
function HandlerMonsterByKilled(monster, killer, monId, fubenId, sceneId, fuBenPtr)
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
