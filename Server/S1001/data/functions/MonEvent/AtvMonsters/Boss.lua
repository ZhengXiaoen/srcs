
--#include "data\functions\Activity\Boss\BossCommon.lua" once

MonDieDispatcher.BossDie = function (monster,sysarg,monId)
	OnBossDead( monster,sysarg,monId )
end


MonMobDispatcher.BossCreate = function ( monster, monId, sceneId, x,y )
	OnBossCreate(monster, monId, sceneId,x,y)
end

MonDieDispatcher.ActivityBossDie = function(monster,sysarg,monId)
	--local name = Actor.getName(sysarg)
	--local monsterName = Actor.getName(monster)
	--local noticeStr = string.format(Lang.ScriptTips.boss002, name, monsterName )
	--System.broadcastTipmsg(noticeStr, ttScreenCenter + ttChatWindow)
end

--×¢²áboss
for idx, bossTab in ipairs(BossConfig.Boss) do
	MonDieDispatcher.register(bossTab.entityId, MonDieDispatcher.BossDie)
	MonMobDispatcher.register(bossTab.entityId, MonMobDispatcher.BossCreate)
end

for idx, bossId in ipairs(ActivityBoss) do
	MonDieDispatcher.register(bossId, MonDieDispatcher.ActivityBossDie)
end