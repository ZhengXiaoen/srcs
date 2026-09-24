--#include "data\config\activity\HeFuconfig.lua" once

--预告
function CombineKingCityBossing(nMinute)
    local str =nMinute.."分钟后,携带极品装备的BOSS将现身<(c0xFFFF0000)热血王城>。<查看活动/@@showWin,197,2>"
    System.broadcastTipmsg(str,ttScreenCenter + ttChatWindow)
    if tonumber(nMinute) == 1 then
     
        System.addTimer("CombineKingCityBossingEx",1000 * 20,-1)
    end
end

function CombineKingCityBossingEx()
    --print("CombineKingCityBossingEx")
    local cfg = HeFuConfig.WangChengBoss
    local ex = "我也要参加<(x"..Fuben.getSceneNameById(cfg.sceneId)..":"..cfg.x..":"..cfg.y..":[传])>"
    local str = "携带极品装备的BOSS将现身<(c0xFFFF0000)热血王城>"..ex
     System.broadcastTipmsg(str,ttScreenCenter+ ttChatWindow)
end
--活动开始
function CombineKingCityBossStart()
    System.deleteTimer("CombineKingCityBossingEx")
    local cfg = HeFuConfig.WangChengBoss
    local sVar = System.getDyanmicVar()
    sVar.CombineKingCityBossing = 1 
    local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)
    sVar.combinekingboss = {}
    sVar.combinekingboss.hp = {}
    for i= 1,table.getn(cfg.hpNocite) do
         sVar.combinekingboss.hp[i] = 0
    end
    Fuben.clearMonster(hScene,cfg.bossId)
	local pMonster = Fuben.createMonster(hScene, cfg.bossId, cfg.x, cfg.y, 0)
    sVar.combinekingboss.handle = Actor.getHandle(pMonster) 
    System.broadcastTipmsg("王城BOSS已现身热血王城，请火速前往击杀。<查看活动/@@showWin,197,2>",ttScreenCenter+ ttChatWindow)
end
--活动倒计时
function CombineKingCityBossEnding()
   
    local cfg = HeFuConfig.WangChengBoss
    local playList = LuaHelp.getSceneActorListById( cfg.sceneId)
    for k, plyPtr in ipairs(playList or {}) do
       -- if Actor.getSceneId(plyPtr) == cfg.sceneId then
        	local pack = DataPack.allocPacket(plyPtr,139,233)
            DataPack.writeInt(pack,60) 
            DataPack.flush(pack)
          
       -- end
	end
end

--活动结束
function CombineKingCityBossEnd()
    local sVar = System.getDyanmicVar()
    sVar.CombineKingCityBossing = nil
     local cfg = HeFuConfig.WangChengBoss
     local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)
     Fuben.clearMonster(hScene,cfg.bossId)
    --local pMonsterPtr = Fuben.getMonsterPtrById(hScene,cfg.bossId)
   

end

function CrossServerClose()
    if System.isCrossServer() == false then return end
    local playerList = LuaHelp.getAllActorList() --获取所有的在线玩家的指针
	for idx, player in ipairs(playerList or {}) do
        Actor.killActor(player)
    end
    local sys = System.getStaticVar()
    sys.crossClose = 1
end

function CrossServerOpen()
    if System.isCrossServer() == false then return end
    local sys = System.getStaticVar()
    sys.crossClose = 0
end