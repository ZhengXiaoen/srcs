--lua script

--#include "data\functions\guildOperate\GuildOnTimeFuc.lua"  once  

MonDieDispatcher.Mon115Die = function(monster,sysarg,monId)
	local monPosX, monPosY = Actor.getEntityPosition(monster, 0, 0)
	OnWallMonsterDie(monPosX,monPosY)
end

MonDieDispatcher.Mon116Die = function(monster,sysarg,monId)
	--local monPosX, monPosY = Actor.getEntityPosition(monster, 0, 0)
	--OnWallMonsterDie(monPosX,monPosY)
end

MonDieDispatcher.Mon261Die = function(monster,sysarg,monId)
	local monPosX, monPosY = Actor.getEntityPosition(monster, 0, 0)
	OnWallMonsterDie(monPosX,monPosY)
end

MonDieDispatcher.Mon114Die = function(monster,sysarg,monId)
	local monPosX, monPosY = Actor.getEntityPosition(monster, 0, 0)
	OnSbkGuardDie(monPosX,monPosY)
end

MonDieDispatcher.register(115, MonDieDispatcher.Mon115Die )
MonDieDispatcher.register(116, MonDieDispatcher.Mon116Die )
MonDieDispatcher.register(261, MonDieDispatcher.Mon261Die )
MonDieDispatcher.register(114, MonDieDispatcher.Mon114Die )
